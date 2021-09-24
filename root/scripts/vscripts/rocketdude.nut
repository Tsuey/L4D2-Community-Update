//****************************************************************************************
//																						//
//									rocketDude.nut (mainfile)							//
//																						//
//****************************************************************************************

Msg("Activating RocketDude By ReneTM \n")

::rocketdude_version	<- "v1.7.7 build: 17:07:07 Feb 07 2021"
::mapName				<- Director.GetMapName().tolower()
::survivorSet			<- Director.GetSurvivorSet()
local grenadeData = {}




// Different scripts 2 include
// ----------------------------------------------------------------------------------------------------------------------------

IncludeScript("rocketdude/rd_debug")
IncludeScript("rocketdude/rd_utils")
IncludeScript("rocketdude/rd_melee_getter")
IncludeScript("rocketdude/rd_director")
IncludeScript("rocketdude/rd_damage_controll")
IncludeScript("rocketdude/rd_detonation_analysis")
IncludeScript("rocketdude/rd_meds")
IncludeScript("rocketdude/rd_events")
IncludeScript("rocketdude/rd_last_chance")
IncludeScript("rocketdude/rd_decals")
IncludeScript("rocketdude/rd_map_specifics")
IncludeScript("rocketdude/rd_custom_map_support")
IncludeScript("rocketdude/rd_saferoom_timer")
IncludeScript("rocketdude/rd_speedrun_mode")
IncludeScript("rocketdude/rd_mode_description")
IncludeScript("rocketdude/rd_hud_controller")




// Precache models and sounds
// ----------------------------------------------------------------------------------------------------------------------------

precacheSurvivorModels()

precacheRocketDudeModels()

precacheSounds()




// Creates a bullet time when the previous one is atleast 32 seconds ago.
// When this condition is met bullet time will occur with a probability of 3% 
// ----------------------------------------------------------------------------------------------------------------------------

local lastBulletTime = Time()
local lastDiceTime = Time()

::GLOBALS <-
{
	allowBulletTime = false
}

function bulletTime(){
	if(GLOBALS.allowBulletTime){
		if(Time() > lastBulletTime + 32){
			if(Time() >= lastDiceTime + 2){
				if(rollDice(3)){
					lastBulletTime = Time()
					DoEntFire( "!self", "Start", "", 0, timeScaler, timeScaler )
					DoEntFire( "!self", "Stop", "", 1, timeScaler, timeScaler )
				}
				lastDiceTime = Time()
			}
		}
	}
}

function saveGlobals(){
	SaveTable("GLOBAL_SAVINGS", GLOBALS)
}

function restoreGlobals(){
	RestoreTable("GLOBAL_SAVINGS", GLOBALS)
}




// When an instance of a grenade launcher projectile stops existing "doRocketJump" gets called
// ----------------------------------------------------------------------------------------------------------------------------

function grenadeExplodeEvent( impact ){
	foreach( player in getSurvivorsInRange( impact ) ){
		if(player.IsValid()){
			doRocketJump(impact, player)
		}
	}
}




// Returns an array of players within the blast radius
// ----------------------------------------------------------------------------------------------------------------------------

function getSurvivorsInRange(pos){
	local player = null
	while(player = Entities.FindByClassnameWithin(player, "player", pos, 160)){
		if(!player.IsDead()){
			if(!player.IsIncapacitated()){
				yield player
			}
		}
	}
}




// Compares current position of a projectile with the previous one. Force it to explode when it got stuck on prop_dynamic
// ----------------------------------------------------------------------------------------------------------------------------

function dynamicPropCheck(grenade){
	if(grenade in grenadeData){
		if(grenade.IsValid()){
			if((grenadeData[grenade] - grenade.GetOrigin()).Length() < 1){
				NetProps.SetPropInt(grenade, "m_takedamage", 1)
				grenade.TakeDamage(1337, 2, null)
			}	
		}
	}
}




// Get's fired 'OnGameplayStart' (usually after every single loadingscreen)
// ----------------------------------------------------------------------------------------------------------------------------

function OnGameplayStart(){
	
	/* CREATE MUSHROOMS */
	if(IsValveMap()){
		spawnMushrooms()
	}
	
	/* SPAWN MAP SIDED MUSHROOMS */
	spawnMapSidedMushrooms()
	
	/* SET PLAYERS MAX HEALTH AND CURRENT HEALTH TO 200 */
	setPlayersHealth()
	
	/* GENERAL SETTINGS */
	checkCvars()

	/* CREATE BULLET TIME */
	createBulletTimerEntity()

	/* KILL ALL DEATH CAMS */
	removeDeathFallCameras()
	
	/* CREATE THINK TIMER */
	createThinkTimer()

	/* RESTORE SETTINGS LIKE BULLET TIME 1/0 */
	restoreGlobals()
}

::fixEntitiesRemoved <- false

::killFixEntities <- function(){
	if(!fixEntitiesRemoved){
		EntFire( "community_update*", "Kill" )
		EntFire( "env_player_blocker", "Kill" )
		EntFire( "rene_relay", "Trigger" )
		fixEntitiesRemoved = true
	}
}




// Called for every player within the detonation radius, it will launch the player in the calculated direction
// ----------------------------------------------------------------------------------------------------------------------------

function doRocketJump(detonationPos, player){

	local hitSurface = getSurfaceValue(detonationPos, player)
	local ignoreDistance = 160
	local playerEyes = player.EyePosition()
	local finalVector = null
	
	local detonationDistance = (detonationPos - playerEyes).Length()
	local playerIsMidAir = NetProps.GetPropInt(player, "m_hGroundEntity") & 1
	local midAirFactor = 0
	local boostdirection = (detonationPos - playerEyes) * - 1
	local eyeToSurface = ((detonationPos - playerEyes).Length())
	local distanceFactor = (160 - eyeToSurface) / 10
	
	// WALL OR FLOOR ?
	if(hitSurface == "WALL"){
		distanceFactor *= 1.5
	}else{
		distanceFactor *= 1.4
	}
	
	if(detonationDistance <= ignoreDistance){
		if(playerIsMidAir){
			midAirFactor = 1
			finalVector = (player.GetVelocity() + boostdirection * midAirFactor * distanceFactor) 
		}else{
			midAirFactor = 0.5
			finalVector = (player.GetVelocity() + boostdirection * midAirFactor * distanceFactor)
		}
		player.SetVelocity(finalVector)
	}
}




// 1. Save current origin of projectiles
// 2. Check if projectile is stuck to prop_dynamic
// 3. Projectiles from bots are ignored ( just in case )
// 4. If the player enabled auto bhop ( by using green mushroom ) use another projectile model and set it to glowing
// 5. Get rockets which travel in a straight line
// 6. Check for invalid rockets and fire grenadeExplodeEvent
// ----------------------------------------------------------------------------------------------------------------------------

local grenadeColor = GetColorInt(Vector(64,64,64))
local grenadeGlowColor = GetColorInt(Vector(255,16,16))

function ProjectileGenerator(){
	local proj = null
	while(proj = Entities.FindByClassname(proj, "grenade_launcher_projectile")){
		yield proj
	}
}

function GrenadeListener(){
	local ent = null
	foreach(ent in ProjectileGenerator()){
		dynamicPropCheck(ent)
		if(!IsPlayerABot(NetProps.GetPropEntity(ent, "m_hThrower"))){
			grenadeData[ent] <- ent.GetOrigin()
		}
	
		local scope = GetValidatedScriptScope(ent)
	
		// Projectile model and color
		if(!("modelChanged" in scope)){
			if(NetProps.GetPropEntity(ent, "m_hThrower") in bunnyPlayers){
				ent.SetModel("models/w_models/weapons/w_rd_grenade_scale_x4_burn.mdl")
			}else{
				ent.SetModel("models/w_models/weapons/w_rd_grenade_scale_x4.mdl")
			}
			NetProps.SetPropInt(ent, "m_clrRender", grenadeColor)
			scope["modelChanged"] <- true
		}

		if(!("creationTimestamp" in scope)){
			scope["creationTimestamp"] <- Time()
		}
	
		// Projectile Glow
		if(Time() > scope["creationTimestamp"] + 0.12){
			if(!("glowEnabled" in scope)){
				if(NetProps.GetPropEntity(ent, "m_hThrower") in bunnyPlayers){
					NetProps.SetPropInt(ent, "m_Glow.m_glowColorOverride", grenadeGlowColor)
					NetProps.SetPropInt(ent, "m_Glow.m_nGlowRangeMin", 32)
					NetProps.SetPropInt(ent, "m_Glow.m_nGlowRange", 8192)
					NetProps.SetPropInt(ent, "m_Glow.m_iGlowType", 3)
					NetProps.SetPropInt(ent, "m_Glow.m_bFlashing", 1)
					scope["glowEnabled"] <- true
				}
			}
		}
		
		// Let rockets travel in a straight line like in TF2
		// Another method would be to change the ent´s gravity.
		// But this would result in reflecting projectiles
		// NetProps.SetPropFloat(nade, "m_flGravity", 0.00000001)
		
		if(!("first_dir_vec" in scope)){
			scope["first_dir_vec"] <- ent.GetVelocity()
			ent.SetVelocity(scope["first_dir_vec"])
		}else{
			ent.SetVelocity(scope["first_dir_vec"])
		}
	}

	// Check if saved instances are still valid. Fire "grenadeExplodeEvent" when this is not the case anymore 
	foreach(grenade, origin in grenadeData){
		if(!grenade.IsValid()){
			grenadeExplodeEvent(origin)
			grenadeData.rawdelete(grenade)
		}
	}
}




// Disable player´s ledge hang, set his max health to 200 and disable fall damage crack
// ----------------------------------------------------------------------------------------------------------------------------

local PlayerSettingsCheckTime = Time()
function PlayerSettings(){
	if(Time() > PlayerSettingsCheckTime + 4){
		foreach(player in GetSurvivors()){
			DoEntFire("!self", "DisableLedgeHang", "", 0.0, player, player)
			DoEntFire("!self", "ignorefalldamagewithoutreset", "99999", 0.0, player, player)
			//
			if(NetProps.GetPropInt(player, "m_iMaxHealth") != 200){
				NetProps.SetPropInt(player, "m_iMaxHealth", 200)
			}
			PlayerSettingsCheckTime = Time()
		}
	}
}


function setPlayersHealth(){
	foreach(player in GetSurvivors()){
		NetProps.SetPropInt(player, "m_iMaxHealth", 200)
		NetProps.SetPropInt(player, "m_iHealth", 200)
	}
}




// While the player´s primary and secondary weapon still have infinite ammo we want to remove used items from player inventory
// Since players are able to receive throwables from mushrooms we need to check if any survivor is standing right on a mushroom
// ----------------------------------------------------------------------------------------------------------------------------

function projectileListener(){
	local projectiles = [ "vomitjar_projectile", "molotov_projectile", "pipe_bomb_projectile" ]
	foreach(projectile in projectiles){
		local throwable = null
		while(throwable = Entities.FindByClassname(throwable, projectile)){
			if(throwable.IsValid()){
				local scope = GetValidatedScriptScope(throwable)
				if(!("inv_edited" in scope)){
					local invTable = {}
					local player = NetProps.GetPropEntity(throwable, "m_hThrower")
					// Special case for c4m3_sugarmill_b ( mapsided projectiles which destroys stuff )
					if(player == null || player.GetClassname() == "pipe_bomb_projectile"){
						return
					}
					GetInvTable(player, invTable)
					if("slot2" in invTable){
						invTable.slot2.Kill()
						scope["inv_edited"] <- true
					}

					foreach(trigger in medkit_triggers){
						DoEntFire("!self", "TouchTest", "", 0.03, trigger, trigger)
					}
				}
			}
		}
	}
}




// Check if mushrooms can be reactivated
// ----------------------------------------------------------------------------------------------------------------------------

function updateMushroomTrigger(){
	foreach(trigger in medkit_triggers){
		
		local scope = GetValidatedScriptScope(trigger)

		if(Time() >= scope.usetime + scope.restoreTime){
			if(scope.usable == false){
				scope.usetime = Time() - scope.restoreTime
				setMedVisibility(1, scope.model)
				scope.usable = true
				DoEntFire("!self", "TouchTest", "", 0, trigger, trigger)
			}
		}
	}
}




// Hold space for auto-bhop ( if player used bhop mushroom )
// ----------------------------------------------------------------------------------------------------------------------------

::bunnyPlayers <- {}

function autobhop(){
	foreach(player,ent in bunnyPlayers){
		if(ent.IsValid()){
			if(!(NetProps.GetPropInt(ent, "m_fFlags") & 1) && NetProps.GetPropInt(ent, "movetype") == 2){
				if(ent.GetButtonMask() & 2){
					ent.OverrideFriction(0.033, 0)
				}
				NetProps.SetPropInt(ent, "m_afButtonDisabled", NetProps.GetPropInt(ent, "m_afButtonDisabled") | 2)
			}else{
				NetProps.SetPropInt(ent, "m_afButtonDisabled", NetProps.GetPropInt(ent, "m_afButtonDisabled") & ~2)
			}
		}else{
			bunnyPlayers.rawdelete(player)
		}
	}
}








// Get's fired every tick from a timer
// ----------------------------------------------------------------------------------------------------------------------------

function Think(){
	checkCvars()
	GrenadeListener()
	PlayerSettings()
	projectileListener()
	updateMushroomTrigger()
	autobhop()
	PlayerFunctions()
	lastChanceCountDown()
	tankrockListener()
	safeRoomTimer()
}

	


