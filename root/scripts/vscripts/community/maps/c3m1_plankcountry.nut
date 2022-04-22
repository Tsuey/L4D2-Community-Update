g_Chapter = "SWAMP FEVER - PLANK COUNTRY";

devchap( "ALL MODES" );

PrecacheModel( "models/props_fairgrounds/alligator.mdl" );
PrecacheModel( "models/props_foliage/swamp_shrubwall_512_deep.mdl" );
PrecacheModel( "models/props_swamp/plank001b_192.mdl" );
PrecacheModel( "models/props_foliage/old_tree01.mdl" );
PrecacheModel( "models/props_misc/wrongway_sign01_optimized.mdl" );
PrecacheModel( "models/props_foliage/swamp_shrubwall_block_128_deep.mdl" );
PrecacheModel( "models/props_urban/fence_cover001_256.mdl" );
PrecacheModel( "models/props_urban/fence_cover001_64.mdl" );
PrecacheModel( "models/props_docks/dock02_pole02a.mdl" );
PrecacheModel( "models/props_urban/porch_light003.mdl" );
PrecacheModel( "models/props_urban/boat002.mdl" );
PrecacheModel( "models/props/cs_office/shelves_metal.mdl" );

function DoRoundFixes()
{
	make_clip( "_hedge_behindtrains_a",	"Survivors",	1,	"-56 -520 -356",		"56 520 356",		"-10713 7656 668" );
	make_clip( "_hedge_behindtrains_b",	"Survivors",	1,	"-431 -75 -356",		"431 75 356",		"-10237 8186 668" );
	make_clip( "_hedge_behindtrains_c",	"Survivors",	1,	"-50.5 -174 -362",		"50.5 174 362",		"-9756.5 8114 662" );
	make_clip( "_hedge_behindtrains_d",	"Survivors",	1,	"-41 -394 -362",		"41 394 362",		"-9767 7546 662" );
	make_clip( "_commonhop_crossing",		"Survivors",	1,	"-99 -260 0",		"99 426 691",		"-1025 4859 332" );
	make_clip( "_clipgap_fence",		"Survivors",	1,	"-4 -68 -376",		"4 68 376",		"-11100 7188 648" );
	make_clip( "_permstuck_coolingtank",	"Everyone",	1,	"-62 -58 -56",		"21 21 56",		"-10754 8610 216" );
	make_clip( "_commonhop_coolingtank", "Survivors", 1, "-74 -236 0", "70 156 880", "-6806 7572 144" );
	make_clip( "_booster_treetop", "Survivors", 1, "-108 -186 0", "108 174 717", "-5696 7348 247" );
	make_clip( "_chargerassist_trainwheel", "Survivors", 1, "-133 -444 -130", "28 131 765", "-12379 8416 259", "0 -19 0" );
	make_clip( "_chargerassist_fenceladdy", "Survivors", 1, "-94 0 -41", "88 11 952", "-6248 5650 72" );
	make_clip( "_cliprework_garage", "Survivors", 1, "-558 -274 0", "483 270 536", "-11106 10498 488" );
	make_clip( "_cliprework_house", "Survivors", 1, "-259 -526 0", "257 530 704", "-11343 7758 320" );
	make_clip( "_fallenlog_shrub_survivor", "Survivors", 1, "-182 -383 -99", "27 142 941", "560 9614 83", "0 19 0" );
	make_clip( "_fallenlog_shrub_infected", "SI Players and AI", 1, "-182 -383 -99", "27 142 61", "560 9614 83", "0 19 0" );
	make_clip( "_chargerassist_commonhop1", "Survivors", 1, "-155 -16 0", "117 5 864", "-7093 6280 160" );
	make_clip( "_chargerassist_commonhop2", "Survivors", 1, "-49 -170 0", "63 134 864", "-7093 6452 160", "0 -3 0" );
	make_clip( "_booster_powerpole", "Survivors", 1, "-9 -8 0", "9 10 582", "-7630 6718 444" );
	make_clip( "_commentary_booster_crumpstore_a", "Survivors", 1, "-148 -336 -352", "148 336 352", "-6332 6536 672" );
	make_clip( "_commentary_booster_crumpstore_b", "Survivors", 1, "-43 -147 -352", "43 147 352", "-6523 6352 672" );
	make_clip( "_commentary_dockprops_poleclip", "Survivors", 1, "-16 -16 -8", "20 20 324", "-5379 6768 -26" );
	make_clip( "_commentary_dockprops_shelfclip", "Everyone", 1, "-3 -2 -8", "3 2 80", "-5346 6795 -56" );
	make_clip( "_commentary_dock_ledge", "Everyone", 1, "-8 -17 -46", "8 17 46", "-5374 5998 -18")
	make_prop( "dynamic", "_commentary_dockprops_pole", "models/props_docks/dock02_pole02a.mdl", "-5381.1 6767.52 89.1467", "0 0 0", "shadow_no", "solid_yes", "255 255 255", "1800", "2000" );
	make_prop( "dynamic", "_commentary_dockprops_light", "models/props_urban/porch_light003.mdl", "-5380 6775 277.271", "0 270 0", "shadow_no", "solid_no", "255 255 255", "1000", "1200" );
	make_prop( "dynamic", "_commentary_dockprops_boat", "models/props_urban/boat002.mdl", "-5411.46 6783.37 88.6317", "61.9321 199.129 4.5769", "shadow_no", "solid_yes", "255 255 255", "1700", "1900" );
	make_prop( "dynamic", "_commentary_dockprops_shelf", "models/props/cs_office/shelves_metal.mdl", "-5274 6819 40", "-87.3817 282.627 73.4003", "shadow_no", "solid_yes", "255 255 255", "800", "1000" );
	patch_ladder( "-6084.5 6272 90", "6 0 0" );

	// Tsuey's note: Special thanks to the person who originally complained
	// on the Steam Forums that there weren't any gators -- I'm unable to
	// re-find your thread. Special thanks to Rise for naming him Fred; we
	// can't spell Friend without it. Left4Facts Discord btw. :fred:

	make_prop( "dynamic", "_fred", "models/props_fairgrounds/alligator.mdl", "-5274 7386 -19", "0 150 0", "shadow_no", "solid_no" );

	// Allow only SI Players to stand on it while maintaining its non-solidity
	// because it'd be inhumane for Survivors to put bullet holes on him. Also
	// prevents Fred from becoming a godspot.

	make_clip( "_fred_collision", "SI Players", 1, "-3.6 -17 0", "3.6 16 3", "-5274 7386 -17", "0 150 0" );

	// Incrementally "bites" both Spawned and Ghost SI. Doesn't damage Survivors
	// but it's difficult to even reach it without hanging and we dare not move
	// him. Does 120 DPS, 60 per hit, or something. It's a trigger_hurt_ghost.

	make_trighurt( "_fred_pain_cuddles", "Ghost", "-4 -4 -4", "4 4 4", "-5280 7375 -12" );
	EntFire( g_UpdateName + "_fred_pain_cuddles", "SetDamage", 120 );

	if ( g_BaseMode == "versus" )
	{
		devchap( "BASE VERSUS" );

		// FIXES

		make_clip(	"_cliprework_jonesroof",	"Survivors",	1,	"-276 -296 -396",	"276 296 396",		"-8304 7216 628" );

	}
	if ( g_BaseMode == "survival" )
	{
		devchap( "BASE SURVIVAL" );

		// FIXES

		make_clip( "_survivalcrit_bayouboost", "Survivors", 1, "-64 -351 0", "-2 321 1045", "-4358 6079 -21" );
		make_clip( "_survival_brushextenda", "Survivors", 1, "-674 -60 0", "400 160 717", "-7967 7806 308" );
		make_clip( "_survival_brushextendb", "Survivors", 1, "-224 4 0", "236 594 717", "-8832 7232 336" );
		make_clip( "_survival_brushextendc", "Survivors", 1, "-289 -16 0", "439 20 717", "-9471 7496 384" );
		make_clip( "_nav_pubsign", "Survivors", 1, "-4 -34 0", "4 31 822", "-7264 7167 202" );
		make_clip( "_nav_trailertree", "Survivors", 1, "-48 -26 0", "78 36 742", "-7742 7721 287" );

	}

	if ( HasPlayerControlledZombies() )
	{
		kill_funcinfclip( 1167.82 );		// UNDESIRABLY delete (matching value) unrelated clip but re-make exactly
		EntFire( "worldspawn", "RunScriptCode", "kill_funcinfclip( 1167.82 )", 1 );		// Delete clip to left above end trains
		kill_funcinfclip( 405.151 );		// Delete clip above middle of end trains
		kill_funcinfclip( 699.27 );		// Delete clip to right above end trains
		make_axiswarp( "_axiswarp_startspawn", "x+", 64, "0 -2020 0", "1 2000 128", "-13026 9199 191" );
		make_brush( "_losfix_start_fence1",	"-32 -1 -5",	"32 1 5",	"-10968 9586 164" );
		make_brush( "_losfix_start_fence2",	"-128 -1 -5",	"128 1 5",	"-11264 9665 164" );
		make_brush( "_losfix_start_gen1",	"-1 -28 -8",	"1 28 8",	"-11817 9724 175" );
		make_brush( "_losfix_start_gen2",	"-15 -1 -8",	"14 1 8",	"-11801 9723 175" );
		make_brush( "_losfix_start_semi",	"-1 -56 -20",	"1 40 23",	"-11314 9748 181" );
		make_brush( "_losfix_start_train1",	"-230 -2 -12",	"272 2 12",	"-11574 11024 210" );
		make_brush( "_losfix_start_train2a",	"-78 -2 -12",	"78 2 12",	"-12154 10858 210" );
		make_brush( "_losfix_start_train2b",	"-2 -45 -12",	"2 45 12",	"-12075 10905 210" );
		make_brush( "_losfix_start_train3a",	"-4 -30 -12",	"4 62 12",	"-12658 10287 210" );
		make_brush( "_losfix_start_train3b",	"-45 -2 -12",	"45 2 12",	"-12609 10351 210" );
		make_brush( "_losfix_start_train3c",	"-2 -79 -12",	"2 79 12",	"-12566 10432 210" );
		make_brush( "_losfix_start_train3d",	"-2 -79 -12",	"2 79 12",	"-12476 10590 210" );
		make_brush( "_losfix_start_train3e",	"-45 -2 -12",	"45 2 12",	"-12519 10509 210" );
		make_brush( "_losfix_start_train4a",	"-4 -128 -12",	"4 95 12",	"-12725 10059 210" );
		make_brush( "_losfix_start_train4b",	"-4 -95 -12",	"4 139 12",	"-12815 9792 210" );
		make_brush( "_losfix_start_train4c",	"-45 -2 -12",	"45 2 12",	"-12766 9929 210" );
		make_brush( "_losfix_start_train5a",	"-2 -139 -12",	"2 95 12",	"-12844 9464 210" );
		make_brush( "_losfix_start_train5b",	"-45 -2 -12",	"45 2 12",	"-12795 9327 210" );
		make_brush( "_losfix_start_train5c",	"-2 -128 -12",	"2 128 12",	"-12754 9197 210" );
		make_clip( "_ladder_earlsgatorvillage_clip", "Everyone", 1, "-5 -2 0", "2 32 222", "-7462 7696 32" );
		make_clip( "_meticulous_funcinfclip01", "SI Players", 1, "-1053 -17 -123", "1029 17 935", "-484 9840 90" );
		make_clip( "_meticulous_funcinfclip02", "SI Players", 1, "-733 -100 0", "640 8 768", "-2668 416 256" );
		make_clip( "_meticulous_funcinfclip03", "SI Players", 1, "-198 -100 0", "320 16 961", "-3516 543 61", "0 -50 0" );
		make_clip( "_meticulous_funcinfclip04", "SI Players", 1, "-198 -360 0", "1375 16 961", "-1846 433 61", "0 10 0" );
		make_clip( "_starttrains_badredclip", "SI Players", 1, "-64 -36 -24", "64 36 -17", "-12728 9028 216", "0 -48 0" );
		make_ladder( "_ladder_bridgetunnelleft_cloned_shacklegback", "-427 7088 76", "-505 -2151 116" );
		make_ladder( "_ladder_bridgetunnelright_cloned_shacklegfront", "-579 7088 76", "-537 -2151 116" );
		make_ladder( "_ladder_earlsgatorvillage_cloned_goodbuyautoparts", "-11522 8784 286", "4059 -1114 -117" );
		make_ladder( "_ladder_endtrainsB_cloned_boardwalkleg", "-824 6181 74", "-1651 -4774 -2541", "0 0 25" );
		make_ladder( "_ladder_endtrainsT_cloned_boardwalkleg", "-824 6181 74", "-1635 -5533 266" );
		make_ladder( "_ladder_endtrainsback_cloned_boardwalkleg", "-824 6181 74", "-3494 6691 267", "0 -180 0", "0 -1 0" );
		make_ladder( "_ladder_gaschainlinkin_cloned_gaschainlinkout", "-10946 9152 228", "-577 480 0" );
		make_ladder( "_ladder_jonescar_cloned_goodbuyautoparts", "-6496 6202 170", "-14704 13713 -6", "0 180 0", "0 1 0" );
		make_ladder( "_ladder_jonesvines_cloned_railroadgate", "-11658 10272 255.354", "3079 -2960 -120" );
		make_ladder( "_ladder_rightafterchains_cloned_railroadgate", "-11658 10272 255.354", "1539 -1572 -24" );
		make_ladder( "_ladder_startsemirear_cloned_boardwalkhole", "-551 7596 74", "-9373 2500 172" );
		make_ladder( "_ladder_startsemitire_cloned_boardwalkhole", "-551 7596 74", "-15948 4312 173.5", "0 315 0", "0.7 -0.7 0" );
		make_ladder( "_ladder_starttrainfront1_cloned_boardwalkhole", "-6864 6202 110", "-3572.91 13449.39 182", "0 60 0", "0.86 -0.49 0" );
		make_ladder( "_ladder_starttrainfront2_cloned_boardwalkhole", "-551 7596 74", "-11220 2066 213", "0 7.5 0", "0.99 0.13 0" );
		make_ladder( "_ladder_starttrainvalve_cloned_starttrainyellow", "-12837 9094 299.0643", "2575 13964 0", "0 49 0", "-0.5 -0.86 0" );
		make_navblock( "_nav_startshrubwall1", "Everyone", "Apply", "-24 -24 -24", "24 24 24", "-12524 10074 161" );
		make_navblock( "_nav_startshrubwall2", "Everyone", "Apply", "-48 -16 -32", "48 16 32", "-12588 9075 168" );
		make_navblock( "_nav_oldtree1", "Everyone", "Apply", "-24 -16 -32", "24 16 32", "-3447 8260 0" );
		make_navblock( "_nav_oldtree2", "Everyone", "Apply", "-24 -16 -32", "24 16 32", "-4225 8490 0" );
		make_prop( "dynamic", "_cosmetic_shruba",	"models/props_foliage/swamp_shrubwall_512_deep.mdl", "-2695 280 250", "0 90 0", "shadow_no", "solid_no" );
		make_prop( "dynamic", "_cosmetic_shrubb",	"models/props_foliage/swamp_shrubwall_512_deep.mdl", "-3153 295 250", "0 86 0", "shadow_no", "solid_no" );
		make_prop( "dynamic", "_cosmetic_shrubc",	"models/props_foliage/swamp_shrubwall_512_deep.mdl", "-2242 295 250", "0 94 0", "shadow_no", "solid_no" );
		make_prop( "dynamic",		"_propladder_plank",		"models/props_swamp/plank001b_192.mdl",		"-6791 7712 200",		"0 270 -25.5" );
		make_prop( "dynamic", "_losblocker_oldtree1", "models/props_foliage/old_tree01.mdl", "-3447 8298 -12", "0 -2 0", "shadow_no" );
		make_prop( "dynamic", "_losblocker_oldtree2", "models/props_foliage/old_tree01.mdl", "-4212 8550 -12", "0 -2 0", "shadow_no" );
		make_prop( "dynamic", "_endsaferoom_wrongwaya", "models/props_misc/wrongway_sign01_optimized.mdl", "-3415 430 320", "0 0 0", "shadow_no", "solid_no", "255 255 255", "17", "217" );
		make_prop( "dynamic", "_endsaferoom_wrongwayb", "models/props_misc/wrongway_sign01_optimized.mdl", "-3510 535 485", "0 0 0", "shadow_no", "solid_no", "255 255 255", "17", "270" );
		make_prop( "dynamic", "_solidify_startshrubwall1", "models/props_foliage/swamp_shrubwall_block_128_deep.mdl", "-12543.6 10072.5 181.932", "-5 180 3", "shadow_no" );
		make_prop( "dynamic", "_solidify_startshrubwall2", "models/props_foliage/swamp_shrubwall_block_128_deep.mdl", "-12550.2 9119.21 148.872", "0 90 0", "shadow_no" );
		make_prop( "dynamic", "_start_fencea",	"models/props_urban/fence_cover001_256.mdl", "-11265 9665 167.25", "0 270 0", "shadow_no" );
		make_prop( "dynamic", "_start_fenceb",	"models/props_urban/fence_cover001_64.mdl", "-10968 9586.1 167.25", "0 270 0", "shadow_no" );
	}

	// Resolve stuck Tank spawns for Versus Survival & Taaannnk! Mutation.

	if ( g_MutaMode == "mutation15" || g_MutaMode == "mutation19" )
	{
		// Delete all, terrible for stuck spawns. Likely won't allow
		// players under the map, and this makes dozens of unused
		// perimeter ladders accessible preventing tons of permstucks.

		EntFire( "func_playerinfected_clip", "Kill" );
		EntFire( g_UpdateName + "_meticulous_funcinfclip01", "Kill" );

		// Warp players through one-side invisible solid treeline.

		make_axiswarp( "_axiswarp_semitrailer", "y-", 96, "-550 -8 0", "740 8 256", "-9505 10720 155" );
	}
}