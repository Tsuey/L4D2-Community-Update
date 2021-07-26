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

local fixScriptTable = {};

IncludeScript( "anv_mapfixes/" + g_MapName, fixScriptTable );

if( "DoMapSpawnFixes" in fixScriptTable )
{
	fixScriptTable["DoMapSpawnFixes"]();
}