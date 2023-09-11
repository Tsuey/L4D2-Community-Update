///////////////////////////////////////////////////////////////////////////////
// The Holdout game mode! Brought to you by the new Mutation system!
// A Holdout Is...
//   Mostly a demo of the new mutation system, but a game mode as well
//   A Continuous cycle of attack/cooldown/attack/cooldown
//   in code, implemented as 3 phases
//        PANIC - spawn some enemies around the players
//        CLEAROUT - wait until the enemies are (mostly) all gone
//        DELAY - a cooldown time before the next wave of enemies
// There are several "special behaviors" as this happens
//   The Escape wave can happen at a specified wave #, or as a result of in game action (timer running down, for instance)
//   There can be special events that take over based on the current Stage #

// This is a very Structured mode - it uses stagetables and other "helpers" in the mutation system
// You dont need to use these in your own mutations, though you are of course welcome to

// as a map, you should go implement the following functions, returning a "stageTable"
// or null to ignore
//   DoMapEventCheck()
//   DoMapSetup()
//   GetMapEscapeStage()
//   IsMapSpecificStage()    // dont like this! potential out of sync/parallel variables
//   GetMapSpecificStage()   //    maybe IsMap sets a "stageSpecific" that GetMap can use?
//   GetAttackStage()
//   GetMapClearoutStage()
//   GetMapDelayStage()
///////////////////////////////////////////////////////////////////////////////

//---------------------------------------------------------
// This is the SessionState - any non-director data all your session code wants to be able to look at
// So we hold data about what wave, some UI controls, and info about managing warnings
MutationState <-
{
	HUDWaveInfo = true           // do you want the Wave # in middle of UI
	HUDRescueTimer = false       // or would you rather have the rescue timer (cant have both)
	HUDTickerText = "Holdout as long as you can"
	RescueStarted = false
	RawStageNum = -1
	ForcedEscapeStage = -1
	ScriptedStageWave = 0
	CooldownEndWarningTime = 8.5 // seconds before end of cooldown to play warning
	CooldownEndWarningChance = 15 // percent chance to play warning
	CooldownEndWarningFrequency = 0 // how many waves to wait before playing another warning
	LastWaveCooldownWarningPlayed = -1 // the last wave that the cooldown warning played on
}

//---------------------------------------------------------
// the DirectorOptions defaults for Holdout - though the maps will override many of these per wave and phase
MutationOptions <-
{
	PreferredMobDirection = SPAWN_NO_PREFERENCE
	SpawnSetRule = SPAWN_ANYWHERE
	JournalString = ""
	SpecialInfectedAssault = false
	AllowWitchesInCheckpoints = true
	AllowCrescendoEvents = false
	EnforceFinaleNavSpawnRules = false
	IgnoreNavThreatAreas = true
	ZombieDiscardRange = 10000

	WanderingZombieDensityModifier = 0
	BoomerLimit  = 0
	ChargerLimit = 0
	HunterLimit  = 0
	JockeyLimit  = 0
	SpitterLimit = 0
	SmokerLimit  = 0
	MaxSpecials  = 0
	CommonLimit  = 20
	TankLimit    = 0
	MegaMobMaxSize = 100
	MegaMobMinSize = 75
	PanicWavePauseMax = 5
	PanicWavePauseMin = 1
	AddToSpawnTimer = 0
	ShouldAllowMobsWithTank = true
	ShouldAllowSpecialsWithTank = true
	ZombieSpawnRange = 800
	ZombieTankHealth = 6000 // SP default is 4000
	BileMobSize = 20
	EscapeSpawnTanks = true
	ZombieDontClear = true
	MegaMobSize = 50       // i have no idea why this defaults to not between min and max

	cm_ShouldEscortHumanPlayers = true
	cm_AggressiveSpecials = true
}

//=========================================================
// Utilities and helpers
//=========================================================

const PHASE_PANIC = 1
const PHASE_CLEAR = 2
const PHASE_DELAY = 0

function StageNumToWaveBase( stagenum )
{
	return (stagenum + 2) / 3   // the +2 is because of our initial startup raw phases...
}

function WaveBaseToStageNum( wavebase, substage = PHASE_DELAY )
{
	return wavebase * 3 + substage
}

// Are players permitted to pick up this object by pressing their USE key?
// return true for yes, false for no.
function CanPickupObject( object )
{
	// mines
	if ( object.GetName().find( "mine_1_body" ) )
	{
		return true
	}

	// resource drops
	if ( object.GetName().find( "prop_resource" ) )
	{
		return true
	}

	// check the map script for a PickupObject function for extra qualified items
	// TODO: we should do this more generally!
	local canPickup = false
	if( "PickupObject" in g_MapScript )
	{
		canPickup = g_MapScript.PickupObject( object )
	}

	return canPickup
}

// Called from other systems when they want the next combat wave to be the escape
function StartEscapeWave()
{
	SessionState.ForcedEscapeStage =  ( ( SessionState.RawStageNum + 2 ) / 3) * 3 + 1
	// printl( "Prepping Escape Wave for Stage " + SessionState.ForcedEscapeStage + " from " + SessionState.RawStageNum )
}

// show the final score and timing
function HoldoutDisplayScores( )
{
	local final_time = Time() - SessionState.RealStartTime
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
	Ticker_SetBlink( false )   // or true if you came in first?
	Ticker_NewStr( ticker_str, 120 )
	foreach (idx, val in score_strings.topscores)
	{
		local hudfield = "score"+(idx+1)
		HoldoutHUD.Fields[hudfield].dataval = val
		HoldoutHUD.Fields[hudfield].flags = HoldoutHUD.Fields[hudfield].flags & ~HUD_FLAG_NOTVISIBLE
	}
	Scoring_SaveTable( SessionState.MapName, SessionState.ModeName )
}

// if a chopper rescue, this is where we get called
function RescuedByCopter( )
{
	// for now
	HoldoutDisplayScores()
}

// @TODO - this is basically "dont shoot at mines" right? why is it here?
function BotQuery( queryflag, entity, defaultvalue )
{
	switch( queryflag )
	{
		case BOT_QUERY_NOTARGET:
		{
			local classname = entity.GetClassname()
			local targetname = entity.GetName()
			if ( targetname && targetname.find( "mine_1_body" ) )
			{
				return false;
			}
			return true;
		}
	}

	return defaultvalue;
}

//----------------------------------------------------
// Rather than checking every time to see if the map has defined each callback
// instead we are going to check for each callback on startup
//   if they arent there, we will insert a simple NOP lambda (if they are, we leave them)
// For what these callbacks do, check top of file where they are described
function OnGameplayStart()
{
	CheckOrSetMapCallback( "DoMapEventCheck", @() false )
	CheckOrSetMapCallback( "DoMapSetup", @() null)
	CheckOrSetMapCallback( "GetMapEscapeStage", @() null )
	CheckOrSetMapCallback( "IsMapSpecificStage", @() false )
	CheckOrSetMapCallback( "GetMapSpecificStage", @() null )
	CheckOrSetMapCallback( "GetAttackStage", @() null )
	CheckOrSetMapCallback( "GetMapClearoutStage", @() null )
	CheckOrSetMapCallback( "GetMapDelayStage", @() null )

	DoMapSetup()    // and then call the MapSpecific startup callback right away
}

//=========================================================
//=========================================================
function OnActivate()
{
	// @todo: put scoring back into holdout!
	Scoring_LoadTable( SessionState.MapName, SessionState.ModeName )

	// this is so we can do some non-wave-based thinking
	ScriptedMode_AddSlowPoll( HoldoutSlowPollUpdate )
}

//=========================================================
//=========================================================
function OnShutdown()
{
	ScriptedMode_RemoveSlowPoll( HoldoutSlowPollUpdate )
}

HoldoutHUD <- {}
//=========================================================
// since we have this mutation specific HUD but individual maps can use it differently
// it is a bit more complicated than a normal HUD Setup
// - use SessionState to tell the system which extra fields you want (Wave #, Timer, etc)
// - check and warn if you try to set conflicting fields
function SetupModeHUD()
{
	HoldoutHUD =
	{
		Fields =
		{
			cooldown_time = { slot = HUD_LEFT_TOP, name = "cooldown", special = HUD_SPECIAL_COOLDOWN, flags = HUD_FLAG_COUNTDOWN_WARN | HUD_FLAG_BEEP },
			supply        = { slot = HUD_RIGHT_TOP, name = "supply", staticstring = "Supplies: ", datafunc = @() g_MapScript.Resources.CurrentCount },

			// this is kinda a lie! we are really going to move these w/HUDPlace for displaying final scores!
			// we will move the Ticker down to be a "header" - then need 4 slots for top 4
			score1   = { slot = HUD_FAR_RIGHT, name = "score1", dataval = "Score1", flags = HUD_FLAG_NOTVISIBLE | HUD_FLAG_ALIGN_LEFT },
			score2   = { slot = HUD_FAR_LEFT,  name = "score2", dataval = "Score2", flags = HUD_FLAG_NOTVISIBLE | HUD_FLAG_ALIGN_LEFT },
			score3   = { slot = HUD_LEFT_BOT,  name = "score3", dataval = "Score3", flags = HUD_FLAG_NOTVISIBLE | HUD_FLAG_ALIGN_LEFT },
			score4   = { slot = HUD_RIGHT_BOT, name = "score4", dataval = "Score4", flags = HUD_FLAG_NOTVISIBLE | HUD_FLAG_ALIGN_LEFT },
		}
	}

	if ( "HUDRescueTimer" in SessionState && SessionState.HUDRescueTimer )
	{
		RescueTimer_Init( HoldoutHUD, HUD_MID_BOX, HUD_MID_BOT )
		if (SessionState.HUDWaveInfo)
			printl("Warning: Cannot have both Rescuetimer and Wave HUD elements at once");
	}
	else if ( "HUDWaveInfo" in SessionState && SessionState.HUDWaveInfo )
	{
		HoldoutHUD.Fields.wave <- {slot = HUD_MID_TOP, name = "wave", staticstring = "Wave: ", datafunc = @() SessionState.ScriptedStageWave }
	}

	if( "HUDTickerTimeout" in SessionState )
	{
		TickerTimeout = SessionState.HUDTickerTimeout
	}

	if ( "HUDTickerText" in SessionState )
	{
		if ( SessionState.HUDTickerText.len() > 0 )
		{
			Ticker_AddToHud( HoldoutHUD, SessionState.HUDTickerText )
		}
	}

	HUDSetLayout( HoldoutHUD );
}

//=========================================================
// The scripted mode calls this function each time the generator turns on.
// The generator usually turns on because someone poured a can of fuel into it.
//=========================================================
function OnGeneratorStart()
{
	g_MapScript.RescueTimer_Start()
}

//=========================================================
// Counterpart to OnGeneratorStart(), this is called when the generator sputters and stops
//  usually because it has run out of fuel.
//=========================================================
function OnGeneratorStop()
{
	g_MapScript.RescueTimer_Stop()
}

//=========================================================
// this is the base "system maintenance" for holdout mode timers and UI
// It checks things like has rescue started, should we do a warning about cooldown about to end, etc
//=========================================================
function HoldoutSlowPollUpdate()
{
	RescueTimer_Tick()

	if ( !SessionState.RescueStarted )
	{
		if ( "HUDRescueTimer" in SessionState && SessionState.HUDRescueTimer )
		{
			local seconds = g_MapScript.RescueTimer_Get()

			// start the rescue if the generator has run long enough
			if( seconds <= 0 )
			{
				SessionState.RescueStarted = true
				g_ModeScript.StartEscapeWave()
			}
		}
	}

	// CooldownEndWarningChance is the % chance that a random player will vocalize a warning
	// when a cooldown is close to ending
	if( "CooldownEndWarningChance" in SessionState )
	{
		local timeLeft = HUDReadTimer( HUD_SPECIAL_COOLDOWN )

		if ( ( timeLeft < SessionState.CooldownEndWarningTime ) && ( timeLeft > 0 ) && ( SessionState.LastWaveCooldownWarningPlayed + SessionState.CooldownEndWarningFrequency < SessionState.ScriptedStageWave ) )
		{
			SessionState.LastWaveCooldownWarningPlayed = SessionState.ScriptedStageWave

			// roll the dice...
			local chance = RandomInt(0, 100 )

			if( chance < SessionState.CooldownEndWarningChance )
			{
				// jackpot! collect the players into an array and select one at random to speak a line
				local playerEnt = null
				local playerArray = []

				while ( playerEnt = Entities.FindByClassname( playerEnt, "player" ) )
				{
					if (playerEnt.IsSurvivor() )
					{
						playerArray.append( playerEnt)
					}
				}

				local idx = RandomInt( 0, 3)

				if( idx < playerArray.len() )
				{
					// fire entity IO at "!activator" and pass the player ent as the activator
					EntFire( "!activator", "SpeakResponseConcept", "PlayerHurryUp", 0, playerArray[idx] )
				}
			}
		}
	}
}

function JournalFunc()
{
	DirectorOptions.JournalString = "{ resources = " + g_MapScript.Resources.CurrentCount
	if (SessionState.HUDRescueTimer)
		DirectorOptions.JournalString += ", rescue = " + RescueTimer_Get()
	if ("JournalMapFunc" in this)
		DirectorOptions.JournalString += JournalMapFunc()
	DirectorOptions.JournalString += " }"
}

//=========================================================
// A little digression of testing/demoing a "script based clearout"
//  You can just do C++ based clearout (to let the mob population clearout) of course
//  But from script, one can use a Poll function and GetInfectedStats to manage it yourself
//  See sm_utilities for the actual code/systems if you want to do something like it

// Whether to use the new Script based clearout or not - false here just means use the default c++ one
::g_ScriptClearout <- true

// if you are going to use the new clearout - here is the table for determining it's behavior
holdout_ClearoutTable <-
{
	commons = 2
	specials = 0
	tanks = 0
	witches = 0
	plateautime = 5
	plateaucommons = 5
	plateauspecials = 1
	stopspecials = true
}

///////////////////////////////////////////////////////////////////////////////
//
// "Main Loop" of Holdout
//
// GetNextStage gets called whenever the director finishes the last thing you told it to do
//   or if you do a ForceNextStage yourself
// In holdout, we use GetNextStage to manage the game, cycling through 3 types of Stage (as described at top)
// At each stage, we make some of our callbacks (that we checked and set up in OnGameplayStart)
// To determine what options we want for that stage - usually in the form of a "stagetable"
//   which is basically just a set of DirectorOptions parameters and a few extra fields
// And then we go and set all those fields in the director, set the stage type, and send the director off
//
///////////////////////////////////////////////////////////////////////////////

function GetNextStage()
{
	local use_stage = null

	local stageNum = ++SessionState.RawStageNum

	SessionState.ScriptedStageWave = ( stageNum + 2 ) / 3

	// first, special event management
	DoMapEventCheck()

	// fire game events as we begin and end cooldown states - initial map stage 0 is considered a cooldown state
	if( ( stageNum % 3 ) == PHASE_PANIC )
		FireScriptEvent( "on_cooldown_end", null )
	else if( ( ( stageNum % 3 ) == PHASE_DELAY ) || ( stageNum == 0 ) )
		FireScriptEvent( "on_cooldown_begin", null )

	// error check!
	if (SessionState.ForcedEscapeStage != -1 && stageNum > SessionState.ForcedEscapeStage)
		printl("Ummmmmm.... something has gone very wrong... we passed escape stage but are still picking next stages...");

	if ( stageNum == 1) // 1st real attack stage
	{
		SessionState.RealStartTime <- Time()
		Director.ResetSpecialTimers()
	}

	//  now the generalized stage sequencing...
	if ( stageNum == 0 )
	{
		DirectorOptions.ScriptedStageType = STAGE_SETUP
		if ("HUDTickerText" in SessionState)
			Ticker_NewStr(SessionState.HUDTickerText)  // since the time it got set as start in HUD load is ages ago
	}
	else if ( stageNum == SessionState.ForcedEscapeStage )
	{
		use_stage = GetMapEscapeStage()
	}
	else if ( IsMapSpecificStage() )
		use_stage = GetMapSpecificStage()   // dont like this! potential out of sync/parallel variables
	else if ( ( stageNum % 3 ) == PHASE_PANIC )
	{
		use_stage = GetAttackStage()
		if (::g_ScriptClearout)
			ClearoutNotifyPanicStart( holdout_ClearoutTable )
	}
	else if ( ( stageNum % 3 ) == PHASE_CLEAR )
	{
		if (::g_ScriptClearout)
		{
			ClearoutStart( holdout_ClearoutTable )
			DirectorOptions.ScriptedStageType = STAGE_DELAY
			DirectorOptions.ScriptedStageValue = -1	// Infinite
		}
		else
			use_stage = GetMapClearoutStage()
	}
	else if ( ( stageNum % 3 ) == PHASE_DELAY )
	{
		use_stage = GetMapDelayStage()
	}

	// Put the special infected into assault mode - really want to do this sooner somehow? at maxspecials 0?
	switch ( DirectorOptions.ScriptedStageType )
	{
		case STAGE_CLEAROUT:
		case STAGE_DELAY:
		case STAGE_ESCAPE:
			DirectorOptions.SpecialInfectedAssault = true
			break;
		default:
			DirectorOptions.SpecialInfectedAssault = false
	}

	if ( use_stage != null )
	{
		if ( "stageDefaults" in g_MapScript )
			StageInfo_Execute( use_stage, stageDefaults )        // should use_stage just delegate?
		else
			StageInfo_Execute( use_stage )

		if ( "NextDelay" in use_stage )
			SessionState.NextDelayTime <- use_stage.NextDelay    // just overwrite, so we dont need to if check
		else
			SessionState.NextDelayTime <- 30                     // better default from somewhere?
	}

	smDbgPrint( "Setting type " + DirectorOptions.ScriptedStageType + " and val " + DirectorOptions.ScriptedStageValue )
}
