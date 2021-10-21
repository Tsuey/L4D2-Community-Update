//-----------------------------------------------------
Msg("Activating Mutation 7\n");


DirectorOptions <-
{
	ActiveChallenge = 1

	cm_InfiniteFuel = 1
	cm_ShouldHurry = 1

	weaponsToRemove =
	{
		weapon_pistol = 0
		weapon_pistol_magnum = 0
		weapon_smg = 0
		weapon_pumpshotgun = 0
		weapon_autoshotgun = 0
		weapon_rifle = 0
		weapon_hunting_rifle = 0
		weapon_smg_silenced = 0
		weapon_shotgun_chrome = 0
		weapon_rifle_desert = 0
		weapon_sniper_military = 0
		weapon_shotgun_spas = 0
		weapon_grenade_launcher = 0
		weapon_rifle_ak47 = 0
		weapon_smg_mp5 = 0
		weapon_rifle_sg552 = 0
		weapon_sniper_awp = 0
		weapon_sniper_scout = 0
		weapon_rifle_m60 = 0
		weapon_melee = 0
		weapon_chainsaw = 0
		weapon_upgradepack_incendiary = 0
		weapon_upgradepack_explosive = 0
		ammo = 0
		upgrade_item = 0
	}

	function AllowWeaponSpawn( classname )
	{
		if ( classname in weaponsToRemove )
		{
			return false;
		}
		return true;
	}

	function ShouldAvoidItem( classname )
	{
		if ( ( classname != "weapon_chainsaw" ) && ( classname in weaponsToRemove ) )
		{
			return true;
		}
		return false;
	}

	DefaultItems =
	[
		"weapon_chainsaw",
		"weapon_pistol",
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

function OnGameEvent_round_start_post_nav( params )
{
	EntFire( "weapon_spawn", "Kill" );
	foreach( wep, val in DirectorOptions.weaponsToRemove )
		EntFire( wep + "_spawn", "Kill" );
}
