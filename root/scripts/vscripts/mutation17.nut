//-----------------------------------------------------
Msg("Activating Mutation 17\n");


DirectorOptions <-
{
	ActiveChallenge = 1

	cm_NoSurvivorBots = 1

	cm_CommonLimit = 10
	cm_BaseCommonAttackDamage = 15
	cm_WanderingZombieDensityModifier = 0.015

	HunterLimit = 0
	SmokerLimit = 0
	ChargerLimit = 0
	JockeyLimit = 0
	SpitterLimit = 0

	weaponsToRemove =
	{
		weapon_pistol = 0
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
		weapon_rifle_m60 = 0
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

function OnGameEvent_round_start_post_nav( params )
{
	EntFire( "weapon_spawn", "Kill" );
	foreach( wep, val in DirectorOptions.weaponsToRemove )
		EntFire( wep + "_spawn", "Kill" );
}
