g_Chapter = "BLOOD HARVEST - THE BRIDGE";

devchap( "ALL MODES" );

PrecacheModel( "models/props_foliage/cedar_large01.mdl" );
PrecacheModel( "models/props_wasteland/rock_moss04.mdl" );
PrecacheModel( "models/props_misc/wrongway_sign01_optimized.mdl" );

function DoRoundFixes()
{
	make_clip( "_dispcrouch_preslope", "Everyone", 1, "-64 -128 -64", "64 256 88", "3090 -10118 -23", "20 0 0" );
	make_clip( "_dispcrouch_trains", "Everyone", 1, "-500 -50 -169", "500 50 169", "4120 -14380 88", "0 6 0" );
	make_clip( "_dispcrouch_eventlever", "Everyone", 1, "-412 -8 -61", "380 42 120", "8302 -13946 21", "0 -149 0" );
	make_clip( "_dispcrouch_recompilefail", "Everyone", 1, "-620 -17 0", "620 17 70", "5930 -14086 -70", "0 3 0" );
	make_clip( "_permstuck_eventlever", "Everyone", 1, "-17 -17 -17", "17 17 17", "8150 -13811 57" );
	make_clip( "_nav_bridgecollapsea", "Survivors", 1, "-9 -10 0", "19 19 310", "5854 -12656 -41.3", "5 0 0" );
	make_clip( "_nav_bridgecollapseb", "Survivors", 1, "-9 -10 0", "19 19 310", "6000 -12656 -41.3", "-5 0 0" );
	make_clip( "_stuckwarp_endtunnel", "Everyone", 1, "-18 -60 0", "48 68 84", "968 -12932 20" );
	make_clip( "_permstuck_shedtree", "Everyone", 1, "-14 -14 -164", "14 14 1640", "3085 -14120 88" );
	make_clip( "_permstuck_terribadcliff", "Everyone", 1, "-68 -1 0", "68 46 148", "7317 -11487 451" );

	con_comment( "MOVER:\tClip \"_bridge_dynamic_clip\" simulated to move when bridge collapses." );

	make_clip( "_bridge_dynamic_clip", "Survivors", 1, "-69 -926 0", "69 6 1450", "5932 -13314 272" );
	EntFire( "train_engine_button", "AddOutput", "OnPressed " + g_UpdateName + "_bridge_dynamic_clip:AddOutput:origin 5932 -13784 272:0:-1" );

	if ( g_BaseMode == "coop" || g_BaseMode == "realism" )
	{
		devchap( "BASE COOP" );

		// FIXES

		patch_spawninfront( "7136 -11876 394", "0 -164 -24", "800 4 134" );
	}

	if ( g_BaseMode == "versus" )
	{
		devchap( "BASE VERSUS" );

		// FIXES

		patch_spawninfront( "7136 -11876 394", "0 -164 -24", "800 4 134" );
	}

	if ( g_BaseMode == "survival" )
	{
		devchap( "BASE SURVIVAL" );

		// FIXES

		make_clip( "_booster_sandtower", "Survivors", 1, "-106 -78 0", "82 75 1162", "4911 -13119 568" );
		make_clip( "_missing_tree_1", "Survivors", 1, "-23 -23 0", "23 23 1302", "2678 -13830 418" );
		make_clip( "_missing_tree_2", "Survivors", 1, "-23 -23 0", "23 23 1302", "3066 -14082 418" );
		make_clip( "_missing_tree_3", "Survivors", 1, "-23 -23 0", "23 23 1302", "4214 -12710 418" );
		make_clip( "_missing_tree_4", "Survivors", 1, "-23 -23 0", "23 23 1302", "3730 -14198 418" );
	}

	if ( HasPlayerControlledZombies() )
	{
		kill_funcinfclip( 2553.75 );		// Delete clips all around start area
		kill_funcinfclip( 3752.27 );		// Delete clips all around end area
		make_clip( "_ladder_generatorhouse_clip", "Everyone", 1, "-3 -37 0", "13 43 140", "6531 -13083 -58" );
		make_clip( "_ladder_newtankperch_clip", "SI Players", 1, "-38 -16 0", "38 128 32", "3465 -10222 158", "0 3 30" );
		make_clip( "_ladder_pinkstairwell_clip", "Survivors", 1, "-156 -3 0", "156 0 124", "1740 -12296 260" );
		make_clip( "_ladder_rightquickcliff_clip", "SI Players", 1, "-32 -21 0", "32 21 17", "2032 -10510 232", "15 4 0" );
		make_clip( "_ladder_rightquickcliff_rock", "SI Players", 1, "-20 -26 0", "56 26 8", "2101 -10514 17", "25 0 0" );
		make_clip( "_ladder_startventshaft_clipleft", "Everyone", 1, "-10 -12 0", "0 0 233", "-1030 -10911 -32", "0 -47 0" );
		make_clip( "_ladder_startventshaft_clipright", "Everyone", 1, "-10 -12 0", "0 0 233", "-1005 -10903 -32", "0 47 0" );
		make_clip( "_meticulous_funcinfclip01", "SI Players", 1, "-17 -515 -216", "150 721 1408", "-688 -10708 321" );
		make_clip( "_meticulous_funcinfclip02", "SI Players", 1, "-1000 -120 -170", "1150 17 1408", "262 -11524 321", "0 -21 0" );
		make_clip( "_meticulous_funcinfclip03", "SI Players", 1, "-340 -238 0", "57 260 1408", "1323 -12178 321" );
		make_clip( "_meticulous_funcinfclip04", "SI Players", 1, "-310 -420 159", "724 17 1408", "1616 -12255 321" );
		make_clip( "_meticulous_funcinfclip05", "SI Players", 1, "-1000 -310 -170", "850 187 1408", "262 -11524 321" );
		make_clip( "_meticulous_funcinfclip06", "SI Players", 1, "-235 -165 64", "525 260 1408", "2560 -12100 321" );
		make_clip( "_meticulous_funcinfclip07", "SI Players", 1, "-48 -555 -216", "180 1414 1408", "3276 -11409 321", "0 -24 0" );
		make_clip( "_meticulous_funcinfclip08", "SI Players", 1, "-34 -120 -216", "260 700 1408", "3821 -10047 321", "0 24 0" );
		make_clip( "_meticulous_funcinfclip09", "SI Players", 1, "-1600 -30 -216", "1600 70 1408", "1980 -9420 321" );
		make_clip( "_meticulous_funcinfclip10", "SI Players", 1, "-600 -70 -216", "600 170 1408", "-132 -9696 321", "0 27 0" );
		make_clip( "_meticulous_funcinfclip11", "SI Players", 1, "-17 -555 -55", "17 1414 1408", "2361 -13935 321" );
		make_clip( "_meticulous_funcinfclip12", "SI Players", 1, "-3000 -410 -216", "3000 17 1408", "5344 -14507 321" );
		make_clip( "_meticulous_funcinfclip13", "SI Players", 1, "-800 -170 -216", "500 17 1408", "9070 -14172 321", "0 25 0" );
		make_clip( "_meticulous_funcinfclip14", "SI Players", 1, "-17 -761 -420", "17 1248 1408", "9216 -13284 321", "0 25 0" );
		make_clip( "_meticulous_funcinfclip15", "SI Players", 1, "-320 -17 -216", "216 17 1408", "8456 -12150 321" );
		make_clip( "_meticulous_funcinfclip16", "SI Players", 1, "-17 -170 -216", "17 610 1408", "8153 -11970 321" );
		make_clip( "_meticulous_funcinfclip17", "SI Players", 1, "-78 -17 -216", "216 17 1408", "7954 -11343 321" );
		make_clip( "_meticulous_funcinfclip18", "SI Players", 1, "-128 -17 360", "216 17 1408", "7660 -11343 321" );
		make_clip( "_meticulous_funcinfclip19", "SI Players", 1, "-300 -17 -216", "1173 17 1408", "6359 -11309 321" );
		make_clip( "_meticulous_funcinfclip20", "SI Players", 1, "-300 -21 -216", "1173 17 1408", "4998 -11810 321", "0 25 0" );
		make_clip( "_meticulous_funcinfclip21", "SI Players", 1, "-711 -17 -216", "1717 17 1408", "3060 -12382 321", "0 15 0" );
		make_clip( "_tunneltophill_wrongway_clip", "SI Players", 1, "-2 -128 -110", "100 290 1070", "3320 -12528 658" );
		make_ladder( "_ladder_backtrains_cloned_midmound", "2438 -9808 60", "15702 -5728 -39", "0 -58.35 0", "0.53 -0.85 0" );
		make_ladder( "_ladder_barnhousefront_cloned_treetrunkcliff", "982 -10596 116", "11972 -7767 -89", "0 -59.54 0", "-0.5 0.87 0" );
		make_ladder( "_ladder_generatorhouse_cloned_doublerbottom", "-179.799 -10591.8 4", "14106 -5707 -673", "3.5 -45 -3.5", "1 0 0" );
		make_ladder( "_ladder_leftcliffmini_cloned_startcliff", "982 -10596 116", "1185 669 -45", "4 0 0" );
		make_ladder( "_ladder_lobsterrock_cloned_startcliff", "982 -10596 116", "11923 -11336 785", "32 -95 0", "0.09 1 0" );
		make_ladder( "_ladder_newtankperchB_cloned_midmound", "2438 -9808 60", "13151 -7359 -26", "0 -87.35 0", "0 -1 0" );
		make_ladder( "_ladder_newtankperchT_cloned_midmound", "2438 -9808 60", "13151 -7359 70", "0 -87.35 0", "0 -1 0" );
		make_ladder( "_ladder_peskyrooftopB_cloned_midmound", "2438 -9808 60", "-8232 -14251 232", "0 90 0", "0 1 0" );
		make_ladder( "_ladder_peskyrooftopT_cloned_midmound", "2438 -9808 60", "-8232 -14359 360", "0 90 0", "0 1 0" );
		make_ladder( "_ladder_rightquickcliff_cloned_trainshedpipe", "3630.5747 -14189.8496 37.2963", "-12203 -7403 -900", "0 63.31 -4", "1 0.06 0" );
		make_ladder( "_ladder_startventshaft_cloned_treetrunkcliff", "982 -10596 116", "-11617 -11894 -32", "0 90 0", "0 -1 0" );
		make_ladder( "_ladder_tunnelexittop1_cloned_midmound", "2438 -9808 60", "181 -3603 -64", "0 0 0", "1 0 0" );
		make_ladder( "_ladder_tunnelexittop2_cloned_midmound", "2438 -9808 60", "181 -3603 32", "0 0 0", "1 0 0" );
		make_ladder( "_ladder_tunnelexittop3_cloned_midmound", "2438 -9808 60", "181 -3603 128", "0 0 0", "1 0 0" );
		make_ladder( "_ladder_tunnelexittop4_cloned_midmound", "2438 -9808 60", "181 -3603 224", "0 0 0", "1 0 0" );
		make_ladder( "_ladder_tunnelexittop5_cloned_midmound", "2438 -9808 60", "181 -3603 320", "0 0 0", "1 0 0" );
		make_prop( "dynamic", "_cosmetic_starthillside_treea", "models/props_foliage/cedar_large01.mdl", "3643 -9364 245", "0 265 0", "shadow_no", "solid_no" );
		make_prop( "dynamic", "_cosmetic_starthillside_treeb", "models/props_foliage/cedar_large01.mdl", "1166 -12035 527", "0 58 0", "shadow_no", "solid_no" );
		make_prop( "dynamic", "_cosmetic_starthillside_treec", "models/props_foliage/cedar_large01.mdl", "1048 -11800 504", "0 52 0", "shadow_no", "solid_no" );
		make_prop( "dynamic", "_cosmetic_starthillside_rock", "models/props_wasteland/rock_moss04.mdl", "3760 -10536 264", "0 42 0", "shadow_no", "solid_no" );
		make_prop( "dynamic", "_losblocker_finalfence", "models/props_wasteland/rock_moss04.mdl", "5510 -12032 444", "0 216 0", "shadow_no" );
		make_prop( "dynamic", "_peskyrooftop_wrongwaya", "models/props_misc/wrongway_sign01_optimized.mdl", "1882 -12238 540", "0 90 0", "shadow_no", "solid_no", "255 255 255", "17", "217" );
		make_prop( "dynamic", "_peskyrooftop_wrongwayb", "models/props_misc/wrongway_sign01_optimized.mdl", "1648 -12238 540", "0 90 0", "shadow_no", "solid_no", "255 255 255", "17", "217" );
		make_prop( "dynamic", "_peskyrooftop_leftside_wrongway", "models/props_misc/wrongway_sign01_optimized.mdl", "2320 -11900 520", "0 180 0", "shadow_no", "solid_no", "255 255 255", "17", "217" );
		make_prop( "dynamic", "_peskyrooftop_rightside_wrongwaya", "models/props_misc/wrongway_sign01_optimized.mdl", "1116 -11423 565", "0 0 0", "shadow_no", "solid_no", "255 255 255", "17", "217" );
		make_prop( "dynamic", "_peskyrooftop_rightside_wrongwayb", "models/props_misc/wrongway_sign01_optimized.mdl", "1116 -11660 565", "0 0 0", "shadow_no", "solid_no", "255 255 255", "17", "217" );
		make_prop( "dynamic", "_redbrushclip_wrongwaya1", "models/props_misc/wrongway_sign01_optimized.mdl", "5412 -12008 545", "0 0 0", "shadow_no", "solid_no", "255 255 255", "17", "217" );
		make_prop( "dynamic", "_redbrushclip_wrongwaya2", "models/props_misc/wrongway_sign01_optimized.mdl", "5412 -12008 545", "0 180 0", "shadow_no", "solid_no", "255 255 255", "17", "217" );
		make_prop( "dynamic", "_redbrushclip_wrongwayb1", "models/props_misc/wrongway_sign01_optimized.mdl", "5412 -12295 455", "0 0 0", "shadow_no", "solid_no", "255 255 255", "17", "217" );
		make_prop( "dynamic", "_redbrushclip_wrongwayb2", "models/props_misc/wrongway_sign01_optimized.mdl", "5412 -12295 455", "0 180 0", "shadow_no", "solid_no", "255 255 255", "17", "217" );
		make_prop( "dynamic", "_tunneltopcliff_wrongwaya", "models/props_misc/wrongway_sign01_optimized.mdl", "3330 -12400 825", "0 180 0", "shadow_no", "solid_no", "255 255 255", "17", "217" );
		make_prop( "dynamic", "_tunneltopcliff_wrongwayb", "models/props_misc/wrongway_sign01_optimized.mdl", "3330 -12590 730", "0 180 0", "shadow_no", "solid_no", "255 255 255", "17", "217" );
		make_prop( "dynamic", "_tunneltopcliff_wrongwayc", "models/props_misc/wrongway_sign01_optimized.mdl", "3390 -12400 820", "0 0 0", "shadow_no", "solid_no", "255 255 255", "17", "217" );
		make_prop( "dynamic", "_tunneltopcliff_wrongwayd", "models/props_misc/wrongway_sign01_optimized.mdl", "3390 -12590 730", "0 0 0", "shadow_no", "solid_no", "255 255 255", "17", "217" );
	}

	// Resolve stuck Tank spawns for Versus Survival & Taaannnk! Mutation.

	if ( g_MutaMode == "mutation15" || g_MutaMode == "mutation19" )
	{
		// Delete 1 wrongway clip. May not be necessary for Survival
		// but too close to call; delete for it and Taaannnk! to be safe.

		kill_funcinfclip( 311.003 );	// Wrongway at end of train tunnel
	}
}