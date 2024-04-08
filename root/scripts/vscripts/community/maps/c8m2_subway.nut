g_Chapter = "NO MERCY - SUBWAY";

devchap( "ALL MODES" );

PrecacheModel( "models/props_update/c8m2_generatorroom.mdl" );
PrecacheModel( "models/props_swamp/plank001b_192.mdl" );
PrecacheModel( "models/props_update/c8m1_rooftop_3.mdl" );
PrecacheModel( "models/props_misc/wrongway_sign01_optimized.mdl" );
PrecacheModel( "models/props/cs_office/vending_machine.mdl" );

function DoRoundFixes()
{
	make_clip(	"_permstuck_piperoom",		"Everyone",	1,	"-88 -2 -17",		"88 2 10",		"7474 2355 -216" );
	make_clip(	"_tankwarp_pillar",		"Everyone",	1,	"-17 0 -2",		"10 12 88",		"7565 4164 -95" );
	make_clip(	"_busstop_fence",		"Survivors",	1,	"-512 -76 -620",	"512 76 620",		"8600 5556 788" );
	make_clip(	"_dispcrouch_cavea",		"Everyone",	1,	"-42 -120 -80",		"0 145 80",		"4354 3430 -174.7" );
	make_clip(	"_dispcrouch_caveb",		"Everyone",	1,	"-120 -42 -80",		"470 0 80",		"4497 3316 -174.7" );
	make_clip(	"_booster_windowandfence",	"Survivors",	1,	"-66 -56 -604",	"66 56 604",	"8458 3880 804" );
	make_clip(	"_booster_beama",		"Survivors",	1,	"-9 -474 -24",		"9 686 192",		"7176 3138 424" );
	make_clip(	"_booster_beamb",		"Survivors",	1,	"-9 -474 -24",		"9 686 192",		"7380 3138 424" );
	make_clip(	"_booster_beamc",		"Survivors",	1,	"-17 -474 -24",		"9 686 192",		"7568 3138 424" );
	make_clip(	"_booster_beamd",		"Survivors",	1,	"-17 -474 -24",		"10 686 192",		"7754 3138 424" );
	make_clip(	"_booster_beame",		"Survivors",	1,	"-9 -474 -24",		"10 686 192",		"7943 3138 424" );
	make_clip(	"_booster_boxrow",		"Survivors",	1,	"-370 -4 0",		"290 4 216",		"7827 3816 381" );
	make_clip( "_tankwarp_solidify", "SI Players and AI", 1, "-26 -30 0", "98 6 100", "5977 4742 -335", "0 -22 0" );
	make_clip( "_unattackable_building_top", "Survivors", 1, "-576 -336 -368", "576 336 368", "8896 4272 1040" );
	make_clip( "_unattackable_backalley1", "Survivors", 1, "-252 -311 0", "260 337 772", "6780 4279 632" );
	make_clip( "_unattackable_backalley2", "Survivors", 1, "-1191 -320 0", "1153 320 752", "8319 3520 660" );
	make_clip( "_unattackable_backalley3", "Survivors", 1, "-58 -7 0", "70 7 1402", "10298 3765 16" );
	make_clip( "_unattackable_backalley4", "Survivors", 1, "-359 -381 0", "393 387 722", "10871 4221 688" );
	make_clip( "_unattackable_pawnshop1", "Survivors", 1, "-8 -298 0", "8 434 1402", "11272 5336 16" );
	make_clip( "_unattackable_pawnshop2", "Survivors", 1, "-1024 -16 -105", "1152 16 912", "10112 5744 512" );
	make_clip( "_clipextend_ledgehang", "Survivors", 1, "-306 -80 0", "334 80 992", "9394 5648 416" );
	make_clip( "_unattackable_tanker1", "Survivors", 1, "-38 -461 0", "48 532 892", "6750 5141 512", "0 -26 0" );
	make_clip( "_unattackable_tanker2", "Survivors", 1, "-698 -12 -32", "428 12 872", "7700 5622 536" );
	make_clip( "_ladderqol_orangebags", "SI Players and AI", 1, "-29 -23 27", "24 32 32", "10660 5215 16", "-45 0 0" );
	make_clip( "_genroomrail_smoother1", "Everyone", 1, "-1 -33 0", "0 34 40", "7285 3633 248" );
	make_clip( "_genroomrail_smoother2", "Everyone", 1, "-1 -65 0", "0 66 40", "7285 2878 248" );

	local rail01_model = "models/props_unique/handrail_subway01.mdl";
	local rail02_model = "models/props_unique/handrail_subway02.mdl";
	local rail_name = "_invisible_railing";
	make_prop( "dynamic", rail_name, rail01_model, "3151.3601 3738.76 -256", "0 270 0", "shadow_no", "solid_no", "255 255 255", 800, 1000 );
	make_prop( "dynamic", rail_name, rail02_model, "3150.73 4389.2002 -256", "0 270 0", "shadow_no", "solid_no", "255 255 255", 800, 1000 );
	make_prop( "dynamic", rail_name, rail02_model, "4525.2598 3738.79 -256", "0 90 0", "shadow_no", "solid_no", "255 255 255", 1024, 1536 );
	EntFire( g_UpdateName + rail_name, "AddOutput", "mincpulevel 1" );
	EntFire( g_UpdateName + rail_name, "AddOutput", "maxcpulevel 1" );
	make_clip( "_commentary_electricalbox", "Survivors", 1, "-30 -5 -80", "30 5 148", "9638 5563 97" );

	con_comment( "FIX:\tGenerator Room has 13 hanging lights and 9 need to be made non-solid." );

	unsolidify_model( "models/props/de_nuke/IndustrialLight01.mdl" );

	if ( g_BaseMode != "coop" && g_BaseMode != "realism" )
	{
		make_clip( "_commentary_stuckwarp_undersafe_a", "Everyone", 1, "-4 -250 -60", "24 102 58", "2708 3050 -57.6663" );
		make_clip( "_commentary_stuckwarp_undersafe_b", "Everyone", 1, "-40 -40 -37", "8 8 75", "2744 2808 -75" );
		make_clip( "_commentary_stuckwarp_undersafe_c", "Everyone", 1, "-48 -8 -37", "48 22 75", "2784 2776 -75" );
		make_clip( "_stuckwarp_underspawn", "Everyone", 1, "-11 -7 0", "-3 10 70", "3111 2775 -70" );
		make_clip( "_stuckwarp_tunnelend", "Everyone", 1, "-12 -24 -14", "137 73 70", "4182 2831 -70", "0 -1 0" );
		make_clip( "_nav_tankjukepipes", "Survivors", 1, "-37 -168 0", "28 168 95", "8276 3656 140" );
		make_clip(	"_booster_pipe",		"Survivors",	1,	"-64 -32 0",		"64 32 90",		"7351 3792 144" );
	}
	if ( g_BaseMode == "versus" )
	{
		devchap( "BASE VERSUS" );

		// FIXES

		make_clip( "_nav_backlightleft", "Survivors", 1, "6 -13 -61", "9 15 84", "5249 4124 -265" );
		make_clip( "_nav_backlightright", "Survivors", 1, "6 -13 -61", "9 15 84", "5243 4210 -265" );
		make_clip( "_subwaymount_in", "Survivors", 1, "-49 -248 0", "63 247 58", "6337 3137 -154", "0 41 0" );
		make_clip( "_subwaymount_out", "Survivors", 1, "-49 -248 0", "63 247 58", "6769 2895 -154", "0 79 0" );
	}
	else if ( g_BaseMode == "survival" )
	{
		devchap( "BASE SURVIVAL" );

		// FIXES

		make_clip(	"_survival_vendors",		"Survivors",	1,	"-80 -32 0",		"80 55 284",		"7406 3769 381.4" );
	}

	if ( HasPlayerControlledZombies() )
	{
		kill_funcinfclip( 648.595 );	// Delete clip above SKYBOX-cornered roof right of end PAWN shop
		make_brush( "_losfix_copcar",		"-80 -1 -8",	"80 1 8",	"9996 5815 16" );
		make_brush( "_losfix_semi1",		"-1 -40 -18",	"1 40 18",	"9043 4927 26" );
		make_brush( "_losfix_semi2",		"-29 -1 -10",	"28 1 10",	"9073 4913 18" );
		make_clip( "_generator_qolstep1", "SI Players", 1, "0 -96 0", "0.1 96 8", "8021 2880 16" );
		make_clip( "_generator_qolstep2", "SI Players", 1, "0 -96 0", "0.1 96 8", "8021 3168 16" );
		make_clip( "_ladder_deadendrubble_clip", "Everyone", 1, "-18 -39 -87", "13 107 -5", "2149 3922 -242", "0 14 0" );
		make_clip( "_ladder_generatorwindow_clipa", "SI Players", 1, "-4 -40 -56", "376 128 231", "7944 2512 425" );
		make_clip( "_ladder_generatorwindow_clipb", "SI Players", 1, "-400 -40 -56", "4 128 231", "7568 2512 425" );
		make_clip( "_ladder_generatorwindow_clipc", "SI Players", 1, "-566 -216 -56", "586 10 231", "7734 2462 425" );
		make_clip( "_ladder_tanksubqol_clip", "Everyone", 1, "-22 3 0", "9 7 152", "6284 3290 -339", "0 -20 0" );
		make_clip( "_ladder_tanksubway_clip", "SI Players", 1, "-17 -43 0", "16 -2 8", "6999 2919 -188" );
		make_clip( "_unattackable_building_bot", "Survivors", 1, "-576 -336 -192", "576 336 192", "8896 4272 480" );
		make_ladder( "_ladder_deadendrubble_cloned_endfenceshortest", "10195 5726.5 67.766", "-5557 12709 -375", "0 -78 0", "0.97 0.2 0" );
		make_ladder( "_ladder_endpawnbrick_cloned_trashbagdrop", "8233 3844.5 278", "14396 -3589 -228", "0 90 0", "-1 0 0" );
		make_ladder( "_ladder_endpolicefence_cloned_oneunitbroke", "8657 5483.5 92", "1625 240 -40" );
		make_ladder( "_ladder_endquickroof_cloned_oneunitbroke", "8657 5483.5 92", "1525 13450 0", "0 -82.5 0", "-0.99 -0.13 0" );
		make_ladder( "_ladder_eventminigunnew_cloned_eventminigun", "7568 3663.5 184", "188 0 0" );
		make_ladder( "_ladder_eventwindowleftB_cloned_endfenceshortest", "10195 5726.5 67.766", "2272 13074 18", "0 -90 0", "1 0 0" );
		make_ladder( "_ladder_eventwindowleftT_cloned_eventwindowright", "7568 2816.5 178", "376 0 0" );
		make_ladder( "_ladder_genwinglassleft_cloned_firebarrelfence", "8988 5513.5 92", "-1140 -2857 219" );
		make_ladder( "_ladder_genwinglassright_cloned_firebarrelfence", "8988 5513.5 92", "-1327 -2857 219" );
		make_ladder( "_ladder_innertanker_cloned_nodrawfence", "8419.5 3882 91.5", "-2472 5376 -35", "0 -25.5 0", "0.9 -0.43 0" );
		make_ladder( "_ladder_newrocketboom_cloned_trashbagdrop", "8233 3844.5 278", "5620 12649 132", "0 -90 0", "1 0 0" );
		make_ladder( "_ladder_permstuckpawnfence_cloned_endfenceshortest", "10195 5726.5 67.766", "4946 15517 -9", "0 -90 0", "1 0 0" );
		make_ladder( "_ladder_permstuckpawnrear_cloned_eventminigun", "7568 3663.5 184", "3568 1208 -40" );
		make_ladder( "_ladder_postsubrubble_cloned_firebarrelfence", "8988 5513.5 92", "13166 -6148 -410", "0 90 0", "-1 0 0" );
		make_ladder( "_ladder_quickstepqol_cloned_wrongwayfence", "10362.5 3936 91.5", "-891 704 -63" );
		make_ladder( "_ladder_subwaynontrashside_cloned_endalleyfence", "8419.5 3882 91.5", "-856 12513 -352", "0 -90 0", "0 -1 0" );
		make_ladder( "_ladder_tanksubqol_cloned_copcarsbrick", "9732.5 6199.5 104", "2929 -7755 -379", "0 40.5 0", "0.76 0.64 0" );
		make_ladder( "_ladder_tanksubway_cloned_copcarsbrick", "9732.5 6199.5 104", "-2712 -3295 -372" );
		make_ladder( "_ladder_tanksubwreck_cloned_endfenceshortest", "10195 5726.5 67.766", "15920 5429 -354", "0 157.5 0", "-0.38 -0.92 0" );
		make_ladder( "_ladder_tankwarprubble_cloned_warehousewindow", "8472 3819.5 312", "-3056 5443 -610", "0 330.5 0", "-0.49 -0.87 0" );
		make_ladder( "_ladder_windowdropleft_cloned_trashbagdrop", "8233 3844.5 278", "4344 12888 -124", "0 -90 0", "1 0 0" );
		make_ladder( "_ladder_windowdropright_cloned_trashbagdrop", "8233 3844.5 278", "11007 -3519 -124", "0 90 0", "-1 0 0" );
		make_prop( "dynamic", "_yesdraw_generatorroom", "models/props_update/c8m2_generatorroom.mdl", "7748 2448.1 513", "0 -90 0", "shadow_no", "solid_no" );
		make_prop( "dynamic", "_yesdraw_planka", "models/props_swamp/plank001b_192.mdl", "7283 2638 424", "110 0 90", "shadow_no", "solid_no" );
		make_prop( "dynamic", "_yesdraw_plankb", "models/props_swamp/plank001b_192.mdl", "7477 2638 444", "80 0 90", "shadow_no", "solid_no" );
		make_prop( "dynamic", "_yesdraw_plankc", "models/props_swamp/plank001b_192.mdl", "8040 2638 435", "93 0 90", "shadow_no", "solid_no" );
		make_prop( "dynamic", "_yesdraw_tallroof_hunt1", "models/props_update/c8m1_rooftop_3.mdl", "8961 4364 1215.9", "0 0 0", "shadow_no" );
		make_prop( "dynamic", "_yesdraw_tallroof_hunt2", "models/props_update/c8m1_rooftop_3.mdl", "8548 4364 1215.99", "0 0 0", "shadow_no" );
		make_prop( "dynamic", "_yesdraw_wrongwaya", "models/props_misc/wrongway_sign01_optimized.mdl", "7540 2556 410", "0 0 0", "shadow_no", "solid_no", "255 255 255", 220, 0 );
		make_prop( "dynamic", "_yesdraw_wrongwayb", "models/props_misc/wrongway_sign01_optimized.mdl", "7971 2556 410", "0 180 0", "shadow_no", "solid_no", "255 255 255", 220, 0 );
		make_prop( "dynamic", "_yesdraw_wrongwayc", "models/props_misc/wrongway_sign01_optimized.mdl", "7756 2440 410", "0 90 0", "shadow_no", "solid_no", "255 255 255", 220, 0 );
		patch_ladder( "8657 5483.5 92", "0 -1 0" );

		con_comment( "FIX:\tGenerator Room has 13 hanging lights and 9 need to be made non-solid." );

		unsolidify_model( "models/props/de_nuke/IndustrialLight01.mdl" );
	}

	// Resolve stuck Tank spawns for Versus Survival & Taaannnk! Mutation.

	if ( g_MutaMode == "mutation15" )
	{
		// Multiple stuck spawns are only relevant to Taaannnk! Mutation,
		// except for this: copy the invisible vending machine so players
		// have a visible "step" to get back in bounds. (Not actually stuck)

		make_prop( "dynamic", "_cosmetic_oobstep", "models/props/cs_office/vending_machine.mdl", "7366 3801 270", "90 0 0", "shadow_no", "solid_no" );
	}
	else if ( g_MutaMode == "mutation19" )
	{
		// Multiple tunnel stuck spawns that aren't accessible in Survival,
		// that need to only be fixed for Taaannnk! Mutation. Navmesh is
		// excessive and extends too far behind these rubbles/wrongways.

		make_clip( "_tankstuck_rubblestart", "SI Players", 1, "-139 -107 0", "119 99 177", "1621 3617 -337", "0 42 0" );
		make_clip( "_tankstuck_rubblemiddle", "SI Players", 1, "-189 -145 0", "300 179 240", "6766 5299 -336", "0 -68 0" );
		make_clip( "_tankstuck_rubblefinal", "SI Players", 1, "-189 -253 0", "140 320 176", "8249 3222 -336", "0 -53 0" );

		// Multiple difficult-but-possible to spawn stuck areas in end area.

		make_clip( "_tankstuck_endalley1", "SI Players", 1, "-480 -855 0", "65 293 1400", "10303 3479 16" );
		make_clip( "_tankstuck_endalley2", "SI Players", 1, "-373 -96 0", "395 99 1400", "11637 5342 16" );
		make_clip( "_tankstuck_widestreet", "SI Players", 1, "-842 0 0", "386 555 1400", "10110 6784 8" );
	}
}