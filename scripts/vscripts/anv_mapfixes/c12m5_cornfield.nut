g_Chapter = "BLOOD HARVEST - FARMHOUSE FINALE";

devchap( "ALL MODES" );

// FIXES_ALL

make_clip(	"_dispcrouch_spawn_right",	"Everyone",	1,	"-12 -216 -100",	"200 216 128",		"11102 150 -115" );
make_clip(	"_dispcrouch_spawn_left",	"Everyone",	1,	"-26 -216 -100",	"26 216 128",		"10210 1423 -29" );
make_clip(	"_permstuck_tree_a",		"Everyone",	1,	"-16 -16 -16",		"16 16 16",		"10675 528 -7" );
make_clip(	"_permstuck_tree_b",		"Everyone",	1,	"-16 -16 -16",		"16 16 16",		"10794 1843 -27" );
make_clip(	"_permstuck_tree_c",		"Everyone",	1,	"-16 -16 -16",		"16 16 16",		"10456 3463 4" );
make_clip(	"_permstuck_tree_d",		"Everyone",	1,	"-16 -16 -16",		"16 16 16",		"11064 4373 -10" );
make_clip(	"_permstuck_tree_e",		"Everyone",	1,	"-16 -16 -16",		"16 16 1600",		"7710 1651 270" );
make_clip(	"_permstuck_tree_f",		"Everyone",	1,	"-16 -16 -16",		"16 16 1600",		"6852 -750 252" );
make_clip(	"_permstuck_tree_g",		"Everyone",	1,	"-16 -16 -16",		"16 16 1600",		"6448 3092 260" );
make_clip(	"_permstuck_tree_h",		"Everyone",	1,	"-16 -16 -16",		"16 16 1600",		"5624 3236 260" );
make_clip(	"_clip_anomaly",		"Survivors",	1,	"-384 -40 -740",	"450 40 720",		"5504 3304 1136" );
make_clip( "_wrongway_clipa", "Everyone", 1, "-1600 -61 0", "401 128 1640", "6044 3997 196" );
make_clip( "_wrongway_clipb", "Everyone", 1, "-288 -61 0", "600 128 1640", "6706 4072 196", "0 16 0" );
make_clip(	"_booster_barnroof",		"Survivors",	1,	"-8 -434 0",		"8 434 360",		"6986 -154 548" );
make_clip(	"_booster_haybarn",		"Survivors",	1,	"-364 -293 0",		"352 425 1317",		"8459 424 539.5" );
make_clip(	"_booster_estateroof",		"Survivors",	1,	"-575 -261 0",		"325 389 1258",		"6837 1124 598" );
make_clip(	"_booster_dualsilos",		"Survivors",	1,	"-360 -234 0",		"360 187 995",		"7362 2650 861" );
make_clip( "_clip_anomaly_ugh", "Survivors", 1, "-8 -20 -751", "448 13 751", "6216 3331 1101" );
make_clip( "_undermap_exploit", "Survivors", 1, "-81 -166 0", "85 76 1385", "4473 3860 451" );
make_clip( "_cooponly_idle_warp", "Survivors", 1, "-81 -37 0", "55 35 1102", "8849 3493 760" );
make_clip( "_nav_and_stuckwarp", "Everyone", 1, "-45 -2 -62", "163 6 58", "6485 1090 308" );

// For some maps the trigger_finale might exist after "round_start" and require delay -- but not here either!

con_comment( "LOGIC:\tPoint-of-no-return clip will be Enabled when finale is started." );

make_clip( "_point_of_no_return", "Survivors", 0, "-148 -16 0", "148 26 1660", "9017 3511 202" );
EntFire( "trigger_finale", "AddOutput", "FinaleStart anv_mapfixes_point_of_no_return:Enable::0:-1" );

if ( HasPlayerControlledZombies() )
{
    kill_funcinfclip( 3833.37 );		// Delete clip blocking access to vast start perimeter and one-way drop
    kill_funcinfclip( 4564.93 );		// Delete clip blocking access to vast end perimeter (including barricade)
    make_brush( "_losfix_gen",		"-24 -1 -6",	"24 1 6",	"7027 793 207" );
    make_brush( "_losfix_tractor",		"-56 -1 -15",	"56 1 15",	"8713 1804 212" );
    make_clip(	"_fence_collision",				"SI Players",	1,	"-4 -128 -80",		"4 240 20",		"8520 3627 579", "0 -32 0" );
    make_clip(	"_fence_stuckspot",				"SI Players",	1,	"-60 -80 -80",		"4 60 20",		"8624 3811 579", "0 -32 0" );
    make_clip(	"_meticulous_funcinfclip01",	"SI Players",	1,	"-573 120 -295",	"219 282 1205",		"9765 3742 651" );
    make_clip(	"_meticulous_funcinfclip02",	"SI Players",	1,	"400 -585 -459",	"447 972 1205",		"7745 4147 651" );
    make_clip(	"_meticulous_funcinfclip03",	"SI Players",	1,	"-744 -54 -459",	"447 972 1205",		"7745 4147 651" );
    make_clip(	"_meticulous_funcinfclip04",	"SI Players",	1,	"-2464 0 -459",		"447 1470 1205",	"6554 4147 651" );
    make_clip(	"_meticulous_funcinfclip05",	"SI Players",	1,	"-2464 -5300 -459",	"-2042 1470 1205",	"6554 4147 651" );
    make_clip(	"_meticulous_funcinfclip06",	"SI Players",	1,	"-2464 -5300 -459",	"-90 -5043 1205",	"6554 4147 651" );
    make_clip(	"_meticulous_funcinfclip07",	"SI Players",	1,	"-573 130 -295",	"-50 152 -90",		"9329 4402 651" );
    make_clip(	"_meticulous_funcinfclip08",	"SI Players",	1,	"-50 130 -295",		"219 152 -70",		"9329 4402 651" );
    make_clip(	"_meticulous_funcinfclip09",	"SI Players",	1,	"-744 -659 -459",	"-482 972 1205",	"8936 4147 651" );
    make_clip(	"_meticulous_funcinfclip10",	"SI Players",	1,	"-744 722 -459",	"2840 972 1205",	"8936 4147 651" );
    make_clip(	"_meticulous_funcinfclip11",	"SI Players",	1,	"0 -2687 -882",		"1615 2592 782",	"11776 2527 1074" );
    make_clip( "_ladder_barnhouseback_clipleft", "Everyone", 1, "-3 -16 0", "1 11 321", "6963 -574 200", "0 52 0" );
    make_clip( "_ladder_barnhouseback_clipright", "Everyone", 1, "-3 -19 0", "1 8 355", "7024 -574 200", "0 -52 0" );
    make_clip( "_ladder_onewaydrop_collision", "SI Players", 1, "-1 -142 0", "1 130 111", "9200 3714 393" );
    make_clip( "_ladder_onewayfence_qolclip", "SI Players", 1, "-38 -24 -17", "48 42 36", "9018 4530 399", "3 0 42" );
    make_clip( "_ladder_siloleft_clip1", "SI Players", 1, "-50 -24 0", "50 24 1", "7309 2735 970", "0 -52 0" );
    make_clip( "_ladder_siloleft_clip2", "SI Players", 1, "-50 -24 0", "50 24 1", "7294 2735 984", "0 -52 0" );
    make_clip( "_ladder_siloright_clip1", "SI Players", 1, "-50 -24 0", "50 24 1", "7662 2735 970", "0 -52 0" );
    make_clip( "_ladder_siloright_clip2", "SI Players", 1, "-50 -24 0", "50 24 1", "7647 2735 984", "0 -52 0" );
    make_clip( "_ladder_siloshared_clip", "SI Players", 1, "-170 -136 -72", "183 76 64", "7361 2647 933" );
    make_clip( "_meticulous_permstuck", "SI Players", 1, "-16 -216 -237", "800 17 1193", "8470 4808 663", "0 9 0" );
    make_clip( "_onewaydrophill_clip", "SI Players", 1, "-2 -255 -115", "370 175 1271", "9613 3664 584" );
    make_clip( "_pouncersonly_clip", "SI Players", 1, "-229 -386 -170", "394 320 1586", "11382 4549 270" );
    make_clip( "_wrongway_clipa", "Everyone", 1, "-1600 -61 0", "401 128 1640", "6044 3997 196" );
    make_clip( "_wrongway_clipb", "Everyone", 1, "-288 -61 0", "600 128 1640", "6706 4072 196", "0 16 0" );
    make_ladder( "_ladder_barnhouseback_cloned_haybalebarn", "8128 131.5 374.5", "-1137 -718 4" );
    make_ladder( "_ladder_barnhouseicing_cloned_barnhousefront", "7100 266.5 301.922", "6937 -6981 65.6", "0 90 38", "-1 0 0" );
    make_ladder( "_ladder_barricadeback_cloned_oneway", "9020 3500 272", "15070 7001 40", "0 180 0", "0 1 0" );
    make_ladder( "_ladder_barricadefront_cloned_oneway", "9020 3500 272", "-2970 -3 41" );
    make_ladder( "_ladder_boxcardeadend_cloned_housegenerator", "7119 887.5 296", "3539 2400 -226", "0 10.58 0", "0.18 -0.98 0" );
    make_ladder( "_ladder_boxcarstartline_cloned_housegenerator", "7119 887.5 296", "3861 4914 -280", "0 -28.05 0", "-0.47 -0.88 0" );
    make_ladder( "_ladder_onewaydrop_cloned_hayhaildiesel", "6693.5 204 253", "2504 3592 198" );
    make_ladder( "_ladder_onewayfence_cloned_housegenerator", "7119 887.5 296", "1901 3644 186" );
    make_ladder( "_ladder_permstuck_cloned_toolshed", "7101 2140.5 275", "3898 6909 -199", "0 -33.46 0", "0.56 0.83 0" );
    make_ladder( "_ladder_siloleft_cloned_haybalebarn", "8128 131.5 374.5", "12550 -3471 420", "0 129 0", "0.78 0.62 0" );
    make_ladder( "_ladder_siloleft_cloned_haybalebarn", "8128 131.5 374.5", "12550 -3471 68", "0 129 0", "0.78 0.62 0" );
    make_ladder( "_ladder_siloright_cloned_haybalebarn", "8128 131.5 374.5", "12903 -3471 420", "0 129 0", "0.78 0.62 0" );
    make_ladder( "_ladder_siloright_cloned_haybalebarn", "8128 131.5 374.5", "12903 -3471 68", "0 129 0", "0.78 0.62 0" );
    make_ladder( "_ladder_tallchimneybot_cloned_haybalebarn", "8128 131.5 374.5", "-1304 732 -14" );
    make_ladder( "_ladder_tallchimneytop_cloned_haybalebarn", "8128 131.5 374.5", "-1304 732 306" );
    make_navblock( "_losblocker_rockleft_navblock", "Everyone", "Apply", "-18 -36 -32", "18 36 32", "10335 1520 -64" );
    make_prop( "dynamic", "_cosmetic_barric_cliffside", "models/props_wasteland/rock_cliff01.mdl", "4646 4080 602", "0 260 0", "shadow_no" );
    make_prop( "dynamic", "_cosmetic_hillside_rocka", "models/props_wasteland/rock_moss04.mdl", "8760 4766 571", "260 120 20", "shadow_no", "solid_no" );
    make_prop( "dynamic", "_cosmetic_hillside_rockb", "models/props_wasteland/rock_moss04.mdl", "8878 4781 566", "60 -80 160", "shadow_no", "solid_no" );
    make_prop( "dynamic", "_cosmetic_hillside_rockc", "models/props_wasteland/rock_moss04.mdl", "9000 4800 571", "-70 80 70", "shadow_no", "solid_no" );
    make_prop( "dynamic", "_cosmetic_hillside_tree", "models/props_foliage/cedar_medium01.mdl", "9299 4928 536", "0 264 0", "shadow_no", "solid_no" );
    make_prop( "dynamic", "_losblocker_barric_cliffside", "models/props_wasteland/rock_moss04.mdl", "4879 2680 460", "120 252 0", "shadow_no" );
    make_prop( "dynamic", "_losblocker_hillside_rock", "models/props_wasteland/rock_moss04.mdl", "9200 4792 550", "50 30 -130", "shadow_no" );
    make_prop( "dynamic",		"_losblocker_rockleft",		"models/props_wasteland/rock_moss04.mdl",		"10344 1529.7 -14",		"-12.56 346.66 22.6",	"shadow_no" );
    make_prop( "dynamic", "_losblocker_freeatlasta", "models/props_wasteland/rock_moss04.mdl", "7026 3507 421", "130 287 -62", "shadow_no" );
    make_prop( "dynamic", "_losblocker_freeatlastb", "models/props_wasteland/rock_moss04.mdl", "6900 3507 410", "170 107 -142", "shadow_no" );
    make_prop( "dynamic", "_losblocker_hardlyimpossible", "models/props_wasteland/rock_moss04.mdl", "6344 3782 270", "130 107 -62", "shadow_no" );
    make_prop( "dynamic", "_losblocker_treefloater", "models/props_wasteland/rock_moss04.mdl", "5732 3800 227", "90 -71 90", "shadow_no" );
    make_prop( "dynamic", "_pouncersonly_wrongwaya", "models/props_misc/wrongway_sign01_optimized.mdl", "11153 4780 259", "0 180 0", "shadow_no", "solid_no", "255 255 255", "17", "217" );
    make_prop( "dynamic", "_pouncersonly_wrongwayb", "models/props_misc/wrongway_sign01_optimized.mdl", "11153 4630 259", "0 180 0", "shadow_no", "solid_no", "255 255 255", "17", "217" );
    make_prop( "dynamic", "_pouncersonly_wrongwayc", "models/props_misc/wrongway_sign01_optimized.mdl", "11361 4164 310", "0 -90 0", "shadow_no", "solid_no", "255 255 255", "17", "217" );
    make_prop( "dynamic", "_solidify_treesripbro", "models/props_foliage/trees_cluster02.mdl", "5777.93 3757.84 265.545", "0 84.5 0", "shadow_no" );
    make_prop( "dynamic", "_wrongway_propa", "models/props_placeable/wrong_way.mdl", "4930 3935 540", "0 90 90", "shadow_no", "solid_no", "255 255 255", "17", "217" );
    make_prop( "dynamic", "_wrongway_propb", "models/props_placeable/wrong_way.mdl", "5980 3935 280", "0 90 90", "shadow_no", "solid_no", "255 255 255", "17", "217" );
    make_prop( "dynamic", "_wrongway_propc", "models/props_placeable/wrong_way.mdl", "6750 4020 465", "0 106 90", "shadow_no", "solid_no", "255 255 255", "17", "217" );

    con_comment( "KILL:\tReplaced \"fenceSmash_clip_brush\" with Survivor-only version." );

    EntFire( "fenceSmash_clip_brush", "Kill" );

    con_comment( "LOGIC:\tBarricade ladders will be deleted 17 seconds into \"relay_outro_start\"." );

    EntFire( "relay_outro_start", "AddOutput", "OnTrigger anv_mapfixes_ladder_barricade*:Kill::17:-1" );

    con_comment( "EASTER_EGG:\tChair deleted, replaced with bumper car, SetModel to chair, clipped, parented and OnHitByTank I/O'd." );

    kill_entity( Entities.FindByClassnameNearest( "prop_physics", Vector( 6929.47, 1058.91, 238.375 ), 8 ) );
    make_prop( "physics", "_replacement_chair", "models/props_fairgrounds/bumpercar.mdl", "6929.47 1058.91 238.375", "360 180 0", "shadow_yes", "solid_yes", "255 255 255", -1, 0, 1.3 );
    Entities.FindByName( null, g_UpdateName + "_replacement_chair" ).SetModel( "models/props_interiors/sofa_chair02.mdl" );
    make_clip( "_replacement_chair_clip", "Everyone", 1, "-16 -22 0", "30 22 40", "6922 1059 238" );
    EntFire( g_UpdateName + "_replacement_chair_clip", "SetParent", g_UpdateName + "_replacement_chair" );
    EntFire( g_UpdateName + "_replacement_chair", "AddOutput", "OnHitByTank anv_mapfixes_replacement_chair_clip:Kill:0:-1" );
}