//-----------------------------------------------------
Msg("Activating Mutation 5\n");


DirectorOptions <-
{
	ActiveChallenge = 1

	cm_CommonLimit = 0
	cm_DominatorLimit = 8
	cm_MaxSpecials = 8
	cm_SpecialRespawnInterval = 15

	SpecialInitialSpawnDelayMin = 5
	SpecialInitialSpawnDelayMax = 30
	
	// convert items that aren't useful
	weaponsToConvert =
	{
		weapon_pipe_bomb =	"weapon_molotov_spawn"
		weapon_vomitjar =	"weapon_molotov_spawn"
		weapon_defibrillator =	"weapon_first_aid_kit_spawn"
	}

	function ConvertWeaponSpawn( classname )
	{
		if ( classname in weaponsToConvert )
		{
			return weaponsToConvert[classname];
		}
		return 0;
	}	

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
		if ( ( classname != "weapon_melee" ) && ( classname in weaponsToRemove ) )
		{
			return true;
		}
		return false;
	}

	DefaultItems =
	[
		"katana",
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
	
	EntFire( "weapon_spawn", "Kill" );
	foreach( wep, val in DirectorOptions.weaponsToRemove )
		EntFire( wep + "_spawn", "Kill" );
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
