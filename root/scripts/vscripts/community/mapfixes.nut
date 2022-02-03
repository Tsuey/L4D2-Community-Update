printl( "VSCRIPT: Running mapfixes.nut" );

local s_CommunityUpdate =
{
	m_bCancelUpdates = false,
	m_bMapChangesApplied = false,
	m_iTankCount = 0,

	m_UserScript = null,
	m_UserMapScript = null,
	m_MapScript = null,

	// Interface methods.
	function PrefixName( name = "" )
	{
		return format( "%s_%s", g_UpdateName, name );
	}
	
	function CancelUpdate()
	{
		m_bCancelUpdates = true;
	}

	// Utility/Helper methods.
	function InvokeScopedMethod( name, ... )
	{
		vargv.insert( 0, this );

		local numCalls = 0;
		foreach ( scope in [ m_MapScript, m_UserScript, m_UserMapScript ] )
		{
			// NOTE: Using raw* with delegated scopes - don't want to fallthrough to delegates.
			if ( !scope.rawin( name ) )
			{
				continue;
			}
			
			local fn = scope.rawget( name );
			if ( typeof( fn ) != "function" )
			{
				continue;
			}
			
			vargv[0] = scope;
			
			try
			{
				fn.acall( vargv );
				
				numCalls ++;
			}
			catch ( message ); // TODO: Handle exception.
		}
		
		return numCalls;
	}

	// Doesn't throw in case of include errors.
	function IncludeScriptSafe( path, scope )
	{
		try
		{
			local ret = DoIncludeScript( path, scope );
			scope.m_bLoaded <- ret;
			
			return ret;
		}
		catch ( message ); // TODO: Handle exception.
		
		scope.m_bLoaded <- false;
		
		return false;
	}

	// Simple wrapper allowing to listen for individual events on same scope.
	function ListenForGameEvent( eventName )
	{
		if ( !( "GameEventCallbacks" in getroottable() ) )
		{
			::GameEventCallbacks <- {};
		}
		
		local events = ::GameEventCallbacks;
		if ( !( eventName in events ) )
		{
			// First time we've seen this event: Make an array for callbacks and
			// tell the game engine's listener we want to be notified.
			events[eventName] <- [];
			RegisterScriptGameEventListener( eventName );
		}
		else if ( events[eventName].find( this ) != null )
		{
			// Don't add duplicates.
			return;
		}
		
		events[eventName].append( this.weakref() );
	}

	// Loads map/user scripts as early as possible for them to be able to cancel update changes.
	function Construct()
	{
		// Set up delegation, so derived scripts may use base script scopes.
		m_MapScript = {};
		m_MapScript.setdelegate( this );
		
		m_UserScript = {};
		m_UserScript.setdelegate( m_MapScript );

		m_UserMapScript = {};
		m_UserMapScript.setdelegate( m_UserScript );
		
		IncludeScriptSafe( format( "community/maps/%s", g_MapName ), m_MapScript );
		IncludeScriptSafe( "community/usercustom", m_UserScript );
		IncludeScriptSafe( format( "community/usercustom/%s", g_MapName ), m_UserMapScript );
	}

	function OnGameEvent_round_start( params )
	{
		if ( m_bCancelUpdates )
		{
			return;
		}
		
		ApplyMapChanges();
		ApplyRoundChanges();
	}

	function OnGameEvent_tank_spawn( params )
	{
		if ( !( "tankid" in params ) )
		{
			return;
		}
		
		local hndTank = EntIndexToHScript( params["tankid"] );
		m_iTankCount++;

		if ( m_iTankCount == 1 )
		{
			// Only runs in versus mode, excludes TAAANNKK mutation
			// Teleports tanks which spawn in problematic areas to more reasonable locations
			// AI Tank is teleported instantly and angles are not set to preserve Valve's randomness
			// Does not support maps with more than 1 tank spawn (ie finales) - but could in the future if necessary
			InvokeScopedMethod( "DoTankWarp", hndTank );
		}
	}

	// Check that the tank's position is within a set of coords [x(min), y(min), x(max), y(max)]
	function CheckToWarpTank( tank, coords )
	{
		local vPosition = tank.GetOrigin();

		return ( vPosition.x >= coords[0] && vPosition.x < coords[2] && vPosition.y >= coords[1] && vPosition.y < coords[3] );
	}

	// Invoked from ScriptMode_Init().
	function OnScriptMode_Init()
	{
		// Hook events now, after ScriptMode_Init has just cleared them.
		ListenForGameEvent( "round_start" );

		// Broadcast "before round_start but during ScriptMode_Init", when some things were already set.
		InvokeScopedMethod( "OnScriptMode_Init" );
	}

	// Functions that spawn in the map-specific fixes for any Mutation/Base mode.
	//
	// If highly specific Mutation fixes are to be applied, caution using "break;"
	// to ensure we're only patching that Mutation (i.e. VS Survival is "mutation15").
	//
	// This is run on every "round_start" GameEvent which guarantees map entities
	// will have already loaded in allowing for direct AddOutputs to modify logic.
	//
	// Elaborate fixes are put in separate files and RunScriptFile'd here.
	// Note that basemode "coop" does not include "realism", but if base "realism"
	// the player experience will always be equivalent to that of Coop -- so check
	// for both, and don't worry about "VS Realism" because that's base "versus".
	// Resolves issue with Versus-only fixes undesirably existing for Realism Coop.
	//
	// Speedy code goes in, speedy fix comes out.
	function ApplyMapChanges()
	{
		if ( m_bMapChangesApplied )
		{
			return;
		}
		
		InvokeScopedMethod( "DoMapSpawnFixes" );
		m_bMapChangesApplied = true;
	}

	function ApplyRoundChanges()
	{
		// Add reliably-named Survivor and Infected team filters to every map.
		// These are deleted if it's a "COMMUNITY" (unknown) map.
		// TODO: Creation of these should be deferred instead.
		SpawnGlobalFilters();

		// Only run if it's Versus and not Taaannnk!! Mutation. Instantly warps
		// Tanks that spawn unreasonably far away from Survivors or exposed.
		// Needs to run for both rounds or else both teams won't get warped.
		if ( g_BaseMode == "versus" && g_MutaMode != "mutation19" )
		{
			m_iTankCount = 0;
			ListenForGameEvent( "tank_spawn" );
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
		
		if ( InvokeScopedMethod( "DoRoundFixes" ) == 0 )
		{
			// No fixes were applied, - delete the new Survivor/Infected activator
			// filters. Also skip DEVELOPER MODE function call and do nothing else.
			EntFire( "anv_globalfixes_filter_*", "Kill" );
			
			return;
		}

		// If "developer 1" map names are stamped to console, followed by information
		// about all the fixes applied. If "developer 0" let the user know the feature
		// exists but only print the line once per load session.
		devchap( "TUTORIAL" );
	}
};

// Exposed in form of function returning singleton.
// TODO: accept an optional argument-callback, forming a shorthand to
// listen for generic "init" event.
function CommunityUpdate()
{
	return s_CommunityUpdate;
}

s_CommunityUpdate.Construct();
