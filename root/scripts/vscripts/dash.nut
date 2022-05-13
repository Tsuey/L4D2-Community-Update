////////////////////////////////
// "Dash" is another extended mutation demo mode to show some of the capabilities available in script
//
// the players must run near a sequence of waypoints (well, ok, lampposts) in order
// As they reach each one, we light up the next one, and also summon a new panic wave from the next locale
// Designers use the Entity Placement tool to lay down a sequence of waypoints
// Waypoint naming:
// If you name your waypoints sequentially, e.g., waypoint_001, waypoint_002 flagpole waypoints will be used.
// See scripted_c5m2_park_dash.nut, c5m2_park_entities_dash.txt for an example.
//
// If you prefix your waypoints with "short_" e.g., short_waypoint_001, short_waypoint_002, then shorter
// waypoints will be used.
// See scripted_c5m4_quarter_dash.nut, c5m4_quarter_entities_dash.txt for an example.
//
// When survivors reach the final waypoint, we do a TANK wave, and they get a final time based on when they finish
// 
// The waypoint itself has a fairly big script to detect nearby players, and track which ones have reached it
//   as well as to trigger visual indications of progress, and "waypoint finished" calls back to this script
// And this script on startup has to sort the waypoints to make the in-order list

// printl(" Loading Dash mode")

MutationOptions <-
{   
	// since we are going to move the spawn point to "ahead" on the track as we hit waypoints
	PreferredMobDirection = SPAWN_NEAR_POSITION
	PreferredMobPositionRange = 600

	// we should change this to zero
	PreferredMobPosition = Vector( 0,0,0 )

	SpawnSetRule = SPAWN_POSITIONAL
	SpawnSetRadius = 2000
	SpawnSetPosition = Vector( -7150, -3647, -97 )

	WanderingZombieDensityModifier = 0 // get rid of wanderers

	cm_ShouldEscortHumanPlayers = true
	cm_AggressiveSpecials = true

	BoomerLimit  = 0
	ChargerLimit = 0
	HunterLimit  = 0
	JockeyLimit  = 0
	SpitterLimit = 0
	SmokerLimit  = 0
	MaxSpecials  = 0
	CommonLimit  = 20
	MegaMobSize	 = 20
	TankLimit    = 0
	WitchLimit	 = 0

	function EndScriptedMode()
	{
		local finished = true;
		foreach ( val in g_RoundState.WaypointList )
		{
			if ( val.GetScriptScope().active == true )
			{
				finished = false
				break;
			}
		}

		if ( finished )
		{
			// Finished the course
			return 0 // SCENARIO_RESTART
		}
		else
		{
			return 1 // SCENARIO_SURVIVORS_DEAD
		}
	}

	/*  Not using this method anymore
	function GetScoreboardFilename( endreason )
	{
		switch ( endreason )
		{
			case 1:
				return "Resource/UI/scriptedmodeplaceholderlost.res"
			case 0:
				return "Resource/UI/scriptedmodeplaceholderwon.res"
			default:
				return "Resource/UI/scriptedmodeplaceholder.res"
		}
	}
	*/

	// challenge mode experiment - make sure old CM type stuff works fine in new mutation code
	cm_HeadshotOnly = false

	DefaultItems =
	[
		"weapon_rifle_m60",
		"weapon_pistol_magnum",
		"adrenaline",
		"pipe_bomb"
	]

	// Set characters up with default items
	function GetDefaultItem( idx )
	{
		if ( idx < DefaultItems.len() )
		{
			return DefaultItems[idx];
		}
		return 0;
	}	
}

// SessionState for this mode - mostly about the waypoint tracking/which on next/etc/etc
MutationState <-
{
	StartActive = true	
	CurrentWaypoint = 0
	FinalWaypoint = 0
	JustHitWaypoint = false
	YouWon = false
	FirstWaypointHit = false
	TimerWaypoint = 0   // for a soon to be written more flexible setup
	MobWaypoint = 0
	CommonIncrement = 0
}

// callback for waypoint generation - as we spawn each one we add it to the list
function SetWaypointCB( waypointObj, rarity )
{
	local waypointScr = waypointObj.GetScriptScope()
	waypointScr.myID <- g_ModeScript.MutationState.FinalWaypoint++

	
	// if we're using a custom list set the initial touch count on this waypoint
	if( "CustomWaypointList" in g_MapScript )
		waypointScr.initialTouchCount = g_MapScript.CustomWaypointList[ g_RoundState.WaypointList.len() ].startingTouchCount

	g_RoundState.WaypointList.append(waypointObj)
}

// the startbox needs a custom precache function if you are using it
function Precache()
{
	Startbox_Precache()
}

// called on startup - setup a few callbacks if they arent there
// and then go ahead and teleport players to start, spawn the startbox, activate first waypoint
function OnGameplayStart()
{
	CheckOrSetMapCallback( "MapOverrideOptions", @() false )
	CheckOrSetMapCallback( "MapGameplayStart", @() false )

	Scoring_LoadTable( SessionState.MapName, SessionState.ModeName )

	//teleport players to the start point
	if (!TeleportPlayersToStartPoints( "gamemode_playerstart" ) )
		printl(" ** TeleportPlayersToStartPoints: Spawn point count or player count incorrect! Verify that there are 4 of each.")

	// create a start box
	if ( !SpawnStartBox( "startbox_origin" ) )
	{
		printl("Note: SpawnStartBox() called but there is no startbox_origin in map.")
	}

	// If the map script supplies a CustomWaypointList of points spawn the entities in that order
	if( "CustomWaypointList" in g_MapScript )
	{
		SpawnCustomWaypointList()
	}
	else
	{
		// Spawn waypoints in order
		SortAndSpawnWaypointList()
	}

	if (g_RoundState.WaypointList.len() > 0)
	{
		EntFire( g_RoundState.WaypointList[0].GetName(), "StartGlowing" )
		EntFire( g_RoundState.WaypointList[0].GetName(), "fireuser1" )
		g_RoundState.WaypointList[0].GetScriptScope().active = true
		SessionOptions.PreferredMobPosition = g_RoundState.WaypointList[0].GetOrigin()
	}

	SessionOptions.ScriptedStageType = STAGE_SETUP
	SessionOptions.ScriptedStageValue = 1000

	MapGameplayStart()
}

//=========================================================
// Uses the CustomWaypointList defined in the map script to
// spawn waypoints.  The info_item_position entities are
// collected in the order they appear in the list and then
// the waypoints are spawned in that order.
//=========================================================
function SpawnCustomWaypointList()
{
	// collect the info_item_position entities into a list
	local currentEnt  = null
	local tempWaypointList = []

	foreach( idx, val in CustomWaypointList )
	{
		currentEnt = Entities.FindByName( null, val.targetName )
		
		// store the waypoint if we found it, otherwise complain
		if( currentEnt )
		{
			tempWaypointList.append( currentEnt )
		}
		else
		{
			printl( " ** Waypoint Spawn ERROR**  I can't find the waypoint named: " + val.targetName )
		}
	}

	SpawnWaypointList( tempWaypointList )
}

//=========================================================
// Collect all the info_item_position entities that are named 
// "short_waypoint_*" OR "waypoint_*", put them into a list
// and sort it by suffix.  This will allow us to spawn all
// the waypoints in order so they can know their touch order
//=========================================================
function SortAndSpawnWaypointList()
{
	local currentWaypoint = Entities.FindByClassname( null, "info_item_position" )
	local tempWaypointList = []

	while( currentWaypoint )
	{
		local name = currentWaypoint.GetName()
		if( ( name.find( "waypoint_" ) == 0 ) || ( name.find( "short_waypoint_" ) == 0 ) )
		{
			tempWaypointList.append( currentWaypoint )
		}

		currentWaypoint = Entities.FindByClassname( currentWaypoint, "info_item_position" )
	}

	// sort the list by suffix	
	tempWaypointList.sort(@(a,b) a.GetName().slice(-4) <=> b.GetName().slice(-4) )

	SpawnWaypointList( tempWaypointList )
}

//=========================================================
// Spawn the provided list of waypoints on their positions
//=========================================================
function SpawnWaypointList( list )
{
	local waypointGroup = g_MapScript.GetEntityGroup( "DashWaypoint" )
	local shortWaypointGroup = g_MapScript.GetEntityGroup( "DashWaypointShort" )

	// set callbacks
	shortWaypointGroup.SpawnTables[ "waypoint" ].PostPlaceCB <- SetWaypointCB
	waypointGroup.SpawnTables[ "waypoint" ].PostPlaceCB <- SetWaypointCB

	// spawn the waypoints	
	foreach( idx, ent in list )
	{
		// does our waypoint start with "short_"?  If so, it is a short waypoint! Spawn it.
		if( ent.GetName().find( "short_" ) == 0  )
		{
			SpawnSingleAt( shortWaypointGroup, ent.GetOrigin(), ent.GetAngles() )
		}
		else // assuming it must be a normal waypoint since it isn't "short_"
		{
			SpawnSingleAt( waypointGroup, ent.GetOrigin(), ent.GetAngles() )
		}
	}
}

function DashDisplayScores( )
{
	local final_time = HUDReadTimer(1)
	local score_strings = Scoring_AddScoreAndBuildStrings( Scoring_MakeName(), final_time )
	HUDPlace( HUD_TICKER, 0.32, 0.27, 0.36, 0.20 )
	HUDPlace( HUD_FAR_RIGHT, 0.28, 0.50, 0.44, 0.06 )
	HUDPlace( HUD_FAR_LEFT,  0.28, 0.58, 0.44, 0.06 )
	HUDPlace( HUD_LEFT_BOT,  0.28, 0.66, 0.44, 0.06 )
	HUDPlace( HUD_RIGHT_BOT, 0.28, 0.74, 0.44, 0.06 )
	local ticker_str = score_strings.yourtime
	if ("finish" in score_strings)
		ticker_str = ticker_str + "\n" + score_strings.finish
	ticker_str = ticker_str + "\nBest Times So Far"
	Ticker_SetBlink( false )   // or true if you came in first? hmmm....
	Ticker_NewStr( ticker_str, 120 )
	foreach (idx, val in score_strings.topscores)
	{
		local hudfield = "score"+(idx+1)
		DashHUD.Fields[hudfield].dataval = val
		DashHUD.Fields[hudfield].flags = DashHUD.Fields[hudfield].flags & ~HUD_FLAG_NOTVISIBLE
	}
	Scoring_SaveTable( SessionState.MapName, SessionState.ModeName )
}

// this array holds the waypoints in order, up to SessionState.FinalWaypoint (though really, could just use len() for safety?
g_RoundState.WaypointList <- []

// called at basically each waypoint via ForceNextStage - or when a PANIC ends we just go to a delay
function GetNextStage()
{
	smDbgPrint("GetNextStage called")

	if ( SessionState.YouWon )
	{
		smDbgPrint("Really winningz, going to rezultz, yo!")
		SessionOptions.ScriptedStageType = STAGE_RESULTS
		SessionOptions.ScriptedStageValue = 10
		DashDisplayScores()
	}
	else if ( SessionState.JustHitWaypoint && SessionState.FinalWaypoint > 0 )
	{	
		if ( !SessionState.FirstWaypointHit ) // could be start line, or waypoint 0
		{  // hit firstone, kick things off
			smDbgPrint("Hit First Waypoint!")
			SessionState.FirstWaypointHit = true
			HUDManageTimers( 1 , TIMER_COUNTUP, 0)   // generalize this?

			// calculate the number of common infected to add each time a waypoint is completed
			SessionState.CommonIncrement = (100 - SessionOptions.CommonLimit) / SessionState.FinalWaypoint
		}  
		
		if( !MapOverrideOptions() )
		{
			// really, do we need this? or can we just always do panic here else a delay???
			local PercentageComplete = SessionState.CurrentWaypoint * 1.0 / SessionState.FinalWaypoint
		
			SessionState.JustHitWaypoint = false
			SessionOptions.ScriptedStageType = STAGE_PANIC
			SessionOptions.ScriptedStageValue = 1
			foreach (val in SpecialNames)
			{
				local limit = RandomInt(1,3) + PercentageComplete * 3
				SessionOptions[val + "Limit"] = limit
			}
			SessionOptions.MaxSpecials = RandomInt(2,6) + PercentageComplete * 3
			if (SessionOptions.CommonLimit < 100)
				SessionOptions.CommonLimit += SessionState.CommonIncrement

			if (SessionOptions.MegaMobSize < 50 )
				SessionOptions.MegaMobSize += SessionState.CommonIncrement

			if (SessionState.CurrentWaypoint == SessionState.FinalWaypoint - 1 )
			{
				Ticker_NewStr("One gate to go!")
				SessionOptions.TankLimit = 1 // how do i force a tank from script?
				SessionOptions.ScriptedStageType = STAGE_ESCAPE  // i guess i do an escape stage
			}
			else // display some help text on the ticker
			{
				switch( SessionState.CurrentWaypoint )
				{
					case 1:
						Ticker_NewStr( "Each time you activate a new waypoint more infected will attack.", 15 )
						break
					
					case 2:
						Ticker_NewStr( "You cleared the waypoint! Here come more infected!", 15 )
						break
				}
			}
		}
	}
	else
	{
		SessionOptions.ScriptedStageType = STAGE_DELAY
		SessionOptions.ScriptedStageValue = 1000
		SessionOptions.MaxSpecials = 0
	}

	smDbgPrint("Dash setting Mode " + SessionOptions.ScriptedStageType + " val " + SessionOptions.ScriptedStageValue)

	// we also want to positionally spawn at the mob target - though really i'd like to do some distance/scale stuff, too
	SessionOptions.SpawnSetPosition = SessionOptions.PreferredMobPosition
}

// because call DWD is where we active/deactive the waypoints, we can just treat the start line as secret pre-waypoint
function SurvivorLeftStartBox()
{
	SessionState.JustHitWaypoint = true   // and since the main loop never looks up into the array, that is o.k.
	Director.ForceNextStage()
}

// each time a waypoint is hit this is called to get us moving forward
// i.e. we need to activate the next waypoint, see if it is the final one, track counts, and so on
function DashWaypointDone( id )
{
	smDbgPrint("Dash Waypoint finished! " + id)

	// sanity check!
	if ( id != SessionState.CurrentWaypoint )
		printl("Hey! you think you are done with waypoint " + id + " but current is " + SessionState.CurrentWaypoint )

	EntFire( g_RoundState.WaypointList[id].GetName(), "StopGlowing" )
	g_RoundState.WaypointList[id].GetScriptScope().active = false
	// printl( "Deactivated waypoint " + id )
	local next_id = ++SessionState.CurrentWaypoint
	if ( next_id >= SessionState.FinalWaypoint )
	{
		// printl("Youz da Winner, yo!")
		SessionState.CurrentWaypoint--   // for safety
		SessionState.YouWon = true

		// stop the clock
		HUDManageTimers( 1, TIMER_STOP, 0 )
	}
	else
	{
		EntFire( g_RoundState.WaypointList[next_id].GetName(), "StartGlowing" )
		EntFire( g_RoundState.WaypointList[next_id].GetName(), "fireuser1" )
		//printl("Moving on to next waypoint " + next_id )
		g_RoundState.WaypointList[next_id].GetScriptScope().active = true
		SessionOptions.PreferredMobPosition = g_RoundState.WaypointList[next_id].GetOrigin()
	}
	SessionState.JustHitWaypoint = true
	Director.ForceNextStage()
}

// add Criteria for the new Response Rule speech criteria system
// i.e. this is to add data to the RR table the characters use to choose statements
function AddCriteria( criteriaTable )
{
	criteriaTable.PercentComplete <- SessionState.FinalWaypoint > 0 ? (SessionState.CurrentWaypoint*1.0)/SessionState.FinalWaypoint : 0
//	printl("Dash AddCriteria added " + criteriaTable.PercentComplete)
}

//-------------------------------------------------------
// Include all entity group interfaces needed for this mode
//-------------------------------------------------------
IncludeScript( "entitygroups/dash_waypoint_group" )
IncludeScript( "entitygroups/dash_waypoint_short_group" )

DashHUD <- {}

// HUD setup/control - our HUD is pretty simple in dash
function SetupModeHUD( )
{
	DashHUD =
	{
		Fields = 
		{
			waypoint = { slot = HUD_RIGHT_TOP, name = "waypoint", staticstring = "Waypoint: ", datafunc = @() SessionState.CurrentWaypoint },
			timer    = { slot = HUD_LEFT_TOP, name = "timer", staticstring = "Time: ", special = HUD_SPECIAL_TIMER1 },

			// this is kinda a lie! we are really going to move these w/HUDPlace for displaying final scores!
			// we will move the Ticker down to be a "header" - then need 4 slots for top 4
			score1   = { slot = HUD_FAR_RIGHT, name = "score1", dataval = "Score1", flags = HUD_FLAG_NOTVISIBLE | HUD_FLAG_ALIGN_LEFT },
			score2   = { slot = HUD_FAR_LEFT,  name = "score2", dataval = "Score2", flags = HUD_FLAG_NOTVISIBLE | HUD_FLAG_ALIGN_LEFT },
			score3   = { slot = HUD_LEFT_BOT,  name = "score3", dataval = "Score3", flags = HUD_FLAG_NOTVISIBLE | HUD_FLAG_ALIGN_LEFT },
			score4   = { slot = HUD_RIGHT_BOT, name = "score4", dataval = "Score4", flags = HUD_FLAG_NOTVISIBLE | HUD_FLAG_ALIGN_LEFT },
		}
	}

	Ticker_AddToHud( DashHUD, "Hurry past the poles, go for a best time" )
	HUDSetLayout( DashHUD )
}
