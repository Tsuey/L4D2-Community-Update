//-----------------------------------------------------
Msg("Activating Mutation 4\n");

DirectorOptions <-
{
	ActiveChallenge = 1

	cm_SpecialRespawnInterval = 15
	cm_MaxSpecials = 8
	cm_BaseSpecialLimit = 2
	cm_DominatorLimit = 8
}

function OnGameEvent_round_start_post_nav( params )
{
	if ( Director.GetMapName() == "c5m5_bridge" || Director.GetMapName() == "c6m3_port" )
	{
		DirectorOptions.cm_MaxSpecials = 0;
		DirectorOptions.cm_BaseSpecialLimit = 0;
	}
}

function OnGameEvent_finale_start( params )
{
	if ( Director.GetMapName() == "c6m3_port" )
	{
		DirectorOptions.cm_MaxSpecials = 8;
		DirectorOptions.cm_BaseSpecialLimit = 2;
	}
}

function OnGameEvent_gauntlet_finale_start( params )
{
	if ( Director.GetMapName() == "c5m5_bridge" )
	{
		DirectorOptions.cm_MaxSpecials = 8;
		DirectorOptions.cm_BaseSpecialLimit = 2;
	}
}