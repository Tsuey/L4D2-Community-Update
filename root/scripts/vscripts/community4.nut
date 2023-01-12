//-----------------------------------------------------
Msg("Activating Nightmare\n");

DirectorOptions <-
{
	ActiveChallenge = 1

	cm_DominatorLimit = 8
	cm_MaxSpecials = 8
	cm_SpecialRespawnInterval = 30
	cm_AutoReviveFromSpecialIncap = true
	cm_AllowPillConversion = false
	cm_TankLimit = 4
	ProhibitBosses = false

	BoomerLimit = 0
	SurvivorMaxIncapacitatedCount = 3
	SpecialInitialSpawnDelayMin = 5
	SpecialInitialSpawnDelayMax = 30
	TankHitDamageModifierCoop = 0.25
}

function OnGameEvent_round_start_post_nav( params )
{
	if ( Director.GetMapName() == "c5m5_bridge" || Director.GetMapName() == "c6m3_port" )
		DirectorOptions.cm_MaxSpecials = 0;
}

function OnGameEvent_finale_start( params )
{
	if ( Director.GetMapName() == "c6m3_port" )
		DirectorOptions.cm_MaxSpecials = 8;
}

function OnGameEvent_gauntlet_finale_start( params )
{
	if ( Director.GetMapName() == "c5m5_bridge" )
		DirectorOptions.cm_MaxSpecials = 8;
}