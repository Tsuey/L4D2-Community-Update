//-----------------------------------------------------
Msg("Activating Mutation 19\n");


DirectorOptions <-
{
	ActiveChallenge = 1

//	cm_frustrationTimer = 0
	cm_TankRun = 1
	cm_ShouldHurry = 1
	cm_AutoSpawnInfectedGhosts = 1

	PreferredSpecialDirection = SPAWN_BEHIND_SURVIVORS
	BehindSurvivorsSpawnDistance = 2000
	TankRunSpawnDelay = 15

	MobMaxPending = 0

	// Always convert to the TANK!!!
	function ConvertZombieClass( iClass )
	{
		return 8;
	}	

	weaponsToConvert =
	{
		weapon_first_aid_kit = "weapon_pain_pills_spawn"
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
