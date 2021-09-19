g_Chapter = "DEAD AIR - THE TERMINAL";

devchap( "ALL MODES" );

function DoRoundFixes()
{
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
	make_clip( "_permstuck_endrubble", "SI Players and AI", 1, "-34 -17 0", "17 17 64", "2742 989 152" );

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

	}
	if ( g_BaseMode == "versus" )
	{
		devchap( "BASE VERSUS" );

		// FIXES

		patch_spawninfront( "2552 4080 152", "0 -16 0", "614 16 244" );

		make_clip( "_altpath_escalator", "Survivors", 1, "-37 -6 -35", "25 6 175", "2289 1737 51", "0 0 -2.5" );

	}

	if ( HasPlayerControlledZombies() )
	{
		make_brush( "_losfix_chairs1",		"-50 -1 -10",	"50 1 10",	"2976 2257 162" );
		make_brush( "_losfix_chairs2",		"-50 -1 -9",	"50 1 9",	"3022 3230 161" );
		make_brush( "_losfix_chairs3",		"-50 -1 -10",	"50 1 10",	"2967 3931 162" );
		make_brush( "_losfix_chairs_long1",	"-102 -1 -10",	"102 1 10",	"2969 3383 162" );
		make_brush( "_losfix_chairs_long2",	"-102 -1 -10",	"102 1 10",	"2968 3760 162" );
		make_brush( "_losfix_chairs_long3",	"-102 -1 -10",	"102 1 10",	"2970 4924 162" );
		make_brush( "_losfix_chairs_long4",	"-102 -1 -10",	"102 1 10",	"2971 5097 162" );
		make_brush( "_losfix_chairs_long5",	"-102 -1 -10",	"102 1 10",	"2970 5457 162" );
		make_clip( "_collision_terminaltruss1", "SI Players", 1, "-273 -16 0", "272 16 32", "-202 4742 670" );
		make_clip( "_collision_terminaltruss2", "SI Players", 1, "-189 -16 0", "245 16 32", "128 4230 582", "-17 0 0" );
		make_clip( "_collision_terminaltruss3", "SI Players", 1, "-78 -16 0", "161 16 32", "-400 4230 630", "4 0 0" );
		make_clip( "_ladder_baggageclaim_rampclip", "SI Players", 1, "0 -31 0", "128 128 64", "640 4417 305", "40 90 0" );
		make_clip( "_ladderqol_vaneventarea_left", "SI Players", 1, "-9 -66 -56", "41 66 32", "306 5104 264", "0 45 0" );
		make_clip( "_ladderqol_vaneventarea_right", "SI Players", 1, "-13 -69 -56", "41 69 32", "306 3811 264", "0 -45 0" );
		make_clip( "_losblocker_finalrun_clip", "Survivors", 1, "-102 -62 0", "52 61 76", "3032 3925 320" );
		make_ladder( "_ladder_baggageclaim_cloned_farluggageback", "560 2727 353.403", "70 1684 -16" );
		make_ladder( "_ladder_exploitventB_cloned_basheddoors", "397 1534 74", "322.495 -606.022 -4" );
		make_ladder( "_ladder_exploitventT_cloned_givebloodrubble", "-24 1798 60", "-1159 905 232", "0 -90 0", "1 0 0" );
		make_ladder( "_ladder_farluggagefront_cloned_farluggageback", "560 2727 353.403", "1115 5575 0", "0 180 0", "0 1 0" );
		make_ladder( "_ladder_midluggagefront_cloned_midluggageback", "560 1519 353.403", "1101 3158 0", "0 180 0", "0 1 0" );
		make_ladder( "_ladder_midventfront_cloned_midventback", "482 2082 329", "961 4155 0", "0 -180 0", "0 -1 0" );
		make_navblock( "_losblocker_finalrun_navblock", "Everyone", "Apply", "-18 -36 -32", "18 36 32", "3050 3925 153" );
		make_prop( "dynamic",		"_losblocker_finalrun_screen",	"models/props_unique/airportdeparturescreen01.mdl",	"2983 3925 151.25",		"0 180 0",		"shadow_no" );
		make_trigduck( "_duckqol_missingvent", "-5 -32 -32", "5 32 32", "716 928 160" );
		make_trigmove( "_duckqol_vanfence", "Duck", "-11 -8 0", "11 8 17", "-285 3524 191" );
		patch_nav_checkpoint( "3175 4562 152" );
	}
}