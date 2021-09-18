//-----------------------------------------------------
Msg("Activating Mutation 1\n");


DirectorOptions <-
{
	ActiveChallenge = 1

	cm_NoSurvivorBots = 1
	cm_CommonLimit = 0
	cm_DominatorLimit = 1
	cm_MaxSpecials = 2
	cm_SpecialRespawnInterval = 60
	cm_AutoReviveFromSpecialIncap = 1
	cm_AllowPillConversion = 0

	BoomerLimit = 0
	MobMaxPending = 0
	SurvivorMaxIncapacitatedCount = 1
	SpecialInitialSpawnDelayMin = 5
	SpecialInitialSpawnDelayMax = 30
	TankHitDamageModifierCoop = 0.5
	
	// convert items that aren't useful
	weaponsToConvert =
	{
		weapon_pipe_bomb =	"weapon_molotov_spawn"
		weapon_vomitjar =	"weapon_molotov_spawn"
		weapon_defibrillator =	"weapon_first_aid_kit_spawn"

		weapon_smg =		"weapon_rifle_spawn"
		weapon_pumpshotgun =	"weapon_autoshotgun_spawn"
		weapon_smg_silenced =	"weapon_rifle_desert_spawn"
		weapon_shotgun_chrome =	"weapon_shotgun_spas_spawn"
		weapon_smg_mp5 =	"weapon_rifle_sg552_spawn"
	}

	function ConvertWeaponSpawn( classname )
	{
		if ( classname in weaponsToConvert )
		{
			return weaponsToConvert[classname];
		}
		return 0;
	}	
}

function OnGameEvent_round_start_post_nav( params )
{
	local spawner = null;
	while ( spawner = Entities.FindByClassname( spawner, "info_zombie_spawn" ) )
	{
		if ( spawner.IsValid() )
		{
			local population = NetProps.GetPropString( spawner, "m_szPopulation" );
			
			if ( population == "boomer" || population == "hunter" || population == "smoker" || population == "jockey"
				|| population == "charger" || population == "spitter" || population == "new_special" || population == "church"
					|| population == "tank" || population == "witch" || population == "witch_bride" || population == "river_docks_trap" )
				continue;
			else
				spawner.Kill();
		}
	}
	
	if ( Director.GetMapName() == "c5m5_bridge" || Director.GetMapName() == "c6m3_port" )
		DirectorOptions.cm_MaxSpecials = 0;
	
	foreach( wep, val in DirectorOptions.weaponsToConvert )
	{
		local wep_spawner = null;
		while ( wep_spawner = Entities.FindByClassname( wep_spawner, wep + "_spawn" ) )
		{
			if ( wep_spawner.IsValid() )
			{
				local spawnTable =
				{
					origin = wep_spawner.GetOrigin(),
					angles = wep_spawner.GetAngles().ToKVString(),
					targetname = wep_spawner.GetName(),
					count = NetProps.GetPropInt( wep_spawner, "m_itemCount" ),
					spawnflags = NetProps.GetPropInt( wep_spawner, "m_spawnflags" )
				}
				wep_spawner.Kill();
				SpawnEntityFromTable(val, spawnTable);
			}
		}
	}
}

function OnGameEvent_finale_start( params )
{
	if ( Director.GetMapName() == "c6m3_port" )
		DirectorOptions.cm_MaxSpecials = 2;
}

function OnGameEvent_gauntlet_finale_start( params )
{
	if ( Director.GetMapName() == "c5m5_bridge" )
		DirectorOptions.cm_MaxSpecials = 2;
}

function Update()
{
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
