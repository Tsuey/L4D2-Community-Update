g_Chapter = "DEATH TOLL - THE CHURCH";

devchap( "ALL MODES" );

PrecacheModel( "models/props/cs_militia/militiarock03.mdl" );
PrecacheModel( "models/props_foliage/trees_cluster01.mdl" );
PrecacheModel( "models/props_foliage/trees_cluster02.mdl" );

function DoRoundFixes()
{
	make_clip(	"_commonhop_saferoom",		"Survivors",	1,	"-576 -2892 -165",	"576 368 1000",		"-8080 -5684 421" );
	make_clip(	"_commonhop_traintoroof",	"Survivors",	1,	"-789 -626 -165",	"744 762 994",		"-12000 -8094 286" );
	make_clip(	"_commonhop_stationroof",	"Survivors",	1,	"-184 -430 -200",	"174 380 470",		"-12632 -6040 500" );
	make_clip(	"_dispcrouch_flatcartunnel",	"Everyone",	1,	"-100 -38 -64",		"38 38 256",		"-12534 -3574 -36" );
	make_clip(	"_holdoutsafe_cabinmountain",	"Survivors",	1,	"-340 -50 -245",	"340 50 1122",		"-7518 -2770 307" );
	
	make_clip(	"_cliprework_rockcliff01",	"Survivors",	1,	"-600 -160 -592",	"911 160 592",		"-6272 -2688 848" );
	make_clip(	"_cliprework_roadblock",	"Survivors",	1,	"-45 -1200 0",		"45 455 512",		"-4585 -944 496" );
	make_clip(	"_cliprework_churchlonga",	"Survivors",	1,	"-45 -9 -555",		"2310 9 944",		"-4533 -503 496" );
	make_clip(	"_cliprework_rockcliff02",	"Survivors",	1,	"-145 -360 -420",	"180 216 592",		"-7043 -3005 848" );
	make_clip(	"_cliprework_churchlongb",	"Survivors",	1,	"-9 -45 -369",		"9 2400 1166",		"-2232 -467 290" );
	make_clip(	"_clipextend_trainstationa",	"Survivors",	1,	"-24 -1300 0",		"24 1300 640",		"-12811 -7486 344" );
	make_clip(	"_clipextend_trainstationb",	"Survivors",	1,	"-1200 -9 0",		"216 77 690",		"-13001 -5725.4 344" );
	make_clip( "_dipscrouch_multicliff", "Everyone", 1, "-487 -60 -100", "86 4 39", "-13282 -3756 240", "0 43 0" );
	make_clip( "_cliprework_church01", "Survivors", 1, "-260 -169 -80", "286 9 864", "-3070 25 576" );
	make_clip( "_cliprework_church02", "Survivors", 1, "-618 -80 -80", "486 32 864", "-2710 1072 576" );
	make_clip( "_cliprework_church03", "Survivors", 1, "-554 -102 -80", "486 62 864", "-3798 930 576" );
	make_clip( "_cliprework_church04", "Survivors", 1, "-218 -102 -80", "206 250 864", "-4538 578 576" );
	make_clip( "_cliprework_church05", "Survivors", 1, "-430 -10 -80", "206 10 864", "-4962 712 576" );
	make_clip( "_cliprework_church06", "Survivors", 1, "-10 -545 -80", "10 430 864", "-5528 137 576" );
	make_clip( "_cliprework_church07", "Survivors", 1, "-180 -9 -80", "80 9 864", "-3390 -135 576" );
	make_clip( "_cliprework_church08", "Survivors", 1, "-100 -100 -80", "100 0 864", "-5492 667 576", "0 45 0" );
	make_clip( "_cliprework_church09", "Survivors", 1, "-40 -175 -80", "20 175 864", "-3612 -319 576", "0 -24 0" );
	make_clip( "_cliprework_church10", "Survivors", 1, "-80 -490 -80", "32 486 864", "-2256 506 576" );
	make_clip( "_cliprework_church11", "Survivors", 1, "-144 -160 -80", "144 160 704", "-2928 448 736" );
	make_clip( "_cliprework_church12", "Survivors", 1, "-226 -284 -80", "222 420 704", "-2558 220 736" );
	make_clip( "_cliprework_corner1", "Survivors", 1, "-487 -60 39", "86 4 784", "-13282 -3756 240", "0 43 0" );
	make_clip( "_cliprework_corner2", "Survivors", 1, "-550 -60 -17", "711 4 784", "-12651 -3566 400", "0 14 0" );
	make_clip( "_tankpunch_booster", "Survivors", 1, "-8 -302 -110", "158 960 1322", "-8838 -4633 124", "0 51 0" );
	make_clip( "_permstuck_triplerocka", "Everyone", 1, "-78 -86 -80", "88 96 32", "-9539 -4313 16", "0 41 0" );
	make_clip( "_permstuck_triplerockb", "Everyone", 1, "-14 -6 -187", "14 6 187", "-10147 -2993 -27" );
	make_clip( "_cliprework_vulnerable", "Survivors", 1, "-1085 -16 -90", "1048 16 1192", "-8709 -3352 269", "0 34 0" );
	make_clip( "_cliprework_churchwindows", "Survivors", 1, "-4 -120 0", "4 120 100", "-2372 192 194" );
	make_clip( "_clipextend_padlockgate", "Survivors", 1, "-14 -311 0", "14 405 1102", "-8594 -5033 344" );
	make_clip( "_permstuck_openedrockcliff", "SI Players", 1, "-17 -17 0", "17 17 32", "-9247 -3950 412" );
	make_clip( "_permstuck_fatcliffladder1", "SI Players", 1, "-17 -34 0", "17 17 32", "-8302 -3322 383" );
	make_clip( "_permstuck_fatcliffladder2", "SI Players", 1, "-17 -34 0", "17 17 32", "-8224 -3527 378" );
	make_clip( "_permstuck_housesiderock", "Everyone", 1, "-13 -34 -37", "13 13 37", "-6869 -2445 15" );
	make_clip( "_chargerassist_brokenwall", "Survivors", 1, "-128 0 0", "128 64 275", "-2480 1104 221" );

	if ( g_BaseMode != "coop" && g_BaseMode != "realism" )
	{
		make_clip(	"_cliprework_watchtower",	"Survivors",	1,	"0 -358 0",		"358 0 180",		"-10438 -6325 542" );
	}
	if ( g_BaseMode == "versus" )
	{
		devchap( "BASE VERSUS" );

		// FIXES

		make_clip( "_cliprework_smokertrolling", "Survivors", 1, "-207 -21 0", "219 8 259", "-11857 -5323 85" );
	}

	if ( HasPlayerControlledZombies() )
	{
		kill_funcinfclip( 889.728 );		// Delete HERSCH SHIPPING clip
		kill_funcinfclip( 421.059 );		// Delete clip above rooftop ramp
		make_brush( "_losfix_ambulance1",	"-1 -100 -7",	"1 100 7",	"-5924 -1034 -39" );
		make_brush( "_losfix_ambulance2",	"-1 -40 -8",	"1 40 8",	"-5965 -1134 -38" );
		make_brush( "_losfix_bus1",		"-1 -100 -14",	"1 100 14",	"-9815 -3582 -43" );
		make_brush( "_losfix_bus2",		"-1 -50 -14",	"1 50 14",	"-9782 -3864 -43" );
		make_brush( "_losfix_bus3",		"-50 -1 -14",	"41 1 14",	"-9857 -3507 -43" );
		make_brush( "_losfix_van",		"-60 -1 -9",	"100 1 9",	"-9414 -2952 -42" );
		make_brush( "_losfix_watertank",	"-2 -132 -6",	"2 132 6",	"-10456 -6456 -58" );
		make_clip(	"_solidify_permstuck01",	"SI Players",	1,	"-17 -17 0",		"17 17 512",		"-6606 -722 -58" );
		make_clip(	"_solidify_permstuck02",	"SI Players",	1,	"-17 -17 0",		"17 17 512",		"-6243 -697 -48" );
		make_clip(	"_solidify_permstuck03",	"SI Players",	1,	"-17 -17 0",		"17 17 512",		"-6067 -585 -31" );
		make_clip(	"_solidify_permstuck04",	"SI Players",	1,	"-17 -17 0",		"17 17 512",		"-6001 -266 -30" );
		make_clip(	"_solidify_permstuck05",	"SI Players",	1,	"-17 -17 0",		"17 17 512",		"-5620.3 -301.3 -50.5" );
		make_clip(	"_solidify_permstuck06",	"SI Players",	1,	"-17 -17 0",		"17 17 512",		"-9674 -1131 -10" );
		make_clip(	"_solidify_permstuck07",	"SI Players",	1,	"-17 -17 0",		"17 17 512",		"-8918 -860 -42" );
		make_clip(	"_solidify_permstuck08",	"SI Players",	1,	"-17 -17 0",		"17 17 512",		"-8570 -994 -66" );
		make_clip( "_meticulous_funcinfclip01", "SI Players", 1, "-508 -290 -72", "1134 46 402", "-9348 -7694 584" );
		make_clip( "_hellcade_permstuck",		"SI Players", 1, "-13 -188 -24", "13 188 24", "-4598 -1025 -54" );
		make_clip( "_ladderqol_mountaincrawl",	"SI Players", 1, "-32 -6 -4", "32 6 4", "-10920 -3149 330", "0 -131.9 0" );
		make_clip( "_ladderqol_churchcampperimeter_a",	"SI Players", 1, "-5 -2 -85", "5 2 85", "-3558 -164 137" );
		make_clip( "_ladderqol_churchcampperimeter_a",	"SI Players", 1, "-2 -5 -85", "2 5 85", "-3537 -150 137" );
		make_clip( "_ladderqol_churchleft",	"SI Players", 1, "-11 -2 -4", "11 2 4", "-2785 12.5 342", "0 0 45" );
		make_ladder( "_ladder_brokenwallL_cloned_graveshort", "-4808 706 6", "2295 383 193" );
		make_ladder( "_ladder_brokenwallM_cloned_graveshort", "-4808 706 6", "2327 383 193" );
		make_ladder( "_ladder_brokenwallR_cloned_graveshort", "-4808 706 6", "2359 383 193" );
		make_ladder( "_ladder_churchcampperimeter_cloned_churchtallninety", "-4024 -520.5 53.5", "-342 2332 119.5", "0 30.5 0", "0.5 -0.86 0" );
		make_ladder( "_ladder_churchfarperimeter_cloned_churchsandbags", "-2791.83 600.5 236.126", "-296 504 8" );
		make_ladder( "_ladder_concretebags_cloned_acunitcorner", "-11120 -7697 0", "-1639 229 0" );
		make_ladder( "_ladder_mountaincrawl_cloned_fatcliffladder", "-7808 -2686 110.235", "-14375.5 -10539 1636", "0 -131.9 34", "0.617 -0.553 0.559" );
		make_ladder( "_ladder_ramptohersch_cloned_lightsignalfence", "-11841 -5314.5 13", "2967 -2079 670" );
		make_ladder( "_ladder_shedelectricbox_cloned_hellcade", "-4543.5 -1344 -14", "-10635 1854 19", "0 90 0", "0 1 0" );
		make_ladder( "_ladder_stationfencebackL_cloned_stationfencebackR", "-12819.5 -8032 12.5", "0 1328 0" );
		make_ladder( "_ladder_stationfencebackM_cloned_stationfencebackR", "-12819.5 -8032 12.5", "0 629 0" );
		make_ladder( "_ladder_stationfencefrontL_cloned_stationfencefrontR", "-12792.5 -6685.7598 11.5", "0 -618 0" );
		make_ladder( "_ladder_trainsignalleftB_cloned_sandtowerbest", "-11178 -5312.5 54.5", "-351 -2020 -101" );
		make_ladder( "_ladder_trainsignalleftT_cloned_sandtowerbest", "-11178 -5312.5 54.5", "-351 -2020 27" );
		make_ladder( "_ladder_trainsignalrightB_cloned_sandtowerbest", "-11178 -5312.5 54.5", "-832 -2020 -101" );
		make_ladder( "_ladder_trainsignalrightT_cloned_sandtowerbest", "-11178 -5312.5 54.5", "-832 -2020 27" );
		make_prop( "dynamic",		"_losblocker_rock",		"models/props/cs_militia/militiarock03.mdl",	"-5921 -453 19",		"2 277 -120",			"shadow_no" );
		make_prop( "dynamic",		"_solidify_tree01",		"models/props_foliage/trees_cluster01.mdl",	"-6608 -712 -84",		"-3.50638 167.38 -6.41996",	"shadow_no" );
		make_prop( "dynamic",		"_solidify_tree02",		"models/props_foliage/trees_cluster01.mdl",	"-6240 -704 -36",		"0.0 332.0 0.0",		"shadow_no" );
		make_prop( "dynamic",		"_solidify_tree03",		"models/props_foliage/trees_cluster01.mdl",	"-6064 -584 -84",		"-1.16862 16.961 3.82575",	"shadow_no" );
		make_prop( "dynamic",		"_solidify_tree04",		"models/props_foliage/trees_cluster01.mdl",	"-6000 -272 -84",		"-1.16862 331.961 3.82575",	"shadow_no" );
		make_prop( "dynamic",		"_solidify_tree05",		"models/props_foliage/trees_cluster01.mdl",	"-5622 -298 -84",		"-1.16862 106.961 3.82575",	"shadow_no" );
		make_prop( "dynamic",		"_solidify_tree06",		"models/props_foliage/trees_cluster01.mdl",	"-9678.08 -1120 11.46",		"-15.8186 151.677 -1.38363",	"shadow_no" );
		make_prop( "dynamic",		"_solidify_tree07",		"models/props_foliage/trees_cluster01.mdl",	"-8914.98 -852.481 -26.4875",		"0 317 0",	"shadow_no" );
		make_prop( "dynamic",		"_solidify_tree08",		"models/props_foliage/trees_cluster01.mdl",	"-8568 -984 -52", "1.17358 181.777 -6.60183",	"shadow_no" );
		//make_prop( "dynamic",		"_solidify_tree09",		"models/props_foliage/trees_cluster02.mdl",	"-7168 -880 -91.8731", "-6.18811 26.8478 12.0217",	"shadow_no" );
		make_prop( "dynamic",		"_solidify_tree10",		"models/props_foliage/trees_cluster02.mdl",	"-9664 -1400 -36.5395", "-15.8186 151.677 -1.38363",	"shadow_no" );
	}

	// Resolve stuck Tank spawns for Taaannnk! Mutation.

	if ( g_MutaMode == "mutation19" )
	{
		// Deleting all func_playerinfected_clip would create new exploits
		// in the Survival/finale arena, so instead only delete specific ones.
		// Luckily, the Survival arena itself is fine, so doesn't need any
		// work, and all spawns fixed below are far away from Survival arena.

		kill_funcinfclip( 668.433 );	// Wrongway in beginning area
		kill_funcinfclip( 2248.58 );	// Treeline after bus/shed

		// New clips to extend behind some func_playerinfected_clips.

		make_clip( "_tankstuck_cornerpath", "SI Players", 1, "-700 -800 -145", "800 790 1360", "-13598 -9362 68" );
		make_clip( "_tankstuck_mountainwedge", "SI Players", 1, "-100 -100 0", "100 100 1300", "-8388 -3525 300" );
	}
}