g_Chapter = "DARK CARNIVAL - COASTER";

devchap( "ALL MODES" );

PrecacheModel( "models/props_pipes/pipeset08d_128_001a.mdl" );
// PrecacheModel( "models/rollercoaster/coaster_debris.mdl" );
PrecacheModel( "models/props_urban/fence_cover001_128.mdl" );
PrecacheModel( "models/props_rooftop/acvent04.mdl" );
PrecacheModel( "models/props_rooftop/acunit01.mdl" );
PrecacheModel( "models/props_misc/wrongway_sign01_optimized.mdl" );
PrecacheModel( "models/props_fairgrounds/bumpercar.mdl" );

function DoRoundFixes()
{
	make_clip(	"_smokerinfamya",		"SI Players",	1,	"-4000 -80 -1337",	"0 1600 0",		"-4450 2525 309" );
	make_clip(	"_smokerinfamyb",		"SI Players",	1,	"-4000 0 0",		"160 1111 1337",	"-4450 3005 309" );
	make_clip(	"_smokerinfamyc",		"SI Players",	1,	"-4000 -289 0",		"0 271 1337",		"-5119 2734 309" );
	make_clip(	"_shortcut_commonhopa",		"Survivors",	1,	"-10 -10 -64",		"10 10 216",		"-3720 1144 96" );
	make_clip(	"_shortcut_commonhopb",		"Survivors",	1,	"-10 -10 -56",		"10 10 232",		"-3720 1352 72" );
	make_clip(	"_shortcut_commonhopc",		"Survivors",	1,	"-10 -10 -52",		"10 10 227",		"-3720 1768 77" );
	make_clip(	"_stuckwarp_gatearm",		"Everyone",	1,	"-31 -36 -54",		"31 36 54",		"-3799 1100 82" );
	make_clip(	"_cliprework_tunnelb",		"Survivors",	1,	"-777 -110 -108",	"82 360 1100",		"-3418 3460 652" );
	make_clip(	"_cliprework_tunnela",		"Survivors",	1,	"-300 -80 -108",	"82 360 1100",		"-3902 3021 655" );
	make_clip( "_nav_extinguisher", "Survivors", 1, "-16 -4 0", "16 4 44", "-325 4116 244" );
	make_clip( "_commonhop_curvedrail", "Survivors", 1, "-5 -120 0", "17 260 25", "-3498 2060 250" );
	make_clip( "_cliprework_fourvents", "Survivors", 1, "-223 -1 0", "225 4 64", "239 3676 272" );
	make_clip( "_cliprework_semipermstuck", "Everyone", 1, "-20 -50 0", "19 22 32", "-3254 2792 0", "0 -15 0" );
	make_clip( "_cliprework_culdesaca", "Survivors", 1, "-95 -4 0", "98 4 206", "-3917 2979 152", "0 25 0" );
	make_clip( "_cliprework_culdesacb", "Survivors", 1, "-176 -4 0", "142 4 1603", "-3659 3066 152", "0 15 0" );
	make_clip( "_cliprework_culdesacc", "Survivors", 1, "-175 -4 0", "178 4 206", "-3351 3058 152", "0 -15 0" );
	make_clip( "_cliprework_culdesacd", "Survivors", 1, "-4 -280 0", "4 106 1387", "-3493 3256 368" );
	make_clip( "_shortcut_commonhopd", "Survivors", 1, "-10 -10 -56", "10 10 227", "-3512 1352 77" );
	make_clip( "_shortcut_commonhope", "Survivors", 1, "-10 -10 -56", "10 10 227", "-3512 1768 77" );
	make_clip( "_shortcut_commonhopf", "Survivors", 1, "-10 -10 -56", "10 10 263", "-3720 1976 57" );
	make_clip( "_cliprework_shrubgap", "Survivors", 1, "-112 -80 0", "112 80 286", "-3072 128 152" );
	make_clip( "_onewaybreakwall_elecbox", "Everyone", 1, "-64 -4 0", "64 4 236", "-64 3524 100" );
	make_clip( "_endbridge_shiftsmoother1", "Everyone", 1, "-1 -42 0", "1 38 2", "-4183 2320 272" );
	make_clip( "_endbridge_shiftsmoother2", "Everyone", 1, "-42 -1 0", "38 1 2", "-4729 2277 164" );
	make_clip( "_permstuck_irredeemable", "SI Players", 1, "-48 -42 0", "16 94 152", "-2064 -174 0" );
	make_clip( "_permstuck_swanroom_rest", "Everyone", 1, "-54 -20 0", "58 29 108", "510 4084 -7" );
	make_clip( "_semiperm_coastergate", "Survivors", 1, "-64 -664 0", "64 16 140", "-2784 1688 0" );
	make_clip( "_recompilepls_pillar1", "Survivors", 1, "-10 -10 0", "10 10 272", "-3760 2360 0" );
	make_clip( "_recompilepls_pillar2", "Survivors", 1, "-10 -10 0", "10 10 272", "-3760 2280 0" );
	make_clip( "_recompilepls_pillar3", "Survivors", 1, "-10 -10 0", "10 10 272", "-4032 2280 0" );
	make_clip( "_recompilepls_pillar4", "Survivors", 1, "-10 -10 0", "10 10 272", "-4032 2360 0" );
	make_clip( "_recompilepls_pillar5", "Survivors", 1, "-10 -10 0", "10 10 272", "-4176 2360 0" );
	make_clip( "_recompilepls_pillar6", "Survivors", 1, "-10 -10 0", "10 10 272", "-4176 2280 0" );
	make_clip( "_cliprework_permstuck", "Survivors", 1, "-93 -81 -55", "108 47 88", "-3266 3057 413" );
	make_clip( "_stuckwarp_swanstairs", "Everyone", 1, "-52 0 0", "143 3 37", "298 4192 43", "-34.5 0 0" );
	make_clip( "_commentary_permstuck_swanshelf", "Everyone", 1, "-19 -30 -11", "19 30 11", "224 4491 18" );
	make_clip( "_commentary_truckclimb_a", "Survivors", 1, "-8 -100 -8", "84 8 953", "-1364 2040 7" );
	make_clip( "_commentary_truckclimb_b", "Survivors", 1, "0 -113 -8", "224 8 800", "-1596 2040 159" );
	make_clip( "_commentary_electricalbox_a", "Survivors", 1, "-4 -56 -8", "8 8 196", "-2056 2624 8" );
	make_clip( "_commentary_electricalbox_b", "Survivors", 1, "-4 -56 -16", "8 8 196", "-776 1724 16" );
	make_clip( "_commentary_electricalbox_c", "Survivors", 1, "-56 -8 -34", "8 4 196", "-1124 1032 36" );
	make_brush( "_permstuck_swanroom_dead", "-54 -20 0", "58 29 108", "510 4084 -7" );
	make_trigduck( "_duckqol_swanhole", "-5 -32 -32", "5 32 32", "1348 4096 32" );

	make_clip( "_onewayhole_blockclip", "Everyone", 1, "-64 -13 -20", "64 13 28", "336 3777 180", "0 160 0" );
	make_prop( "dynamic", "_onewayhole_blockpipe", "models/props_pipes/pipeset08d_128_001a.mdl", "336 3777 180", "0 160 90", "shadow_no" );

	// con_comment( "LOGIC:\tBeta Coaster Rubble restored for Campaign and Survival relays." );

	// make_prop( "dynamic", "_dynamic_coaster_rubble", "models/rollercoaster/coaster_debris.mdl", "0 0 -8", "0 0 0", "shadow_no", "solid_no" );
	// EntFire( "relay_start_onslaught", "AddOutput", "OnTrigger " + g_UpdateName + "_dynamic_coaster_rubble:SetAnimation:debris:6.33:-1" );
	// EntFire( "relay_panicevent", "AddOutput", "OnTrigger " + g_UpdateName + "_dynamic_coaster_rubble:SetAnimation:debris:6.33:-1" );

	if ( g_BaseMode == "coop" || g_BaseMode == "realism" || g_BaseMode == "versus" )
	{
		make_clip( "_commentary_fencewalk_a", "Survivors", 1, "-4 0 0", "8 256 512", "-2868 1844 122.859" );
		make_clip( "_commentary_fencewalk_b", "Survivors", 1, "-4 0 0", "8 256 512", "-2700 1964 122.859" );
	}
	if ( g_BaseMode == "versus" )
	{
		devchap( "BASE VERSUS" );

		// FIXES

		make_clip(	"_shortcut_longjump",		"Survivors",	1,	"-17 -216 0",		"17 216 1580",		"-4240 2616 171" );

		make_clip(	"_shortcut_supports",		"Survivors",	1,	"-86 -10 -137",		"86 10 32",		"-3904 2062 96" );
		make_clip(	"_cliprework_scaffnuke_skipa",	"Survivors",	1,	"-120 -111 -48",	"150 88 310",		"-3044 3000 177" );
		make_clip(	"_cliprework_scaffnuke_skipb",	"Survivors",	1,	"-90 -211 -48",		"82 0 310",		"-2788 2760 177" );
		make_clip(	"_cliprework_scaffnuke_skipc",	"Survivors",	1,	"-120 -111 -48",	"20 -73 1545",		"-3044 3000 177" );
		make_clip(	"_cliprework_scaffnuke_skipd",	"Survivors",	1,	"-90 -305 -48",		"-61 0 1545",		"-2788 2760 177" );
		make_clip(	"_cliprework_roofa",		"Survivors",	1,	"-108 -224 -320",	"108 224 1100",		"-3596 1560 640" );
		make_clip(	"_cliprework_roofb",		"Survivors",	1,	"-295 -444 -280",	"295 444 1100",		"-3970 1558 640" );
		make_clip(	"_cliprework_sign",		"Survivors",	1,	"-307 -70 0",		"307 70 1320",		"-3902 2321 431" );
		make_clip( "_chargerassist_container", "Survivors", 1, "-207 -62 0", "182 66 832", "-718 590 128" );
		make_clip( "_shortcut_commonhopg", "Survivors", 1, "-10 -10 -56", "10 10 103", "-3848 1976 57" );
		make_clip( "_shortcut_supportdropa", "Survivors", 1, "-28 -55 0", "35 35 1150", "-3260 2854 576" );
		make_clip( "_shortcut_supportdropb", "Survivors", 1, "-28 -216 0", "35 35 1150", "-3300 2810 576" );
		make_clip( "_shortcut_finally_done", "Survivors", 1, "-8 -146 0", "0 146 255", "-2894 2609 253", "9 0 0" );
		make_clip( "_booster_eventskip1", "Survivors", 1, "-253 -16 -459", "332 23 32", "-3106 3081 960" );
		make_clip( "_booster_eventskip2", "Survivors", 1, "-253 -72 -459", "-246 23 32", "-3106 3081 960" );
		make_clip( "_commentary_downramp_railing", "Survivors", 1, "0 0 -64", "8 188 1280", "-3350.76 2608.73 444" );
		make_clip( "_commentary_pretunnel_supports", "Survivors", 1, "0 0 0", "8 350 1600", "-3540.08 2368 128" );
		make_clip( "_commentary_shortcut_bush_a", "Survivors", 1, "-16 -64 -772", "16 64 772", "-4097 2048 956" );
		make_clip( "_commentary_shortcut_bush_b", "Survivors", 1, "-16 -78 -772", "16 78 772", "-4133 2174 956", "0 31 0" );
	}

	if ( HasPlayerControlledZombies() )
	{
		EntFire( "wrongway_brushes", "Enable" );
		make_brush( "_coastertower_chimney_losblock", "-11 -19 0", "11 19 77", "-2751 1031 620" );
		make_brush( "_losfix_truck",		"-1 -26 -8",	"1 64 8",	"-1575 1984 8" );
		make_clip( "_coastertower_chimney_collision", "Everyone", 1, "-11 -19 0", "11 19 77", "-2751 1031 620" );
		make_clip( "_ladder_buttonlegT_clip", "SI Players", 1, "-2 -1 -24", "2 1 17", "-3548 1785 148", "45 0 0" );
		make_clip( "_ladder_coastertower_clip", "Everyone", 1, "-64 -3 -20", "64 13 42", "-2784 1327 174" );
		make_clip( "_ladder_swanroomcpanel_clipB", "SI Players", 1, "0 -10 0", "1 10 2", "479 4838 126" );
		make_clip( "_ladder_swanroomcpanel_clipT", "SI Players", 1, "-4 -10 0", "4 10 20", "475 4838 126" );
		make_clip( "_ladderqol_coasterinclinequad", "SI Players", 1, "-64 -75 10", "64 -1 22", "-2784 375 593", "0 0 -45" );
		make_clip( "_onewaybreakwall_elecbox", "Everyone", 1, "-64 -4 0", "64 4 236", "-64 3524 100" );
		make_clip( "_propladder_airconda_qol", "SI Players", 1, "-22 -20 12", "22 -1 32", "-1938 739 195" );
		make_clip( "_startwindow_cheese", "Survivors", 1, "-47.6 0 0", "49.6 1 135", "2783 1920 105" );
		make_clip( "_trailerfence_clip", "SI Players", 1, "-114 -39 3", "702 761 963", "-1150 2887 -3" );
		make_ladder( "_ladder_buttonlegT_cloned_buttonlegB", "-3518 1780 102", "0 2.1 118" );
		make_ladder( "_ladder_coastertowerB_cloned_finalleg", "-4164 2274 128", "-510 5513 168", "0 90 0", "0 1 0" );
		make_ladder( "_ladder_coastertowerT_cloned_shrubberytilt", "-2976 886.5 258", "-5760 2209 264", "0 180 0", "0 1 0" );
		make_ladder( "_ladder_deadendcontainer_cloned_trailerfenceback", "-1056 2586 66", "235 -1929 -4" );
		make_ladder( "_ladder_elecboxbags_cloned_dumpsterduo", "-774 1344 160", "-2446 255 0", "0 -90 0", "0 1 0" );
		make_ladder( "_ladder_fencedroproof_cloned_dumpsterduo", "-774 1344 160", "-320 3316 35", "0 90 0", "0 -1 0" );
		make_ladder( "_ladder_gunstruck_cloned_signalvines", "-1798 2176 80", "665 3727 -3", "0 90 0", "0 -1 0" );
		make_ladder( "_ladder_swanroomcpanel_cloned_unusedconcrete", "-1920 -2 80", "2421 4867 -8" );
		make_ladder( "_ladder_swanroomelecbox_cloned_swanroomsource", "-118 4376 80.5", "126 -106 65" );
		make_ladder( "_ladder_swanroomshelf_cloned_coasterfencetilt", "-2240 2564 63.3879", "2837 1571 -29" );
		make_ladder( "_ladder_trailerfencefront_cloned_trailerfenceback", "-1056 2586 66", "-2193 5164 0", "0 -180 0", "0 -1 0" );
		make_prop( "dynamic",		"_losblocker_fencea",		"models/props_urban/fence_cover001_128.mdl",	"-2698 2029 -0.675446",		"0.0 180.0 0.0",	"shadow_no" );
		make_prop( "dynamic",		"_losblocker_fenceb",		"models/props_urban/fence_cover001_128.mdl",	"-2682 2155 -0.675446",		"0.0 165.0 0.0",	"shadow_no" );
		make_prop( "dynamic", "_propladder_airconda", "models/props_rooftop/acvent04.mdl", "-1938 683 160", "0 180 0", "shadow_no" );
		make_prop( "dynamic", "_propladder_aircondb", "models/props_rooftop/acunit01.mdl", "-1825 490 231", "0 180 0", "shadow_no" );
		make_prop( "dynamic", "_trailerfence_wrongway", "models/props_misc/wrongway_sign01_optimized.mdl", "-1093 2848 100", "0 -90 0", "shadow_no", "solid_no", "255 255 255", "17", "217" );
		make_prop( "physics", "_hittable_bumpera_m4translated", "models/props_fairgrounds/bumpercar.mdl", "-5048 1361 4", "0 338 0" );
		make_prop( "physics", "_hittable_bumperb_m4translated", "models/props_fairgrounds/bumpercar.mdl", "-5123 1374 31", "-1 178 106" );
		make_trigmove( "_duckqol_swanroomcpanel", "Duck", "-4 -4 0", "4 4 32", "483 4854 136" );
		make_trigmove( "_duckqol_coastergate", "Duck", "-17 -8 0", "17 8 1", "-2756 1690 139" );
		patch_ladder( "-1278 2672 160", "13 0 0" );
		patch_ladder( "-3518 1780 102", "0 2.1 0" );
		patch_ladder( "-4164 2274 128", "0 -2 0" );
		patch_ladder( "-484 506 160", "0 -3 0" );
	}
}

function DoMapSpawnFixes()
{
	if ( HasPlayerControlledZombies() )
	{
		patch_nav_checkpoint( "3852 2037 -64" );
	}
}

function DoTankWarp( hndTank )
{
	// Move Tank spawn in the swan room to the next room forward (~25% boss flow).

	if ( CheckToWarpTank( hndTank, [-300, 4100, 720, 4850] ) )
	{
		hndTank.SetOrigin( Vector( -312, 4155, 128.1 ) );
	}

	// Move Tank spawn after the coaster one-way drop to the button area (76-79% boss flow).

	else if ( CheckToWarpTank( hndTank, [-3700, 400, -3100, 1775] ) )
	{
		hndTank.SetOrigin( Vector( -3810, 1845, 160.1 ) );
	}

	// Additional warp for the coaster one-way drop area (80-83% boss flow).

	else if ( CheckToWarpTank( hndTank, [-3700, 1775, -3100, 2850] ) )
	{
		hndTank.SetOrigin( Vector( -3423, 3480, 368.1 ) );
	}
}