g_Chapter = "SWAMP FEVER - PLANTATION";

devchap( "ALL MODES" );

function DoRoundFixes()
{
	make_clip(	"_permstuck_housetarp",		"Everyone",	1,	"-24 -24 0",		"24 24 120",		"-1753 -996 16" );
	make_clip( "_booster_treeleft", "Survivors", 1, "-148 -116 0", "208 116 753", "735 1518 373" );
	make_clip( "_booster_treeright", "Survivors", 1, "-130 -179 0", "145 156 753", "2558 1526 373" );
	make_clip( "_nav_tinytree1", "Survivors", 1, "-108 -66 0", "68 66 842", "1485 997 311" );
	make_clip( "_nav_tinytree2", "Survivors", 1, "-68 -66 0", "78 106 842", "1835 937 311" );
	make_clip( "_nav_tinytree3", "Survivors", 1, "-118 -96 0", "98 146 842", "1825 1227 311" );
	make_clip( "_nav_tinytree4", "Survivors", 1, "-48 -46 0", "88 96 842", "1555 1227 311" );
	make_clip( "_nav_tinytree5", "Survivors", 1, "-58 -16 0", "98 126 842", "1429 1887 311" );
	make_clip( "_nav_tinytree6", "Survivors", 1, "-68 -66 0", "138 156 842", "1839 1817 311" );
	make_clip( "_commentary_permstuck_furniture", "Everyone", 1, "-28 -74 -42", "28 74 42", "-2652 -942 58" );
	make_clip( "_commentary_floorcollapse", "Survivors", 1, "-8 -8 0", "25 115 172", "2600 -368 417" );
	make_brush( "_defibtrick_undermap_dead", "-16 -58 -120", "24 54 0", "688 122 248" );

	if ( g_BaseMode != "coop" && g_BaseMode != "realism" )
	{
		make_clip( "_booster_mansionroofa", "Survivors", 1, "-204 -23 0", "212 105 533", "1660 527 640" );
		make_clip( "_booster_mansionroofb",	"Survivors", 1,	"-584 -560 -255.5", "584 560 255.5", "1664 -56 896" );
		make_clip( "_booster_mansionroofc", "Survivors", 1, "-76 -231.5 -255.5", "76 231.5 255.5", "2324 -128 896" );
		make_clip( "_booster_mansionroofd", "Survivors", 1, "-172 -243.5 0", "172 243.5 533", "908 -140 896" );
		make_clip( "_stuckwarp_understairs", "Everyone", 1, "4 -55 -25", "39 57 21", "2816 119 162" );
		make_clip( "_booster_scaffoldpins", "Survivors", 1, "-199 -1 0", "146 9 909", "527 177 243" );
	}
	if ( g_BaseMode == "coop" || g_BaseMode == "realism" )
	{
		// Get nav tiles by position because IDS can change if edited later on
		local navMain = NavMesh.GetNearestNavArea(Vector(2377.853516, 161.838699, 194.000000), 16, true, true);
		local navConnection1 = NavMesh.GetNearestNavArea(Vector(2300.000000, 162.500000, 131.307587), 16, true, true);
		local navConnection2 = NavMesh.GetNearestNavArea(Vector(2337.500000, 120.000000, 232.031250), 16, true, true);
		navConnection1.Disconnect(navMain);
		navConnection2.Disconnect(navMain);
	}
	if ( g_BaseMode == "versus" )
	{
		devchap( "BASE VERSUS" );

		// FIXES

		make_clip( "_commentary_shortcut_startfence", "Survivors", 1, "-8 -272 -80", "8 280 80", "-2380 -1616 78.2673" );
	}
	if ( g_BaseMode == "survival" )
	{
		devchap( "BASE SURVIVAL" );

		// FIXES

		make_clip( "_nav_shelvings", "Survivors", 1, "-48 -56 0", "65 56 63", "2127 -504 345" );

		con_comment( "FIX:\tPoint-of-no-return clip Enabled instantly to block Survivalists from boosting out." );

		EntFire( g_UpdateName + "_point_of_no_return", "Enable" );
	}

	if ( HasPlayerControlledZombies() )
	{
		make_brush( "_brickhome_chimney1_losblock", "-11 -19 0", "11 19 77", "-1779 -3712 454" );
		make_brush( "_brickhome_chimney2_losblock", "-11 -19 0", "11 19 77", "-1298 -3712 454" );
		make_brush( "_losfix_start_truck1",	"-54 -1 -12",	"54 1 12",	"-1733 -2751 10" );
		make_brush( "_losfix_start_truck2",	"-1 -55 -12",	"1 54 12",	"-1785 -2695 10" );
		make_clip( "_permstuck_enclosedhedges", "SI Players", 1, "-30 -85 -53", "30 85 53", "81 -4523 72" );
		make_clip( "_brickhome_chimney1_collision", "Everyone", 1, "-11 -19 0", "11 19 77", "-1779 -3712 454" );
		make_clip( "_brickhome_chimney2_collision", "Everyone", 1, "-11 -19 0", "11 19 77", "-1298 -3712 454" );
		make_clip( "_ladder_houselow_clipl", "Everyone", 1, "-8 -2 0", "12 4 136", "-2054 -1026 1", "0 -45 0" );
		make_clip( "_ladder_houselow_clipr", "Everyone", 1, "-3 -2 0", "16 4 136", "-2012 -1032 1", "0 45 0" );
		make_ladder( "_ladder_backwhitefence_cloned_brickhomeB", "-1036 -3438 84", "565 368 -42" );
		make_ladder( "_ladder_brickhomeT_cloned_brickhomeB", "-1036 -3438 84", "2166 -4668 255", "0 -90 0", "1 0 0" );
		make_ladder( "_ladder_brickhomeside_cloned_brickhomeB", "-1036 -3438 84", "2501 -4927 -32", "0 -90 0", "1 0 0" );
		make_ladder( "_ladder_campscaffold_cloned_brickhomeB", "-1036 -3438 84", "1752 3509 248" );
		make_ladder( "_ladder_dumpsterscaffold_cloned_brickhomeB", "-1036 -3438 84", "1418 -4324 224", "0 -180 0", "0 -1 0" );
		make_ladder( "_ladder_enclosedhedges_cloned_brickhomeB", "-1036 -3438 84", "775 -322 -32" );
		make_ladder( "_ladder_escapepillar_cloned_escapeback", "1880 2058 192", "3688 4089.5 2", "0 -180 0", "0 -1 0" );
		make_ladder( "_ladder_househigh_cloned_cornerwhite", "3082 1856 192", "-5251 -2782 90" );
		make_ladder( "_ladder_houselow_cloned_treeright", "2368 1516 188", "-4398 -2547 -111" );
		make_ladder( "_ladder_logpileup_cloned_brickhomeB", "-1036 -3438 84", "-1656 -6509 40", "0 -180 0", "0 -1 0" );
		make_ladder( "_ladder_mansionchoose_cloned_brickhomeB", "-1036 -3438 84", "244 -4594 135", "0 -180 0", "0 -1 0" );
		make_ladder( "_ladder_moundhole_cloned_minigunleft", "1948 466 296", "4194 443 64", "0 -180 0", "0 -1 0" );
		make_ladder( "_ladder_parkourattic_cloned_shortesthedge", "1984 1618 160", "-277 -1860 424" );
		make_ladder( "_ladder_shelfpileleft_cloned_minigunleft", "1948 466 296", "-721 -1018 48" );
		make_ladder( "_ladder_shelfpileright_cloned_minigunright", "1376 466 296", "2598 515 48", "0 -180 0", "0 -1 0" );
	}
}