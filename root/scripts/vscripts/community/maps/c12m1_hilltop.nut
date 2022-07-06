g_Chapter = "BLOOD HARVEST - THE WOODS";

devchap( "ALL MODES" );

function DoRoundFixes()
{
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

	if ( HasPlayerControlledZombies() )
	{
		kill_funcinfclip( 1014.64 );	// Deletes clip above end cliff on right side
		kill_funcinfclip( 1039.64 );	// Deletes clip above end cliff on left side
		kill_funcinfclip( 1364.13 );	// Desirably deletes clip over the 1st rockcliffs on far-right (same)
		kill_funcinfclip( 1454.65 );	// Deletes mildly-ladder-blocking fallen-trees chasm-crossing clip
		kill_funcinfclip( 848.51 );	// Deletes next one in flow order (after above)
		kill_funcinfclip( 849.49 );	// Deletes far-right largest clip (speaking in order of flow)
		kill_funcinfclip( 986.591 );	// Deletes finally the clip above Valve's broken cliff ladder
		kill_funcinfclip( 770.171 );	// Delete clip above tall yellow building in end area
		kill_funcinfclip( 739.388 );	// Delete clip directly above end safe room (for Hunter)
		kill_funcinfclip( 1081.48 );	// Delete clip for fence right of end safe room (all SI)
		kill_funcinfclip( 741.805 );	// Delete clip above RICHARDSON ATLANTIC building for Hunter-only
		EntFire( "worldspawn", "RunScriptCode", "kill_funcinfclip( 1364.13 )", 1 );	// Undesirably deletes clip behind start area (_meticulous repair)
		make_clip( "_ladder_rockcliffback_clip", "SI Players", 1, "-24 -15 0", "27 56 25", "-10172 -10751 818", "0 49 0" );
		make_clip( "_ladderqol_rockcliff", "SI Players", 1, "-32 -77 0", "32 100 32", "-10235 -12716 528", "0 30 -30" );
		make_clip( "_meticulous_funcinfclip00", "SI Players", 1, "-32 -217 -640", "32 177 1935", "-7624 -14554 257" );
		make_clip( "_meticulous_funcinfclip01", "SI Players", 1, "-492 -6 -977", "553 6 657", "-7806 -7614 1536", "0 38 0" );
		make_clip( "_meticulous_funcinfclip02", "SI Players", 1, "-420 -32 -640", "420 32 1935", "-9771 -13110 257", "0 -40 0" );
		make_clip( "_meticulous_funcinfclip03", "SI Players", 1, "-32 -384 -777", "32 384 1935", "-9849 -12580 257", "0 -40 0" );
		make_clip( "_meticulous_funcinfclip04", "SI Players", 1, "-280 0 -640", "550 32 1635", "-10788 -8902 557" );
		make_clip( "_meticulous_funcinfclip05", "SI Players", 1, "-280 0 -640", "210 32 1635", "-11103 -9082 557", "0 70 0" );
		make_clip( "_meticulous_funcinfclip06", "SI Players", 1, "-8 -320 0", "8 320 1454", "-9996 -8345 738", "0 -36 0" );
		make_clip( "_meticulous_funcinfclip07", "SI Players", 1, "-8 -160 0", "8 160 1372", "-6728 -7101 820" );
		make_clip( "_meticulous_funcinfclip08", "SI Players", 1, "-777 -8 0", "1000 960 1372", "-5988 -6941 820" );
		make_clip( "_meticulous_funcinfclip09", "SI Players", 1, "-205 -8 0", "1000 960 885", "-5988 -6941 -65" );
		make_clip( "_meticulous_stuckspot", "SI Players", 1, "-420 -128 -640", "640 32 600", "-9801 -13140 120", "-20 -40 0" );
		make_clip( "_meticulous_slidespot", "SI Players", 1, "-108 -56 0", "643 16 88", "-10932 -8918 432" );
		make_clip( "_ladderqol_2ndclifffront_stuckspot", "Everyone", 1, "-12 -12 -36", "12 12 36", "-11204 -9392 484" );
		make_clip( "_ladderqol_2ndcliffback_stuckspot", "Everyone", 1, "-30 -24 -230", "30 24 230", "-10742 -9372 650" );
		make_ladder( "_ladder_1stcliffback_cloned_startwide", "-8180.8638 -14508.2334 12.3855", "-12475 3648 3095", "0 37 10", "-0.59 0.79 0.17" );
		make_ladder( "_ladder_1stclifffront_cloned_prebridgewide", "-11628.5 -12194.834 161", "1428 -1485 -1124", "0 0 -8", "0 -0.99 0.139" );
		make_ladder( "_ladder_2ndcliffback_cloned_endfencewide", "-6124 -7222.7998 175.5", "-4618 -2162.25 1724.89", "0 0 10", "0 0.98 0.17" );
		make_ladder( "_ladder_2ndclifffront_cloned_postbridgewide", "-11328 -11030 -70", "4280 -10517 -2705", "0 -47 -17", "-0.7 -0.65 0.29" );
		make_ladder( "_ladder_2ndclifftank_cloned_elecboxchairs", "-11227.5 -9748 517", "1026 750 40" );
		make_ladder( "_ladder_endelecbox_cloned_elecboxchairs", "-11227.5 -9748 517", "4652 1595 -24" );
		make_ladder( "_ladder_endfenceback_cloned_farunused", "-11520 -8870 168", "5386 1595 124" );
		make_ladder( "_ladder_endfencefront_cloned_freighttripipe", "-7252 -8192.5 370", "1104 891 4" );
		make_ladder( "_ladder_rockcliffback_cloned_unusedladder", "-10213 -12939 834.173", "6125.06 -8010.88 559.92", "-4 -42 0", "0.74 -0.67 0.07" );
		make_ladder( "_ladder_skybridgeleftB_cloned_trackstoshed", "-7726 -8871.5 120", "78 -601.48 82.91", "0 0 -1.5", "0 1 -0.026" );
		make_ladder( "_ladder_skybridgeleftT_cloned_trackstoshed", "-7726 -8871.5 120", "78 -593.18 401.91", "0 0 -1.5", "0 1 -0.026" );
		make_ladder( "_ladder_skybridgerightB_cloned_trackstoshed", "-7726 -8871.5 120", "-241 -600.48 82.91", "0 0 -1.5", "0 1 -0.026" );
		make_ladder( "_ladder_skybridgerightT_cloned_trackstoshed", "-7726 -8871.5 120", "-241 -592.18 401.91", "0 0 -1.5", "0 1 -0.026" );
		patch_ladder( "-10213 -12939 834.173", "22 0 0" );
	}

	// Resolve stuck Tank spawns for Taaannnk! Mutation.

	if ( g_MutaMode == "mutation19" )
	{
		// Thicken 2 wrongway's func_playerinfected_clip. Note this
		// works for Taaannnk! Mutation but is a bad ladder to add
		// to the vanilla game since it blocks climbability of a
		// ladder that'd be climbable for custom servers that delete
		// all func_playerinfected_clip.

		make_clip( "_tankstuck_wrongwayone", "SI Players", 1, "-320 -800 0", "0 750 1740", "-11967 -10090 450" );
		make_clip( "_tankstuck_wrongwaytwo", "SI Players", 1, "-610 0 0", "180 460 1740", "-11604 -9345 450" );
	}
}