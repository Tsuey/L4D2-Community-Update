g_Chapter = "DARK CARNIVAL - FAIRGROUND";

devchap( "ALL MODES" );

function DoRoundFixes()
{
    make_clip(	"_bunnyhop_roundtable",		"Survivors",	1,	"-45 -256 0",		"100 256 502",		"2360 -244 266" );
    make_clip(	"_booster_unattackable",	"Survivors",	1,	"-100 -17 0",		"700 17 512",		"4000 -2304 268" );
    make_clip(	"_forklift_roof",		"Survivors",	1,	"-7 -128 0",		"10 128 575",		"1750 -1660 193" );
    make_clip(	"_commonhop_whitefence",	"Survivors",	1,	"-77 -5 0",		"77 5 777",		"-3903 -1141 -15" );
    make_clip(	"_commonhop_carouselroofs",	"Survivors",	1,	"-230 -5 0",		"302 1142 666",		"-990 -5501 192" );
    make_clip(	"_void_filler","Everyone",	1,	"-222 0 -125",		"222 16 55",		"-1792 -7311 250" );
    make_clip(	"_charger_smoother",		"Everyone",	1,	"-56 -256 -6",		"56 256 6",		"-3119 -896 152",	"-40 0 0" );
    make_clip( "_cliprework_unattackable", "Survivors", 1, "-8 -1009 0", "8 1007 128", "-504 -1535 128" );
    make_clip( "_cliprework_beanbinninga", "Survivors", 1, "-8 -961 0", "8 959 128", "-888 -1535 128" );
    make_clip( "_cliprework_beanbinningb", "Survivors", 1, "-178 -11 0", "190 5 128", "-702 -2549 128" );
    make_clip( "_cliprework_unattackablea", "Survivors", 1, "-23 -1191 0", "29 177 597", "-3405 -6489 204" );
    make_clip( "_cliprework_unattackableb", "Survivors", 1, "-178 -24 0", "82 24 597", "-3510 -6336 204" );
    make_clip( "_cliprework_unattackablec", "Survivors", 1, "-24 -236 0", "24 304 597", "-3664 -6076 204" );
    make_clip( "_cliprework_unattackabled", "Survivors", 1, "-1108 -23 0", "324 21 597", "-4012 -5793 204" );
    make_clip( "_cliprework_unattackablee", "Survivors", 1, "-4 -303 0", "4 865 492", "-4352 -5473 272" );
    make_clip( "_cliprework_wrongwaya", "Survivors", 1, "-207 -7 0", "218 1 578", "-481 -5505 192" );
    make_clip( "_cliprework_wrongwayb", "Survivors", 1, "-8 -866 0", "8 799 578", "-258 -6303 192" );
    make_clip( "_cliprework_wrongwayc", "Survivors", 1, "-2113 -10 0", "1219 5 578", "-1471 -7166 192" );
    make_clip( "_nav_exitsign", "Survivors", 1, "-8 -11 0", "11 12 120", "1048 -1269 128" );
    make_clip( "_cliprework_blockergap", "Survivors", 1, "-121 -8 0", "123 8 384", "-4235 -3968 384" );
    make_clip( "_unattackable_traintunnel", "Survivors", 1, "-324 -1040 -171", "220 1040 342", "-604 -1536 428" );
    make_clip( "_dispcollision_fairgrounds", "All and Physics", 1, "-1400 -1700 -2", "1400 1700 0", "-1903 -142 -128" );

    if ( g_BaseMode == "versus" )
    {
        devchap( "BASE VERSUS" );

        // FIXES

        make_clip(	"_booster_uppertrackb",		"Survivors",	1,	"-64 -448 -320",	"64 448 320",		"-1536 -2368 448" );
        make_clip(	"_booster_uppertracka",		"Survivors",	1,	"-57 -313 -208.5",	"57 313 208.5",		"-2721 -825 337" );
        make_clip( "_clipextend_carouselboost", "Survivors", 1, "-234 -4 0", "234 4 666", "-1446 -5248 192" );

        // Piggyback on Survivor-filtered trigger just beyond the carousel off switch.

        con_comment( "LOGIC:\tAnti-boost ToL clips will be deleted by existing trigger after carousel switch." );

        make_clip( "_tol_clip_brush_a", "Survivors", 1, "-818 -16 0", "82 599 572", "-3530 -5162 192" );
        make_clip( "_tol_clip_brush_b", "Survivors", 1, "-9 -263 0", "488 -1 572", "-3439 -5178 192" );
        DoEntFire( "!self", "AddOutput", "OnTrigger anv_mapfixes_tol_clip_brush*:Kill::-1", 0.0, null, Entities.FindByClassnameNearest( "trigger_once", Vector( -2496, -6544, 4 ), 1 ) );

    }

    if ( HasPlayerControlledZombies() )
    {
        kill_funcinfclip( 369.072 );		// Directly above start safe room
        kill_funcinfclip( 340.667 );		// Hedge next to start safe room
        kill_funcinfclip( 361.324 );		// Fence next to that hedge
        kill_funcinfclip( 340.839 );		// Fence next to that fence
        kill_funcinfclip( 930.962 );		// Delete clip above end safe roof
        kill_funcinfclip( 1865.19 );		// Delete clip on fairground's far back side (Tank fight area)
        make_atomizer( "_atomizer_bsp_dumpster", "-3777 -1164 -118", "models/props_junk/dumpster_2.mdl", 60 );
        make_atomizer( "_atomizer_anv_2009forklift", "-3777 -1164 -128", "models/props\\cs_assault\\forklift_brokenlift.mdl", 30 );
        make_atomizer( "_atomizer_bsp_forklift", "2752 -1529 0", "models/props\\cs_assault\\forklift_brokenlift.mdl", 60 );
        make_brush( "_losfix_end_gen",		"-28 -1 -8",	"28 1 8",	"-3546 -5845 -55" );
        make_brush( "_losfix_slide_gen",	"-28 -1 -8",	"28 1 8",	"-2363 -3306 -121" );
        make_brush( "_losfix_start_gen",	"-32 -1 -8",	"32 1 8",	"2812 946.508 7" );
        make_brush( "_losfix_trailer",	"-1 -100 -8",	"1 100 8",	"-2717 -2863 -122" );
        make_brush( "_losfix_warehouse_gen",	"-22 -1 -8",	"22 1 8",	"2859 -1715 8" );
        make_brush( "_tolentrance_base_losblock", "-1 -155 0", "4 149 38", "-3924 -5493 144" );
        make_brush( "_tolentrance_main_losblock", "-1 -139 0", "4 120 165", "-3924 -5493 144" );
        make_clip( "_ladder_garagebench_clipl", "Everyone", 1, "-8 -16 0", "8 16 161", "4103 -2102 4", "0 -45 0" );
        make_clip( "_ladder_garagebench_clipr", "Everyone", 1, "-8 -16 0", "8 16 161", "4103 -2142 4", "0 45 0" );
        make_clip( "_ladder_startrestrooms_clip", "Everyone", 1, "-6 -21 0", "11 26 127", "3061 1279 0" );
        make_clip( "_meticulous_funcinfclip01", "SI Players", 1, "-8 -886 0", "8 873 497", "-4349 -5498 272" );
        make_clip( "_meticulous_funcinfclip02", "SI Players", 1, "-61 -9 0", "55 9 497", "-4296 -6392 272" );
        make_clip( "_onewayfence_blocker", "Survivors", 1, "-192 -1 0", "192 1 197", "-2240 -3841 2" );
        make_clip( "_propladder_acvent_qolclip", "SI Players", 1, "-36 -28 -4", "32 32 12", "-1155 -6870 80" );
        make_clip( "_tolentrance_base_collision", "Everyone", 1, "-1 -155 0", "19 149 34", "-3924 -5493 144" );
        make_clip( "_tolentrance_main_collision", "Everyone", 1, "-1 -155 0", "4 149 165", "-3924 -5493 144" );
        make_clip( "_yeswayfairback_funcinfclip", "SI Players", 1, "-1824 -8 -384", "1824 17 384", "-2272 1824 384" );
        make_ladder( "_ladder_appleshedge_cloned_endelecboxback", "-3689 -6048 1", "2926 1156 -64" );
        make_ladder( "_ladder_brickbackend_cloned_whiteawnings", "-2736 -6652 16", "-10057 2274 158", "0 90 0", "-1 0 0" );
        make_ladder( "_ladder_brickbannerB_cloned_icemachine", "3855 784 98.6349", "868 292 26", "0 180 0", "1 0 0" );
        make_ladder( "_ladder_brickbannerT_cloned_icemachine", "3855 784 98.6349", "868 292 58", "0 180 0", "1 0 0" );
        make_ladder( "_ladder_bricksmokerB_cloned_bilehopcorner", "-800 -5500 32", "-2355 5377 -146" );
        make_ladder( "_ladder_bricksmokerT_cloned_bilehopcorner", "-800 -5500 32", "-2355 5377 174" );
        make_ladder( "_ladder_carouselelecbox_cloned_tallsignfence", "-1536 -5253 -64", "1389 -2362 -4", "0 -30 0", "-0.5 -0.87 0" );
        make_ladder( "_ladder_carouselpermstuck_cloned_trucknukenose", "-3664 -2409 -80", "1423 -2847 285" );
        make_ladder( "_ladder_carouseltiptop_cloned_trucknuketop", "-3664 -2317 -2", "1423 -3219 283" );
        make_ladder( "_ladder_endawningsT_cloned_endawningsB", "-2736 -6652 16", "105 -128 160" );
        make_ladder( "_ladder_endbrickback_cloned_endbrickfront", "-800 -5500 32", "-1857 -11769 0", "0 180 0", "0 -1 0" );
        make_ladder( "_ladder_endelecboxfront_cloned_endelecboxback", "-3689 -6048 1", "-7327 -11977 0", "0 180 0", "1 0 0" );
        make_ladder( "_ladder_endhedgefront_cloned_endhedgeback", "-3488 -6361 2", "-6981 -12673 0", "0 180 0", "0 1 0" );
        make_ladder( "_ladder_garagebench_cloned_icemachine", "3855 784 98.635", "233 -2906 -31" );
        make_ladder( "_ladder_genconcreteback_cloned_genconcretefront", "895 -56 64", "1806.25 -124.604 0", "0 180 0", "1 0 0" );
        make_ladder( "_ladder_generatorfence_cloned_galleryfence", "2451 -210 69", "2811 660 0", "0 -90 0", "0 1 0" );
        make_ladder( "_ladder_hedgecamera_cloned_chompyskypipe", "3089 -552 136", "1311 192 -82" );
        make_ladder( "_ladder_lilpeanutB_cloned_dumpsteralley", "-4015 -1756 32", "1215 -900 -32" );
        make_ladder( "_ladder_lilpeanutT_cloned_dumpsteralley", "-4015 -1756 32", "1215 -900 160" );
        make_ladder( "_ladder_midareafence_cloned_scavfencefront", "-1184 -1787 -62", "2848 2777 135" );
        make_ladder( "_ladder_parkourtracks1B_cloned_icemachine", "3855 784 98.6349", "-1507 -3201 -172", "0 90 0", "0 -1 0" );
        make_ladder( "_ladder_parkourtracks1T_cloned_trucknuketop", "-3664 -2317 -2", "205 -2872 107", "0 -90 0", "-1 0 0" );
        make_ladder( "_ladder_parkourtracks2B_cloned_icemachine", "3855 784 98.6349", "2350.1 -2390 -128", "0 180 0", "1 0 0" );
        make_ladder( "_ladder_parkourtracks2T_cloned_trucknuketop", "-3664 -2317 -2", "2718 -3998 106", "0 -45 0", "-0.7 -0.7 0" );
        make_ladder( "_ladder_picketback_cloned_galleryfence", "2451 -210 69", "-3682 1315 -153", "0 -90 0", "0 1 0" );
        make_ladder( "_ladder_picketfront_cloned_galleryfence", "2451 -210 69", "-4100.87 -3594.57 -152.873", "0 90 0", "0 -1 0" );
        make_ladder( "_ladder_redchickentent_cloned_gonutsleft", "2305 192 52", "1599 -1505 1" );
        make_ladder( "_ladder_ridesroof_cloned_bilejarcut", "-900 -640 0", "887 1085 89" );
        make_ladder( "_ladder_ridesroofbanner_cloned_containerpile", "-3952 -2561 -48", "4310 2825 359" );
        make_ladder( "_ladder_ridesroofright_cloned_telepoletrains", "-784 -9 34", "1643 273 64" );
        make_ladder( "_ladder_signgonuts_cloned_hedgebins", "2305 832 52", "-1 -310 0" );
        make_ladder( "_ladder_slidefencefront_cloned_slidefenceback", "-2917 -2752 -63", "-5827 -5634 0", "0 180 0", "1 0 0" );
        make_ladder( "_ladder_snoconestent_cloned_carouseluproom", "-2049 -4345 -26", "1537 4877 -28" );
        make_ladder( "_ladder_startfenceback_cloned_cargocontainerback", "351 -960 64", "1434 3072 1" );
        make_ladder( "_ladder_startfencefront_cloned_cargocontainerfront", "485 -960 64", "1305 3136 1" );
        make_ladder( "_ladder_starthedgeback_cloned_cargocontainerback", "351 -960 64", "1370 3432 1" );
        make_ladder( "_ladder_startrestrooms_cloned_icemachine", "3855 784 98.635", "-799 459 -35" );
        make_ladder( "_ladder_tankfallback_cloned_galleryfence", "2451 -210 69", "-267 -2451 -10", "0 90 0", "0 -1 0" );
        make_ladder( "_ladder_tankhedge_cloned_endelecboxback", "-3689 -6048 1", "-7149 -10818 -64", "0 180 0", "1 0 0" );
        make_ladder( "_ladder_tentcornerB_cloned_tentcornerback", "-3377 1344 -71.5", "-6604 2583 -8", "0 180 0", "1 0 0" );
        make_ladder( "_ladder_tenthedgejump_cloned_tentcornerback", "-3377 1344 -71.5", "-2404.46 -6133.6 -8", "0 -90 0", "0 1 0" );
        make_ladder( "_ladder_tolentrance_cloned_uppertrackway", "-900 -2432 0", "-6440 -4754 16", "0 90 0", "0 -1 0" );
        make_ladder( "_ladder_tolentrancetop_cloned_carouselfence", "-1416 -5243 -62", "1148 -6925 270", "0 -90 0", "1 0 0" );
        make_ladder( "_ladder_warehouseexitleft_cloned_scavfencefront", "-1184 -1787 -62", "1739 -6 128" );
        make_ladder( "_ladder_yeswayfairleft_cloned_scavfenceback", "-1248 -1797 -62", "-894 3244 -1" );
        make_ladder( "_ladder_yeswayfairright_cloned_scavfenceback", "-1248 -1797 -62", "48 3244 -1" );
        make_prop( "dynamic",		"_losblocker_hedgea",		"models/props_foliage/urban_hedge_128_64_high.mdl",		"2046 977 78",			"0 180.228 0",		"shadow_no" );
        make_prop( "dynamic",		"_losblocker_hedgeb",		"models/props_foliage/urban_hedge_128_64_high.mdl",		"2258 930 78",			"0 90.2275 0",		"shadow_no" );
        make_prop( "dynamic",		"_losblocker_hedgec",		"models/props_foliage/urban_hedge_128_64_high.mdl",		"2258 731 78",			"0 90.2275 0",		"shadow_no" );
        make_prop( "dynamic",		"_losblocker_hedged",		"models/props_foliage/urban_hedge_128_64_high.mdl",		"2258 638 78",			"0 90.2275 0",		"shadow_no" );
        make_prop( "dynamic",		"_losblocker_hedgee",		"models/props_foliage/urban_hedge_128_64_high.mdl",		"2258 410 78",			"0 90.2275 0",		"shadow_no" );
        make_prop( "dynamic",		"_losblocker_hedgef",		"models/props_foliage/urban_hedge_128_64_high.mdl",		"2258 295 78",			"0 90.2275 0",		"shadow_no" );
        make_prop( "dynamic",		"_losblocker_hedgeg",		"models/props_foliage/urban_hedge_128_64_high.mdl",		"2258 92 78",			"0 90.2275 0",		"shadow_no" );
        make_prop( "dynamic",		"_losblocker_hedgeh",		"models/props_foliage/urban_hedge_128_64_high.mdl",		"2046 47 78",			"0 180.228 0",		"shadow_no" );
        make_prop( "dynamic",		"_losblocker_hedgei",		"models/props_foliage/urban_hedge_128_64_high.mdl",		"1844 92 78",			"0 90.2275 0",		"shadow_no" );
        make_prop( "dynamic",		"_losblocker_hedgej",		"models/props_foliage/urban_hedge_128_64_high.mdl",		"1844 295 78",			"0 90.2275 0",		"shadow_no" );
        make_prop( "dynamic",		"_losblocker_hedgek",		"models/props_foliage/urban_hedge_128_64_high.mdl",		"1844 410 78",			"0 90.2275 0",		"shadow_no" );
        make_prop( "dynamic",		"_losblocker_hedgel",		"models/props_foliage/urban_hedge_128_64_high.mdl",		"1844 638 78",			"0 90.2275 0",		"shadow_no" );
        make_prop( "dynamic",		"_losblocker_hedgem",		"models/props_foliage/urban_hedge_128_64_high.mdl",		"1844 731 78",			"0 90.2275 0",		"shadow_no" );
        make_prop( "dynamic",		"_losblocker_hedgen",		"models/props_foliage/urban_hedge_128_64_high.mdl",		"1844 930 78",			"0 90.2275 0",		"shadow_no" );
        make_prop( "dynamic",		"_propladder_acvent",		"models/props_rooftop/acvent02.mdl",		"-1156 -6874 32.92",		"0 0.5 0",		"shadow_no" );
        make_prop( "dynamic", "_ladder_garagebench_pipe", "models/props_rooftop/Gutter_Pipe_128.mdl", "4096 -2122 159", "0 -90 0", "shadow_no" );
        make_prop( "dynamic", "_ladder_hedgecamera_pipe", "models/props_rooftop/Gutter_Pipe_256.mdl", "4384 -360 196", "0 90 0", "shadow_no" );
        make_prop( "dynamic", "_ladder_parkourtracks1B_pipe", "models/props_rooftop/Gutter_Pipe_128.mdl", "-2291 670 0", "0 0 0", "shadow_no" );
        make_prop( "dynamic", "_ladder_ridesroof_pipe", "models/props_rooftop/Gutter_Pipe_256.mdl", "0 445 201", "0 -90 0", "shadow_no" );
        make_prop( "dynamic", "_ladder_ridesroofright_pipe", "models/props_rooftop/Gutter_Pipe_256.mdl", "859 272 242", "0 0 0", "shadow_no" );
        make_prop( "dynamic", "_ladder_tolentrance_pipe", "models/props_rooftop/Gutter_Pipe_256.mdl", "-4008 -5648 144", "0 0 0", "shadow_no" );
        make_prop( "dynamic", "_losblocker_ridesroof", "models/props_rooftop/acvent03.mdl", "923 406 222", "0 0 0", "shadow_no" );
        make_prop( "dynamic", "_losblocker_startfence", "models/props_urban/fence_cover001_256.mdl", "1788 2145 1", "0 0 0", "shadow_no" );
        make_prop( "dynamic", "_propladder_ridesroof", "models/props_urban/chimney001.mdl", "288 300 315", "0 -90 0", "shadow_no" );
        make_prop( "dynamic", "_startroof_wrongwaya", "models/props_misc/wrongway_sign01_optimized.mdl", "1539 2888 200", "0 0 0", "shadow_no", "solid_no", "255 255 255", "17", "217" );
        make_prop( "dynamic", "_startroof_wrongwayb", "models/props_misc/wrongway_sign01_optimized.mdl", "1539 2678 200", "0 0 0", "shadow_no", "solid_no", "255 255 255", "17", "217" );
        make_prop( "dynamic", "_startroof_wrongwayc", "models/props_misc/wrongway_sign01_optimized.mdl", "1539 2490 60", "0 0 0", "shadow_no", "solid_no", "255 255 255", "17", "217" );
        make_prop( "dynamic", "_startroof_wrongwayd", "models/props_misc/wrongway_sign01_optimized.mdl", "1539 2160 60", "0 0 0", "shadow_no", "solid_no", "255 255 255", "17", "217" );
        make_prop( "dynamic", "_yeswayfairback_wall", "models/props_update/c2m2_fairgroundwall.mdl", "-2304 1536 -32", "0 270 0", "shadow_no" );
        make_prop( "physics", "_hittable_2009forklift", "models/props/cs_assault/forklift.mdl", "-3666 -1321 -111", "0 135 0" );
        make_trigduck( "_duckqol_carouselroof", "-30 1 0", "30 3 1", "-2240 -5259 303" );
        patch_nav_checkpoint( "1737 2712 4" );
        patch_nav_checkpoint( "-4337 -5511 -64" );

        // Manually fix the 2009 forklift since it is spawned after anv_mapfixes runs
        NetProps.SetPropInt( Entities.FindByName( null, g_UpdateName + "_hittable_2009forklift" ), "m_iMinHealthDmg", 400 );
        NetProps.SetPropInt( Entities.FindByName( null, g_UpdateName + "_hittable_2009forklift" ), "m_takedamage", 3 );
    }
}

function DoTankWarp( hndTank )
{
    // move tank spawn inside carousel fence to behind the carousel (~80% boss flow)
	if( anv_tankwarps.CheckToWarpTank( hndTank, [-2750, -5450, -1450, -4925] ) )
	{
		hndTank.SetOrigin( Vector( -1725, -5900, 68.0 ) );
	}
}