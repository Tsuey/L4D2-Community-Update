Msg("Activating Community Mutation 2\n");

DirectorOptions <-
{
	ActiveChallenge = 1
	RelaxMinInterval = 5
	RelaxMaxInterval = 10
	cm_SpecialRespawnInterval = 8
	SpecialInitialSpawnDelayMin = 1
	SpecialInitialSpawnDelayMax = 5

	cm_MaxSpecials = 8
	BoomerLimit = 4
	SpitterLimit = 4
	SmokerLimit = 0
	HunterLimit = 0
	ChargerLimit = 0
	JockeyLimit = 0

	ProhibitBosses = 1 //tanks still spawn at finales though
	MegaMobSize = 0

	// convert items that aren't useful
	weaponsToConvert =
	{
		weapon_vomitjar = 	"weapon_molotov_spawn"
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
			
			if ( population == "boomer" || population == "spitter" || population == "church" || population == "river_docks_trap" )
				continue;
			else
				spawner.Kill();
		}
	}
}
