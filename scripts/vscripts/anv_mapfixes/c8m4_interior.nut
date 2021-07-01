g_Chapter = "NO MERCY - HOSPITAL";

devchap( "ALL MODES" );

// FIXES_ALL

EntFire( "worldspawn", "RunScriptFile", "c8m4_elevatorfix" );

make_clip(	"_permstuck_cabinetchair",	"Everyone",	1,	"-15 -15 -24",		"15 15 10",		"11935 13061 312" );
make_clip(	"_witch_windows",		"Survivors",	1,	"3 -440 0",		"9 424 64",		"12909 12360 320" );
make_clip(	"_booster_skylights",		"Survivors",	1,	"-256 -88 0",		"256 88 8",		"12550 12112 448" );
make_clip(	"_nav_elevatorbutton",		"Survivors",	1,	"-4 -1 0",		"4 4 86",		"13491 15103 493" );
make_clip( "_counterweight_edging", "Survivors", 1, "-25 -54 -666", "17 56 666", "13144 15243 5526" );

con_comment( "FIX:\tLower and upper elevator doors will no longer break if SI spawn inside them." );

EntFire( "door_elevouterlow", "AddOutput", "wait -1" );
EntFire( "door_elevouterhigh", "AddOutput", "wait -1" );

con_comment( "FIX:\tUpper generator prop made immovable until Survivors reach top of elevator." );

EntFire( "generator01",		"DisableMotion" );
EntFire( "elevator",		"AddOutput",	"OnReachedTop generator01:EnableMotion::0:-1" );

if ( g_BaseMode == "coop" || g_BaseMode == "realism" )
{
	devchap( "BASE COOP" );

	// FIXES

}
if ( g_BaseMode == "versus" )
{
	devchap( "BASE VERSUS" );

	// FIXES

}
if ( g_BaseMode == "survival" )
{
	devchap( "BASE SURVIVAL" );

	// FIXES

}
if ( g_BaseMode == "scavenge" )
{
	devchap( "BASE SCAVENGE" );

	// FIXES

}