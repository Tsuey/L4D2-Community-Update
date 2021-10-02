//****************************************************************************************
//																						//
//									rd_map_specifics.nut								//
//																						//
//****************************************************************************************




// Some maps require minor adjustments to improve gameplay. 
// ----------------------------------------------------------------------------------------------------------------------------

::mapSpecifics <- function(){
	switch(mapName){
		case "c1m1_hotel"				:	rd_specifics_c1m1();	break
		case "c1m2_streets"				:	rd_specifics_c1m2();	break
		case "c1m3_mall"				:	rd_specifics_c1m3();	break
		case "c5m5_bridge"				:	rd_specifics_c5m5();	break
		case "c7m3_port"				: 	rd_specifics_c7m3();	break
		case "c8m4_interior"			:	rd_specifics_c8m4();	break
		case "c8m5_rooftop"				:	rd_specifics_c8m5();	break
		case "c13m4_cutthroatcreek"		:	rd_specifics_c13m4();	break
		case "c14m1_junkyard"			:	rd_specifics_c14m1();	break
		case "c14m2_lighthouse"			:	rd_specifics_c14m2();	break
		default							:							break
	}
}




// Since we dont have any fall damage at all we should not stop players from just dropping down the hotel
// ----------------------------------------------------------------------------------------------------------------------------

::rd_specifics_c1m1 <- function(){
	local deathTriggers =
	[
		Vector(3200.000,5312.000,1648.000),
		Vector(2944.000,5888.000,1648.000),
		Vector(2936.000,6932.000,1648.000),
		Vector(1516.800,8000.000,1520.000),
		Vector(632.000,6944.000,1648.000),
		Vector(1600.000,4608.000,1648.000),
		Vector(0.000,5632.000,1648.000)
	]
	foreach(triggerPos in deathTriggers){
		local ent = null
		if(ent = Entities.FindByClassnameNearest( "trigger_hurt", triggerPos, 4 )){
			ent.Kill()
		}
	}
}




// Force start of parish finale
// ----------------------------------------------------------------------------------------------------------------------------

::rd_specifics_c5m5 <- function (){
	local ent = null
	if(ent = Entities.FindByClassname(null, "player")){
		DoEntFire( "radio_fake_button", "use", "", 1, ent, ent)
		DoEntFire( "finale", "use", "", 8, ent, ent)
		DoEntFire( "relay_init_heli", "Trigger", "", 12, ent, ent)
		DoEntFire( "relay_start_heli", "Trigger", "", 16, ent, ent)
	}
}




// Remove liftshaft_portal3_brush and rooftop_opening_clip
// ----------------------------------------------------------------------------------------------------------------------------

::rd_specifics_c8m5 <- function(){
	local ent = null
	if(ent = Entities.FindByClassnameNearest( "func_brush", Vector(7248.000000, 9168.000000, 7144.000000), 4)){
		ent.Kill()
	}
}




// Force start of cold stream finale
// ----------------------------------------------------------------------------------------------------------------------------

::rd_specifics_c13m4 <- function (){
	local ent = null
	if(ent = Entities.FindByClassname(null, "player")){
		DoEntFire( "startbldg_door_button", "use", "", 1, ent, ent)
		DoEntFire( "finale", "use", "", 12, ent, ent)
	}
}




// Change damage type of trigger_hurt ( water area in front of the end saferoom )
// ----------------------------------------------------------------------------------------------------------------------------

::rd_specifics_c14m1 <- function(){
	local ent = null
	if(ent = Entities.FindByClassnameNearest( "trigger_hurt_ghost", Vector(-4580,9352,-732), 4)){
		TriggerSetDamageType(ent, damageTypes.GENERIC)
	}
}




// Kill trigger which re-enables the ledgehang
// Change damage type of trigger_hurt ( water of rescue vehicle zone )
// ----------------------------------------------------------------------------------------------------------------------------

::rd_specifics_c14m2 <- function(){
	local ent = null
	
	if(ent = Entities.FindByClassnameNearest( "trigger_multiple", Vector(-4352,3928,1096), 4)){
		ent.Kill()
	}
	if(ent = Entities.FindByClassnameNearest( "trigger_hurt", Vector(-4608,7168,-256), 4)){
		TriggerSetDamageType(ent, damageTypes.GENERIC)
	}
	if(ent = Entities.FindByClassnameNearest("func_brush", Vector(275.000000, 930.000000, 1360.000000), 4)){
		ent.Kill()
	}
}




// Re-execute the elevator fix once
// ----------------------------------------------------------------------------------------------------------------------------


::rd_specifics_c8m4 <- function(){
	EntFire( "worldspawn", "RunScriptFile", "c8m4_elevatorfix" )
}




// Utils to manipulate entities
// ----------------------------------------------------------------------------------------------------------------------------

::TriggerSetDamageType <- function(ent, type){
	if(ent.GetClassname() == "trigger_hurt" || ent.GetClassname() == "trigger_hurt_ghost"){
		NetProps.SetPropInt(ent, "m_bitsDamageInflict", type)
	}
}




// Lets make c7m3 playable alone
// ----------------------------------------------------------------------------------------------------------------------------

::KillOldFinaleButton <- function(){
	local triggerFinale = null
		if(triggerFinale = Entities.FindByClassname(triggerFinale, "trigger_finale")){
			triggerFinale.Kill()
		}
	
	local br = null
	if(br = Entities.FindByClassname(null,"trigger_escape")){
		br.Kill()
	}
}




::rd_specifics_c7m3 <- function(){
	KillOldFinaleButton()
	EntFire("worldspawn", "RunScriptCode", "SpawnNewFinaleButton()", 1.0)
	EntFire("worldspawn", "RunScriptCode", "SpawnNewFinaleButton()", 1.0)
	EntFire("generator_start_model", "Disable", "", 1.5)
	EntFire("generator_start_model", "Enable", "", 2.0)
}




::SpawnNewFinaleButton <- function(){
	
	local keyvalues =
	{
		targetname = "generator_start_model",
		StartDisabled = "1",
		model = "models/props_vehicles/floodlight_generator_switch01.mdl",
		disableshadows = "1",
		UseDelay = "0",
		type = "2",
		origin = Vector(-456.187, -571.935, 2.57401),
		connections =
		{
			FinaleStart =
			{
				cmd1 = "bridge_ragdoll_faderEnable5-1"
				cmd2 = "bridge_ragdoll_faderDisable8-1"
				cmd3 = "bridge_move_soundPlaySound5-1"
				cmd4 = "bridge_elevatorMoveToFloorBottom5-1"
				cmd5 = "store_brushEnable0-1"
				cmd6 = "generator_brushEnable0-1"
			}
			FinaleEscapeStarted =
			{
				cmd1 = "relay_escapeTrigger0-1"
			}
		}
	}
	
	local ent = SpawnEntityFromTable("trigger_finale", keyvalues)
	NetProps.SetPropEntity(Entities.FindByName(null, "finale_start_button"), "m_sGlowEntity", ent)
}




// Convert all weapons in shop ( except deagle ) to weapon_grenade_launcher_spawn
// ----------------------------------------------------------------------------------------------------------------------------

::rd_specifics_c1m2 <- function(){

	local ent = null
	local weapons =
	[
		"weapon_pistol_spawn",
		"weapon_autoshotgun_spawn",
		"weapon_chainsaw_spawn",
		"weapon_hunting_rifle_spawn",
		"weapon_pumpshotgun_spawn",
		"weapon_rifle_ak47_spawn",
		"weapon_rifle_desert_spawn",
		"weapon_rifle_m60_spawn",
		"weapon_rifle_sg552_spawn",
		"weapon_rifle_spawn",
		"weapon_shotgun_chrome_spawn",
		"weapon_shotgun_spas_spawn",
		"weapon_smg_mp5_spawn",
		"weapon_smg_silenced_spawn",
		"weapon_smg_spawn",
		"weapon_sniper_awp_spawn",
		"weapon_sniper_military_spawn",
		"weapon_sniper_scout_spawn"
	]
	
	foreach(weapon in weapons){
		while(ent = Entities.FindByClassname(ent, weapon)){
			SpawnEntityFromTable("weapon_grenade_launcher_spawn",
			{
				weaponskin = -1
				angles = ent.GetAngles().ToKVString()
				origin = ent.GetOrigin()
				spawnflags = 2
				body = 0
				solid = 0
				count = 1
				disableshadows = 0
				skin = 0
				glowrange = 0
				model = "models/w_models/weapons/w_grenade_launcher.mdl"
			})
			ent.Kill()
		}
	}
}




// Makes event glass also breakable by the rocket launcher's projectiles
// ----------------------------------------------------------------------------------------------------------------------------

::rd_specifics_c1m3 <- function(){
	local multiFilterOld = Entities.FindByName(null, "filter_breakglass")
	
	if(multiFilterOld && multiFilterOld.IsValid()){
		multiFilterOld.Kill()
	}
	

	SpawnEntityFromTable("filter_activator_class",
	{
			targetname = "filter_grenade_launcher_projectile"
			Negated = 0
			filterclass = "grenade_launcher_projectile"
	})
	
	SpawnEntityFromTable("filter_multi",
	{
		targetname = "filter_breakglass"
		Filter01 = "filter_bullet"
		Filter02 = "filter_melee"
		Filter03 = "filter_grenade_launcher_projectile"
		//
		filtertype = 1
		Negated = 0
	})
}





