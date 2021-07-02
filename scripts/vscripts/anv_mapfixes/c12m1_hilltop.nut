g_Chapter = "BLOOD HARVEST - THE WOODS";

devchap( "ALL MODES" );

// FIXES_ALL

make_clip(	"_curvejump_fence",		"Survivors",	1,	"-1024 -51 -90",	"120 51 777",		"-10342 -8897 517" );
make_clip(	"_cliprework_unattackable",	"Survivors",	1,	"-112 -192 -335",	"0 274 1024",		"-8080 -8448 880.6" );
make_clip( "_permstuck_treeandrock", "Everyone", 1, "-19 -22 0", "26 32 46", "-11270 -9471 447" );
make_clip( "_tankpunch_deflector", "Survivors", 1, "-434 -46 0", "288 -19 1481", "-11503 -10981 375" );
make_clip( "_dispcrouch_smoker", "Everyone", 1, "4 -200 -64", "61 70 58", "-10650 -15068 -46", "0 -19 0" );

make_trighurt( "_instakill_longperimeter1", "Survivor", "-1158 -2015 0", "1158 2015 170", "-11827 -13824 -84" );
make_trighurt( "_instakill_longperimeter2", "Survivor", "-868 -1895 0", "508 2145 170", "-12855 -10361 -84" );
make_trighurt( "_instakill_fallrevivefence", "Survivor", "-17 -337 0", "17 367 17", "-8883 -8543 87" );
make_trighurt( "_instakill_fallrevivenoper", "Survivor", "-744 -527 0", "1304 877 96", "-9496 -7665 -96" );

if ( g_BaseMode == "versus" )
{
	devchap( "BASE VERSUS" );

	// FIXES

    make_clip( "_nav_quarrybeams", "Survivors", 1, "-152 -7 0", "152 1 288", "-7808 -9481 512" );

}