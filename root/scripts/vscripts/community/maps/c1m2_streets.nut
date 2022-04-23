g_Chapter = "DEAD CENTER - STREETS";

devchap( "ALL MODES" );

PrecacheModel( "models/props_fortifications/concrete_block001_128_reference.mdl" );
PrecacheModel( "models/props_vehicles/van_interior.mdl" );
PrecacheModel( "models/props_urban/streetlight001.mdl" );
PrecacheModel( "models/props_misc/wrongway_sign01_optimized.mdl" );
PrecacheModel( "models/props_vehicles/bus01_2.mdl" );
PrecacheModel( "models/props_highway/plywood_01.mdl" );
PrecacheModel( "models/props_vehicles/van.mdl" );
PrecacheModel( "models/props_vehicles/van_glass.mdl" );
PrecacheModel( "models/props_highway/plywood_03.mdl" );
PrecacheModel( "models/props_update/c8m1_rooftop_1.mdl" );
PrecacheModel( "models/props_update/c8m1_rooftop_3.mdl" );
PrecacheModel( "models/props_urban/fence_cover001_128.mdl" );
PrecacheModel( "models/props_urban/fence_cover001_64.mdl" );
PrecacheModel( "models/props_update/c1m2_wrongway_rooftop1.mdl" );
PrecacheModel( "models/props_update/c1m2_wrongway_rooftop2.mdl" );
PrecacheModel( "models/props_update/c1m2_wrongway_wall.mdl" );
PrecacheModel( "models/props_foliage/urban_hedge_256_128_high.mdl" );

function DoRoundFixes()
{
	make_clip( "_mindthegap_lolvalve",		"SI Players",	1,	"-32 -4 -64",		"32 4 64",		"-2472 137 64" );
	make_clip( "_stuckwarpassist_walltovoid",	"SI Players",	1,	"-1536 -476 -5",	"0 500 0",		"-5056 1500 1344" );
	make_clip( "_nav_cedaramp_in", "SI Players and AI", 1, "0 -18 -14", "10 21 51", "-4268 2566 75", "-50 -35 0" );
	make_clip( "_nav_cedaramp_out", "SI Players and AI", 1, "-95 -20 4", "38 17 11", "-4322 2567 102", "-8 0 0" );
	make_clip( "_colastore_clipgap", "Survivors", 1, "-8 -97 0", "8 75 856", "-6792 -3215 616" );
	make_clip( "_colastore_clipawn", "Survivors", 1, "-23 -541 1", "41 547 17", "-7017 -1699 599" );
	make_clip( "_ladderqol_railing", "SI Players", 1, "-138 -1 -12", "758 4 36", "-2614 2319 300" );
	make_clip( "_save4lesscurb_smoother1", "Everyone", 1, "-7 -110 0", "14 113 5", "-6515 -2681 384" );
	make_clip( "_save4lesscurb_smoother2", "Everyone", 1, "-7 -127 0", "14 129 5", "-6515 -2302 384" );
	make_clip( "_save4lesscurb_smoother3", "Everyone", 1, "-7 -432 0", "9 435 5", "-6899 -1601 384" );
	make_clip( "_ladderqol_smootherl", "Everyone", 1, "-7 -190 0", "7 190 2", "-6059 -2238 430", "-45 0 0" );
	make_clip( "_ladderqol_smootherm", "Everyone", 1, "-7 -255 0", "7 118 2", "-6060 -2586 427", "-45 0 0" );
	make_clip( "_ladderqol_smootherr", "Everyone", 1, "-7 -36 0", "7 77 2", "-6056 -2960 412", "-45 0 0" );
	make_clip( "_whitakercurb_smoother1", "Everyone", 1, "-9 -315 0", "15 294 6", "-5525 -2349 448" );
	make_clip( "_whitakercurb_smoother2", "Everyone", 1, "-9 -208 0", "15 160 6", "-5525 -1719 448" );
	make_clip( "_booster_bridgestairsa", "Survivors", 1, "-4 -84 0", "4 84 700", "-5572 932 768" );
	make_clip( "_booster_bridgestairsb", "Survivors", 1, "-56 -8 0", "56 8 700", "-5512 1016 832" );
	make_clip( "_booster_building", "Survivors", 1, "-8 -384 0", "8 384 128", "-5064 1408 1344" );

	if ( g_BaseMode == "survival" )
	{
		devchap( "BASE SURVIVAL" );

		// FIXES

		make_clip( "_tanker_blowfish", "Survivors", 1, "-85 -435 -6", "33 331 791", "-6740 -758 681", "0 328 0" );

	}

	if ( HasPlayerControlledZombies() )
	{
		kill_funcinfclip( 1112.27 );	// Delete clip that's long and covers most wrongway signs
		kill_funcinfclip( 777.979 );	// Delete clip along same way but off to the right side
		kill_funcinfclip( 545.427 );	// Delete clip of chokepoint building's front side
		kill_funcinfclip( 538.073 );	// Delete clip of chokepoint building's right side
		kill_funcinfclip( 502.461 );	// Delete clip of chokepoint building's back side
		kill_funcinfclip( 579.319 );	// Delete clip directly above wrongway signs
		kill_funcinfclip( 790.065 );	// Delete clip to the right that'd block new vine ladder up
		make_atomizer( "_atomizer_bsp_dumpster", "-7475 -4582 384", "models/props_junk/dumpster_2.mdl", 60 );
		make_brush( "_losfix_backstreet_van",	"-1 -64 -10",	"1 64 10",	"-2182 687 9" );
		make_brush( "_losfix_endstreet_bus",	"-1 -28 -12",	"1 60 12",	"-8352 -2283 395" );
		make_brush( "_losfix_endstreet_fence",	"-1 -616 -5",	"1 616 5",	"-7071 -3944 389" );
		make_brush( "_losfix_endstreet_gen1",	"-1 -25 -9",	"1 25 9",	"-7143 -4150 393" );
		make_brush( "_losfix_endstreet_gen2",	"-1 -26 -9",	"1 26 9",	"-8699 -4013 393" );
		make_brush( "_losfix_endstreet_van",	"-90 -1 -10",	"90 1 10",	"-7893 -2305 394" );
		make_brush( "_losfix_sidestreet_van1",	"-35 -2 -10",	"35 2 10",	"-1209 3992 131" );
		make_brush( "_losfix_sidestreet_van2",	"-2 -62 -10",	"2 62 10",	"-1180 4061 132" );
		make_brush( "_losfix_sidestreet_van3",	"-35 -2 -10",	"35 2 10",	"-1162 4126 138" );
		make_brush( "_losfix_skybridge_bus",	"-45 -1 -13",	"61 1 13",	"-5310 -609 460" );
		make_brush( "_losfix_stairs_gen1",	"-1 -20 -8",	"1 20 8",	"-4974 1669 392" );
		make_brush( "_losfix_stairs_gen2",	"-18 -1 -8",	"19 1 8",	"-4994 1651 392" );
		make_brush( "_losfix_starting_truck",	"-100 -1 0",	"190 1 30",	"1165 2493 571.5" );
		make_brush( "_losfix_tanker1",		"-4 -72 -60",	"4 72 60",	"-6939 -1040 444" );
		make_brush( "_losfix_tanker2",		"-48 -4 -20",	"48 4 60",	"-6894 -964 444" );
		make_brush( "_losfix_tanker3",		"-4 -72 -20",	"4 72 60",	"-6844 -888 444" );
		make_brush( "_losfix_tanker4",		"-43 -4 -20",	"43 4 60",	"-6797 -820 444" );
		make_brush( "_losfix_tanker5",		"-4 -15 -20",	"4 15 60",	"-6753 -801 444" );
		make_brush( "_losfix_tanker6",		"-4 -50 -60",	"4 80 60",	"-6753 -736 444" );
		make_brush( "_losfix_tanker7",		"-48 -4 -60",	"48 4 60",	"-6675 -619 444" );
		make_brush( "_losfix_tanker8",		"-4 -36 -60",	"4 36 60",	"-6631 -579 444" );
		make_brush( "_losfix_tanker9",		"-4 -38 -40",	"4 38 40",	"-6623 -505 426" );
		make_clip( "_clipgap_deadendfence", "SI Players", 1, "-129 -7 -32", "145 7 32", "-1168 5160 383" );
		make_clip( "_ladder_copvines_clip", "SI Players", 1, "-16 -12 -2", "16 32 0", "-284 3211 719", "0 0 37" );
		make_clip( "_ladder_endbillboard_clipB", "SI Players", 1, "-5 -16 -10", "5 16 21", "-7470 -150 696", "0 -18 0" );
		make_clip( "_ladder_endbillboard_clipT", "SI Players", 1, "-5 -16 -10", "5 16 21", "-7471 -150 714", "0 -18 0" );
		make_clip( "_ladder_saferoomperch_clip", "Everyone", 1, "-18 -7 0", "14 9 288", "-8190 -4353 384" );
		make_clip( "_ladder_tankhedge_jumpclip", "SI Players", 1, "-404 1 0", "428 2 46", "2644 3327 640" );
		make_clip( "_ladderqol_railingtop", "SI Players", 1, "-266 -1 -12", "758 4 18", "-2614 2318 348" );
		make_clip( "_ladderqol_railleftbot", "SI Players", 1, "-125 -1 0", "134 0 48", "-1154 2322 320" );
		make_clip( "_ladderqol_raillefttop", "SI Players", 1, "-125 -1 0", "134 0 30", "-1154 2321 368" );
		make_clip( "_skybridgebus_clip", "SI Players", 1, "-30 -95 -20", "20 48 45", "-5164 -485 595" );
		make_clip( "_clipgap_mallroof", "Everyone", 1, "-25 -142 0", "55 114 448", "-9207 -4402 1024" );
		make_clip( "_yeswaychoke_clip", "SI Players", 1, "-275 -12 0", "251 240 945", "-3636 1800 523" );
		make_clip( "_yeswaycorner_clip", "SI Players", 1, "-8 -512 0", "8 256 1472", "3703 2048 704" );
		make_clip( "_yeswayturnpike_clipa", "SI Players", 1, "-128 -512 0", "128 512 768", "-384 512 704" );
		make_clip( "_yeswayturnpike_clipb", "SI Players", 1, "-620 -8 -64", "620 8 1016", "-876 48 456" );
		make_clip( "_booster_mallcanopy_a", "Survivors", 1, "-594 -132 -396", "594 132 396", "-7670 -4412 1076" );
		make_clip( "_booster_mallcanopy_b", "Survivors", 1, "-174 -168 -404", "174 168 404", "-8000 -4400 1068" );
		make_ladder( "_ladder_acbuildfront_cloned_acbuildside", "-6524 510 576", "-5059 7184 0", "0 90 0", "1 0 0" );
		make_ladder( "_ladder_copfenceright_cloned_copfenceleft", "-1002 2368 391.5", "8 450 0" );
		make_ladder( "_ladder_copvines_cloned_startvines", "2136 4926 600", "-2420 -1725 -35" );
		make_ladder( "_ladder_dumpsterfront_cloned_dumpsterback", "-4845 -1167 494", "-9818 -2332 0", "0 -180 0", "-1 0 0" );
		make_ladder( "_ladder_dynamictanker_cloned_roundthehedge", "-7554 -1280 500", "-5913 -8705 0", "0 -90 0", "0 1 0" );
		make_ladder( "_ladder_endbillboardB_cloned_save4lessleft", "-6704 -2754 536", "-729 2611 -89" );
		make_ladder( "_ladder_endbillboardT_cloned_save4lessright", "-6864 -2238 536", "-6642.5 -6636.1 -2475.7", "24 -103 3", "1 -0.08 0" );
		make_ladder( "_ladder_endfence_cloned_carthedge", "-6034 -2592 480", "-1040 -1456 -47" );
		make_ladder( "_ladder_endfenceconcrete_cloned_endvanconcrete", "-7554 -2048 500", "-9200 4227 0", "0 90 0", "0 -1 0" );
		make_ladder( "_ladder_fencedinplatform_cloned_longfencefarleft", "1728 2306 649", "-2305 3724 -18", "0 -90 0", "1 0 0" );
		make_ladder( "_ladder_hedgesreturn_cloned_skystairsback", "-5488 -878 514", "-10775 -1021 0", "0 180 0", "0 -1 0" );
		make_ladder( "_ladder_longfencefarright_cloned_longfencefarleft", "1728 2306 649", "-900 -5 -16" );
		make_ladder( "_ladder_oneway_cloned_stairsbus", "-2800 1182 66", "-1680 1129 364" );
		make_ladder( "_ladder_overpassleft_cloned_overpassright", "-1920 2322 333.5", "508 0 23" );
		make_ladder( "_ladder_postdropcut_cloned_turnpikemid", "-1026 1280 256", "-5159.81 2996.11 0", "0 165.5 0", "0.96 -0.25 0" );
		make_ladder( "_ladder_saferoomperch_cloned_save4less", "-6864 -2238 536", "-1328 -2107 -8" );
		make_ladder( "_ladder_saferoomperchoob_cloned_save4less", "-6864 -2238 536", "-176 -2107 -8" );
		make_ladder( "_ladder_skybridgebus_cloned_endbusright", "-8406 -2272 449", "1578 -5868 64", "0 -53 0", "-0.6 0.8 0" );
		make_ladder( "_ladder_skybridgechance_cloned_yellowbrickcones", "-5526 -1200 521", "334 1154 217" );
		make_ladder( "_ladder_skybridgedodge_cloned_yellowbrickcones", "-5526 -1200 521", "334 137 217" );
		make_ladder( "_ladder_skybridgestains_cloned_endslopeleft", "-1002 2368 391.5", "-6972 -873 -83", "0 -76 0", "0.18 -0.98 0" );
		make_ladder( "_ladder_skystairsfront_cloned_skystairsback", "-5488 -878 514", "-10875 -1773 0", "0 180 0", "0 -1 0" );
		make_ladder( "_ladder_slopeleftvine_cloned_save4lessright", "-6864 -2238 536", "6808 4541 24" );
		make_ladder( "_ladder_stairvines_cloned_dumpstervines", "-2064 2302 205.5", "-973 3 3" );
		make_ladder( "_ladder_startareavines_cloned_dumpsterright", "-2064 2302 205.5", "3133 6469 453", "0 90 0", "1 0 0" );
		make_ladder( "_ladder_startfencefar_cloned_startfenceback", "2446 4732 518", "119 -850 77" );
		make_ladder( "_ladder_startfencefront_cloned_startfenceback", "2446 4732 518", "4873 9426 0", "0 180 0", "-1 0 0" );
		make_ladder( "_ladder_starthedgesfront_cloned_starthedgesback", "738 3376 687", "1536 6993 0", "0 180 0", "1 0 0" );
		make_ladder( "_ladder_tankerfrontleft_cloned_tankerfenceleft", "-5808 -126 510", "-12063 -269 -5", "0 180 0", "0 -1 0" );
		make_ladder( "_ladder_tankerfrontmid_cloned_tankerfencemid", "-6032 -126 510", "-12063 -269 -5", "0 180 0", "0 -1 0" );
		make_ladder( "_ladder_tankerfrontright_cloned_tankerfenceright", "-6288 -126 506", "-12063 -269 -5", "0 180 0", "0 -1 0" );
		make_ladder( "_ladder_tankhedge_cloned_stairsbus", "-2800 1182 66", "5389 2072 572" );
		make_ladder( "_ladder_tentbus_cloned_saferoomfence", "2446 4732 518", "2409.7 -2499.03 112", "0 30 0", "0.86 0.5 0" );
		make_ladder( "_ladder_truckandtent_cloned_carthedge", "-6034 -2592 480", "-1460 8465 153", "0 90 0", "0 -1 0" );
		make_ladder( "_ladder_turnpikeleft_cloned_turnpikemid", "-1026 1280 256", "3 780 0" );
		make_ladder( "_ladder_turnpikeright_cloned_turnpikemid", "-1026 1280 256", "-1053 -1275 -41", "0 -27.42 0", "-0.89 0.46 0" );
		make_ladder( "_ladder_whitakerback_cloned_tinyendladder", "-7168 -2754 650", "2020 579 128" );
		make_ladder( "_ladder_whitakergunshop_cloned_eventicemachine", "-5506 -2564 544", "-2400 -7165 172", "0 -90 0", "0 1 0" );
		make_ladder( "_ladder_whitakerquick_cloned_hedgeparklot", "-6034 -2256 476", "723.9 196 233" );
		make_ladder( "_ladder_yeswaychokefence_cloned_yellowbrickcones", "-5526 -1200 521", "2391 2893 -400" );
		make_ladder( "_ladder_yeswaychokeroof_cloned_tankerfencemid", "-6032 -126 510", "2384 2428.1 -70" );
		make_ladder( "_ladder_yeswaycornerinner_cloned_roundthehedge", "-7554 -1280 500", "9600 3329 136" );
		make_ladder( "_ladder_yeswaycornerouter_cloned_save4lessright", "-6864 -2238 536", "9427 4543.1 72" );
		make_ladder( "_ladder_yeswayturnpikesign_cloned_turnpikemid", "-1026 1280 256", "-1936 2051 396", "0 180 0", "1 0 0" );
		make_prop( "dynamic",		"_propladder_blocka",		"models/props_fortifications/concrete_block001_128_reference.mdl",	"-2296 2341 288",		"0 270 0",		"shadow_no" );
		make_prop( "dynamic",		"_propladder_blockb",		"models/props_fortifications/concrete_block001_128_reference.mdl",	"-2426 2341 287",		"0 270 0",		"shadow_no" );
		make_prop( "dynamic",		"_propladder_blockc",		"models/props_fortifications/concrete_block001_128_reference.mdl",	"-2816 2340 288",		"0 270 0",		"shadow_no" );
		make_prop( "dynamic",		"_propladder_blockd",		"models/props_fortifications/concrete_block001_128_reference.mdl",	"-2946 2339 289",		"0 270 -2.5",		"shadow_no" );
		make_prop( "dynamic",		"_propladder_blocke",		"models/props_fortifications/concrete_block001_128_reference.mdl",	"-3076 2339 295",		"0 270 -3.5",		"shadow_no" );
		make_prop( "dynamic",		"_propladder_blockf",		"models/props_fortifications/concrete_block001_128_reference.mdl",	"-3203 2339 302",		"0 270 -2",		"shadow_no" );
		make_prop( "dynamic", "_endbillboard_crashedvan", "models/props_vehicles/van_interior.mdl", "-7350 0 400", "12 120 8" );
		make_prop( "dynamic", "_endbillboard_streetlight", "models/props_urban/streetlight001.mdl", "-7434 -95 370", "-23 90 -8", "shadow_no" );
		make_prop( "dynamic", "_endbillboard_wrongway", "models/props_misc/wrongway_sign01_optimized.mdl", "-7622 -143 824", "0 -90 0", "shadow_no", "solid_no", "255 255 255", 217, 17 );
		make_prop( "dynamic", "_losblocker_skybridgebus", "models/props_vehicles/bus01_2.mdl", "-5180 -508 447", "0 37 0" );
		make_prop( "dynamic", "_propladder_endplywood1", "models/props_highway/plywood_01.mdl", "-7018.5 -3914 471.5", "45 0 0", "shadow_no" );
		make_prop( "dynamic", "_propladder_endplywood2", "models/props_highway/plywood_01.mdl", "-7069.5 -3818 522.5", "-45 180 0", "shadow_no" );
		make_prop( "dynamic", "_propladder_endvan", "models/props_vehicles/van.mdl", "-7003 -3900 383", "0 182 0" );
		make_prop( "dynamic", "_propladder_endvanglass", "models/props_vehicles/van_glass.mdl", "-7003 -3900 383", "0 182 0", "shadow_no" );
		make_prop( "dynamic", "_propladder_whitakergunshop_plywood", "models/props_highway/plywood_03.mdl", "-4798 -1600 623", "-41 270 0", "shadow_no" );
		make_prop( "dynamic", "_yesdraw_disproof_hunt1", "models/props_update/c8m1_rooftop_1.mdl", "-6032 1264 1344", "0 0 0", "shadow_no" );
		make_prop( "dynamic", "_yesdraw_disproof_hunt2", "models/props_update/c8m1_rooftop_1.mdl", "-6032 1744 1344", "0 0 0", "shadow_no" );
		make_prop( "dynamic", "_yesdraw_disproof_hunt3", "models/props_update/c8m1_rooftop_3.mdl", "-5280 1264 1344", "0 0 0", "shadow_no" );
		make_prop( "dynamic", "_yesdraw_disproof_hunt4", "models/props_update/c8m1_rooftop_3.mdl", "-5280 1744 1344", "0 0 0", "shadow_no" );
		make_prop( "dynamic", "_yesdraw_skybroof_hunt1", "models/props_update/c8m1_rooftop_1.mdl", "-4368 3312 1728", "0 0 0", "shadow_no" );
		make_prop( "dynamic", "_yesdraw_skybroof_hunt2", "models/props_update/c8m1_rooftop_3.mdl", "-3616 3312 1728", "0 0 0", "shadow_no" );
		make_prop( "dynamic", "_yeswaychoke_fence1", "models/props_urban/fence_cover001_128.mdl", "-3870 1887 512", "0 0 0", "shadow_no" );
		make_prop( "dynamic", "_yeswaychoke_fence2", "models/props_urban/fence_cover001_64.mdl", "-3870 1983 512", "0 0 0", "shadow_no" );
		make_prop( "dynamic", "_yeswaychoke_roof1", "models/props_update/c1m2_wrongway_rooftop1.mdl", "-3900 2044 532", "0 0 0", "shadow_no" );
		make_prop( "dynamic", "_yeswaychoke_roof2", "models/props_update/c1m2_wrongway_rooftop2.mdl", "-3652 2052 532", "0 0 0", "shadow_no" );
		make_prop( "dynamic", "_yeswaychoke_wrongwaya", "models/props_misc/wrongway_sign01_optimized.mdl", "-3538 2042 574", "0 90 0", "shadow_no", "solid_no", "255 255 255", 300, 17 );
		make_prop( "dynamic", "_yeswaychoke_wrongwayb", "models/props_misc/wrongway_sign01_optimized.mdl", "-3648 2042 574", "0 90 0", "shadow_no", "solid_no", "255 255 255", 300, 17 );
		make_prop( "dynamic", "_yeswaychoke_wrongwayc", "models/props_misc/wrongway_sign01_optimized.mdl", "-3758 2042 574", "0 90 0", "shadow_no", "solid_no", "255 255 255", 300, 17 );
		make_prop( "dynamic", "_yeswaycorner_wall", "models/props_update/c1m2_wrongway_wall.mdl", "3072 2048 608", "0 270 0", "shadow_no" );
		make_prop( "dynamic", "_yeswaycorner_wrongway", "models/props_misc/wrongway_sign01_optimized.mdl", "3703 2048 768", "0 180 0", "shadow_no", "solid_no", "255 255 255", 217, 17 );
		make_prop( "dynamic", "_yeswayturnpike_hedgea", "models/props_foliage/urban_hedge_256_128_high.mdl", "-599 1037 502", "-22 0 0", "shadow_no" );
		make_prop( "dynamic", "_yeswayturnpike_hedgeb", "models/props_foliage/urban_hedge_256_128_high.mdl", "-860 1037 426", "0 0 0", "shadow_no" );
		make_prop( "dynamic", "_yeswayturnpike_wrongwaya", "models/props_misc/wrongway_sign01_optimized.mdl", "-816 32 496", "0 90 0", "shadow_no", "solid_no", "255 255 255", 217, 17 );
		make_prop( "dynamic", "_yeswayturnpike_wrongwayb", "models/props_misc/wrongway_sign01_optimized.mdl", "-1200 32 496", "0 90 0", "shadow_no", "solid_no", "255 255 255", 217, 17 );
		patch_ladder( "-5168 162.0004 448", "0 -4 0" );

		con_comment( "LOGIC:\tLOS tanker fixes will be deleted upon its destruction." );

		EntFire( "tanker_destruction_relay", "AddOutput", "OnTrigger " + g_UpdateName + "_losfix_tanker*:Kill::0:-1" );

		con_comment( "FIX/ANTI-GRIEF:\tRemoved trigger which disables common infected spawns in Save 4 Less area for Versus only." );
		kill_entity( Entities.FindByClassnameNearest( "trigger_once", Vector( -5128, -992, 548 ), 1 ) );
	}

	// Resolve stuck Tank spawns for Versus Survival & Taaannnk! Mutation.

	if ( g_MutaMode == "mutation15" || g_MutaMode == "mutation19" )
	{
		// Delete all. Extremely problematic map with countless stuck
		// spawns, but Skybox stops most opportunities to get under
		// the map and the only way to get out of bounds is limited.

		EntFire( "func_playerinfected_clip", "Kill" );
		EntFire( g_UpdateName + "_yeswayturnpike_clipb", "Kill" );
	}
}

function DoTankWarp( hndTank )
{
	// move tank spawn at ceda truck drop to the top of the stairs (~44% boss flow)
	if ( CheckToWarpTank( hndTank, [-4755, 555, -4295, 1110] ) )
	{
		hndTank.SetOrigin( Vector( -5025, 725, 384.1 ) );
	}
}