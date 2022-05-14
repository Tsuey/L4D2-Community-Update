//-----------------------------------------------------
Msg("Activating Mutation 11\n");

DirectorOptions <-
{
	ActiveChallenge = 1

	weaponsToRemove =
	{
		weapon_first_aid_kit = 0
		weapon_pain_pills = 0
		weapon_adrenaline = 0
		weapon_defibrillator = 0
	}

	function AllowWeaponSpawn( classname )
	{
		if ( classname in weaponsToRemove )
		{
			return false;
		}
		return true;
	}		
}
