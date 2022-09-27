Msg("Activating community mutation 3.\n");

DirectorOptions <-
{
	ActiveChallenge = 1

	cm_CommonLimit = 0

	BoomerLimit = 0
	ChargerLimit = 0
	HunterLimit = 0
	JockeyLimit = 4
	SmokerLimit = 0
	SpitterLimit = 0
	cm_MaxSpecials = 4

	cm_SpecialRespawnInterval = 20

	function ConvertZombieClass(id)
	{
		return 5;
	}
}

function OnGameEvent_round_start_post_nav( params )
{
	if ( Director.GetMapName() == "c5m5_bridge" || Director.GetMapName() == "c6m3_port" || Director.GetMapName() == "c13m4_cutthroatcreek" )
		DirectorOptions.cm_MaxSpecials = 0;
}

function OnGameEvent_finale_start( params )
{
	if ( Director.GetMapName() == "c6m3_port" )
		DirectorOptions.cm_MaxSpecials = 4;
}

function OnGameEvent_gauntlet_finale_start( params )
{
	if ( Director.GetMapName() == "c5m5_bridge" || Director.GetMapName() == "c13m4_cutthroatcreek" )
		DirectorOptions.cm_MaxSpecials = 4;
}