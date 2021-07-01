g_Chapter = "DEAD AIR - THE CRANE";

devchap( "ALL MODES" );

// FIXES_ALL

make_clip(	"_fallrevive_nopejumpa",	"Survivors",	1,	"-383 -8 0",		"2490 8 1400",		"6142 2312 9" );
make_clip(	"_fallrevive_nopejumpb",	"Survivors",	1,	"-8 -512 0",		"8 512 1400",		"8648 2672 16" );
make_clip(	"_permstuck_officechairs",	"Everyone",	1,	"-11 -11 -11",		"11 11 11",		"8865 4003 252" );
make_clip(	"_nav_craneledge",		"Survivors",	1,	"-17 0 -1",		"29 4 77",		"6117 3856 646" );
make_trighurt( "_instakill_semitrailer", "Survivor", "-269 -117 0", "273 121 8", "6854 2779 173" );

make_prop( "dynamic", "_omg_valve_wrongwayc", "models/props_vehicles/van.mdl", "8815 2888 10", "0 45 3", "shadow_no" );
make_prop( "dynamic", "_omg_valve_wrongwayg", "models/props_vehicles/van_glass.mdl", "8815 2888 10", "0 45 3", "shadow_no" );

if ( g_BaseMode == "coop" || g_BaseMode == "realism" )
{
	devchap( "BASE COOP" );

	// FIXES

}
if ( g_BaseMode == "versus" )
{
	devchap( "BASE VERSUS" );

	// FIXES

    // Piggyback on Survivor-filtered trigger that ready-ups end car alarm.

    con_comment( "LOGIC:\tAnti-shortcut trighurts will be deleted when a Survivor exits final office stairwell." );

    make_trighurt( "_finalstreet_trighurta", "Survivor", "-879 -112 0", "603 48 17", "9071 3888 196" );
    make_trighurt( "_finalstreet_trighurtb", "Survivor", "-1753 -823 0", "59 935 32", "8261 4759 196" );
    make_trighurt( "_finalstreet_trighurtc", "Survivor", "-781 -361 0", "359 599 32", "9101 4969 196" );
    DoEntFire( "!self", "AddOutput", "OnTrigger anv_mapfixes_finalstreet_trighurt*:Kill::0:-1", 0.0, null, Entities.FindByClassnameNearest( "trigger_once", Vector( 8616, 4320, 140 ), 1 ) );

}
if ( g_BaseMode == "survival" )
{
	devchap( "BASE SURVIVAL" );

	// FIXES

    make_clip( "_survival_electricgod", "Survivors", 1, "-40 -28 0", "79 43 273", "8328 3196 783" );

}
if ( g_BaseMode == "scavenge" )
{
	devchap( "BASE SCAVENGE" );

	// FIXES

}