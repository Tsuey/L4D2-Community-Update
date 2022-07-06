g_Chapter = "DEATH TOLL - THE TOWN";

devchap( "ALL MODES" );

PrecacheModel( "models/props_vehicles/deliveryvan.mdl" );
PrecacheModel( "models/props_vehicles/deliveryvan_glass.mdl" );
PrecacheModel( "models/props_interiors/sheetrock_leaning.mdl" );
PrecacheModel( "models/props_update/c8m1_rooftop_3.mdl" );
PrecacheModel( "models/props_c17/concrete_barrier001a.mdl" );
PrecacheModel( "models/props_foliage/cedar01.mdl" );
PrecacheModel( "models/props_street/concertinawire128.mdl" );
PrecacheModel( "models/props_street/stopsign01.mdl" );
PrecacheModel( "models/props_misc/wrongway_sign01_optimized.mdl" );
PrecacheModel( "models/props_rooftop/Gutter_Pipe_256.mdl" );
PrecacheModel( "models/props_street/awning_department_store.mdl" );
PrecacheModel( "models/props_update/c10m4_hellcade_nodraw.mdl" );
PrecacheModel( "models/props_vehicles/cara_95sedan.mdl" );
PrecacheModel( "models/props_vehicles/cara_95sedan_glass.mdl" );

function DoRoundFixes()
{
	make_clip(	"_commonhop_bankwindow",	"Survivors",	1,	"-120 -5 0",		"120 17 1612",		"-672 -4351 176" );
	make_clip(	"_cliprework_church",		"Survivors",	1,	"-256 -16 -164",	"256 16 1040",		"-3010 30 720.9" );
	make_clip(	"_cliprework_buses",		"Survivors",	1,	"-160 -6 -164",		"160 6 620",		"-1437 -461 1124" );
	make_clip(	"_cliprework_houses01",		"Survivors",	1,	"-8 -80 -0",		"8 80 1221",		"744 -324 512" );
	make_clip(	"_cliprework_houses02",		"Survivors",	1,	"-100 -8 -170",		"100 8 1221",		"854 -272 512" );
	make_clip(	"_cliprework_houses03",		"Survivors",	1,	"-100 -8 -100",		"100 8 1221",		"1400 -158 512" );
	make_clip(	"_cliprework_houses04",		"Survivors",	1,	"-32 -8 -70",		"32 8 1221",		"1993 -254 512" );
	make_clip(	"_cliprework_houses05",		"Survivors",	1,	"-400 -8 -150",		"32 216 1221",		"2883 -465 602" );
	make_clip( "_dispcrouch_spawn", "Everyone", 1, "-140 -32 -64", "100 32 90", "-4294 -1729 -2", "0 -5 0" );
	make_clip( "_cliprework_unattackable", "Survivors", 1, "-8 -396 -164", "24 216 850", "-1608 -2368 884" );
	make_clip( "_cliprework_electricalbox", "Survivors", 1, "-6 -33 0", "5 25 406", "2667 -1769 164" );
	make_clip( "_cliprework_windows", "Survivors", 1, "-16 -304 -20", "0 288 68", "2688 -2136 372" );
	make_clip( "_cliprework_balcony", "Survivors", 1, "-86 -50 0", "84 46 1392", "2822 -1694 336" );
	make_clip( "_cliprework_awning", "Survivors", 1, "-68 -103 -68", "43 107 1431", "2885 -1580 297" );
	make_trighurt( "_instakill_deathcharger", "Survivor", "-256 -453 -17", "256 453 0", "-2449 122 -43" );
	patch_spawninfront( "288 -5284 93", "0 -96 0", "544 96 17" );

	if ( g_BaseMode == "versus" )
	{
		devchap( "BASE VERSUS" );

		// FIXES

		make_clip( "_cliprework_trucknuke", "Survivors", 1, "-180 -60 -2", "115 60 1624", "693 -1867 105", "0 43 0" );

		make_clip( "_cliprework_eventskip1", "Survivors", 1, "-55 -1 0", "58 1 1588", "852 -2433 140" );
		make_clip( "_cliprework_eventskip2", "Survivors", 1, "-209 -2 0", "192 2 1588", "661 -2569 140", "0 45 0" );
		make_clip( "_cliprework_eventskip3", "Survivors", 1, "-156 -1 0", "141 1 1588", "372 -2717 140" );
		make_clip( "_cliprework_eventskip4", "Survivors", 1, "-26 -59 0", "-24 41 1588", "242 -2757 140" );
	}
	if ( g_BaseMode == "survival" )
	{
		devchap( "BASE SURVIVAL" );

		// FIXES

		make_clip( "_booster_eatsign", "Survivors", 1, "-10 -64 -48", "10 69 1442", "-1649 -3723 293" );
	}

	if ( HasPlayerControlledZombies() )
	{
		kill_entity( Entities.FindByClassnameNearest( "func_breakable", Vector( -1335, -4910, 244 ), 1 ) );
		kill_funcinfclip( 1062.11 );
		kill_funcinfclip( 773.493 );
		//kill_funcinfclip( 928.269 );		// Delete clip above bookstore mid-event
		kill_funcinfclip( 1055.05 );		// Delete clip above start area's tall hilltop
		kill_funcinfclip( 718.274 );		// Delete clip above small Hunter-only roof bit that's non-NODRAW/culling
		kill_funcinfclip( 800.786 );		// 1st house: Sliver of frontal access for Hunter/Jockey
		// kill_funcinfclip( 805.326 );		// 2nd house: SKYBOX'd and completely irredeemable
		// kill_funcinfclip( 783.598 );		// 3rd house: SKYBOX'd on right side, far away from action, would only confuse
		kill_funcinfclip( 801.26 );		// 4th house: Useful but niche Tank perch with rooftop to hide with
		kill_funcinfclip( 775.207 );		// 5th house: In the action, maybe a useful Smoker
		kill_funcinfclip( 781.82 );		// 6th house: In the action, same (most rooftop real estate for SI so far)
		kill_funcinfclip( 773.906 );		// 7th house: Best new Tank rocking rooftop, definitely needs a ladder
		kill_funcinfclip( 769.448 );		// 8th house: Also good, easy jump from 7 but every USEFUL house warrants a ladder
		kill_funcinfclip( 773.906 );		// 9th house: Out of the action and useless, open by good gesture only
		//kill_funcinfclip( 748.323 );		// Delete clip above neighboring rooftop to new stained wall ladder
		kill_funcinfclip( 1156 );		// Delete clip over WELCOME TO HELL barricade
		kill_funcinfclip( 808.497 );		// Delete clip above FINE ANTIQUES building next to THEATRE
		make_atomizer( "_atomizer_bsp_carflorist", "-572 -2019 -48", "models/props_vehicles/cara_82hatchback.mdl", 60 );
		make_brush( "_losfix_bus1",		"-1 -128 -10",	"1 156 10",	"-1264 -4031 -54" );
		make_brush( "_losfix_bus2",		"-30 -1 -10",	"29 1 10",	"-1292 -3874 -54" );
		make_brush( "_losfix_truck",		"-1 -40 -11",	"1 40 11",	"-3636 -1019 -53" );
		make_brush( "_losfix_van1",		"-100 -1 -9",	"100 1 9",	"-3340 -1677 -47" );
		make_brush( "_losfix_van2",		"-70 -1 -8",	"70 1 8",	"-762 -2268 -48" );
		make_clip( "_fineantique_surf_collision", "SI Players", 1, "-320 -240 -56", "320 240 0", "1968 -4608 320" );
		make_clip( "_hellcade_clipa", "SI Players", 1, "-240 -8 0", "240 17 1792", "-5360 -504 -64" );
		make_clip( "_hellcade_clipb", "SI Players", 1, "-17 -840 0", "8 507 1792", "-5605 -1001 -64" );
		make_clip( "_hellcade_clipc", "SI Players", 1, "-240 -8 0", "275 17 1792", "-5360 -1857 -64" );
		make_clip( "_hellcade_permstuck", "SI Players", 1, "-8 -216 0", "8 216 17", "-5115 -1028 -49" );
		make_clip( "_ladder_eventskybridge_clip", "SI Players", 1, "-11 -23 0", "2 46 8", "-1314 -4766 296" );
		make_clip( "_ladder_starthilltop_clip", "SI Players", 1, "-16 -8 0", "16 8 2", "-4620 -1900 520", "0 -17.7 0" );
		make_clip( "_losblocker_deliveryclip", "Survivors", 1, "-57 -113 0", "56 171 1781", "583 -2463 -52", "0 -20 0" );
		make_clip( "_meticulous_funcinfclip01", "SI Players", 1, "-908 -17 -440", "114 17 1342", "-3906 -3153 384" );
		make_clip( "_meticulous_funcinfclip02", "SI Players", 1, "-17 -595 -731", "17 737 1051", "-4935 -2560 675", "0 13 0" );
		make_clip( "_meticulous_funcinfclip03", "SI Players", 1, "-679 -581 -81", "635 120 1169", "2038 -3044 560" );
		make_clip( "_yesdrawhellcade_collision", "SI Players", 1, "-0.5 -49.5 -30.5", "0.5 49.5 30.5", "-5254.8 -691.5 17", "13.3 14.3 1.5" );
		make_clip( "_ladderqol_churchleft",	"SI Players", 1, "-11 -2 -4", "11 2 4", "-3297 12.5 342", "0 0 45" );
		make_ladder( "_ladder_churchleftm3mirr_cloned_churchrearwrong", "-3286.5 58 236", "0 -65.2147 0" );
		make_ladder( "_ladder_eventfinalalley_cloned_endgraffiti", "319 -5601 38", "-6037 -5519 -24", "0 90 0", "0 -1 0" );
		make_ladder( "_ladder_eventpipewires_cloned_endchainlink", "287 -5293 21", "319 -10635 -6", "0 180 0", "1 0 0" );
		make_ladder( "_ladder_eventskybridge_cloned_churchwalltallest", "-2736 -152 118.5", "-4058 -4917 -54", "0 -180 0", "-1 0 0" );
		make_ladder( "_ladder_fineantiques_cloned_enddumpstertall", "-1190 -5451 100", "2797 1031 152" );
		make_ladder( "_ladder_house5sideup_cloned_churchwallmedium", "-2733 -521 80", "-2229 -1199 0", "0 -180 0", "-1 0 0" );
		make_ladder( "_ladder_house6semifront_cloned_house6semiback", "1429.1 -943.16 82.5", "2826 -1997 -2", "0 -180 0", "-0.26 -0.96 0" );
		make_ladder( "_ladder_house6telepole_cloned_eventbarricadepipe", "884 -3621 168", "-516 2307 -1134", "1 12 -20", "0.2 -0.918 0.34" );
		make_ladder( "_ladder_house7Bthin_cloned_balconytrimmed", "226 -2715.5 67", "2023 -3266 -6", "0 180 0", "0 -1 0" );
		make_ladder( "_ladder_house7Mthick_cloned_quadwindows", "2663.5 -2426 280", "-628 -3115 -40", "0 90 0", "0 -1 0" );
		make_ladder( "_ladder_house7Tthick_cloned_quadwindows", "2663.5 -2426 280", "-628 -3067 705", "13 90 0", "0 -1 0" );
		make_ladder( "_ladder_house8Bthin_cloned_balconytrimmed", "226 -2715.5 67", "2422 -3486 25", "0 180 0", "0 -1 0" );
		make_ladder( "_ladder_house8Tthick_cloned_policebarricade", "52.8641 -994.878 -4.11075", "3125 -636 278", "0 -90 0", "0 -1 0" );
		make_ladder( "_ladder_naturalstains_cloned_awningpipe", "2720 -1734 231.5", "-460 -794 97" );
		make_ladder( "_ladder_semitrucknose_cloned_startgenerator", "-2932 -770.5 1", "3793 -1881 -16", "0 -29 0", "-0.485 -0.875 0" );
		make_ladder( "_ladder_stainedboard_cloned_surplusfluff", "99 -4310.5 224", "5683 -3552 24", "0 -90 0", "1 0 0" );
		make_ladder( "_ladder_starthilltopB_cloned_awningpipe", "2720 -1734 231.5", "-6648.9 759.8 259", "4 -17.7 14", "0.311 0.919 0.241" );
		make_ladder( "_ladder_starthilltopM_cloned_awningpipe", "2720 -1734 231.5", "-6651.8 687.2 538", "4 -17.7 14", "0.311 0.919 0.241" );
		make_ladder( "_ladder_starthilltopT_cloned_awningpipe", "2720 -1734 231.5", "-6654 631 755", "4 -17.7 14", "0.311 0.919 0.241" );
		make_ladder( "_ladder_theatreleft_cloned_theatreright", "1142 -4311.5 20", "474 -4 0" );
		make_ladder( "_ladder_yesdrawhellbackL_cloned_copbarrfront", "44.5933 -994.7905 -4.1108", "-5164 328 -3" );
		make_ladder( "_ladder_yesdrawhellbackR_cloned_copbarrfront", "44.5933 -994.7905 -4.1108", "-5164 -351 -3" );
		make_ladder( "_ladder_yesdrawhellfrontL_cloned_copbarrback", "52.8641 -994.878 -4.1108", "-5110 -351 -3" );
		make_ladder( "_ladder_yesdrawhellfrontR_cloned_copbarrback", "52.8641 -994.878 -4.1108", "-5110 328 -3" );
		//make_ladder( "_ladder_yeswayendfront_cloned_yeswayendback", "3380.5 -3825 59.5", "6102 -8207 0", "0 171 0", "-0.99 0.16 0" );
		make_navblock( "_losblocker_deliverynavblock", "Everyone", "Apply", "-32 -64 -32", "32 64 32", "562 -2425 -48" );
		make_prop( "dynamic",		"_losblocker_deliveryvan",	"models/props_vehicles/deliveryvan.mdl",		"600 -2429 -47",		"-1 70 -3" );
		make_prop( "dynamic",		"_losblocker_deliveryvanglass",	"models/props_vehicles/deliveryvan_glass.mdl",	"600 -2429 -47",		"-1 70 -3",		"shadow_no" );
		make_prop( "dynamic",		"_losblocker_sheetrock",	"models/props_interiors/sheetrock_leaning.mdl",		"-368 -2142 -48",		"0 0 0",		"shadow_no" );
		make_prop( "dynamic", "_fineantique_surf1", "models/props_update/c8m1_rooftop_3.mdl", "2064 -4608 320.3", "0 0 0", "shadow_no" );
		make_prop( "dynamic", "_fineantique_surf2", "models/props_update/c8m1_rooftop_3.mdl", "1872 -4608 320.2", "0 0 0", "shadow_no" );
		make_prop( "dynamic", "_hellcade_m3mirr01", "models/props_c17/concrete_barrier001a.mdl", "-5136 -1224.06 -77.94", "0 0 0", "shadow_no" );
		make_prop( "dynamic", "_hellcade_m3mirr02", "models/props_c17/concrete_barrier001a.mdl", "-5136 -744.06 -74", "0 0 7.5", "shadow_no" );
		make_prop( "dynamic", "_hellcade_m3mirr03", "models/props_foliage/cedar01.mdl", "-5247.66 -1365 -91.57", "0 245.5 0", "shadow_no", "solid_no" );
		make_prop( "dynamic", "_hellcade_m3mirr04", "models/props_foliage/cedar01.mdl", "-5485.07 -1318.82 -96", "-1.17 226.96 3.83", "shadow_no", "solid_no" );
		make_prop( "dynamic", "_hellcade_m3mirr05", "models/props_street/concertinawire128.mdl", "-5112 -901.06 -35.94", "-1 0 0", "shadow_no", "solid_no" );
		make_prop( "dynamic", "_hellcade_m3mirr06", "models/props_street/concertinawire128.mdl", "-5114 -1026.06 -35.94", "-1 0 0", "shadow_no", "solid_no" );
		make_prop( "dynamic", "_hellcade_m3mirr07", "models/props_street/concertinawire128.mdl", "-5115 -1157.66 7.55", "1 0 180", "shadow_no", "solid_no" );
		make_prop( "dynamic", "_hellcade_m3mirr08", "models/props_street/concertinawire128.mdl", "-5116 -1158.06 -35.94", "-1 0 0", "shadow_no", "solid_no" );
		make_prop( "dynamic", "_hellcade_m3mirr09", "models/props_street/concertinawire128.mdl", "-5117 -1032.66 7.55", "1 0 180", "shadow_no", "solid_no" );
		make_prop( "dynamic", "_hellcade_m3mirr10", "models/props_street/concertinawire128.mdl", "-5119 -900.66 7.55", "1 0 180", "shadow_no", "solid_no" );
		make_prop( "dynamic", "_hellcade_m3mirr11", "models/props_street/stopsign01.mdl", "-5108 -1080.06 -73", "-5.8 179.41 6.27", "shadow_no" );
		make_prop( "dynamic", "_hellcade_m3mirr12", "models/props_street/stopsign01.mdl", "-5267.23 -719.82 -69.49", "-13.32 194.27 -1.49", "shadow_no" );
		make_prop( "dynamic", "_hellcade_m3mirr13", "models/props_street/stopsign01.mdl", "-5280.22 -667.42 -68.13", "-13.32 194.27 -1.49", "shadow_no" );
		make_prop( "dynamic", "_hellcade_wrongwaya", "models/props_misc/wrongway_sign01_optimized.mdl", "-5605 -1257 0", "0 0 0", "shadow_no", "solid_no", "255 255 255", 217, 17 );
		make_prop( "dynamic", "_hellcade_wrongwayb", "models/props_misc/wrongway_sign01_optimized.mdl", "-5605 -1001 0", "0 0 0", "shadow_no", "solid_no", "255 255 255", 217, 17 );
		make_prop( "dynamic", "_hellcade_wrongwayc", "models/props_misc/wrongway_sign01_optimized.mdl", "-5605 -745 0", "0 0 0", "shadow_no", "solid_no", "255 255 255", 217, 17 );
		make_prop( "dynamic", "_ladder_churchleftm3mirr_pipe", "models/props_rooftop/Gutter_Pipe_256.mdl", "-3276 -7 321", "0 -90 0", "shadow_no" );
		make_prop( "dynamic", "_solidify_stainedawning", "models/props_street/awning_department_store.mdl", "2036 -2528 385", "0 0 0", "shadow_no" );
		make_prop( "dynamic", "_stainedroof_wrongway1", "models/props_misc/wrongway_sign01_optimized.mdl", "1728 -2920 541", "0 90 0", "shadow_no", "solid_no", "255 255 255", 500, 17 );
		make_prop( "dynamic", "_stainedroof_wrongway2", "models/props_misc/wrongway_sign01_optimized.mdl", "2028 -2920 541", "0 90 0", "shadow_no", "solid_no", "255 255 255", 500, 17 );
		make_prop( "dynamic", "_stainedroof_wrongway3", "models/props_misc/wrongway_sign01_optimized.mdl", "2328 -2920 541", "0 90 0", "shadow_no", "solid_no", "255 255 255", 500, 17 );
		make_prop( "dynamic", "_yesdrawhellcade_surface", "models/props_update/c10m4_hellcade_nodraw.mdl", "-5093.8 -1038 0", "0 270 0", "shadow_no" );
		patch_ladder( "1698.6658 -3959.1636 -13.5", "0 -3 0" );
		patch_ladder( "1712.9192 -3843.1353 -12.5", "0 3 0" );

		// Car needs parenting, Survivors hardly see it and it has random color on previous map.

		make_prop( "physics", "_hittable_hellcar", "models/props_vehicles/cara_95sedan.mdl", "-5351 -993.06 -63.59", "0 354.5 0" );
		make_prop( "dynamic", "_hittable_hellcarglass", "models/props_vehicles/cara_95sedan_glass.mdl", "-5351 -993.06 -63.59", "0 354.5 0", "shadow_no" );

		EntFire( g_UpdateName + "_hittable_hellcarglass", "SetParent", g_UpdateName + "_hittable_hellcar" );
	}

	// Resolve stuck Tank spawns for Versus Survival & Taaannnk! Mutation.

	if ( g_MutaMode == "mutation15" )
	{
		// In Versus Survival's event area, block an inaccessible ladder
		// (to be restored in the future) behind a barricade, and then
		// also clip off excessive navmesh in far dark corner of the map.

		make_clip( "_tankstuck_endbarricade", "SI Players", 1, "-400 -900 0", "400 900 1700", "3822 -3970 0" );
		make_clip( "_tankstuck_excesscorner", "SI Players", 1, "-200 -100 0", "200 100 1700", "-2520 -5048 -64" );
	}

	if ( g_MutaMode == "mutation19" )
	{
		// Tons of possibilities to spawn behind the long row of houses
		// so just block them all off, tons of NODRAW and hostile clips.
		// Players would only materialize back here in Taaannnk! Mutation.

		make_clip( "_tankstuck_houserow", "SI Players", 1, "-2260 -440 0", "3450 900 1850", "68 158 -100" );

		// In Versus Survival's event area, block an inaccessible ladder
		// (to be restored in the future) behind a barricade, and then
		// also clip off excessive navmesh in far dark corner of the map.

		make_clip( "_tankstuck_endbarricade", "SI Players", 1, "-400 -900 0", "400 900 1700", "3822 -3970 0" );
		make_clip( "_tankstuck_excesscorner", "SI Players", 1, "-200 -100 0", "200 100 1700", "-2520 -5048 -64" );
	}
}