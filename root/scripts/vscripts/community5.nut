//-----------------------------------------------------
Msg("Activating Death's Door\n");
Msg("Made by Rayman1103\n");


DirectorOptions <-
{
	ActiveChallenge = 1

	cm_ShouldHurry = true
	cm_AllowPillConversion = false
	cm_AllowSurvivorRescue = false
	SurvivorMaxIncapacitatedCount = 0

	function AllowFallenSurvivorItem( classname )
	{
		if ( classname == "weapon_first_aid_kit" )
			return false;
		
		return true;
	}

	weaponsToConvert =
	{
		weapon_first_aid_kit =	"weapon_pain_pills_spawn"
		weapon_adrenaline =	"weapon_pain_pills_spawn"
	}

	function ConvertWeaponSpawn( classname )
	{
		if ( classname in weaponsToConvert )
		{
			return weaponsToConvert[classname];
		}
		return 0;
	}

	DefaultItems =
	[
		"weapon_pistol",
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

	TempHealthDecayRate = 0.001
	function RecalculateHealthDecay()
	{
		if ( Director.HasAnySurvivorLeftSafeArea() )
		{
			TempHealthDecayRate = 0.27 // pain_pills_decay_rate default
		}
	}
}

function OnGameEvent_player_hurt_concise( params )
{
	local player = GetPlayerFromUserID( params["userid"] );
	
	if ( (!player) || (!player.IsSurvivor()) )
		return;
	
	if ( NetProps.GetPropInt( player, "m_bIsOnThirdStrike" ) == 0 && player.GetHealth() < (player.GetMaxHealth() / 4) )
	{
		player.SetReviveCount( 0 );
		NetProps.SetPropInt( player, "m_isGoingToDie", 1 );
	}
}

function CheckHealthAfterLedgeHang( userid )
{
	local player = GetPlayerFromUserID( userid );
	if ( (!player) || (!player.IsSurvivor()) )
		return;
	
	if ( player.GetHealth() < (player.GetMaxHealth() / 4) )
	{
		player.SetReviveCount( 0 );
		NetProps.SetPropInt( player, "m_isGoingToDie", 1 );
	}
}

function OnGameEvent_revive_success( params )
{
	local player = GetPlayerFromUserID( params["subject"] );
	
	if ( (!params["ledge_hang"]) || (!player) || (!player.IsSurvivor()) )
		return;
	
	if ( NetProps.GetPropInt( player, "m_bIsOnThirdStrike" ) == 0 )
		EntFire( "worldspawn", "RunScriptCode", "g_ModeScript.CheckHealthAfterLedgeHang(" + params["subject"] + ")", 0.1 );
}

function OnGameEvent_bot_player_replace( params )
{
	local player = GetPlayerFromUserID( params["player"] );
	
	if ( (!player) || (NetProps.GetPropInt( player, "m_bIsOnThirdStrike" ) == 1) )
		return;
	
	StopSoundOn( "Player.Heartbeat", player );
}

function Update()
{
	DirectorOptions.RecalculateHealthDecay();
}
