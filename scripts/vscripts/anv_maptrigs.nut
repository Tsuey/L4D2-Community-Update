/*****************************************************************************
**  MAP FIXES REQUIRING NEW TRIGGERS
**
**  This file houses lengthy trigger_multiple and trigger_once entity spawns
**  for which there's no "make_" functions for. While "make_" functions may
**  accompany these, they're only here due to their relevancy to the scenario.
**  The goal is to prevent anv_mapfixes.nut from getting too messy.
**
**  Excluded from this file are things that can be fixed with "piggybacks" on
**  existing map triggers, or Tank warps and other complex fixes that actually
**  warranted their own devoted files for specific modes.
**
**  Below fixes are for all modes -- except finale ones are Versus-only!
*****************************************************************************/

switch( g_MapName )
{
	case "c1m1_hotel":
	{
		// FIX: Prevent the earliest press-forward balcony window shortcut.

		// Teamwork shortcut. Will only patch for Coop if the Community wills so for parkour-esque shortcuts.

			if ( g_BaseMode == "coop" || g_BaseMode == "realism" ) { break; }

		con_comment( "TRIG:\tAnti-shortcut \"_shortcut_balcrail_trigonce\" deletes trighurt at lower floor." );
		con_comment( "INFO:\tFire particle \"_shortcut_balcrail_particle\" acts as visual deterrent." );

		make_trighurt( "_shortcut_balcrail_trighurt", "Everyone", "-32 -45 -96", "7 45 8", "1641 6432 2576" );
		make_clip( "_shortcut_balcrail_survivorclip", "Survivors", 1, "0 -32 0", "2 32 95", "1646 6560 2481" );

		SpawnEntityFromTable( "trigger_once",
		{
			targetname	= g_UpdateName + "_shortcut_balcrail_trigonce",
			StartDisabled	= 0,
			spawnflags	= 1,
			filtername	= "anv_globalfixes_filter_survivor",
			origin		= Vector( 2167, 5812, 2504 )
		} );

		EntFire( g_UpdateName + "_shortcut_balcrail_trigonce", "AddOutput", "mins -503 -836 -40" );
		EntFire( g_UpdateName + "_shortcut_balcrail_trigonce", "AddOutput", "maxs 185 2052 104" );
		EntFire( g_UpdateName + "_shortcut_balcrail_trigonce", "AddOutput", "solid 2" );

		EntFire( g_UpdateName + "_shortcut_balcrail_trigonce", "AddOutput", "OnStartTouch anv_mapfixes_shortcut_balcrail_*:Kill::0:-1" );

		SpawnEntityFromTable( "info_particle_system",
		{
			targetname	= g_UpdateName + "_shortcut_balcrail_particle",
			origin		= Vector( 1670, 6430, 2470 ),
			angles		= Vector( 0, 180, 8 ),
			start_active	= 1,
			effect_name	= "fire_window_hotel"
		} );

		break;
	}

	case "c2m4_barns":
	{
		// FIX: Prevent various common hops straight to barns roof with a large clip.

		// Doesn't skip an event. Will only patch for Coop if the Community wills so for similar commonhop shortcuts.

			if ( g_BaseMode == "coop" || g_BaseMode == "realism" ) { break; }

		// Survivalists will never exit the barns to touch this trigger; thus don't spawn the clip.

			if ( g_BaseMode == "survival" ) { break; }

		con_comment( "TRIG:\tAnti-shortcut \"_barnsroof_trigonce\" deletes clip at barns exit." );

		make_clip( "_barnsroof_commonhop", "Survivors", 1, "-1070 -8 -208", "1070 16 844", "-1312 256 180" );

		SpawnEntityFromTable( "trigger_once",
		{
			targetname	= g_UpdateName + "_barnsroof_trigonce",
			StartDisabled	= 0,
			spawnflags	= 1,
			filtername	= "anv_globalfixes_filter_survivor",
			origin		= Vector( -260, -32, -192 )
		} );

		EntFire( g_UpdateName + "_barnsroof_trigonce", "AddOutput", "mins -4 -32 0" );
		EntFire( g_UpdateName + "_barnsroof_trigonce", "AddOutput", "maxs 4 32 112" );
		EntFire( g_UpdateName + "_barnsroof_trigonce", "AddOutput", "solid 2" );

		EntFire( g_UpdateName + "_barnsroof_trigonce", "AddOutput", "OnStartTouch anv_mapfixes_barnsroof_commonhop:Kill::0:-1" );

		break;
	}

	case "c2m5_concert":
	{
		// FIX: Prevent interior stadium trigger from deleting players by re-creating it.

		con_comment( "TRIG:\tPlayer-deleting trigger_multiple replaced with trigger_hurt." );

		// When "stadium_entrance_door_relay" fires, "stadium_entrance_door_killtrigger"
		// is Enabled with 1 second delay and Disabled with 5 second delay. This is a
		// trigger_multiple that is not filtered and will delete players standing in it.
		// It uses model "*61" and "spawnflags 3" (Client/bots + NPC/Commons) and has
		// "allowincap 0" with "allowghost 0". Its "OnStartTouch" fires !activator Kill.

		// "Disconnect: Kicked by Console : CBaseEntity::InputKill()" is the exact kick
		// message. The replacement is named the same to use existing I/O. We don't want
		// to damage Ghost Infected since they can simply tap E. Cloning is required as
		// the original is massive and irregularly shaped. Beyond damaging the player to
		// kill them, Director would de-spawn Commons anyway so trigger is still overkill.
		// In the mapper's defense, "SetHealth 0" doesn't work with "infected" entities.

		local hndBadTrigger = Entities.FindByName( null, "stadium_entrance_door_killtrigger" );

		if ( SafelyExists( hndBadTrigger ) )
		{
			local strModel = hndBadTrigger.GetModelName();

			if ( IsModelPrecached( strModel ) )
			{
				SpawnEntityFromTable( "trigger_hurt",
				{
					targetname	=	"stadium_entrance_door_killtrigger",
					model		=	strModel,
					StartDisabled	=	1,
					spawnflags	=	3,
					nodmgforce	=	1,
					damage		=	10000,
					damagecap	=	10000,
					origin		=	Vector( -3920, 3152, -192 )
				} );
			}
		}

		kill_entity( hndBadTrigger );

		break;
	}

	case "c3m4_plantation":
	{
		// FIX: Finale "empty spawn area set" dynamic "z_finale_spawn_mob_safety_range".

		break;
	}

	case "c10m5_houseboat":
	{
		// FIX: Finale "empty spawn area set" dynamic "z_finale_spawn_mob_safety_range".

		break;
	}

	case "c11m5_runway":
	{
		// FIX: Finale "empty spawn area set" dynamic "z_finale_spawn_mob_safety_range".

		break;
	}

	case "c12m4_barn":
	{
		// FIX: Prevent skipping bridge horde by forcing it even if fence is jumped.

		con_comment( "TRIG:\tNew trigger will enforce onslaught even if fence is jumped." );

		// Make blockers to (temporarily) prevent train car commonhop skip.

		make_clip( "_eventskip_commonhopa", "Survivors", 1, "-70 -260 0", "70 300 1700", "10548 -4639 66", "0 -60 0" );
		make_clip( "_eventskip_commonhopb", "Survivors", 1, "-70 -380 0", "70 290 1653", "10125 -4780 113", "0 -45 0" );

		// Create new trigger to enforce onslaught even if Survivors alternatively jump fence.

		SpawnEntityFromTable( "trigger_once",
		{
			targetname	= g_UpdateName + "_eventskip_fence_trigonce",
			StartDisabled	= 0,
			spawnflags	= 1,
			filtername	= "anv_globalfixes_filter_survivor",
			origin		= Vector( 10553, -3506, -452 )
		} );

		EntFire( g_UpdateName + "_eventskip_fence_trigonce", "AddOutput", "mins -8 -216 0" );
		EntFire( g_UpdateName + "_eventskip_fence_trigonce", "AddOutput", "maxs 8 145 365" );
		EntFire( g_UpdateName + "_eventskip_fence_trigonce", "AddOutput", "solid 2" );

		// Inject I/O into original trigger_once (at the normal window path) to delete the
		// blockers and also delete the (then-redundant) new trigger_once. If new trigger
		// is touched first then delete original. New trigger deletes the blockers. Note that
		// original uses "OnTrigger" instead of "OnStartTouch".

		EntFire( "window_trigger", "AddOutput", "OnTrigger anv_mapfixes_eventskip_commonhop*:Kill::0:-1" );
		EntFire( "window_trigger", "AddOutput", "OnTrigger anv_mapfixes_eventskip_fence_trigonce:Kill::0:-1" );

		EntFire( g_UpdateName + "_eventskip_fence_trigonce", "AddOutput", "OnTrigger anv_mapfixes_eventskip_commonhop*:Kill::0:-1" );
		EntFire( g_UpdateName + "_eventskip_fence_trigonce", "AddOutput", "OnTrigger window_trigger:Kill::0:-1" );

		// Replicate the original trigger_once's "OnTrigger" Outputs to the new trigger.

		EntFire( g_UpdateName + "_eventskip_fence_trigonce", "AddOutput", "OnTrigger director:EndScript::0:-1" );
		EntFire( g_UpdateName + "_eventskip_fence_trigonce", "AddOutput", "OnTrigger zombie_spawn_relay:Trigger::1:-1" );
		EntFire( g_UpdateName + "_eventskip_fence_trigonce", "AddOutput", "OnTrigger onslaught:GenerateGameEvent::1:-1" );
		EntFire( g_UpdateName + "_eventskip_fence_trigonce", "AddOutput", "OnTrigger director:BeginScript:c12m4_onslaught:1.5:-1" );

		break;
	}

	case "c12m5_cornfield":
	{
		// FIX: Finale "empty spawn area set" dynamic "z_finale_spawn_mob_safety_range".

		break;
	}

	case "c13m3_memorialbridge":
	{
		// FIX: Prevent using water (or ladder) as a cushion to shortcut jump off bridge.

		// Un-patch for Coop because this isn't an out of bounds or softlock.

			if ( g_BaseMode == "coop" || g_BaseMode == "realism" ) { break; }

		// Between you and me, I almost accidentally insta-killed all Survivalists.

			if ( g_BaseMode == "survival" ) { break; }

		con_comment( "TRIG:\tAnti-shortcut \"_watercushion_trigonce\" deletes trighurt at stair descent." );

		make_trighurt( "_watercushion_trighurt", "Survivor", "-2470 -1486 -128", "480 858 32", "2441 -4194 270" );

		SpawnEntityFromTable( "trigger_once",
		{
			targetname	= g_UpdateName + "_watercushion_trigonce",
			StartDisabled	= 0,
			spawnflags	= 1,
			filtername	= "anv_globalfixes_filter_survivor",
			origin		= Vector( 912, -4537, 575 )
		} );

		EntFire( g_UpdateName + "_watercushion_trigonce", "AddOutput", "mins -148 -103 -319" );
		EntFire( g_UpdateName + "_watercushion_trigonce", "AddOutput", "maxs 139 985 401" );
		EntFire( g_UpdateName + "_watercushion_trigonce", "AddOutput", "solid 2" );

		EntFire( g_UpdateName + "_watercushion_trigonce", "AddOutput", "OnStartTouch anv_mapfixes_watercushion_trighurt:Kill::0:-1" );

		break;
	}
}