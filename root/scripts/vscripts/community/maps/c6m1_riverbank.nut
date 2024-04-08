g_Chapter = "THE PASSING - RIVERBANK";

devchap( "ALL MODES" );

PrecacheModel( "models/props_vehicles/racecar_damaged_glass.mdl" );
PrecacheModel( "models/props_interiors/desk_metal.mdl" );
PrecacheModel( "models/props_highway/plywood_02.mdl" );
PrecacheModel( "models/props/cs_office/file_cabinet1.mdl" );
PrecacheModel( "models/props/cs_office/file_cabinet3.mdl" );
PrecacheModel( "models/props_rooftop/acvent04.mdl" );
PrecacheModel( "models/props_urban/chimney007.mdl" );
PrecacheModel( "models/props_misc/wrongway_sign01_optimized.mdl" );

function DoRoundFixes()
{
	make_clip(	"_permstuck_tarptree",		"Everyone",	1,	"-17 -69 -17",		"17 17 17",		"1166 3794 191" );
	make_clip(	"_commonhop_windowsill",	"Survivors",	1,	"-6 -216 0",		"6 216 800",		"539 2861 237" );
	make_clip(	"_curvejump_pixelperfect",	"Survivors",	1,	"-24 -64 -128",		"24 64 128",		"4784 3785 83" );
	make_clip(	"_permstuck_fence",		"Survivors",	1,	"-24 -48 0",		"24 48 92",		"-1391 1293 247" );
	make_clip(	"_permstuck_floodlight",	"Everyone",	1,	"-10 -8 -43",		"10 8 43",		"2012 1626 555" );
	make_clip(	"_commonhop_endfence",		"Survivors",	1,	"-8 -128 -600",		"8 128 600",		"-3880 1648 1308" );
	make_clip(	"_commonhop_busa",		"Survivors",	1,	"-216 -20 0",		"216 20 1200",		"-3653 2324 705" );
	make_clip(	"_sneaky_hunter",		"SI Players",	1,	"-144 -136 -368",	"144 136 368",		"5296 2488 1008" );
	make_clip(	"_clipgap_fence",		"Survivors",	1,	"-32 -253 -360",	"32 256 360",		"584 2366 456" );
	make_clip(	"_commonhop_windows",		"Survivors",	1,	"-700 -8 -70",		"700 8 70",		"1400 2648 390" );
	make_clip(	"_clipextend_parking",		"Survivors",	1,	"-88 -182 -256",		"88 182 256",		"4848 2826 448" );
	make_clip(	"_cliprework_emptylargerooms",	"Survivors",	1,	"-440 -275 0",		"440 260 316",		"1072 1883 512" );
	make_clip( "_dispcrouch_concretea", "Everyone", 1, "-8 -61 0", "8 61 375", "4035 1016 137", "0 -95 0" );
	make_clip( "_dispcrouch_concreteb", "Everyone", 1, "-8 -150 0", "8 200 375", "4212 901 137", "0 -133 0" );
	make_clip( "_cliprework_startroof", "Survivors", 1, "-5 -1040 -60", "7 676 1200", "709 4088 344" );
	make_clip( "_cliprework_endroof", "Survivors", 1, "-9 -884 0", "9 461 839", "-3913 1061 1056" );
	make_clip( "_cliprework_endwindows1", "Survivors", 1, "-15 -155 0", "7 151 90", "-3844 -270 1035" );
	make_clip( "_cliprework_endwindows2", "Survivors", 1, "-8 -160 0", "8 158 129", "-3911 561 863" );
	make_clip( "_cliprework_endwindows3", "Survivors", 1, "-8 -161 0", "8 157 128", "-3880 1082 895" );
	make_clip( "_dispcrouch_caralarm", "Everyone", 1, "-58 -8 0", "58 8 155", "1415 980 357", "0 -39 0" );
	make_clip( "_commentary_rayfordcollision", "All and Physics", 1, "-57 -92 -76", "57 92 76", "641 3804 164" );
	make_clip( "_commentary_clipgap_river_a", "Everyone", 1, "-128 -1552 -1592", "128 1552 1592", "-1408 5136 1504" );
	make_clip( "_commentary_clipgap_river_b", "Everyone", 1, "-3365 -32 -1592", "3365 32 1592", "2085 6656 1504" );
	make_clip( "_commentary_clipgap_river_c", "Everyone", 1, "-333 -1423 -1592", "333 1432 1592", "5783 5265 1504" );
	make_clip( "_commentary_clipgap_river_d", "Everyone", 1, "-334 -746 -1015", "334 746 1015", "5782 3097 2081" );
	make_clip( "_commentary_clipgap_streetbarricade", "Survivors", 1, "-100 -174 -884", "100 174 884", "4715 946 1044" );
	make_clip( "_commentary_clipgap_wedding", "Everyone", 1, "-160 -297 -1196", "160 297 1196", "1120 -1912 1900" );
	make_clip( "_commentary_clipgap_endsaferoom", "Everyone", 1, "-660 -616 -80", "8 700 600", "-3880 2380 1360" );

	make_prop( "dynamic",		"_cosmetic_hifunreal",		"models/props_vehicles/racecar_damaged_glass.mdl",	"928 4016 90",			"0.0 0.0 -1.5",		"shadow_no" );

	make_prop( "dynamic", "_cosmetic_left_desk1", "models/props_interiors/desk_metal.mdl", "910 1652 527", "90 -90 0", "shadow_no", "solid_no" );
	make_prop( "dynamic", "_cosmetic_left_desk2", "models/props_interiors/desk_metal.mdl", "855 1634 527", "0 -90 30", "shadow_no", "solid_no" );
	make_prop( "dynamic", "_cosmetic_left_plywood", "models/props_highway/plywood_02.mdl", "930 1615 605", "12 0 90", "shadow_no", "solid_no" );
	make_clip( "_cosmetic_left_collision", "SI Players and AI", 1, "-78 -18 -30", "58 14 6", "890 1637 542" );

	make_prop( "dynamic_ovr", "_cosmetic_right_cab1", "models/props/cs_office/file_cabinet1.mdl", "1455 1636 512", "0 -125 0", "shadow_no", "solid_no" );
	make_prop( "dynamic_ovr", "_cosmetic_right_cab2", "models/props/cs_office/file_cabinet3.mdl", "1420 1634 512", "0 -75 0", "shadow_no", "solid_no" );
	make_prop( "dynamic_ovr", "_cosmetic_right_cab3", "models/props/cs_office/file_cabinet3.mdl", "1395 1634 512", "0 -95 0", "shadow_no", "solid_no" );
	make_prop( "dynamic", "_cosmetic_right_plywood", "models/props_highway/plywood_02.mdl", "1450 1615 621", "-3 0 90", "shadow_no", "solid_no" );
	make_clip( "_cosmetic_right_collision", "SI Players and AI", 1, "-17 -18 -30", "73 14 6", "1400 1637 542" );

	if ( g_BaseMode != "coop" && g_BaseMode != "realism" )
	{
		make_clip(	"_ghostgrief_tarpledge",	"Survivors",	1,	"-4 -313 -145",		"4 466 1337",		"1148 4257 96" );
		make_clip( "_cliprework_bridgeroof", "Survivors", 1, "-218 -166 -4", "298 186 8", "927 4579 302" );
		make_clip( "_cliprework_bridgewall", "Survivors", 1, "-218 -166 -4", "298 -154 1200", "927 4579 302" );
		make_clip(	"_commonhop_awning",		"Survivors",	1,	"-106 -42 -1042",		"107 55 1042",		"3824 2666 1306" );
		make_clip(	"_fence_onea",			"Survivors",	1,	"-394 -66 -376",		"394 66 376",		"50 1470 888" );
		make_clip(	"_fence_oneb",			"Survivors",	1,	"-8 -322 -376",		"8 322 376",		"-352 1086 888" );
		make_clip(	"_fence_two",			"Survivors",	1,	"-222 -174 -383",		"222 174 383",		"-122 590 881" );
		make_clip( "_booster_gazebo", "Survivors", 1, "-184 -184 -94", "186 184 2122", "-1647 -365 999" );
		make_clip( "_cliprework_endfence", "Survivors", 1, "-5 -146 0", "27 200 779", "-2317 560 821" );
		make_clip(	"_commonhop_busb",		"Survivors",	1,	"-9 -777 -64",		"9 777 444",		"-3432 1527 926" );
	}
	if ( g_BaseMode == "survival" )
	{
		devchap( "BASE SURVIVAL" );

		// FIXES

		make_clip( "_survival_tree_01", "Survivors", 1, "-134 -134 0", "134 134 2288", "1506 -942 817" );
		make_clip( "_survival_tree_02", "Survivors", 1, "-134 -134 0", "134 134 2288", "1621 -367 817" );
		make_clip( "_survival_tree_03", "Survivors", 1, "-134 -134 0", "134 134 2288", "1659 234 817" );
		make_clip( "_survival_tree_04", "Survivors", 1, "-134 -134 0", "134 134 2288", "317 -966 830" );
		make_clip( "_survival_tree_05", "Survivors", 1, "-134 -134 0", "134 134 2288", "-75 -980 870" );
		make_clip( "_survival_tree_06", "Survivors", 1, "-134 -134 0", "134 134 2288", "-170 -352 800" );
		make_clip( "_survival_tree_07", "Survivors", 1, "-134 -134 0", "134 134 2288", "30 302 830" );
		make_clip( "_survival_tree_08", "Survivors", 1, "-134 -134 0", "134 134 2288", "-455 244 830" );
		make_clip( "_survival_tree_09", "Survivors", 1, "-134 -134 0", "134 134 2288", "-634 -154 830" );
		make_clip( "_survival_tree_10", "Survivors", 1, "-134 -134 0", "134 134 2288", "-644 -578 870" );
		make_clip( "_survival_tree_11", "Survivors", 1, "-134 -134 0", "134 134 2288", "-956 233 830" );
		make_clip( "_survival_tree_12", "Survivors", 1, "-134 -134 0", "134 134 2288", "-1019 -143 870" );
		make_clip( "_survival_tree_13", "Survivors", 1, "-134 -134 0", "134 134 2288", "-1026 -569 870" );
		make_clip( "_survival_tree_14", "Survivors", 1, "-134 -134 0", "134 134 2288", "-1476 -1023 870" );
		make_clip( "_survival_tree_15", "Survivors", 1, "-134 -134 0", "134 134 2288", "-1476 249 870" );
		make_clip( "_survival_tree_16", "Survivors", 1, "-134 -134 0", "134 134 2288", "-1976 -1025 870" );
		make_clip( "_survival_tree_17", "Survivors", 1, "-134 -134 0", "134 134 2288", "-1982 260 870" );
		make_clip( "_survival_tree_18", "Survivors", 1, "-134 -134 0", "134 134 2288", "-2490 -900 870" );
		make_clip( "_survival_tree_19", "Survivors", 1, "-34 -134 0", "134 134 2288", "-2504 185 880" );
		make_clip( "_survival_tree_20", "Survivors", 1, "-134 -134 0", "134 134 2288", "-3266 195 870" );
		make_clip( "_survival_tree_21", "Survivors", 1, "-134 -134 0", "134 134 2288", "-3271 -890 870" );
		make_clip( "_survival_tree_22", "Survivors", 1, "-189 -188 0", "188 188 2288", "800 -64 747" );
		make_clip( "_survival_tree_23", "Survivors", 1, "-80 -80 0", "80 80 2288", "-1502 -606 850" );
		make_clip( "_survival_tree_tent", "Survivors", 1, "-18 -171 0", "95 97 2205", "-2633 222 963" );
	}

	if ( HasPlayerControlledZombies() )
	{
		make_brush( "_losfix_bus",		"-1 -124 -9",	"1 124 9",	"-3624 101 713" );
		make_brush( "_losfix_van",		"-1 -72 -10",	"1 72 10",	"3897 1356 148" );
		make_clip( "_endsaferoof_wrongway_clip", "SI Players", 1, "-287 -174 -140", "220 130 1759", "-4128 350 1337" );
		make_clip( "_semiperm_endsaferoof", "SI Players", 1, "-8 0 0", "104 270 144", "-4344 482 1192" );
		make_clip( "_ladder_startalternativeB_clipleft", "Everyone", 1, "-8 -16 0", "8 16 249", "701 4025 96", "0 -45 0" );
		make_clip( "_ladder_startalternativeB_clipright", "Everyone", 1, "-8 -16 0", "8 16 249", "701 4071 96", "0 45 0" );
		make_clip( "_ladder_upperbalconynear_clip", "Everyone", 1, "-3 0 0", "3 16 372", "3968 1825 199", "0 11 0" );
		make_clip( "_infected_mapescape", "SI Players", 1, "-1000 -350 -20", "40 808 245", "-1997 1497 192" );
		make_ladder( "_ladder_brideentryleft_cloned_brideentryright", "196 422 574", "1199 -13 -20" );
		make_ladder( "_ladder_elecbox_cloned_bluebin", "2528 1030 342", "-2645 -251 42" );
		make_ladder( "_ladder_elecboxsafehouse_cloned_bluebin", "2528 1030 342", "-6434 498 516" );
		make_ladder( "_ladder_endfencefront_cloned_endfenceback", "-3879.68 1645.6 787", "-7751 3326 -2", "0 180 0", "1 0 0" );
		make_ladder( "_ladder_endsafehouse_cloned_windowtallright", "1664 2662 228", "-6535 2676 610", "0 -90 0", "1 0 0" );
		make_ladder( "_ladder_endshorthouse_cloned_windowshortleft", "1136 2662 212", "-6567 1760 608", "0 -90 0", "1 0 0" );
		make_ladder( "_ladder_endtallbrickleft_cloned_bluebin", "2528 1030 342", "-4866 2127 480", "0 -90 0", "1 0 0" );
		make_ladder( "_ladder_endtallbrickright_cloned_bluebin", "2528 1030 342", "-4866 2383 480", "0 -90 0", "1 0 0" );
		make_ladder( "_ladder_endtransitfence_cloned_dispcrouchfence", "4673 994 239.551", "-6991 -432 470" );
		make_ladder( "_ladder_startalternativeB_cloned_windowtallright", "1664 2662 228", "-1947 5712 -16", "0 -90 0", "1 0 0" );
		make_ladder( "_ladder_startalternativeT_cloned_starttallangled", "684.191 3062 368", "1365 7121 0", "0 180 0", "0 1 0" );
		make_ladder( "_ladder_startpermstuck_cloned_endleftfence", "-3575 -1142 777.5", "4159 3762 -608" );
		make_ladder( "_ladder_tankfenceback_cloned_startfence", "527 2940 162.12", "-1927 -1661 107" );
		make_ladder( "_ladder_tankfencefront_cloned_dispcrouchfence", "4673 994 239.551", "-6066 228 26" );
		make_ladder( "_ladder_upperbalconynear_cloned_upperbalconyfar", "3078 1644 376", "890 164 10" );
		make_ladder( "_ladder_witchentryfrontleft_cloned_witchentryback", "-1356.6 412.195 698.459", "-2713 805 0", "0 -180 0", "0 -1 0" );
		make_ladder( "_ladder_witchentryfrontright_cloned_witchentryback", "-1356.6 412.195 698.459", "-2016 805 0", "0 -180 0", "0 -1 0" );
		make_ladder( "_ladder_witchfarbackL_cloned_witchentryback", "-1356.6 412.195 698.459", "-3434 -730 65", "0 -180 0", "0 -1 0" );
		make_ladder( "_ladder_witchfarbackM_cloned_witchentryback", "-1356.6 412.195 698.459", "-2669 -730 65", "0 -180 0", "0 -1 0" );
		make_ladder( "_ladder_witchfarbackR_cloned_witchentryback", "-1356.6 412.195 698.459", "-1905 -730 65", "0 -180 0", "0 -1 0" );
		make_ladder( "_ladder_witchtentsleft_cloned_witchhedgeleft", "-1594 -920 700", "-1462 536 0", "0 90 0", "0 1 0" );
		make_ladder( "_ladder_witchtentsright_cloned_witchhedgeleft", "-1594 -920 700", "-2232 536 0", "0 90 0", "0 1 0" );
		make_prop( "dynamic", "_solidify_endacvent", "models/props_rooftop/acvent04.mdl", "-3920 1027 1056.8", "0 180 0", "shadow_no" );
		make_prop( "dynamic", "_solidify_endchimney", "models/props_urban/chimney007.mdl", "-4027.48 830.86 1056", "2 270 0", "shadow_no" );
		make_prop( "dynamic", "_tankfence_wrongway", "models/props_misc/wrongway_sign01_optimized.mdl", "-2025 1527 259", "0 326.5 0", "shadow_no", "solid_no", "255 255 255", "17", "217" );
	}

	// Resolve stuck Tank spawns for Taaannnk! Mutation.

	if ( g_MutaMode == "mutation19" )
	{
		// At the start area, extend a func_playerinfected_clip back a
		// bit more to prevent a stuck spawn if Survivors stand back to fence.

		make_clip( "_tankstuck_startfence", "SI Players", 1, "-251 -760 0", "173 216 1513", "-261 2872 87" );
	}
}