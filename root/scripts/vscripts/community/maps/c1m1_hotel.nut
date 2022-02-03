g_Chapter = "DEAD CENTER - HOTEL";

devchap( "ALL MODES" );

function OnScriptMode_Init()
{
	IncludeScript("c1m1_reserved_wanderers", g_MapScript.LocalScript);
}

function DoRoundFixes()
{
	make_clip( "_cliphang_window",				"Survivors",	1,	"-72 -123 -12",		"127 14 44",	"2335 6420 2804" );
	make_clip( "_cliphang_ledge",				"Survivors",	1,	"-450 -8 0",		"1130 8 216",	"1222 6232 2912" );
	make_clip( "_barricadefire_bypass",			"Survivors",	1,	"-17 -96 -64",		"17 96 64",		"1326 5624 2528" );
	make_clip( "_commentary_lower_windows_elevator", "Everyone", 1, "-4 -32 -237", "4 32 237", "2348 5624 2148" );

	if ( g_BaseMode != "coop" && g_BaseMode != "realism" )
	{
		make_clip( "_commentary_lower_windows", "Everyone", 1, "-4 -560 -240", "4 560 240", "1652 6960 2144" );
		
		// FIX: Prevent the earliest press-forward balcony window shortcut.

		// Teamwork shortcut. Will only patch for Coop if the Community wills so for parkour-esque shortcuts.

		con_comment( "TRIG:\tAnti-shortcut \"_shortcut_balcrail_trigonce\" deletes trighurt at lower floor." );
		con_comment( "INFO:\tFire particle \"_shortcut_balcrail_particle\" acts as visual deterrent." );

		make_trighurt( "_shortcut_balcrail_trighurt", "Everyone", "-32 -45 -96", "7 45 8", "1641 6432 2576" );
		make_clip( "_shortcut_balcrail_survivorclip", "Survivors", 1, "0 -32 0", "2 32 95", "1646 6560 2481" );

		SpawnEntityFromTable( "trigger_once",
		{
			targetname	= g_UpdateName + "_shortcut_balcrail_trigonce",
			StartDisabled	= 0,
			spawnflags	= 1,
			filtername	= "anv_globalfixes_filter_survivor",
			origin		= Vector( 2167, 5812, 2504 )
		} );

		EntFire( g_UpdateName + "_shortcut_balcrail_trigonce", "AddOutput", "mins -503 -836 -40" );
		EntFire( g_UpdateName + "_shortcut_balcrail_trigonce", "AddOutput", "maxs 185 2052 104" );
		EntFire( g_UpdateName + "_shortcut_balcrail_trigonce", "AddOutput", "solid 2" );

		EntFire( g_UpdateName + "_shortcut_balcrail_trigonce", "AddOutput", "OnStartTouch " + g_UpdateName + "_shortcut_balcrail_*:Kill::0:-1" );

		SpawnEntityFromTable( "info_particle_system",
		{
			targetname	= g_UpdateName + "_shortcut_balcrail_particle",
			origin		= Vector( 1670, 6430, 2470 ),
			angles		= Vector( 0, 180, 8 ),
			start_active	= 1,
			effect_name	= "fire_window_hotel"
		} );
	}
	if ( g_BaseMode == "coop" || g_BaseMode == "realism" )
	{
		devchap( "BASE COOP" );

		// FIXES

		make_clip( "_commentary_lower_windows_a", "Everyone", 1, "-8 -56 -570", "4 8 8", "1654 7512 2473" );
		make_clip( "_commentary_lower_windows_b", "Everyone", 1, "-8 -56 -570", "4 8 8", "1654 7352 2473" );
		make_clip( "_commentary_lower_windows_c", "Everyone", 1, "-8 -56 -570", "4 8 8", "1654 7032 2473" );
		make_clip( "_commentary_lower_windows_d", "Everyone", 1, "-8 -56 -570", "4 8 8", "1654 6872 2473" );
		make_clip( "_commentary_lower_windows_e", "Everyone", 1, "-8 -56 -570", "4 8 8", "1654 6584 2473" );
		make_clip( "_commentary_lower_windows_f", "Everyone", 1, "-8 -56 -570", "4 8 8", "1654 6456 2473" );

	}
	if ( g_BaseMode == "versus")
	{
		devchap( "BASE VERSUS" );

		// FIXES

		make_clip( "_commentary_balconyjump",		"Survivors",	1,	"-2 -128 -280",		"2 128 112",	"1344 4880 2704" );
		make_clip( "_commentary_elevator_window",	"Survivors",	1,	"-4 -32 -50",		"4 32 28",		"2352.5 5624 2644", "-10 0 0" );
		make_clip( "_commentary_windowdrop_corner",	"Survivors",	1,	"-95 -8 -8",		"95 8 28",		"1504 6280 2788" );
		make_clip( "_commentary_windowdrop_a",		"Survivors",	1,	"-4 -32 -50",		"4 32 28",		"1647.5 6432 2644", "10 0 0" );
		make_clip( "_commentary_windowdrop_b",		"Survivors",	1,	"-4 -32 -50",		"4 32 28",		"1647.5 6560 2644", "10 0 0" );
		make_clip( "_commentary_windowdrop_c",		"Survivors",	1,	"-4 -32 -50",		"4 32 28",		"1647.5 6848 2644", "10 0 0" );
		make_clip( "_commentary_windowdrop_d",		"Survivors",	1,	"-4 -32 -50",		"4 32 28",		"1647.5 7008 2644", "10 0 0" );
		make_clip( "_commentary_windowdrop_e",		"Survivors",	1,	"-4 -32 -50",		"4 32 28",		"1647.5 7328 2644", "10 0 0" );
		make_clip( "_commentary_windowdrop_f",		"Survivors",	1,	"-4 -32 -50",		"4 32 28",		"1647.5 7488 2644", "10 0 0" );
		make_clip( "_commentary_ledgedrop_a",		"Survivors",	1,	"-4 -600 -26",		"4 600 26",		"2338 7080 2628", "-15 0 0" );
		make_clip( "_commentary_ledgedrop_b",		"Survivors",	1,	"-4 -147 -26",		"4 147 26",		"2514 6331 2628", "-15 0 0" );
		make_clip( "_commentary_ledgedrop_c",		"Survivors",	1,	"-32 -4 -26",		"32 4 26",		"2480 6182 2628", "0 0 -15" );
		make_clip( "_commentary_ledgedrop_d",		"Survivors",	1,	"-87 -4 -26",		"87 4 26",		"2423 6482 2628", "0 0 15" );
		make_clip( "_commentary_ledgedrop_e",		"Survivors",	1,	"-24 -4 -26",		"24 4 26",		"2312 7682 2628", "0 0 15" );

	}

	if ( HasPlayerControlledZombies() )
	{
		// Simulates getting squished. Requires 2 Ghost Infected constantly stuck-warping.

		con_comment( "LOGIC:\tAnti-doorbreak trighurt will be deleted 4 seconds after elevator starts." );

		make_trighurt( "_elevator_exploit_bean", "Ghost", "-55 -2 0", "55 2 111", "2169 5713 2344" );
		EntFire( "elevator_button", "AddOutput", "OnPressed " + g_UpdateName + "_elevator_exploit_bean:Kill::4:-1" );

		con_comment( "QOL:\tThe 2nd fire door is open immediately for Versus-only QoL." );

		DoEntFire( "!self", "Break", "", 0.0, null, Entities.FindByClassnameNearest( "prop_door_rotating", Vector( 1828, 6620, 2464 ), 1 ) );
	}
}