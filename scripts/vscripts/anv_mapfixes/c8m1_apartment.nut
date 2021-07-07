g_Chapter = "NO MERCY - APARTMENTS";

devchap( "ALL MODES" );

// FIXES_ALL

make_clip(	"_fallrevive_griefroom",	"Survivors",	1,	"-8 -40 -276",		"8 40 276",		"632 984 292" );
make_clip(	"_truckjump_window",		"Survivors",	1,	"-32 -8 -44",		"32 8 44",		"1728 3976 268" );
make_clip(	"_cliprework_rooftop03",	"Survivors",	1,	"-513 -409 0",		"513 409 4040",		"2047 2792.5 495.5" );
make_clip(	"_commonhop_electricalbox",	"Survivors",	1,	"-36 -52 0",		"50 64 287",		"2526 2418 209" );
make_clip(	"_cliprework_rooftop02",	"Survivors",	1,	"-474 -216 0",		"474 216 4040",		"2004 1996 640" );
make_clip(	"_cliprework_rooftop04",	"Survivors",	1,	"-216 -474 0",		"216 474 4040",		"2766 943 800" );
make_clip(	"_cliprework_rooftop01",	"Survivors",	1,	"-426 -313 0",		"426 313 4040",		"1943 480 800" );
make_clip(	"_clipextend_van",		"Survivors",	1,	"-99 -99 0",		"99 99 4239",		"2786 2528 404.7" );
make_clip(	"_cliprework_unattackable",	"Survivors",	1,	"-383 -600 0",		"129 1192 5000",	"127 2648.5 16" );
make_clip(	"_booster_corner",		"Survivors",	1,	"-513 -209 0",		"513 209 4242",		"512 5296.1 272" );
make_clip(	"_booster_windows",		"Survivors",	1,	"-8 -96 -44",		"8 96 44",		"2040 4672 268" );
make_clip(	"_booster_rubble",		"Survivors",	1,	"-8 -84 -44",		"8 24 4239",		"2952 5236 374.2" );
make_clip( "_clipextend_crushescape", "Survivors", 1, "-91 -1 0", "101 2 1042", "2459 767 853" );
make_clip( "_cliprework_rooftop05", "Survivors", 1, "-257 -183 0", "259 192 4042", "1793 1595 640" );
make_clip( "_clipextend_unattackable", "Survivors", 1, "-1459 -71 0", "461 73 4042", "2483 5327 528" );
make_clip( "_clipextend_policefence", "Survivors", 1, "-405 -16 0", "395 16 4042", "1173 2032 656" );
make_clip( "_clipextend_subwayfence", "Survivors", 1, "-4 -139 0", "6 152 280", "3266 4137 552", "0 -8 0" );
make_clip( "_nav_electricalboxa", "Survivors", 1, "-4 -29 0", "6 29 379", "2476 1819 125" );
make_clip( "_nav_electricalboxb", "Survivors", 1, "-30 -4 0", "30 6 513", "2016 2188 127" );
make_clip( "_cliprework_subwayupper", "Survivors", 1, "-201 -94 0", "215 90 4322", "2921 4194 156" );
make_clip( "_cliprework_subwayledge", "Survivors", 1, "-218 -18 132", "233 3 4322", "3014 4017 156" );
make_clip( "_cliprework_subwayfence", "Survivors", 1, "-5 -143 0", "4 149 3926", "3268 4141 552", "0 -8 0" );
make_clip( "_subwins_smoother", "Everyone", 1, "-120 -9 0", "120 9 3", "2968 4103 48" );
make_trighurt( "_instakill_griefroom", "Survivor", "-512 -1080 0", "384 1080 17", "1152 936 202" );

con_comment( "FIX:\tFans will now rotate. Server-side entities used to have Client-side Animation spawnflag." );

EntFire( "fanblade*", "AddOutput", "spawnflags 129" );

if ( HasPlayerControlledZombies() )
{
    kill_funcinfclip( 43.2982 );
    kill_funcinfclip( 617.65 );
    kill_funcinfclip( 611.263 );
    kill_funcinfclip( 769.74 );
    kill_funcinfclip( 836.992 );
    kill_funcinfclip( 577.321 );
    kill_funcinfclip( 873.029 );		// Delete clip on roof near car alarm, watertower/chimneys have collision
    kill_funcinfclip( 969.151 );		// Delete clip on gray rooftop with the 3 small AC units
    kill_funcinfclip( 712.934 );		// Delete clip in far corner near NODRAW wall
    EntFire( "worldspawn", "RunScriptCode", "kill_funcinfclip( 43.2982 )", 1 );
    make_brush( "_losfix_boxes",		"-2 -4 -16",	"2 4 16",	"2956 3995.77 -224" );
    make_brush( "_losfix_car",		"-46 -1 -16",	"56 1 10",	"1163 2944 23" );
    make_brush( "_losfix_debris1",	"-30 -1 -74",	"15 1 40",	"2404 706 90" );
    make_brush( "_losfix_debris2",	"-30 -1 -74",	"15 1 40",	"2493 706 90" );
    make_brush( "_losfix_debris3",	"-112 -20 -1",	"73 20 1",	"2487 727 130" );
    make_brush( "_losfix_debris4",	"-112 -1 -10",	"73 1 10",	"2487 747 141" );
    make_brush( "_losfix_truck",	"-1 -80 -5",	"1 80 15",	"2232 4268 12" );
    make_brush( "_losfix_van1",		"-1 -50 -8",	"1 50 8",	"2588 3542 21" );
    make_brush( "_losfix_van2",		"-40 -1 -8",	"41 1 8",	"2546 3494 21" );
    make_clip( "_ladder_startroof_clip", "SI Players", 1, "4 -28 0", "8 28 3", "2292 1340 319" );
    make_clip( "_ladder_subwaybricks_clip", "Everyone", 1, "-1 -8 0", "2 8 128", "2814 4104 16" );
    make_clip( "_meticulous_funcinfclip01", "SI Players", 1, "-1 -28 0", "3 28 74", "2293 850 322" );
    make_clip( "_meticulous_funcinfclip02", "SI Players", 1, "-8 -619 0", "185 629 1089", "3175 3371 832" );
    make_clip( "_meticulous_funcinfclip03", "SI Players", 1, "-153 -812 0", "293 308 4132", "153 2988 352" );
    make_clip( "_meticulous_funcinfclip04", "SI Players", 1, "0 -846 0", "389 794 687", "-5 4298 466" );
    make_clip( "_meticulous_funcinfclip05", "SI Players", 1, "-153 -128 -336", "104 0 4132", "153 2176 352" );
    make_clip( "_yesdraw_dairy_clipa", "SI Players", 1, "-330 -231 0", "311 249 3952", "1737 5767 528" );
    make_clip( "_yesdraw_dairy_clipb", "SI Players", 1, "-17 -142 0", "17 142 3952", "2031 5390 528" );
    make_clip( "_yesdraw_farcorner_clip", "SI Players", 1, "-216 -215 -256", "168 233 3952", "216 5303 528" );
    make_clip( "_yesdraw_start_clipa", "SI Players", 1, "-300 -447 0", "0 449 1120", "3052 959 800" );
    make_clip( "_yesdraw_start_clipb", "SI Players", 1, "-158 -10 -580", "42 312 549", "2710 508 1370" );
    make_clip( "_ladder_crushedescape_clip", "Survivors", 1, "-20 -3 0", "20 3 1745", "2478 769 173" );
    make_ladder( "_ladder_alleywindow_cloned_tankerwindow", "1720 3959.5 120", "820 -1590 0" );
    make_ladder( "_ladder_commvignette_cloned_trashorange", "2428 3204.5 255.9905", "-1800 97 -144" );
    make_ladder( "_ladder_crushedescape_cloned_tankerwindow", "1720 3959.5 120", "4198 4729 -51", "0 180 0", "0 1 0" );
    make_ladder( "_ladder_dairybrickleft_cloned_thinwhiteledge", "3310 4020.5 151.9882", "-1659 1036 488" );
    make_ladder( "_ladder_dairybrickright_cloned_thinwhiteledge", "3310 4020.5 151.9882", "-1685 1036 488" );
    make_ladder( "_ladder_fencebayB_cloned_garagewindow", "2056.5 4608 120", "3539 6600 208", "0 180 0", "-1 0 0" );
    make_ladder( "_ladder_fencebayT_cloned_garagewindow", "2056.5 4608 120", "3539 6600 368", "0 180 0", "-1 0 0" );
    make_ladder( "_ladder_fencefrontL_cloned_fencebackL", "841 2039.5 76", "2294 4095 0", "0 180 0", "0 1 0" );
    make_ladder( "_ladder_fencefrontM_cloned_fencebackM", "1173 2048.5 68", "2346 4105 0", "0 180 0", "0 1 0" );
    make_ladder( "_ladder_fencefrontR_cloned_fencebackR", "1453 2044.5 75.717", "2294 4095 0", "0 180 0", "0 1 0" );
    make_ladder( "_ladder_flatnose_cloned_chaintilt", "3268.5 4088 83.9941", "-1708 205 -20", "0 -7 0", "0.96 -0.26 0" );
    make_ladder( "_ladder_ominouswin_cloned_helloworld", "2066 1783.5 328", "-242 3464 -112" );
    make_ladder( "_ladder_parkourstartB_cloned_tallpipecopcar", "1531 2570 255.99", "1029.5 -1500 144" );
    make_ladder( "_ladder_parkourstartT_cloned_thinwhiteledge", "3310 4020.5 151.9882", "5852 5120 523", "0 180 0", "0 -1 0" );
    make_ladder( "_ladder_simondairy_cloned_helloworld", "2066 1783.5 328", "-937 3272 -112" );
    make_ladder( "_ladder_startroof_cloned_trashblack", "2565 2560 255.9905", "-265 -1168 -12" );
    make_ladder( "_ladder_subwaybricks_cloned_tankerwindow", "1720 3959.5 120", "1112 134 -68" );
    make_ladder( "_ladder_subwayrubble_cloned_woodyjr", "3408 3973.5 74", "-64 140 -264" );
    make_prop( "dynamic",		"_losblocker_fencea",		"models/props_urban/fence_cover001_256.mdl",	"896 3971 17",			"0 270 0",		"shadow_no" );
    make_prop( "dynamic",		"_losblocker_fenceb",		"models/props_urban/fence_cover001_256.mdl",	"1408 3971 17",			"0 270 0",		"shadow_no" );
    make_prop( "dynamic", "_commvignette_wrongwaya", "models/props_misc/wrongway_sign01_optimized.mdl", "445 2790 416", "0 0 0", "shadow_no", "solid_no", "255 255 255", "17", "217" );
    make_prop( "dynamic", "_commvignette_wrongwayb", "models/props_misc/wrongway_sign01_optimized.mdl", "445 3190 416", "0 0 0", "shadow_no", "solid_no", "255 255 255", "17", "217" );
    make_prop( "dynamic", "_ladder_commvignette_pipe", "models/props_rooftop/Gutter_Pipe_256.mdl", "628 3296 330", "0 180 0", "shadow_no" );
    make_prop( "dynamic", "_ladder_ominouswin_pipeB", "models/props_rooftop/Gutter_Pipe_256.mdl", "1824 5248 272", "0 0 0", "shadow_no" );
    make_prop( "dynamic", "_ladder_ominouswin_pipeT", "models/props_rooftop/Gutter_Pipe_256.mdl", "1824 5248 528", "0 0 0", "shadow_no" );
    make_prop( "dynamic", "_ladder_simondairy_pipeB", "models/props_rooftop/Gutter_Pipe_256.mdl", "1129 5056 272", "0 0 0", "shadow_no" );
    make_prop( "dynamic", "_ladder_simondairy_pipeT", "models/props_rooftop/Gutter_Pipe_256.mdl", "1129 5056 528", "0 0 0", "shadow_no" );
    make_prop( "dynamic", "_losblocker_simondairy", "models/props_rooftop/rooftopcluser06a.mdl", "1392 5397 630", "0 0 0", "shadow_no" );
    make_prop( "dynamic", "_solidify_dairyclust", "models/props_rooftop/rooftopcluser06a.mdl", "1632 4672 869.405", "0 88.5 0", "shadow_no" );
    make_prop( "dynamic", "_solidify_dairyvent1", "models/props_rooftop/acvent01.mdl", "1633 4676 776.299", "0 180 0", "shadow_no" );
    make_prop( "dynamic", "_solidify_dairyvent2", "models/props_rooftop/acvent01.mdl", "1633 4548 776.299", "0 180 0", "shadow_no" );
    make_prop( "dynamic", "_solidify_dairyvent3", "models/props_rooftop/acvent01.mdl", "1904 4145 776.299", "0 270 0", "shadow_no" );
    make_prop( "dynamic", "_solidify_dairyvent4", "models/props_rooftop/acvent02.mdl", "1665 4124 776", "0 270 0", "shadow_no" );
    make_prop( "dynamic", "_window_ceda_body", "models/DeadBodies/CEDA/ceda_truck_a.mdl", "2382 1414 257", "2 -137 32", "shadow_no", "solid_no" );
    make_prop( "dynamic", "_yesdraw_dairy_wrongwaya", "models/props_misc/wrongway_sign01_optimized.mdl", "1309 5535 585", "0 270 0", "shadow_no", "solid_no", "255 255 255", 217, 17 );
    make_prop( "dynamic", "_yesdraw_dairy_wrongwayb", "models/props_misc/wrongway_sign01_optimized.mdl", "1709 5535 585", "0 270 0", "shadow_no", "solid_no", "255 255 255", 217, 17 );
    make_prop( "dynamic", "_yesdraw_farcorner_wall", "models/props_update/c8m1_rooftop_4.mdl", "384 4272 529.3", "0 270 0", "shadow_no", "solid_no" );
    make_prop( "dynamic", "_yesdraw_farcorner_wrongway", "models/props_misc/wrongway_sign01_optimized.mdl", "384 5303 320", "0 0 0", "shadow_no", "solid_no", "255 255 255", 217, 17 );
    make_prop( "dynamic", "_yesdraw_fireroof_hunt1", "models/props_update/c8m1_rooftop_3.mdl", "544 1264 1232", "0 0 0", "shadow_no" );
    make_prop( "dynamic", "_yesdraw_fireroof_hunt2", "models/props_update/c8m1_rooftop_3.mdl", "544 1536 1232.1", "0 0 0", "shadow_no" );
    make_prop( "dynamic", "_yesdraw_fireroof_hunt3", "models/props_update/c8m1_rooftop_3.mdl", "544 1808 1232", "0 0 0", "shadow_no" );
    make_prop( "dynamic", "_yesdraw_roof_starta", "models/props_update/c8m1_rooftop_3.mdl", "2792 1192 799.9999", "0 -90 0", "shadow_no", "solid_no" );
    make_prop( "dynamic", "_yesdraw_roof_startb", "models/props_update/c8m1_rooftop_3.mdl", "2792 744 799.9999", "0 -90 0", "shadow_no", "solid_no" );
    make_prop( "dynamic", "_yesdraw_roof_startc", "models/props_update/c8m1_rooftop_3.mdl", "3272 1192 799.9999", "0 -90 0", "shadow_no", "solid_no" );
    make_prop( "dynamic", "_yesdraw_roof_startd", "models/props_update/c8m1_rooftop_3.mdl", "3272 744 799.9999", "0 -90 0", "shadow_no", "solid_no" );
    make_prop( "dynamic", "_yesdraw_rooftop_1", "models/props_update/c8m1_rooftop_1.mdl", "1776 4528 776", "0 -90 0", "shadow_no", "solid_no" );
    make_prop( "dynamic", "_yesdraw_rooftop_2", "models/props_update/c8m1_rooftop_2.mdl", "1536 5536 528", "0 -90 0", "shadow_no", "solid_no" );
    make_prop( "dynamic", "_yesdraw_rooftop_3", "models/props_update/c8m1_rooftop_3.mdl", "496 2400 616", "0 -90 0", "shadow_no", "solid_no" );
    make_prop( "dynamic", "_yesdraw_rooftop_3_wrongwaya", "models/props_misc/wrongway_sign01_optimized.mdl", "445 2495 678", "0 0 0", "shadow_no", "solid_no", "255 255 255", 217, 17 );
    make_prop( "dynamic", "_yesdraw_rooftop_3_wrongwayb", "models/props_misc/wrongway_sign01_optimized.mdl", "445 2305 678", "0 0 0", "shadow_no", "solid_no", "255 255 255", 217, 17 );
    make_prop( "dynamic", "_yesdraw_start_wrongwaya", "models/props_misc/wrongway_sign01_optimized.mdl", "2752 1232 854", "0 180 0", "shadow_no", "solid_no", "255 255 255", 217, 17 );
    make_prop( "dynamic", "_yesdraw_start_wrongwayb", "models/props_misc/wrongway_sign01_optimized.mdl", "2752 982 854", "0 180 0", "shadow_no", "solid_no", "255 255 255", 217, 17 );

    DoEntFire( "!self", "Break", "", 0.0, null, Entities.FindByClassnameNearest( "prop_physics", Vector( 2293, 1340, 359 ), 1 ) );
    DoEntFire( "!self", "AddOutput", "angles 90 20 0", 0.0, null, Entities.FindByClassnameNearest( "func_illusionary", Vector( 2296, 1340, 349.91 ), 1 ) );
    DoEntFire( "!self", "AddOutput", "origin 2391 1335 16", 0.0, null, Entities.FindByClassnameNearest( "func_illusionary", Vector( 2296, 1340, 349.91 ), 1 ) );
}