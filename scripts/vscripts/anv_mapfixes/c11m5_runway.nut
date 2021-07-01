g_Chapter = "DEAD AIR - RUNWAY FINALE";

devchap( "ALL MODES" );

// FIXES_ALL

make_clip( "_lowthinwing_collision", "Everyone", 1, "-8 -116 -30", "8 111 32", "-6057 9725 -12" );
make_clip( "_nav_skybridge", "Survivors", 1, "-643 -102 0", "878 106 1427", "-6035 8761 32", "0 45 0" );
make_clip( "_nav_firering_cheese", "Survivors", 1, "-24 -86 0", "17 126 1632", "-3408 9155 -192" );
make_clip( "_planecrash_concreteramp", "SI Players", 1, "-290 -10 0", "345 10 185", "-4127 11223 -128", "0 -56 45" );

make_prop( "dynamic", "_terry", "models/deadbodies/dead_male_civilian_body.mdl", "-4154 9350 -140", "0 -111 0", "shadow_no", "solid_no" );
EntFire( "relay_outro_start", "AddOutput", "OnTrigger anv_mapfixes_terry:Kill::2:-1" );

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