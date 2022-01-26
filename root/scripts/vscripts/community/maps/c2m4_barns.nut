g_Chapter = "DARK CARNIVAL - BARNS";

devchap( "ALL MODES" );

PrecacheModel( "models/props_unique/haybails_single.mdl" );
PrecacheModel( "models/props_update/c2m4_barn_overhang.mdl" );
PrecacheModel( "models/props_c17/metalladder001.mdl" );
PrecacheModel( "models/props_highway/plywood_01.mdl" );
PrecacheModel( "models/props_urban/fence_cover001_256.mdl" );
PrecacheModel( "models/props_misc/wrongway_sign01_optimized.mdl" );
PrecacheModel( "models/props_urban/garbage_can002.mdl" );
PrecacheModel( "models/props_rooftop/Gutter_Pipe_256.mdl" );
PrecacheModel( "models/props_fortifications/police_barrier001_128_reference.mdl" );
PrecacheModel( "models/props_fairgrounds/bumpercar.mdl" );

function DoRoundFixes()
{
	make_clip(	"_outhouse_saferoof",		"Survivors",	1,	"-94 -32 0",		"94 32 1111",		"2608 3920 -88" );
	make_clip( "_booster_barnbeam1", "Survivors", 1, "-145 -3 0", "158 5 65", "-2022 -129 32" );
	make_clip( "_booster_barnbeam2", "Survivors", 1, "-145 -3 0", "158 5 65", "-2022 -321 32" );
	make_clip( "_booster_barnbeam3", "Survivors", 1, "-145 -3 0", "158 5 65", "-1318 63 32" );
	make_clip( "_booster_barnbeam4", "Survivors", 1, "-145 -3 0", "158 5 65", "-1318 -129 32" );
	make_clip( "_booster_barnbeam5", "Survivors", 1, "-145 -3 0", "158 5 65", "-1318 -321 32" );
	make_clip( "_booster_barnbeam6", "Survivors", 1, "-125 -11 0", "138 5 82", "-614 63 32" );
	make_clip( "_booster_barnbeam7", "Survivors", 1, "-145 -3 0", "158 5 65", "-614 -129 32" );
	make_clip( "_booster_barnbeam8", "Survivors", 1, "-145 -3 0", "158 5 65", "-614 -321 32" );
	make_clip( "_nav_eventfenceback", "Survivors", 1, "-8 -159 0", "25 164 1036", "-2266 807 -12", "0 72 0" );
	make_clip( "_cliprework_finalfence", "Survivors", 1, "-96 -6 0", "120 11 704", "-120 2446 320" );
	make_clip( "_booster_lightpole1", "Survivors", 1, "-59 -20 0", "64 18 637", "280 2077 387" );
	make_clip( "_booster_lightpole2", "Survivors", 1, "-20 -59 0", "18 64 637", "1 1508 387" );
	make_clip( "_booster_lightpole3", "Survivors", 1, "-20 -59 0", "18 64 637", "-226 846 387" );
	make_clip( "_booster_lightpole4", "Survivors", 1, "-20 -59 0", "18 64 637", "-483 1508 387" );
	make_clip( "_booster_lightpole5", "Survivors", 1, "-20 -59 0", "18 64 637", "-985 1508 387" );
	make_clip( "_booster_lightpole6", "Survivors", 1, "-20 -59 0", "18 64 637", "-1765 1508 387" );
	make_clip( "_booster_lightpole7", "Survivors", 1, "-20 -59 0", "18 64 637", "-2162 901 387" );
	make_clip( "_booster_lightpole8", "Survivors", 1, "-20 -59 0", "18 64 637", "-1198 902 387" );
	make_clip( "_booster_dualtents", "Survivors", 1, "-80 -221 0", "59 232 607", "-2993 1146 417" );
	make_clip( "_booster_awning", "Survivors", 1, "-17 -16 -34", "274 13 134", "-3119 528 5" );
	make_clip( "_booster_elecroof", "Survivors", 1, "-170 -28 0", "182 21 967", "426 2316 57" );
	make_clip( "_ladder_askewhedgeshared_base", "Everyone", 1, "-2 -336 0", "4 195 128", "609 1233 -192" );
	make_clip( "_commentary_permstuck_dumpsters_a", "Survivors", 1, "-8 -8 -8", "190 64 1208", "2936 584 -184" );
	make_clip( "_commentary_permstuck_dumpsters_b", "Survivors", 1, "-325 -163 -608", "325 163 608", "3451 739 416" );
	make_clip( "_commentary_boostertree_a", "Survivors", 1, "-117 -122 -80", "184 200 930", "-704 864 88.25" );
	make_clip( "_commentary_boostertree_b", "Survivors", 1, "-117 -122 -80", "230 122 930", "128 832 88.25" );
	make_clip( "_commentary_boostertree_c", "Survivors", 1, "-119 -122 -80", "50 186 910", "-1648 784 104.25" );
	patch_spawninfront( "-596 2312 -256", "-76 -8 0", "76 8 160" );
	patch_spawninfront( "-508 2503 -256", "-8 -51 0", "8 51 160" );

	if ( g_BaseMode == "coop" || g_BaseMode == "realism" )
	{
		devchap( "BASE COOP" );

		// FIXES

		con_comment( "KILL:\tSafe roof exploit unpatched for Coop (popular request)." );

		EntFire( g_UpdateName + "_outhouse_saferoof", "Kill" );

	}
	if ( g_BaseMode == "versus" )
	{
		devchap( "BASE VERSUS" );

		// FIXES

		make_clip( "_commonhop_generator1", "Survivors", 1, "-35 -16 0", "35 16 50", "-1716 273 -81", "0 0 20" );
		make_clip( "_commonhop_generator2", "Everyone", 1, "8 0 0", "58 8 164", "-1660 275 -192", "0 -19 0" );

		make_clip( "_commentary_shortcut_generator_a", "Survivors", 1, "-5 -5 -98", "5 5 98", "-1721 373 -94" );
		make_clip( "_commentary_shortcut_generator_b", "Survivors", 1, "-28 -20 -504", "28 20 504", "-1718.5 376 520" );

	}
	if ( g_BaseMode == "survival" )
	{
		devchap( "BASE SURVIVAL" );

		// FIXES

		make_clip( "_eventskip_fencehang", "Survivors", 1, "-6 -50 0", "6 50 1072", "398 1990 -48" );
		make_clip( "_nav_eventfencea", "Survivors", 1, "-49 -3 0", "48 14 1045", "-2751 749 -21" );
		make_clip( "_nav_eventfenceb", "Survivors", 1, "-49 -3 0", "48 14 1045", "-2499 749 -21" );
		make_clip( "_booster_clipextend", "Survivors", 1, "-38 -67 0", "10 61 668", "646 1995 356" );

		make_clip( "_ladder_askewhedgeshared_clip", "SI Players and AI", 1, "-3 -279 -7", "3 245 79", "593 1177 -63" );
		make_ladder( "_ladder_askewhedgebotr1_cloned_askewhedgebotl", "610 1209.88 -123.984", "0 26 0" );
		make_ladder( "_ladder_askewhedgebotr2_cloned_askewhedgebotl", "610 1209.88 -123.984", "0 52 0" );
		make_ladder( "_ladder_askewhedgetopl1_cloned_askewhedgetopr", "594 1262 -24", "0 -26 0" );
		make_ladder( "_ladder_askewhedgetopl2_cloned_askewhedgetopr", "594 1262 -24", "0 -52 0" );

	}

	// FIX: Prevent various common hops straight to barns roof with a large clip.

	// Doesn't skip an event. Will only patch for Coop if the Community wills so for similar commonhop shortcuts.

	// Survivalists will never exit the barns to touch this trigger; thus don't spawn the clip.

	if ( g_BaseMode != "coop" && g_BaseMode != "realism" && g_BaseMode != "survival" )
	{
		con_comment( "TRIG:\tAnti-shortcut \"_barnsroof_trigonce\" deletes clip at barns exit." );

		make_clip( "_barnsroof_commonhop", "Survivors", 1, "-1070 -8 -208", "1070 16 844", "-1312 256 180" );

		SpawnEntityFromTable( "trigger_once",
		{
			targetname	= g_UpdateName + "_barnsroof_trigonce",
			StartDisabled	= 0,
			spawnflags	= 1,
			filtername	= "anv_globalfixes_filter_survivor",
			origin		= Vector( -260, -32, -192 )
		} );

		EntFire( g_UpdateName + "_barnsroof_trigonce", "AddOutput", "mins -4 -32 0" );
		EntFire( g_UpdateName + "_barnsroof_trigonce", "AddOutput", "maxs 4 32 112" );
		EntFire( g_UpdateName + "_barnsroof_trigonce", "AddOutput", "solid 2" );

		EntFire( g_UpdateName + "_barnsroof_trigonce", "AddOutput", "OnStartTouch " + g_UpdateName + "_barnsroof_commonhop:Kill::0:-1" );
	}

	if ( HasPlayerControlledZombies() )
	{
		kill_funcinfclip( 736.871 );
		make_atomizer( "_atomizer_anv_haybail", "-960 -404 -184", "models/props_unique/haybails_single.mdl", 60 );
		make_brush( "_losfix_barn_gen",		"-1 -28 -8",	"1 28 8",	"-1742 346 -185" );
		make_brush( "_losfix_drop_trailer",	"-48 -1 -8",	"48 1 8",	"-2423 4 -185" );
		make_brush( "_losfix_start_trailer1a",	"-102 -1 -8",	"102 1 8",	"2347 3295 -185" );
		make_brush( "_losfix_start_trailer1b",	"-1 -40 -8",	"1 40 8",	"2244 3333 -185" );
		make_brush( "_losfix_start_trailer2",	"-102 -1 -8",	"102 1 8",	"2814 2614 -185" );
		make_clip( "_eventfence_wrongway", "SI Players", 1, "-800 -20 -608", "200 676 672", "-200 2652 352" );
		make_clip( "_eventrooftop_smoother1", "SI Players", 1, "-343 0 0", "249 140 8", "-3305 1312 195", "0 0 -44" );
		make_clip( "_eventrooftop_smoother2", "SI Players", 1, "-249 140 0", "343 0 8", "-3305 1312 195", "0 180 -44" );
		make_clip( "_ladder_askewhedgeshared_clip", "SI Players and AI", 1, "-3 -279 -7", "3 245 79", "593 1177 -63" );
		make_clip( "_ladder_barnoverhang_clip", "Survivors", 1, "-24 -4 -10", "24 4 188", "-731 56 -86" );
		make_clip( "_ladder_barnsarearight_clip", "Everyone", 1, "1 -232 0", "2 16 85", "263 2288 -192" );
		make_clip( "_ladder_startroof_clip", "Everyone", 1, "-16 -17 -5", "16 20 175", "3362.5 3216 -187" );
		make_clip( "_ladder_startfoodcart_clip", "Everyone", 1, "-2 -8 0", "2 8 124", "2450 3348 -192", "0 -45 0" );
		make_ladder( "_ladder_askewhedgebotr1_cloned_askewhedgebotl", "610 1209.88 -123.984", "0 26 0" );
		make_ladder( "_ladder_askewhedgebotr2_cloned_askewhedgebotl", "610 1209.88 -123.984", "0 52 0" );
		make_ladder( "_ladder_askewhedgetopl1_cloned_askewhedgetopr", "594 1262 -24", "0 -26 0" );
		make_ladder( "_ladder_askewhedgetopl2_cloned_askewhedgetopr", "594 1262 -24", "0 -52 0" );
		make_ladder( "_ladder_barnsarearight_cloned_barnsarealeft", "112 1526 -149", "1789 2124 -1.46", "0 90 0", "1 0 0" );
		make_ladder( "_ladder_barnoverhang_cloned_starttrailer", "3645 1907 -130.5", "-4376 -1852 97" );
		make_ladder( "_ladder_bumperhedgeleft_cloned_meatburgerhedge", "252 944 -132", "304 393 0" );
		make_ladder( "_ladder_bumperhedgeright_cloned_meatburgerhedge", "252 944 -132", "304 359 0" );
		make_ladder( "_ladder_cornerfence_cloned_fencebackalley", "864 2441 -124", "1274 4780 0", "0 -180 0", "0 -1 0" );
		make_ladder( "_ladder_eventcedabanner1_cloned_askewhedgetopr", "594 1262 -24", "-4035 -398 71" );
		make_ladder( "_ladder_eventcedabanner2_cloned_askewhedgetopr", "594 1262 -24", "-4035 -366 71" );
		make_ladder( "_ladder_eventcedabanner3_cloned_askewhedgetopr", "594 1262 -24", "-4035 -334 71" );
		make_ladder( "_ladder_eventendfencefront_cloned_endfenceback", "-144 2458 -188", "-265 4900 0", "0 -180 0", "0 -1 0" );
		make_ladder( "_ladder_eventwallfence_cloned_peachpitwall", "-3056 1726 -168", "-4165 -2040 -26", "0 -90 0", "-1 0 0" );
		make_ladder( "_ladder_finalrun1_cloned_hotdogstand", "2396 636 -124", "-3242 1088 -63" );
		make_ladder( "_ladder_finalrun2_cloned_bumpsidemid", "1462 2296 -124", "-1685.4 -518 -71" );
		make_ladder( "_ladder_lightapplesfront_cloned_lightapplesback", "-208 856 -120", "-450 1712 0", "0 -180 0", "-1 0 0" );
		make_ladder( "_ladder_lightticketsbackB_cloned_lightapplesback", "-208 856 -120", "-3019 681 0", "0 -90 0", "0 -1 0" );
		make_ladder( "_ladder_lightticketsbackT_cloned_lightapplesback", "-208 856 -120", "-3019 681 128", "0 -90 0", "0 -1 0" );
		make_ladder( "_ladder_lightticketsfrontB_cloned_lightapplesback", "-208 856 -120", "-1307 1127 0", "0 90 0", "0 1 0" );
		make_ladder( "_ladder_lightticketsfrontT_cloned_lightapplesback", "-208 856 -120", "-1307 1127 128", "0 90 0", "0 1 0" );
		make_ladder( "_ladder_redtentmid_cloned_redtentstart", "2848 2074 -140", "-3787.5 -1225.5 1" );
		make_ladder( "_ladder_startfoodcart_cloned_bumpsidemid", "1462 2296 -124", "992 1073 -13" );
		make_ladder( "_ladder_starthedge_cloned_startfence", "2384 2462 -124", "-295 84 -7" );
		make_ladder( "_ladder_startroof_cloned_elecbox", "1907 894 -64", "1455.5 2307 -68" );
		make_prop( "dynamic", "_barn_overhang_floor", "models/props_update/c2m4_barn_overhang.mdl", "-608 162 28", "0 90 0", "shadow_no" );
		make_prop( "dynamic", "_barn_overhang_ladder", "models/props_c17/metalladder001.mdl", "-731 57 32", "0 270 180", "shadow_no" );
		make_prop( "dynamic", "_barn_overhang_laddercover", "models/props_highway/plywood_01.mdl", "-707 53.9 -97", "90 90 0", "shadow_no" );
		make_prop( "dynamic", "_barn_overhang_haybaila", "models/props_unique/haybails_single.mdl", "-499 111 31", "0 180 0", "shadow_no" );
		make_prop( "dynamic", "_barn_overhang_haybailb", "models/props_unique/haybails_single.mdl", "-528 111 75", "0 180 0", "shadow_no" );
		make_prop( "dynamic", "_barn_overhang_haybailc", "models/props_unique/haybails_single.mdl", "-556 111 31", "0 180 0", "shadow_no" );
		make_prop( "dynamic", "_barn_overhang_haybaild", "models/props_unique/haybails_single.mdl", "-690 215 75", "0 180 0", "shadow_no" );
		make_prop( "dynamic", "_barn_overhang_haybaile", "models/props_unique/haybails_single.mdl", "-661 215 31", "0 180 0", "shadow_no" );
		make_prop( "dynamic", "_barn_overhang_haybailf", "models/props_unique/haybails_single.mdl", "-718 215 31", "0 180 0", "shadow_no" );
		make_prop( "dynamic", "_cosmetic_barn_ladder", "models/props_c17/metalladder001.mdl", "-665 -55 -189.2", "-90 300 0", "shadow_no", "solid_no" );
		make_prop( "dynamic", "_cosmetic_fencea", "models/props_urban/fence_cover001_256.mdl", "896 2824 -192", "0 90 0", "shadow_no" );
		make_prop( "dynamic", "_cosmetic_fenceb", "models/props_urban/fence_cover001_256.mdl", "384 2818.3 -192", "0 90 0", "shadow_no" );
		make_prop( "dynamic", "_endfence_wrongwaya", "models/props_misc/wrongway_sign01_optimized.mdl", "-276 2636 -195", "0 -90 0", "shadow_no", "solid_no", "255 255 255", "17", "217" );
		make_prop( "dynamic", "_endfence_wrongwayb", "models/props_misc/wrongway_sign01_optimized.mdl", "-132 2636 -195", "0 -90 0", "shadow_no", "solid_no", "255 255 255", "17", "217" );
		make_prop( "dynamic",		"_propladder_garbagecan",	"models/props_urban/garbage_can002.mdl",	"-2284 1028 -191",		"0 89.5 0",		"shadow_no" );
		make_prop( "dynamic", "_ladder_startroof_pipe", "models/props_rooftop/Gutter_Pipe_256.mdl", "3362 3216 -4.1", "0 0 0", "shadow_no" );
		make_prop( "dynamic", "_ladderpatch_awningfence1", "models/props_fortifications/police_barrier001_128_reference.mdl", "-635 2035 -192", "0 -45 90", "shadow_no" );
		make_prop( "dynamic", "_ladderpatch_awningfence2", "models/props_fortifications/police_barrier001_128_reference.mdl", "-728 1969 -244", "104 -52 0", "shadow_no", "solid_no" );
		make_prop( "dynamic", "_startfoodcart_wrongwaya", "models/props_misc/wrongway_sign01_optimized.mdl", "2125 3970 -130", "0 -90 0", "shadow_no", "solid_no", "255 255 255", "17", "217" );
		make_prop( "dynamic", "_startfoodcart_wrongwayb", "models/props_misc/wrongway_sign01_optimized.mdl", "2325 3970 -130", "0 -90 0", "shadow_no", "solid_no", "255 255 255", "17", "217" );
		make_prop( "dynamic", "_startfoodcart_wrongwayc", "models/props_misc/wrongway_sign01_optimized.mdl", "1966 3938 -130", "0 0 0", "shadow_no", "solid_no", "255 255 255", "17", "217" );
		make_prop( "physics",		"_barn_middleroom_hittable",	"models/props_unique/haybails_single.mdl",	"-1103 191 -147.42",		"0 0 -92", "shadow_no" );
		make_prop( "physics", "_hittable_bumpera", "models/props_fairgrounds/bumpercar.mdl", "3329 3280 -186", "0 338 0" );
		make_prop( "physics", "_hittable_bumperb", "models/props_fairgrounds/bumpercar.mdl", "3254 3293 -159", "-1 178 106" );
		patch_ladder( "-666 2044 -192", "11 -29 0" );
		patch_ladder( "1907 894 -64", "-40 -5 0" );

		EntFire( g_UpdateName + "_ladderpatch_awningfence*", "Skin", 1 );
	}
}