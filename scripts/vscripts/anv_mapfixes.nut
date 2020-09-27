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

	switch( g_MapName )
	{
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	/*==============================
	||                            ||
	||        DEAD CENTER         ||
	||                            ||
	==============================*/

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		case "c1m1_hotel":
		{
			g_Chapter = "DEAD CENTER - HOTEL";

			devchap( "ALL MODES" );

			// FIXES_ALL

make_clip(	"_cliphang_window",		"Survivors",	1,	"-72 -123 -12",		"127 14 44",		"2335 6420 2804" );
make_clip(	"_cliphang_ledge",		"Survivors",	1,	"-450 -8 0",		"1130 8 216",		"1222 6232 2912" );
make_clip(	"_barricadefire_bypass",	"Survivors",	1,	"-17 -96 -64",		"17 96 64",		"1326 5624 2528" );

			if ( g_BaseMode == "coop" )
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

		case "c1m2_streets":
		{
			g_Chapter = "DEAD CENTER - STREETS";

			devchap( "ALL MODES" );

			// FIXES_ALL

make_clip(	"_mindthegap_lolvalve",		"SI Players",	1,	"-32 -4 -64",		"32 4 64",		"-2472 137 64" );
make_clip(	"_stuckwarpassist_walltovoid",	"SI Players",	1,	"-1536 -476 -5",	"0 500 0",		"-5056 1500 1344" );
make_clip(	"_booster_mallroof",		"Survivors",	1,	"0 -130 -377",		"2150 136 448",		"-9218 -4415 1024" );
make_clip( "_nav_cedaramp_in", "SI Players and AI", 1, "0 -18 -14", "10 21 51", "-4268 2566 75", "-50 -35 0" );
make_clip( "_nav_cedaramp_out", "SI Players and AI", 1, "-95 -20 4", "38 17 11", "-4322 2567 102", "-8 0 0" );
make_clip( "_colastore_clipgap", "Survivors", 1, "-8 -97 0", "8 75 856", "-6792 -3215 616" );
make_clip( "_colastore_clipawn", "Survivors", 1, "-23 -541 1", "41 547 17", "-7017 -1699 599" );
make_clip( "_ladderqol_railing", "SI Players", 1, "-138 -1 -12", "758 4 36", "-2614 2319 300" );
make_clip( "_save4lesscurb_smoother1", "Everyone", 1, "-7 -110 0", "14 113 5", "-6515 -2681 384" );
make_clip( "_save4lesscurb_smoother2", "Everyone", 1, "-7 -127 0", "14 129 5", "-6515 -2302 384" );
make_clip( "_save4lesscurb_smoother3", "Everyone", 1, "-7 -432 0", "9 435 5", "-6899 -1601 384" );
make_clip("_ladderqol_smootherl", "Everyone", 1, "-7 -190 0", "7 190 2", "-6059 -2238 430", "-45 0 0" );
make_clip("_ladderqol_smootherm", "Everyone", 1, "-7 -255 0", "7 118 2", "-6060 -2586 427", "-45 0 0" );
make_clip("_ladderqol_smootherr", "Everyone", 1, "-7 -36 0", "7 77 2", "-6056 -2960 412", "-45 0 0" );
make_clip( "_whitakercurb_smoother1", "Everyone", 1, "-9 -315 0", "15 294 6", "-5525 -2349 448" );
make_clip( "_whitakercurb_smoother2", "Everyone", 1, "-9 -208 0", "15 160 6", "-5525 -1719 448" );
make_clip( "_booster_bridgestairsa", "Survivors", 1, "-4 -84 0", "4 84 700", "-5572 932 768" );
make_clip( "_booster_bridgestairsb", "Survivors", 1, "-56 -8 0", "56 8 700", "-5512 1016 832" );
make_clip( "_booster_building", "Survivors", 1, "-8 -384 0", "8 384 128", "-5064 1408 1344" );

			if ( g_BaseMode == "coop" )
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

make_clip( "_tanker_blowfish", "Survivors", 1, "-85 -435 -6", "33 331 791", "-6740 -758 681", "0 328 0" );

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

		case "c1m3_mall":
		{
			g_Chapter = "DEAD CENTER - MALL";

			devchap( "ALL MODES" );

			// FIXES_ALL

make_clip(	"_commonhop_maproom",		"Survivors",	1,	"-24 -17 0",		"100 17 112",		"3673 -2517 424" );
make_clip( "_cliprework_skylighta", "Survivors", 1, "-192 -193 -23", "192 191 57", "6464 -2591 559" );
make_clip( "_cliprework_skylightb", "Survivors", 1, "-541 -189 -1", "547 195 32", "4173 -2627 793" );
make_clip( "_cliprework_skylightc", "Survivors", 1, "-194 -544 -1", "190 544 32", "2274 -672 793" );
make_clip( "_cliprework_skylightd", "Survivors", 1, "-1017 -167 0", "1018 149 32", "1465 -3418 794", "0 45 0" );

			if ( g_BaseMode == "coop" )
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

		case "c1m4_atrium":
		{
			g_Chapter = "DEAD CENTER - ATRIUM";

			devchap( "ALL MODES" );

			// FIXES_ALL

make_clip(	"_booster_storefrontleft",	"Survivors",	1,	"-900 -16 0",		"900 82 36",		"-4256 -4464 196" );
make_clip(	"_booster_storefrontright",	"Survivors",	1,	"-169 -32 0",		"785 16 36",		"-3344 -3280 196" );
make_clip( "_booster_pillarclip", "Survivors", 1, "-18 -32 0", "38 8 362", "-3434 -3533 472", "0 45 0" );
make_clip( "_booster_cedaplastic", "Survivors", 1, "-125 -2 -22", "130 1 186", "-2787 -4193 302" );
make_clip( "_booster_thicklongledge", "Survivors", 1, "-3856 0 -72", "0 81 256", "-2368 -4224 1080" );
make_clip( "_booster_nodrawcorner", "Survivors", 1, "-555 -400 0", "0 400 256", "-5770 -3926 1024", "0 45 0" );
make_clip( "_booster_libertymall", "Survivors", 1, "-18 -257 0", "18 257 500", "-2386 -3840 824" );
make_clip( "_booster_fallbanner", "Survivors", 1, "-1 -81 0", "1 81 256", "-2929 -3889.5 991" );
make_clip( "_booster_bridgeroof", "Survivors", 1, "-345 -110 0", "345 18 512", "-3339 -3857 864", "0 -70.5 0" );
make_clip( "_booster_hardhatsa", "Survivors", 1, "-128 -14 0", "128 14 512", "-3070 -4206 536" );
make_clip( "_booster_hardhatsb", "Survivors", 1, "-42 -14 0", "42 14 512", "-3370 -4206 536" );
make_clip( "_booster_highbalcony", "Survivors", 1, "-260 -162 0", "260 162 520", "-4695 -4336 792" );
make_clip( "_booster_glassbalcony", "Survivors", 1, "-128 -82 0", "128 0 1", "-3688 -4334 791" );
make_clip( "_nav_ladyshoes", "Survivors", 1, "-103 -3 0", "70 3 56", "-4971 -4461 432" );

			if ( g_BaseMode == "coop" )
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
	||       DARK CARNIVAL        ||
	||                            ||
	==============================*/

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		case "c2m1_highway":
		{
			g_Chapter = "DARK CARNIVAL - HIGHWAY";

			devchap( "ALL MODES" );

			// FIXES_ALL

make_clip(	"_permstuck_tanktreea",		"Everyone",	1,	"-24 -24 -64",		"24 24 17",		"4096 5123 -938" );
make_clip(	"_permstuck_tanktreeb",		"Everyone",	1,	"-24 -24 -64",		"24 24 17",		"4067 4930 -913" );
make_clip(	"_permstuck_tanktreec",		"Everyone",	1,	"-24 -24 -64",		"24 24 17",		"3911 3914 -941" );
make_clip( "_cargocontainer_oob_01", "SI Players", 1, "-32 -464 -376", "32 464 376", "3616 2512 -632" );
make_clip( "_cargocontainer_oob_02", "SI Players", 1, "-32 -192 -48", "32 192 48", "3616 1328 -1744" );
make_clip( "_cargocontainer_oob_03", "SI Players", 1, "-64 -96 -200", "64 96 200", "3136 2595 -1243", "0 0 -42" );
make_clip( "_cargocontainer_dispcrouch", "SI Players", 1, "-388 -16 0", "388 32 484", "3203 1572 -1822", "0 -5 -12" );
make_clip( "_dispcrouch_rocka", "Everyone", 1, "-8 -161 -320", "8 110 240", "1280 2115 -1615", "0 135 0" );
make_clip( "_dispcrouch_rockb", "Everyone", 1, "-140 -8 -320", "160 8 380", "1046 2025 -1615", "0 10 0" );
make_clip( "_dispcrouch_rockc", "Everyone", 1, "-80 -8 -320", "80 8 230", "820 2010 -1611", "0 -14 0" );
make_clip( "_dispcrouch_rockd", "Everyone", 1, "-80 -8 -320", "90 8 216", "686 2100 -1585", "0 -51 0" );
make_clip( "_dispcrouch_rocke", "Everyone", 1, "-99 -8 -320", "84 8 106", "618 2260 -1464", "0 90 0" );
make_clip( "_dispcrouch_swampa", "Everyone", 1, "-132 -8 0", "150 8 101", "2523 1855 -1805", "0 90 0" );
make_clip( "_dispcrouch_swampb", "Everyone", 1, "-100 -8 0", "80 8 101", "2595 1654 -1807", "0 142 0" );
make_clip( "_cliprework_fence", "Survivors", 1, "-70 -480 0", "8 480 640", "-193 -1932 -900" );
make_clip(	"_commonhop_barrier",		"Survivors",	1,	"-210 -2 0",		"210 2 690",		"365 -1098 -950" );
make_clip(	"_commonhop_tree",		"Survivors",	1,	"-150 -200 0",		"200 150 640",		"-46 -1242 -900" );
make_clip(	"_shoppingcart_roof",		"Survivors",	1,	"-290 -320 0",		"256 264 1024",		"-517 -2678 -940" );
make_clip( "_shoppingcart_tarpa", "Survivors", 1, "-51 -222 0", "50 256 711", "-1718 -2783 -967", "0 38 0" );
make_clip( "_shoppingcart_tarpb", "Survivors", 1, "-51 -232 0", "48 258 711", "-1800 -2319 -967", "0 -21 0" );
make_clip( "_shoppingcart_tarpc", "Survivors", 1, "-78 -506 0", "8 518 711", "-1838 -1583 -952", "0 16 0" );
make_clip(	"_booster_clipgap",		"Survivors",	1,	"-20 -20 24",		"365 120 700",		"3632 5712 -880" );
make_clip( "_shortcut_start_trucka", "Survivors", 1, "-5 -174 0", "96 188 514", "4493 7285 -756", "0 16 0" );
make_clip( "_shortcut_start_truckb", "Survivors", 1, "36 -157 0", "96 76 514", "4388 7285 -756", "0 16 0" );
make_clip( "_shortcut_start_busblu", "Survivors", 1, "-236 -47 0", "251 66 500", "4379 7676 -756", "0 -45 0" );
make_clip( "_shortcut_start_shruba", "Survivors", 1, "-8 -114.5 -17", "8 67 514", "4779 7377 -756", "0 11 0" );
make_clip( "_shortcut_start_shrubb", "Survivors", 1, "-8 -105 -17", "8 71 514", "4669 7457 -756", "0 79 0" );
make_clip( "_shortcut_start_shrubc", "Survivors", 1, "-8 -91 -17", "8 59 514", "4626 7363 -756", "0 193 0" );
make_clip( "_shortcut_start_shrubd", "Survivors", 1, "-8 -105 -17", "8 47 514", "4736 7283 -756", "0 255 0" );
make_clip( "_booster_motelsign", "Survivors", 1, "-105 -13 -71", "132 17 252", "2932 4894 -507" );
make_clip( "_permstuck_startfence", "Everyone", 1, "-147 -34 0", "45 39 1206", "11140 7179 -566", "0 21 0" );
make_clip( "_longbush_booster", "Survivors", 1, "-205 -770 0", "379 1585 111", "4092 3921 -369", "0 -4 0" );
make_clip( "_longbush_undermapa", "SI Players", 1, "-42 -1313 -145", "3 1555 552", "4625 4099 -805" );
make_clip( "_longbush_undermapb", "SI Players", 1, "-174 -5 0", "475 5 822", "4142 2981 -983" );
make_clip( "_clipextend_poolwalla", "Survivors", 1, "-517 -10 0", "517 10 360", "2561 3843 -640" );
make_clip( "_clipextend_poolwallb", "Survivors", 1, "-6 -350 0", "6 350 360", "3067 4200 -640" );
make_clip( "_permstuck_endfence", "Everyone", 1, "-93 -28 0", "53 38 143", "547 -635 -1087", "0 -33 0" );
make_clip( "_clipextend_umbrella1", "Survivors", 1, "-48 -50 0", "50 48 522", "2683 4055 -773" );
make_clip( "_clipextend_umbrella2", "Survivors", 1, "-48 -50 0", "50 48 522", "2483 3989 -773" );
make_clip( "_clipextend_umbrella3", "Survivors", 1, "-48 -52 0", "50 50 522", "2243 4047 -773" );

			if ( g_BaseMode == "coop" )
			{
				devchap( "BASE COOP" );

				// FIXES

con_comment( "KILL:\tShrubwall shortcut unpatched for Coop (popular request)." );

EntFire( g_UpdateName + "_shortcut_start*", "Kill" );

				break;
			}
			if ( g_BaseMode == "versus" )
			{
				devchap( "BASE VERSUS" );

				// FIXES

make_clip( "_overpass_trucknuke", "Survivors", 1, "-126 -45 0", "-33 45 156", "3467 7102 -704", "0 -14 0" );
make_clip( "_tank_busleft", "Survivors", 1, "-258 -56 0", "271 52 430", "1731 6723 -574", "0 -28 0" );
make_clip( "_tank_busright", "Survivors", 1, "-284 -48 -200", "284 48 200", "1688 7008 -344", "0 22 0" );
make_clip( "_tank_fence", "Survivors", 1, "-780 -14 -130", "780 14 156", "2588 7168 -412" );

				break;
			}
			if ( g_BaseMode == "survival" )
			{
				devchap( "BASE SURVIVAL" );

				// FIXES

make_clip( "_survival_midnightride", "Survivors", 1, "-839 -4 0", "448 15 422", "2618 6269 -679" );
make_clip( "_survival_midnightsign", "Survivors", 1, "-190 -155 -37", "190 145 162", "2338 6131 -415" );
make_clip( "_survival_boostshrub", "Survivors", 1, "-24 -208 0", "27 280 112", "3079 6479 -343" );
make_clip( "_survival_fence_extend", "Survivors", 1, "0 -234 0", "77 0 360", "2042 3837 -640" );

				break;
			}
			if ( g_BaseMode == "scavenge" )
			{
				devchap( "BASE SCAVENGE" );

				// FIXES

make_clip( "_scavenge_fence_painthop", "Survivors", 1, "0 -234 -145", "77 0 360", "2042 3837 -640" );

				break;
			}

			break;
		}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		case "c2m2_fairgrounds":
		{
			g_Chapter = "DARK CARNIVAL - FAIRGROUND";

			devchap( "ALL MODES" );

			// FIXES_ALL

make_clip(	"_bunnyhop_roundtable",		"Survivors",	1,	"-45 -256 0",		"100 256 502",		"2360 -244 266" );
make_clip(	"_booster_unattackable",	"Survivors",	1,	"-100 -17 0",		"700 17 512",		"4000 -2304 268" );
make_clip(	"_forklift_roof",		"Survivors",	1,	"-7 -128 0",		"10 128 575",		"1750 -1660 193" );
make_clip(	"_commonhop_whitefence",	"Survivors",	1,	"-77 -5 0",		"77 5 777",		"-3903 -1141 -15" );
make_clip(	"_commonhop_carouselroofs",	"Survivors",	1,	"-230 -5 0",		"302 1142 666",		"-990 -5501 192" );
make_clip(	"_booster_uppertrackb",		"Survivors",	1,	"-64 -448 -320",	"64 448 320",		"-1536 -2368 448" );
make_clip(	"_booster_uppertracka",		"Survivors",	1,	"-57 -313 -208.5",	"57 313 208.5",		"-2721 -825 337" );
make_clip(	"_void_filler",			"Everyone",	1,	"-222 0 -125",		"222 16 55",		"-1792 -7311 250" );
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
make_clip( "_clipextend_carouselboost", "Survivors", 1, "-234 -4 0", "234 4 666", "-1446 -5248 192" );
make_clip( "_unattackable_traintunnel", "Survivors", 1, "-324 -1040 -171", "220 1040 342", "-604 -1536 428" );
make_clip( "_dispcollision_fairgrounds", "All and Physics", 1, "-1400 -1700 -2", "1400 1700 0", "-1903 -142 -128" );

			if ( g_BaseMode == "coop" )
			{
				devchap( "BASE COOP" );

				// FIXES

				break;
			}
			if ( g_BaseMode == "versus" )
			{
				devchap( "BASE VERSUS" );

				// FIXES

// Piggyback on Survivor-filtered trigger just beyond the carousel off switch.

con_comment( "LOGIC:\tAnti-boost ToL clips will be deleted by existing trigger after carousel switch." );

make_clip( "_tol_clip_brush_a", "Survivors", 1, "-818 -16 0", "82 599 572", "-3530 -5162 192" );
make_clip( "_tol_clip_brush_b", "Survivors", 1, "-9 -263 0", "488 -1 572", "-3439 -5178 192" );
DoEntFire( "!self", "AddOutput", "OnTrigger anv_mapfixes_tol_clip_brush*:Kill::-1", 0.0, null, Entities.FindByClassnameNearest( "trigger_once", Vector( -2496, -6544, 4 ), 1 ) );

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

		case "c2m3_coaster":
		{
			g_Chapter = "DARK CARNIVAL - COASTER";

			devchap( "ALL MODES" );

			// FIXES_ALL

make_clip(	"_shortcut_supports",		"Survivors",	1,	"-86 -10 -137",		"86 10 32",		"-3904 2062 96" );
make_clip(	"_smokerinfamya",		"SI Players",	1,	"-4000 -80 -1337",	"0 1600 0",		"-4450 2525 309" );
make_clip(	"_smokerinfamyb",		"SI Players",	1,	"-4000 0 0",		"160 1111 1337",	"-4450 3005 309" );
make_clip(	"_smokerinfamyc",		"SI Players",	1,	"-4000 -289 0",		"0 271 1337",		"-5119 2734 309" );
make_clip(	"_shortcut_commonhopa",		"Survivors",	1,	"-10 -10 -64",		"10 10 216",		"-3720 1144 96" );
make_clip(	"_shortcut_commonhopb",		"Survivors",	1,	"-10 -10 -56",		"10 10 232",		"-3720 1352 72" );
make_clip(	"_shortcut_commonhopc",		"Survivors",	1,	"-10 -10 -52",		"10 10 227",		"-3720 1768 77" );
make_clip(	"_stuckwarp_gatearm",		"Everyone",	1,	"-31 -36 -54",		"31 36 54",		"-3799 1100 82" );
make_clip(	"_cliprework_scaffnuke_skipa",	"Survivors",	1,	"-120 -111 -48",	"150 88 310",		"-3044 3000 177" );
make_clip(	"_cliprework_scaffnuke_skipb",	"Survivors",	1,	"-90 -211 -48",		"82 0 310",		"-2788 2760 177" );
make_clip(	"_cliprework_scaffnuke_skipc",	"Survivors",	1,	"-120 -111 -48",	"20 -73 1545",		"-3044 3000 177" );
make_clip(	"_cliprework_scaffnuke_skipd",	"Survivors",	1,	"-90 -211 -48",		"-61 0 1545",		"-2788 2760 177" );
make_clip(	"_cliprework_tunnelb",		"Survivors",	1,	"-777 -110 -108",	"82 360 1100",		"-3418 3460 652" );
make_clip(	"_cliprework_roofa",		"Survivors",	1,	"-108 -224 -320",	"108 224 1100",		"-3596 1560 640" );
make_clip(	"_cliprework_tunnela",		"Survivors",	1,	"-300 -80 -108",	"82 360 1100",		"-3902 3021 655" );
make_clip(	"_cliprework_roofb",		"Survivors",	1,	"-295 -444 -280",	"295 444 1100",		"-3970 1558 640" );
make_clip(	"_cliprework_sign",		"Survivors",	1,	"-307 -70 0",		"307 70 1320",		"-3902 2321 431" );
make_clip( "_nav_extinguisher", "Survivors", 1, "-16 -4 0", "16 4 44", "-325 4116 244" );
make_clip( "_commonhop_curvedrail", "Survivors", 1, "-5 -120 0", "17 260 25", "-3498 2060 250" );
make_clip( "_cliprework_fourvents", "Survivors", 1, "-223 -1 0", "225 4 64", "239 3676 272" );
make_clip( "_chargerassist_container", "Survivors", 1, "-207 -62 0", "182 66 832", "-718 590 128" );
make_clip( "_cliprework_semipermstuck", "Everyone", 1, "-20 -50 0", "19 22 32", "-3254 2792 0", "0 -15 0" );
make_clip( "_cliprework_culdesaca", "Survivors", 1, "-95 -4 0", "98 4 206", "-3917 2979 152", "0 25 0" );
make_clip( "_cliprework_culdesacb", "Survivors", 1, "-176 -4 0", "142 4 1603", "-3659 3066 152", "0 15 0" );
make_clip( "_cliprework_culdesacc", "Survivors", 1, "-175 -4 0", "178 4 206", "-3351 3058 152", "0 -15 0" );
make_clip( "_cliprework_culdesacd", "Survivors", 1, "-4 -280 0", "4 106 1387", "-3493 3256 368" );
make_clip( "_shortcut_commonhopd", "Survivors", 1, "-10 -10 -56", "10 10 227", "-3512 1352 77" );
make_clip( "_shortcut_commonhope", "Survivors", 1, "-10 -10 -56", "10 10 227", "-3512 1768 77" );
make_clip( "_shortcut_commonhopf", "Survivors", 1, "-10 -10 -56", "10 10 263", "-3720 1976 57" );
make_clip( "_shortcut_commonhopg", "Survivors", 1, "-10 -10 -56", "10 10 103", "-3848 1976 57" );
make_clip( "_shortcut_supportdropa", "Survivors", 1, "-28 -55 0", "35 35 1150", "-3260 2854 576" );
make_clip( "_shortcut_supportdropb", "Survivors", 1, "-28 -216 0", "35 35 1150", "-3300 2810 576" );
make_clip( "_cliprework_shrubgap", "Survivors", 1, "-112 -80 0", "112 80 286", "-3072 128 152" );
make_clip( "_shortcut_finally_done", "Survivors", 1, "-8 -146 0", "0 146 255", "-2894 2609 253", "9 0 0" );
make_clip( "_onewaybreakwall_elecbox", "Everyone", 1, "-64 -4 0", "64 4 236", "-64 3524 100" );
make_clip( "_endbridge_shiftsmoother1", "Everyone", 1, "-1 -42 0", "1 38 2", "-4183 2320 272" );
make_clip( "_endbridge_shiftsmoother2", "Everyone", 1, "-42 -1 0", "38 1 2", "-4729 2277 164" );
make_clip( "_permstuck_irredeemable", "SI Players", 1, "-48 -42 0", "16 94 152", "-2064 -174 0" );
make_clip( "_permstuck_swanroom_rest", "Everyone", 1, "-54 -20 0", "58 29 108", "510 4084 -7" );
make_clip( "_semiperm_coastergate", "Survivors", 1, "-64 -664 0", "64 16 140", "-2784 1688 0" );
make_clip( "_recompilepls_pillar1", "Survivors", 1, "-10 -10 0", "10 10 272", "-3760 2360 0" );
make_clip( "_recompilepls_pillar2", "Survivors", 1, "-10 -10 0", "10 10 272", "-3760 2280 0" );
make_clip( "_recompilepls_pillar3", "Survivors", 1, "-10 -10 0", "10 10 272", "-4032 2280 0" );
make_clip( "_recompilepls_pillar4", "Survivors", 1, "-10 -10 0", "10 10 272", "-4032 2360 0" );
make_clip( "_recompilepls_pillar5", "Survivors", 1, "-10 -10 0", "10 10 272", "-4176 2360 0" );
make_clip( "_recompilepls_pillar6", "Survivors", 1, "-10 -10 0", "10 10 272", "-4176 2280 0" );
make_clip( "_cliprework_permstuck", "Survivors", 1, "-93 -81 -55", "108 47 88", "-3266 3057 413" );
make_clip( "_booster_eventskip1", "Survivors", 1, "-253 -16 -459", "332 23 32", "-3106 3081 960" );
make_clip( "_booster_eventskip2", "Survivors", 1, "-253 -72 -459", "-246 23 32", "-3106 3081 960" );
make_clip( "_stuckwarp_swanstairs", "Everyone", 1, "-52 0 0", "143 3 37", "298 4192 43", "-34.5 0 0" );
make_brush( "_permstuck_swanroom_dead", "-54 -20 0", "58 29 108", "510 4084 -7" );
make_trigduck( "_duckqol_swanhole", "-5 -32 -32", "5 32 32", "1348 4096 32" );

make_clip( "_onewayhole_blockclip", "Everyone", 1, "-64 -13 -20", "64 13 28", "336 3777 180", "0 160 0" );
make_prop( "dynamic", "_onewayhole_blockpipe", "models/props_pipes/pipeset08d_128_001a.mdl", "336 3777 180", "0 160 90", "shadow_no" );

//con_comment( "LOGIC:\tBeta Coaster Rubble restored for Campaign and Survival relays." );

//make_prop( "dynamic", "_dynamic_coaster_rubble", "models/rollercoaster/coaster_debris.mdl", "0 0 -8", "0 0 0", "shadow_no", "solid_no" );
//EntFire( "relay_start_onslaught", "AddOutput", "OnTrigger anv_mapfixes_dynamic_coaster_rubble:SetAnimation:debris:6.33:-1" );
//EntFire( "relay_panicevent", "AddOutput", "OnTrigger anv_mapfixes_dynamic_coaster_rubble:SetAnimation:debris:6.33:-1" );

			if ( g_BaseMode == "coop" )
			{
				devchap( "BASE COOP" );

				// FIXES

				break;
			}
			if ( g_BaseMode == "versus" )
			{
				devchap( "BASE VERSUS" );

				// FIXES

make_clip(	"_shortcut_longjump",		"Survivors",	1,	"-17 -216 0",		"17 216 1580",		"-4240 2616 171" );

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

		case "c2m4_barns":
		{
			g_Chapter = "DARK CARNIVAL - BARNS";

			devchap( "ALL MODES" );

			// FIXES_ALL

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
make_clip( "_booster_clipextend", "Survivors", 1, "-38 -67 0", "10 61 668", "646 1995 356" );
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
patch_spawninfront( "-596 2312 -256", "-76 -8 0", "76 8 160" );
patch_spawninfront( "-508 2503 -256", "-8 -51 0", "8 51 160" );

			if ( g_BaseMode == "coop" )
			{
				devchap( "BASE COOP" );

				// FIXES

con_comment( "KILL:\tSafe roof exploit unpatched for Coop (popular request)." );

EntFire( g_UpdateName + "_outhouse_saferoof", "Kill" );

				break;
			}
			if ( g_BaseMode == "versus" )
			{
				devchap( "BASE VERSUS" );

				// FIXES

make_clip( "_commonhop_generator1", "Survivors", 1, "-35 -16 0", "35 16 50", "-1716 273 -81", "0 0 20" );
make_clip( "_commonhop_generator2", "Everyone", 1, "8 0 0", "58 8 164", "-1660 275 -192", "0 -19 0" );

				break;
			}
			if ( g_BaseMode == "survival" )
			{
				devchap( "BASE SURVIVAL" );

				// FIXES

make_clip( "_eventskip_fencehang", "Survivors", 1, "-6 -50 0", "6 50 1072", "398 1990 -48" );

make_clip( "_nav_eventfencea", "Survivors", 1, "-49 -3 0", "48 14 1045", "-2751 749 -21" );
make_clip( "_nav_eventfenceb", "Survivors", 1, "-49 -3 0", "48 14 1045", "-2499 749 -21" );

make_clip( "_ladder_askewhedgeshared_clip", "SI Players and AI", 1, "-3 -279 -7", "3 245 79", "593 1177 -63" );
make_ladder( "_ladder_askewhedgebotr1_cloned_askewhedgebotl", "610 1209.88 -123.984", "0 26 0" );
make_ladder( "_ladder_askewhedgebotr2_cloned_askewhedgebotl", "610 1209.88 -123.984", "0 52 0" );
make_ladder( "_ladder_askewhedgetopl1_cloned_askewhedgetopr", "594 1262 -24", "0 -26 0" );
make_ladder( "_ladder_askewhedgetopl2_cloned_askewhedgetopr", "594 1262 -24", "0 -52 0" );

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

		case "c2m5_concert":
		{
			g_Chapter = "DARK CARNIVAL - CONCERT";

			devchap( "ALL MODES" );

			// FIXES_ALL

make_clip(	"_nav_lightingtrussa",		"Survivors",	1,	"-11 -506 0",		"11 506 65",		"-1275 2261 368" );
make_clip(	"_nav_lightingtrussd",		"Survivors",	1,	"-11 -506 0",		"11 506 65",		"-2060 2261 368" );
make_clip(	"_nav_lightingtrussf",		"Survivors",	1,	"-11 -506 0",		"11 506 65",		"-2549 2261 368" );
make_clip(	"_nav_lightingtrussh",		"Survivors",	1,	"-11 -506 0",		"11.5 506 65",		"-3065 2261 368" );
make_clip(	"_nav_lightingtrussi",		"Survivors",	1,	"-11 -506 0",		"11.5 506 65",		"-3318 2261 368" );
make_clip(	"_nav_lightingtrussg",		"Survivors",	1,	"-11 -506 0",		"11.5 506 65",		"-2822.5 2261 367.7" );
make_clip(	"_nav_lightingtrusse",		"Survivors",	1,	"-11 -506 0",		"11 506 65",		"-2296 2261 368" );
make_clip(	"_nav_lightingtrussb",		"Survivors",	1,	"-11 -506 0",		"11 506 65",		"-1544 2261 368" );
make_clip(	"_nav_lightingtrussc",		"Survivors",	1,	"-11 -506 0",		"11 506 65",		"-1800 2261 368" );
make_clip( "_permstuck_fence", "Survivors", 1, "-1 -102 0", "4 102 128", "-1110 2274 -112", "0 44 0" );
make_clip( "_cliprework_lastwindow", "Survivors", 1, "-9 -36 -8", "11 35 747", "-3853 2279 280", "0 45 0" );
make_clip( "_nav_duediligence", "Survivors", 1, "-3 -49 0", "5 48 1152", "-997 3049 -128" );
make_clip( "_cliprework_concertlights", "Survivors", 1, "-324 -74 0", "318 73 162", "-2305 3277 140" );
make_clip( "_cliprework_concertposter", "Survivors", 1, "-338 -16 -200", "338 17 98", "-2304 3687 204" );
make_clip( "_cliprework_concertroofio", "Survivors", 1, "-656 -32 -98", "616 515 652", "-2302 3197 352" );
make_clip( "_smoother_windows", "SI Players and AI", 1, "-250 -32 0", "298 32 8", "-609 2387 329", "0 45 30" );
make_clip( "_missing_staircase_clip", "Everyone", 1, "-40 -40 -1", "40 40 40", "-922 1933 173", "0 315 0" );
make_clip( "_booster_lightleft", "Survivors", 1, "-8 -104 0", "8 29 725", "-2472 3148 278" );
make_clip( "_booster_lightright", "Survivors", 1, "-8 -104 0", "8 29 725", "-2152 3148 278" );
make_clip( "_commentary_replace_01", "Survivors", 1, "-40 -84 -256", "40 84 944", "-1248 3316 80" );
make_clip( "_backstairs_left", "Survivors", 1, "-8 -160 0", "8 160 760", "-4086 2688 264" );
make_clip( "_backstairs_right", "Survivors", 1, "-8 -158 0", "8 197 760", "-951 2073 264", "0 -45 0" );

			if ( g_BaseMode == "coop" )
			{
				devchap( "BASE COOP" );

				// FIXES

make_prop( "dynamic", "_helistuck_caseunique", "models/props_fairgrounds/bass_case.mdl", "-3466 2899 -106", "-15 1 89.73", "shadow_no" );
make_prop( "dynamic", "_helistuck_casecaster", "models/props_fairgrounds/anvil_case_casters_64.mdl", "-3488 2870 -128", "0 180 0", "shadow_no" );

				break;
			}
			if ( g_BaseMode == "versus" )
			{
				devchap( "BASE VERSUS" );

				// FIXES

make_prop( "dynamic", "_helistuck_caseunique", "models/props_fairgrounds/bass_case.mdl", "-3466 2899 -106", "-15 1 89.73", "shadow_no" );
make_prop( "dynamic", "_helistuck_casecaster", "models/props_fairgrounds/anvil_case_casters_64.mdl", "-3488 2870 -128", "0 180 0", "shadow_no" );

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
	||        SWAMP FEVER         ||
	||                            ||
	==============================*/

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		case "c3m1_plankcountry":
		{
			g_Chapter = "SWAMP FEVER - PLANK COUNTRY";

			devchap( "ALL MODES" );

			// FIXES_ALL

make_clip(	"_hedge_behindtrains",		"Survivors",	1,	"-532 -120 0",		"800 58 701",		"-11078 8237 320" );
make_clip(	"_commonhop_crossing",		"Survivors",	1,	"-99 -260 0",		"99 426 691",		"-1025 4859 332" );
make_clip(	"_clipgap_fence",		"Survivors",	1,	"-4 -124 -155",		"4 124 155",		"-11084 7220 428" );
make_clip(	"_permstuck_coolingtank",	"Everyone",	1,	"-62 -58 -56",		"21 21 56",		"-10754 8610 216" );
make_clip(	"_cliprework_jonesroof",	"Survivors",	1,	"-276 -296 -396",	"276 296 396",		"-8304 7216 628" );
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

make_prop( "dynamic", "_keepcalmgator", "models/props_fairgrounds/alligator.mdl", "-5274 7386 -19", "0 150 0", "shadow_no", "solid_no" );

			if ( g_BaseMode == "coop" )
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

make_clip( "_survivalcrit_bayouboost", "Survivors", 1, "-64 -351 0", "-2 321 1045", "-4358 6079 -21" );
make_clip( "_survival_brushextenda", "Survivors", 1, "-674 -60 0", "400 160 717", "-7967 7806 308" );
make_clip( "_survival_brushextendb", "Survivors", 1, "-224 4 0", "236 594 717", "-8832 7232 336" );
make_clip( "_survival_brushextendc", "Survivors", 1, "-289 -16 0", "439 20 717", "-9471 7496 384" );
make_clip( "_nav_pubsign", "Survivors", 1, "-4 -34 0", "4 31 822", "-7264 7167 202" );
make_clip( "_nav_trailertree", "Survivors", 1, "-48 -26 0", "78 36 742", "-7742 7721 287" );

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

		case "c3m2_swamp":
		{
			g_Chapter = "SWAMP FEVER - SWAMP";

			devchap( "ALL MODES" );

			// FIXES_ALL

// This map is clipped like a tunnel. No known gamebreaking exploits.

make_clip( "_boat_smoother", "Everyone", 1, "-16 -24 0", "16 24 30", "-7863 5391 -8", "-10 -30 0" );

			if ( g_BaseMode == "coop" )
			{
				devchap( "BASE COOP" );

				// FIXES

				break;
			}
			if ( g_BaseMode == "versus" )
			{
				devchap( "BASE VERSUS" );

				// FIXES

make_clip( "_brokenhouse_hedgegap", "Survivors", 1, "-68 -468 0", "98 257 502", "3915 2029 145", "0 -11 0" );

con_comment( "LOGIC:\tAnti-skip plane clips will be deleted when door is blown." );

make_clip( "_cabin_door_button_a", "Survivors", 1, "-138 -176 -13", "138 372 444", "-1932 3700 196", "0 28 0" );
make_clip( "_cabin_door_button_b", "Survivors", 1, "-147 -434 -70", "138 404 444", "-1888 3079 226" );
make_clip( "_cabin_door_button_c", "Survivors", 1, "-112 -516 -30", "108 431 521", "-1622 2298 162", "0 28 0" );
EntFire( "Blow_door", "AddOutput", "OnTrigger anv_mapfixes_cabin_door_button*:Kill::0:-1" );

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

		case "c3m3_shantytown":
		{
			g_Chapter = "SWAMP FEVER - SHANTY TOWN";

			devchap( "ALL MODES" );

			// FIXES_ALL

make_clip(	"_endhaybails_collision",	"SI Players and AI",	1,	"-42 -66 -24",		"42 66 24",		"5126 -3967 378" );
make_clip(	"_permstuck_fridge",		"Everyone",	1,	"-12 -10 -73",		"12 50 0",		"-3791 -2972 136" );
make_clip( "_trailerhouse_smoother1", "Everyone", 1, "-8 -213 0", "25 219 14", "-3294 -324 -8", "45 15 0" );
make_clip( "_trailerhouse_smoother2", "Everyone", 1, "-8 -33 0", "25 59 14", "-3298 -549 -8", "45 -75 0" );
make_clip( "_skyboxshield_endsafehouse", "SI Players", 1, "-185 -50 -40", "183 50 82", "5067 -3777 552" );

make_prop( "dynamic", "_permstuck_cratebot", "models/props_crates/static_crate_40.mdl", "-3749.85 -183.67 -3.164", "0 0 0" );
make_prop( "dynamic", "_permstuck_cratetop", "models/props_crates/static_crate_40.mdl", "-3749.85 -182.67 36.837", "0 -30 0" );

			if ( g_BaseMode == "coop" )
			{
				devchap( "BASE COOP" );

				// FIXES

				break;
			}
			if ( g_BaseMode == "versus" )
			{
				devchap( "BASE VERSUS" );

				// FIXES

make_clip(	"_shortcut_window",		"Survivors",	1,	"-6 -66 -64",		"6 66 110",		"-4120 -2232 38" );
make_clip( "_shortcut_barricadetarp", "Survivors", 1, "-107 -114 -1", "103 82 742", "-4786 1014 298" );

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

		case "c3m4_plantation":
		{
			g_Chapter = "SWAMP FEVER - PLANTATION";

			devchap( "ALL MODES" );

			// FIXES_ALL

make_clip(	"_permstuck_housetarp",		"Everyone",	1,	"-24 -24 0",		"24 24 120",		"-1753 -996 16" );
make_clip(	"_commonhop_mansionroof",	"Survivors",	1,	"-711 -21 0",		"711 21 500",		"1856 -596 640" );
make_clip( "_stuckwarp_understairs", "Everyone", 1, "4 -55 -25", "39 57 21", "2816 119 162" );
make_clip( "_booster_mansionroofa", "Survivors", 1, "-204 -23 0", "212 105 533", "1660 527 640" );
make_clip( "_booster_mansionroofb", "Survivors", 1, "-580 -341 0", "588 105 533", "1660 399 640" );
make_clip( "_booster_mansionroofc", "Survivors", 1, "-924 -201 0", "736 152 533", "1660 -47 640" );
make_clip( "_booster_scaffoldpins", "Survivors", 1, "-199 -1 0", "146 9 909", "527 177 243" );
make_clip( "_booster_treeleft", "Survivors", 1, "-148 -116 0", "208 116 753", "735 1518 373" );
make_clip( "_booster_treeright", "Survivors", 1, "-130 -179 0", "145 156 753", "2558 1526 373" );
make_clip( "_nav_tinytree1", "Survivors", 1, "-108 -66 0", "68 66 842", "1485 997 311" );
make_clip( "_nav_tinytree2", "Survivors", 1, "-68 -66 0", "78 106 842", "1835 937 311" );
make_clip( "_nav_tinytree3", "Survivors", 1, "-118 -96 0", "98 146 842", "1825 1227 311" );
make_clip( "_nav_tinytree4", "Survivors", 1, "-48 -46 0", "88 96 842", "1555 1227 311" );
make_clip( "_nav_tinytree5", "Survivors", 1, "-58 -16 0", "98 126 842", "1429 1887 311" );
make_clip( "_nav_tinytree6", "Survivors", 1, "-68 -66 0", "138 156 842", "1839 1817 311" );
make_brush( "_defibtrick_undermap_dead", "-16 -58 -120", "24 54 0", "688 122 248" );

// For some maps the trigger_finale might exist after "round_start" and require delay -- but not this one!

con_comment( "LOGIC:\tPoint-of-no-return clip will be Enabled when finale is started." );

make_clip( "_point_of_no_return", "Survivors", 0, "-168 -164 12", "128 92 196", "2064 -412 396" );
EntFire( "trigger_finale", "AddOutput", "FinaleStart anv_mapfixes_point_of_no_return:Enable::0:-1" );

			if ( g_BaseMode == "coop" )
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

make_clip( "_nav_shelvings", "Survivors", 1, "-48 -56 0", "65 56 63", "2127 -504 345" );

con_comment( "FIX:\tPoint-of-no-return clip Enabled instantly to block Survivalists from boosting out." );

EntFire( g_UpdateName + "_point_of_no_return", "Enable" );

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
	||         HARD RAIN          ||
	||                            ||
	==============================*/

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		case "c4m1_milltown_a":
		{
			g_Chapter = "HARD RAIN - MILLTOWN";

			devchap( "ALL MODES" );

			// FIXES_ALL

make_clip(	"_woodwindow",			"Survivors",	1,	"-48 -1 -39",		"48 1 39",		"4144 -1423 391" );
make_clip(	"_permstuck_shruba",		"SI Players",	1,	"-60 -32 -36",		"60 72 60",		"3668 -1664 132" );
make_clip(	"_permstuck_shrubb",		"SI Players",	1,	"-64 -64 -48",		"64 64 48",		"3408 -1760 144" );
make_clip(	"_commonhop_safehouse",		"Survivors",	1,	"-280 -456 0",		"280 456 1100",		"3984 -1863 464" );
make_clip(	"_booster_burgertankpole",	"Survivors",	1,	"-12 -12 -170",		"12 12 1000",		"-5800 7496 603" );
make_clip(	"_booster_burgertankspin",	"Survivors",	1,	"-216 -216 -170",	"216 216 640",		"-5800 7496 915" );
make_clip( "_booster_ginnytop", "Survivors", 1, "-22 -29 0", "17 29 1150", "-5425 6789 385", "0 45 0" );
make_clip( "_booster_ginnyjon", "Survivors", 1, "6 -4 -284", "-10 4 0", "-5425 6789 385", "0 45 0" );
make_clip( "_booster_gasextend", "Survivors", 1, "-41 -196 0", "528 164 1250", "-4624 7952 284" );
make_clip( "_booster_blueframe", "Survivors", 1, "-17 -70 0", "17 76 1100", "-4641 7618 479", "0 -7 0" );
make_clip( "_booster_roofwedge", "Survivors", 1, "-17 -24 0", "47 64 1200", "-5711 6528 416" );
make_clip( "_booster_wrongwayup", "Survivors", 1, "-14 -454 0", "-2 970 906", "-4082 7142 608" );
make_clip( "_booster_powerline", "Survivors", 1, "-47 -8 0", "86 35 1100", "-5297 7349 531" );
make_clip( "_booster_clipextend", "Survivors", 1, "-95 -18 0", "65 33 617", "-6561 6589 912" );
make_clip( "_burgertank_windowsmoother1", "Everyone", 1, "-5 -120 0", "6 120 4", "-5663 7268 135" );
make_clip( "_burgertank_windowsmoother2", "Everyone", 1, "-90 -5 0", "90 6 4", "-5798 7505 135" );
make_clip( "_burgertank_windowsmoother3", "Everyone", 1, "-90 -5 0", "90 6 4", "-6022 7777 135" );
make_trigduck( "_duckqol_greenposts1", "-60 -97 0", "60 97 142", "-2021 5568 98" );
make_trigduck( "_duckqol_greenposts2", "-60 -97 0", "60 97 142", "1069 6976 224" );
make_trigduck( "_duckqol_playground", "-156 -1 0", "156 1 77", "-1442 6968 119" );

			if ( g_BaseMode == "coop" )
			{
				devchap( "BASE COOP" );

				// FIXES

				break;
			}
			if ( g_BaseMode == "versus" )
			{
				devchap( "BASE VERSUS" );

				// FIXES

make_clip( "_treehouse_whitefence", "Survivors", 1, "-17 -80 0", "17 77 1125", "1767 2219 267" );

				break;
			}
			if ( g_BaseMode == "survival" )
			{
				devchap( "BASE SURVIVAL" );

				// FIXES

make_clip( "_survivalbig_skyboxcap", "Survivors", 1, "-1742 -907 0", "1706 1757 32", "-5802 7499 1248" );

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

		case "c4m2_sugarmill_a":
		{
			g_Chapter = "HARD RAIN - SUGAR MILL";

			devchap( "ALL MODES" );

			// FIXES_ALL

make_clip(	"_commonhop_roadclosed",	"Survivors",	1,	"-132 -132 -21",	"132 132 2222",		"3231 -3009 257" );
make_clip(	"_vent_roofa",			"Survivors",	1,	"-118 -4 -84",		"118 4 0",		"3699 -3727 476" );
make_clip(	"_vent_roofb",			"Survivors",	1,	"-14 -216 -270",	"14 216 2000",		"3127 -3635 502" );
make_clip(	"_permstuck_silos",		"Everyone",	1,	"-156 -256 -340",	"0 128 0",		"2696 -6088 435" );
make_clip(	"_canefield_coneroof_m2only",	"Survivors",	1,	"-220 -755 -380",	"320 707 1938",		"72 -11887 573" );
make_clip(	"_canefield_conewoof_m2only",	"Survivors",	1,	"1 -943 0",		"302 773 2192",		"-45 -10241 319" );
make_clip(	"_commonhop_dualstacks",	"Survivors",	1,	"-340 -642 -266",	"5 450 2100",		"264 -4866 498" );
make_clip(	"_permstuck_longfencea",	"Survivors",	1,	"-4 -130 -294",		"4 130 294",		"3996 -4978 506",	"0 36 0" );
make_clip(	"_permstuck_longfenceb",	"Survivors",	1,	"-4 -130 -294",		"4 130 294",		"4072 -5214 506" );
make_clip(	"_permstuck_longfencec",	"Survivors",	1,	"-4 -130 -294",		"4 130 294",		"4042 -5462 506",	"0 -14 0" );
make_clip(	"_permstuck_longfenced",	"Survivors",	1,	"-4 -130 -294",		"4 130 294",		"4010 -5718 506" );
make_clip(	"_permstuck_longfencee",	"Survivors",	1,	"-4 -130 -294",		"4 130 294",		"4010 -5978 506" );
make_clip(	"_permstuck_longfencef",	"Survivors",	1,	"-4 -130 -294",		"4 130 294",		"3962 -6216 506",	"0 -22 0" );
make_clip(	"_permstuck_quadtank",		"Everyone",	1,	"-290 -32 -200",	"134 32 0",		"1638 -5280 292" );
make_clip(	"_shortcut_elevator_m2only",	"Survivors",	1,	"-64 -4 0",		"64 4 777",		"-1477 -9605 114" );
make_clip(	"_commonhop_ducatelroof",	"Survivors",	1,	"-256 -164 0",		"256 164 4",		"3808 -3324 407" );
make_clip( "_permstuck_cornerbush", "Everyone", 1, "-19 -49 0", "99 18 78", "3117 -1842 110" );
make_clip( "_cliprework_clipextenda", "Survivors", 1, "-730 -264 0", "678 312 1792", "1306 -6648 735" );
make_clip( "_cliprework_clipextendb", "Survivors", 1, "-1200 -976 0", "351 80 1280", "-703 -8512 1232" );
make_clip( "_cliprework_millsilos", "Survivors", 1, "-938 -516 -100", "1128 506 1593", "2782 -4349 937" );
make_clip( "_cliprework_millwheel", "Survivors", 1, "-865 -510 -62", "803 518 1852", "1761 -5826 660" );
make_clip( "_cliprework_plywoodlip", "Survivors", 1, "-193 -5 0", "186 5 173", "-1743 -9483 624" );
make_clip( "_cliprework_gasstation", "Survivors", 1, "-317 -328 0", "323 312 2082", "-899 -13512 432" );
make_clip( "_nav_silo_witch1", "Survivors", 1, "-7 -7 0", "9 8 150", "2793 -5911 284" );
make_clip( "_nav_silo_witch2", "Survivors", 1, "-7 -7 0", "5 7 150", "2695 -5854 284" );
make_clip( "_nav_silo_witch3", "Survivors", 1, "-7 -7 0", "9 8 150", "2596 -5911 284" );
make_clip( "_nav_silo_witch4", "Survivors", 1, "-7 -7 0", "9 8 150", "2596 -5513 284" );
make_clip( "_nav_silo_witch5", "Survivors", 1, "-7 -7 0", "5 7 150", "2698 -5570 284" );
make_clip( "_nav_silo_witch6", "Survivors", 1, "-7 -7 0", "9 8 150", "2796 -5513 284" );
make_clip( "_nav_rubblewalla", "Survivors", 1, "-6 0 -13", "6 96 114", "-1152 -8556 712" );
make_clip( "_nav_rubblewallb", "Survivors", 1, "-6 0 -13", "6 96 114", "-1152 -9457 712" );
make_clip( "_cliprework_thimbleroof", "Survivors", 1, "0 -480 0", "401 464 2242", "288 -7936 281" );
make_clip( "_clipextend_thimblestack", "Survivors", 1, "-67 -52 0", "63 70 2084", "394 -7429 440" );
make_clip( "_clipextend_generator", "Survivors", 1, "-24 -35 0", "26 31 1821", "-769 -7654 687" );
make_clip( "_clipextend_treecluster", "Survivors", 1, "-43 -42 0", "31 40 1960", "114 -6111 576" );
make_clip( "_rubble_smoother1", "Everyone", 1, "-1 -93 0", "1 106 4", "2239 -5093 121", "0 -15 0" );
make_clip( "_rubble_smoother2", "Everyone", 1, "-66 -6 0", "58 0 6", "2176 -4926 98", "0 -15 0" );
make_clip( "_rubble_smoother3", "Everyone", 1, "-58 -90 0", "61 45 13", "2055 -4931 97", "0 21 0" );
make_clip( "_rubble_smoother4", "Everyone", 1, "-138 -26 0", "79 16 11", "1966 -5174 99", "0 15 30" );

con_comment( "KILL:\tInsta-kill triggers to prevent elevator skip deleted on inner-button press." );

make_trighurt( "_instakill_elevatora", "Survivor", "-196 -691 0", "1460 61 8", "-1204 -9549 394" );
make_trighurt( "_instakill_elevatorb", "Survivor", "-372 -691 0", "644 -65 8", "-2044 -9549 394" );
EntFire( "button_inelevator", "AddOutput", "OnPressed anv_mapfixes_instakill_elevator*:Kill::0:-1" );

// All-mode QoL clip for a Valve ladder and move it 2 units so players don't get caught on critpath anymore.

make_clip( "_ladderqol_millladder", "Everyone", 1, "-48 -1 0", "90 0 128", "1392 -5564 228" );
patch_ladder( "1454 -5565.5 292.25", "0 2 0" );

			if ( g_BaseMode == "coop" )
			{
				devchap( "BASE COOP" );

				// FIXES

				break;
			}
			if ( g_BaseMode == "versus" )
			{
				devchap( "BASE VERSUS" );

				// FIXES

make_clip( "_truck_fence1", "Survivors", 1, "-3 -128 -1546", "3 128 1546", "4292 -2990 1641.5" );
make_clip( "_truck_fence2", "Survivors", 1, "-92 -3 -1546", "92 3 1546", "4388 -2865 1642" );

				break;
			}
			if ( g_BaseMode == "survival" )
			{
				devchap( "BASE SURVIVAL" );

				// FIXES

make_clip( "_survival_construct", "Survivors", 1, "-438 -137 -272", "350 7 172", "-702 -8439 624" );
make_clip( "_survival_extendpipe", "Survivors", 1, "-77 -203 -260", "67 302 2032", "-703 -8229 511" );
make_clip( "_nav_semitrailer", "Survivors", 1, "-274 -63 0", "263 53 2262", "70 -8187 261" );
make_clip( "_nav_jumptotree", "Survivors", 1, "-78 -66 0", "128 46 2202", "-1250 -7925 331" );

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

		case "c4m3_sugarmill_b":
		{
			g_Chapter = "HARD RAIN - MILL ESCAPE";

			devchap( "ALL MODES" );

			// FIXES_ALL

make_clip(	"_commonhop_roadclosed",	"Survivors",	1,	"-132 -132 -21",	"132 132 2222",		"3231 -3009 257" );
make_clip(	"_vent_roofa",			"Survivors",	1,	"-118 -4 -84",		"118 4 0",		"3699 -3727 476" );
make_clip(	"_vent_roofb",			"Survivors",	1,	"-14 -216 -270",	"14 216 2000",		"3127 -3635 502" );
make_clip(	"_permstuck_silos",		"Everyone",	1,	"-156 -256 -340",	"0 128 0",		"2696 -6088 435" );
make_clip(	"_commonhop_dualstacks",	"Survivors",	1,	"-340 -642 -266",	"5 450 2100",		"264 -4866 498" );
make_clip(	"_permstuck_longfencea",	"Survivors",	1,	"-4 -130 -294",		"4 130 294",		"3996 -4978 506",	"0 36 0" );
make_clip(	"_permstuck_longfenceb",	"Survivors",	1,	"-4 -130 -294",		"4 130 294",		"4072 -5214 506" );
make_clip(	"_permstuck_longfencec",	"Survivors",	1,	"-4 -130 -294",		"4 130 294",		"4042 -5462 506",	"0 -14 0" );
make_clip(	"_permstuck_longfenced",	"Survivors",	1,	"-4 -130 -294",		"4 130 294",		"4010 -5718 506" );
make_clip(	"_permstuck_longfencee",	"Survivors",	1,	"-4 -130 -294",		"4 130 294",		"4010 -5978 506" );
make_clip(	"_permstuck_longfencef",	"Survivors",	1,	"-4 -130 -294",		"4 130 294",		"3962 -6216 506",	"0 -22 0" );
make_clip(	"_permstuck_quadtank",		"Everyone",	1,	"-290 -32 -200",	"134 32 0",		"1638 -5280 292" );
make_clip(	"_commonhop_ducatelroof",	"Survivors",	1,	"-256 -164 0",		"256 164 4",		"3808 -3324 407" );
make_clip( "_nav_cornerledge_m3only", "Survivors", 1, "-5 -67 0", "5 69 172", "-357 -8509 624" );
make_clip( "_permstuck_cornerbush", "Everyone", 1, "-19 -49 0", "99 18 78", "3117 -1842 110" );
make_clip( "_cliprework_clipextenda", "Survivors", 1, "-730 -264 0", "678 312 1792", "1306 -6648 735" );
make_clip( "_cliprework_clipextendb", "Survivors", 1, "-1200 -976 0", "351 80 1280", "-703 -8512 1232" );
make_clip( "_cliprework_millsilos", "Survivors", 1, "-938 -516 -100", "1128 506 1593", "2782 -4349 937" );
make_clip( "_cliprework_millwheel", "Survivors", 1, "-865 -510 -62", "803 518 1852", "1761 -5826 660" );
make_clip( "_cliprework_plywoodlip", "Survivors", 1, "-193 -5 0", "186 5 173", "-1743 -9483 624" );
make_clip( "_cliprework_gasstation", "Survivors", 1, "-317 -328 0", "323 312 2082", "-899 -13512 432" );
make_clip( "_nav_silo_witch1", "Survivors", 1, "-7 -7 0", "9 8 150", "2793 -5911 284" );
make_clip( "_nav_silo_witch2", "Survivors", 1, "-7 -7 0", "5 7 150", "2695 -5854 284" );
make_clip( "_nav_silo_witch3", "Survivors", 1, "-7 -7 0", "9 8 150", "2596 -5911 284" );
make_clip( "_nav_silo_witch4", "Survivors", 1, "-7 -7 0", "9 8 150", "2596 -5513 284" );
make_clip( "_nav_silo_witch5", "Survivors", 1, "-7 -7 0", "5 7 150", "2698 -5570 284" );
make_clip( "_nav_silo_witch6", "Survivors", 1, "-7 -7 0", "9 8 150", "2796 -5513 284" );
make_clip( "_nav_rubblewalla", "Survivors", 1, "-6 0 -13", "6 96 114", "-1152 -8556 712" );
make_clip( "_nav_rubblewallb", "Survivors", 1, "-6 0 -13", "6 96 114", "-1152 -9457 712" );
make_clip( "_cliprework_thimbleroof", "Survivors", 1, "0 -480 0", "401 464 2242", "288 -7936 281" );
make_clip( "_clipextend_thimblestack", "Survivors", 1, "-67 -52 0", "63 70 2084", "394 -7429 440" );
make_clip( "_clipextend_generator", "Survivors", 1, "-24 -35 0", "26 31 1821", "-769 -7654 687" );
make_clip( "_clipextend_treecluster", "Survivors", 1, "-43 -42 0", "31 40 1960", "114 -6111 576" );
make_clip( "_rubble_smoother1", "Everyone", 1, "-1 -93 0", "1 106 4", "2239 -5093 121", "0 -15 0" );
make_clip( "_rubble_smoother2", "Everyone", 1, "-66 -6 0", "58 0 6", "2176 -4926 98", "0 -15 0" );
make_clip( "_rubble_smoother3", "Everyone", 1, "-58 -90 0", "61 45 13", "2055 -4931 97", "0 21 0" );
make_clip( "_rubble_smoother4", "Everyone", 1, "-138 -26 0", "79 16 11", "1966 -5174 99", "0 15 30" );

// All-mode QoL clip for a Valve ladder and move it 2 units so players don't get caught on critpath anymore.

make_clip( "_ladderqol_millladder", "Everyone", 1, "-48 -1 0", "90 0 128", "1392 -5564 228" );
patch_ladder( "1454 -5565.5 292.25", "0 2 0" );

			if ( g_BaseMode == "coop" )
			{
				devchap( "BASE COOP" );

				// FIXES

				break;
			}
			if ( g_BaseMode == "versus" )
			{
				devchap( "BASE VERSUS" );

				// FIXES

make_clip( "_truck_fence1", "Survivors", 1, "-3 -128 -1546", "3 128 1546", "4292 -2990 1641.5" );
make_clip( "_truck_fence2", "Survivors", 1, "-92 -3 -1546", "92 3 1546", "4388 -2865 1642" );

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

		case "c4m4_milltown_b":
		{
			g_Chapter = "HARD RAIN - RETURN TO TOWN";

			devchap( "ALL MODES" );

			// FIXES_ALL

make_clip(	"_woodwindow",			"Survivors",	1,	"-48 -1 -39",		"48 1 39",		"4144 -1423 391" );
make_clip(	"_permstuck_shruba",		"SI Players",	1,	"-60 -32 -36",		"60 72 60",		"3668 -1664 132" );
make_clip(	"_permstuck_shrubb",		"SI Players",	1,	"-64 -64 -48",		"64 64 48",		"3408 -1760 144" );
make_clip(	"_commonhop_safehouse",		"Survivors",	1,	"-280 -456 0",		"280 456 1100",		"3984 -1863 464" );
make_trigduck( "_duckqol_greenposts1", "-60 -97 0", "60 97 142", "-2021 5568 98" );
make_trigduck( "_duckqol_greenposts2", "-60 -97 0", "60 97 142", "1069 6976 224" );
make_trigduck( "_duckqol_playground", "-156 -1 0", "156 1 77", "-1442 6968 119" );

make_clip( "_permstuck_highuptree", "Everyone", 1, "-32 -54 0", "24 24 10", "-3312 7326 315" );

			if ( g_BaseMode == "coop" )
			{
				devchap( "BASE COOP" );

				// FIXES

				break;
			}
			if ( g_BaseMode == "versus" )
			{
				devchap( "BASE VERSUS" );

				// FIXES

make_clip( "_treehouse_whitefence", "Survivors", 1, "-17 -80 0", "17 77 1125", "1767 2219 267" );

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

		case "c4m5_milltown_escape":
		{
			g_Chapter = "HARD RAIN - TOWN ESCAPE";

			devchap( "ALL MODES" );

			// FIXES_ALL

//make_clip(	"_backtrack_dumpster",		"Survivors",	1,	"-32 -40 0",		"32 40 1337",		"-4128 7481 150" );
//make_clip(	"_backtrack_flatnose",		"Survivors",	1,	"0 -110 0",		"540 8 1212",		"-4632 7208 272",	"0 -34 0" );
make_clip(	"_booster_burgertankpole",	"Survivors",	1,	"-12 -12 -170",		"12 12 1000",		"-5800 7496 603" );
make_clip(	"_booster_burgertankspin",	"Survivors",	1,	"-216 -216 -170",	"216 216 640",		"-5800 7496 915" );
make_clip( "_permstuck_highuptree", "Everyone", 1, "-32 -54 0", "24 24 10", "-3312 7326 315" );
make_clip( "_booster_ginnytop", "Survivors", 1, "-22 -29 0", "17 29 1150", "-5425 6789 385", "0 45 0" );
make_clip( "_booster_ginnyjon", "Survivors", 1, "6 -4 -284", "-10 4 0", "-5425 6789 385", "0 45 0" );
make_clip( "_booster_gasextend", "Survivors", 1, "-41 -196 0", "528 164 1250", "-4624 7952 284" );
make_clip( "_booster_blueframe", "Survivors", 1, "-17 -70 0", "17 76 1100", "-4641 7618 479", "0 -7 0" );
make_clip( "_booster_roofwedge", "Survivors", 1, "-17 -24 0", "47 64 1200", "-5711 6528 416" );
make_clip( "_booster_wrongwayup", "Survivors", 1, "-14 -454 0", "-2 970 906", "-4082 7142 608" );
make_clip( "_booster_powerline", "Survivors", 1, "-47 -8 0", "86 35 1100", "-5297 7349 531" );
make_clip( "_booster_clipextend", "Survivors", 1, "-95 -18 0", "65 33 617", "-6561 6589 912" );
make_clip( "_burgertank_windowsmoother1", "Everyone", 1, "-5 -120 0", "6 120 4", "-5663 7268 135" );
make_clip( "_burgertank_windowsmoother2", "Everyone", 1, "-90 -5 0", "90 6 4", "-5798 7505 135" );
make_clip( "_burgertank_windowsmoother3", "Everyone", 1, "-90 -5 0", "90 6 4", "-6022 7777 135" );
make_clip( "_dockm5only_smoother", "Everyone", 1, "0 -376 0", "8 820 32", "-7039 7701 91", "-45 0 0" );

// Non-1st rounds require a delay because this trigger_finale exists after "round_start".

con_comment( "LOGIC:\tPoint-of-no-return clip will be Enabled when finale is started." );

make_clip( "_point_of_no_return", "Survivors", 0, "-73 -135 0", "19 135 1361", "-4077 7139 125" );
EntFire( "trigger_finale", "AddOutput", "FinaleStart anv_mapfixes_point_of_no_return:Enable::0:-1", 1 );

			if ( g_BaseMode == "coop" )
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
	||         THE PARISH         ||
	||                            ||
	==============================*/

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		case "c5m1_waterfront":
		{
			g_Chapter = "THE PARISH - WATERFRONT";

			devchap( "ALL MODES" );

			// FIXES_ALL

make_clip(	"_vuln_balconya",		"Survivors",	1,	"-48 -192 -76",		"48 192 76",		"-720 -128 -140" );
make_clip(	"_vuln_balconyb",		"Survivors",	1,	"-48 -256 -253",	"48 256 253",		"-1136 -512 196" );
make_clip(	"_vuln_balconyc",		"Survivors",	1,	"0 0 0",		"65 256 150",		"-737 -2048 -208" );
make_clip(	"_vuln_balconyd",		"Survivors",	1,	"-518 -64 0",		"0 0 320",		"-687 -2304 -176" );
//make_clip(	"_phonebooth_hopandnav",	"Survivors",	1,	"-37 -14 -153",		"37 14 555",		"-1731 -2370 -224" );
make_clip(	"_skybox_shielda",		"SI Players",	1,	"-176 -5.5 22",		"-175 6.5 94",		"-272 -2055 50" );
make_clip(	"_skybox_shieldd",		"SI Players",	1,	"-21 -252.5 -147",	"21 252.5 147",		"-3948 257 130" );
make_clip(	"_skybox_shieldb",		"SI Players",	1,	"-277 -115 -138",	"283 115 100",		"-1543.5 -1855.5 249.6" );
make_clip(	"_skybox_shieldc",		"SI Players",	1,	"-145 -212 -19",	"165 212 77",		"-2971 -1264 125" );
make_clip(	"_signhop_awning",		"Survivors",	1,	"-55 -320 -80",		"55 320 216",		"-3088 -250 -70.5" );
make_clip(	"_cliprework_roofandwindows",	"Survivors",	1,	"-53 -256 0",		"723 256 365",		"-3279 -819 -140.6" );
make_clip(	"_nav_jukebox",			"Survivors",	1,	"-20 -14 -88",		"20 14 88",		"-1492 -1685 -287" );
make_clip(	"_nav_outhouse",		"Survivors",	1,	"0 0 -30",		"60 50 50",		"-970.4 -2352 -221.7" );
make_clip(	"_nav_bienlamps",		"Survivors",	1,	"-32 -75 0",		"6 75 330",		"-664 -835 -184" );
make_clip( "_rampstep_smoother", "Everyone", 1, "-40 -5 0", "40 1 3", "776 44 -374", "0 0 45" );
make_clip( "_nav_electricalbox", "Survivors", 1, "-35 -4 0", "28 3 576", "-1392 -252 -374" );
make_clip( "_cliprework_balconya", "Survivors", 1, "-398 -54 -17", "269 44 278", "-2700 -2346 -157" );
make_clip( "_cliprework_balconyb", "Survivors", 1, "-161 -47 0", "186 50 340", "-2937 -2098 -216" );
make_clip( "_cliprework_huntergap", "SI Players", 1, "-136 0 0", "136 17 32", "-40 1408 80" );
make_clip( "_permstuck_dropbehindfence", "Everyone", 1, "-226 -7 -104", "294 41 177", "-982 -2793 144" );
make_clip( "_cliprework_unattackable", "Survivors", 1, "-802 -203 0", "558 213 832", "-2446 299 -376" );
make_clip( "_ledgehang_startfenceleft", "Survivors", 1, "-16 -48 0", "10 48 379", "589 -142 -251", "0 29 0" );
make_clip( "_ledgehang_startfenceright", "Survivors", 1, "-8 -24 0", "8 24 360", "599 45 -232", "0 -15 0" );

			if ( g_BaseMode == "coop" )
			{
				devchap( "BASE COOP" );

				// FIXES

				break;
			}
			if ( g_BaseMode == "versus" )
			{
				devchap( "BASE VERSUS" );

				// FIXES

make_clip(	"_clipgap_fence",		"Survivors",	1,	"-32 -12 -82",		"32 12 82",		"-1740 -1284 -134" );

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

		case "c5m2_park":
		{
			g_Chapter = "THE PARISH - PARK";

			devchap( "ALL MODES" );

			// FIXES_ALL

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

			if ( g_BaseMode == "coop" )
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

make_clip(	"_nav_eventsign",		"Survivors",	1,	"-4 -10 -908",		"4 10 908",		"-8552 -6310 756" );
patch_ladder( "-9260 -5130 -152", "0 14 0" );

				break;
			}
			if ( g_BaseMode == "scavenge" )
			{
				devchap( "BASE SCAVENGE" );

				// FIXES

make_clip( "_safedoor_antighost", "SI Players", 1, "-2 -32 0", "2 32 107", "-3775 -1368 -344" );

				break;
			}

			break;
		}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		case "c5m3_cemetery":
		{
			g_Chapter = "THE PARISH - CEMETERY";

			devchap( "ALL MODES" );

			// FIXES_ALL

make_clip(	"_commonhop_rooftop",		"Survivors",	1,	"-24 -4 -28",		"24 4 88",		"3080 1407 222" );
make_clip(	"_sewer_holed",			"Survivors",	1,	"-4 -40 -44",		"4 40 44",		"5212 -112 -116" );
make_clip(	"_sewer_holec",			"Survivors",	1,	"-264 -4 -44",		"264 4 44",		"5968 -452 -116" );
make_clip(	"_sewer_holeb",			"Survivors",	1,	"-4 -376 -44",		"4 376 44",		"6532 224 -116" );
make_clip(	"_sewer_holea",			"Survivors",	1,	"-384 -4 -44",		"384 4 44",		"5848 964 -116" );
make_clip(	"_bunnyhop_underfence",		"Survivors",	1,	"-36 -2 -268",		"36 2 268",		"5948 -2330 688" );
make_clip(	"_commonhop_overpass",		"Survivors",	1,	"-544 -576 -160",	"544 576 365",		"4896 7744 320" );
make_clip(	"_manhole_fencea",		"Survivors",	1,	"-136 -584 -160",	"0 584 320",		"4489 1194 321" );
make_clip(	"_manhole_fenceb",		"Survivors",	1,	"-56 -122.5 -160",	"56 122.5 320",		"4445 504 320",		"0 15 0" );
make_clip(	"_manhole_fencec",		"Survivors",	1,	"-56 -122.5 -160",	"56 122.5 320",		"4437 268 320",		"0 -15 0" );
make_clip(	"_manhole_fenced",		"Survivors",	1,	"-36.5 -151 -160",	"36.5 151 320",		"4399 33 326" );
make_clip(	"_manhole_fencee",		"Survivors",	1,	"-180 -40 -160",	"180 40 320",		"4182 -127 328" );
make_clip(	"_ladderqol_overpass",		"SI Players",	1,	"-18.5 -12 -95",	"18.5 12 95",		"5851 8704 192" );
make_clip(	"_stuckwarp_wrongwaya",		"SI Players",	1,	"-82.5 -201 -111",	"82.5 201 111",		"6275 9035 242" );
make_clip(	"_stuckwarp_wrongwayb",		"SI Players",	1,	"-21.5 -276 -111",	"21.5 276 111",		"6336 8960 242" );
make_clip(	"_permstuck_jetstrike",		"Everyone",	1,	"-46.5 -27.5 -25",	"46.5 27.5 25",		"6233 -2190 453" );
make_clip(	"_permstuck_cemetery",		"Everyone",	1,	"-145 -27 0",		"145 27 1234",		"7453 -6553 95" );
make_clip(	"_commonhop_endfence",		"Survivors",	1,	"-64 -4 -44",		"64 4 580",		"9152 -9004 380" );
make_clip(	"_stuckwarp_staircase",		"Everyone",	1,	"-32 -4 -64",		"64 4 458",		"3504 2668 182" );
make_clip(	"_permstuck_dualfence",		"Survivors",	1,	"-28 -445 0",		"28 445 654",		"3421 733 3.1" );
make_clip( "_cliprework_pinkhouse", "Survivors", 1, "-386 -270 0", "414 274 320", "3434 4094 360" );
make_clip( "_cliprework_perchroof", "Survivors", 1, "-136 -192 0", "136 192 487", "4856 3040 164" );
make_clip( "_nav_brokenhome_highcorner", "Survivors", 1, "-4 -83 0", "16 378 469", "2052 2534 160" );
make_clip( "_nav_opencrypt", "Survivors", 1, "-26 -47 0", "7 49 1000", "9604 -6659 344" );
make_clip( "_nav_cornertree", "Survivors", 1, "-83 -116 0", "97 180 935", "10459 -4981 409" );

			if ( g_BaseMode == "coop" )
			{
				devchap( "BASE COOP" );

				// FIXES

				break;
			}
			if ( g_BaseMode == "versus" )
			{
				devchap( "BASE VERSUS" );

				// FIXES

make_clip( "_shortcut_vanjump", "Survivors", 1, "-41 0 0", "41 5 59", "4425 5257 28", "0 -16 10" );

make_clip( "_nav_brokenhome_shortcuta", "Survivors", 1, "-5 -51 0", "5 66 130", "2301 958 31", "-10 0 0" );
make_clip( "_nav_brokenhome_shortcutb", "Survivors", 1, "-5 -51 0", "5 66 130", "2302 1290 31", "-10 0 0" );

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

		case "c5m4_quarter":
		{
			g_Chapter = "THE PARISH - QUARTER";

			devchap( "ALL MODES" );

			// FIXES_ALL

make_clip(	"_vuln_balconya",		"Survivors",	1,	"-41 -64 -171.5",	"41 64 171.5",		"-3542 4573 395" );
make_clip(	"_vuln_balconyb",		"Survivors",	1,	"-243 -50 -161",	"243 50 161",		"-3360 4688 384" );
make_clip(	"_vuln_balconyd",		"Survivors",	1,	"-131 -33 -232",	"131 33 232",		"-2814 2912 615" );
make_clip(	"_vuln_balconye",		"Survivors",	1,	"-132.5 -33.5 -169.5",	"132.5 33.5 169.5",	"-2401 2912 553" );
make_clip(	"_vuln_balconyf",		"Survivors",	1,	"-261 -50 -409",	"261 50 409",		"-1839 2896 632" );
make_clip(	"_vuln_balconyc",		"Survivors",	1,	"-257.5 -34.5 -279.5",	"257.5 34.5 279.5",	"-3326 2531 535" );
make_clip(	"_commonhop_bench",		"Survivors",	1,	"-1020 -17 -310",	"250 17 610",		"-2684 2447 545" );
make_clip(	"_clip_anomaly",		"SI Players",	1,	"-36 -86 -44.5",	"36 86 44.5",		"-1918 661 503" );
make_clip(	"_clipgap_fence",		"Survivors",	1,	"-56 -2 -270",		"56 2 888",		"-2216 3200 309" );
make_clip(	"_booster_float",		"Survivors",	1,	"-430 -320 0",		"999 280 777",		"-986.4 -395 385" );
make_clip(	"_clipextend_afterfloata",	"Survivors",	1,	"-120 -354 -36",	"160 350 845",		"-2592 665 312.5" );
make_clip(	"_clipextend_garage",		"Survivors",	1,	"-320 -8 0",		"320 8 732",		"-1264 2992 420" );
make_clip(	"_clipextend_1ststreet",	"Survivors",	1,	"-8 -296 0",		"272 42 600",		"-368 2887 576" );
make_clip(	"_commonhop_electricalbox",	"Survivors",	1,	"8 -64 0",		"8 64 752",		"-80 1535 400" );
make_clip(	"_clipextend_afterfloatb",	"Survivors",	1,	"-4 -94 0",		"4 94 128",		"-2700 222 432" );
make_clip(	"_clipextend_2ndstreeta",	"Survivors",	1,	"-8 -246 0",		"95 216 768",		"-2848 -840 384" );
make_clip(	"_vuln_balconyg",		"Survivors",	1,	"-525 -48 0",		"525 54 737",		"-2440 -1040 416" );
make_clip(	"_clipextend_2ndstreetb",	"Survivors",	1,	"-50 -216 -32",		"36 216 737",		"-519 -870 420" );
make_clip(	"_clipextend_finalarea",	"Survivors",	1,	"-380 -47 0",		"380 47 737",		"81 -1075 416" );
make_clip(	"_clipextend_endfences",	"Survivors",	1,	"-12 -666 0",		"12 666 717",		"1700 -2016 430" );
make_clip(	"_clipgaps_finalrun",		"Survivors",	1,	"-1580 -16 -38",	"450 55 96",		"364 -2743 416" );
make_clip( "_clipgaps_defibtrick", "Survivors", 1, "-239 -30 0", "209 26 772", "-977 -2658 380" );
make_clip( "_commonhop_fountain", "Survivors", 1, "-44 -44 0", "44 44 144", "-3360 4288 234" );
make_clip( "_cliprework_rollupdoor", "Survivors", 1, "-8 -183 0", "8 169 777", "-1670 1687 324" );
make_clip( "_cliprework_unattackable", "Survivors", 1, "-28 -245 0", "28 235 704", "-3828 2709 448" );
make_clip( "_void_cliprework", "Survivors", 1, "-288 -223 0", "288 401 697", "-224 -1425 456" );
make_clip( "_void_filler", "SI Players", 1, "-64 17 -90", "65 301 -3", "-224 -1425 677" );

con_comment( "FIX:\tTotal of 13 out of 13 traffic cones need to be made non-solid -- finally we can!" );

unsolidify_model( "models/props_fortifications/orange_cone001_reference.mdl" );

			if ( g_BaseMode == "coop" )
			{
				devchap( "BASE COOP" );

				// FIXES

				break;
			}
			if ( g_BaseMode == "versus" )
			{
				devchap( "BASE VERSUS" );

				// FIXES

make_clip(	"_commonhop_signalbox",		"Survivors",	1,	"-19 -44 -527",		"19 64 527",		"-1645 1946 591" );
make_clip(	"_commonhop_rollupdoor",	"Survivors",	1,	"-13 -65 -376",		"13 65 528",		"-1652 1745 573" );
make_clip(	"_commonhop_fountain",		"Survivors",	1,	"-71 -222 0",		"71 700 777",		"-2881 3746 399" );
make_clip( "_clipgap_leftfence", "Survivors", 1, "-32 -4 0", "32 4 208", "-2976 3452 184" );

// Piggyback on Survivor-filtered trigger that queries Director for car alarm.

con_comment( "LOGIC:\tTMP shortcut fence clip will be deleted when a Survivor exits final building." );

make_clip( "_shortcut_fence_TMP", "Survivors", 1, "-84 -12 0", "86 9 149", "-1836 -1212 208" );
DoEntFire( "!self", "AddOutput", "OnTrigger anv_mapfixes_shortcut_fence_TMP:Kill::0:-1", 0.0, null, Entities.FindByClassnameNearest( "trigger_once", Vector( -1540, -1604, 314 ), 1 ) );

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

		case "c5m5_bridge":
		{
			g_Chapter = "THE PARISH - BRIDGE";

			devchap( "ALL MODES" );

			// FIXES_ALL

make_clip(	"_antiboost_finaleskip",	"Survivors",	1,	"-216 -295 -96",	"216 330 9001",		"-12017 6306 779" );
make_clip(	"_permstuck_semiwheels",	"Everyone",	1,	"-45 -30 -75",		"45 30 75",		"5929 6072 475" );
make_clip(	"_bunnyhop_girder",		"Survivors",	1,	"-610 -17 -101",	"40 24 256",		"-5528 6568 860" );
make_clip(	"_solidify_girderleft",		"Survivors",	1,	"-500 0 0",		"0 40 50",		"4544 6600 750" );
make_clip(	"_solidify_girderright",	"Survivors",	1,	"-500 -40 0",		"0 0 50",		"4544 6050 750" );
make_clip(	"_endfence_curvejump",		"Survivors",	1,	"-112 -80 -180",	"112 80 2400",		"9552 6640 556" );
make_clip(	"_endfence_commonhop",		"Survivors",	1,	"-24 -240 -55",		"24 240 17",		"9480 6320 705" );
make_clip(	"_bunnyhop_fence",		"Survivors",	1,	"-68 -71 -163",		"68 80 163",		"-11827 6526 611" );
make_clip(	"_solidify_bridgepier01",	"Everyone",	1,	"-42 -280 -8",		"42 280 177",		"-11786 6325 200" );
make_clip(	"_solidify_bridgepier03",	"Everyone",	1,	"-42 -280 -8",		"42 280 177",		"-9226 6325 200" );
make_clip(	"_solidify_bridgepier02",	"Everyone",	1,	"-42 -280 -8",		"42 280 177",		"-11274 6325 200" );
make_clip(	"_solidify_bridgepier04",	"Everyone",	1,	"-42 -280 -8",		"42 280 177",		"-8586 6325 200" );
make_clip(	"_solidify_bridgepier05",	"Everyone",	1,	"-42 -280 -8",		"42 280 177",		"-7434 6325 200" );
make_clip(	"_solidify_bridgepier06",	"Everyone",	1,	"-42 -280 -8",		"42 280 177",		"-6154 6325 200" );
make_clip(	"_solidify_bridgepier07",	"Everyone",	1,	"-42 -280 -8",		"42 280 177",		"-4618 6325 200" );
make_clip(	"_solidify_bridgepier08",	"Everyone",	1,	"-42 -280 -8",		"42 280 177",		"-3082 6325 200" );
make_clip(	"_solidify_bridgepier09",	"Everyone",	1,	"-42 -280 -8",		"42 280 177",		"-1546 6325 200" );
make_clip(	"_solidify_bridgepier10",	"Everyone",	1,	"-42 -280 -8",		"42 280 177",		"-10 6325 200" );
make_clip(	"_solidify_bridgepier11",	"Everyone",	1,	"-42 -280 -8",		"42 280 177",		"1526 6325 200" );
make_clip(	"_solidify_bridgepier12",	"Everyone",	1,	"-42 -280 -8",		"42 280 177",		"3062 6325 200" );
make_clip(	"_solidify_bridgepier13",	"Everyone",	1,	"-42 -280 -8",		"42 280 177",		"3990 6326 200" );
make_clip(	"_solidify_bridgepier14",	"Everyone",	1,	"-42 -280 -8",		"42 280 177",		"4599 6326 200" );
make_clip(	"_solidify_bridgepier15",	"Everyone",	1,	"-42 -280 -8",		"42 280 177",		"6662 6326 200" );
make_clip(	"_solidify_bridgepier16",	"Everyone",	1,	"-42 -280 -8",		"42 280 177",		"7270 6326 200" );
make_clip(	"_solidify_bridgepier17",	"Everyone",	1,	"-42 -280 -8",		"42 280 177",		"8694 6326 200" );
make_clip(	"_booster_lighta",		"Survivors",	1,	"-55 -55 -17",		"55 55 2121",		"8755 5850 978.9" );
make_clip(	"_booster_fence",		"Survivors",	1,	"-99 -99 0",		"99 99 1337",		"8422 5899 831" );
make_clip(	"_booster_generatora",		"Survivors",	1,	"-32 -32 -17",		"32 32 2121",		"8362 5702 753" );
make_clip(	"_booster_lightb",		"Survivors",	1,	"-55 -55 -17",		"55 55 2121",		"9352 5101 977.9" );
make_clip(	"_booster_lightc",		"Survivors",	1,	"-55 -55 -17",		"55 55 2121",		"9670 4237 977.9" );
make_clip(	"_booster_lightd",		"Survivors",	1,	"-55 -55 -17",		"55 55 2121",		"9856 3385 962.9" );
make_clip(	"_booster_sign",		"Survivors",	1,	"-150 -45 -17",		"150 45 2121",		"9418 3972 798.3" );
make_clip(	"_booster_acunit",		"Survivors",	1,	"-35 -65 -17",		"35 65 2121",		"8352 1700 474.9" );
make_clip(	"_booster_rollupdoor",		"Survivors",	1,	"-13 -70 0",		"13 70 2121",		"8331 1888 346.3" );
make_clip(	"_booster_generatorb",		"Survivors",	1,	"-32 -32 -17",		"32 32 2121",		"8526 3995 485.8" );
make_clip(	"_booster_generatorc",		"Survivors",	1,	"-32 -32 -17",		"32 32 2121",		"8245 3460 485.8" );
make_clip(	"_booster_tree",		"Survivors",	1,	"-110 -170 -17",	"120 140 2121",		"7975 2389 434" );
make_clip( "_cliprework_jeepbean", "Survivors", 1, "-339 -243 0", "528 260 1258", "8967 6328 790" );
make_clip( "_solidify_stuckwarp1", "Survivors", 1, "-26 -10 -37", "61 11 32", "4152 6617 729" );
make_clip( "_solidify_stuckwarp2", "Survivors", 1, "-26 -10 -37", "61 11 32", "4152 6034 729" );
make_clip( "_solidify_stuckwarp3", "Survivors", 1, "-86 -10 -37", "15 11 32", "4502 6034 729" );
make_clip( "_solidify_stuckwarp4", "Survivors", 1, "-86 -10 -37", "15 11 32", "4502 6617 729" );
make_clip( "_endrubble_smoother", "Everyone", 1, "-8 -41 0", "8 38 8", "8209 6208 456", "45 0 0" );
make_clip( "_ramp_smoother", "Everyone", 1, "-6 -42 0", "3 42 2", "8041 4102 180", "-30 -30 0" );
make_clip( "_clipextend_endchopper", "Survivors", 1, "-125 -506 0", "135 299 1852", "7383 3797 1199", "0 25 0" );
make_clip(	"_solidify_alt_girderleft",	"Survivors",	1,	"-500 0 0",		"0 40 50",		"7187 6600 750" );
make_clip(	"_solidify_alt_girderright",	"Survivors",	1,	"-500 -40 0",		"0 0 50",		"7187 6050 750" );
make_clip( "_solidify_alt_stuckwarp1", "Survivors", 1, "-26 -10 -37", "61 11 32", "6795 6617 729" );
make_clip( "_solidify_alt_stuckwarp2", "Survivors", 1, "-26 -10 -37", "61 11 32", "6795 6034 729" );
make_clip( "_solidify_alt_stuckwarp3", "Survivors", 1, "-86 -10 -37", "15 11 32", "7145 6034 729" );
make_clip( "_solidify_alt_stuckwarp4", "Survivors", 1, "-86 -10 -37", "15 11 32", "7145 6617 729" );

			if ( g_BaseMode == "coop" )
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

make_clip( "_survivalbig_skyboxcap", "Survivors", 1, "-2388 -2396 0", "1787 2736 32", "8074 3332 1536" );

make_clip(	"_booster_helipada",		"Survivors",	1,	"-1640 -17 -240",	"32 17 2882",		"7481 2202 175" );
make_clip(	"_booster_helipadb",		"Survivors",	1,	"-17 -1800 -240",	"17 1240 2882",		"5856 4019 176" );
make_clip(	"_booster_helipadc",		"Survivors",	1,	"-1640 -17 -240",	"1240 17 2882",		"7479 5276 176" );

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

			if ( g_BaseMode == "coop" )
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

			if ( g_BaseMode == "coop" )
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

			if ( g_BaseMode == "coop" )
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

			if ( g_BaseMode == "coop" )
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

			if ( g_BaseMode == "coop" )
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

			if ( g_BaseMode == "coop" )
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

			if ( g_BaseMode == "coop" )
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
make_clip( "_subwaymount_in", "Survivors", 1, "-49 -248 0", "63 247 58", "6337 3137 -154", "0 41 0" );
make_clip( "_subwaymount_out", "Survivors", 1, "-49 -248 0", "63 247 58", "6769 2895 -154", "0 79 0" );
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

			if ( g_BaseMode == "coop" )
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
make_clip(	"_window_ricky",		"Survivors",	1,	"-368 0 0",		"144 4 80",		"13680 11132 208" );
make_clip(	"_commonhop_trimescape",	"Survivors",	1,	"-288 -1 0",		"312 5 525",		"14240 11137 208" );
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

			if ( g_BaseMode == "coop" )
			{
				devchap( "BASE COOP" );

				// FIXES

				break;
			}
			if ( g_BaseMode == "versus" )
			{
				devchap( "BASE VERSUS" );

				// FIXES

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

			if ( g_BaseMode == "coop" )
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

			if ( g_BaseMode == "coop" )
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

make_clip(	"_allmodes_griefrooma",		"Survivors",	1,	"0 0 0",		"530 126 950",		"156 -6648 -22" );
make_clip(	"_allmodes_griefroomb",		"Survivors",	1,	"0 -770 0",		"130 0 950",		"28 -6652 -22" );
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

			if ( g_BaseMode == "coop" )
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

			if ( g_BaseMode == "coop" )
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

			if ( g_BaseMode == "coop" )
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
make_clip(	"_bunnyhop_endwindow",		"Survivors",	1,	"-606 -7 0",		"100 7 128",		"-7998 -6007 -48" );
make_clip(	"_commonhop_pipe",		"Survivors",	1,	"-4 -104 -56",		"4 104 56",		"-8044 -7280 -408" );
make_clip(	"_unattackable_pipea",		"Survivors",	1,	"-80 -4 -56",		"80 669 88",		"-7790 -8110 -388" );
make_clip(	"_unattackable_pipeb",		"Survivors",	1,	"-4 -80 -56",		"669 80 88",		"-8339 -9043 -388" );
make_clip(	"_unattackable_pipec",		"Survivors",	1,	"-4 -80 -56",		"669 80 88",		"-9144 -9043 -388" );
make_clip( "_cliprework_commonhop", "Survivors", 1, "-172 -8 -44", "172 8 44", "-6452 -6008 136" );
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

			if ( g_BaseMode == "coop" )
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
make_clip( "_cliprework_smokertrolling", "Survivors", 1, "-207 -21 0", "219 8 259", "-11857 -5323 85" );
make_clip( "_cliprework_churchwindows", "Survivors", 1, "-4 -120 0", "4 120 100", "-2372 192 194" );
make_clip( "_clipextend_padlockgate", "Survivors", 1, "-14 -311 0", "14 405 1102", "-8594 -5033 344" );
make_clip( "_permstuck_openedrockcliff", "SI Players", 1, "-17 -17 0", "17 17 32", "-9247 -3950 412" );
make_clip( "_permstuck_fatcliffladder1", "SI Players", 1, "-17 -34 0", "17 17 32", "-8302 -3322 383" );
make_clip( "_permstuck_fatcliffladder2", "SI Players", 1, "-17 -34 0", "17 17 32", "-8224 -3527 378" );
make_clip( "_chargerassist_brokenwall", "Survivors", 1, "-128 0 0", "128 64 275", "-2480 1104 221" );
make_clip( "_booster_watertowerclip", "Survivors", 1, "-538 -16 0", "348 66 900", "-6472 -871 1024", "0 15 0" );

			if ( g_BaseMode == "coop" )
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
make_clip( "_cliprework_eventskip1", "Survivors", 1, "-55 -1 0", "58 1 1588", "852 -2433 140" );
make_clip( "_cliprework_eventskip2", "Survivors", 1, "-209 -2 0", "192 2 1588", "661 -2569 140", "0 45 0" );
make_clip( "_cliprework_eventskip3", "Survivors", 1, "-156 -1 0", "141 1 1588", "372 -2717 140" );
make_clip( "_cliprework_eventskip4", "Survivors", 1, "-26 -59 0", "-24 41 1588", "242 -2757 140" );
make_trighurt( "_instakill_deathcharger", "Survivor", "-256 -453 -17", "256 453 0", "-2449 122 -43" );
patch_spawninfront( "288 -5284 93", "0 -96 0", "544 96 17" );

			if ( g_BaseMode == "coop" )
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

			if ( g_BaseMode == "coop" )
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

make_clip(	"_commonhop_greenhouse",	"Survivors",	1,	"0 -320 -176",		"3 240 690",		"5226 -752 1023" );
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
make_clip( "_cliprework_endpassage", "Survivors", 1, "-6 -224 0", "6 224 78", "4858 2552 274" );
make_trighurt( "_instakill_thankyoufailzz", "Survivor", "-2828 -46 -149", "1881 225 0", "5148 -1121 165" );

			if ( g_BaseMode == "coop" )
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

// Piggyback on Survivor-filtered trigger that ready-ups end car alarm.

con_comment( "LOGIC:\tAnti-shortcut trighurts will be deleted when a Survivor exits final office stairwell." );

make_trighurt( "_finalstreet_trighurta", "Survivor", "-879 -112 0", "603 48 17", "9071 3888 196" );
make_trighurt( "_finalstreet_trighurtb", "Survivor", "-1753 -823 0", "59 935 32", "8261 4759 196" );
make_trighurt( "_finalstreet_trighurtc", "Survivor", "-781 -361 0", "359 599 32", "9101 4969 196" );
DoEntFire( "!self", "AddOutput", "OnTrigger anv_mapfixes_finalstreet_trighurt*:Kill::0:-1", 0.0, null, Entities.FindByClassnameNearest( "trigger_once", Vector( 8616, 4320, 140 ), 1 ) );

			if ( g_BaseMode == "coop" )
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
make_clip(	"_booster_windows",		"Survivors",	1,	"-6 -80 0",		"6 80 128",		"-3082 3152 160" );
make_clip(	"_bunnyhop_windows",		"Survivors",	1,	"-6 -180 0",		"6 180 128",		"-2954 1393 160" );
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

			if ( g_BaseMode == "coop" )
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

			if ( g_BaseMode == "coop" )
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

			if ( g_BaseMode == "coop" )
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
make_clip( "_nav_quarrybeams", "Survivors", 1, "-152 -7 0", "152 1 288", "-7808 -9481 512" );
make_clip( "_tankpunch_deflector", "Survivors", 1, "-434 -46 0", "288 -19 1481", "-11503 -10981 375" );
make_clip( "_dispcrouch_smoker", "Everyone", 1, "4 -200 -64", "61 70 58", "-10650 -15068 -46", "0 -19 0" );

make_trighurt( "_instakill_longperimeter1", "Survivor", "-1158 -2015 0", "1158 2015 170", "-11827 -13824 -84" );
make_trighurt( "_instakill_longperimeter2", "Survivor", "-868 -1895 0", "508 2145 170", "-12855 -10361 -84" );
make_trighurt( "_instakill_fallrevivefence", "Survivor", "-17 -337 0", "17 367 17", "-8883 -8543 87" );
make_trighurt( "_instakill_fallrevivenoper", "Survivor", "-744 -527 0", "1304 877 96", "-9496 -7665 -96" );

			if ( g_BaseMode == "coop" )
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

			if ( g_BaseMode == "coop" )
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

make_navblock( "_survival_navblock_stairs", "Everyone", "Apply", "-4 -101 0", "4 25 32", "-6688 -7700 -80" );

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

			if ( g_BaseMode == "coop" )
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

make_clip(	"_shortcut_warehouse",		"Survivors",	1,	"0 -32 -32",		"8 64 256",		"10272 -7848 152" );
make_clip(	"_commonhop_traintruss",	"Survivors",	1,	"-160 -120 -55",	"160 120 1545",		"10879 -7463 116" );
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

			if ( g_BaseMode == "coop" )
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

			if ( g_BaseMode == "coop" )
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

			if ( g_BaseMode == "coop" )
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

			if ( g_BaseMode == "coop" )
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

con_comment( "LOGIC:\tAnti-shortcut tanker clip will be deleted upon its destruction." );

make_clip( "_shortcut_tanker", "Survivors", 1, "-58 -577 0", "58 271 527", "1092 -3999 1328", "0 27 0" );
EntFire( "tanker_destruction_relay", "AddOutput", "OnTrigger anv_mapfixes_shortcut_tanker:Kill::0:-1" );

			if ( g_BaseMode == "coop" )
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

			if ( g_BaseMode == "coop" )
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

			if ( g_BaseMode == "coop" )
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

			if ( g_BaseMode == "coop" )
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

			if ( g_BaseMode == "coop" )
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

			if ( g_BaseMode == "coop" )
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

			if ( g_BaseMode == "coop" )
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

			if ( g_BaseMode == "coop" )
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

			if ( g_BaseMode == "coop" )
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