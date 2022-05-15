//-----------------------------------------------------
Msg("Activating Mutation 18\n");

DirectorOptions <-
{
	ActiveChallenge = 1

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

	// Challenge vars
	cm_TempHealthOnly = true
	cm_AllowPillConversion = false
	cm_ShouldHurry = true

	TempHealthDecayRate = 0.001
	function RecalculateHealthDecay()
	{
		if ( Director.HasAnySurvivorLeftSafeArea() )
		{
			TempHealthDecayRate = 0.27 // pain_pills_decay_rate default
		}
	}
}

function Update()
{
	DirectorOptions.RecalculateHealthDecay();
}
