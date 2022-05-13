//-----------------------------------------------------
Msg("Activating Mutation 20\n");

DirectorOptions <-
{
	ActiveChallenge = 1

	weaponsToRemove =
	{
		weapon_first_aid_kit = 0
		weapon_pain_pills = 0
		weapon_adrenaline = 0
	}

	function AllowWeaponSpawn( classname )
	{
		if ( classname in weaponsToRemove )
		{
			return false;
		}
		return true;
	}

	// Challenge vars
	cm_TempHealthOnly = true
	cm_AllowPillConversion = false
	cm_HealingGnome = true

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
