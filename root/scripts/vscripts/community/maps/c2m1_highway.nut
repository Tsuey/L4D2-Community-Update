g_Chapter = "DARK CARNIVAL - HIGHWAY";

devchap( "ALL MODES" );

PrecacheModel( "models/props_urban/fence_cover001_256.mdl" );
PrecacheModel( "models/props_urban/highway_barrel001.mdl" );
PrecacheModel( "models/props_fortifications/concrete_barrier001_128_reference.mdl" );
PrecacheModel( "models/props_rooftop/Gutter_Pipe_256.mdl" );
PrecacheModel( "models/props_rooftop/Gutter_Pipe_128.mdl" );
PrecacheModel( "models/props_mill/PipeSet08d_512_001a.mdl" );
PrecacheModel( "models/props_rooftop/acvent01.mdl" );
PrecacheModel( "models/props_misc/wrongway_sign01_optimized.mdl" );

function DoRoundFixes()
{
	make_clip(	"_permstuck_tanktreea",		"Everyone",	1,	"-24 -24 -64",		"24 24 17",		"4096 5123 -938" );
	make_clip(	"_permstuck_tanktreeb",		"Everyone",	1,	"-24 -24 -64",		"24 24 17",		"4067 4930 -913" );
	make_clip(	"_permstuck_tanktreec",		"Everyone",	1,	"-24 -24 -64",		"24 24 17",		"3911 3914 -941" );
	make_clip( "_cargocontainer_oob_01", "SI Players", 1, "-32 -464 -376", "32 464 376", "3616 2512 -632" );
	make_clip( "_cargocontainer_oob_02", "SI Players", 1, "-32 -192 -48", "32 192 48", "3616 1328 -1744" );
	make_clip( "_cargocontainer_oob_03", "SI Players", 1, "-64 -96 -200", "64 96 200", "3136 2595 -1243", "0 0 -42" );
	make_clip( "_cargocontainer_dispcrouch", "SI Players", 1, "-388 -16 0", "388 32 484", "3203 1572 -1822", "0 -5 -12" );
	make_clip( "_dispcrouch_rocka", "Everyone", 1, "-8 -161 -320", "8 110 240", "1280 2115 -1615", "0 135 0" );
	make_clip( "_dispcrouch_rockb", "Everyone", 1, "-140 -8 -320", "160 8 380", "1046 2025 -1615", "0 10 0" );
	make_clip( "_dispcrouch_rockc", "Everyone", 1, "-80 -8 -320", "80 8 230", "820 2010 -1611", "0 -14 0" );
	make_clip( "_dispcrouch_rockd", "Everyone", 1, "-80 -8 -320", "90 8 216", "686 2100 -1585", "0 -51 0" );
	make_clip( "_dispcrouch_rocke", "Everyone", 1, "-99 -8 -320", "84 8 106", "618 2260 -1464", "0 90 0" );
	make_clip( "_dispcrouch_swampa", "Everyone", 1, "-132 -8 0", "150 8 101", "2523 1855 -1805", "0 90 0" );
	make_clip( "_dispcrouch_swampb", "Everyone", 1, "-100 -8 0", "80 8 101", "2595 1654 -1807", "0 142 0" );
	make_clip( "_cliprework_fence", "Survivors", 1, "-70 -480 0", "8 480 640", "-193 -1932 -900" );
	make_clip(	"_commonhop_barrier",		"Survivors",	1,	"-210 -2 0",		"210 2 690",		"365 -1098 -950" );
	make_clip(	"_commonhop_tree",		"Survivors",	1,	"-150 -200 0",		"200 150 640",		"-46 -1242 -900" );
	make_clip(	"_shoppingcart_roof",		"Survivors",	1,	"-290 -320 0",		"256 264 1024",		"-517 -2678 -940" );
	make_clip( "_shoppingcart_tarpa", "Survivors", 1, "-51 -222 0", "50 256 711", "-1718 -2783 -967", "0 38 0" );
	make_clip( "_shoppingcart_tarpb", "Survivors", 1, "-51 -232 0", "48 258 711", "-1800 -2319 -967", "0 -21 0" );
	make_clip( "_shoppingcart_tarpc", "Survivors", 1, "-78 -506 0", "8 518 711", "-1838 -1583 -952", "0 16 0" );
	make_clip(	"_booster_clipgap",		"Survivors",	1,	"-20 -20 24",		"365 120 700",		"3632 5712 -880" );
	make_clip( "_shortcut_start_trucka", "Survivors", 1, "-5 -174 0", "96 188 514", "4493 7285 -756", "0 16 0" );
	make_clip( "_shortcut_start_truckb", "Survivors", 1, "36 -157 0", "96 76 514", "4388 7285 -756", "0 16 0" );
	make_clip( "_shortcut_start_busblu", "Survivors", 1, "-236 -47 0", "251 66 500", "4379 7676 -756", "0 -45 0" );
	make_clip( "_shortcut_start_shruba", "Survivors", 1, "-8 -114.5 -17", "8 67 514", "4779 7377 -756", "0 11 0" );
	make_clip( "_shortcut_start_shrubb", "Survivors", 1, "-8 -105 -17", "8 71 514", "4669 7457 -756", "0 79 0" );
	make_clip( "_shortcut_start_shrubc", "Survivors", 1, "-8 -91 -17", "8 59 514", "4626 7363 -756", "0 193 0" );
	make_clip( "_shortcut_start_shrubd", "Survivors", 1, "-8 -105 -17", "8 47 514", "4736 7283 -756", "0 255 0" );
	make_clip( "_booster_motelsign", "Survivors", 1, "-105 -13 -71", "132 17 252", "2932 4894 -507" );
	make_clip( "_permstuck_startfence", "Everyone", 1, "-147 -34 0", "45 39 1206", "11140 7179 -566", "0 21 0" );
	make_clip( "_longbush_booster", "Survivors", 1, "-205 -770 0", "379 1585 111", "4092 3921 -369", "0 -4 0" );
	make_clip( "_longbush_undermapa", "SI Players", 1, "-42 -1313 -145", "3 1555 552", "4625 4099 -805" );
	make_clip( "_longbush_undermapb", "SI Players", 1, "-174 -5 0", "475 5 822", "4142 2981 -983" );
	make_clip( "_clipextend_poolwalla", "Survivors", 1, "-517 -10 0", "517 10 360", "2561 3843 -640" );
	make_clip( "_clipextend_poolwallb", "Survivors", 1, "-6 -350 0", "6 350 360", "3067 4200 -640" );
	make_clip( "_permstuck_endfence", "Everyone", 1, "-93 -28 0", "53 38 143", "547 -635 -1087", "0 -33 0" );
	make_clip( "_clipextend_umbrella1", "Survivors", 1, "-48 -50 0", "50 48 522", "2683 4055 -773" );
	make_clip( "_clipextend_umbrella2", "Survivors", 1, "-48 -50 0", "50 48 522", "2483 3989 -773" );
	make_clip( "_clipextend_umbrella3", "Survivors", 1, "-48 -52 0", "50 50 522", "2243 4047 -773" );
	make_clip( "_commentary_motelroof_survivors", "Survivors", 1, "-1095 -296 -196", "1095 296 196", "1879 3428 -451" );
	make_clip( "_commentary_slopetruck", "Survivors", 1, "-8 -84 -8", "90 8 800", "-1251 -734 -1081" );

	if ( g_BaseMode == "coop" || g_BaseMode == "realism" )
	{
		devchap( "BASE COOP" );

		// FIXES

		con_comment( "KILL:\tShrubwall shortcut unpatched for Coop (popular request)." );

		EntFire( g_UpdateName + "_shortcut_start*", "Kill" );
	}
	if ( g_BaseMode == "versus" )
	{
		devchap( "BASE VERSUS" );

		// FIXES

		make_clip( "_overpass_trucknuke", "Survivors", 1, "-126 -45 0", "-33 45 156", "3467 7102 -704", "0 -14 0" );
		make_clip( "_tank_busleft", "Survivors", 1, "-258 -56 0", "271 52 430", "1731 6723 -574", "0 -28 0" );
		make_clip( "_tank_busright", "Survivors", 1, "-284 -48 -200", "284 48 200", "1688 7008 -344", "0 22 0" );
		make_clip( "_tank_fence", "Survivors", 1, "-780 -14 -130", "780 14 156", "2588 7168 -412" );
	}
	if ( g_BaseMode == "survival" )
	{
		devchap( "BASE SURVIVAL" );

		// FIXES

		make_clip( "_survival_midnightride", "Survivors", 1, "-839 -4 0", "448 15 422", "2618 6269 -679" );
		make_clip( "_survival_midnightsign", "Survivors", 1, "-190 -155 -37", "190 145 162", "2338 6131 -415" );
		make_clip( "_survival_boostshrub", "Survivors", 1, "-24 -208 0", "27 280 112", "3079 6479 -343" );
		make_clip( "_survival_fence_extend", "Survivors", 1, "0 -234 0", "77 0 360", "2042 3837 -640" );
	}
	if ( g_BaseMode == "scavenge" )
	{
		devchap( "BASE SCAVENGE" );

		// FIXES

		make_clip( "_scavenge_fence_painthop", "Survivors", 1, "0 -234 -145", "77 0 360", "2042 3837 -640" );
	}

	if ( HasPlayerControlledZombies() )
	{
		make_navblock( "_nav_motelfencejump", "Survivors", "Apply", "-24 -108 -24", "24 24 24", "2105 3700 -820" );
		make_brush( "_losfix_bush",		"-10 -190 -60",	"10 200 35",	"8224 8378 -536" );
		make_brush( "_losfix_end_fence",	"-254 -1 -5",	"254 0 5",	"-522 -2416 -1083" );
		make_brush( "_losfix_highway_bus1",		"-40 -1 -10",	"100 1 14",	"7035 7874 -641" );
		make_brush( "_losfix_highway_bus2",		"-1 -54 -8",	"1 54 8",	"6951 7806 -645" );
		make_brush( "_losfix_motel_balcony1",	"-1 -282 -2",	"0 282 2",	"2959 3416 -806" );
		make_brush( "_losfix_motel_balcony2",	"-81 0 -2",	"81 1 2",	"2865 3129 -806" );
		make_brush( "_losfix_motel_fence",		"0 -128 -6",	"1 128 6",	"3058 4818 -972" );
		make_brush( "_losfix_motel_jeep",		"-80 -1 0",	"80 0 28",	"1784 4722 -975" );
		make_brush( "_losfix_motel_van",	"-64 -1 -10",	"64 1 10",	"1545 4113 -966" );
		make_brush( "_losfix_overpass_truck",	"-1 -32 -12",	"1 32 12",	"3571 7076 -693" );
		make_brush( "_losfix_start_bus",		"-215 -1 -18",	"250 1 24",	"9213 7957 -514" );
		make_brush( "_losfix_start_van",	"-100 -1 -15",	"100 1 15",	"7957 7769 -581" );
		make_brush( "_losfix_underpass_truck",	"-1 -110 -15",	"1 20 15",	"3471 7845 -994" );
		make_brush( "_losfix_underpass_van1",	"-30 -1 -4",	"80 0 30",	"3194 7573 -1004" );
		make_brush( "_losfix_underpass_van2",	"-1 -72 -4",	"0 30 24",	"3165 7542 -1004" );
		make_brush( "_losfix_van_jump",		"-1 -40 -12",	"1 44 20",	"6981.6 7662.8 -656.3" );
		make_clip( "_ladder_motelfrontleft_clipleft", "Everyone", 1, "-8 -25 0", "0 0 308", "2766 3708 -968", "0 129 0" );
		make_clip( "_ladder_motelfrontleft_clipright", "Everyone", 1, "0 0 0", "8 25 308", "2753 3724 -968", "0 -129 0" );
		make_clip( "_ladder_motelfrontright_clipleft", "Everyone", 1, "-8 -25 0", "0 0 308", "1372 4691 -968", "0 39 0" );
		make_clip( "_ladder_motelfrontright_clipright", "Everyone", 1, "0 0 0", "8 25 308", "1366 4690 -968", "0 -39 0" );
		make_clip( "_motelskyboxroof_clipinfected", "SI Players", 1, "-2192 -592 0", "4 -340 394", "2972 3724 -649" );
		make_clip( "_saferoof_trollblock", "Survivors", 1, "-72 -282 0", "120 166 684", "-904 -2534 -940" );
		make_clip( "_whispsign_infectedqol", "SI Players", 1, "-56 -3.5 -2", "64 3 2", "9526 8374 -169" );
		make_clip( "_hrbillboard_infectedqol", "SI Players", 1, "-52 -3.5 -2", "58 3 2", "2334 6266 -501" );
		make_ladder( "_ladder_barrelsemi_cloned_caralarmshort", "1378 4328 -888", "2758 11124 269", "0 -120.5 0", "-0.50 -0.86 0" );
		make_ladder( "_ladder_endbusfront_cloned_caralarmbus", "1773 4270 -911", "1997 662.16 -112", "0 150 0", "0.9 -0.43 0" );
		make_ladder( "_ladder_endbusback_cloned_caralarmbus", "1773 4270 -911", "-5485.06 -5007.16 -112", "0 330 0", "-0.9 0.43 0" );
		make_ladder( "_ladder_endsafebackl_cloned_fixdontdelete", "-187 -1725 -1018.05", "-599 -949 5" );
		make_ladder( "_ladder_endsafebackr_cloned_fixdontdelete", "-187 -1725 -1018.05", "-599 -917 5" );
		make_ladder( "_ladder_endsaferoofa_cloned_fixdontdelete", "-187 -1725 -1018.05", "-599 -667 5" );
		make_ladder( "_ladder_endsaferoofb_cloned_fixdontdelete", "-187 -1725 -1018.05", "875 -3001 5", "0 270 0", "0 -1 0" );
		make_ladder( "_ladder_highwaysign_cloned_whispsign", "9531 8445.5 -414.5", "-811 -365 -10" );
		make_ladder( "_ladder_hilltoptruck_cloned_motelalarmright", "1379 5428 -868", "-6451 554 -164", "0 270 0", "0 -1 0" );
		make_ladder( "_ladder_motelfrontleftB_cloned_motelalarmright", "1379 5428 -868", "8197 2343 -8", "0 90 0", "0 1 0" );
		make_ladder( "_ladder_motelfrontleftT_cloned_motelalarmright", "1379 5428 -868", "8197 2343 120", "0 90 0", "0 1 0" );
		make_ladder( "_ladder_motelfrontrightB_cloned_motelalarmright", "1379 5428 -868", "7 -740 -8" );
		make_ladder( "_ladder_motelfrontrightT_cloned_motelalarmright", "1379 5428 -868", "7 -740 120" );
		make_ladder( "_ladder_motelroofleft_cloned_onewaycliff", "1126.1 2008.58 -1462", "-863 5299 570", "0 -105 0", "-1 0 0" );
		make_ladder( "_ladder_motelroofright_cloned_onewaycliff", "1126.1 2008.58 -1462", "-863 6912 570", "0 -105 0", "-1 0 0" );
		make_ladder( "_ladder_qolbus_cloned_caralarmbuspool", "1878 4279 -911", "2571.03 7794.04 341", "0 295 0", "0.49 -0.87 0" );
		make_ladder( "_ladder_sheriffbus_cloned_caralarmshort", "1378 4328 -888", "4814 11473 245", "0 -142 0", "-0.78 -0.62 0" );
		make_ladder( "_ladder_shortcutsemiback_cloned_caralarmshort", "1378 4328 -888", "3604 2785 270" );
		make_ladder( "_ladder_shortcutsemifront_cloned_caralarmshort", "1378 4328 -888", "5705 11403 234", "0 180 0", "-1 0 0" );
		make_ladder( "_ladder_shrubberybus_cloned_caralarmbus", "1773 4270 -911", "2272.93 4677.83 225", "0 330 0", "-0.90 0.43 0" );
		make_ladder( "_ladder_slopetruck_cloned_caralarmshort", "1378 4328 -888", "10246 5933 274", "0 76.27 0", "0.23 0.97 0" );
		make_ladder( "_ladder_startbus_cloned_caralarmshort", "1378 4328 -888", "5004 9321 425", "0 -90 0", "0 -1 0" );
		make_ladder( "_ladder_tankfence_cloned_caralarm", "1378 4328 -888", "1681 298 -31" );
		make_ladder( "_ladder_tankfightsemi_cloned_caralarmshort", "1378 4328 -888", "6737 8686 -36", "0 150.5 0", "-0.87 0.49 0" );
		make_ladder( "_ladder_whispsignextender_cloned_motelpoolfence", "2712 3850 -906", "6819 4600 639" );
		make_prop( "dynamic",		"_losblocker_fence",		"models/props_urban/fence_cover001_256.mdl",	"3060 4819 -967",		"0 0 0",		"shadow_no" );
		make_prop( "dynamic",		"_losblocker_fencea",		"models/props_urban/fence_cover001_256.mdl",	"-128 -1332 -1078.75",		"0 150.5 0",		"shadow_no" );
		make_prop( "dynamic",		"_losblocker_fenceb",		"models/props_urban/fence_cover001_256.mdl",	"48 -1160 -1078.75",		"0 120.5 0",		"shadow_no" );
		make_prop( "dynamic",		"_propladder_barrel",		"models/props_urban/highway_barrel001.mdl",	"3084 5126 -947.96",		"-1.4995 119.966 2.6",	"shadow_no" );
		make_prop( "dynamic",		"_propladder_barrier",		"models/props_fortifications/concrete_barrier001_128_reference.mdl",	"3079 5152 -948.75",		"0 18.5 -90",		"shadow_no" );
		make_prop( "dynamic", "_ladder_motelfrontleftB_pipe", "models/props_rooftop/Gutter_Pipe_256.mdl", "2769 3714 -788", "0 180 0", "shadow_no" );
		make_prop( "dynamic", "_ladder_motelfrontleftT_pipe", "models/props_rooftop/Gutter_Pipe_128.mdl", "2769 3714 -660", "0 180 0", "shadow_no" );
		make_prop( "dynamic", "_ladder_motelfrontrightB_pipe", "models/props_rooftop/Gutter_Pipe_256.mdl", "1378 4688 -788", "0 90 0", "shadow_no" );
		make_prop( "dynamic", "_ladder_motelfrontrightT_pipe", "models/props_rooftop/Gutter_Pipe_128.mdl", "1378 4688 -660", "0 90 0", "shadow_no" );
		make_prop( "dynamic", "_ladder_motelroofleft_pipe", "models/props_mill/PipeSet08d_512_001a.mdl", "792 3695 -904", "90 90 0", "shadow_no" );
		make_prop( "dynamic", "_ladder_motelroofright_pipe", "models/props_mill/PipeSet08d_512_001a.mdl", "792 5308 -904", "90 90 0", "shadow_no" );
		make_prop( "dynamic", "_losblocker_motelleft", "models/props_rooftop/acvent01.mdl", "2706 3541 -665", "0 0 0", "shadow_no" );
		make_prop( "dynamic", "_losblocker_motelright", "models/props_rooftop/acvent01.mdl", "1205 5394 -668", "0 90 0", "shadow_no" );
		make_prop( "dynamic", "_motelskyboxroof_wrongwaya", "models/props_misc/wrongway_sign01_optimized.mdl", "918 3383 -565", "0 90 0", "shadow_no", "solid_no", "255 255 255", "17", "217" );
		make_prop( "dynamic", "_motelskyboxroof_wrongwayb", "models/props_misc/wrongway_sign01_optimized.mdl", "1318 3383 -555", "0 90 0", "shadow_no", "solid_no", "255 255 255", "17", "217" );
		make_prop( "dynamic", "_motelskyboxroof_wrongwayc", "models/props_misc/wrongway_sign01_optimized.mdl", "1718 3383 -555", "0 90 0", "shadow_no", "solid_no", "255 255 255", "17", "217" );
		make_prop( "dynamic", "_motelskyboxroof_wrongwayd", "models/props_misc/wrongway_sign01_optimized.mdl", "2118 3383 -555", "0 90 0", "shadow_no", "solid_no", "255 255 255", "17", "217" );
		make_prop( "dynamic", "_motelskyboxroof_wrongwaye", "models/props_misc/wrongway_sign01_optimized.mdl", "2518 3383 -555", "0 90 0", "shadow_no", "solid_no", "255 255 255", "17", "217" );
		make_prop( "dynamic", "_motelskyboxroof_wrongwayf", "models/props_misc/wrongway_sign01_optimized.mdl", "2850 3383 -565", "0 90 0", "shadow_no", "solid_no", "255 255 255", "17", "217" );
		patch_ladder( "-196 -1725 -1018.049", "0 0 0", "-1 0 0" );
		make_trigpush( "_trigpushl_whispsign", "Infected", 50, "0 0 0", "0 0 0", "1 1 1", "9536 8453 -193" );
		make_trigpush( "_trigpushr_whispsign", "Infected", 50, "0 180 0", "0 0 0", "1 1 1", "9525 8453 -193" );
	}
}