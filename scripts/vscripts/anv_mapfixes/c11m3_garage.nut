g_Chapter = "DEAD AIR - THE CONSTRUCTION SITE";

devchap( "ALL MODES" );

function DoRoundFixes()
{
    make_clip(	"_dispcrouch_rubblepipes",	"Everyone",	1,	"-32 -420 0",		"32 420 216",		"-6060 758 -125" );
    make_clip(	"_clipgap_roof",		"Survivors",	1,	"-17 -54 0",		"18 54 1000",		"-2226 5494 825" );
    make_clip(	"_permstuck_processortanks",	"Everyone",	1,	"-64 -32 -84",		"64 0 10",		"-3000 2129 103" );
    make_clip(	"_cliprework_construction01",	"Survivors",	1,	"-666 -32 -176",	"780 8 1150",		"-6885 -2488 712" );
    make_clip(	"_cliprework_construction02",	"Survivors",	1,	"-32 -32 -176",		"8 345 1150",		"-7518 -2488 712" );
    make_clip(	"_cliprework_construction03",	"Survivors",	1,	"-386 -32 -176",	"460 8 741",		"-5645 -884 1118" );
    make_clip(	"_cliprework_construction04",	"Survivors",	1,	"-8 -472 0",		"1337 488 888",		"-5384 -1528 1000" );
    make_clip(	"_cliprework_startarea02",	"Survivors",	1,	"-8 -360 0",		"8 360 1122",		"-5008 -2351 712" );
    make_clip(	"_cliprework_startarea01",	"Survivors",	1,	"-8 -469 0",		"8 469 1313",		"-4232 -3186 548" );
    make_clip( "_nav_constructwin", "Survivors", 1, "-64 -8 0", "64 8 128", "-5776 -1304 216" );
    make_clip( "_permstuck_watertank", "Everyone", 1, "-16 -16 0", "16 16 111", "-4044 2880 16" );

    make_prop( "dynamic", "_nav_constructwin_propper", "models/props_update/plywood_128.mdl", "-5776 -1302 280", "0 0 90", "shadow_no" );

    con_comment( "FIX:\tTanks prevented from being able to punch barricade gascans to delete them." );

    NetProps.SetPropInt( Entities.FindByName( null, "barricade_gas_can" ), "m_Collision.m_usSolidFlags", 2 );

    if ( g_BaseMode == "versus" )
    {
        devchap( "BASE VERSUS" );

        // FIXES

        make_clip(	"_booster_windows",		"Survivors",	1,	"-6 -80 0",		"6 80 128",		"-3082 3152 160" );
        make_clip(	"_bunnyhop_windows",		"Survivors",	1,	"-6 -180 0",		"6 180 128",		"-2954 1393 160" );

    }

    if ( HasPlayerControlledZombies() )
    {
        kill_funcinfclip( 1067.45 );	// Delete thin clip blocking access to the new enclosed construction area, fix exploits
        kill_funcinfclip( 1841.92 );	// Delete clip above/around about 5 distinct rooftops above starting area
        kill_funcinfclip( 1000.96 );	// Delete clip on rooftop besides new enclosed construction site space
        kill_funcinfclip( 1110.34 );	// Delete clip on rooftop with watertower near large pothole
        kill_funcinfclip( 874.48 );	// Delete clip above rooftop near beginning (same as one deleted for end of map 2)
        kill_funcinfclip( 2083.18 );	// Delete 3-solid clip over 2 long fences and a rooftop ledge
        make_atomizer( "_atomizer_bsp_forkliftdoor", "-3451 2517 32", "models/props\\cs_assault\\forklift_brokenlift.mdl", 60 );
        make_atomizer( "_atomizer_bsp_forkliftgate", "-3573 2854 32", "models/props\\cs_assault\\forklift_brokenlift.mdl", 60 );
        make_brush( "_losfix_copcar",		"-1 -80 -8",	"1 80 8",	"-3430 875 15" );
        make_brush( "_losfix_end_van",		"-1 -70 -8",	"1 70 8",	"-3221 4198 23" );
        make_brush( "_losfix_van",			"-1 -60 -8",	"1 60 8",	"-4577 664 16" );
        make_brush( "_losfix_watertank1",	"-132 -1 -6",	"132 1 6",	"-4854 3494 22" );
        make_brush( "_losfix_watertank2",	"-132 -1 -6",	"132 1 6",	"-3733 2330 38" );
        make_brush( "_losfix_watertank3",	"-132 -1 -6",	"132 1 6",	"-3947 2566 38" );
        make_brush( "_losfix_watertank4",	"-22 -32 -12",	"22 32 12",	"-3994 2929 25" );
        make_clip( "_constructsite_fireescape_booster", "Survivors", 1, "-45 -88 -133", "42 82 1062", "-5434 -1145 792" );
        make_clip( "_constructsite_scaffold_clip", "SI Players", 1, "-48 -167 0", "49 161 108", "-7551 -1707 180" );
        make_clip( "_constructsite_wwblocker", "SI Players", 1, "-397 -19 0", "403 355 1132", "-7203 -723 736" );
        make_clip( "_ladder_constructionfireescapea_qolclip", "SI Players", 1, "0 -102 0", "8 81 24", "-5478 -1153 727", "0 0 -56" );
        make_clip( "_ladder_fireescapehelper_qolclip", "SI Players", 1, "-64 -0.1 0", "64 0 88", "-5456 -1312 512" );
        make_clip( "_ladderqol_lessworthlessthanbefore", "SI Players", 1, "-470 -1 -12", "421 0 32", "-2901 2420 168" );
        make_clip( "_meticulous_funcinfclip01", "SI Players", 1, "-391 -838 0", "281 122 1842", "-7753 -2058 16" );
        make_clip( "_meticulous_funcinfclip02", "SI Players", 1, "-273 0 0", "221 298 1538", "-7711 -1040 308" );
        make_clip( "_meticulous_funcinfclip03", "SI Players", 1, "-168 -448 -128", "8 464 1666", "-7976 -1504 180" );
        make_clip( "_meticulous_funcinfclip04", "SI Players", 1, "-901 -316 -48", "479 932 1272", "-6583 -3412 584" );
        make_clip( "_meticulous_funcinfclip05", "SI Players", 1, "-454 -409 0", "426 407 882", "-5602 -2703 976" );
        make_clip( "_meticulous_funcinfclip06", "SI Players", 1, "-519 -120 0", "465 30 1482", "-6217 1232 380" );
        make_clip( "_meticulous_funcinfclip07", "SI Players", 1, "-120 -690 0", "0 0 1848", "-5655 1952 8" );
        make_clip( "_meticulous_funcinfclip08", "SI Players", 1, "-64 -457 0", "64 503 1312", "-3664 -3207 548" );
        make_clip( "_meticulous_funcinfclip09", "SI Players", 1, "-306 -37 0", "334 28 1312", "-3934 -3627 548" );
        make_clip( "_yeswayfence1st_clip", "Everyone", 1, "-33 -1163 0", "1 1163 152", "-5135 3067 16" );
        make_clip( "_yeswayfence2nd_clip", "Everyone", 1, "-719 -1 0", "719 33 152", "-4447 4199 16" );
        make_clip( "_yeswayfence_funcinfclip1", "SI Players", 1, "-135 -1321 0", "8 1321 1848", "-5521 3273 8" );
        make_clip( "_yeswayfence_funcinfclip2", "SI Players", 1, "-888 -8 0", "888 8 1848", "-4632 4593 8" );
        make_clip( "_yeswayfence_funcinfclip3", "SI Players", 1, "-8 -477 0", "8 477 1848", "-3736 4867 8" );
        make_ladder( "_ladder_airportleft_cloned_airportright", "-1539.5 1472 192.315", "-1 3072 0" );
        make_ladder( "_ladder_airportmidB_cloned_airportright", "-1539.5 1472 192.315", "-1 1536 0" );
        make_ladder( "_ladder_airportmidT_cloned_onewayfence", "-6028 -2232 92", "4485 5240 312" );
        make_ladder( "_ladder_constructnewarea_cloned_alleyelecbox", "-4745.5 -1033.5 136", "-6443 -6469 52", "0 -90 0", "1 0 0" );
        make_ladder( "_ladder_constructnewpipe_cloned_prevunused", "-7489 -1512 244", "-6802 6348 -17", "0 73 0", "-0.3 -0.95 0" );
        make_ladder( "_ladder_constructpillarB_cloned_alleyfirstpipe", "-5175.5 -897 280", "-6491 -7244 -80", "0 -90 0", "0 -1 0" );
        make_ladder( "_ladder_constructpillarT_cloned_whitepillar", "-6830 -2072.5 154", "-14217 -4215 248", "0 180 0", "0 1 0" );
        make_ladder( "_ladder_constructionfireescapea_cloned_tricountytop", "-4716 1483 386", "-6958 -5925 346", "0 -90 0", "-1 0 0" );
        make_ladder( "_ladder_constructionfireescapeb_cloned_skybridgetiny", "-1168 3254.5 416", "-4265 -4488.1 248" );
        make_ladder( "_ladder_fireescapehelpera_cloned_skybridgetiny", "-1168 3254.5 416", "-4268 -4565.1 120" );
        make_ladder( "_ladder_fireescapehelperb_cloned_skybridgetiny", "-1168 3254.5 416", "-4268 -4565.1 152" );
        make_ladder( "_ladder_tallibeamright_cloned_tallibeamleft", "-5872 -1328.5 264", "-11744 -3488 0", "0 180 0", "0 1 0" );
        make_ladder( "_ladder_yellowgirder_cloned_skybridgemini", "-1168 3254.5 416", "-1748 -1038 -76" );
        make_ladder( "_ladder_yesdrawtripleL_cloned_skybridgetiny", "-1168 3449.5 416", "490 2688 -272", "0 90 0", "-1 0 0" );
        make_ladder( "_ladder_yesdrawtripleR_cloned_firewindow", "-3092.5 3104 96.5", "136 -1839 -1" );
        make_ladder( "_ladder_yeswayfenceback1_cloned_1stfenceback", "-5167 2160 92.5", "0 387 0" );
        make_ladder( "_ladder_yeswayfenceback2_cloned_1stfenceback", "-5167 2160 92.5", "0 774 0" );
        make_ladder( "_ladder_yeswayfenceback3_cloned_1stfenceback", "-5167 2160 92.5", "0 1935 0" );
        make_ladder( "_ladder_yeswayfenceback4_cloned_2ndfenceback", "-4090 4231 92.5", "-900 0 0" );
        make_ladder( "_ladder_yeswayfenceback5_cloned_2ndfenceback", "-4090 4231 92.5", "-600 0 0" );
        make_ladder( "_ladder_yeswayfenceback6_cloned_2ndfenceback", "-4090 4231 92.5", "-300 0 0" );
        make_ladder( "_ladder_yeswayfencefront1_cloned_1stfenceback", "-5167 2160 92.5", "-10302 4550 0", "0 180 0", "1 0 0" );
        make_ladder( "_ladder_yeswayfencefront2_cloned_1stfenceback", "-5167 2160 92.5", "-10302 5000 0", "0 180 0", "1 0 0" );
        make_ladder( "_ladder_yeswayfencefront3_cloned_1stfenceback", "-5167 2160 92.5", "-10302 5450 0", "0 180 0", "1 0 0" );
        make_ladder( "_ladder_yeswayfencefront4_cloned_1stfenceback", "-5167 2160 92.5", "-10302 5900 0", "0 180 0", "1 0 0" );
        make_ladder( "_ladder_yeswayfencefront5_cloned_2ndfenceback", "-4090 4231 92.5", "-8932 8430 0", "0 -180 0", "0 -1 0" );
        make_ladder( "_ladder_yeswayfencefront6_cloned_2ndfenceback", "-4090 4231 92.5", "-8632 8430 0", "0 -180 0", "0 -1 0" );
        make_ladder( "_ladder_yeswayfencefront7_cloned_2ndfenceback", "-4090 4231 92.5", "-8332 8430 0", "0 -180 0", "0 -1 0" );
        make_ladder( "_ladder_yeswayfencefront8_cloned_2ndfenceback", "-4090 4231 92.5", "-8032 8430 0", "0 -180 0", "0 -1 0" );
        make_prop( "dynamic", "_constructsite_fireescapetop", "models/props_urban/fire_escape_upper.mdl", "-5392 -1067 792", "0 -90 0", "shadow_no" );
        make_prop( "dynamic", "_constructsite_fireescapebot", "models/props_urban/fire_escape_lower.mdl", "-5392 -1067 664", "0 -90 0", "shadow_no" );
        make_prop( "dynamic", "_constructsite_propladdera", "models/props_pipes/concrete_pipe001a.mdl", "-7629 -1214 222", "0 60 0", "shadow_no" );
        make_prop( "dynamic", "_constructsite_propladderb", "models/props_pipes/concrete_pipe001a.mdl", "-7531 -1212 236", "90 90 0", "shadow_no" );
        make_prop( "dynamic", "_constructsite_propladderc", "models/props_urban/metal_plate001.mdl", "-7573 -1199 291", "-24.2 10 0", "shadow_no" );
        make_prop( "dynamic", "_constructsite_scaffold", "models/props_equipment/scaffolding.mdl", "-7551 -1710 80", "0 0 0", "shadow_no" );
        make_prop( "dynamic", "_constructsite_wrongwaya", "models/props_misc/wrongway_sign01_optimized.mdl", "-7967 -1760 232", "0 0 0", "shadow_no", "solid_no", "255 255 255", "17", "217" );
        make_prop( "dynamic", "_constructsite_wrongwayb", "models/props_misc/wrongway_sign01_optimized.mdl", "-7967 -1505 232", "0 0 0", "shadow_no", "solid_no", "255 255 255", "17", "217" );
        make_prop( "dynamic", "_constructsite_wrongwayc", "models/props_misc/wrongway_sign01_optimized.mdl", "-7967 -1250 232", "0 0 0", "shadow_no", "solid_no", "255 255 255", "17", "217" );
        make_prop( "dynamic", "_constructsite_wrongwayd", "models/props_misc/wrongway_sign01_optimized.mdl", "-7051 -745 789", "0 -90 0", "shadow_no", "solid_no", "255 255 255", "17", "217" );
        make_prop( "dynamic", "_constructsite_wrongwaye", "models/props_misc/wrongway_sign01_optimized.mdl", "-7325 -745 789", "0 -90 0", "shadow_no", "solid_no", "255 255 255", "17", "217" );
        make_prop( "dynamic", "_constructsite_wrongwayf", "models/props_misc/wrongway_sign01_optimized.mdl", "-7490 -2346 590", "0 0 0", "shadow_no", "solid_no", "255 255 255", "17", "217" );
        make_prop( "dynamic", "_constructsite_wrongwayg", "models/props_misc/wrongway_sign01_optimized.mdl", "-7340 -2475 590", "0 90 0", "shadow_no", "solid_no", "255 255 255", "17", "217" );
        make_prop( "dynamic", "_fadedistfix_airport_acunitleft", "models/props_rooftop/acvent01.mdl", "-1344.2 4559.64 384.299", "0 270 0", "shadow_no", "solid_no" );
        make_prop( "dynamic", "_fadedistfix_airport_acunitright", "models/props_rooftop/acvent01.mdl", "-1344.2 4015.64 384.299", "0 270 0", "shadow_no", "solid_no" );
        make_prop( "dynamic", "_yesdrawtriple_surface", "models/props_update/c11m3_nodraw_cinderwall.mdl", "-2948 1392 224", "0 0 0", "shadow_no" );
        make_prop( "dynamic", "_yeswayfence_curb", "models/props_update/c11m3_wrongway_curb.mdl", "-4512 3264 0", "0 270 0", "shadow_no" );
        make_prop( "dynamic", "_yeswayfence_van", "models/props_vehicles/van.mdl", "-5221 3669 16", "0 178 0" );
        make_prop( "dynamic", "_yeswayfence_vanglass", "models/props_vehicles/van_glass.mdl", "-5221 3669 16", "0 178 0", "shadow_no" );
        make_prop( "dynamic", "_yeswayfence_wall", "models/props_update/c11m3_wrongway_fence.mdl", "-4448 3072 96", "0 270 0", "shadow_no" );
        make_prop( "dynamic", "_yeswayfence_wrongway1", "models/props_misc/wrongway_sign01_optimized.mdl", "-5521 2393 72", "0 0 0", "shadow_no", "solid_no", "255 255 255", 217, 17 );
        make_prop( "dynamic", "_yeswayfence_wrongway2", "models/props_misc/wrongway_sign01_optimized.mdl", "-5521 2833 72", "0 0 0", "shadow_no", "solid_no", "255 255 255", 217, 17 );
        make_prop( "dynamic", "_yeswayfence_wrongway3", "models/props_misc/wrongway_sign01_optimized.mdl", "-5521 3273 72", "0 0 0", "shadow_no", "solid_no", "255 255 255", 217, 17 );
        make_prop( "dynamic", "_yeswayfence_wrongway4", "models/props_misc/wrongway_sign01_optimized.mdl", "-5521 3713 72", "0 0 0", "shadow_no", "solid_no", "255 255 255", 217, 17 );
        make_prop( "dynamic", "_yeswayfence_wrongway5", "models/props_misc/wrongway_sign01_optimized.mdl", "-5521 4153 72", "0 0 0", "shadow_no", "solid_no", "255 255 255", 217, 17 );
        make_prop( "dynamic", "_yeswayfence_wrongway6", "models/props_misc/wrongway_sign01_optimized.mdl", "-5072 4593 72", "0 270 0", "shadow_no", "solid_no", "255 255 255", 217, 17 );
        make_prop( "dynamic", "_yeswayfence_wrongway7", "models/props_misc/wrongway_sign01_optimized.mdl", "-4632 4593 72", "0 270 0", "shadow_no", "solid_no", "255 255 255", 217, 17 );
        make_prop( "dynamic", "_yeswayfence_wrongway8", "models/props_misc/wrongway_sign01_optimized.mdl", "-4192 4593 72", "0 270 0", "shadow_no", "solid_no", "255 255 255", 217, 17 );
        make_prop( "physics",		"_losblocker_closetcrate",	"models/props_junk/wood_crate002a.mdl",	"-559 3577 335",		"20 0 90" );
        patch_ladder( "-1539.5 1472 192.315", "-1 0 0" );
        patch_ladder( "-3352 2426 110", "0 -1 0" );
    }
}