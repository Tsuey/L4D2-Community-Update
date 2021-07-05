printl( "VSCRIPT: Running mapspawn.nut" );

/*****************************************************************************
**  This file declares entity creation and modification functions then never
**  runs again -- until the next map load.
**
**  Originally an info_target for round persistence was used since that entity
**  wasn't lost between rounds, but Beta fixes disallowed this so "worldspawn"
**  instead runs the file which doesn't respawn either and can maintain scope
**  forever so anv_mapfixes.nut's "round_start" GameEvent runs infinite times.
**  Note that for some maps, "worldspawn" has even more scripts loaded into
**  its scope which is perfectly OK as they're all flushed on map transition.
**
**  Kerry also simplified other tasks with GetGameModeBase() which originally
**  required an info_gamemode, and GetMapName() which required a func_orator
**  hack, all stored into convenient global variables here.
**
**  See anv_mapfixes.nut for the actual map fixes. Community Credits at:
**
**	Community Servers/Groups  ->  Dev Thread: Map fixes for Valve
**	https://steamcommunity.com/app/550/discussions/1/1651043320659915818/
**
**	Help us shape the potential future of L4D2 vanilla.
**	https://github.com/Tsuey/L4D2-Community-Update
**
**	Community Update Testing Initiative (Workshop mirror)
**	https://steamcommunity.com/sharedfiles/filedetails/?id=1959405608
**
**  This work is dedicated to two lost brothers and all those tragically lost
**  in these horrific times of COVID-19. Somehow we'll survive together.
*****************************************************************************/

////////////////////////////////
// Omnipresent global variables.
////////////////////////////////

// Map load command sensitivity and mission file discrepancies require tolower().

g_MapName	<- Director.GetMapName().tolower();
g_MutaMode	<- Director.GetGameMode();
g_BaseMode	<- Director.GetGameModeBase();

g_Chapter	<- null;		// Stores each "friendly" mapname
g_UpdateName	<- "anv_mapfixes";	// Prefix "anv_mapfixes" to all targetnames
g_UpdateRanOnce	<- null;		// Run special code only once outside of mapspawn.nut

///////////////////////////////////////////////////////////
// Mandatory includes which seamlessly extend mapspawn.nut.
///////////////////////////////////////////////////////////

IncludeScript( "anv_functions" );	// Entity creation, modification and debug functions

///////////////////////////////////////////////////////////
// RunScriptFile the map fixes with round-persistent scope.
///////////////////////////////////////////////////////////

EntFire( "worldspawn", "RunScriptFile", "anv_mapfixes" );

/////////////////////////////////////////////////////////////////////////////////
// DEVELOPER ONLY: Load "script ShowUpdate()" functions to visualize all updates.
/////////////////////////////////////////////////////////////////////////////////

if ( developer() > 0 && Convars.GetStr( "sv_cheats" ) == "1" )
{
	// Allows use of ShowUpdate() in a bind whereas RunScriptFile lacks scope.

	IncludeScript( "z_developer_showupdate" );
}

/*****************************************************************************
**  Apply new infodecals to the world immediately to persist player rejoins
**  to the server. If "Late precache of" logs at all even if on some maps it
**  still produces the decal, it's too late -- any efforts with RunScriptFile
**  and especially "round_start" will all fail. An example of decals that
**  persist forever are No Mercy 5's wall outlets. Infected breakwalls across
**  several maps have unfixable decals given engine constraints.
**
**  All of these provide visual support for new Infected ladders.
*****************************************************************************/

switch( g_MapName )
{
	case "c1m3_mall":
	{
		make_decal( "decals/vent01",			"1279 -2411 280" );

		break;
	}

	case "c4m1_milltown_a":
	{
		make_decal( "decals/rollermine_crater",		"-5671 6579 225" );

		break;
	}

	case "c4m5_milltown_escape":
	{
		make_decal( "decals/rollermine_crater",		"-5671 6579 225" );

		break;
	}

	case "c8m5_rooftop":
	{
		make_decal( "decals/decalstain002a",		"6480 8794 6161" );
		make_decal( "decals/prodconcrete05",		"7281 8960 6191" );
		make_decal( "decals/debris_concrete001a",	"7283 8926 6088" );
		make_decal( "decals/prodconcrete04",		"5942 9424 5983" );
		make_decal( "decals/infstains",			"6188 7616 5967" );

		break;
	}
}