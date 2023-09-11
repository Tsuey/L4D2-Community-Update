g_Chapter = "THE SACRIFICE - PORT";

devchap( "ALL MODES" );

function DoRoundFixes()
{
	make_clip(	"_solidify_girdershorter",	"Survivors",	1,	"-17 0 -170",		"2 240 240",		"200 -1280 145" );
	make_clip(	"_booster_bridge_TMP1",		"Survivors",	1,	"-234 -550 -17",	"255 0 0",		"0 -638 216" );
	make_clip(	"_booster_bridge_TMP2",		"Survivors",	1,	"-234 -17 -17",		"210 0 1017",		"0 -1200 216" );
	make_brush( "_losblock_plywoodc7only", "-1 -93 0", "1 7 72", "193 -1124 16" );
	// make_clip( "_cliprework_newsandelec1", "Everyone", 1, "-9 -98 0", "11 98 176", "245 -509 0" );
	// make_clip( "_cliprework_newsandelec2", "Everyone", 1, "-17 0 0", "17 5 132", "241 -404 44", "0 27 0" );
	// make_clip( "_cliprework_newsandelec3", "Everyone", 1, "-5 -48 0", "0 48 132", "229 -456 44" );
	// make_clip( "_cliprework_newsandelec4", "Everyone", 1, "-17 0 0", "17 5 132", "239 -512 44", "0 -26 0" );
	make_clip( "_booster_windows", "Survivors", 1, "-8 -400 0", "8 400 96", "-1032 568 352" );
	make_clip( "_booster_skylight_c7only", "Survivors", 1, "-90 -90 -17", "90 90 29", "-768 930 325" );
	make_clip( "_booster_coolingtanks", "Survivors", 1, "-117 -56 -120", "117 56 80", "-1473 958 402" );

	con_comment( "LOGIC:\tTMP shortcut booster clips will be deleted on trigger_finale FinaleEscapeStarted.\n"
		+ "\tNot a gamebreaker if absent and only for Sacrifice 3 to avoid players bumping their head." );

	EntFire( "trigger_finale", "AddOutput", "FinaleEscapeStarted " + g_UpdateName + "_booster_bridge_TMP*:Kill::0:-1" );

	make_clip(	"_anti_finaleskip_TMP",		"Survivors",	1,	"-21 -420 0",		"88 88 888",		"230 -849 216" );

	con_comment( "LOGIC:\tTMP finale skip clip will be deleted after bridge is almost fully raised.\n"
		+ "\tAllows sacrificer to use stairs. Incompatible with Passing 3 because of Louis." );

	EntFire( "bridge_start_button", "AddOutput", "OnPressed " + g_UpdateName + "_anti_finaleskip_TMP:Kill::8.1:-1" );

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
	make_clip( "_commentary_warehousegenerator", "Survivors", 1, "-30 -15 -8", "30 15 135", "-1156 886 345" );

	if ( HasPlayerControlledZombies() )
	{
		make_brush( "_losfix_dynamic_car",	"-80 -1 -10",	"80 1 10",	"89 -1532 176" );
		make_brush( "_losfix_dynamic_van",	"-100 -1 -10",	"100 1 10",	"-86 -1551 176" );
		make_brush( "_losfix_gen1",			"-20 -1 -8",	"20 1 8",	"-460 -572 11" );
		make_brush( "_losfix_gen2",			"-1 -20 -8",	"1 20 8",	"-1151 921 168" );
		make_ladder( "_ladder_fencec6mirr_cloned_concbarrfront", "-274 1408 228", "39 -2127 -163" );
		make_ladder( "_ladder_pillarc6mirr_cloned_dumpsterhedge", "2047 256 0", "-3089 44 64" );

		con_comment( "MOVER:\tLOS dynamic car and van parented to move with bridge." );

		EntFire( g_UpdateName + "_losfix_dynamic_car", "SetParent", "bridge_elevator" );
		EntFire( g_UpdateName + "_losfix_dynamic_van", "SetParent", "bridge_elevator" );
	}
}