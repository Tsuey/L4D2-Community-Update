g_Chapter = "SWAMP FEVER - SWAMP";

devchap( "ALL MODES" );

// FIXES_ALL

// This map is clipped like a tunnel. No known gamebreaking exploits.

make_clip( "_boat_smoother", "Everyone", 1, "-16 -24 0", "16 24 30", "-7863 5391 -8", "-10 -30 0" );

if ( g_BaseMode == "coop" || g_BaseMode == "realism" )
{
	devchap( "BASE COOP" );

	// FIXES

}
if ( g_BaseMode == "versus" )
{
	devchap( "BASE VERSUS" );

	// FIXES

    make_clip( "_brokenhouse_hedgegap", "Survivors", 1, "-68 -468 0", "98 257 502", "3915 2029 145", "0 -11 0" );

    con_comment( "LOGIC:\tAnti-skip plane clips will be deleted when door is blown." );

    make_clip( "_cabin_door_button_a", "Survivors", 1, "-138 -176 -13", "138 372 444", "-1932 3700 196", "0 28 0" );
    make_clip( "_cabin_door_button_b", "Survivors", 1, "-147 -434 -70", "138 404 444", "-1888 3079 226" );
    make_clip( "_cabin_door_button_c", "Survivors", 1, "-112 -516 -30", "108 431 521", "-1622 2298 162", "0 28 0" );
    EntFire( "Blow_door", "AddOutput", "OnTrigger anv_mapfixes_cabin_door_button*:Kill::0:-1" );

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