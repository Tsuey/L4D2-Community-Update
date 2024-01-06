g_Chapter = "THE PARISH - PARK";

devchap( "ALL MODES" );

PrecacheModel( "models/props_urban/fence_cover001_256.mdl" );
PrecacheModel( "models/props_highway/plywood_02.mdl" );
PrecacheModel( "models/props_swamp/plank001b_192.mdl" );
PrecacheModel( "models/props_highway/plywood_01.mdl" );
PrecacheModel( "models/props_rooftop/hotel_rooftop_equip002.mdl" );
PrecacheModel( "models/props_street/awning_department_store.mdl" );
PrecacheModel( "models/props_misc/wrongway_sign01_optimized.mdl" );
PrecacheModel( "models/props_street/awning_short.mdl" );
PrecacheModel( "models/props_update/c5m2_billboard_nodraw.mdl" );
PrecacheModel( "models/props_urban/chimney007.mdl" );
PrecacheModel( "models/props_junk/dumpster_2.mdl" );

function DoRoundFixes()
{
	make_clip(	"_ladderqol_event",		"SI Players",	1,	"-2.5 -18 -161.5",	"2.5 18 161.5",		"-8446 -5214 -86" );
	make_clip(	"_skybox_shieldb",		"SI Players",	1,	"-145 -212 -77",	"145 212 77",		"-2971 -1264 125" );
	make_clip(	"_skybox_shielda",		"SI Players",	1,	"-240 -60 -20",		"240 60 77",		"-4014 -1296 68.8" );
	make_clip( "_booster_busdepot_extend", "Survivors", 1, "-425 -57 0", "381 85 1504", "-8078 -6407 160" );
	make_clip( "_booster_escapegap", "Survivors", 1, "-73 -66 1420", "8 129 32", "-9436 -5212 184", "0 -59 0" );
	make_clip( "_booster_watchtower_extend", "Survivors", 1, "-65 -76 0", "62 65 1142", "-8161 -5821 529" );
	make_clip( "_cliprework_parkarchway", "Survivors", 1, "-37 -404 -164", "35 402 1484", "-8125 -2207 180" );
	make_clip( "_cliprework_anomalous", "Survivors", 1, "-76 -90 -71", "20 92 86", "-9237 -3866 58" );
	make_clip( "_ghostgrief_and_stuckwarp", "Everyone", 1, "-8 -1246 -21", "18 1106 50", "-10562 -4034 -5" );
	make_clip( "_nav_electricalbox", "Survivors", 1, "-35 -6 0", "24 5 1817", "-6222 -7610 -153" );
	make_clip( "_ladderqol_purpleclip1", "SI Players", 1, "0 -245 -24", "1 308 32", "-9340 -5876 -132" );
	make_clip( "_ladderqol_purpleclip2", "SI Players", 1, "-96 -2 -4", "129 -1 29", "-8096 -5539 -129" );
	make_clip( "_ladderqol_purpleclip3", "SI Players", 1, "-96 -2 -4", "129 -1 29", "-7456 -5539 -129" );
	make_clip( "_permstuck_longbarricade", "Everyone", 1, "-491 -16 0", "54 26 168", "-6390 -8479 -247" );
	make_clip( "_cliprework_missingno", "Survivors", 1, "-164 -272 0", "172 240 1626", "-10092 -5520 48" );
	make_clip( "_commentary_fencegenerator", "Survivors", 1, "-8 -44 -8", "56 8 1672", "-8371 -3338 -8" );
	make_clip( "_commentary_electricalbox", "Survivors", 1, "-4 -8 -8", "6 74 1800", "-7036 -5098 -239" );
	
	make_clip( "_commentary_shortcut_tent", "Survivors", 1, "-65 -65 -20", "65 65 1790", "-6853 -5598 -135.75" );

	if ( g_BaseMode != "coop" && g_BaseMode != "realism" )
	{
		make_clip( "_commentary_shortcut_station", "Survivors", 1, "-1 -1 -1", "64 4 120", "-6752 -6736 -120" );
		patch_ladder( "-9260 -5130 -152", "1 14 0" );
	}
	if ( g_BaseMode == "survival" )
	{
		devchap( "BASE SURVIVAL" );

		// FIXES

		make_clip(	"_nav_eventsign",		"Survivors",	1,	"-4 -10 -908",		"4 10 908",		"-8552 -6310 756" );
	}
	if ( g_BaseMode == "scavenge" )
	{
		devchap( "BASE SCAVENGE" );

		// FIXES

		make_clip( "_safedoor_antighost", "SI Players", 1, "-2 -32 0", "2 32 107", "-3775 -1368 -344" );
	}

	if ( HasPlayerControlledZombies() )
	{
		make_atomizer( "_atomizer_bsp_dumpster", "-9216 -3264 -248", "models/props_junk/dumpster_2.mdl", 60 );
		make_brush( "_losfix_bus",		"-1 -60 -12",	"1 60 12",	"-7268 -7479 -244" );
		make_brush( "_losfix_fence",	"0 -64 -4",	"1 64 5",	"-6583 -5678 -252" );
		make_brush( "_losfix_gen",		"-1 -28 -8",	"1 28 8",	"-9918 -4878.21 -249" );
		make_brush( "_losfix_van",		"-1 -108 -10",	"1 108 10",	"-3360 -1422 -371" );
		make_clip( "_ladder_billboard_clip_a", "SI Players", 1, "-255 -3 -4", "255 3 4", "-9160 -6943 160" );
		make_clip( "_ladder_billboard_clip_b", "SI Players", 1, "-32 -4 -4", "32 4 4", "-9162 -6951 160" );
		make_clip( "_ladder_deadendbalconies_clip", "SI Players", 1, "0 -1 0", "1 1 128", "-8576 -4001 -208" );
		make_clip( "_ladder_endlightpole_clippole", "Everyone", 1, "-15 -9 0", "17 9 446", "-8812 -7872 -249" );
		make_clip( "_ladder_endlightpole_cliptop", "SI Players", 1, "-69 -6 0", "18 3 1", "-8812 -7871 197" );
		make_clip( "_ladder_startorangedrain_clip", "SI Players", 1, "-42 -37 0", "32 21 47", "-3189 -1433 -376", "0 -64 42" );
		make_clip( "_ladderqol_endgutterm1mirr_clip", "Everyone", 1, "-4.09 -13 0", "0 23 338", "-3196 -1079 -376" );
		make_clip( "_commentary_fencegates_a", "Survivors", 1, "0 -8 -8", "6 120 1808", "-8580 -3320 -144" );
		make_clip( "_commentary_fencegates_b", "Survivors", 1, "0 -8 -8", "6 120 1808", "-9217 -3320 -144" );
		make_clip( "_commentary_eventtent", "Survivors", 1, "-64 -64 -899", "64 64 899", "-6853 -5598.37 765" );
		make_ladder( "_ladder_archright_cloned_archleft", "-8110 -2848 -200", "-11 1310 0" );
		make_ladder( "_ladder_billboardleft_cloned_watchtower", "-8000 -5874 -128", "-1178 -1760 -2595", "0 0 -28", "0 -0.88 0.46" );
		make_ladder( "_ladder_billboardright_cloned_watchtower", "-8000 -5874 -128", "-1144 -1760 -2595", "0 0 -28", "0 -0.88 0.46" );
		make_ladder( "_ladder_busroofright_cloned_busroofleft", "-7646 -7052 64", "-16317 -13972 0", "0 180 0", "-1 0 0" );
		make_ladder( "_ladder_busrooftop_cloned_eventladderfence", "-6970 -5824 -188", "-999 -1726 336" );
		make_ladder( "_ladder_deadendbalconies_cloned_busstationphones", "-7477.93 -7051.48 -120", "-1100 3036 40" );
		make_ladder( "_ladder_endbarricadeback_cloned_cedafenceback", "-9543 -5488 -176", "3406 -1959 17" );
		make_ladder( "_ladder_endbarricadefront_cloned_cedafencefront", "-9557 -5536 -176", "3374 -1959 17" );
		make_ladder( "_ladder_endlightpoleB_cloned_startdrainladder", "-3216 -1062 -231", "-5595 -6818 77" );
		make_ladder( "_ladder_endlightpoleT_cloned_startdrainladder", "-3216 -1062 -231", "-5595 -6818 269" );
		make_ladder( "_ladder_endroofsignage_cloned_startgutter", "-3216 -1062 -231", "-6146 -6493 95" );
		make_ladder( "_ladder_eventelecbox_cloned_startdrainladder", "-3216 -1062 -231", "-8095 -1859 136", "0 90 0", "1 0 0" );
		make_ladder( "_ladder_farcorner_cloned_horsehedge", "-6400.001 -3068 -192", "695 -1186 -16" );
		make_ladder( "_ladder_finalrunelecbox_cloned_eventgutter", "-8428 -5206 -76", "82 -3123 13" );
		make_ladder( "_ladder_gazebo1_cloned_archleft", "-8110 -2848 -200", "310 -1010 0" );
		make_ladder( "_ladder_gazebowall_cloned_archleft", "-8110 -2848 -200", "566 -1275 16" );
		make_ladder( "_ladder_generatortent_cloned_archleft", "-8110 -2848 -200", "-16249 -6496 0", "0 -180 0", "-1 0 0" );
		make_ladder( "_ladder_guardtowerhigh_cloned_cedatrailerfence", "-9557 -5536 -176", "-404 100 253" );
		make_ladder( "_ladder_guardtowerlow_cloned_restrictedbarricade", "-9544 -5266 -128", "-580 -15 48" );
		make_ladder( "_ladder_hmmwvawning_cloned_cedatrailerfence", "-9557 -5536 -176", "2974 281 -14" );
		make_ladder( "_ladder_longempty_cloned_archleft", "-8110 -2848 -200", "-11 2105 0" );
		make_ladder( "_ladder_mehacvent_cloned_hedgemazecorner", "-7564 -352 -195.966", "141 -4810 208" );
		make_ladder( "_ladder_overpasshigh_cloned_cedatrailerfence", "-9557 -5536 -176", "-441 2900 254" );
		make_ladder( "_ladder_overpasslow_cloned_watchtowerbags", "-8000 -5874 -128", "-2095 2947 24" );
		make_ladder( "_ladder_restroomsplatforml_cloned_startcopcarfence", "-3128 -2204 -304", "-7101 529 80", "0 90 0", "0 -1 0" );
		make_ladder( "_ladder_restroomsplatformr_cloned_startleftfence", "-3460 -1310 -304", "-8356 -3127 80", "0 180 0", "0 1 0" );
		make_ladder( "_ladder_startorangedrain_cloned_whitedumpster", "-9162 -4093 -68", "5959 2634 -103" );
		make_ladder( "_ladder_startstuckspot_cloned_archleft", "-8110 -2848 -200", "3444.1 1312 64" );
		make_ladder( "_ladder_telephonepoleB_cloned_restrictedbarricade", "-9544 -5266 -128", "-11800 3720 -16", "0 90 0", "-1 0 0" );
		make_ladder( "_ladder_telephonepoleT_cloned_restrictedbarricade", "-9544 -5266 -128", "-11800 3720 176", "0 90 0", "-1 0 0" );
		make_prop( "dynamic",		"_losblocker_fence",		"models/props_urban/fence_cover001_256.mdl",	"-6583 -5743 -247.75",		"0 180 0",		"shadow_no" );
		make_prop( "dynamic",		"_propladder_planka",		"models/props_highway/plywood_02.mdl",		"-4216 -1082 -130",		"40 90 0" );
		make_prop( "dynamic",		"_propladder_plankb",		"models/props_swamp/plank001b_192.mdl",		"-3105 -1504 -320",		"0 90 35" );
		make_prop( "dynamic",		"_propladder_plankc",		"models/props_highway/plywood_01.mdl",		"-6731 -6212 -80",		"0 270 25",		"shadow_no" );
		make_prop( "dynamic",		"_propladder_venta",		"models/props_rooftop/hotel_rooftop_equip002.mdl",	"-6724 -6753 7.918",		"0 90 0",		"shadow_no" );
		make_prop( "dynamic",		"_propladder_ventb",		"models/props_rooftop/hotel_rooftop_equip002.mdl",	"-6370 -6752 80",		"0 90 0",		"shadow_no" );
		make_prop( "dynamic",		"_solidify_awning",		"models/props_street/awning_department_store.mdl",	"-6403.3 -5024 -102.145",	"0 180 0",		"shadow_no" );
		make_prop( "dynamic", "_guardtower_wrongway", "models/props_misc/wrongway_sign01_optimized.mdl", "-10091 -5792 110", "0 90 0", "shadow_no", "solid_no", "255 255 255", "17", "217" );
		make_prop( "dynamic", "_overpass_wrongwaya", "models/props_misc/wrongway_sign01_optimized.mdl", "-10162 -2304 80", "0 -90 0", "shadow_no", "solid_no", "255 255 255", "17", "217" );
		make_prop( "dynamic", "_overpass_wrongwayb", "models/props_misc/wrongway_sign01_optimized.mdl", "-9900 -2304 225", "0 -90 0", "shadow_no", "solid_no", "255 255 255", "17", "217" );
		make_prop( "dynamic", "_overpass_wrongwayc", "models/props_misc/wrongway_sign01_optimized.mdl", "-9700 -2304 225", "0 -90 0", "shadow_no", "solid_no", "255 255 255", "17", "217" );
		make_prop( "dynamic", "_solidify_flatawningend1", "models/props_street/awning_short.mdl", "-7785 -8320 -108.921", "0 0 0", "shadow_no" );
		make_prop( "dynamic", "_solidify_flatawningend2", "models/props_street/awning_short.mdl", "-8537 -8320 -108.921", "0 0 0", "shadow_no" );
		make_prop( "dynamic", "_solidify_flatawningmid", "models/props_street/awning_short.mdl", "-9216 -3712 -78.4492", "0 270 0", "shadow_no" );
		make_prop( "dynamic", "_yesdraw_billboard_nodraw", "models/props_update/c5m2_billboard_nodraw.mdl", "-9152 -6938 92", "0 -90 0", "shadow_no", "solid_no" );
		make_prop( "dynamic", "_solidify_chimney007", "models/props_urban/chimney007.mdl", "-9076 -4300 150.405", "0 180 0", "shadow_no" );
		make_prop( "physics", "_hittable_dumpster", "models/props_junk/dumpster_2.mdl", "-8095 -600 -246", "0 0 0", "shadow_no" );
	}

	// Resolve stuck Tank spawns for Taaannnk! Mutation.

	if ( g_MutaMode == "mutation19" )
	{
		// Starting rooftop with a wrongway sign has excess nav behind
		// it -- block access to it, which also blocks a permstuck.

		make_clip( "_tankstuck_startroof", "SI Players", 1, "-106 -240 0", "86 240 196", "-2936 -816 -58" );
	}
}