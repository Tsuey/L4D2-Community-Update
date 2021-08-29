///////////////////////////////////////////////////////////////////////////////
// Scriptedmode.nut 
//  this holds the "control logic" for all scriptmodes, and loads up the Mode 
//  and Map specific subscripts thus it has various initialization, 
//  default/override table merging, and a "root" manager class
///////////////////////////////////////////////////////////////////////////////

//=========================================================
// remedial little debug system - set this to 1 or 2 for warnings, or verbose feedback
// though only is systems that participate/used this call, which isnt many
smDebug <- 0

// the basic print
function smDbgPrint( string )
{
	if ( smDebug )
		printl( "scriptedmode: " + string )
}

// a loud/extra verbose print
function smDbgLoud( string )
{
	if ( smDebug == 2 )
		printl( "scriptedmode: " + string )
}

//-------------------------------------
// this is merged with any mode or map specific info to become DirectorOptions
//-------------------------------------
BaseScriptedDOTable <-
{
	ScriptedStageType = STAGE_NONE
	ScriptedStageValue = 1000
	SpawnSetRule = SPAWN_SURVIVORS
	SpawnDirectionCount = 0
	SpawnDirectionMask = 0
}

//---------------------------------------------------------
// For AllowTakeDamage() - this table (filled in) will be passed to you - return false to ignore damage.
// You are welcome to change DamageDone and DamageType if you'd like, but other changes will be ignored
//---------------------------------------------------------
ScriptedDamageInfo <-
{
	Attacker = null				// hscript of the entity that attacked
	Victim = null				// hscript of the entity that was hit
	Inflictor = null			// hscript of the entity that was the inflictor
	DamageDone = 0				// how much damage done
	DamageType = -1				// of what type
	Location = Vector(0,0,0)	// where
	Weapon = null				// by what - often Null (say if attacker was a common)
}

//=========================================================
// called from C++ when you try and kick off a mode to 
// decide whether scriptmode wants to handle it
//=========================================================
function ScriptMode_Init( modename, mapname )
{
	ClearGameEventCallbacks()
	
	::g_RoundState <- {}
	::g_MapScript <- getroottable().DirectorScript.MapScript
	::g_ModeScript <- getroottable().DirectorScript.MapScript.ChallengeScript
	
	// Just for convenience, so we don't have to keep checking if it's there
	if ( !("MapState" in g_MapScript) )
	{
		g_MapScript.MapState <- {}
	}
	
	IncludeScript( "sm_utilities", g_MapScript )  // so we have constants and such when we load the map...
	IncludeScript( "sm_spawn", g_MapScript )      // and the spawning system
	
	if ( "CommunityUpdate" in getroottable() )
	{
		CommunityUpdate().OnScriptMode_Init()
	}

	// printl("In scripted Init, gonna try with for map " + mapname + " in mode " + modename )
	
	local bScriptedModeValid = false
	
	if ( IncludeScript( modename, g_ModeScript ) )
	{
		printl( "ScriptMode loaded " + modename + " and now Initializing" )
		
		IncludeScript( mapname + "_" + modename, g_MapScript )

		// Add to the spawn array
		MergeSessionSpawnTables()
		MergeSessionStateTables()

		SessionState.MapName <- mapname
		SessionState.ModeName <- modename

		// If not specified, start active by default
		if ( !( "StartActive" in SessionState ) )
		{
			SessionState.StartActive <- true
		}

		if ( SessionState.StartActive )
		{
			MergeSessionOptionTables()
		}
		
		// Sanitize the map
		if ( "SanitizeTable" in this )
		{
			SanitizeMap( SanitizeTable )
		}

		bScriptedModeValid = true;
	}
	
	if ( !bScriptedModeValid )
		return false
		
	if ( "SessionSpawns" in getroottable() )
	{
		EntSpawn_DoIncludes( ::SessionSpawns )
	}

	// include all helper stuff before building the help
	IncludeScript( "sm_stages", g_MapScript )

	// check for any scripthelp_<funcname> strings and create help entries for them
	AddToScriptHelp( getroottable() )   
	AddToScriptHelp( g_MapScript )    
	AddToScriptHelp( g_ModeScript )
	
	// go ahead and call all the precache elements - the MapSpawn table ones then any explicit OnPrecache's
	ScriptedPrecache()
	ScriptMode_SystemCall("Precache")

	return true
}

// Make a call to MapScript and ModeScript, returns whether any calls were made
// NOTE: sadly only does no-argument calls - which makes this way less useful
scripthelp_ScriptMode_SystemCall <- "Makes the passed in call to g_MapScript and g_ModeScript, but it must have Zero args"
function ScriptMode_SystemCall( callname )
{
	local calls = 0
	if ( callname in g_MapScript )   // do we allow returning False to say "dont call Mode"? ugh...
	{
		g_MapScript[callname]()
		calls++
	}
	if ( callname in g_ModeScript )
	{
		g_ModeScript[callname]()
		calls++
	}
	return calls > 0
}

//=========================================================
// this is called from C++ when the gameplay start happens
//=========================================================
function ScriptMode_OnGameplayStart( modename, mapname )
{
	if ( "SessionSpawns" in getroottable() )
		EntSpawn_DoTheSpawns( ::SessionSpawns )
	ScriptMode_SystemCall("OnGameplayStart")
	return SessionState.StartActive
}

//=========================================================
// this is called from C++ when the mode activates
//=========================================================
function ScriptMode_OnActivate( modename, mapname )
{
	if ( g_ModeScript == null )
	{
		// Need to reload the mode script
		// TODO: Should know exactly which script we want to load here
		
		g_ModeScript = getroottable().DirectorScript.MapScript.ChallengeScript

		if ( IncludeScript( modename, g_ModeScript ) )
		{
			printl( "ScriptMode loaded " + modename + " and now Initializing" )
		}
	}
		
	if ( !SessionState.StartActive )
	{
		MergeSessionOptionTables()
	}

	if ( "SetupModeHUD" in g_ModeScript )
	{
		g_ModeScript.SetupModeHUD()
	}

	ScriptMode_SystemCall("OnActivate")
}

//=========================================================
// called as the mutation shuts down
//=========================================================
function ScriptMode_OnShutdown( reason, nextmap )
{
	SessionState.ShutdownReason <- reason
	SessionState.NextMap <- nextmap
	ScriptMode_SystemCall( "OnShutdown" )
	g_ModeScript = null
}

//=========================================================
// Called by RR system to add any global criteria to queries based on mode or map state 
//=========================================================
function ScriptMode_AddCriteria( )
{   // @todo: is there a varargs for syscall? - if so swap this to a syscall
	local criteria = {}
	if ( "AddCriteria" in g_ModeScript)   // does this break and falsely delegate
		g_ModeScript.AddCriteria( criteria )
	if ( "AddCriteria" in g_MapScript)
		g_MapScript.AddCriteria( criteria )
	return criteria
}

//=========================================================
// this is for the fake "Event" style intra-script communication - so it really is just a wrapped call
//=========================================================
function FireEvent( eventname )
{   // yea, this is kinda weird - due to legacy really
	ScriptMode_SystemCall(eventname)
}

//=========================================================
// Session level table merging - so our Mode and Map configuration can be queried in a unified way
//   For State and Options, the base is merged into the Mode, then Map last, so Map value "wins"
//   For Spawn tables we do the opposit (@todo Why?)
// Then in all 3 cases we then set a global ::Session<thing> variable for unified access
//=========================================================
function MergeSessionSpawnTables()
{
	AddDefaultsToArray( "ModeSpawns", g_ModeScript, "MapSpawns", g_MapScript )
	::SessionSpawns <- g_MapScript.MapSpawns
}	

function MergeSessionStateTables()
{
	AddDefaultsToTable( "MapState", g_MapScript, "MutationState", g_ModeScript )
	::SessionState <- g_ModeScript.MutationState
}

function MergeSessionOptionTables()
{	
	AddDefaultsToTable( "BaseScriptedDOTable", this, "DirectorOptions", g_ModeScript )
	AddDefaultsToTable( "MutationOptions", g_ModeScript, "DirectorOptions", g_ModeScript )
	AddDefaultsToTable( "MapOptions", g_MapScript, "DirectorOptions", g_ModeScript )
	::SessionOptions <- g_ModeScript.DirectorOptions    
}

///////////////////////////////////////////////////////////////////////////////
//
// tick support via the "SlowPoll" 
//   - allowing you to get an occasional persistent callback from C++ 
//   - keeps a list from which you can add and remove your own SlowPolls
//
// the "system" is remedial, just keeps a list, checks time delta, calls the list
// and updates last call time - nothing too fancy
//
///////////////////////////////////////////////////////////////////////////////

scriptedModeLastSlowPoll <- 0
scriptedModeUpdateFuncs <- []
scriptedModeSlowPollFuncs <- []
scriptedModeSlowPollInterval <- 3
scriptedNextUpdateCalls <- []

//=========================================================
// called from C++ on the main script update clock
function Update()
{
	local frame = GetFrameCount()
	local defer = []
	foreach (idx, val in scriptedNextUpdateCalls)
	{
		if (val.frame < frame )
			val.func()
		else
			defer.append(val)
	}
	scriptedNextUpdateCalls = defer

	foreach (idx, val in scriptedModeUpdateFuncs)
		val()

	if ( Time() - scriptedModeLastSlowPoll > scriptedModeSlowPollInterval )
	{
		foreach (idx, val in scriptedModeSlowPollFuncs)
			val()
		scriptedModeLastSlowPoll += scriptedModeSlowPollInterval
	}
}

scripthelp_ScriptedMode_CallNextUpdate <- "Pass a lambda to this, it will get called once as part of next Update, for doing something 'soon but not now'"
function ScriptedMode_CallNextUpdate( callnext )
{
	scriptedNextUpdateCalls.append( { frame = GetFrameCount(), func = callnext } )
}

//=========================================================
// Adds a function to the update list
function ScriptedMode_AddUpdate( updateFunc )
{
	scriptedModeUpdateFuncs.append( updateFunc )
}

//=========================================================
// Adds a function to the slowpoll list
function ScriptedMode_AddSlowPoll( updateFunc )
{
	if (!scriptedModeSlowPollFuncs.find(updateFunc))
		scriptedModeSlowPollFuncs.append( updateFunc )
	else
		printl("You already have a SlowPoll for " + updateFunc.tostring())
}

//=========================================================
// Removes a function from the update list
function ScriptedMode_RemoveUpdate( updateFunc )
{
	local idx = scriptedModeUpdateFuncs.find( updateFunc )
	if (idx == null)
		return false
	scriptedModeUpdateFuncs.remove( idx )		
	return true
}

//=========================================================
// removes a function from the slowpoll list
function ScriptedMode_RemoveSlowPoll( updateFunc )
{
	local idx = scriptedModeSlowPollFuncs.find( updateFunc )
	if (idx == null)
		return false
	scriptedModeSlowPollFuncs.remove( idx )
	return true
}

///////////////////////////////////////////////////////////////////////////////
//
// called by C++ to update the HUD table - i.e. run any data functions, etc
// WARNING: this is called quite often, dont be silly in what you do in your closures/updates!
//
///////////////////////////////////////////////////////////////////////////////
function UpdateHUDTable( hudTable )
{
	if ("PreCallback" in hudTable)  // so you can put a custom callback to make before any hud setup
		hudTable.PreCallback()
	foreach (key, val in hudTable.Fields)
		if ("datafunc" in val)
			val.dataval <- val.datafunc();
	if ("PostCallback" in hudTable)  // so you can put a custom 
		hudTable.PostCallback()
}

/////////////////////////
// Misc Helper

_entHelper <- function ( ent, funcname )
{
	if (ent == null)
		printl("No entity!")
	else
	{
		if (typeof(funcname) == "function")
		{
			funcname(ent)
		}
		else if (typeof(funcname) == "string")
		{
			if (funcname in ent)
				ent[funcname]()
			else if (funcname in g_ModeScript)
				g_ModeScript[funcname](ent)
			else if (funcname in g_MapScript)
				g_MapScript[funcname](ent)
			else
				printl("No " + funcname + " in " + ent.GetName() + " or in map/mode script either")
		}
		else
			printl("Need to pass a string of a function name or a lambda function, not a " + typeof(funcname))
	}
}

scripthelp_Ent <- "Takes an entity index name or classname, calls the passed function name on all that match"
::EntCall <- function ( idxorname, funcname )
{
	local hEnt = null

	if ( typeof(idxorname) == "string" )
	{
		local foundany = false
		while ( hEnt = Entities.FindByName( hEnt, idxorname ) )
		{
			foundany = true
			g_ModeScript._entHelper( hEnt, funcname )
		}
		if (!foundany)
		{
			while ( hEnt = Entities.FindByClassname( hEnt, idxorname ) )
			{
				foundany = true
				g_ModeScript._entHelper( hEnt, funcname )
			}
		}
		if (!foundany)
			printl("Never saw anything that matched " + idxorname )
	}
	else if ( typeof(idxorname) == "integer" )
	{
		hEnt = EntIndexToHScript( idxorname )
		g_ModeScript._entHelper( hEnt, funcname )
	}
}

scripthelp_Ent <- "Takes an entity index or name, returns the entity"
::Ent <- function( idxorname )
{
	local hEnt = null
	if ( typeof(idxorname) == "string" )
		hEnt = Entities.FindByName( null, idxorname )
	else if ( typeof(idxorname) == "integer" )
		hEnt = EntIndexToHScript( idxorname )
	if (hEnt)
		return hEnt
	printl( "Hey! no entity for " + idxorname )
}