//-----------------------------------------------------
Msg("Activating Mutation 16\n");

DirectorOptions <-
{
	ActiveChallenge = 1

	cm_SpecialSlotCountdownTime = 15
	cm_SpecialRespawnInterval = 1
	cm_MaxSpecials = 4
	cm_DominatorLimit = 4

	HunterLimit = 4
	BoomerLimit = 0
	SmokerLimit = 0
	SpitterLimit = 0
	ChargerLimit = 0
	JockeyLimit = 0
}

function OnGameEvent_round_start_post_nav( params )
{
	if ( Director.GetMapName() == "c5m5_bridge" || Director.GetMapName() == "c6m3_port" )
		DirectorOptions.cm_MaxSpecials = 0;
}

function OnGameEvent_finale_start( params )
{
	if ( Director.GetMapName() == "c6m3_port" )
		DirectorOptions.cm_MaxSpecials = 4;
}

function OnGameEvent_gauntlet_finale_start( params )
{
	if ( Director.GetMapName() == "c5m5_bridge" )
		DirectorOptions.cm_MaxSpecials = 4;
}