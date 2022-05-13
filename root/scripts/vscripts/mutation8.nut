//-----------------------------------------------------
Msg("Activating Mutation 8\n");


DirectorOptions <- 
{
	ActiveChallenge = 1

	cm_AllowSurvivorRescue = false

	weaponsToRemove =
	{
		ammo = 0
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

