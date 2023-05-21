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

	ProhibitBosses = true //tanks still spawn at finales though
	MegaMobSize = 0

	// convert items that aren't useful
	weaponsToConvert =
	{
		weapon_vomitjar = "weapon_molotov_spawn"
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
	for ( local spawner; spawner = Entities.FindByClassname( spawner, "info_zombie_spawn" ); )
	{
		local population = NetProps.GetPropString( spawner, "m_szPopulation" );

		if ( population == "boomer" || population == "spitter" || population == "church" || population == "river_docks_trap" )
			continue;
		else
			spawner.Kill();
	}

	if ( Director.GetMapName() == "c5m5_bridge" || Director.GetMapName() == "c6m3_port" )
		DirectorOptions.cm_MaxSpecials = 0;
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

function AllowTakeDamage( damageTable )
{
	if ( !damageTable.Attacker || !damageTable.Victim )
		return true;

	if ( damageTable.DamageType == 128 )
	{
		if ( damageTable.Attacker.IsPlayer() && damageTable.Victim.IsSurvivor() )
		{
			if ( damageTable.Attacker.GetZombieType() == 2 )
			{
				switch ( GetDifficulty() )
				{
					case 0:
						damageTable.DamageDone = ( Convars.GetFloat( "boomer_pz_claw_dmg" ) / 2 ); break;
					case 1:
						damageTable.DamageDone = Convars.GetFloat( "boomer_pz_claw_dmg" ); break;
					case 2:
						damageTable.DamageDone = ( Convars.GetFloat( "boomer_pz_claw_dmg" ) + 3 ); break;
					case 3:
						damageTable.DamageDone = ( Convars.GetFloat( "boomer_pz_claw_dmg" ) + 18 ); break;
				}
			}
		}
	}
	return true;
}