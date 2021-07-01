printl( "VSCRIPT: Running anv_mapfixes.nut" );

/*****************************************************************************
**  This file is RunScriptFile'd on "worldspawn" by mapspawn.nut and its function
**  for spawning in the map-specific fixes exists forever in its scope. Fixes
**  add or modify entities once per round, unlike mapspawn.nut which only runs
**  once per load session. This will be the most-updated file.
**
**  Originally a func_orator hack was required to get mapname from the Response
**  System with a new "GetQueryData" -- Kerry's C++ updates made all this easy.
*****************************************************************************/

// Deleted super hacky code. Thank you Kerry for making our lives so much better!

/*****************************************************************************
**  Game Event "player_connect_full" fires when a player has sent final message
**  in connection sequence. Infected ladder VSSM's exist narrowly before this
**  so in most cases InfectedLadders_Spawn() will complete instantly, but it's
**  still there as backup. Required because some maps like Dead Center 1 fire
**  the much-earlier "round_start" before this file has even loaded (and that
**  was regardless of mapspawn.nut run order and file sizes)!
**
**  A 3-state Boolean ensures only the first "player_connect_full" will spawn
**  in that round's entities, which then hands off all subsequent round entity
**  spawns to "round_start" -- Infected ladder VSSM's exist forever, as well.
**  While possible to spawn in new clips/props instantly, that's incompatible
**  with EntFire() on BSP-spawned entities -- of which delays ensure existence.
**  Hand-off was tested with spammy events like "player_entered_start_area".
**
**  There's minor SourceMod rumors that "player_connect_full" isn't 100% stable
**  given various bugged connection states, but it'll always fire for somebody.
**  Functions like patch_nav_obscured() rely on "g_UpdateRanOnce == false" to
**  only apply NAV changes once (which exist for all rounds) -- it's set "true"
**  at the end of this file with a one second delay for RunScriptFile cushion.
**  Last line needed as we're not already running as a Mutation in Scripted Mode.
*****************************************************************************/

function OnGameEvent_player_connect_full( params )
{
	if ( g_UpdateRanOnce == null )
	{
		g_UpdateRanOnce = false;

		Apply_Quadmode_Map_Specific_Fixes();
	}
}

function OnGameEvent_round_start( params )
{
	if ( g_UpdateRanOnce == true )
	{
		Apply_Quadmode_Map_Specific_Fixes();
	}
}

__CollectEventCallbacks( this, "OnGameEvent_", "GameEventCallbacks", RegisterScriptGameEventListener );

/*****************************************************************************
**  Function that spawns in the map-specific fixes for any Mutation/Base mode.
**
**  If highly specific Mutation fixes are to be applied, caution using "break;"
**  to ensure we're only patching that Mutation (i.e. VS Survival is "mutation15").
**
**  This is run on every "round_start" GameEvent which guarantees map entities
**  will have already loaded in allowing for direct AddOutputs to modify logic.
**  Elaborate fixes are put in separate files and RunScriptFile'd here.
**
**  Note that basemode "coop" does not include "realism", but if base "realism"
**  the player experience will always be equivalent to that of Coop -- so check
**  for both, and don't worry about "VS Realism" because that's base "versus".
**  Resolves issue with Versus-only fixes undesirably existing for Realism Coop.
**
**  Speedy code goes in, speedy fix comes out.
*****************************************************************************/

::Apply_Quadmode_Map_Specific_Fixes <- function()
{
	// Add reliably-named Survivor and Infected team filters to every map.
	// These are deleted if it's a "COMMUNITY" (unknown) map.

	SpawnGlobalFilters();

	// Fixes requiring new trigger_multiple and trigger_once entity spawns
	// are pooled separately. While anv_mapfixes.nut is designed for high
	// density with "make_" functions or modifying logic by piggybacking on
	// existing I/O, anv_maptrigs.nut houses all lengthy one-off fixes in
	// a standalone switch-case. Only console logs if it's a matching map.

	EntFire( "worldspawn", "RunScriptFile", "anv_maptrigs" );

	// Versus-specific content which only spawns if HasPlayerControlledZombies()
	// is true. Includes new Infected ladders and any supporting props i.e. pipes.
	// Exclude VS Survival (mutation15) from only overtly obvious new props.

	if ( HasPlayerControlledZombies() == true )
	{
		EntFire( "worldspawn", "RunScriptFile", "anv_versus" );

		// If it's VS Survival (mutation15), delete new props that obstruct
		// Survivor movement since their play space is already limited. This
		// includes c2m5's hittable dumpsters, c3m3's hittable log, & c10m5's
		// LOS blocker props/clips/navblocks and its log/rock hittables.

		if ( g_MutaMode == "mutation15" )
		{
			EntFire( g_UpdateName + "_hittable_dump*",	"Kill", null, 0.1 );

			EntFire( g_UpdateName + "_hittable_fallentree",	"Kill", null, 0.1 );

			EntFire( g_UpdateName + "_rock*",		"Kill", null, 0.1 );
			EntFire( g_UpdateName + "_hittable_log",	"Kill", null, 0.1 );
			EntFire( g_UpdateName + "_hittable_rock",	"Kill", null, 0.1 );
		}
	}

	// Map fixes for Valve.
	// Dev Thread: https://steamcommunity.com/app/550/discussions/1/1651043320659915818/

	// Fix forklifts so they can start obstructed but still be destroyed.

	local forklift = null;

	while ( forklift = Entities.FindByModel( forklift, "models/props/cs_assault/forklift.mdl" ) )
	{
		if ( forklift.IsValid() )
		{
			NetProps.SetPropInt( forklift, "m_iMinHealthDmg", 400 );
			NetProps.SetPropInt( forklift, "m_takedamage", 3 );
		}
	}

	IncludeScript( "anv_mapfixes/" + g_MapName );

	switch( g_MapName )
	{
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	/*==============================
	||                            ||
	||        THE PASSING         ||
	||                            ||
	==============================*/

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		case "c6m1_riverbank":
		{
			g_Chapter = "THE PASSING - RIVERBANK";

			devchap( "ALL MODES" );

			// FIXES_ALL

make_clip(	"_ghostgrief_tarpledge",	"Survivors",	1,	"-4 -313 -145",		"4 466 1337",		"1148 4257 96" );
make_clip(	"_permstuck_tarptree",		"Everyone",	1,	"-17 -69 -17",		"17 17 17",		"1166 3794 191" );
make_clip(	"_commonhop_windowsill",	"Survivors",	1,	"-6 -216 0",		"6 216 800",		"539 2861 237" );
make_clip(	"_commonhop_awning",		"Survivors",	1,	"-117 -42 -17",		"107 55 2020",		"3824 2666 236" );
make_clip(	"_curvejump_pixelperfect",	"Survivors",	1,	"-24 -64 -128",		"24 64 128",		"4784 3785 83" );
make_clip(	"_permstuck_fence",		"Survivors",	1,	"-24 -48 0",		"24 48 92",		"-1391 1293 247" );
make_clip(	"_fence_onea",			"Survivors",	1,	"-450 -21 0",		"345 111 1216",		"96 1425 496" );
make_clip(	"_fence_oneb",			"Survivors",	1,	"-16 -325 0",		"16 325 1216",		"-356 1088 496" );
make_clip(	"_fence_two",			"Survivors",	1,	"-420 -177 0",		"24 177 1216",		"69 592 544" );
make_clip(	"_commonhop_endfence",		"Survivors",	1,	"-5 -128 0",		"5 128 1200",		"-3874 1647 716" );
make_clip(	"_commonhop_busa",		"Survivors",	1,	"-216 -20 0",		"216 20 1200",		"-3653 2324 705" );
make_clip(	"_commonhop_busb",		"Survivors",	1,	"-9 -777 -64",		"9 777 444",		"-3432 1527 926" );
make_clip(	"_sneaky_hunter",		"SI Players",	1,	"-144 -136 -368",	"144 136 368",		"5296 2488 1008" );
make_clip(	"_clipgap_fence",		"Survivors",	1,	"-32 -253 -360",	"32 256 360",		"584 2366 456" );
make_clip(	"_commonhop_windows",		"Survivors",	1,	"-700 -7 -72",		"700 7 800",		"1402 2659 393.1" );
make_clip(	"_cliprework_emptylargerooms",	"Survivors",	1,	"-440 -275 0",		"440 260 316",		"1072 1883 512" );
make_clip( "_dispcrouch_concretea", "Everyone", 1, "-8 -61 0", "8 61 375", "4035 1016 137", "0 -95 0" );
make_clip( "_dispcrouch_concreteb", "Everyone", 1, "-8 -150 0", "8 200 375", "4212 901 137", "0 -133 0" );
make_clip( "_booster_clipextend_mid", "Survivors", 1, "-405 -45 0", "403 43 1822", "-1963 373 1264" );
make_clip( "_booster_clipextend_end", "Survivors", 1, "-8 -945 0", "18 947 1202", "1856 -175 1920" );
make_clip( "_booster_gazebo", "Survivors", 1, "-184 -184 -94", "186 184 2122", "-1647 -365 999" );
make_clip( "_cliprework_startroof", "Survivors", 1, "-5 -1040 -60", "7 676 1200", "709 4088 344" );
make_clip( "_cliprework_bridgeroof", "Survivors", 1, "-218 -166 -4", "298 186 8", "927 4579 302" );
make_clip( "_cliprework_bridgewall", "Survivors", 1, "-218 -166 -4", "298 -154 1200", "927 4579 302" );
make_clip( "_cliprework_endfence", "Survivors", 1, "-5 -146 0", "27 200 779", "-2317 560 821" );
make_clip( "_cliprework_endroof", "Survivors", 1, "-9 -884 0", "9 461 839", "-3913 1061 1056" );
make_clip( "_cliprework_endwindows1", "Survivors", 1, "-15 -155 0", "7 151 90", "-3844 -270 1035" );
make_clip( "_cliprework_endwindows2", "Survivors", 1, "-8 -160 0", "8 158 129", "-3911 561 863" );
make_clip( "_cliprework_endwindows3", "Survivors", 1, "-8 -161 0", "8 157 128", "-3880 1082 895" );
make_clip( "_dispcrouch_caralarm", "Everyone", 1, "-58 -8 0", "58 8 155", "1415 980 357", "0 -39 0" );

make_prop( "dynamic",		"_cosmetic_hifunreal",		"models/props_vehicles/racecar_damaged_glass.mdl",	"928 4016 90",			"0.0 0.0 -1.5",		"shadow_no" );

make_prop( "dynamic", "_cosmetic_left_desk1", "models/props_interiors/desk_metal.mdl", "910 1652 527", "90 -90 0", "shadow_no", "solid_no" );
make_prop( "dynamic", "_cosmetic_left_desk2", "models/props_interiors/desk_metal.mdl", "855 1634 527", "0 -90 30", "shadow_no", "solid_no" );
make_prop( "dynamic", "_cosmetic_left_plywood", "models/props_highway/plywood_02.mdl", "930 1615 605", "12 0 90", "shadow_no", "solid_no" );
make_clip( "_cosmetic_left_collision", "SI Players and AI", 1, "-78 -18 -30", "58 14 6", "890 1637 542" );

make_prop( "dynamic_ovr", "_cosmetic_right_cab1", "models/props/cs_office/file_cabinet1.mdl", "1455 1636 512", "0 -125 0", "shadow_no", "solid_no" );
make_prop( "dynamic_ovr", "_cosmetic_right_cab2", "models/props/cs_office/file_cabinet3.mdl", "1420 1634 512", "0 -75 0", "shadow_no", "solid_no" );
make_prop( "dynamic_ovr", "_cosmetic_right_cab3", "models/props/cs_office/file_cabinet3.mdl", "1395 1634 512", "0 -95 0", "shadow_no", "solid_no" );
make_prop( "dynamic", "_cosmetic_right_plywood", "models/props_highway/plywood_02.mdl", "1450 1615 621", "-3 0 90", "shadow_no", "solid_no" );
make_clip( "_cosmetic_right_collision", "SI Players and AI", 1, "-17 -18 -30", "73 14 6", "1400 1637 542" );

			if ( g_BaseMode == "coop" || g_BaseMode == "realism" )
			{
				devchap( "BASE COOP" );

				// FIXES

con_comment( "KILL:\tOut of bounds fences unpatched for Coop (popular request)." );

EntFire( g_UpdateName + "_fence*", "Kill" );

				break;
			}
			if ( g_BaseMode == "versus" )
			{
				devchap( "BASE VERSUS" );

				// FIXES

				break;
			}
			if ( g_BaseMode == "survival" )
			{
				devchap( "BASE SURVIVAL" );

				// FIXES

make_clip( "_survival_tree_01", "Survivors", 1, "-134 -134 0", "134 134 2288", "1506 -942 817" );
make_clip( "_survival_tree_02", "Survivors", 1, "-134 -134 0", "134 134 2288", "1621 -367 817" );
make_clip( "_survival_tree_03", "Survivors", 1, "-134 -134 0", "134 134 2288", "1659 234 817" );
make_clip( "_survival_tree_04", "Survivors", 1, "-134 -134 0", "134 134 2288", "317 -966 830" );
make_clip( "_survival_tree_05", "Survivors", 1, "-134 -134 0", "134 134 2288", "-75 -980 870" );
make_clip( "_survival_tree_06", "Survivors", 1, "-134 -134 0", "134 134 2288", "-170 -352 800" );
make_clip( "_survival_tree_07", "Survivors", 1, "-134 -134 0", "134 134 2288", "30 302 830" );
make_clip( "_survival_tree_08", "Survivors", 1, "-134 -134 0", "134 134 2288", "-455 244 830" );
make_clip( "_survival_tree_09", "Survivors", 1, "-134 -134 0", "134 134 2288", "-634 -154 830" );
make_clip( "_survival_tree_10", "Survivors", 1, "-134 -134 0", "134 134 2288", "-644 -578 870" );
make_clip( "_survival_tree_11", "Survivors", 1, "-134 -134 0", "134 134 2288", "-956 233 830" );
make_clip( "_survival_tree_12", "Survivors", 1, "-134 -134 0", "134 134 2288", "-1019 -143 870" );
make_clip( "_survival_tree_13", "Survivors", 1, "-134 -134 0", "134 134 2288", "-1026 -569 870" );
make_clip( "_survival_tree_14", "Survivors", 1, "-134 -134 0", "134 134 2288", "-1476 -1023 870" );
make_clip( "_survival_tree_15", "Survivors", 1, "-134 -134 0", "134 134 2288", "-1476 249 870" );
make_clip( "_survival_tree_16", "Survivors", 1, "-134 -134 0", "134 134 2288", "-1976 -1025 870" );
make_clip( "_survival_tree_17", "Survivors", 1, "-134 -134 0", "134 134 2288", "-1982 260 870" );
make_clip( "_survival_tree_18", "Survivors", 1, "-134 -134 0", "134 134 2288", "-2490 -900 870" );
make_clip( "_survival_tree_19", "Survivors", 1, "-34 -134 0", "134 134 2288", "-2504 185 880" );
make_clip( "_survival_tree_20", "Survivors", 1, "-134 -134 0", "134 134 2288", "-3266 195 870" );
make_clip( "_survival_tree_21", "Survivors", 1, "-134 -134 0", "134 134 2288", "-3271 -890 870" );
make_clip( "_survival_tree_22", "Survivors", 1, "-189 -188 0", "188 188 2288", "800 -64 747" );
make_clip( "_survival_tree_23", "Survivors", 1, "-80 -80 0", "80 80 2288", "-1502 -606 850" );
make_clip( "_survival_tree_tent", "Survivors", 1, "-18 -171 0", "95 97 2205", "-2633 222 963" );

				break;
			}
			if ( g_BaseMode == "scavenge" )
			{
				devchap( "BASE SCAVENGE" );

				// FIXES

				break;
			}

			break;
		}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		case "c6m2_bedlam":
		{
			g_Chapter = "THE PASSING - UNDERGROUND";

			devchap( "ALL MODES" );

			// FIXES_ALL

make_clip(	"_permstuck_startfence",	"Survivors",	1,	"-80 -1 0",		"80 1 768",		"2384 -1280 0" );
make_clip(	"_cliphang_rooftop",		"Survivors",	1,	"-192 -490 0",		"208 476 420",		"224 2406 336" );
make_clip( "_cliprework_roofvent", "Survivors", 1, "-319 -182 0", "321 159 412", "1471 2017 352" );
make_clip( "_booster_bluestripes", "Survivors", 1, "-234 -92 0", "222 105 732", "1574 4577 32" );
make_clip( "_booster_dualwindows", "Survivors", 1, "-10 -168 -1", "10 140 89", "1953 561 178", "0 7 0" );
make_clip( "_booster_balcony1", "Survivors", 1, "-20 -146 0", "23 150 640", "537 46 209" );
make_clip( "_booster_balcony2", "Survivors", 1, "-24 -114 -98", "20 118 640", "1960 86 242" );
make_clip( "_booster_balcony3", "Survivors", 1, "-37 -25 0", "35 23 640", "1285 -151 384" );
make_clip( "_booster_balcony4", "Survivors", 1, "-9 -323 0", "39 327 640", "1497 798 317" );
make_clip( "_booster_balcony5", "Survivors", 1, "-325 -9 -112", "323 35 640", "1077 1293 420" );
make_clip( "_booster_balcony6", "Survivors", 1, "-182 -22 -74", "184 25 640", "342 1303 241" );
make_clip( "_booster_balcony7", "Survivors", 1, "-106 -23 -65", "112 24 640", "413 4566 157" );
make_clip( "_booster_bigescape", "Survivors", 1, "-233 -67 -92", "218 62 640", "903 2723 187" );
make_clip( "_frontloader_smoother", "Everyone", 1, "-14 -53 0", "27 53 32", "836 1612 -148" );
make_clip( "_ghostgrief_noio_gate1", "Everyone", 1, "-3 -39 0", "3 39 32", "2547 5704 -950" );
make_clip( "_ghostgrief_noio_gate2", "Everyone", 1, "-3 -39 0", "3 39 32", "5187 5445 -950" );
make_clip( "_booster_electricalbox", "Survivors", 1, "-28 -5 -20", "32 5 836", "917 3163 -4" );
make_clip( "_booster_acunit", "Survivors", 1, "-64 -32 0", "64 32 721", "743 3135 111" );
make_clip( "_dispsteps_smoother1", "Everyone", 1, "-95 -104 -4", "150 104 4", "2553 -936 -186", "33.5 0 0" );
make_clip( "_dispsteps_smoother2", "Everyone", 1, "-95 -104 -4", "135 104 4", "2201 -936 -58", "33.5 0 0" );
make_clip( "_plankescape_smoother", "Everyone", 1, "-82 -30 0", "143 31 8", "190 2976 120", "45 0 0" );
make_clip( "_permstuck_orangefence", "Everyone", 1, "-32 -32 0", "32 32 64", "2188 1856 -64" );
make_clip( "_booster_awningnlights", "Survivors", 1, "-124 -41 0", "129 56 762", "1264 3705 8" );
make_clip( "_nav_bagselecbox", "Survivors", 1, "-7 -34 0", "4 28 822", "636 2243 -70" );
make_trigduck( "_duckqol_poolhallwin", "-2 -34 -46.5", "4 34 46.5", "1480 986.4 38.5" );
make_trigduck( "_duckqol_missingpipe", "-117 -40 -28", "117 40 28", "1824 1528 -164" );

make_prop( "dynamic", "_permstuck_gasmeter", "models/props_urban/gas_meter.mdl", "2202 1859.8 -70.5", "0 0 0" );

			if ( g_BaseMode == "coop" || g_BaseMode == "realism" )
			{
				devchap( "BASE COOP" );

				// FIXES

make_ladder( "_ladder_frontloaderright_cloned_frontloaderleft", "803 1554 -151.5", "1607 3220 0", "0 180 0", "0 1 0", 0 );

				break;
			}
			if ( g_BaseMode == "versus" )
			{
				devchap( "BASE VERSUS" );

				// FIXES

				break;
			}
			if ( g_BaseMode == "survival" )
			{
				devchap( "BASE SURVIVAL" );

				// FIXES

make_ladder( "_ladder_frontloaderright_cloned_frontloaderleft", "803 1554 -151.5", "1607 3220 0", "0 180 0", "0 1 0", 0 );

// MESS == make_clip( "_survivalbig_skyboxcap", "Survivors", 1, "-1093 -3406 -40", "1759 2002 382", "581 3150 387" );

				break;
			}
			if ( g_BaseMode == "scavenge" )
			{
				devchap( "BASE SCAVENGE" );

				// FIXES

				break;
			}

			break;
		}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		case "c6m3_port":
		{
			g_Chapter = "THE PASSING - PORT";

			devchap( "ALL MODES" );

			// FIXES_ALL

make_clip(	"_solidify_girder",		"Survivors",	1,	"-17 -80 -170",		"2 240 240",		"200 -1280 145" );
make_clip(	"_booster_bridgea",		"Survivors",	1,	"-234 -550 -17",	"255 0 0",		"0 -638 216" );
make_clip(	"_booster_bridgeb",		"Survivors",	1,	"-234 -17 -17",		"210 0 1017",		"0 -1200 216" );
make_clip( "_booster_tent", "Survivors", 1, "-61 -66 -30", "69 64 730", "1196 -847 294" );
make_clip( "_booster_streetlamp", "Survivors", 1, "-9 -11 0", "9 9 715", "1493 -368 308" );
make_clip( "_booster_generator_side", "Survivors", 1, "-10 -28 0", "6 29 930", "1848 928 98", "0 75 0" );
make_clip( "_booster_generator_main", "Survivors", 1, "-45 -32 -80", "29 45 702", "-484 -580 326" );
make_clip( "_booster_signalboxes", "Survivors", 1, "-118 -21 0", "98 19 920", "-570 -859 104" );
make_clip( "_booster_trimandbox", "Survivors", 1, "-518 -31 0", "11 80 551", "-859 1591 473" );
make_clip( "_booster_fencefinish", "Survivors", 1, "-13 -249 0", "11 247 887", "-243 -631 137" );
make_clip( "_booster_telepole1", "Survivors", 1, "-17 -66 -79", "25 66 387", "-232 1481 640" );
make_clip( "_booster_telepole2", "Survivors", 1, "-8 -67 -79", "11 66 387", "252 1092 640", "0 -44 0" );
make_clip( "_booster_telepole3", "Survivors", 1, "-17 -66 -79", "25 66 387", "-1423 1481 640" );
make_clip( "_booster_telepole4", "Survivors", 1, "-11 -67 -79", "10 65 387", "-2461 1234 640" );
make_clip( "_booster_telepole5", "Survivors", 1, "-17 -66 -79", "25 66 540", "258 153 480", "0 -45 0" );
make_clip( "_booster_telepole6", "Survivors", 1, "-17 -66 -79", "25 66 540", "-625 87 480" );
make_clip( "_booster_telepole7", "Survivors", 1, "-13 -68 -79", "11 63 680", "1562 170 345", "0 5 0" );
make_clip( "_booster_badcorner", "Survivors", 1, "-219 -142 -35", "133 50 695", "-2342 -258 329" );
make_clip( "_booster_acunit", "Survivors", 1, "-30 -93 0", "31 28 600", "-1568 -639 424" );
make_clip( "_booster_electricalbox", "Survivors", 1, "-5 -29 0", "6 20 923", "-251 -932 101" );
make_clip( "_booster_elecwiresa", "Survivors", 1, "-15 -102 0", "62 12 724", "-1537 -256 300" );
make_clip( "_booster_elecwiresb", "Survivors", 1, "-15 -33 0", "62 14 846", "255 -255 178" );
make_clip( "_booster_elecwiresc", "Survivors", 1, "-22 -13 0", "18 4 668", "262 -772 356" );
make_clip( "_booster_elecwiresd", "Survivors", 1, "-425 -310 0", "24 11 632", "-234 1078 392" );
make_clip( "_booster_for_lease", "Survivors", 1, "-20 -20 0", "19 13 640", "-1917 1555 384" );
make_clip( "_booster_genroom_shelf", "Survivors", 1, "-30 -79 0", "34 81 79", "-738 -801 233" );
make_clip( "_booster_light_dual", "Survivors", 1, "-106 -20 0", "104 36 699", "-2208 1532 325" );
make_clip( "_booster_lighta", "Survivors", 1, "-10 -16 0", "10 17 229", "-1540 23 187" );
make_clip( "_booster_lightb", "Survivors", 1, "-17 -10 0", "16 10 838", "-647 -568 186" );
make_clip( "_booster_lightc", "Survivors", 1, "-11 -22 0", "11 35 855", "593 -234 169" );
make_clip( "_booster_itwasatriumph", "Survivors", 1, "-13 -19 0", "13 19 95", "899 -426 53" );
make_clip( "_bridge_curbsmoother1", "Everyone", 1, "-128 -267 0", "-127 182 8", "-1 -1014 -8" );
make_clip( "_bridge_curbsmoother2", "Everyone", 1, "127 -267 0", "128 182 8", "1 -1014 -8" );
make_brush( "_losblock_plywoodc6only", "-1 -81 0", "1 66 72", "193 -1124 16" );
//make_clip( "_cliprework_newsandelec1", "Everyone", 1, "-9 -98 0", "11 98 176", "245 -509 0" );
//make_clip( "_cliprework_newsandelec2", "Everyone", 1, "-17 0 0", "17 5 132", "241 -404 44", "0 27 0" );
//make_clip( "_cliprework_newsandelec3", "Everyone", 1, "-5 -48 0", "0 48 132", "229 -456 44" );
//make_clip( "_cliprework_newsandelec4", "Everyone", 1, "-17 0 0", "17 5 132", "239 -512 44", "0 -26 0" );
make_clip( "_booster_windows", "Survivors", 1, "-8 -400 0", "8 400 96", "-1032 568 352" );
make_clip( "_window_smoother_c6only", "SI Players", 1, "-9 -400 0", "3 400 8", "-1023 568 352", "30 0 0" );
make_clip( "_booster_coolingtanks", "Survivors", 1, "-117 -56 -120", "117 56 80", "-1473 958 402" );

con_comment( "FIX:\tTotal of 2 out of 2 traffic cones need to be made non-solid -- c7m3 already OK." );

unsolidify_model( "models/props_fortifications/orange_cone001_reference.mdl" );

			if ( g_BaseMode == "coop" || g_BaseMode == "realism" )
			{
				devchap( "BASE COOP" );

				// FIXES

				break;
			}
			if ( g_BaseMode == "versus" )
			{
				devchap( "BASE VERSUS" );

				// FIXES

				break;
			}
			if ( g_BaseMode == "survival" )
			{
				devchap( "BASE SURVIVAL" );

				// FIXES

				break;
			}
			if ( g_BaseMode == "scavenge" )
			{
				devchap( "BASE SCAVENGE" );

				// FIXES

				break;
			}

			break;
		}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	/*==============================
	||                            ||
	||       THE SACRIFICE        ||
	||                            ||
	==============================*/

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		case "c7m1_docks":
		{
			g_Chapter = "THE SACRIFICE - DOCKS";

			devchap( "ALL MODES" );

			// FIXES_ALL

make_clip(	"_bunnyhop_boat",		"Survivors",	1,	"-180 -200 0",		"180 200 1180",		"11970 -820 -157" );
make_clip(	"_ghostgrief_dockledge",	"Everyone",	1,	"-48 -11 -21",		"42 7 71",		"10228 -340 -107" );
make_clip(	"_clipgap_intersection",	"Survivors",	1,	"-64 -32 0",		"64 32 140.85",		"6612 2234 294" );
make_clip( "_booster_lonerpipe", "Survivors", 1, "-13 -12 0", "14 10 475", "9236 750 550" );
make_clip( "_clipextend_arena_tree", "Survivors", 1, "-158 -137 0", "152 165 284", "9054 49 740" );
make_clip( "_clipextend_arena_fence1", "Survivors", 1, "-16 -391 0", "16 389 528", "9418 371 496" );
make_clip( "_clipextend_arena_fence2", "Survivors", 1, "-936 -16 0", "1390 15 528", "8077 -311 496", "0 13 0" );
make_clip( "_cliprework_ventshafts", "Survivors", 1, "-814 -79 -16", "1010 65 80", "3870 1647 336" );
make_clip( "_commonhop_endwindows", "Survivors", 1, "-459 -16 0", "453 16 128", "2563 2560 336" );
make_clip( "_clipextend_rubblecar", "Survivors", 1, "-418 -326 -223", "382 253 932", "11026 -1196 90" );

			if ( g_BaseMode == "coop" || g_BaseMode == "realism" )
			{
				devchap( "BASE COOP" );

				// FIXES

// Tank bug where tank_door_clip causes BLOCKED_ZOMBIE attribute but is erroneously
// removed with ~5 second delay after it's deleted -- the clip isn't necessary any
// way because of other collisions, so delete it instantly OnPressed to give it the
// extra time. Finally, originally the navblocker is UnblockNav'd OnFullyOpen which
// is also too late since it waits for the func_movelinear, so do that OnTimeUp.

con_comment( "LOGIC:\tCoop-only boxcar Tank door clip and navblocker modified to fix forced-suicide trick." );

EntFire( "tankdoorin_button", "AddOutput", "OnPressed tank_door_clip:Kill::0:-1" );
EntFire( "tankdoorin_button", "AddOutput", "OnTimeUp tankdoorinnavblocker:UnblockNav::0:-1" );

				break;
			}
			if ( g_BaseMode == "versus" )
			{
				devchap( "BASE VERSUS" );

				// FIXES

				break;
			}
			if ( g_BaseMode == "survival" )
			{
				devchap( "BASE SURVIVAL" );

				// FIXES

				break;
			}
			if ( g_BaseMode == "scavenge" )
			{
				devchap( "BASE SCAVENGE" );

				// FIXES

				break;
			}

			break;
		}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		case "c7m2_barge":
		{
			g_Chapter = "THE SACRIFICE - BARGE";

			devchap( "ALL MODES" );

			// FIXES_ALL

make_clip(	"_cliprework_startbricks",	"Survivors",	1,	"-177 -32 0",		"177 32 959",		"9800 1728 321" );
make_clip(	"_permstuck_flatnosecargo",	"Everyone",	1,	"-64 -32 0",		"64 32 121",		"5793 2568 130" );
make_clip(	"_curvejump_fenceledge",	"Survivors",	1,	"-64 -128 0",		"640 128 800",		"-1984 0 160" );
make_clip( "_stuckwarp_railwayoverpass", "Everyone", 1, "-30 -152 -45", "26 210 58", "2726 2775 374" );
make_clip( "_nav_windowrecess", "Survivors", 1, "-23 -4 0", "23 4 88", "-1944 1412 192" );
make_clip( "_ghostgrief_acunit", "Survivors", 1, "-60 -29 0", "60 33 894", "-10240 383 386" );
make_clip( "_ghostgrief_coalbarge", "Survivors", 1, "-22 -104 0", "3 316 177", "-8700 170 -78", "-15 47 0" );
make_clip( "_ghostgrief_unitfromdeath", "Survivors", 1, "-7 -80 0", "3 80 177", "-7399 -1199 -128", "-15 45 0" );
make_clip( "_booster_littleroof", "Survivors", 1, "-253 -63 0", "259 65 960", "-1795 1471 320" );
make_clip( "_booster_yawningman", "Survivors", 1, "-115 -23 0", "119 23 949", "-1294 1513 331" );
make_clip( "_booster_dualstacks", "Survivors", 1, "-214 -104 0", "201 121 704", "-3080 671 576" );
make_clip( "_booster_cementlips", "Survivors", 1, "-573 -9 0", "578 10 76", "-2882 1688 132" );
make_clip( "_booster_fenceledge", "Survivors", 1, "-345 -139 0", "311 89 1152", "-3767 1835 128" );
make_clip( "_booster_gravelacun", "Survivors", 1, "-33 -60 0", "29 61 947", "-6495 1144 333" );
make_clip( "_booster_solidify_windows", "Survivors", 1, "-152 -270 0", "152 270 168", "11032 606 336" );

			if ( g_BaseMode == "coop" || g_BaseMode == "realism" )
			{
				devchap( "BASE COOP" );

				// FIXES

				break;
			}
			if ( g_BaseMode == "versus" )
			{
				devchap( "BASE VERSUS" );

				// FIXES

				break;
			}
			if ( g_BaseMode == "survival" )
			{
				devchap( "BASE SURVIVAL" );

				// FIXES

				break;
			}
			if ( g_BaseMode == "scavenge" )
			{
				devchap( "BASE SCAVENGE" );

				// FIXES

make_clip(	"_scavenge_jump_woodbrush",	"Survivors",	1,	"-842 -8 0",		"216 8 988",		"-9100 392 262" );

				break;
			}

			break;
		}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		case "c7m3_port":
		{
			g_Chapter = "THE SACRIFICE - PORT";

			devchap( "ALL MODES" );

			// FIXES_ALL

make_clip(	"_solidify_girdershorter",	"Survivors",	1,	"-17 0 -170",		"2 240 240",		"200 -1280 145" );
make_clip(	"_booster_bridge_TMP1",		"Survivors",	1,	"-234 -550 -17",	"255 0 0",		"0 -638 216" );
make_clip(	"_booster_bridge_TMP2",		"Survivors",	1,	"-234 -17 -17",		"210 0 1017",		"0 -1200 216" );
make_brush( "_losblock_plywoodc7only", "-1 -93 0", "1 7 72", "193 -1124 16" );
//make_clip( "_cliprework_newsandelec1", "Everyone", 1, "-9 -98 0", "11 98 176", "245 -509 0" );
//make_clip( "_cliprework_newsandelec2", "Everyone", 1, "-17 0 0", "17 5 132", "241 -404 44", "0 27 0" );
//make_clip( "_cliprework_newsandelec3", "Everyone", 1, "-5 -48 0", "0 48 132", "229 -456 44" );
//make_clip( "_cliprework_newsandelec4", "Everyone", 1, "-17 0 0", "17 5 132", "239 -512 44", "0 -26 0" );
make_clip( "_booster_windows", "Survivors", 1, "-8 -400 0", "8 400 96", "-1032 568 352" );
make_clip( "_booster_skylight_c7only", "Survivors", 1, "-90 -90 -17", "90 90 29", "-768 930 325" );
make_clip( "_booster_coolingtanks", "Survivors", 1, "-117 -56 -120", "117 56 80", "-1473 958 402" );

con_comment( "LOGIC:\tTMP shortcut booster clips will be deleted on trigger_finale FinaleEscapeStarted.\n"
	   + "\tNot a gamebreaker if absent and only for Sacrifice 3 to avoid players bumping their head." );

EntFire( "trigger_finale", "AddOutput", "FinaleEscapeStarted anv_mapfixes_booster_bridge_TMP*:Kill::0:-1" );

make_clip(	"_anti_finaleskip_TMP",		"Survivors",	1,	"-21 -420 0",		"88 88 888",		"230 -849 216" );

con_comment( "LOGIC:\tTMP finale skip clip will be deleted after bridge is almost fully raised.\n"
	   + "\tAllows sacrificer to use stairs. Incompatible with Passing 3 because of Louis." );

EntFire( "bridge_start_button", "AddOutput", "OnPressed anv_mapfixes_anti_finaleskip_TMP:Kill::8.1:-1" );

make_clip(	"_booster_tankwindows",		"Survivors",	1,	"-132 -8 -24",		"132 8 64",		"-1280 -1016 216" );
make_clip(	"_cliprework_semitrailer",	"Survivors",	1,	"-8 -194 -256",		"8 194 759",		"1727 2883 285" );
make_clip(	"_cliprework_startroofa",	"Survivors",	1,	"-370 -310 -168",	"370 350 500",		"1370 2379 544" );
make_clip(	"_cliprework_startroofb",	"Survivors",	1,	"-420 -240 0",		"333 240 636",		"675 2011 408" );
make_clip(	"_cliprework_startroofc",	"Survivors",	1,	"-260 -777 0",		"254 777 404",		"517 2972 640" );
make_clip(	"_cliprework_startroofd",	"Survivors",	1,	"-188 -360 0",		"255 360 504",		"983 3418 540" );
make_clip(	"_cliprework_colossaldumpster",	"Survivors",	1,	"-45 -2 0",		"17 64 142",		"1583 962 64" );
make_clip( "_booster_tent", "Survivors", 1, "-61 -66 -30", "69 64 730", "1196 -847 294" );
make_clip( "_booster_streetlamp", "Survivors", 1, "-9 -11 0", "9 9 715", "1493 -368 308" );
make_clip( "_booster_generator_side", "Survivors", 1, "-10 -28 0", "6 29 930", "1848 735 98", "0 75 0" );
make_clip( "_booster_generator_main", "Survivors", 1, "-45 -32 -80", "29 45 702", "-434 -580 326" );
make_clip( "_booster_telepole1", "Survivors", 1, "-17 -66 -79", "25 66 387", "-232 1481 640" );
make_clip( "_booster_telepole2", "Survivors", 1, "-8 -67 -79", "11 66 387", "252 1122 640", "0 -44 0" );
make_clip( "_booster_telepole3", "Survivors", 1, "-17 -66 -79", "25 66 540", "258 153 480", "0 -45 0" );
make_clip( "_booster_telepole4", "Survivors", 1, "-17 -66 -79", "25 66 540", "-625 87 480" );
make_clip( "_booster_telepole5", "Survivors", 1, "-13 -68 -79", "11 63 680", "1562 170 345", "0 5 0" );
make_clip( "_booster_elecwiresbad", "Survivors", 1, "-425 -310 0", "24 11 632", "-234 1078 392" );
make_clip( "_booster_genroom_shelf", "Survivors", 1, "-30 -79 0", "34 81 79", "-739 -800 233" );
make_clip( "_booster_spaaaaaace", "Survivors", 1, "-13 -19 0", "13 19 95", "899 -426 53" );
make_clip( "_booster_fireescape", "Survivors", 1, "-78 -67 0", "89 20 864", "359 -788 160" );
make_clip( "_bridgerail_thinledge", "Survivors", 1, "-19 -5 0", "19 -1 223", "288 -1275 414" );
make_clip( "_bridge_curbsmoother1", "Everyone", 1, "-128 -267 0", "-127 182 8", "-1 -1014 -8" );
make_clip( "_bridge_curbsmoother2", "Everyone", 1, "127 -267 0", "128 182 8", "1 -1014 -8" );

			if ( g_BaseMode == "coop" || g_BaseMode == "realism" )
			{
				devchap( "BASE COOP" );

				// FIXES

				break;
			}
			if ( g_BaseMode == "versus" )
			{
				devchap( "BASE VERSUS" );

				// FIXES

				break;
			}
			if ( g_BaseMode == "survival" )
			{
				devchap( "BASE SURVIVAL" );

				// FIXES

				break;
			}
			if ( g_BaseMode == "scavenge" )
			{
				devchap( "BASE SCAVENGE" );

				// FIXES

				break;
			}

			break;
		}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	/*==============================
	||                            ||
	||          NO MERCY          ||
	||                            ||
	==============================*/

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		case "c8m1_apartment":
		{
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
make_trighurt( "_instakill_griefroom", "Survivor", "-512 -1080 0", "384 1080 125", "1152 936 8" );

con_comment( "FIX:\tFans will now rotate. Server-side entities used to have Client-side Animation spawnflag." );

EntFire( "fanblade*", "AddOutput", "spawnflags 129" );

			if ( g_BaseMode == "coop" || g_BaseMode == "realism" )
			{
				devchap( "BASE COOP" );

				// FIXES

				break;
			}
			if ( g_BaseMode == "versus" )
			{
				devchap( "BASE VERSUS" );

				// FIXES

				break;
			}
			if ( g_BaseMode == "survival" )
			{
				devchap( "BASE SURVIVAL" );

				// FIXES

				break;
			}
			if ( g_BaseMode == "scavenge" )
			{
				devchap( "BASE SCAVENGE" );

				// FIXES

				break;
			}

			break;
		}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		case "c8m2_subway":
		{
			g_Chapter = "NO MERCY - SUBWAY";

			devchap( "ALL MODES" );

			// FIXES_ALL

make_clip(	"_permstuck_piperoom",		"Everyone",	1,	"-88 -2 -17",		"88 2 10",		"7474 2355 -216" );
make_clip(	"_tankwarp_pillar",		"Everyone",	1,	"-17 0 -2",		"10 12 88",		"7565 4164 -95" );
make_clip(	"_busstop_fence",		"Survivors",	1,	"-512 -76 -620",	"512 76 620",		"8600 5556 788" );
make_clip(	"_dispcrouch_cavea",		"Everyone",	1,	"-42 -120 -80",		"0 145 80",		"4354 3430 -174.7" );
make_clip(	"_dispcrouch_caveb",		"Everyone",	1,	"-120 -42 -80",		"470 0 80",		"4497 3316 -174.7" );
make_clip(	"_booster_windowandfence",	"Survivors",	1,	"0 -64 0",		"128 50 1068",		"8416 3888 344" );
make_clip(	"_booster_pipe",		"Survivors",	1,	"-64 -32 0",		"64 32 90",		"7351 3792 144" );
make_clip(	"_booster_beama",		"Survivors",	1,	"-9 -474 -24",		"9 686 192",		"7176 3138 424" );
make_clip(	"_booster_beamb",		"Survivors",	1,	"-9 -474 -24",		"9 686 192",		"7380 3138 424" );
make_clip(	"_booster_beamc",		"Survivors",	1,	"-17 -474 -24",		"9 686 192",		"7568 3138 424" );
make_clip(	"_booster_beamd",		"Survivors",	1,	"-17 -474 -24",		"10 686 192",		"7754 3138 424" );
make_clip(	"_booster_beame",		"Survivors",	1,	"-9 -474 -24",		"10 686 192",		"7943 3138 424" );
make_clip(	"_booster_boxrow",		"Survivors",	1,	"-370 -4 0",		"290 4 216",		"7827 3816 381" );
make_clip( "_stuckwarp_underspawn", "Everyone", 1, "-11 -7 0", "-3 10 70", "3111 2775 -70" );
make_clip( "_stuckwarp_tunnelend", "Everyone", 1, "-12 -24 -14", "137 73 70", "4182 2831 -70", "0 -1 0" );
make_clip( "_tankwarp_solidify", "SI Players and AI", 1, "-26 -30 0", "98 6 100", "5977 4742 -335", "0 -22 0" );
make_clip( "_unattackable_building", "Survivors", 1, "-126 -320 -32", "157 348 512", "9311 4256 704" );
make_clip( "_unattackable_backalley1", "Survivors", 1, "-252 -311 0", "260 337 772", "6780 4279 632" );
make_clip( "_unattackable_backalley2", "Survivors", 1, "-1191 -320 0", "1153 320 752", "8319 3520 660" );
make_clip( "_unattackable_backalley3", "Survivors", 1, "-58 -7 0", "70 7 1402", "10298 3765 16" );
make_clip( "_unattackable_backalley4", "Survivors", 1, "-359 -381 0", "393 387 722", "10871 4221 688" );
make_clip( "_unattackable_pawnshop1", "Survivors", 1, "-8 -298 0", "8 434 1402", "11272 5336 16" );
make_clip( "_unattackable_pawnshop2", "Survivors", 1, "-1024 -16 -105", "1152 16 912", "10112 5744 512" );
make_clip( "_clipextend_ledgehang", "Survivors", 1, "-306 -80 0", "334 80 992", "9394 5648 416" );
make_clip( "_unattackable_tanker1", "Survivors", 1, "-38 -461 0", "48 532 892", "6750 5141 512", "0 -26 0" );
make_clip( "_unattackable_tanker2", "Survivors", 1, "-698 -12 -32", "428 12 872", "7700 5622 536" );
make_clip( "_ladderqol_orangebags", "SI Players and AI", 1, "-29 -23 27", "24 32 32", "10660 5215 16", "-45 0 0" );
make_clip( "_genroomrail_smoother1", "Everyone", 1, "-1 -33 0", "0 34 40", "7285 3633 248" );
make_clip( "_genroomrail_smoother2", "Everyone", 1, "-1 -65 0", "0 66 40", "7285 2878 248" );
make_clip( "_nav_tankjukepipes", "Survivors", 1, "-37 -168 0", "28 168 95", "8276 3656 140" );

con_comment( "FIX:\tGenerator Room has 13 hanging lights and 9 need to be made non-solid." );

unsolidify_model( "models/props/de_nuke/IndustrialLight01.mdl" );

			if ( g_BaseMode == "coop" || g_BaseMode == "realism" )
			{
				devchap( "BASE COOP" );

				// FIXES

				break;
			}
			if ( g_BaseMode == "versus" )
			{
				devchap( "BASE VERSUS" );

				// FIXES

make_clip( "_nav_backlightleft", "Survivors", 1, "6 -13 -61", "9 15 84", "5249 4124 -265" );
make_clip( "_nav_backlightright", "Survivors", 1, "6 -13 -61", "9 15 84", "5243 4210 -265" );

make_clip( "_subwaymount_in", "Survivors", 1, "-49 -248 0", "63 247 58", "6337 3137 -154", "0 41 0" );
make_clip( "_subwaymount_out", "Survivors", 1, "-49 -248 0", "63 247 58", "6769 2895 -154", "0 79 0" );

				break;
			}
			if ( g_BaseMode == "survival" )
			{
				devchap( "BASE SURVIVAL" );

				// FIXES

make_clip(	"_survival_vendors",		"Survivors",	1,	"-80 -32 0",		"80 55 284",		"7406 3769 381.4" );

				break;
			}
			if ( g_BaseMode == "scavenge" )
			{
				devchap( "BASE SCAVENGE" );

				// FIXES

				break;
			}

			break;
		}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		case "c8m3_sewers":
		{
			g_Chapter = "NO MERCY - SEWER";

			devchap( "ALL MODES" );

			// FIXES_ALL

make_clip(	"_commonhop_trashbags",		"Survivors",	1,	"-256 -670 0",		"4 95 1190",		"10693 5279 17" );
make_clip(	"_clipextend_roofandfence",	"Survivors",	1,	"-4 -1010 0",		"4 420 1200",		"10525 6365 24" );
make_clip(	"_filecabinet_hole",		"Survivors",	1,	"-32 -32 -4",		"32 32 4",		"10928 8208 292" );
make_clip(	"_permstuck_semitrailer",	"SI Players",	1,	"-24 -10 0",		"24 17 171",		"13349 11144 24" );
make_clip(	"_booster_escapeladder",	"Survivors",	1,	"-47 -88 0",		"42 112 929",		"14680 13819 255" );
make_clip( "_nav_garagewindow1", "Everyone", 1, "-5 -36 0", "5 36 32", "12044 5900 19" );
make_clip( "_nav_garagewindow2", "Everyone", 1, "-64 -5 0", "64 5 32", "11928 5948 19" );
make_clip( "_unattackable_wrongway1", "Survivors", 1, "-518 -7 0", "1002 7 652", "11030 4601 560" );
make_clip( "_unattackable_wrongway2", "Survivors", 1, "-232 -7 0", "737 7 742", "12264 4532 468" );
make_clip( "_unattackable_wrongway3", "Survivors", 1, "-7 -1225 -248", "7 2578 632", "13003 5742 568" );
make_clip( "_unattackable_hospital1", "Survivors", 1, "-7 -331 -9", "7 1396 1717", "12473 12235 457" );
make_clip( "_unattackable_hospital2", "Survivors", 1, "-7 -339 -449", "7 429 737", "12473 11475 457" );
make_clip( "_unattackable_hospital3", "Survivors", 1, "-1314 -17 -456", "893 16 742", "13890 10833 464" );
make_clip( "_unattackable_hospital4", "Survivors", 1, "-7 -626 0", "8 1602 576", "14791 11454 608" );
make_clip( "_clipextend_alley", "Survivors", 1, "-54 -29 0", "236 29 782", "12774 8347 432" );
make_clip( "_clipextend_warehouse1", "Survivors", 1, "-270 -753 -43", "290 799 372", "10742 7529 843" );
make_clip( "_clipextend_warehouse2", "Survivors", 1, "-787 -413 0", "909 403 372", "11795 7941 800" );
make_trigduck( "_duckqol_warehousevent", "-9 -26 -28", "9 26 28", "12712 8148 304" );

make_clip(	"_gasstationroof_TMP",		"Survivors",	1,	"0 -794 0",		"503 0 700",		"12186 6694 324" );

make_clip(	"_ladderqol_scissorlift",	"Everyone",	0,	"-54 -1 -184",		"8 8 58",		"12687 7171 16" );

con_comment( "LOGIC:\tTMP Gas Station roof clip will be deleted when it explodes." );

EntFire( "gas_explosion_sound_relay", "AddOutput", "OnTrigger anv_mapfixes_gasstationroof_TMP:Kill::0:-1" );

con_comment( "MOVER:\tClip \"_ladderqol_scissorlift\" simulated to move up with Scissor Lift." );

EntFire( "washer_lift_button2", "AddOutput", "OnPressed anv_mapfixes_ladderqol_scissorlift:Enable::2:-1" );
EntFire( "washer_lift_button2", "AddOutput", "OnPressed anv_mapfixes_ladderqol_scissorlift:AddOutput:origin 12687 7170 62:4:-1" );
EntFire( "washer_lift_button2", "AddOutput", "OnPressed anv_mapfixes_ladderqol_scissorlift:AddOutput:origin 12687 7170 108:6:-1" );
EntFire( "washer_lift_button2", "AddOutput", "OnPressed anv_mapfixes_ladderqol_scissorlift:AddOutput:origin 12687 7170 154:8:-1" );
EntFire( "washer_lift_button2", "AddOutput", "OnPressed anv_mapfixes_ladderqol_scissorlift:AddOutput:origin 12687 7170 200:10:-1" );
EntFire( "washer_lift_button2", "AddOutput", "OnPressed anv_mapfixes_ladderqol_scissorlift:Kill::12:-1" );

			if ( g_BaseMode == "coop" || g_BaseMode == "realism" )
			{
				devchap( "BASE COOP" );

				// FIXES

				break;
			}
			if ( g_BaseMode == "versus" )
			{
				devchap( "BASE VERSUS" );

				// FIXES

make_clip(	"_window_ricky",		"Survivors",	1,	"-368 0 0",		"144 4 80",		"13680 11132 208" );
make_clip(	"_commonhop_trimescape",	"Survivors",	1,	"-288 -1 0",		"312 5 525",		"14240 11137 208" );

con_comment( "LOGIC:\tTMP shortcut booster clips will be deleted when Scissor Lift is started.\n"
	   + "\tCaution: Do not delete this logic otherwise the clips are gamebreakers." );

make_clip(	"_shortcut_booster_TMP1",	"Survivors",	1,	"-126 -19 0",		"127 20 1048",		"10897 6764 176" );
make_clip(	"_shortcut_booster_TMP2",	"Survivors",	1,	"-24 -303 0",		"24 304 972",		"11032 7048 252" );

EntFire( "washer_lift_button2", "AddOutput", "OnPressed anv_mapfixes_shortcut_booster_TMP*:Kill::0:-1" );

				break;
			}
			if ( g_BaseMode == "survival" )
			{
				devchap( "BASE SURVIVAL" );

				// FIXES

con_comment( "LOGIC:\tGas Station explosion will alternatively start Survival timer." );

EntFire( "gas_explosion_sound_relay", "AddOutput", "OnTrigger director:PanicEvent::2:-1" );

				break;
			}
			if ( g_BaseMode == "scavenge" )
			{
				devchap( "BASE SCAVENGE" );

				// FIXES

				break;
			}

			break;
		}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		case "c8m4_interior":
		{
			g_Chapter = "NO MERCY - HOSPITAL";

			devchap( "ALL MODES" );

			// FIXES_ALL

EntFire( "worldspawn", "RunScriptFile", "c8m4_elevatorfix" );

make_clip(	"_permstuck_cabinetchair",	"Everyone",	1,	"-15 -15 -24",		"15 15 10",		"11935 13061 312" );
make_clip(	"_witch_windows",		"Survivors",	1,	"3 -440 0",		"9 424 64",		"12909 12360 320" );
make_clip(	"_booster_skylights",		"Survivors",	1,	"-256 -88 0",		"256 88 8",		"12550 12112 448" );
make_clip(	"_nav_elevatorbutton",		"Survivors",	1,	"-4 -1 0",		"4 4 86",		"13491 15103 493" );
make_clip( "_counterweight_edging", "Survivors", 1, "-25 -54 -666", "17 56 666", "13144 15243 5526" );

con_comment( "FIX:\tLower and upper elevator doors will no longer break if SI spawn inside them." );

EntFire( "door_elevouterlow", "AddOutput", "wait -1" );
EntFire( "door_elevouterhigh", "AddOutput", "wait -1" );

con_comment( "FIX:\tUpper generator prop made immovable until Survivors reach top of elevator." );

EntFire( "generator01",		"DisableMotion" );
EntFire( "elevator",		"AddOutput",	"OnReachedTop generator01:EnableMotion::0:-1" );

			if ( g_BaseMode == "coop" || g_BaseMode == "realism" )
			{
				devchap( "BASE COOP" );

				// FIXES

				break;
			}
			if ( g_BaseMode == "versus" )
			{
				devchap( "BASE VERSUS" );

				// FIXES

				break;
			}
			if ( g_BaseMode == "survival" )
			{
				devchap( "BASE SURVIVAL" );

				// FIXES

				break;
			}
			if ( g_BaseMode == "scavenge" )
			{
				devchap( "BASE SCAVENGE" );

				// FIXES

				break;
			}

			break;
		}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		case "c8m5_rooftop":
		{
			g_Chapter = "NO MERCY - ROOFTOP";

			devchap( "ALL MODES" );

			// FIXES_ALL

make_clip( "_charger_smoother_01", "Everyone", 1, "-4 -216 -17",	"4 232 1",	"7932 8496 5780",	"46 0 0" );
make_clip( "_charger_smoother_02", "Everyone", 1, "-4 -90 -17",	"4 66 1",	"7804 8058 5780",	"46 0 0" );
make_clip( "_charger_smoother_03", "Everyone", 1, "-4 -90 -17",	"4 274 1",	"7804 8974 5780",	"46 0 0" );
make_clip( "_charger_smoother_04", "Everyone", 1, "-4 -90 -17",	"8 117 1",	"7877 8795 5780",	"46 38.6 0" );
make_clip( "_charger_smoother_05", "Everyone", 1, "-809 -4 -17",	"343 4 1",	"7273 9436 5780",	"0 0 -46" );
make_clip( "_charger_smoother_06", "Everyone", 1, "-809 -4 -17",	"343 4 1",	"7273 7780 5780",	"0 0 46" );
make_clip( "_charger_smoother_07", "Everyone", 1, "-109 -4 -17",	"160 4 1",	"5421 7780 5780",	"0 0 46" );
make_clip( "_charger_smoother_08", "Everyone", 1, "-4 -216 -17",	"4 232 1",	"4996 8496 5780",	"-46 0 0" );
make_clip( "_charger_smoother_09", "Everyone", 1, "-4 -74 -17",	"4 78 1",	"5124 8962 5780",	"-46 0 0" );
make_clip( "_charger_smoother_10", "Everyone", 1, "-4 -74 -17",	"4 78 1",	"5124 8042 5780",	"-46 0 0" );
make_clip( "_charger_smoother_11", "Everyone", 1, "-4 -90 -21",	"8 116 1",	"5049 8798 5780",	"-46 -38.6 0" );
make_clip( "_charger_smoother_12", "Everyone", 1, "-4 -90 -21",	"8 116 1",	"5066 8188 5780",	"-46 38.6 0" );
make_clip( "_charger_smoother_13", "Everyone", 1, "-106 -4 -17",	"160 4 1",	"5418 9228 5780",	"0 0 -46" );
make_clip( "_charger_smoother_14", "Everyone", 1, "-352 -4 -17",	"672 4 1",	"6112 9644 5652",	"0 0 -46" );
make_clip( "_charger_smoother_15", "Everyone", 1, "-4 -22 -17",	"4 22 1",	"6988 9462 5652",	"46 0 0" );
make_clip( "_charger_smoother_16", "Everyone", 1, "-4 -154 -17",	"4 98 1",	"5556 9386 5652",	"-46 0 0" );
make_clip( "_charger_smoother_17", "Everyone", 1, "-4 -138 -17",	"4 116 1",	"5666 9572 5652",	"-46 -52.1 0" );
make_clip( "_charger_smoother_18", "Everyone", 1, "-4 -114 -17",	"4 140 1",	"6897 9557 5652",	"46 52.1 0" );
make_clip( "_charger_smoother_19", "Everyone", 1, "-4 -48 -17",	"4 206 1",	"6988 7570 5652",	"46 0 0" );
make_clip( "_charger_smoother_20", "Everyone", 1, "-4 -114 -17",	"4 140 1",	"6875 7434 5652",	"46 -52.6 0" );
make_clip( "_charger_smoother_21", "Everyone", 1, "-352 -4 -17",	"668 4 1",	"6114 7364 5652",	"0 0 46" );
make_clip( "_charger_smoother_22", "Everyone", 1, "-4 -138 -17",	"4 116 1",	"5649 7449 5652",	"-46 52.6 0" );
make_clip( "_charger_smoother_23", "Everyone", 1, "-4 -108 -17",	"4 146 1",	"5556 7630 5652",	"-46 0 0" );
make_clip( "_charger_smoother_24", "Everyone", 1, "-8 -4 -17",	"8 4 1",	"5816 7780 5780",	"0 0 46" );
make_clip( "_charger_smoother_25", "Everyone", 1, "-8 -4 -17",	"8 4 1",	"5816 9228 5780",	"0 0 -46" );
make_clip( "_charger_smoother_26", "Everyone", 1, "-4 -90 -17",	"8 113 1",	"7861 8193 5780",	"46 -38.6 0" );
make_clip( "_railing_rampright", "Everyone", 1, "-1 -78 0", "1 140 32", "5473 8478 6000", "0 0 45" );
make_clip( "_railing_rampleft", "Everyone", 1, "-1 -78 0", "1 125 32", "5567 8478 6000", "0 0 45" );

			if ( g_BaseMode == "coop" || g_BaseMode == "realism" )
			{
				devchap( "BASE COOP" );

				// FIXES

// Already present in anv_versus.nut just mirroring it here so Coopers can meme, too.

make_ladder( "_ladder_saferoomlulz_cloned_rooftopmain", "5924 8561.1 6018", "13896 2362 -447", "0 90 0", "0 1 0", 0 );

				break;
			}
			if ( g_BaseMode == "versus" )
			{
				devchap( "BASE VERSUS" );

				// FIXES

				break;
			}
			if ( g_BaseMode == "survival" )
			{
				devchap( "BASE SURVIVAL" );

				// FIXES

				break;
			}
			if ( g_BaseMode == "scavenge" )
			{
				devchap( "BASE SCAVENGE" );

				// FIXES

con_comment( "SCAV:\tDeleted named safe door to no longer disconnect tongues when in CHECKPOINT." );

EntFire( "checkpoint_exit", "Kill" );

con_comment( "SCAV:\tSpawned physics clip to prevent can falling through displacement." );

make_clip( "_dispcollision_rooftop", "All and Physics", 1, "-101 -64 0", "160 64 32", "6825 9535 5612", "0 -37.5 0" );

				break;
			}

			break;
		}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	/*==============================
	||                            ||
	||        CRASH COURSE        ||
	||                            ||
	==============================*/

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		case "c9m1_alleys":
		{
			g_Chapter = "CRASH COURSE - THE ALLEYS";

			devchap( "ALL MODES" );

			// FIXES_ALL

make_clip(	"_cliprework_rooftop01",	"Survivors",	1,	"-10 -340 0",		"10 340 600",		"-5434 -9392 336" );
make_clip(	"_cliprework_rooftop02",	"Survivors",	1,	"-580 -10 -130",	"580 10 576",		"-4864 -9722 352" );
make_clip(	"_commonhop_window",		"Survivors",	1,	"-32 -8 0",		"32 8 88",		"-4480 -10632 144" );
make_clip(	"_clipgap_alley",		"Survivors",	1,	"-8 -128 0",		"8 128 700",		"-4295 -8320 256" );
make_clip(	"_curvejump_van",		"Survivors",	1,	"-42 -128 -32",		"42 128 1337",		"-3311 -4407 -345" );
make_clip(	"_cliprework_mirrorwarehouse",	"Everyone",	1,	"-77 -238 0",		"76 248 296",		"-5412 -10506 64" );
make_clip(	"_permstuck_treea",		"Everyone",	1,	"-17 -17 0",		"17 17 128",		"-3520 -4949 -242" );
make_clip(	"_permstuck_treeb",		"Everyone",	1,	"-17 -17 0",		"17 17 128",		"-2656 -4782 -300" );
make_clip(	"_permstuck_treec",		"Everyone",	1,	"-17 -17 0",		"17 17 96",		"-865 -6583 -17" );
make_clip(	"_permstuck_treed",		"Everyone",	1,	"-17 -17 0",		"17 17 96",		"-577 -7055 -23" );
make_clip(	"_curvejump_railing",		"Survivors",	1,	"-100 -17 -64",		"42 17 888",		"-1714 -1650 64" );
make_clip( "_cliprework_noladders", "Survivors", 1, "-8 -176 0", "8 176 72", "-7976 -10924 208" );
make_clip( "_solidify_acunit", "Everyone", 1, "-4 -59 -7", "4 59 136", "-708 -1224 23" );
make_clip( "_commonhop_van", "Survivors", 1, "-114 -54 0", "149 60 773", "-2312 -9675 155", "0 38 0" );
make_clip( "_booster_trafficlighta", "Survivors", 1, "-80 -40 -80", "80 40 698", "-1420 -7002 230" );
make_clip( "_booster_trafficlightb", "Survivors", 1, "-100 -60 -140", "140 40 561", "-1364 -6902 367" );
make_clip( "_booster_trafficlightc", "Survivors", 1, "-42 -140 -80", "10 148 619", "-1094 -6917 309" );
make_clip( "_booster_trafficlightd", "Survivors", 1, "-120 -34 -80", "148 10 619", "-1242 -6515 309" );
make_clip( "_booster_acunit", "Survivors", 1, "-28 -60 -80", "29 60 624", "-1631 -6152 304" );
make_clip( "_booster_brokenframe", "Survivors", 1, "-80 -8 -80", "81 9 514", "-1965 -6409 414" );
make_clip( "_booster_rentsign", "Survivors", 1, "-16 -19 -80", "17 19 637", "-1648 -5552 291" );
make_clip( "_booster_enginecar", "Survivors", 1, "-180 -88 -180", "114 94 463", "-1982 -7055 465" );
make_clip( "_booster_telepole1", "Survivors", 1, "-8 -8 -80", "8 8 234", "-1111 -6480 694" );
make_clip( "_booster_telepole2", "Survivors", 1, "-8 -8 -80", "8 8 464", "50 -5432 464" );
make_clip( "_clipgap_survivoronly", "Survivors", 1, "-100 -24 -80", "108 40 1072", "1428 -4936 -144" );

con_comment( "LOGIC:\tBile anti-skip made 2 breakwalls indestructible until howitzer fires." );

EntFire( "zombie_breakwall01", "AddOutput", "minhealthdmg 2147483647" );
EntFire( "zombie_breakwall09", "AddOutput", "minhealthdmg 2147483647" );
EntFire( "fire_howitzer", "AddOutput", "OnPressed zombie_breakwall01:AddOutput:minhealthdmg 0:0:-1" );
EntFire( "fire_howitzer", "AddOutput", "OnPressed zombie_breakwall09:AddOutput:minhealthdmg 0:0:-1" );

			if ( g_BaseMode == "coop" || g_BaseMode == "realism" )
			{
				devchap( "BASE COOP" );

				// FIXES

				break;
			}
			if ( g_BaseMode == "versus" )
			{
				devchap( "BASE VERSUS" );

				// FIXES

make_clip(	"_allmodes_griefrooma",		"Survivors",	1,	"0 0 0",		"530 126 950",		"156 -6648 -22" );
make_clip(	"_allmodes_griefroomb",		"Survivors",	1,	"0 -770 0",		"130 0 950",		"28 -6652 -22" );

				break;
			}
			if ( g_BaseMode == "survival" )
			{
				devchap( "BASE SURVIVAL" );

				// FIXES

				break;
			}
			if ( g_BaseMode == "scavenge" )
			{
				devchap( "BASE SCAVENGE" );

				// FIXES

				break;
			}

			break;
		}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		case "c9m2_lots":
		{
			g_Chapter = "CRASH COURSE - THE TRUCK DEPOT FINALE";

			devchap( "ALL MODES" );

			// FIXES_ALL

make_clip(	"_commonhop_windowsa",		"Survivors",	1,	"-2 -128 -44",		"2 128 44",		"6850 7040 268" );
make_clip(	"_commonhop_windowsb",		"Survivors",	1,	"-96 -2 -44",		"96 2 44",		"7328 6850 268" );
make_clip(	"_permstuck_treea",		"Everyone",	1,	"-17 -17 0",		"17 17 128",		"973 -1632 -231" );
make_clip(	"_permstuck_treeb",		"Everyone",	1,	"-17 -17 0",		"17 17 128",		"5050.6 2458.2 -106.6" );
make_clip(	"_permstuck_treec",		"Everyone",	1,	"-17 -17 0",		"17 17 128",		"3516 616 -198.6" );
make_clip(	"_permstuck_treed",		"Everyone",	1,	"-17 -17 0",		"17 17 128",		"3845 1192 -141" );
make_clip(	"_permstuck_treee",		"Everyone",	1,	"-17 -17 0",		"17 17 128",		"2257 2997 -70.4" );
make_clip(	"_permstuck_treef",		"Everyone",	1,	"-17 -17 0",		"17 17 128",		"2054 4320 25.8" );
make_clip(	"_permstuck_treeg",		"Everyone",	1,	"-17 -17 0",		"17 17 128",		"6724 7421 62.2" );
make_clip(	"_cliprework_rooftop",		"Survivors",	1,	"-164 -710 0",		"216 600 865",		"4118 886 288" );
make_clip(	"_cliprework_unattackable",	"Survivors",	1,	"-17 -64 0",		"26 64 8",		"6246 1852 29" );
make_clip(	"_cliprework_tracka",		"Survivors",	1,	"-216 -64 0",		"216 3000 950",		"5437 -52 206.3" );
make_clip(	"_cliprework_trackb",		"Survivors",	1,	"-216 -64 0",		"222 3000 777",		"5437.3 5128 385" );
make_clip(	"_clipgap_fence",		"Survivors",	1,	"-32 -4 0",		"32 4 1111",		"5791 8132 65.8" );
make_clip(	"_booster_rollupdoors",		"Survivors",	1,	"-777 -460 0",		"11 299 999",		"6541 5853 250" );
make_clip(	"_booster_rollupdoor",		"Survivors",	1,	"-70 -11 0",		"70 11 888",		"7040 6836 280" );
make_clip(	"_booster_liftframes",		"Survivors",	1,	"-11 -420 0",		"11 90 128",		"7844 6657 371.3" );
make_clip(	"_booster_boxtop",		"Survivors",	1,	"-35 -409 0",		"31 35 169",		"8479 5823 304.9" );
make_clip( "_booster_elecbox", "Survivors", 1, "-4 -20 -80", "4 25 718", "7548 5412 434" );
make_clip( "_booster_ventpipe", "Survivors", 1, "-13 -14 -80", "17 14 657", "7535 6160 495" );
make_clip( "_nav_jump_semitrailer", "Survivors", 1, "-4 -94 0", "4 188 288", "5756 1062 -32" );
make_clip( "_nav_jump_cargowindow", "Survivors", 1, "-5 -85 0", "4 89 86", "2044 3030 49" );
make_clip( "_booster_armoredtop", "Survivors", 1, "-158 -65 0", "172 59 63", "7838 6366 449" );
make_trigmove( "_duckqol_finalevent", "Duck", "0 -32 0", "8 32 1", "7568 7392 447" );

con_comment( "LOGIC:\tFinale switch will re-Lock when all Survivors aren't inside trigger." );

EntFire( "finale_button_unlocker", "AddOutput", "OnEntireTeamEndTouch finaleswitch_initial:Lock::0:-1" );

con_comment( "LOGIC:\tPoint-of-no-return clip will be Enabled when finale switch is full." );

make_clip( "_point_of_no_return", "Survivors", 0, "-16 -169 -168", "58 169 784", "5750 7177 368" );
EntFire( "finaleswitch_initial", "AddOutput", "OnTimeUp anv_mapfixes_point_of_no_return:Enable::0:-1" );

			if ( g_BaseMode == "coop" || g_BaseMode == "realism" )
			{
				devchap( "BASE COOP" );

				// FIXES

				break;
			}
			if ( g_BaseMode == "versus" )
			{
				devchap( "BASE VERSUS" );

				// FIXES

				break;
			}
			if ( g_BaseMode == "survival" )
			{
				devchap( "BASE SURVIVAL" );

				// FIXES

				break;
			}
			if ( g_BaseMode == "scavenge" )
			{
				devchap( "BASE SCAVENGE" );

				// FIXES

				break;
			}

			break;
		}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	/*==============================
	||                            ||
	||         DEATH TOLL         ||
	||                            ||
	==============================*/

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		case "c10m1_caves":
		{
			g_Chapter = "DEATH TOLL - THE TURNPIKE";

			devchap( "ALL MODES" );

			// FIXES_ALL

make_clip(	"_dispcrouch_hardone",		"Everyone",	1,	"-30 -216 -17",		"32 145 180",		"-11790 -12821 -65" );
make_clip(	"_booster_funnel",		"Survivors",	1,	"-32 -32 -64",		"32 32 365",		"-12976 -12262 100" );
make_clip(	"_curvejump_rocky",		"Survivors",	1,	"-32 -128 -80",		"32 128 1001",		"-13152 -11044 60.6" );
make_clip(	"_cliprework_hillside01",	"Survivors",	1,	"-121 -690 -136",	"1456 667 777",		"-11849.1 -10286.1 504.3" );
make_clip(	"_cliprework_hillside02",	"Survivors",	1,	"-264.5 -483 -519.5",	"264.5 483 519.5",	"-10597.5 -10811 848.5" );
make_clip( "_unattackable_tunnelsolidify", "Survivors", 1, "-625 -77 -144", "415 67 784", "-12367 -9747 496" );
make_clip( "_dispcrouch_popular", "Everyone", 1, "-9 -136 0", "8 112 106", "-10569 -11466 -510", "0 28 0" );
make_clip( "_dispcrouch_unknown", "Everyone", 1, "-77 -17 0", "77 11 122", "-10812 -11821 -507", "0 -8 0" );
make_clip( "_dispcrouch_endarea", "Everyone", 1, "-74 -32 -64", "204 42 90", "-11880 -6636 -24", "0 -36 0" );
make_clip( "_cliprework_dispcrouch_1a", "Survivors", 1, "-478 -120 -50", "563 -17 1138", "-13714 -12191 142", "0 -6 0" );
make_clip( "_cliprework_dispcrouch_1b", "Everyone", 1, "-478 -120 -650", "563 -17 -170", "-13714 -12191 142", "0 -6 0" );
make_clip( "_cliprework_dispcrouch_2a", "Survivors", 1, "-478 -120 -50", "563 -17 1138", "-14360 -11744 142", "0 -55 0" );
make_clip( "_cliprework_dispcrouch_2b", "Everyone", 1, "-478 -120 -650", "563 -17 -170", "-14360 -11744 142", "0 -55 0" );
make_clip( "_cliprework_dispcrouch_endarea1", "Everyone", 1, "-448 -55 0", "288 116 182", "-11066 -5132 -84" );
make_clip( "_cliprework_dispcrouch_endarea2", "Everyone", 1, "-98 -16 -90", "304 16 82", "-10896 -5942 5", "0 -7 0" );
make_clip( "_permstuck_endrocktree", "SI Players", 1, "-98 -16 -100", "18 16 17", "-10228 -5209 388", "0 18 0" );
make_clip( "_permstuck_endrockcorner", "Everyone", 1, "-8 -79 -186", "95 130 174", "-11277 -6770 193", "0 -35 0" );
make_clip( "_dispcrouch_endrocktinytop", "Everyone", 1, "-8 -37 0", "8 121 148", "-11216 -6525 62" );
make_clip( "_dispcrouch_endrockparkour", "Everyone", 1, "-8 -116 0", "8 56 115", "-12284 -6439 147", "0 9 0" );

// Not confirmed canon -- but probably.

make_prop( "dynamic", "_crashcourse_armoredvan_glass", "models/props_vehicles/deliveryvan_armored_glass.mdl", "-11274 -15292 -150.2", "14.32 90 -5.15", "shadow_no" );
make_prop( "dynamic", "_crashcourse_armoredvan", "models/props_vehicles/deliveryvan_armored.mdl", "-11274 -15292 -150.2", "14.32 90 -5.15" );

			if ( g_BaseMode == "coop" || g_BaseMode == "realism" )
			{
				devchap( "BASE COOP" );

				// FIXES

				break;
			}
			if ( g_BaseMode == "versus" )
			{
				devchap( "BASE VERSUS" );

				// FIXES

				break;
			}
			if ( g_BaseMode == "survival" )
			{
				devchap( "BASE SURVIVAL" );

				// FIXES

				break;
			}
			if ( g_BaseMode == "scavenge" )
			{
				devchap( "BASE SCAVENGE" );

				// FIXES

				break;
			}

			break;
		}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		case "c10m2_drainage":
		{
			g_Chapter = "DEATH TOLL - THE DRAINS";

			devchap( "ALL MODES" );

			// FIXES_ALL

make_clip(	"_commonhop_cisterntunnela",	"Survivors",	1,	"-17 -80 0",		"17 80 164",		"-9477 -7279 -308" );
make_clip(	"_commonhop_cisterntunnelb",	"Survivors",	1,	"-80 -17 0",		"80 17 164",		"-9872 -6886 -308" );
make_clip(	"_commonhop_bagstoroof",	"Survivors",	1,	"-420 -1600 -100",	"420 171 920",		"-7118 -6111 351" );
make_clip(	"_unattackable_pipea",		"Survivors",	1,	"-80 -4 -56",		"80 669 88",		"-7790 -8110 -388" );
make_clip(	"_unattackable_pipeb",		"Survivors",	1,	"-4 -80 -56",		"669 80 88",		"-8339 -9043 -388" );
make_clip(	"_unattackable_pipec",		"Survivors",	1,	"-4 -80 -56",		"669 80 88",		"-9144 -9043 -388" );
make_clip( "_nav_electricalbox", "Survivors", 1, "-6 -30 0", "3 27 172", "-10806 -8537 -347", "0 -45 0" );
make_clip( "_unattackable_debrisfall", "Survivors", 1, "-119 -137 0", "74 113 12", "-9870 -8168 -180" );
make_clip( "_cliprework_cisternroof", "Survivors", 1, "-124 -136 12", "132 120 22", "-9860 -7288 -98" );
make_clip( "_cliprework_endrooftop1", "Survivors", 1, "-270 -550 -151", "270 514 662", "-6448 -6730 620" );
make_clip( "_cliprework_endrooftop2", "Survivors", 1, "-8 -366 0", "8 318 1026", "-7500 -5634 256" );
make_clip( "_nav_cistern_anomaly", "Survivors", 1, "-17 -6 0", "11 4 127", "-9859 -7064 -221" );
make_clip( "_nav_cistern_highpipe1", "Survivors", 1, "-23 -56 0", "23 56 97", "-9935 -6961 -191" );
make_clip( "_nav_cistern_highpipe2", "Survivors", 1, "-21 -60 0", "29 59 75", "-9812 -6957 -169" );
make_clip( "_nav_cistern_highpipe3", "Survivors", 1, "-42 -16 0", "39 16 83", "-9533 -7217 -169" );
make_clip( "_nav_cistern_tunnelexit", "Survivors", 1, "-80 -11 0", "82 13 125", "-9872 -7669 -219" );
make_clip( "_nav_cistern_angpipe1", "Survivors", 1, "-31 -93 0", "20 128 135", "-9988 -7555 -229", "0 -20 0" );
make_clip( "_nav_cistern_angpipe2", "Survivors", 1, "-31 -93 0", "20 128 135", "-10155 -7450 -229", "0 -60 0" );
make_clip( "_nav_cistern_angpipe3", "Survivors", 1, "-31 -93 0", "20 128 135", "-10166 -7137 -229", "0 -110 0" );
make_clip( "_nav_cistern_angpipe4", "Survivors", 1, "-31 -93 0", "20 128 135", "-9723 -6991 -229", "0 -195 0" );
make_clip( "_nav_cistern_angpipe5", "Survivors", 1, "-31 -93 0", "20 128 135", "-9727 -7542 -229", "0 -150 0" );
make_clip( "_ledgehang_endsaferoof", "Survivors", 1, "-279 -66 0", "231 66 93", "-8361 -5553 131" );
make_clip( "_smoother_pipes1", "Everyone", 1, "-640 -2 -28", "204 2 32", "-8712 -7404 -609", "-19 0 36" );
make_clip( "_smoother_pipes2", "Everyone", 1, "-640 -2 -28", "204 2 32", "-8712 -7159 -615", "-19 0 -36" );
make_clip( "_smoother_pipes3", "Everyone", 1, "-207 -2 -28", "243 2 32", "-8307 -7154.5 -541", "0 0 -36" );
make_clip( "_chargerassist_eventbutton", "Survivors", 1, "-82 -16 0", "82 64 100", "-8706 -7744 -308" );
make_clip( "_chargerassist_footlocker", "Survivors", 1, "-64 -82 0", "8 82 100", "-8992 -8554 -308" );
make_clip( "_grating_smoothera", "Everyone", 1, "-326 -450 -2", "0 0 1", "-8642 -7855 -528.613" );
make_clip( "_grating_smootherb", "Everyone", 1, "-326 -495 -2", "-45 -450 1", "-8642 -7855 -528.613" );

			if ( g_BaseMode == "coop" || g_BaseMode == "realism" )
			{
				devchap( "BASE COOP" );

				// FIXES

				break;
			}
			if ( g_BaseMode == "versus" )
			{
				devchap( "BASE VERSUS" );

				// FIXES

make_clip( "_shortcut_commonhop", "Survivors", 1, "-25 69 -89", "-22 73 91", "-8050 -8422 -487" );

make_clip(	"_bunnyhop_endwindow",		"Survivors",	1,	"-606 -7 0",		"100 7 128",		"-7998 -6007 -48" );
make_clip(	"_commonhop_pipe",		"Survivors",	1,	"-4 -104 -56",		"4 104 56",		"-8044 -7280 -408" );
make_clip( "_cliprework_commonhop", "Survivors", 1, "-172 -8 -44", "172 8 44", "-6452 -6008 136" );

				break;
			}
			if ( g_BaseMode == "survival" )
			{
				devchap( "BASE SURVIVAL" );

				// FIXES

				break;
			}
			if ( g_BaseMode == "scavenge" )
			{
				devchap( "BASE SCAVENGE" );

				// FIXES

				break;
			}

			break;
		}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		case "c10m3_ranchhouse":
		{
			g_Chapter = "DEATH TOLL - THE CHURCH";

			devchap( "ALL MODES" );

			// FIXES_ALL

make_clip(	"_commonhop_saferoom",		"Survivors",	1,	"-576 -2892 -165",	"576 368 1000",		"-8080 -5684 421" );
make_clip(	"_commonhop_traintoroof",	"Survivors",	1,	"-789 -626 -165",	"744 762 994",		"-12000 -8094 286" );
make_clip(	"_commonhop_stationroof",	"Survivors",	1,	"-184 -430 -200",	"174 380 470",		"-12632 -6040 500" );
make_clip(	"_dispcrouch_flatcartunnel",	"Everyone",	1,	"-100 -38 -64",		"38 38 256",		"-12534 -3574 -36" );
make_clip(	"_holdoutsafe_cabinmountain",	"Survivors",	1,	"-340 -50 -245",	"340 50 1122",		"-7518 -2770 307" );
make_clip(	"_cliprework_watchtower",	"Survivors",	1,	"0 -358 0",		"358 0 180",		"-10438 -6325 542" );
make_clip(	"_cliprework_rockcliff01",	"Survivors",	1,	"-600 -160 -592",	"911 160 592",		"-6272 -2688 848" );
make_clip(	"_cliprework_roadblock",	"Survivors",	1,	"-45 -1200 0",		"45 455 512",		"-4585 -944 496" );
make_clip(	"_cliprework_churchlonga",	"Survivors",	1,	"-45 -9 -555",		"2310 9 944",		"-4533 -503 496" );
make_clip(	"_cliprework_rockcliff02",	"Survivors",	1,	"-145 -360 -420",	"180 216 592",		"-7043 -3005 848" );
make_clip(	"_cliprework_churchlongb",	"Survivors",	1,	"-9 -45 -369",		"9 2400 1166",		"-2232 -467 290" );
make_clip(	"_clipextend_trainstationa",	"Survivors",	1,	"-24 -1300 0",		"24 1300 640",		"-12811 -7486 344" );
make_clip(	"_clipextend_trainstationb",	"Survivors",	1,	"-1200 -9 0",		"216 77 690",		"-13001 -5725.4 344" );
make_clip( "_dipscrouch_multicliff", "Everyone", 1, "-487 -60 -100", "86 4 39", "-13282 -3756 240", "0 43 0" );
make_clip( "_cliprework_church01", "Survivors", 1, "-260 -169 -80", "286 9 864", "-3070 25 576" );
make_clip( "_cliprework_church02", "Survivors", 1, "-618 -80 -80", "486 32 864", "-2710 1072 576" );
make_clip( "_cliprework_church03", "Survivors", 1, "-554 -102 -80", "486 62 864", "-3798 930 576" );
make_clip( "_cliprework_church04", "Survivors", 1, "-218 -102 -80", "206 250 864", "-4538 578 576" );
make_clip( "_cliprework_church05", "Survivors", 1, "-430 -10 -80", "206 10 864", "-4962 712 576" );
make_clip( "_cliprework_church06", "Survivors", 1, "-10 -545 -80", "10 430 864", "-5528 137 576" );
make_clip( "_cliprework_church07", "Survivors", 1, "-180 -9 -80", "80 9 864", "-3390 -135 576" );
make_clip( "_cliprework_church08", "Survivors", 1, "-100 -100 -80", "100 0 864", "-5492 667 576", "0 45 0" );
make_clip( "_cliprework_church09", "Survivors", 1, "-40 -175 -80", "20 175 864", "-3612 -319 576", "0 -24 0" );
make_clip( "_cliprework_church10", "Survivors", 1, "-80 -490 -80", "32 486 864", "-2256 506 576" );
make_clip( "_cliprework_church11", "Survivors", 1, "-144 -160 -80", "144 160 704", "-2928 448 736" );
make_clip( "_cliprework_church12", "Survivors", 1, "-226 -284 -80", "222 420 704", "-2558 220 736" );
make_clip( "_cliprework_corner1", "Survivors", 1, "-487 -60 39", "86 4 784", "-13282 -3756 240", "0 43 0" );
make_clip( "_cliprework_corner2", "Survivors", 1, "-550 -60 -17", "711 4 784", "-12651 -3566 400", "0 14 0" );
make_clip( "_tankpunch_booster", "Survivors", 1, "-8 -302 -110", "158 960 1322", "-8838 -4633 124", "0 51 0" );
make_clip( "_permstuck_triplerock", "Everyone", 1, "-78 -86 -80", "88 96 32", "-9539 -4313 16", "0 41 0" );
make_clip( "_cliprework_vulnerable", "Survivors", 1, "-1085 -16 -90", "1048 16 1192", "-8709 -3352 269", "0 34 0" );
make_clip( "_cliprework_churchwindows", "Survivors", 1, "-4 -120 0", "4 120 100", "-2372 192 194" );
make_clip( "_clipextend_padlockgate", "Survivors", 1, "-14 -311 0", "14 405 1102", "-8594 -5033 344" );
make_clip( "_permstuck_openedrockcliff", "SI Players", 1, "-17 -17 0", "17 17 32", "-9247 -3950 412" );
make_clip( "_permstuck_fatcliffladder1", "SI Players", 1, "-17 -34 0", "17 17 32", "-8302 -3322 383" );
make_clip( "_permstuck_fatcliffladder2", "SI Players", 1, "-17 -34 0", "17 17 32", "-8224 -3527 378" );
make_clip( "_chargerassist_brokenwall", "Survivors", 1, "-128 0 0", "128 64 275", "-2480 1104 221" );
make_clip( "_booster_watertowerclip", "Survivors", 1, "-538 -16 0", "348 66 900", "-6472 -871 1024", "0 15 0" );

			if ( g_BaseMode == "coop" || g_BaseMode == "realism" )
			{
				devchap( "BASE COOP" );

				// FIXES

				break;
			}
			if ( g_BaseMode == "versus" )
			{
				devchap( "BASE VERSUS" );

				// FIXES

make_clip( "_cliprework_smokertrolling", "Survivors", 1, "-207 -21 0", "219 8 259", "-11857 -5323 85" );

				break;
			}
			if ( g_BaseMode == "survival" )
			{
				devchap( "BASE SURVIVAL" );

				// FIXES

				break;
			}
			if ( g_BaseMode == "scavenge" )
			{
				devchap( "BASE SCAVENGE" );

				// FIXES

				break;
			}

			break;
		}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		case "c10m4_mainstreet":
		{
			g_Chapter = "DEATH TOLL - THE TOWN";

			devchap( "ALL MODES" );

			// FIXES_ALL

make_clip(	"_commonhop_bankwindow",	"Survivors",	1,	"-120 -5 0",		"120 17 1612",		"-672 -4351 176" );
make_clip(	"_cliprework_church",		"Survivors",	1,	"-256 -16 -164",	"256 16 1040",		"-3010 30 720.9" );
make_clip(	"_cliprework_buses",		"Survivors",	1,	"-160 -6 -164",		"160 6 620",		"-1437 -461 1124" );
make_clip(	"_cliprework_houses01",		"Survivors",	1,	"-8 -80 -0",		"8 80 1221",		"744 -324 512" );
make_clip(	"_cliprework_houses02",		"Survivors",	1,	"-100 -8 -170",		"100 8 1221",		"854 -272 512" );
make_clip(	"_cliprework_houses03",		"Survivors",	1,	"-100 -8 -100",		"100 8 1221",		"1400 -158 512" );
make_clip(	"_cliprework_houses04",		"Survivors",	1,	"-32 -8 -70",		"32 8 1221",		"1993 -254 512" );
make_clip(	"_cliprework_houses05",		"Survivors",	1,	"-400 -8 -150",		"32 216 1221",		"2883 -465 602" );
make_clip( "_dispcrouch_spawn", "Everyone", 1, "-140 -32 -64", "100 32 90", "-4294 -1729 -2", "0 -5 0" );
make_clip( "_cliprework_unattackable", "Survivors", 1, "-8 -396 -164", "24 216 850", "-1608 -2368 884" );
make_clip( "_cliprework_electricalbox", "Survivors", 1, "-6 -33 0", "5 25 406", "2667 -1769 164" );
make_clip( "_cliprework_windows", "Survivors", 1, "-16 -304 -20", "0 288 68", "2688 -2136 372" );
make_clip( "_cliprework_balcony", "Survivors", 1, "-86 -50 0", "84 46 1392", "2822 -1694 336" );
make_clip( "_cliprework_awning", "Survivors", 1, "-68 -103 -68", "43 107 1431", "2885 -1580 297" );
make_trighurt( "_instakill_deathcharger", "Survivor", "-256 -453 -17", "256 453 0", "-2449 122 -43" );
patch_spawninfront( "288 -5284 93", "0 -96 0", "544 96 17" );

			if ( g_BaseMode == "coop" || g_BaseMode == "realism" )
			{
				devchap( "BASE COOP" );

				// FIXES

				break;
			}
			if ( g_BaseMode == "versus" )
			{
				devchap( "BASE VERSUS" );

				// FIXES

make_clip( "_cliprework_trucknuke", "Survivors", 1, "-180 -60 -2", "115 60 1624", "693 -1867 105", "0 43 0" );

make_clip( "_cliprework_eventskip1", "Survivors", 1, "-55 -1 0", "58 1 1588", "852 -2433 140" );
make_clip( "_cliprework_eventskip2", "Survivors", 1, "-209 -2 0", "192 2 1588", "661 -2569 140", "0 45 0" );
make_clip( "_cliprework_eventskip3", "Survivors", 1, "-156 -1 0", "141 1 1588", "372 -2717 140" );
make_clip( "_cliprework_eventskip4", "Survivors", 1, "-26 -59 0", "-24 41 1588", "242 -2757 140" );

				break;
			}
			if ( g_BaseMode == "survival" )
			{
				devchap( "BASE SURVIVAL" );

				// FIXES

make_clip( "_booster_eatsign", "Survivors", 1, "-10 -64 -48", "10 69 1442", "-1649 -3723 293" );

				break;
			}
			if ( g_BaseMode == "scavenge" )
			{
				devchap( "BASE SCAVENGE" );

				// FIXES

				break;
			}

			break;
		}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		case "c10m5_houseboat":
		{
			g_Chapter = "DEATH TOLL - BOAT HOUSE FINALE";

			devchap( "ALL MODES" );

			// FIXES_ALL

make_clip(	"_cliprework_startarea02",	"Survivors",	1,	"-1500 -16 -124",	"1500 16 880",		"2738 3824 412" );
make_clip(	"_cliprework_startarea01",	"Survivors",	1,	"-16 -1080 -216",	"16 0 700",		"1311.5 3785 596" );
make_clip(	"_cliprework_startarea03",	"Survivors",	1,	"-16 -1710 -450",	"16 0 500",		"4250 3811 792" );
make_clip( "_permstuck_cornertree", "SI Players", 1, "-17 -17 -17", "17 17 17", "4414.32 1858 17" );
make_clip( "_solidify_railposta", "Everyone", 1, "-6 -2 0", "6 2 33.8", "3924 -4516 -24" );
make_clip( "_solidify_railpostb", "Everyone", 1, "-6 -2 0", "6 2 33.8", "4020 -4516 -24" );
make_clip( "_solidify_railpostc", "Everyone", 1, "-2 -6 0", "2 6 33.8", "4116 -4228 -24" );
make_clip( "_solidify_railpostd", "Everyone", 1, "-2 -6 0", "2 6 33.8", "4116 -4132 -24" );
make_clip( "_solidify_railposte", "Everyone", 1, "-2 -6 0", "2 6 33.8", "4116 -4036 -24" );
make_clip( "_solidify_railpostf", "Everyone", 1, "-6 -2 0", "6 2 33.8", "4020 -3940 -24" );
make_clip( "_commonhop_backyard1", "Survivors", 1, "-1 -315 0", "1 315 922", "2689 2237 347" );
make_clip( "_commonhop_backyard2", "Survivors", 1, "-502 94 -180", "511 96 922", "2179 2456 360" );
make_clip( "_commonhop_backyard3", "Survivors", 1, "-242 94 -180", "146 96 922", "1505 2509 360", "0 -24 0" );
make_clip( "_commonhop_backyard4", "Survivors", 1, "-43 -54 -1", "34 28 1", "2175 2582 219" );
make_clip( "_nav_rockcliff_complete", "Survivors", 1, "-96 -348 -440", "15 276 1058", "6430 -4504 222", "0 6 0" );
make_clip( "_permstuck_rockclipwedge", "Survivors", 1, "-44 -246 -111", "38 166 1037", "1386 -4758 -161" );

// Not confirmed canon. Drainage fence or ranchhouse padlock are equally open-ended.

make_prop( "dynamic",		"_laststand_truck",		"models/props_vehicles/pickup_truck_2004.mdl",		"1261.08 1237.97 -207.962",		"3.2 191.071 3.5",			"shadow_yes",	"solid_yes",	"67 108 112" );
make_prop( "dynamic",		"_laststand_truckglass",	"models/props_vehicles/pickup_truck_2004_glass.mdl",		"1261.08 1237.97 -207.962",		"3.2 191.071 3.5",			"shadow_no",	"solid_yes",	"67 108 112" );
make_prop( "dynamic",		"_laststand_ammocan1",		"models/props/de_prodigy/ammo_can_02.mdl",		"1345.13 1232.73 -158.673",		"-1.487 280.487 1.214" );
make_prop( "dynamic",		"_laststand_ammocan2",		"models/props/de_prodigy/ammo_can_02.mdl",		"1337.56 1234.67 -164.912",		"-1.487 280.487 1.214" );
make_prop( "dynamic",		"_laststand_oldmanmurray",	"models/props_crates/static_crate_40.mdl",		"1310 1260.02 -166.166",		"1.214 190.519 1.488" );
make_prop( "dynamic",		"_laststand_ammocan3",		"models/props/de_prodigy/ammo_can_02.mdl",		"1305.72 1280.81 -142.713",		"1.188 191.518 85.509" );
make_prop( "dynamic",		"_laststand_lantern",		"models/props_unique/spawn_apartment/lantern.mdl",		"1340 1251 -163.04",		"1.201 191.019 3.498",			"shadow_no",	"solid_no" );

// The only finale without a one-way point-of-no-return... until now! (No delay needed for this trigger_finale inject)

con_comment( "LOGIC:\tRockslide and point-of-no-return entities will spawn when finale is started." );

function c10m5_rockslide()
{
	make_prop( "dynamic", "_rockslide_permtree", "models/props_foliage/trees_cluster01.mdl", "4220 -314 -221.9", "-11.9 255.7 -2.05", "shadow_no" );

	make_prop( "dynamic", "_rockslide_static_1a", "models/props/cs_militia/militiarock01.mdl", "4759 169 -96.8125", "18.3691 139.3506 313.0225", "shadow_no", "solid_yes", "255 255 255" );
	make_prop( "dynamic", "_rockslide_static_1b", "models/props/cs_militia/militiarock01.mdl", "4378.5313 -104.9063 -86.4063", "348.2227 79.4092 234.6680", "shadow_no", "solid_yes", "222 222 222" );
	make_prop( "dynamic", "_rockslide_static_1c", "models/props/cs_militia/militiarock01.mdl", "4480.125 -2.7188 -149.9375", "2.6807 26.7188 148.2275", "shadow_no", "solid_yes", "177 177 177" );
	make_prop( "dynamic", "_rockslide_static_2a", "models/props/cs_militia/militiarock02.mdl", "4606.125 98.625 -81.7813", "321.9873 261.167 46.4941", "shadow_no", "solid_yes", "255 255 255" );
	make_prop( "dynamic", "_rockslide_static_2b", "models/props/cs_militia/militiarock02.mdl", "4494.4688 -23.4688 -136.5", "10.415 39.7266 329.0625", "shadow_no", "solid_yes", "222 222 222" );
	make_prop( "dynamic", "_rockslide_static_2c", "models/props/cs_militia/militiarock02.mdl", "4450.1875 -119.8125 -83.0938", "342.1143 278.4375 110.7861", "shadow_no", "solid_yes", "177 177 177" );

	//make_navblock( "_rockslide_navblockera", "Everyone", "Apply", "-1116 -128 -216", "0 128 666", "5194 245 -216" );
	//make_navblock( "_rockslide_navblockerb", "Everyone", "Apply", "-128 -845 -216", "128 500 666", "3950 -127 -216" );
	//make_navblock( "_rockslide_navblockerc", "Everyone", "Apply", "-1337 -32 -216", "216 64 666", "6310 501 -216" );

	make_clip( "_rockslide_survivorclipa", "Survivors", 1, "-572 -120 0", "399 -100 1100", "4455 -54 -224", "0 35 0" );
	make_clip( "_rockslide_survivorclipb", "Survivors", 1, "-17 -17 -17", "17 17 17", "4187 -415 -153" );
	make_clip( "_rockslide_survivorclipc", "Everyone", 1, "-17 -17 -17", "17 17 17", "4226 -192 -132" );

	make_trighurt( "_rockslide_trighurta", "Infected", "-128 -116 0", "148 96 225", "4417 -83 -221" );
	make_trighurt( "_rockslide_trighurtb", "Infected", "-128 -116 0", "148 96 225", "4667 157 -221" );

	EntFire( g_UpdateName + "_rockslide_trighurt*", "Kill", "", 1 );
}

EntFire( "trigger_finale", "AddOutput", "UseStart worldspawn:CallScriptFunction:c10m5_rockslide:0:-1" );

			if ( g_BaseMode == "coop" || g_BaseMode == "realism" )
			{
				devchap( "BASE COOP" );

				// FIXES

				break;
			}
			if ( g_BaseMode == "versus" )
			{
				devchap( "BASE VERSUS" );

				// FIXES

make_clip(	"_indoor_roof",			"Survivors",	1,	"-60 -84 -28",		"60 84 28",		"2244 4076 100" );

				break;
			}
			if ( g_BaseMode == "survival" )
			{
				devchap( "BASE SURVIVAL" );

				// FIXES

make_clip( "_survival_docksrocks", "Survivors", 1, "-78 -161 0", "87 153 1462", "2201 -4720 -174", "0 24 0" );

				break;
			}
			if ( g_BaseMode == "scavenge" )
			{
				devchap( "BASE SCAVENGE" );

				// FIXES

				break;
			}

			break;
		}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	/*==============================
	||                            ||
	||          DEAD AIR          ||
	||                            ||
	==============================*/

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		case "c11m1_greenhouse":
		{
			g_Chapter = "DEAD AIR - THE GREENHOUSE";

			devchap( "ALL MODES" );

			// FIXES_ALL

make_clip(	"_oddhang_electricalbox",	"Survivors",	1,	"-8 -376 -466",		"0 0 174",		"3338 1147 466" );
make_clip(	"_ladderqol_electricalbox",	"SI Players",	1,	"-6 -60 -536",		"0 6 104",		"3340 1151 536" );
make_clip(	"_cliprework_stunfall",		"Survivors",	1,	"-96 -8 -400",		"96 8 1337",		"2464 784 409" );
make_clip(	"_stunfall_jeep",		"Survivors",	1,	"-8 -177 0",		"8 177 1724",		"4669 1491 8" );
make_clip(	"_cliprework_nopedocks01",	"Survivors",	1,	"-4155 -8 0",		"6600 8 1700",		"4221.4 -1175 16" );
make_clip(	"_tankpunch_escapeladder",	"Survivors",	1,	"-48 -88 0",		"48 88 1470",		"3412 -932 259" );
make_clip(	"_cliprework_nopedocks02",	"Survivors",	1,	"-8 -64 0",		"8 64 1818",		"2312 -1141 16" );
make_clip(	"_cliprework_unattackable",	"Survivors",	1,	"-160 -600 0",		"160 600 1818",		"7188.6 -601.2 16" );
make_clip( "_stunfall_lamp", "Survivors", 1, "-888 0 0", "979 17 1724", "5549 1313 8" );
make_clip( "_outtabounds_ledge", "Survivors", 1, "-148 -145 0", "100 141 1100", "2700 649 640" );
make_trighurt( "_instakill_thankyoufailzz", "Survivor", "-2828 -46 -149", "1881 225 0", "5148 -1121 165" );

			if ( g_BaseMode == "coop" || g_BaseMode == "realism" )
			{
				devchap( "BASE COOP" );

				// FIXES

				break;
			}
			if ( g_BaseMode == "versus" )
			{
				devchap( "BASE VERSUS" );

				// FIXES

make_clip(	"_commonhop_greenhouse",	"Survivors",	1,	"0 -320 -176",		"3 240 690",		"5226 -752 1023" );
make_clip( "_cliprework_endpassage", "Survivors", 1, "-6 -224 0", "6 224 78", "4858 2552 274" );

				break;
			}
			if ( g_BaseMode == "survival" )
			{
				devchap( "BASE SURVIVAL" );

				// FIXES

				break;
			}
			if ( g_BaseMode == "scavenge" )
			{
				devchap( "BASE SCAVENGE" );

				// FIXES

				break;
			}

			break;
		}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		case "c11m2_offices":
		{
			g_Chapter = "DEAD AIR - THE CRANE";

			devchap( "ALL MODES" );

			// FIXES_ALL

make_clip(	"_fallrevive_nopejumpa",	"Survivors",	1,	"-383 -8 0",		"2490 8 1400",		"6142 2312 9" );
make_clip(	"_fallrevive_nopejumpb",	"Survivors",	1,	"-8 -512 0",		"8 512 1400",		"8648 2672 16" );
make_clip(	"_permstuck_officechairs",	"Everyone",	1,	"-11 -11 -11",		"11 11 11",		"8865 4003 252" );
make_clip(	"_nav_craneledge",		"Survivors",	1,	"-17 0 -1",		"29 4 77",		"6117 3856 646" );
make_trighurt( "_instakill_semitrailer", "Survivor", "-269 -117 0", "273 121 8", "6854 2779 173" );

make_prop( "dynamic", "_omg_valve_wrongwayc", "models/props_vehicles/van.mdl", "8815 2888 10", "0 45 3", "shadow_no" );
make_prop( "dynamic", "_omg_valve_wrongwayg", "models/props_vehicles/van_glass.mdl", "8815 2888 10", "0 45 3", "shadow_no" );

			if ( g_BaseMode == "coop" || g_BaseMode == "realism" )
			{
				devchap( "BASE COOP" );

				// FIXES

				break;
			}
			if ( g_BaseMode == "versus" )
			{
				devchap( "BASE VERSUS" );

				// FIXES

// Piggyback on Survivor-filtered trigger that ready-ups end car alarm.

con_comment( "LOGIC:\tAnti-shortcut trighurts will be deleted when a Survivor exits final office stairwell." );

make_trighurt( "_finalstreet_trighurta", "Survivor", "-879 -112 0", "603 48 17", "9071 3888 196" );
make_trighurt( "_finalstreet_trighurtb", "Survivor", "-1753 -823 0", "59 935 32", "8261 4759 196" );
make_trighurt( "_finalstreet_trighurtc", "Survivor", "-781 -361 0", "359 599 32", "9101 4969 196" );
DoEntFire( "!self", "AddOutput", "OnTrigger anv_mapfixes_finalstreet_trighurt*:Kill::0:-1", 0.0, null, Entities.FindByClassnameNearest( "trigger_once", Vector( 8616, 4320, 140 ), 1 ) );

				break;
			}
			if ( g_BaseMode == "survival" )
			{
				devchap( "BASE SURVIVAL" );

				// FIXES

make_clip( "_survival_electricgod", "Survivors", 1, "-40 -28 0", "79 43 273", "8328 3196 783" );

				break;
			}
			if ( g_BaseMode == "scavenge" )
			{
				devchap( "BASE SCAVENGE" );

				// FIXES

				break;
			}

			break;
		}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		case "c11m3_garage":
		{
			g_Chapter = "DEAD AIR - THE CONSTRUCTION SITE";

			devchap( "ALL MODES" );

			// FIXES_ALL

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

			if ( g_BaseMode == "coop" || g_BaseMode == "realism" )
			{
				devchap( "BASE COOP" );

				// FIXES

				break;
			}
			if ( g_BaseMode == "versus" )
			{
				devchap( "BASE VERSUS" );

				// FIXES

make_clip(	"_booster_windows",		"Survivors",	1,	"-6 -80 0",		"6 80 128",		"-3082 3152 160" );
make_clip(	"_bunnyhop_windows",		"Survivors",	1,	"-6 -180 0",		"6 180 128",		"-2954 1393 160" );

				break;
			}
			if ( g_BaseMode == "survival" )
			{
				devchap( "BASE SURVIVAL" );

				// FIXES

				break;
			}
			if ( g_BaseMode == "scavenge" )
			{
				devchap( "BASE SCAVENGE" );

				// FIXES

				break;
			}

			break;
		}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		case "c11m4_terminal":
		{
			g_Chapter = "DEAD AIR - THE TERMINAL";

			devchap( "ALL MODES" );

			// FIXES_ALL

make_clip(	"_conveyorvent_upper",		"Survivors",	1,	"-8 -32 -32",		"8 32 32",		"632 928 368" );
make_clip(	"_conveyorvent_lower",		"Survivors",	1,	"0 -32 -32",		"8 32 32",		"712 928 160" );
make_clip(	"_permstuck_ladderqol",		"SI Players",	1,	"-21 -21 -12",		"21 21 12",		"580 3565 524" );
make_clip(	"_booster_atlaswon",		"Survivors",	1,	"-600 -600 0",		"600 600 8",		"1978.4 1555.4 448" );
make_clip(	"_booster_drophole",		"Survivors",	1,	"-120 -190 0",		"120 24 8",		"-15 5336 512" );
make_clip(	"_booster_barbyoutcrop",	"Survivors",	1,	"-105 -38 0",		"24 38 400",		"302 4460 488" );
make_clip(	"_booster_skylight",		"Survivors",	1,	"-420 -700 0",		"420 700 216",		"-39 4459 763" );
make_clip(	"_booster_vent",		"Survivors",	1,	"-42 -24 -29",		"254 24 31",		"386 4112 241" );
make_clip(	"_booster_bannerb",		"Survivors",	1,	"-42 -2 -32",		"42 2 256",		"-200 4163 600" );
make_clip(	"_booster_bannera",		"Survivors",	1,	"-42 -2 -32",		"42 2 365",		"-200 4674 472" );
make_clip(	"_booster_pipea",		"Survivors",	1,	"-11 -7 -32",		"24 24 216",		"302 5096 519" );
make_clip(	"_booster_pipeb",		"Survivors",	1,	"-12 -7 -32",		"24 29 216",		"302 3801 519" );
make_clip( "_chairbodypile_smoother", "Everyone", 1, "-50 -25 0", "25 40 8", "500 5301 295", "10 0 -15" );
make_clip( "_hallwayguard_right", "Everyone", 1, "-14 15 0", "9 16 128", "693 5566.3 296", "0 45 0" );
make_clip( "_hallwayguard_left", "Everyone", 1, "-9 16 0", "14 15 128", "667.5 5679.3 296", "0 -45 0" );

make_prop( "dynamic", "_cosmetic_wallpaper", "models/props_unique/zombiebreakwallexteriorairport01_main.mdl", "2507.95 3263.99 216", "0 180 0", "shadow_no" );
make_prop( "dynamic", "_cosmetic_wallblock", "models/props_unique/zombiebreakwallhospitalexterior01_main.mdl", "2507.99 3263.99 252", "0 180 0", "shadow_no" );
EntFire( g_UpdateName + "_cosmetic_wallblock", "Skin", 5 );

// These are parented so it's necessary to fix func_rotating first then beam_spotlight.

con_comment( "LIGHTS:\tMetal detector spotlight was never moved for L4D2's port -- but it's fixed now!" );

EntFire( "securityrotator1",	"AddOutput",	"origin 1025.7 1750.9 125.456",		0 );
EntFire( "securityspotlight1",	"AddOutput",	"origin 1025.7 1750.9 125.456",		1 );

			if ( g_BaseMode == "coop" || g_BaseMode == "realism" )
			{
				devchap( "BASE COOP" );

				// FIXES

patch_spawninfront( "2552 4080 152", "0 -16 0", "614 16 244" );

				break;
			}
			if ( g_BaseMode == "versus" )
			{
				devchap( "BASE VERSUS" );

				// FIXES

patch_spawninfront( "2552 4080 152", "0 -16 0", "614 16 244" );

make_clip( "_altpath_escalator", "Survivors", 1, "-37 -6 -35", "25 6 175", "2289 1737 51", "0 0 -2.5" );

				break;
			}
			if ( g_BaseMode == "survival" )
			{
				devchap( "BASE SURVIVAL" );

				// FIXES

				break;
			}
			if ( g_BaseMode == "scavenge" )
			{
				devchap( "BASE SCAVENGE" );

				// FIXES

				break;
			}

			break;
		}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		case "c11m5_runway":
		{
			g_Chapter = "DEAD AIR - RUNWAY FINALE";

			devchap( "ALL MODES" );

			// FIXES_ALL

make_clip( "_lowthinwing_collision", "Everyone", 1, "-8 -116 -30", "8 111 32", "-6057 9725 -12" );
make_clip( "_nav_skybridge", "Survivors", 1, "-643 -102 0", "878 106 1427", "-6035 8761 32", "0 45 0" );
make_clip( "_nav_firering_cheese", "Survivors", 1, "-24 -86 0", "17 126 1632", "-3408 9155 -192" );
make_clip( "_planecrash_concreteramp", "SI Players", 1, "-290 -10 0", "345 10 185", "-4127 11223 -128", "0 -56 45" );

make_prop( "dynamic", "_terry", "models/deadbodies/dead_male_civilian_body.mdl", "-4154 9350 -140", "0 -111 0", "shadow_no", "solid_no" );
EntFire( "relay_outro_start", "AddOutput", "OnTrigger anv_mapfixes_terry:Kill::2:-1" );

			if ( g_BaseMode == "coop" || g_BaseMode == "realism" )
			{
				devchap( "BASE COOP" );

				// FIXES

				break;
			}
			if ( g_BaseMode == "versus" )
			{
				devchap( "BASE VERSUS" );

				// FIXES

				break;
			}
			if ( g_BaseMode == "survival" )
			{
				devchap( "BASE SURVIVAL" );

				// FIXES

				break;
			}
			if ( g_BaseMode == "scavenge" )
			{
				devchap( "BASE SCAVENGE" );

				// FIXES

				break;
			}

			break;
		}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	/*==============================
	||                            ||
	||       BLOOD HARVEST        ||
	||                            ||
	==============================*/

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		case "c12m1_hilltop":
		{
			g_Chapter = "BLOOD HARVEST - THE WOODS";

			devchap( "ALL MODES" );

			// FIXES_ALL

make_clip(	"_curvejump_fence",		"Survivors",	1,	"-1024 -51 -90",	"120 51 777",		"-10342 -8897 517" );
make_clip(	"_cliprework_unattackable",	"Survivors",	1,	"-112 -192 -335",	"0 274 1024",		"-8080 -8448 880.6" );
make_clip( "_permstuck_treeandrock", "Everyone", 1, "-19 -22 0", "26 32 46", "-11270 -9471 447" );
make_clip( "_tankpunch_deflector", "Survivors", 1, "-434 -46 0", "288 -19 1481", "-11503 -10981 375" );
make_clip( "_dispcrouch_smoker", "Everyone", 1, "4 -200 -64", "61 70 58", "-10650 -15068 -46", "0 -19 0" );

make_trighurt( "_instakill_longperimeter1", "Survivor", "-1158 -2015 0", "1158 2015 170", "-11827 -13824 -84" );
make_trighurt( "_instakill_longperimeter2", "Survivor", "-868 -1895 0", "508 2145 170", "-12855 -10361 -84" );
make_trighurt( "_instakill_fallrevivefence", "Survivor", "-17 -337 0", "17 367 17", "-8883 -8543 87" );
make_trighurt( "_instakill_fallrevivenoper", "Survivor", "-744 -527 0", "1304 877 96", "-9496 -7665 -96" );

			if ( g_BaseMode == "coop" || g_BaseMode == "realism" )
			{
				devchap( "BASE COOP" );

				// FIXES

				break;
			}
			if ( g_BaseMode == "versus" )
			{
				devchap( "BASE VERSUS" );

				// FIXES

make_clip( "_nav_quarrybeams", "Survivors", 1, "-152 -7 0", "152 1 288", "-7808 -9481 512" );

				break;
			}
			if ( g_BaseMode == "survival" )
			{
				devchap( "BASE SURVIVAL" );

				// FIXES

				break;
			}
			if ( g_BaseMode == "scavenge" )
			{
				devchap( "BASE SCAVENGE" );

				// FIXES

				break;
			}

			break;
		}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		case "c12m2_traintunnel":
		{
			g_Chapter = "BLOOD HARVEST - THE TUNNEL";

			devchap( "ALL MODES" );

			// FIXES_ALL

make_clip(	"_cliprework_outdoors01",	"Survivors",	1,	"-1171 405 -80",	"1171 422 1575",	"-7720 -8476 616" );
make_clip(	"_cliprework_outdoors03",	"Survivors",	1,	"-1171 -422 -312",	"1171 -405 1575",	"-7720 -8476 616" );
make_clip(	"_cliprework_outdoors02",	"Survivors",	1,	"1154 -422 -192",	"1171 422 1575",	"-7720 -8476 616" );
make_clip(	"_cliprework_outdoors04",	"Survivors",	1,	"-1171 -422 -80",	"-1154 422 1575",	"-7720 -8476 616" );
make_clip( "_nav_eventlight1", "Survivors", 1, "-5 -10 0", "5 10 129", "-8021 -7500 191" );
make_clip( "_nav_eventlight2", "Survivors", 1, "-5 -10 0", "5 10 73", "-6613 -7752 247" );
make_clip( "_stuckwarp_rocketdude", "Everyone", 1, "-24 -48 0", "24 48 71", "-5430 -8170 217" );
make_clip( "_rubble_smoother", "Everyone", 1, "-38 -166 0", "20 190 32", "-1777 -9480 -25", "33 23 28" );
make_trigduck( "_duckqol_ventduct", "-5 -26 -28", "5 26 28", "-8728 -7494 92" );

			if ( g_BaseMode == "coop" || g_BaseMode == "realism" )
			{
				devchap( "BASE COOP" );

				// FIXES

				break;
			}
			if ( g_BaseMode == "versus" )
			{
				devchap( "BASE VERSUS" );

				// FIXES

				break;
			}
			if ( g_BaseMode == "survival" )
			{
				devchap( "BASE SURVIVAL" );

				// FIXES

make_clip( "_nav_wareshelf", "Survivors", 1, "-25 -85 -234", "44 80 252", "-8740 -6996 170" );

make_navblock( "_survival_navblock_stairs", "Everyone", "Apply", "-4 -101 0", "4 0 32", "-6688 -7711 -80" );

				break;
			}
			if ( g_BaseMode == "scavenge" )
			{
				devchap( "BASE SCAVENGE" );

				// FIXES

				break;
			}

			break;
		}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		case "c12m3_bridge":
		{
			g_Chapter = "BLOOD HARVEST - THE BRIDGE";

			devchap( "ALL MODES" );

			// FIXES_ALL

make_clip( "_dispcrouch_preslope", "Everyone", 1, "-64 -128 -64", "64 256 88", "3090 -10118 -23", "20 0 0" );
make_clip( "_dispcrouch_trains", "Everyone", 1, "-500 -50 -169", "500 50 169", "4120 -14380 88", "0 6 0" );
make_clip( "_dispcrouch_eventlever", "Everyone", 1, "-412 -8 -61", "380 42 120", "8302 -13946 21", "0 -149 0" );
make_clip( "_dispcrouch_recompilefail", "Everyone", 1, "-620 -17 0", "620 17 70", "5930 -14086 -70", "0 3 0" );
make_clip( "_permstuck_eventlever", "Everyone", 1, "-17 -17 -17", "17 17 17", "8150 -13811 57" );
make_clip( "_nav_bridgecollapsea", "Survivors", 1, "-9 -10 0", "19 19 310", "5854 -12656 -41.3", "5 0 0" );
make_clip( "_nav_bridgecollapseb", "Survivors", 1, "-9 -10 0", "19 19 310", "6000 -12656 -41.3", "-5 0 0" );
make_clip( "_stuckwarp_endtunnel", "Everyone", 1, "-18 -60 0", "48 68 84", "968 -12932 20" );
make_clip( "_permstuck_terribadcliff", "Everyone", 1, "-68 -1 0", "68 46 148", "7317 -11487 451" );

con_comment( "MOVER:\tClip \"_bridge_dynamic_clip\" simulated to move when bridge collapses." );

make_clip( "_bridge_dynamic_clip", "Survivors", 1, "-69 -926 0", "69 6 1450", "5932 -13314 272" );
EntFire( "train_engine_button", "AddOutput", "OnPressed anv_mapfixes_bridge_dynamic_clip:AddOutput:origin 5932 -13784 272:0:-1" );

			if ( g_BaseMode == "coop" || g_BaseMode == "realism" )
			{
				devchap( "BASE COOP" );

				// FIXES

patch_spawninfront( "7136 -11876 394", "0 -164 -24", "800 4 134" );

				break;
			}
			if ( g_BaseMode == "versus" )
			{
				devchap( "BASE VERSUS" );

				// FIXES

patch_spawninfront( "7136 -11876 394", "0 -164 -24", "800 4 134" );

				break;
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

				break;
			}
			if ( g_BaseMode == "scavenge" )
			{
				devchap( "BASE SCAVENGE" );

				// FIXES

				break;
			}

			break;
		}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		case "c12m4_barn":
		{
			g_Chapter = "BLOOD HARVEST - THE TRAIN STATION";

			devchap( "ALL MODES" );

			// FIXES_ALL

make_clip(	"_dispcrouch_traintracka",	"Everyone",	1,	"-420 -355 -16",	"16 64 555",		"10250 -10145 -78" );
make_clip(	"_dispcrouch_traintrackb",	"Everyone",	1,	"-420 -255 -16",	"16 99 555",		"10120 -10600 -78" );
make_clip(	"_curvejump_bridgeend",		"Survivors",	1,	"-70 -6 -218",		"70 6 218",		"10230 -486 154" );
make_clip( "_dispcrouch_trainwall_one", "Everyone", 1, "-64 -640 -32", "8 0 36", "10203 -6505 -58", "0 2.5 0" );
make_clip( "_dispcrouch_trainwall_two", "Everyone", 1, "-64 -100 -32", "17 140 36", "10177 -6376 -58", "0 6 0" );
make_clip( "_dispcrouch_trainwall_three", "Everyone", 1, "-45 -320 -77", "21 216 64", "9813 -4120 0", "0 -7 0" );
make_clip( "_permstuck_clifftree", "Everyone", 1, "-17 -7 -7", "17 17 17", "10193 -6483 137" );
make_clip( "_permstuck_theonetheonly", "Everyone", 1, "-8 -15 0", "15 11 472", "11327 -8674 -64" );
make_clip( "_cliprework_pullcharge", "Survivors", 1, "-278 -17 -803", "1849 17 1042", "9272 -11114 646" );
make_clip( "_permstuck_forgottena", "Everyone", 1, "-17 -17 -17", "17 17 17", "9477 -11134 602" );
make_clip( "_permstuck_forgottenb", "Everyone", 1, "-17 -17 -17", "17 17 17", "9268 -10468 565" );
make_clip( "_permstuck_forgottenc", "Everyone", 1, "-17 -17 -17", "17 17 17", "9236 -9823 415" );
make_clip( "_permstuck_forgottend", "Everyone", 1, "-17 -17 -17", "17 17 17", "10118 -9681 527" );
make_clip( "_permstuck_forgottene", "Everyone", 1, "-17 -17 -17", "17 17 17", "9742 -9561 499" );
make_clip( "_permstuck_forgottenf", "Everyone", 1, "-17 -17 -17", "17 17 17", "9740 -9194 435" );
make_clip( "_permstuck_forgotteng", "Everyone", 1, "-17 -17 -17", "17 17 17", "10077 -9388 447" );
make_clip( "_permstuck_forgottenh", "Everyone", 1, "-17 -17 -17", "17 17 17", "10103 -8810 320" );
make_clip( "_permstuck_thanksagain", "Everyone", 1, "-14 -42 0", "34 47 32", "11403 -4579 -402" );
make_clip( "_event_window", "SI Players and AI", 1, "-12 -26 0", "12 26 16", "10876 -4166 88" );
patch_spawninfront( "10454 -1032 -64", "-142 -8 0", "142 8 420" );

make_prop( "dynamic", "_solidify_survivorchimney", "models/props/cs_militia/fireplacechimney01.mdl", "10862.2 -6085.53 120.492", "0 135 0", "shadow_no" );

			if ( g_BaseMode == "coop" || g_BaseMode == "realism" )
			{
				devchap( "BASE COOP" );

				// FIXES

con_comment( "TRIG_UNDO:\tDelete anv_maptrigs.nut blockers which prevent train car commonhop skip for Coop-only." );

EntFire( g_UpdateName + "_eventskip_commonhop*", "Kill", null, 4 );

				break;
			}
			if ( g_BaseMode == "versus" )
			{
				devchap( "BASE VERSUS" );

				// FIXES

make_clip( "_commonhop_roadsidefence", "Survivors", 1, "-3 -29 0", "5 27 1608", "10647 -7547 84" );
make_clip( "_clipextend_traintruss", "Survivors", 1, "-204 -4 0", "208 128 1462", "10444 -7516 232" );

make_clip(	"_shortcut_warehouse",		"Survivors",	1,	"0 -32 -32",		"8 64 256",		"10272 -7848 152" );
make_clip(	"_commonhop_traintruss",	"Survivors",	1,	"-160 -120 -55",	"160 120 1545",		"10879 -7463 116" );

				break;
			}
			if ( g_BaseMode == "survival" )
			{
				devchap( "BASE SURVIVAL" );

				// FIXES

				break;
			}
			if ( g_BaseMode == "scavenge" )
			{
				devchap( "BASE SCAVENGE" );

				// FIXES

				break;
			}

			break;
		}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		case "c12m5_cornfield":
		{
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

			if ( g_BaseMode == "coop" || g_BaseMode == "realism" )
			{
				devchap( "BASE COOP" );

				// FIXES

				break;
			}
			if ( g_BaseMode == "versus" )
			{
				devchap( "BASE VERSUS" );

				// FIXES

				break;
			}
			if ( g_BaseMode == "survival" )
			{
				devchap( "BASE SURVIVAL" );

				// FIXES

				break;
			}
			if ( g_BaseMode == "scavenge" )
			{
				devchap( "BASE SCAVENGE" );

				// FIXES

				break;
			}

			break;
		}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	/*==============================
	||                            ||
	||        COLD STREAM         ||
	||                            ||
	==============================*/

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		case "c13m1_alpinecreek":
		{
			g_Chapter = "COLD STREAM - ALPINE CREEK";

			devchap( "ALL MODES" );

			// FIXES_ALL

make_clip(	"_dispcrouch_watchtower",	"Everyone",	1,	"-64 -17 0",		"64 17 128",		"-3025 2861 186" );
make_clip(	"_sneaky_hunter",		"SI Players",	1,	"-963 -450 -256",	"1160 360 0",		"-1169 1555 482" );
make_clip( "_permstuck_cornercabin", "Everyone", 1, "-11 -12 -38", "14 12 32", "1465 3478 540" );
make_clip( "_dispcrouch_spawn", "Everyone", 1, "-32 -131 -147", "16 386 108", "-3244 54 151", "0 11 0" );

			if ( g_BaseMode == "coop" || g_BaseMode == "realism" )
			{
				devchap( "BASE COOP" );

				// FIXES

				break;
			}
			if ( g_BaseMode == "versus" )
			{
				devchap( "BASE VERSUS" );

				// FIXES

				break;
			}
			if ( g_BaseMode == "survival" )
			{
				devchap( "BASE SURVIVAL" );

				// FIXES

				break;
			}
			if ( g_BaseMode == "scavenge" )
			{
				devchap( "BASE SCAVENGE" );

				// FIXES

				break;
			}

			break;
		}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		case "c13m2_southpinestream":
		{
			g_Chapter = "COLD STREAM - SOUTH PINE STREAM";

			devchap( "ALL MODES" );

			// FIXES_ALL

make_clip(	"_idkground",			"Everyone",	1,	"-32 -32 0",		"32 32 16",		"5345 1744 290" );
make_clip(	"_dispcrouch_upandaway",	"Everyone",	1,	"-120 -16 -64",		"64 16 128",		"5924 1261 485" );
make_clip(	"_permstuck_chopperrocks",	"Everyone",	1,	"-32 -34 0",		"32 34 17",		"2150 1224 195" );
make_clip(	"_permstuck_longhedge_a",	"Everyone",	1,	"-256 -32 -128",	"32 32 128",		"2003 2644 480" );
make_clip(	"_permstuck_longhedge_b",	"Everyone",	1,	"-32 -128 -128",	"100 64 128",		"1226 3072 420" );
make_clip(	"_permstuck_longhedge_c",	"Everyone",	1,	"-32 -32 -32",		"32 32 32",		"1100 3444 506" );
make_clip(	"_permstuck_longhedge_d",	"Everyone",	1,	"-32 -32 -32",		"32 32 32",		"1072 3879 464" );
make_clip(	"_permstuck_longhedge_e",	"Everyone",	1,	"-32 -555 -17",		"88 555 128",		"1100 4480 324" );
make_clip(	"_permstuck_tree_a",		"Everyone",	1,	"-17 -17 0",		"17 17 8",		"6747 2745 762" );
make_clip(	"_permstuck_tree_b",		"Everyone",	1,	"-17 -17 0",		"17 17 8",		"1573 1991 441" );
make_clip(	"_permstuck_tree_c",		"Everyone",	1,	"-17 -17 0",		"17 17 8",		"147 3367 301" );
make_clip(	"_permstuck_tree_d",		"Everyone",	1,	"-17 -17 0",		"17 17 8",		"392 4679 277" );
make_clip(	"_permstuck_tree_e",		"Everyone",	1,	"-17 -17 0",		"17 17 8",		"-1459 4319 330" );
make_clip(	"_permstuck_tree_f",		"Everyone",	1,	"-17 -17 0",		"17 17 8",		"723 6019 375" );
make_clip(	"_surfsup",			"Survivors",	1,	"-490 -420 0",		"420 420 2160",		"-1485 5630 404" );
make_clip(	"_dispcrouch_barrelstent",	"Everyone",	1,	"-17 -99 0",		"34 99 128",		"979 5656 272" );
make_clip( "_permstuck_tree_g", "Everyone", 1, "-17 -17 -32", "17 17 0", "908 6871 697" );
make_clip( "_permstuck_tree_h", "Everyone", 1, "-17 -17 -32", "17 17 0", "984 6655 798" );
make_clip( "_permstuck_tree_i", "Everyone", 1, "-17 -17 -32", "17 17 0", "1151 6258 932" );
make_clip( "_permstuck_tree_j", "Everyone", 1, "-17 -17 -32", "17 17 0", "1153 5929 981" );
make_clip( "_stuckwarp_yellowbarrels", "Everyone", 1, "-108 -16 0", "59 13 128", "4861 2732 608", "0 -17 0" );
patch_spawninfront( "78 8574 -405", "-70 -8 0", "70 8 256" );

			if ( g_BaseMode == "coop" || g_BaseMode == "realism" )
			{
				devchap( "BASE COOP" );

				// FIXES

				break;
			}
			if ( g_BaseMode == "versus" )
			{
				devchap( "BASE VERSUS" );

				// FIXES

make_clip( "_shortcut_easybigskip1", "Survivors", 1, "-8 -56 0", "8 56 2442", "506 4983 253", "0 46 0" );
make_clip( "_shortcut_easybigskip2", "Survivors", 1, "-64 -66 0", "8 260 2442", "503 4713 253", "0 -10 0" );
make_clip( "_shortcut_easybigskip3", "Survivors", 1, "-64 -316 0", "8 96 2442", "483 4553 253", "0 -4 0" );

				break;
			}
			if ( g_BaseMode == "survival" )
			{
				devchap( "BASE SURVIVAL" );

				// FIXES

				break;
			}
			if ( g_BaseMode == "scavenge" )
			{
				devchap( "BASE SCAVENGE" );

				// FIXES

				break;
			}

			break;
		}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		case "c13m3_memorialbridge":
		{
			g_Chapter = "COLD STREAM - MEMORIAL BRIDGE";

			devchap( "ALL MODES" );

			// FIXES_ALL

make_clip(	"_permstuck_treea",		"Everyone",	1,	"-18 -17 -446",		"18 17 446",		"-3603 -6160 897" );
make_clip(	"_permstuck_treeb",		"Everyone",	1,	"-30 -75 -476.5",	"30 75 476.5",		"-3343 -5975 854" );
make_clip(	"_permstuck_treed",		"Everyone",	1,	"-22 -20.5 -91.5",	"22 20.5 91.5",		"-3310 -3600 405" );
make_clip(	"_permstuck_treec",		"Everyone",	1,	"-30 -16 -110",		"30 16 110",		"-3305 -4815 442" );
make_clip(	"_permstuck_jaynjer",		"Everyone",	1,	"-42 -42 -32",		"42 42 10",		"-4495 -4584 719" );
make_clip( "_hangcancel_perimeter", "Survivors", 1, "-25 -44 0", "28 94 1484", "13 -3620 896", "0 -8 0" );
make_clip( "_sneaky_hunter", "SI Players", 1, "-19 -1242 0", "37 615 112", "5666 -5383 272" );
make_clip( "_permstuck_shrubtreea", "Everyone", 1, "-17 -17 -17", "17 17 17", "-5080 -5712 970" );
make_clip( "_permstuck_shrubtreeb", "Everyone", 1, "-17 -17 -17", "17 17 17", "-5034 -5307 970" );
make_clip( "_permstuck_shrubtreec", "Everyone", 1, "-17 -17 -17", "17 17 17", "-4964 -4637 949" );
make_clip( "_cliprework_shrubwalla", "Survivors", 1, "-188 -16 -365", "402 16 849", "-4360 -6081 815", "0 -36 0" );
make_clip( "_cliprework_shrubwallb", "Survivors", 1, "-568 -16 -365", "822 16 849", "-4540 -5175 815", "0 -89 0" );
make_clip( "_cliprework_shrubwallc", "Survivors", 1, "-34 -16 -365", "108 16 849", "-4540 -4507 815", "0 -108 0" );
make_clip( "_cliprework_shrubwalld", "Survivors", 1, "-724 -16 -365", "108 16 497", "-4498 -4375 815", "0 -115 0" );
make_clip( "_cliprework_shrubwalle", "Survivors", 1, "-275 -16 -365", "116 16 815", "-4093 -3646 815", "0 -135 0" );
make_clip( "_clipextend_bridgeleft1", "Survivors", 1, "0 -26 0", "2012 26 317", "-2128 -3706 1538" );
make_clip( "_clipextend_bridgeleft2", "Survivors", 1, "0 -26 0", "344 26 317", "380 -3706 1538" );
make_clip( "_clipextend_bridgeright1", "Survivors", 1, "0 -30 0", "462 29 317", "-2128 -4480 1538" );
make_clip( "_clipextend_bridgeright2", "Survivors", 1, "0 -30 0", "476 29 317", "-1334 -4480 1538" );
make_clip( "_clipextend_bridgeright3", "Survivors", 1, "0 -30 0", "1376 29 317", "-600 -4480 1538" );
make_clip( "_cliprework_enddumpsters", "Survivors", 1, "-77 -130 0", "77 130 768", "5964 -3954 494" );
make_clip( "_bridge_collision", "All and Physics", 1, "-45 -473 0", "46 463 4", "1004 -4091 586" );

			if ( g_BaseMode == "coop" || g_BaseMode == "realism" )
			{
				devchap( "BASE COOP" );

				// FIXES

patch_ladder( "-410.09 -4121.79 1386", "15 15 10" );

				break;
			}
			if ( g_BaseMode == "versus" )
			{
				devchap( "BASE VERSUS" );

				// FIXES

con_comment( "LOGIC:\tAnti-shortcut tanker clip will be deleted upon its destruction." );

make_clip( "_shortcut_tanker", "Survivors", 1, "-58 -577 0", "58 271 527", "1092 -3999 1328", "0 27 0" );
EntFire( "tanker_destruction_relay", "AddOutput", "OnTrigger anv_mapfixes_shortcut_tanker:Kill::0:-1" );

				break;
			}
			if ( g_BaseMode == "survival" )
			{
				devchap( "BASE SURVIVAL" );

				// FIXES

				break;
			}
			if ( g_BaseMode == "scavenge" )
			{
				devchap( "BASE SCAVENGE" );

				// FIXES

				break;
			}

			break;
		}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		case "c13m4_cutthroatcreek":
		{
			g_Chapter = "COLD STREAM - CUT-THROAT CREEK";

			devchap( "ALL MODES" );

			// FIXES_ALL

make_clip(	"_permstuck_treetunnel",	"Everyone",	1,	"-16 -17 -10",		"17 16 45",		"-492.1 -186.3 -385" );
make_clip(	"_dispcrouch_toomany",		"Everyone",	1,	"0 0 -80",		"128 128 9001",		"-3028 -6154 413" );
make_clip( "_eventskip_rooftop", "Survivors", 1, "-317 -401 0", "323 367 689", "-3891 -8135 723" );
make_clip( "_eventskip_fence1", "Survivors", 1, "-59 -16 0", "60 16 910", "-4268 -8520 504" );
make_clip( "_eventskip_fence2", "Survivors", 1, "-151 -20 0", "849 20 914", "-3409 -7764 500" );
make_clip( "_cliprework_startbooster", "Survivors", 1, "-86 -520 -863", "203 361 226", "-4930 -5987 1188" );
make_clip( "_cliprework_endbooster", "Survivors", 1, "-72 -103 -175", "63 91 1415", "-1175 1405 57" );
make_clip( "_dispcrouch_onewaydrop", "Everyone", 1, "-402 -64 -64", "465 18 422", "-3893 -5852 -128" );
make_clip( "_cliprework_dispcrouch00", "SI Players and AI", 1, "-64 -149 -164", "18 87 146", "-4030 -5257 132", "0 -5 0" );
make_clip( "_cliprework_dispcrouch01", "Survivors", 1, "-64 -269 -64", "18 277 1446", "-4030 -5357 -32", "0 -5 0" );
make_clip( "_cliprework_dispcrouch02", "Survivors", 1, "-64 -269 -64", "18 1097 1446", "-4020 -4815 -32", "0 3 0" );
make_clip( "_cliprework_dispcrouch03", "Survivors", 1, "-64 -102 -64", "18 478 1446", "-4180 -1920 -32", "0 -21 0" );
make_clip( "_cliprework_dispcrouch04", "Survivors", 1, "-64 -22 -64", "18 408 1446", "-3971 -1527 -32", "0 -94 0" );
make_clip( "_cliprework_dispcrouch05", "Survivors", 1, "-64 -22 -64", "18 439 1446", "-3551 -1552 -32", "0 -64 0" );
make_clip( "_cliprework_dispcrouch06", "Survivors", 1, "-64 -157 -64", "18 369 1446", "-3126 -1398 -32", "0 -104 0" );
make_clip( "_cliprework_dispcrouch07", "Survivors", 1, "-64 -157 -64", "18 451 1446", "-2619 -1469 -31", "0 -84 0" );
make_clip( "_cliprework_dispcrouch08", "SI Players", 1, "-138 -16 -128", "48 16 216", "-2314 -2346 130", "0 -15 0" );
make_clip( "_cliprework_dispcrouch09", "SI Players", 1, "-138 -16 -128", "198 16 216", "-2172 -2422 130", "0 -17 0" );
make_clip( "_cliprework_dispcrouch10", "SI Players", 1, "-138 -16 -128", "488 16 108", "-1839 -2492 130", "0 13 0" );
make_clip( "_cliprework_dispcrouch11", "SI Players", 1, "-138 -16 -177", "488 16 0", "-1238 -2465 130", "0 -1 0" );
make_clip( "_cliprework_dispcrouch12", "SI Players", 1, "-8 -171 -42", "8 188 102", "415 -921 77", "0 -5 0" );
make_clip( "_dispcrouch_waterfall", "Everyone", 1, "-64 -188 -64", "18 263 272", "-2184 -1700 -288", "0 -10 0" );
make_clip( "_permstuck_umheymatt", "Everyone", 1, "-16 -128 0", "16 128 142", "13 5280 -117" );

			if ( g_BaseMode == "coop" || g_BaseMode == "realism" )
			{
				devchap( "BASE COOP" );

				// FIXES

				break;
			}
			if ( g_BaseMode == "versus" )
			{
				devchap( "BASE VERSUS" );

				// FIXES

make_clip( "_commonhop_endshortcut", "Survivors", 1, "-94 -35 -153", "93 -29 1437", "-693 4555 35", "0 5 0" );

				break;
			}
			if ( g_BaseMode == "survival" )
			{
				devchap( "BASE SURVIVAL" );

				// FIXES

				break;
			}
			if ( g_BaseMode == "scavenge" )
			{
				devchap( "BASE SCAVENGE" );

				// FIXES

				break;
			}

			break;
		}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	/*==============================
	||                            ||
	||         LAST STAND         ||
	||                            ||
	==============================*/

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		case "c14m1_junkyard":
		{
			g_Chapter = "LAST STAND - THE JUNKYARD";

			devchap( "ALL MODES" );

			// FIXES_ALL

con_comment( "CVAR:\tSet \"director_convert_pills\" to 0 to prevent excess defib conversion." );

Convars.SetValue( "director_convert_pills", 0 );

			// FIXES_ALL_EXCEPT_VERSUS

			if ( g_BaseMode != "versus" )
			{
local wep_spawners = null;
while ( wep_spawners = Entities.FindByClassname( wep_spawners, "weapon_*" ) )
{
	if ( wep_spawners.IsValid() )
	{
		if ( !NetProps.HasProp( wep_spawners, "m_weaponID" ) )
			continue;
		
		local spawnflags = NetProps.GetPropInt( wep_spawners, "m_spawnflags" );
		if ( spawnflags == ( spawnflags | 4 ) )
			NetProps.SetPropInt( wep_spawners, "m_spawnflags", ( spawnflags & ~4 ) );
	}
}
			}

			if ( g_BaseMode == "coop" || g_BaseMode == "realism" )
			{
				devchap( "BASE COOP" );

				// FIXES

				break;
			}
			if ( g_BaseMode == "versus" )
			{
				devchap( "BASE VERSUS" );

				// FIXES

				break;
			}
			if ( g_BaseMode == "survival" )
			{
				devchap( "BASE SURVIVAL" );

				// FIXES

				break;
			}
			if ( g_BaseMode == "scavenge" )
			{
				devchap( "BASE SCAVENGE" );

				// FIXES

				break;
			}

			break;
		}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		case "c14m2_lighthouse":
		{
			g_Chapter = "LAST STAND - LIGHTHOUSE FINALE";

			devchap( "ALL MODES" );

			// FIXES_ALL

con_comment( "CVAR:\tSet \"director_convert_pills\" to 0 to prevent excess defib conversion." );

Convars.SetValue( "director_convert_pills", 0 );

			// FIXES_ALL_EXCEPT_VERSUS

			if ( g_BaseMode != "versus" )
			{
local wep_spawners = null;
while ( wep_spawners = Entities.FindByClassname( wep_spawners, "weapon_*" ) )
{
	if ( wep_spawners.IsValid() )
	{
		if ( !NetProps.HasProp( wep_spawners, "m_weaponID" ) )
			continue;
		
		local spawnflags = NetProps.GetPropInt( wep_spawners, "m_spawnflags" );
		if ( spawnflags == ( spawnflags | 4 ) )
			NetProps.SetPropInt( wep_spawners, "m_spawnflags", ( spawnflags & ~4 ) );
	}
}
			}

			if ( g_BaseMode == "coop" || g_BaseMode == "realism" )
			{
				devchap( "BASE COOP" );

				// FIXES

				break;
			}
			if ( g_BaseMode == "versus" )
			{
				devchap( "BASE VERSUS" );

				// FIXES

				break;
			}
			if ( g_BaseMode == "survival" )
			{
				devchap( "BASE SURVIVAL" );

				// FIXES

				break;
			}
			if ( g_BaseMode == "scavenge" )
			{
				devchap( "BASE SCAVENGE" );

				// FIXES

				break;
			}

			break;
		}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	/*==============================
	||                            ||
	||         DEVELOPER          ||
	||                            ||
	==============================*/

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		case "c5m1_waterfront_sndscape":
		{
			g_Chapter = "DEVELOPER - c5m1_waterfront_sndscape";

			devchap( "ALL MODES" );

			// FIXES_ALL

con_comment( "FIX:\tTotal of 4 out of 5 traffic cones need to be made non-solid -- yes, for memes." );

unsolidify_model( "models/props_fortifications/orange_cone001_reference.mdl" );

			if ( g_BaseMode == "coop" || g_BaseMode == "realism" )
			{
				devchap( "BASE COOP" );

				// FIXES

				break;
			}
			if ( g_BaseMode == "versus" )
			{
				devchap( "BASE VERSUS" );

				// FIXES

				break;
			}
			if ( g_BaseMode == "survival" )
			{
				devchap( "BASE SURVIVAL" );

				// FIXES

				break;
			}
			if ( g_BaseMode == "scavenge" )
			{
				devchap( "BASE SCAVENGE" );

				// FIXES

				break;
			}

			break;
		}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		case "credits":
		{
			g_Chapter = "DEVELOPER - credits";

			devchap( "ALL MODES" );

			// FIXES_ALL

			if ( g_BaseMode == "coop" || g_BaseMode == "realism" )
			{
				devchap( "BASE COOP" );

				// FIXES

				break;
			}
			if ( g_BaseMode == "versus" )
			{
				devchap( "BASE VERSUS" );

				// FIXES

				break;
			}
			if ( g_BaseMode == "survival" )
			{
				devchap( "BASE SURVIVAL" );

				// FIXES

				break;
			}
			if ( g_BaseMode == "scavenge" )
			{
				devchap( "BASE SCAVENGE" );

				// FIXES

				break;
			}

			break;
		}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		case "curling_stadium":
		{
			g_Chapter = "DEVELOPER - curling_stadium";

			devchap( "ALL MODES" );

			// FIXES_ALL

			if ( g_BaseMode == "coop" || g_BaseMode == "realism" )
			{
				devchap( "BASE COOP" );

				// FIXES

				break;
			}
			if ( g_BaseMode == "versus" )
			{
				devchap( "BASE VERSUS" );

				// FIXES

				break;
			}
			if ( g_BaseMode == "survival" )
			{
				devchap( "BASE SURVIVAL" );

				// FIXES

				break;
			}
			if ( g_BaseMode == "scavenge" )
			{
				devchap( "BASE SCAVENGE" );

				// FIXES

				break;
			}

			break;
		}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		case "tutorial_standards":
		{
			g_Chapter = "DEVELOPER - tutorial_standards";

			devchap( "ALL MODES" );

			// FIXES_ALL

			if ( g_BaseMode == "coop" || g_BaseMode == "realism" )
			{
				devchap( "BASE COOP" );

				// FIXES

				break;
			}
			if ( g_BaseMode == "versus" )
			{
				devchap( "BASE VERSUS" );

				// FIXES

				break;
			}
			if ( g_BaseMode == "survival" )
			{
				devchap( "BASE SURVIVAL" );

				// FIXES

				break;
			}
			if ( g_BaseMode == "scavenge" )
			{
				devchap( "BASE SCAVENGE" );

				// FIXES

				break;
			}

			break;
		}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		case "tutorial_standards_vs":
		{
			g_Chapter = "DEVELOPER - tutorial_standards_vs";

			devchap( "ALL MODES" );

			// FIXES_ALL

			if ( g_BaseMode == "coop" || g_BaseMode == "realism" )
			{
				devchap( "BASE COOP" );

				// FIXES

				break;
			}
			if ( g_BaseMode == "versus" )
			{
				devchap( "BASE VERSUS" );

				// FIXES

				break;
			}
			if ( g_BaseMode == "survival" )
			{
				devchap( "BASE SURVIVAL" );

				// FIXES

				break;
			}
			if ( g_BaseMode == "scavenge" )
			{
				devchap( "BASE SCAVENGE" );

				// FIXES

				break;
			}

			break;
		}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	/*==============================
	||                            ||
	||         COMMUNITY          ||
	||                            ||
	==============================*/

		// If it's not a Valve map, delete the new Survivor/Infected activator
		// filters. Also skip DEVELOPER MODE function call and do nothing else.

		default:
		{
			EntFire( "anv_globalfixes_filter_*", "Kill" );

			return;
		}
	}

	// Now that we know it's a vanilla map, all of them will reach this code so
	// instead of calling these separately for each map, call both just once here.
	//
	// UPDATE: Ladders now spawn with vecMins/vecMaxs instead which doesn't require
	// any dynamic delay, and all Versus entities were moved to anv_versus.nut.
	//
	//	InfectedLadders_Spawn();
	//	InfectedHumEnts_Spawn();

	// If "developer 1" map names are stamped to console, followed by information
	// about all the fixes applied. If "developer 0" let the user know the feature
	// exists but only print the line once per load session.

	devchap( "TUTORIAL" );

	// We've run once so set mapspawn.nut's global variable to "true". This allows
	// anv_mapfixes.nut and other RunScriptFile'd *.nut's to only declare functions
	// once (outside of mapspawn.nut's natural doing so). Also to only patch NAV once.
	// If 0 second delay it'd be set "true" before switch-case RunScriptFile's ran.

	EntFire( "worldspawn", "RunScriptCode", "g_UpdateRanOnce = true", 1 );
}