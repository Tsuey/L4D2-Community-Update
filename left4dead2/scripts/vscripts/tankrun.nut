//-----------------------------------------------------
Msg("Activating Tank Run\n");

if ( !IsModelPrecached( "models/infected/hulk.mdl" ) )
	PrecacheModel( "models/infected/hulk.mdl" );
if ( !IsModelPrecached( "models/infected/hulk_dlc3.mdl" ) )
	PrecacheModel( "models/infected/hulk_dlc3.mdl" );
if ( !IsModelPrecached( "models/infected/hulk_l4d1.mdl" ) )
	PrecacheModel( "models/infected/hulk_l4d1.mdl" );

MutationOptions <-
{
	cm_ShouldHurry = 1
	cm_InfiniteFuel = 1
	cm_CommonLimit = 0
	cm_DominatorLimit = 0
	cm_MaxSpecials = 0
	cm_ProhibitBosses = true
	cm_AggressiveSpecials = true
	
	BoomerLimit = 0
	SmokerLimit = 0
	HunterLimit = 0
	ChargerLimit = 0
	SpitterLimit = 0
	JockeyLimit = 0
	cm_WitchLimit = 0
	cm_TankLimit = 8
	
	MobMinSize = 0
	MobMaxSize = 0
	NoMobSpawns = true
	EscapeSpawnTanks = false

	// convert items that aren't useful
	weaponsToConvert =
	{
		weapon_defibrillator = "weapon_first_aid_kit_spawn"
		ammo = "upgrade_laser_sight"
	}

	function ConvertWeaponSpawn( classname )
	{
		if ( classname in weaponsToConvert )
		{
			return weaponsToConvert[classname];
		}
		return 0;
	}

	DefaultItems =
	[
		"weapon_pistol_magnum",
	]

	function GetDefaultItem( idx )
	{
		if ( idx < DefaultItems.len() )
		{
			return DefaultItems[idx];
		}
		return 0;
	}
}

MutationState <-
{
	TankModelsBase = [ "models/infected/hulk.mdl", "models/infected/hulk_dlc3.mdl", "models/infected/hulk_l4d1.mdl" ]
	TankModels = [ "models/infected/hulk.mdl", "models/infected/hulk_dlc3.mdl", "models/infected/hulk_l4d1.mdl" ]
	ModelCheck = false
	FinaleStarted = false
	FinaleStartTime = 0
	TriggerRescue = false
	RescueDelay = 600
	LastSpawnTime = 0
	SpawnInterval = 20
	DoubleTanks = false
	TankBiled = {}
	TanksAlive = 0
	TanksDisabled = false
	TankHealth = 4000
	BileHurtTankThink = false
	SpawnTankThink = false
	TriggerRescueThink = false
	LeftSafeAreaThink = false
	FinaleType = -1
}

local triggerFinale = Entities.FindByClassname( null, "trigger_finale" );
if ( triggerFinale )
	MutationState.FinaleType = NetProps.GetPropInt( triggerFinale, "m_type" );

if ( MutationState.FinaleType != 4 )
{
	function GetNextStage()
	{
		if ( SessionState.TriggerRescue )
		{
			SessionOptions.ScriptedStageType = STAGE_ESCAPE;
			TankRunHUD.Fields.rescue_time.flags = TankRunHUD.Fields.rescue_time.flags | HUD_FLAG_NOTVISIBLE;
			return;
		}
		if ( SessionState.FinaleStarted )
		{
			SessionOptions.ScriptedStageType = STAGE_DELAY;
			SessionOptions.ScriptedStageValue = -1;
		}
	}
}

function AllowTakeDamage( damageTable )
{
	if ( !damageTable.Attacker || !damageTable.Victim || !damageTable.Inflictor )
		return true;
	
	if ( damageTable.Attacker.IsPlayer() && damageTable.Victim.IsPlayer() )
	{
		if ( damageTable.Attacker.IsSurvivor() && damageTable.Victim.GetZombieType() == 8 )
		{
			if ( damageTable.Inflictor.GetClassname() == "pipe_bomb_projectile" )
				damageTable.DamageDone = 500;
		}
	}
	
	return true;
}

function TriggerRescueThink()
{
	if ( (Time() - SessionState.FinaleStartTime) >= SessionState.RescueDelay )
	{
		SessionState.TriggerRescue = true;
		Director.ForceNextStage();
		SessionState.TriggerRescueThink = false;
	}
}

function SpawnTankThink()
{
	if ( (SessionState.TanksAlive < 8) && ((Time() - SessionState.LastSpawnTime) >= SessionState.SpawnInterval || SessionState.LastSpawnTime == 0) )
	{
		local success = ZSpawn( { type = 8 } );
		if ( success )
		{
			if ( SessionState.DoubleTanks )
				ZSpawn( { type = 8 } );
			SessionState.LastSpawnTime = Time();
		}
	}
}

function LeftSafeAreaThink()
{
	local player = null;
	while ( player = Entities.FindByClassname( player, "player" ) )
	{
		if ( ( !player.IsValid() ) || ( NetProps.GetPropInt( player, "m_iTeamNum" ) != 2 ) )
			continue;
		
		if ( ResponseCriteria.GetValue( player, "instartarea" ) == "0" )
		{
			SessionState.LeftSafeAreaThink = false;
			SessionState.SpawnTankThink = true;
			break;
		}
		else
			continue;
	}
}

function BileHurtTankThink()
{
	foreach( tank, survivor in SessionState.TankBiled )
	{
		tank.TakeDamage( 100, 0, survivor );
	}
}

function CheckDifficultyForTankHealth( difficulty )
{
	local health = [2000, 3000, 4000, 5000];
	
	if ( SessionState.MapName == "c1m1_hotel" )
		SessionState.TankHealth = (health[difficulty] / 5);
	else
		SessionState.TankHealth = health[difficulty];
}

function OnGameEvent_round_start_post_nav( params )
{
	local spawner = null;
	while ( spawner = Entities.FindByClassname( spawner, "info_zombie_spawn" ) )
	{
		if ( spawner.IsValid() )
		{
			local population = NetProps.GetPropString( spawner, "m_szPopulation" );
			
			if ( population == "tank" || population == "river_docks_trap" )
				continue;
			else
				spawner.Kill();
		}
	}
	local ammo = null;
	while ( ammo = Entities.FindByModel( ammo, "models/props/terror/ammo_stack.mdl" ) )
		ammo.Kill();
	
	if ( SessionState.MapName == "c5m5_bridge" || SessionState.MapName == "c6m3_port" || SessionState.MapName == "c13m4_cutthroatcreek" )
	{
		SessionOptions.cm_TankLimit = 0;
		SessionState.TanksDisabled = true;
	}
	else if ( SessionState.MapName == "c7m1_docks" )
	{
		EntFire( "tank_touch_test", "Kill" );
		EntFire( "tankdoorout_button", "AddOutput", "spawnflags 0" );
	}
	
	CheckDifficultyForTankHealth( GetDifficulty() );
}

function OnGameEvent_difficulty_changed( params )
{
	CheckDifficultyForTankHealth( params["newDifficulty"] );
}

function OnGameEvent_player_left_safe_area( params )
{
	if ( SessionState.TanksDisabled )
		return;
	
	local player = GetPlayerFromUserID( params["userid"] );
	if ( !player )
	{
		SessionState.SpawnTankThink = true;
		return;
	}
	
	local instartarea = ResponseCriteria.GetValue( player, "instartarea" );
	if ( instartarea == "1" )
		SessionState.LeftSafeAreaThink = true;
	else
		SessionState.SpawnTankThink = true;
}

function OnGameEvent_finale_start( params )
{
	if ( SessionState.MapName == "c6m3_port" )
	{
		SessionOptions.cm_TankLimit = 8;
		SessionState.TanksDisabled = false;
		SessionState.SpawnTankThink = true;
	}
	
	if ( SessionState.FinaleType == 4 )
		return;
	
	SessionState.DoubleTanks = true;
	SessionState.SpawnInterval = 40;
	SessionState.FinaleStarted = true;
	SessionState.FinaleStartTime = Time();
	SessionState.TriggerRescueThink = true;
	
	HUDManageTimers( 0, TIMER_COUNTDOWN, SessionState.RescueDelay );
	TankRunHUD.Fields.rescue_time.flags = TankRunHUD.Fields.rescue_time.flags & ~HUD_FLAG_NOTVISIBLE;
}

function OnGameEvent_gauntlet_finale_start( params )
{
	if ( SessionState.MapName == "c5m5_bridge" || SessionState.MapName == "c13m4_cutthroatcreek" )
	{
		SessionOptions.cm_TankLimit = 8;
		SessionState.TanksDisabled = false;
		SessionState.SpawnTankThink = true;
	}
}

function OnGameEvent_finale_vehicle_leaving( params )
{
	SessionState.SpawnTankThink = false;
}

function OnGameEvent_mission_lost( params )
{
	SessionState.SpawnTankThink = false;
}

function OnGameEvent_player_now_it( params )
{
	local attacker = GetPlayerFromUserID( params["attacker"] );
	local victim = GetPlayerFromUserID( params["userid"] );
	
	if ( !attacker || !victim )
		return;
	
	if ( attacker.IsSurvivor() && victim.GetZombieType() == 8 )
	{
		if ( victim in SessionState.TankBiled )
			return;
		
		victim.OverrideFriction( Convars.GetFloat( "vomitjar_duration_infected_bot" ), 2.0 );
		SessionState.TankBiled.rawset( victim, attacker );
		if ( SessionState.TankBiled.len() == 1 )
			SessionState.BileHurtTankThink = true;
	}
}

function OnGameEvent_player_no_longer_it( params )
{
	local victim = GetPlayerFromUserID( params["userid"] );
	
	if ( !victim )
		return;
	
	if ( victim.GetZombieType() == 8 )
	{
		if ( victim in SessionState.TankBiled )
		{
			SessionState.TankBiled.rawdelete( victim );
			if ( SessionState.TankBiled.len() == 0 )
				SessionState.BileHurtTankThink = false;
		}
	}
}

function OnGameEvent_tank_spawn( params )
{
	local tank = GetPlayerFromUserID( params["userid"] );
	if ( !tank )
		return;
	
	SessionState.TanksAlive++;
	tank.SetMaxHealth( SessionState.TankHealth );
	tank.SetHealth( SessionState.TankHealth );
	local modelName = tank.GetModelName();
	
	if ( !SessionState.ModelCheck )
	{
		SessionState.ModelCheck = true;
		
		if ( SessionState.TankModelsBase.find( modelName ) == null )
		{
			SessionState.TankModelsBase.append( modelName );
			SessionState.TankModels.append( modelName );
		}
	}
	
	local tankModels = SessionState.TankModels;
	if ( tankModels.len() == 0 )
		SessionState.TankModels.extend( SessionState.TankModelsBase );
	local foundModel = tankModels.find( modelName );
	if ( foundModel != null )
	{
		tankModels.remove( foundModel );
		return;
	}
	
	local randomElement = RandomInt( 0, tankModels.len() - 1 );
	local randomModel = tankModels[ randomElement ];
	tankModels.remove( randomElement );
	
	tank.SetModel( randomModel );
}

function OnGameEvent_tank_killed( params )
{
	SessionState.TanksAlive--;
	
	local tank = GetPlayerFromUserID( params["userid"] );
	
	if ( tank in SessionState.TankBiled )
	{
		SessionState.TankBiled.rawdelete( tank );
		if ( SessionState.TankBiled.len() == 0 )
			SessionState.BileHurtTankThink = false;
	}
	
	if ( SessionState.FinaleStarted )
	{
		SessionState.RescueDelay -= 10;
		HUDManageTimers( 0, TIMER_COUNTDOWN, HUDReadTimer( 0 ) - 10 );
	}
}

function Update()
{
	if ( SessionState.LeftSafeAreaThink )
		LeftSafeAreaThink();
	if ( SessionState.SpawnTankThink )
		SpawnTankThink();
	if ( SessionState.TriggerRescueThink )
		TriggerRescueThink();
	if ( SessionState.BileHurtTankThink )
		BileHurtTankThink();
	if ( Director.GetCommonInfectedCount() > 0 )
	{
		local infected = null;
		while ( infected = Entities.FindByClassname( infected, "infected" ) )
		{
			if ( infected.IsValid() )
				infected.Kill();
		}
	}
}

TankRunHUD <- {};
function SetupModeHUD()
{
	TankRunHUD =
	{
		Fields =
		{
			rescue_time = { slot = HUD_MID_TOP, name = "rescue", special = HUD_SPECIAL_TIMER0, flags = HUD_FLAG_COUNTDOWN_WARN | HUD_FLAG_BEEP | HUD_FLAG_ALIGN_CENTER | HUD_FLAG_NOTVISIBLE },
		}
	}
	HUDSetLayout( TankRunHUD );
}
