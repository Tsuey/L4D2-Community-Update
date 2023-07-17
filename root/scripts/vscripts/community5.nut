//-----------------------------------------------------
Msg("Activating Death's Door\n");
Msg("Made by Rayman1103\n");

MutationOptions <-
{
	cm_ShouldHurry = true
	cm_AllowPillConversion = false
	cm_AllowSurvivorRescue = false
	SurvivorMaxIncapacitatedCount = 0
	TempHealthDecayRate = 0.0

	function AllowFallenSurvivorItem( classname )
	{
		if ( classname == "weapon_first_aid_kit" )
			return false;

		return true;
	}

	weaponsToConvert =
	{
		weapon_first_aid_kit = "weapon_pain_pills_spawn"
		weapon_adrenaline = "weapon_pain_pills_spawn"
	}

	function ConvertWeaponSpawn( classname )
	{
		if ( classname in weaponsToConvert )
			return weaponsToConvert[classname];

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
			return DefaultItems[idx];

		return 0;
	}
}

function OnGameEvent_round_start( params )
{
	Convars.SetValue( "pain_pills_decay_rate", 0.0 );

	for ( local player; player = Entities.FindByClassname( player, "player" ); ) // only works in restarts, which is desired
	{
		if ( player.IsSurvivor() && !IsPlayerABot( player ) )
			player.GetScriptScope().HeartbeatOn = false;
	}
}

function OnGameEvent_player_left_safe_area( params )
{
	SessionOptions.TempHealthDecayRate = 0.27;
}

function OnGameEvent_player_hurt( params )
{
	local player = GetPlayerFromUserID( params["userid"] );
	if ( !player || !player.IsSurvivor() || player.IsHangingFromLedge() )
		return;

	if ( NetProps.GetPropInt( player, "m_bIsOnThirdStrike" ) == 0 )
	{
		local health = player.GetHealth();
		if ( health > 0 )
		{
			if ( !IsPlayerABot( player ) )
			{
				local scope = player.GetScriptScope();
				if ( !scope.HeartbeatOn && health < player.GetMaxHealth() / 4 )
				{
					EmitSoundOnClient( "Player.Heartbeat", player );
					scope.HeartbeatOn = true;
				}
			}
			if ( health == 1 )
			{
				NetProps.SetPropInt( player, "m_bIsOnThirdStrike", 1 );
				NetProps.SetPropInt( player, "m_isGoingToDie", 1 );
			}
		}
	}
}

function OnGameEvent_defibrillator_used( params )
{
	local player = GetPlayerFromUserID( params["subject"] );
	if ( !player )
		return;

	player.SetHealth( 1 );
	player.SetHealthBuffer( 99 );

	if ( !IsPlayerABot( player ) )
	{
		EmitSoundOnClient( "Player.Heartbeat", player );
		player.GetScriptScope().HeartbeatOn = true;
	}
	NetProps.SetPropInt( player, "m_bIsOnThirdStrike", 1 );
	NetProps.SetPropInt( player, "m_isGoingToDie", 1 );
}

function OnGameEvent_heal_success( params )
{
	local player = GetPlayerFromUserID( params["subject"] );
	if ( !player )
		return;

	if ( !IsPlayerABot( player ) )
	{
		local scope = player.GetScriptScope();
		if ( scope.HeartbeatOn && player.GetHealth() >= player.GetMaxHealth() / 4 )
		{
			StopSoundOn( "Player.Heartbeat", player );
			scope.HeartbeatOn = false;
		}
	}
}

function CheckHealthAfterLedgeHang( userid )
{
	local player = GetPlayerFromUserID( userid );
	if ( !player )
		return;

	local health = player.GetHealth();

	if ( !IsPlayerABot( player ) )
	{
		local scope = player.GetScriptScope();
		if ( !scope.HeartbeatOn && health < player.GetMaxHealth() / 4 )
		{
			EmitSoundOnClient( "Player.Heartbeat", player );
			scope.HeartbeatOn = true;
		}
	}
	if ( health == 1 )
	{
		NetProps.SetPropInt( player, "m_bIsOnThirdStrike", 1 );
		NetProps.SetPropInt( player, "m_isGoingToDie", 1 );
	}
}

function OnGameEvent_revive_success( params )
{
	local player = GetPlayerFromUserID( params["subject"] );
	if ( !params["ledge_hang"] || !player )
		return;

	if ( NetProps.GetPropInt( player, "m_bIsOnThirdStrike" ) == 0 )
		EntFire( "worldspawn", "RunScriptCode", "g_ModeScript.CheckHealthAfterLedgeHang(" + params["subject"] + ")" );
}

function OnGameEvent_player_spawn( params )
{
	local player = GetPlayerFromUserID( params["userid"] );
	if ( !player || !player.IsSurvivor() )
		return;

	if ( !IsPlayerABot( player ) )
	{
		player.ValidateScriptScope();
		local scope = player.GetScriptScope();
		if ( !("HeartbeatOn" in scope) )
			scope.HeartbeatOn <- false;
	}
}

function OnGameEvent_player_death( params )
{
	if ( !("userid" in params) )
		return;

	local player = GetPlayerFromUserID( params["userid"] );
	if ( !player || !player.IsSurvivor() )
		return;

	if ( !IsPlayerABot( player ) )
	{
		local scope = player.GetScriptScope();
		if ( scope.HeartbeatOn )
		{
			StopSoundOn( "Player.Heartbeat", player );
			scope.HeartbeatOn = false;
		}
	}
}

function OnGameEvent_player_bot_replace( params )
{
	local player = GetPlayerFromUserID( params["player"] );
	if ( !player || !player.IsSurvivor() ) // in case an infected player uses jointeam 1
		return;

	local scope = player.GetScriptScope();
	if ( scope.HeartbeatOn )
	{
		StopSoundOn( "Player.Heartbeat", player );
		scope.HeartbeatOn = false;
	}
}

function OnGameEvent_bot_player_replace( params )
{
	local player = GetPlayerFromUserID( params["player"] );
	if ( !player )
		return;

	if ( !player.IsDead() ) // in case jointeam 2 or sb_takecontrol was used on a dead bot
	{
		if ( player.GetHealth() < player.GetMaxHealth() / 4 )
			player.GetScriptScope().HeartbeatOn = true; // unreliable if sb_takecontrol was used
		else
			StopSoundOn( "Player.Heartbeat", player );
	}
}

function OnGameEvent_player_complete_sacrifice( params )
{
	local player = GetPlayerFromUserID( params["userid"] );
	if ( !player )
		return;

	NetProps.SetPropInt( player, "m_takedamage", 0 );
	NetProps.SetPropInt( player, "m_isIncapacitated", 1 );
}

if ( !Director.IsSessionStartMap() )
{
	function PlayerSpawnDeadAfterTransition( userid )
	{
		local player = GetPlayerFromUserID( userid );
		if ( !player )
			return;

		player.SetHealth( 24 );
		player.SetHealthBuffer( 26 );

		if ( !IsPlayerABot( player ) )
		{
			EmitSoundOnClient( "Player.Heartbeat", player );
			player.GetScriptScope().HeartbeatOn = true;
		}
	}

	function PlayerSpawnAliveAfterTransition( userid )
	{
		local player = GetPlayerFromUserID( userid );
		if ( !player )
			return;

		local oldHealth = player.GetHealth();
		local maxHeal = player.GetMaxHealth() / 2;
		local healAmount = 0;

		if ( oldHealth < maxHeal )
		{
			healAmount = floor( (maxHeal - oldHealth) * 0.8 + 0.5 );
			player.SetHealth( oldHealth + healAmount );
			local bufferHealth = player.GetHealthBuffer() - healAmount;
			if ( bufferHealth < 0.0 )
				bufferHealth = 0.0;
			player.SetHealthBuffer( bufferHealth );
		}
		NetProps.SetPropInt( player, "m_bIsOnThirdStrike", 0 );
		NetProps.SetPropInt( player, "m_isGoingToDie", 0 );
	}

	function OnGameEvent_player_transitioned( params )
	{
		local player = GetPlayerFromUserID( params["userid"] );
		if ( !player || !player.IsSurvivor() )
			return;

		if ( NetProps.GetPropInt( player, "m_lifeState" ) == 2 )
			EntFire( "worldspawn", "RunScriptCode", "g_ModeScript.PlayerSpawnDeadAfterTransition(" + params["userid"] + ")", 0.03 );
		else
			EntFire( "worldspawn", "RunScriptCode", "g_ModeScript.PlayerSpawnAliveAfterTransition(" + params["userid"] + ")" );
	}
}
