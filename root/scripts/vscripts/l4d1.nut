//============ Copyright (c) Valve Corporation, All rights reserved. ==========
//
//
//=============================================================================
Msg("Activating Mutation L4D1\n");

if ( !IsModelPrecached( "models/infected/smoker_l4d1.mdl" ) )
	PrecacheModel( "models/infected/smoker_l4d1.mdl" );
if ( !IsModelPrecached( "models/infected/boomer_l4d1.mdl" ) )
	PrecacheModel( "models/infected/boomer_l4d1.mdl" );
if ( !IsModelPrecached( "models/infected/hunter_l4d1.mdl" ) )
	PrecacheModel( "models/infected/hunter_l4d1.mdl" );
if ( !IsModelPrecached( "models/infected/hulk_l4d1.mdl" ) )
	PrecacheModel( "models/infected/hulk_l4d1.mdl" );

DirectorOptions <-
{
	ActiveChallenge = 1

	SpitterLimit = 0
	JockeyLimit = 0
	ChargerLimit = 0

	EscapeSpawnTanks = true

	weaponsToConvert =
	{
		weapon_shotgun_spas				= "weapon_autoshotgun_spawn"
		weapon_defibrillator			= "weapon_first_aid_kit_spawn"
		weapon_ammo_pack				= "weapon_first_aid_kit_spawn"
		weapon_sniper_awp				= "weapon_hunting_rifle_spawn"
		weapon_sniper_military			= "weapon_hunting_rifle_spawn"
		weapon_sniper_scout				= "weapon_hunting_rifle_spawn"
		weapon_vomitjar					= "weapon_molotov_spawn"
		weapon_adrenaline				= "weapon_pain_pills_spawn"
		weapon_pistol_magnum			= "weapon_pistol_spawn"
		weapon_shotgun_chrome			= "weapon_pumpshotgun_spawn"
		weapon_rifle_ak47				= "weapon_rifle_spawn"
		weapon_rifle_desert				= "weapon_rifle_spawn"
		weapon_rifle_sg552				= "weapon_rifle_spawn"
		weapon_smg_mp5					= "weapon_smg_spawn"
		weapon_smg_silenced				= "weapon_smg_spawn"
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
		weapon_rifle_m60 = 0
		weapon_grenade_launcher = 0
		weapon_chainsaw = 0
		weapon_melee = 0
		weapon_upgradepack_explosive = 0
		weapon_upgradepack_incendiary = 0
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
		if ( classname in weaponsToRemove )
		{
			return true;
		}
		return false;
	}
}

function OnGameEvent_round_start_post_nav( params )
{
	EntFire( "worldspawn", "AddOutput", "timeofday 0" );
	EntFire( "weapon_*", "AddOutput", "skin 0" );
	EntFire( "weapon_*", "AddOutput", "weaponskin -1" );
	EntFire( "trigger_upgrade_laser_sight", "Kill" );
	
	foreach( wep, val in DirectorOptions.weaponsToRemove )
		EntFire( wep + "_spawn", "Kill" );
	foreach( wep, val in DirectorOptions.weaponsToConvert )
	{
		for ( local wep_spawner; wep_spawner = Entities.FindByClassname( wep_spawner, wep + "_spawn" ); )
		{
			local spawnTable =
			{
				origin = wep_spawner.GetOrigin(),
				angles = wep_spawner.GetAngles().ToKVString(),
				targetname = wep_spawner.GetName(),
				count = NetProps.GetPropInt( wep_spawner, "m_itemCount" ),
				spawnflags = NetProps.GetPropInt( wep_spawner, "m_spawnflags" )
			}
			wep_spawner.Kill();
			SpawnEntityFromTable(val, spawnTable);
		}
	}
	
	if ( Director.IsL4D1Campaign() )
	{
		DirectorOptions.WaterSlowsMovement <- false;
		
		if ( SessionState.ModeName == "l4d1coop" || SessionState.ModeName == "l4d1vs" )
		{
			if ( IsMissionFinalMap() )
			{
				if ( SessionState.MapName != "c7m3_port" )
				{
					local finale = Entities.FindByClassname( null, "trigger_finale" );
					if ( finale )
						NetProps.SetPropInt( finale, "m_type", 0 );
				}
			}
			else
			{
				if ( SessionState.MapName == "c10m4_mainstreet" )
				{
					local relay = Entities.FindByName( null, "forklift_relay" );
					if ( relay )
					{
						EntityOutputs.RemoveOutput( relay, "OnTrigger", "director", "BeginScript", "c10m4_onslaught" );
						EntityOutputs.AddOutput( relay, "OnTrigger", "director", "ForcePanicEvent", "", 9.0, -1 );
					}
					EntFire( "onslaught1", "Kill" );
				}
				else if ( SessionState.MapName == "c11m4_terminal" )
				{
					local van = Entities.FindByName( null, "van_button" );
					if ( van )
					{
						EntityOutputs.RemoveOutput( van, "OnPressed", "@director", "", "" );
						EntityOutputs.AddOutput( van, "OnPressed", "@director", "ForcePanicEvent", "", 3.0, -1 );
					}
					local relay = Entities.FindByName( null, "alarm_on_relay" );
					if ( relay )
					{
						EntityOutputs.RemoveOutput( relay, "OnTrigger", "@director", "", "" );
						EntityOutputs.RemoveOutput( relay, "OnTrigger", "alarm_safety_relay", "", "" );
						EntityOutputs.AddOutput( relay, "OnTrigger", "@director", "ForcePanicEvent", "", 0.0, -1 );
						EntityOutputs.AddOutput( relay, "OnTrigger", "alarm_off_relay", "Trigger", "", 15.0, -1 );
					}
					EntFire( "van_follow_trigger", "Kill" );
					EntFire( "van_endscript_relay", "Kill" );
					EntFire( "onslaught_hint_trigger", "Kill" );
				}
				else if ( SessionState.MapName == "c12m3_bridge" )
				{
					local relay = Entities.FindByName( null, "train_engine_relay" );
					if ( relay )
					{
						EntityOutputs.RemoveOutput( relay, "OnTrigger", "director", "BeginScript", "c12m3_onslaught" );
						EntityOutputs.AddOutput( relay, "OnTrigger", "director", "ForcePanicEvent", "", 2.0, -1 );
					}
					EntFire( "zombie_spawn1", "Kill" );
					EntFire( "onslaught_hint_template", "Kill" );
				}
				else if ( SessionState.MapName == "c12m4_barn" )
					EntFire( "window_trigger", "Kill" );
			}
		}
	}
}

function OnGameEvent_player_spawn( params )
{
	local player = GetPlayerFromUserID( params["userid"] );
	
	if ( ( !player ) || ( player.IsSurvivor() ) )
		return;
	
	local modelName = player.GetModelName();
	if ( ( modelName.find( "l4d1" ) != null ) || ( modelName == "models/infected/hulk_dlc3.mdl" ) )
		return;
	
	switch( player.GetZombieType() )
	{
		case 1:
		{
			player.SetModel( "models/infected/smoker_l4d1.mdl" );
			break;
		}
		case 2:
		{
			player.SetModel( "models/infected/boomer_l4d1.mdl" );
			break;
		}
		case 3:
		{
			player.SetModel( "models/infected/hunter_l4d1.mdl" );
			break;
		}
		case 8:
		{
			player.SetModel( "models/infected/hulk_l4d1.mdl" );
			break;
		}
		default:
			break;
	}
}

function OnGameEvent_player_death( params )
{
	if ( !("userid" in params) )
		return;
	
	local victim = GetPlayerFromUserID( params["userid"] );
	
	if ( ( !victim ) || ( !victim.IsSurvivor() ) )
		return;
	
	EntFire( "survivor_death_model", "BecomeRagdoll" );
}
