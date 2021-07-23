g_Chapter = "THE PARISH - CEMETERY";

devchap( "ALL MODES" );

function DoRoundFixes()
{
    make_clip(	"_commonhop_rooftop",		"Survivors",	1,	"-24 -4 -28",		"24 4 88",		"3080 1407 222" );
    make_clip(	"_sewer_holed",			"Survivors",	1,	"-4 -40 -44",		"4 40 44",		"5212 -112 -116" );
    make_clip(	"_sewer_holec",			"Survivors",	1,	"-264 -4 -44",		"264 4 44",		"5968 -452 -116" );
    make_clip(	"_sewer_holeb",			"Survivors",	1,	"-4 -376 -44",		"4 376 44",		"6532 224 -116" );
    make_clip(	"_sewer_holea",			"Survivors",	1,	"-384 -4 -44",		"384 4 44",		"5848 964 -116" );
    make_clip(	"_bunnyhop_underfence",		"Survivors",	1,	"-36 -2 -268",		"36 2 268",		"5948 -2330 688" );
    make_clip(	"_commonhop_overpass",		"Survivors",	1,	"-544 -576 -160",	"544 576 365",		"4896 7744 320" );
    make_clip(	"_manhole_fencea",		"Survivors",	1,	"-136 -584 -160",	"0 584 320",		"4489 1194 321" );
    make_clip(	"_manhole_fenceb",		"Survivors",	1,	"-56 -122.5 -160",	"56 122.5 320",		"4445 504 320",		"0 15 0" );
    make_clip(	"_manhole_fencec",		"Survivors",	1,	"-56 -122.5 -160",	"56 122.5 320",		"4437 268 320",		"0 -15 0" );
    make_clip(	"_manhole_fenced",		"Survivors",	1,	"-36.5 -151 -160",	"36.5 151 320",		"4399 33 326" );
    make_clip(	"_manhole_fencee",		"Survivors",	1,	"-180 -40 -160",	"180 40 320",		"4182 -127 328" );
    make_clip(	"_ladderqol_overpass",		"SI Players",	1,	"-18.5 -12 -95",	"18.5 12 95",		"5851 8704 192" );
    make_clip(	"_stuckwarp_wrongwaya",		"SI Players",	1,	"-82.5 -201 -111",	"82.5 201 111",		"6275 9035 242" );
    make_clip(	"_stuckwarp_wrongwayb",		"SI Players",	1,	"-21.5 -276 -111",	"21.5 276 111",		"6336 8960 242" );
    make_clip(	"_permstuck_jetstrike",		"Everyone",	1,	"-46.5 -27.5 -25",	"46.5 27.5 25",		"6233 -2190 453" );
    make_clip(	"_permstuck_cemetery",		"Everyone",	1,	"-145 -27 0",		"145 27 1234",		"7453 -6553 95" );
    make_clip(	"_commonhop_endfence",		"Survivors",	1,	"-64 -4 -44",		"64 4 580",		"9152 -9004 380" );
    make_clip(	"_stuckwarp_staircase",		"Everyone",	1,	"-32 -4 -64",		"64 4 458",		"3504 2668 182" );
    make_clip(	"_permstuck_dualfence",		"Survivors",	1,	"-28 -445 0",		"28 445 654",		"3421 733 3.1" );
    make_clip( "_cliprework_pinkhouse", "Survivors", 1, "-386 -270 0", "414 274 320", "3434 4094 360" );
    make_clip( "_cliprework_perchroof", "Survivors", 1, "-136 -192 0", "136 192 487", "4856 3040 164" );
    make_clip( "_nav_brokenhome_highcorner", "Survivors", 1, "-4 -83 0", "16 378 469", "2052 2534 160" );
    make_clip( "_nav_opencrypt", "Survivors", 1, "-26 -47 0", "7 49 1000", "9604 -6659 344" );
    make_clip( "_nav_cornertree", "Survivors", 1, "-83 -116 0", "97 180 935", "10459 -4981 409" );

    if ( g_BaseMode == "versus" )
    {
        devchap( "BASE VERSUS" );

        // FIXES

        make_clip( "_shortcut_vanjump", "Survivors", 1, "-41 0 0", "41 5 59", "4425 5257 28", "0 -16 10" );

        make_clip( "_nav_brokenhome_shortcuta", "Survivors", 1, "-5 -51 0", "5 66 130", "2301 958 31", "-10 0 0" );
        make_clip( "_nav_brokenhome_shortcutb", "Survivors", 1, "-5 -51 0", "5 66 130", "2302 1290 31", "-10 0 0" );

    }

    if ( HasPlayerControlledZombies() )
    {
        make_brush( "_losfix_bridgesemi",	"-30 -1 -12",	"30 1 12",	"6218 -2306 446" );
        make_brush( "_losfix_busdrop",		"-64 -1 -15",	"64 1 15",	"4304 5208 11" );
        make_brush( "_losfix_lot_truck1",	"-30 -1 -16",	"30 1 16",	"5755 -1088 16" );
        make_brush( "_losfix_lot_truck2",	"-30 -1 -16",	"30 1 16",	"5647 -1434 16" );
        make_brush( "_losfix_lot_van1",		"-64 -1 -10",	"64 1 10",	"6195 261 6" );
        make_brush( "_losfix_lot_van2",		"-96 -1 -14",	"96 1 14",	"5692 484 17" );
        make_brush( "_losfix_lot_van3",		"-90 -1 -10",	"90 1 10",	"6206 -831 7" );
        make_brush( "_losfix_mainst_trailer",	"-1 -245 -10",	"1 258 10",	"4444 3019 10" );
        make_brush( "_losfix_mainst_van",	"-1 -90 -10",	"1 90 10",	"4123 3902 6" );
        make_brush( "_losfix_sewer_van",	"-1 -77 -10",	"1 77 10",	"3924 802 10" );
        make_clip( "_barricade_stepcollision1", "SI Players", 1, "-360 -8 0", "360 32 69", "2656 835 50" );
        make_clip( "_barricade_stepcollision2", "SI Players", 1, "-32 -8 0", "32 32 72", "2973 822 0" );
        make_clip( "_burntbuild_collision01", "SI Players", 1, "-102 -98 -4", "102 98 4", "2208 642 242", "26 0 0" );
        make_clip( "_burntbuild_collision02", "SI Players", 1, "-102 -128 -4", "102 98 4", "2026 642 242", "-26 0 0" );
        make_clip( "_burntbuild_collision03", "SI Players", 1, "-102 -111 0", "102 98 4", "2210 1042 200", "23 -9 -19" );
        make_clip( "_burntbuild_collision04", "SI Players", 1, "-205 -147 -4", "172 17 2", "2123 1046 170", "1 0 -8" );
        make_clip( "_burntbuild_collision05", "SI Players", 1, "-120 -140 0", "102 110 4", "2028 1042 206", "-26 10 -17" );
        make_clip( "_burntbuild_collision06", "SI Players", 1, "-102 -108 -4", "102 128 4", "2210 1258 205", "26 5 10" );
        make_clip( "_burntbuild_collision07", "SI Players", 1, "-198 -32 -4", "177 128 4", "2116 1254 157", "-5.5 0 14" );
        make_clip( "_burntbuild_collision08", "SI Players", 1, "-108 -101 -4", "96 42 4", "2028 1258 207", "-26 -5 10" );
        make_clip( "_burntbuild_collision09", "SI Players", 1, "-188 -80 -4", "188 64 4", "2250 2021 163", "5 1 24" );
        make_clip( "_burntbuild_collision10", "SI Players", 1, "-102 0 0", "102 91 4", "2337 2084 198", "19 0 0" );
        make_clip( "_burntbuild_collision11", "SI Players", 1, "-188 -98 -4", "208 98 2", "2244 2083 141", "5 0 6" );
        make_clip( "_burntbuild_collision12", "SI Players", 1, "-102 0 0", "95 78 4", "2155 2084 215", "-10 0 0" );
        make_clip( "_burntbuild_collision13", "SI Players", 1, "-188 -82 -4", "188 82 4", "2243 2710 152", "-4 0 0" );
        make_clip( "_burntbuild_collision14", "SI Players", 1, "-90 -132 0", "122 104 4", "2337 2799 259", "39 7 14" );
        make_clip( "_burntbuild_collision15", "SI Players", 1, "-182 -80 -2", "182 80 2", "2243 2796 225", "14 0 13" );
        make_clip( "_burntbuild_collision16", "SI Players", 1, "-100 -111 0", "115 17 4", "2155 2799 292", "-11 -6 10" );
        make_clip( "_ladder_onewayshedback_clip", "Everyone", 1, "-17 -6 0", "8 0 141", "7000 -4026 117", "0 21 0" );
        make_ladder( "_ladder_1stdumpster1_cloned_stuckfencefront", "3420 1168 56.5", "1330 3691 -20", "0 23 0", "0.39 -0.92 0" );
        make_ladder( "_ladder_1stdumpster2_cloned_stuckfencefront", "3420 1168 56.5", "1071 3581 -20", "0 23 0", "0.39 -0.92 0" );
        make_ladder( "_ladder_1stdumpster3_cloned_stuckfenceback", "3420 298 56.5", "677 4507 -20", "0 23 0", "-0.39 0.92 0" );
        make_ladder( "_ladder_2nddumpster1_cloned_stuckfenceback", "3420 298 56.5", "-394 1654 -23" );
        make_ladder( "_ladder_2nddumpster2_cloned_stuckfenceback", "3420 298 56.5", "-114 1654 -23" );
        make_ladder( "_ladder_atticgutterB_cloned_largetrailer", "2782 960 80", "227 -656 -46" );
        make_ladder( "_ladder_atticgutterT_cloned_largetrailer", "2782 960 80", "227 -656 114" );
        make_ladder( "_ladder_burntbuildleft_cloned_blownwallleft", "3778 656 100", "-1475 32 -5" );
        make_ladder( "_ladder_collosaldumpster_cloned_manholeblownwall", "3778 656 100", "2224 5859 0", "0 -90 0", "0 -1 0" );
        make_ladder( "_ladder_concreteupper_cloned_startfence", "5940 8462 89.6381", "-1152 -1293 68" );
        make_ladder( "_ladder_dumpsterfence_cloned_startfence", "5940 8462 89.6381", "-2549 -2219 -9" );
        make_ladder( "_ladder_elecbox_cloned_largetrailer", "2782 960 80", "663 357 55" );
        make_ladder( "_ladder_endfenceback_cloned_lastcrypt", "8376 -7562 235", "16249 -16025 -42", "0 -180 0", "0 -1 0" );
        make_ladder( "_ladder_endfencefront_cloned_lastcrypt", "8376 -7562 235", "-505 -887 -42" );
        make_ladder( "_ladder_fencecornerleft_cloned_fencebackeastr", "2172 46 55.5", "900 -162 0" );
        make_ladder( "_ladder_fencecornerright_cloned_fencebacksouthl", "2500 -142 55.5", "-302 655 0" );
        make_ladder( "_ladder_firebarrelroofB_cloned_vandropelecbox", "4462 4992 104", "-1329 609 -8" );
        make_ladder( "_ladder_firebarrelroofT_cloned_vandropelecbox", "4462 4992 104", "-1063 609 123" );
        make_ladder( "_ladder_firefence_cloned_mobilehome", "4510 3224 76", "-161 3462 -16" );
        make_ladder( "_ladder_holefenceback_cloned_firstcrypt", "7022 -4849 197.016", "10303 7146 -124", "0 -105 0", "0.96 -0.26 0" );
        make_ladder( "_ladder_holefencefront_cloned_firstcrypt", "7022 -4849 197.016", "-2697 -3866 -124", "0 75 0", "-0.96 0.26 0" );
        make_ladder( "_ladder_manholechaintran_cloned_manholeblue", "4374 1576 76.1509", "-5 -1940 -9" );
        make_ladder( "_ladder_onewayshedback_cloned_firstcrypt", "7022 -4849 197.016", "-2 825 -10" );
        make_ladder( "_ladder_onewaybackfence_cloned_middlecrypt", "7604.02 -5653.63 184", "-1657.1 1144 -16" );
        make_ladder( "_ladder_onewayleftfence_cloned_firstcrypt", "7022 -4849 197.016", "-560 985 -20" );
        make_ladder( "_ladder_overpassfence_cloned_flamingofence", "4830 3840 57", "2793 2190 1399", "17 -90 0", "0 1 0" );
        make_ladder( "_ladder_overpassjumpqol_cloned_startfence", "5940 8462 89.6381", "-2301 14862 210", "0 -90 0", "-1 0 0" );
        make_ladder( "_ladder_pinkhouseB_cloned_manholeblownwall", "3778 656 100", "69 3452 -12" );
        make_ladder( "_ladder_pinkhouseT_cloned_manholeblownwall", "3778 656 100", "69 3452 180" );
        make_ladder( "_ladder_sewerhole1_cloned_flamingofence", "4830 3840 57", "9345 -3869 -274", "0 90 0", "0 -1 0" );
        make_ladder( "_ladder_sewerhole2_cloned_flamingofence", "4830 3840 57", "10032 -3869 -274", "0 90 0", "0 -1 0" );
        make_ladder( "_ladder_sewerhole3_cloned_flamingofence", "4830 3840 57", "1698 -3280 -274", "0 0 0", "-1 0 0" );
        make_ladder( "_ladder_sewerhole4_cloned_flamingofence", "4830 3840 57", "1698 -3952 -274", "0 0 0", "-1 0 0" );
        make_ladder( "_ladder_sewerhole5_cloned_flamingofence", "4830 3840 57", "2351 4381 -274", "0 -90 0", "0 1 0" );
        make_ladder( "_ladder_sewerhole6_cloned_flamingofence", "4830 3840 57", "1903 4381 -274", "0 -90 0", "0 1 0" );
        make_ladder( "_ladder_sewerhole7_cloned_flamingofence", "4830 3840 57", "10045 3728 -274", "0 180 0", "1 0 0" );
        make_ladder( "_ladder_tankconcretewallB_cloned_semionewaytall", "2762 2700 109", "6216 2239 1", "0 90 0", "0 -1 0" );
        make_ladder( "_ladder_tankconcretewallT_cloned_semionewaytall", "2762 2700 109", "6216 2239 161", "0 90 0", "0 -1 0" );
        make_ladder( "_ladder_tankfenceback_cloned_firstcrypt", "7022 -4849 197.016", "11143 -477 -131", "0 -180 0", "0 -1 0" );
        make_ladder( "_ladder_tankfencefront_cloned_firstcrypt", "7022 -4849 197.016", "-2862 9222 -131" );
        make_ladder( "_ladder_thelastgutter_cloned_manholeblownwall", "3778 656 100", "0 303 0" );
        make_prop( "dynamic",		"_losblocker_fencea",		"models/props_urban/fence_cover001_128.mdl",	"4349.7 7071 0",		"0 0 0",		"shadow_no" );
        make_prop( "dynamic",		"_losblocker_fenceb",		"models/props_urban/fence_cover001_256.mdl",	"4349.7 6623 0",		"0 0 0",		"shadow_no" );
        make_prop( "dynamic",		"_losblocker_fencec",		"models/props_urban/fence_cover001_128.mdl",	"4349.7 6306 0",		"0 0 0",		"shadow_no" );
        make_prop( "dynamic",		"_losblocker_fenced",		"models/props_urban/fence_cover001_128.mdl",	"4285 6242.3 20",		"0 270 0",		"shadow_no" );
        make_prop( "dynamic",		"_losblocker_fencee",		"models/props_urban/fence_cover001_256.mdl",	"3070 6242.3 20",		"0 270 0",		"shadow_no" );
        make_prop( "dynamic",		"_losblocker_fencef",		"models/props_urban/fence_cover001_128.mdl",	"2900.26 1884.1 9.25",		"0 35.5 0",		"shadow_no" );
        make_prop( "dynamic",		"_losblocker_fenceg",		"models/props_urban/fence_cover001_128.mdl",	"3502 1867 9.2501",		"0 155.5 0",		"shadow_no" );
        make_prop( "dynamic",		"_losblocker_hedge",		"models/props_foliage/urban_hedge_256_128_high.mdl",		"3750 6532 -1.73642",		"0 0 0",		"shadow_no" );
        make_prop( "dynamic",		"_propladder_fencea",		"models/props_fortifications/barricade_gate001_64_reference.mdl",	"4116 6347 26.916",		"-45 89.466 0.0493",	"shadow_no" );
        make_prop( "dynamic",		"_propladder_fenceb",		"models/props_fortifications/barricade_gate001_64_reference.mdl",	"3121 6347 26.916",		"-45 89.466 0.0493",	"shadow_no" );
        make_prop( "dynamic",		"_propladder_fencec",		"models/props_fortifications/barricade_gate001_64_reference.mdl",	"4026.17 -194.24 -0.284",	"-45 269.466 0.0493",	"shadow_no" );
        make_prop( "dynamic",		"_propladder_fenced",		"models/props_fortifications/barricade_gate001_64_reference.mdl",	"4074.17 -194.24 -0.284",	"-45 269.466 0.0493",	"shadow_no" );
        make_prop( "dynamic", "_collosaldumpster_wrongwaya", "models/props_misc/wrongway_sign01_optimized.mdl", "3471 2320 320", "0 180 0", "shadow_no", "solid_no", "255 255 255", "17", "217" );
        make_prop( "dynamic", "_collosaldumpster_wrongwayb", "models/props_misc/wrongway_sign01_optimized.mdl", "3471 2140 320", "0 180 0", "shadow_no", "solid_no", "255 255 255", "17", "217" );
        make_prop( "dynamic", "_solidify_tankconcretewall_chimney", "models/props_urban/chimney007.mdl", "3500.87 5616.91 353.166", "0 180 0", "shadow_no" );
    }
}