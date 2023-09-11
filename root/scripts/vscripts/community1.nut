//-----------------------------------------------------
Msg("Activating Special Delivery\n");
Msg("Made by Rayman1103\n");

if ( !IsModelPrecached( "models/infected/smoker.mdl" ) )
	PrecacheModel( "models/infected/smoker.mdl" );
if ( !IsModelPrecached( "models/infected/smoker_l4d1.mdl" ) )
	PrecacheModel( "models/infected/smoker_l4d1.mdl" );
if ( !IsModelPrecached( "models/infected/boomer.mdl" ) )
	PrecacheModel( "models/infected/boomer.mdl" );
if ( !IsModelPrecached( "models/infected/boomer_l4d1.mdl" ) )
	PrecacheModel( "models/infected/boomer_l4d1.mdl" );
if ( !IsModelPrecached( "models/infected/boomette.mdl" ) )
	PrecacheModel( "models/infected/boomette.mdl" );
if ( !IsModelPrecached( "models/infected/hunter.mdl" ) )
	PrecacheModel( "models/infected/hunter.mdl" );
if ( !IsModelPrecached( "models/infected/hunter_l4d1.mdl" ) )
	PrecacheModel( "models/infected/hunter_l4d1.mdl" );
if ( !IsModelPrecached( "models/infected/limbs/exploded_boomette.mdl" ) )
{
	PrecacheModel( "models/infected/limbs/exploded_boomette.mdl" );
	::community1_no_female_boomers <- true;
}
if ( !IsModelPrecached( "models/infected/spitter.mdl" ) )
	PrecacheModel( "models/infected/spitter.mdl" );
if ( !IsModelPrecached( "models/infected/jockey.mdl" ) )
	PrecacheModel( "models/infected/jockey.mdl" );
if ( !IsModelPrecached( "models/infected/charger.mdl" ) )
	PrecacheModel( "models/infected/charger.mdl" );

MutationOptions <-
{
	ActiveChallenge = 1

	cm_CommonLimit = 0
	cm_DominatorLimit = 8
	cm_MaxSpecials = 8
	cm_ProhibitBosses = false
	cm_SpecialRespawnInterval = 0
	cm_AggressiveSpecials = false

	SpecialInitialSpawnDelayMin = 0
	SpecialInitialSpawnDelayMax = 5
	ShouldAllowSpecialsWithTank = true
	EscapeSpawnTanks = true
	MobMinSize = 0
	MobMaxSize = 0
	NoMobSpawns = true

	SmokerLimit = 2
	BoomerLimit = 2
	HunterLimit = 2
	SpitterLimit = 2
	JockeyLimit = 2
	ChargerLimit = 2

	// convert items that aren't useful
	weaponsToConvert =
	{
		weapon_pipe_bomb =	"weapon_molotov_spawn"
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
	SIModelsBase = [ [ "models/infected/smoker.mdl", "models/infected/smoker_l4d1.mdl" ],
					[ "models/infected/boomer.mdl", "models/infected/boomer_l4d1.mdl", "models/infected/boomette.mdl" ],
						[ "models/infected/hunter.mdl", "models/infected/hunter_l4d1.mdl" ],
							[ "models/infected/spitter.mdl" ],
								[ "models/infected/jockey.mdl" ],
									[ "models/infected/charger.mdl" ] ]
	SIModels = [ [ "models/infected/smoker.mdl", "models/infected/smoker_l4d1.mdl" ],
				[ "models/infected/boomer.mdl", "models/infected/boomer_l4d1.mdl", "models/infected/boomette.mdl" ],
					[ "models/infected/hunter.mdl", "models/infected/hunter_l4d1.mdl" ],
						[ "models/infected/spitter.mdl" ],
							[ "models/infected/jockey.mdl" ],
								[ "models/infected/charger.mdl" ] ]
	ModelCheck = [ false, false, false, false, false, false ]
	LastBoomerModel = ""
	BoomersChecked = 0
	LeftSafeAreaThink = false
}

function LeftSafeAreaThink()
{
	for ( local player; player = Entities.FindByClassname( player, "player" ); )
	{
		if ( NetProps.GetPropInt( player, "m_iTeamNum" ) != 2 )
			continue;

		if ( ResponseCriteria.GetValue( player, "instartarea" ) == "0" )
		{
			SessionOptions.cm_MaxSpecials = 8;
			SessionState.LeftSafeAreaThink = false;
			break;
		}
	}
}

function OnGameEvent_round_start_post_nav( params )
{
	for ( local spawner; spawner = Entities.FindByClassname( spawner, "info_zombie_spawn" ); )
	{
		local population = NetProps.GetPropString( spawner, "m_szPopulation" );

		if ( population == "boomer" || population == "hunter" || population == "smoker" || population == "jockey"
			|| population == "charger" || population == "spitter" || population == "new_special" || population == "church"
				|| population == "tank" || population == "witch" || population == "witch_bride" || population == "river_docks_trap" )
			continue;
		else
			spawner.Kill();
	}

	if ( Director.GetMapName() == "c1m1_hotel" )
		DirectorOptions.cm_TankLimit <- 0;
	else if ( Director.GetMapName() == "c5m5_bridge" || Director.GetMapName() == "c6m3_port" )
		DirectorOptions.cm_MaxSpecials = 0;
	else if ( Director.GetMapName() == "c7m1_docks" )
		DirectorOptions.cm_ProhibitBosses = true;
}

function OnGameEvent_player_left_safe_area( params )
{
	local player = GetPlayerFromUserID( params["userid"] );
	if ( !player )
		return;

	if ( ResponseCriteria.GetValue( player, "instartarea" ) == "1" )
	{
		SessionOptions.cm_MaxSpecials = 0;
		SessionState.LeftSafeAreaThink = true;
	}
}

function OnGameEvent_triggered_car_alarm( params )
{
	if ( !Director.IsTankInPlay() )
	{
		DirectorOptions.cm_AggressiveSpecials = true;
		ZSpawn( { type = 8 } );
		DirectorOptions.cm_AggressiveSpecials = false;
	}

	StartAssault();
}

function OnGameEvent_finale_start( params )
{
	if ( Director.GetMapName() == "c6m3_port" )
		DirectorOptions.cm_MaxSpecials = 8;
}

function OnGameEvent_gauntlet_finale_start( params )
{
	if ( Director.GetMapName() == "c5m5_bridge" )
		DirectorOptions.cm_MaxSpecials = 8;
}

function OnGameEvent_player_spawn( params )
{
	local player = GetPlayerFromUserID( params["userid"] );

	if ( ( !player ) || ( player.IsSurvivor() ) )
		return;

	local zombieType = player.GetZombieType();
	if ( zombieType > 6 )
		return;

	local modelName = player.GetModelName();

	if ( !SessionState.ModelCheck[ zombieType - 1 ] )
	{
		if ( (zombieType == 2) && !("community1_no_female_boomers" in getroottable()) )
		{
			if ( SessionState.LastBoomerModel != modelName )
			{
				SessionState.LastBoomerModel = modelName;
				SessionState.BoomersChecked++;
			}
			if ( SessionState.BoomersChecked > 1 )
				SessionState.ModelCheck[ zombieType - 1 ] = true;
		}
		else
			SessionState.ModelCheck[ zombieType - 1 ] = true;

		if ( SessionState.SIModelsBase[zombieType - 1].find( modelName ) == null )
		{
			SessionState.SIModelsBase[zombieType - 1].append( modelName );
			SessionState.SIModels[zombieType - 1].append( modelName );
		}
	}

	if ( SessionState.SIModelsBase[zombieType - 1].len() == 1 )
		return;

	local zombieModels = SessionState.SIModels[zombieType - 1];
	if ( zombieModels.len() == 0 )
		SessionState.SIModels[zombieType - 1].extend( SessionState.SIModelsBase[zombieType - 1] );
	local foundModel = zombieModels.find( modelName );
	if ( foundModel != null )
	{
		zombieModels.remove( foundModel );
		return;
	}

	local randomElement = RandomInt( 0, zombieModels.len() - 1 );
	local randomModel = zombieModels[ randomElement ];
	zombieModels.remove( randomElement );

	player.SetModel( randomModel );
}

function Update()
{
	if ( SessionState.LeftSafeAreaThink )
		LeftSafeAreaThink();
	if ( Director.GetCommonInfectedCount() > 0 )
	{
		for ( local infected; infected = Entities.FindByClassname( infected, "infected" ); )
			infected.Kill();
	}
}
