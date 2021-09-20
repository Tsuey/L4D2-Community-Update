//======== Copyright (c) 2009, Valve Corporation, All rights reserved. ========
//
//=============================================================================

printl( "Initializing Director's script" );

DirectorOptions <-
{

	finaleStageList = []
	OnChangeFinaleMusic	= ""

	function OnChangeFinaleStage( from, to)
	{
		if ( to > 0 && to < finaleStageList.len() )
		{
			OnChangeFinaleMusic = finaleStageList[to];
		}
	}

	MaxSpecials = 2		
}

// temporarily leaving stage strings as diagnostic for gauntlet mode
DirectorOptions.finaleStageList.insert( FINALE_GAUNTLET_1, "FINALE_GAUNTLET_1" );
DirectorOptions.finaleStageList.insert( FINALE_HORDE_ATTACK_1, "Event.FinaleStart" );
DirectorOptions.finaleStageList.insert( FINALE_HALFTIME_BOSS, "Event.TankMidpoint" );
DirectorOptions.finaleStageList.insert( FINALE_GAUNTLET_2, "FINALE_GAUNTLET_2" );
DirectorOptions.finaleStageList.insert( FINALE_HORDE_ATTACK_2, "Event.FinaleWave4" );
DirectorOptions.finaleStageList.insert( FINALE_FINAL_BOSS, "Event.TankBrothers" );
DirectorOptions.finaleStageList.insert( FINALE_HORDE_ESCAPE, "" );
DirectorOptions.finaleStageList.insert( FINALE_CUSTOM_PANIC, "FINALE_CUSTOM_PANIC" );
DirectorOptions.finaleStageList.insert( FINALE_CUSTOM_TANK, "Event.TankMidpoint" );
DirectorOptions.finaleStageList.insert( FINALE_CUSTOM_SCRIPTED, "FINALE_CUSTOM_SCRIPTED" );
DirectorOptions.finaleStageList.insert( FINALE_CUSTOM_DELAY, "FINALE_CUSTOM_DELAY" );
DirectorOptions.finaleStageList.insert( FINALE_CUSTOM_CLEAROUT, "FINALE_CUSTOM_DELAY" );
DirectorOptions.finaleStageList.insert( FINALE_GAUNTLET_START, "Event.FinaleStart" );
DirectorOptions.finaleStageList.insert( FINALE_GAUNTLET_HORDE, "FINALE_GAUNTLET_HORDE" );
DirectorOptions.finaleStageList.insert( FINALE_GAUNTLET_HORDE_BONUSTIME, "FINALE_GAUNTLET_HORDE_BONUSTIME" );
DirectorOptions.finaleStageList.insert( FINALE_GAUNTLET_BOSS_INCOMING, "Event.TankMidpoint" );
DirectorOptions.finaleStageList.insert( FINALE_GAUNTLET_BOSS, "FINALE_GAUNTLET_BOSS" );
DirectorOptions.finaleStageList.insert( FINALE_GAUNTLET_ESCAPE, "" );
	

function GetDirectorOptions()
{
	local result;
	if ( "DirectorOptions" in DirectorScript )
	{
		result = DirectorScript.DirectorOptions;
	}
	
	if ( DirectorScript.MapScript.rawin( "DirectorOptions") )
	{
		if ( result != null )
		{
				DirectorScript.MapScript.DirectorOptions.setdelegate( result );
		}
		result = DirectorScript.MapScript.DirectorOptions;
	}

	if ( DirectorScript.MapScript.LocalScript.rawin( "DirectorOptions") )
	{
		if ( result != null )
		{
			DirectorScript.MapScript.LocalScript.DirectorOptions.setdelegate( result );
		}
		result = DirectorScript.MapScript.LocalScript.DirectorOptions;
	}

	if ( DirectorScript.MapScript.ChallengeScript.rawin( "DirectorOptions" ) )
	{
		if ( result != null )
		{
			DirectorScript.MapScript.ChallengeScript.DirectorOptions.setdelegate( result );
		}
		result = DirectorScript.MapScript.ChallengeScript.DirectorOptions;
	}
	
	return result;
}

