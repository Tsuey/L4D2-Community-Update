printl( "VSCRIPT: Running anv_mapfixes.nut" );

/*****************************************************************************
**  This file is RunScriptFile'd on "worldspawn" by mapspawn.nut and its function
**  for spawning in the map-specific fixes exists forever in its scope. Fixes
**  add or modify entities once per round, unlike mapspawn.nut which only runs
**  once per load session. This will be the most-updated file.
**
**  Originally a func_orator hack was required to get mapname from the Response
**  System with a new "GetQueryData" -- Kerry's C++ updates made all this easy.
*****************************************************************************/

// Deleted super hacky code. Thank you Kerry for making our lives so much better!

/*****************************************************************************
**  Game Event "player_connect_full" fires when a player has sent final message
**  in connection sequence. Infected ladder VSSM's exist narrowly before this
**  so in most cases InfectedLadders_Spawn() will complete instantly, but it's
**  still there as backup. Required because some maps like Dead Center 1 fire
**  the much-earlier "round_start" before this file has even loaded (and that
**  was regardless of mapspawn.nut run order and file sizes)!
**
**  A 3-state Boolean ensures only the first "player_connect_full" will spawn
**  in that round's entities, which then hands off all subsequent round entity
**  spawns to "round_start" -- Infected ladder VSSM's exist forever, as well.
**  While possible to spawn in new clips/props instantly, that's incompatible
**  with EntFire() on BSP-spawned entities -- of which delays ensure existence.
**  Hand-off was tested with spammy events like "player_entered_start_area".
**
**  There's minor SourceMod rumors that "player_connect_full" isn't 100% stable
**  given various bugged connection states, but it'll always fire for somebody.
**  Functions like patch_nav_obscured() rely on "g_UpdateRanOnce == false" to
**  only apply NAV changes once (which exist for all rounds) -- it's set "true"
**  at the end of this file with a one second delay for RunScriptFile cushion.
**  Last line needed as we're not already running as a Mutation in Scripted Mode.
*****************************************************************************/

function OnGameEvent_player_connect_full( params )
{
	if ( g_UpdateRanOnce == null )
	{
		g_UpdateRanOnce = false;

		Apply_Quadmode_Map_Specific_Fixes();
	}
}

function OnGameEvent_round_start( params )
{
	if ( g_UpdateRanOnce == true )
	{
		Apply_Quadmode_Map_Specific_Fixes();
	}
}

__CollectEventCallbacks( this, "OnGameEvent_", "GameEventCallbacks", RegisterScriptGameEventListener );

/*****************************************************************************
**  Function that spawns in the map-specific fixes for any Mutation/Base mode.
**
**  If highly specific Mutation fixes are to be applied, caution using "break;"
**  to ensure we're only patching that Mutation (i.e. VS Survival is "mutation15").
**
**  This is run on every "round_start" GameEvent which guarantees map entities
**  will have already loaded in allowing for direct AddOutputs to modify logic.
**  Elaborate fixes are put in separate files and RunScriptFile'd here.
**
**  Note that basemode "coop" does not include "realism", but if base "realism"
**  the player experience will always be equivalent to that of Coop -- so check
**  for both, and don't worry about "VS Realism" because that's base "versus".
**  Resolves issue with Versus-only fixes undesirably existing for Realism Coop.
**
**  Speedy code goes in, speedy fix comes out.
*****************************************************************************/

g_FixScriptTable <- {};

::Apply_Quadmode_Map_Specific_Fixes <- function()
{
	// Add reliably-named Survivor and Infected team filters to every map.
	// These are deleted if it's a "COMMUNITY" (unknown) map.

	SpawnGlobalFilters();

	// Only run if it's Versus and not Taaannnk!! Mutation. Instantly warps
	// Tanks that spawn unreasonably far away from Survivors or exposed.
	// Note this runs even for all "COMMUNITY" maps and other Mutations so
	// requires unique scope to not overwrite their "tank_spawn" events.
	// Needs to run for both rounds or else both teams won't get warped.

	if ( g_BaseMode == "versus" && g_MutaMode != "mutation19" )
	{
		EntFire( "worldspawn", "RunScriptFile", "anv_tankwarps" );
	}

	// If it's VS Survival (mutation15), delete new props that obstruct
	// Survivor movement since their play space is already limited. This
	// includes c2m5's hittable dumpsters, c3m3's hittable log, & c10m5's
	// LOS blocker props/clips/navblocks and its log/rock hittables.

	if ( g_MutaMode == "mutation15" )
	{
		EntFire( g_UpdateName + "_hittable_dump*",	"Kill", null, 0.1 );

		EntFire( g_UpdateName + "_hittable_fallentree",	"Kill", null, 0.1 );

		EntFire( g_UpdateName + "_rock*",		"Kill", null, 0.1 );
		EntFire( g_UpdateName + "_hittable_log",	"Kill", null, 0.1 );
		EntFire( g_UpdateName + "_hittable_rock",	"Kill", null, 0.1 );
	}

	// Map fixes for Valve.
	// Dev Thread: https://steamcommunity.com/app/550/discussions/1/1651043320659915818/

	// Fix forklifts so they can start obstructed but still be destroyed.

	local forklift = null;

	while ( forklift = Entities.FindByModel( forklift, "models/props/cs_assault/forklift.mdl" ) )
	{
		if ( forklift.IsValid() )
		{
			NetProps.SetPropInt( forklift, "m_iMinHealthDmg", 400 );
			NetProps.SetPropInt( forklift, "m_takedamage", 3 );
		}
	}

	if( !IncludeScript( "anv_mapfixes/" + g_MapName, g_FixScriptTable ) )
	{
		/*==============================
		||                            ||
		||         COMMUNITY          ||
		||                            ||
		==============================*/

		// If it's not a Valve map, delete the new Survivor/Infected activator
		// filters. Also skip DEVELOPER MODE function call and do nothing else.

		EntFire( "anv_globalfixes_filter_*", "Kill" );

		return;
	}

	// Now that we know it's a vanilla map, all of them will reach this code so
	// instead of calling these separately for each map, call both just once here.
	//
	// UPDATE: Ladders now spawn with vecMins/vecMaxs instead which doesn't require
	// any dynamic delay, and all Versus entities were moved to anv_versus.nut.
	//
	//	InfectedLadders_Spawn();
	//	InfectedHumEnts_Spawn();

	// If "developer 1" map names are stamped to console, followed by information
	// about all the fixes applied. If "developer 0" let the user know the feature
	// exists but only print the line once per load session.

	devchap( "TUTORIAL" );

	// We've run once so set mapspawn.nut's global variable to "true". This allows
	// anv_mapfixes.nut and other RunScriptFile'd *.nut's to only declare functions
	// once (outside of mapspawn.nut's natural doing so). Also to only patch NAV once.
	// If 0 second delay it'd be set "true" before switch-case RunScriptFile's ran.

	EntFire( "worldspawn", "RunScriptCode", "g_UpdateRanOnce = true", 1 );
}