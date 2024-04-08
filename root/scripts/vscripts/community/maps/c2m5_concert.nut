g_Chapter = "DARK CARNIVAL - CONCERT";

devchap( "ALL MODES" );

PrecacheModel( "models/props_fairgrounds/bass_case.mdl" );
PrecacheModel( "models/props_fairgrounds/anvil_case_casters_64.mdl" );
PrecacheModel( "models/props_interiors/stair_metal_02.mdl" );
PrecacheModel( "models/props_update/c2m5_infectedroom_doorway.mdl" );
PrecacheModel( "models/props_update/c2m5_infectedroom.mdl" );
PrecacheModel( "models/props_junk/dumpster_2.mdl" );

function DoRoundFixes()
{
	make_clip(	"_nav_lightingtrussa",		"Survivors",	1,	"-11 -506 0",		"11 506 65",		"-1275 2261 368" );
	make_clip(	"_nav_lightingtrussd",		"Survivors",	1,	"-11 -506 0",		"11 506 65",		"-2060 2261 368" );
	make_clip(	"_nav_lightingtrussf",		"Survivors",	1,	"-11 -506 0",		"11 506 65",		"-2549 2261 368" );
	make_clip(	"_nav_lightingtrussh",		"Survivors",	1,	"-11 -506 0",		"11.5 506 65",		"-3065 2261 368" );
	make_clip(	"_nav_lightingtrussi",		"Survivors",	1,	"-11 -506 0",		"11.5 506 65",		"-3318 2261 368" );
	make_clip(	"_nav_lightingtrussg",		"Survivors",	1,	"-11 -506 0",		"11.5 506 65",		"-2822.5 2261 367.7" );
	make_clip(	"_nav_lightingtrusse",		"Survivors",	1,	"-11 -506 0",		"11 506 65",		"-2296 2261 368" );
	make_clip(	"_nav_lightingtrussb",		"Survivors",	1,	"-11 -506 0",		"11 506 65",		"-1544 2261 368" );
	make_clip(	"_nav_lightingtrussc",		"Survivors",	1,	"-11 -506 0",		"11 506 65",		"-1800 2261 368" );
	make_clip( "_cliprework_lastwindow", "Survivors", 1, "-9 -36 -8", "11 35 747", "-3853 2279 280", "0 45 0" );
	make_clip( "_smoother_windows", "SI Players and AI", 1, "-250 -32 0", "298 32 8", "-609 2387 329", "0 45 30" );
	make_clip( "_missing_staircase_clip", "Everyone", 1, "-40 -40 -1", "40 40 40", "-922 1933 173", "0 315 0" );
	make_clip( "_backstairs_left", "Survivors", 1, "-8 -160 0", "8 160 760", "-4086 2688 264" );
	make_clip( "_backstairs_right", "Survivors", 1, "-8 -158 0", "8 197 760", "-951 2073 264", "0 -45 0" );
	make_clip( "_commentary_infectedwindows", "Survivors", 1, "-8 -10 -8", "258 10 1064", "-3325 3720 -40" );
	make_prop( "dynamic", "_vending_oneway", "models/props_equipment/snack_machine2.mdl", "-1132 2336 -256", "0 45 0", "shadow_no" );
	make_prop( "dynamic", "_case_oneway1", "models/props_fairgrounds/anvil_case_casters_64.mdl", "-1092 2384 -256", "0 171 0", "shadow_no" );
	make_prop( "dynamic", "_case_oneway2", "models/props_fairgrounds/anvil_case_64.mdl", "-1096 2384 -220", "0 344.5 0", "shadow_no" );

	// FIX: Prevent interior stadium trigger from deleting players by re-creating it.

	con_comment( "TRIG:\tPlayer-deleting trigger_multiple replaced with trigger_hurt." );

	// When "stadium_entrance_door_relay" fires, "stadium_entrance_door_killtrigger"
	// is Enabled with 1 second delay and Disabled with 5 second delay. This is a
	// trigger_multiple that is not filtered and will delete players standing in it.
	// It uses model "*61" and "spawnflags 3" (Client/bots + NPC/Commons) and has
	// "allowincap 0" with "allowghost 0". Its "OnStartTouch" fires !activator Kill.

	// "Disconnect: Kicked by Console : CBaseEntity::InputKill()" is the exact kick
	// message. The replacement is named the same to use existing I/O. We don't want
	// to damage Ghost Infected since they can simply tap E. Cloning is required as
	// the original is massive and irregularly shaped. Beyond damaging the player to
	// kill them, Director would de-spawn Commons anyway so trigger is still overkill.
	// In the mapper's defense, "SetHealth 0" doesn't work with "infected" entities.

	local hndBadTrigger = Entities.FindByName( null, "stadium_entrance_door_killtrigger" );

	if ( SafelyExists( hndBadTrigger ) )
	{
		local strModel = hndBadTrigger.GetModelName();

		if ( IsModelPrecached( strModel ) )
		{
			SpawnEntityFromTable( "trigger_hurt",
			{
				targetname	=	"stadium_entrance_door_killtrigger",
				model		=	strModel,
				StartDisabled	=	1,
				spawnflags	=	3,
				nodmgforce	=	1,
				damage		=	10000,
				damagecap	=	10000,
				origin		=	Vector( -3920, 3152, -192 )
			} );
		}
	}

	kill_entity( hndBadTrigger );

	if ( g_BaseMode != "coop" && g_BaseMode != "realism" )
	{
		make_clip( "_permstuck_fence", "Survivors", 1, "-1 -102 0", "4 102 128", "-1110 2274 -112", "0 44 0" );
		make_clip( "_booster_lightleft", "Survivors", 1, "-8 -104 0", "8 29 725", "-2472 3148 278" );
		make_clip( "_booster_lightright", "Survivors", 1, "-8 -104 0", "8 29 725", "-2152 3148 278" );
		make_clip( "_cliprework_concertlights", "Survivors", 1, "-324 -74 0", "318 73 162", "-2305 3277 140" );
		make_clip( "_cliprework_concertposter", "Survivors", 1, "-338 -16 -200", "338 17 98", "-2304 3687 204" );
		make_clip( "_cliprework_concertroofio", "Survivors", 1, "-656 -32 -98", "616 515 652", "-2302 3197 352" );
		make_clip( "_nav_duediligence", "Survivors", 1, "-3 -49 0", "5 48 1152", "-997 3049 -128" );
	}
	if ( g_BaseMode == "coop" || g_BaseMode == "realism" )
	{
		devchap( "BASE COOP" );

		// FIXES

		make_prop( "dynamic", "_helistuck_caseunique", "models/props_fairgrounds/bass_case.mdl", "-3466 2899 -106", "-15 1 89.73", "shadow_yes" );
		make_prop( "dynamic", "_helistuck_casecaster", "models/props_fairgrounds/anvil_case_casters_64.mdl", "-3488 2870 -128", "0 180 0", "shadow_yes" );

		// Get nav tiles by position because IDS can change if edited later on
		local navConnection = NavMesh.GetNearestNavArea(Vector(-3400.000000, 3400.000000, -165.604355), 16, true, true);
		local navMain = NavMesh.GetNearestNavArea(Vector(-3396.963867, 3449.818848, -112.538177), 16, true, true);
		navConnection.Disconnect(navMain);
	}
	else if ( g_BaseMode == "versus" )
	{
		devchap( "BASE VERSUS" );

		// FIXES

		make_prop( "dynamic", "_helistuck_caseunique", "models/props_fairgrounds/bass_case.mdl", "-3466 2899 -106", "-15 1 89.73", "shadow_yes" );
		make_prop( "dynamic", "_helistuck_casecaster", "models/props_fairgrounds/anvil_case_casters_64.mdl", "-3488 2870 -128", "0 180 0", "shadow_yes" );
	}

	if ( HasPlayerControlledZombies() )
	{
		kill_funcinfclip( 130.518 );		// Delete clip inside sodapop 1a
		kill_funcinfclip( 151.678 );		// Delete clip inside sodapop 1b
		kill_funcinfclip( 369.219 );		// Delete clip inside anvilcase a
		kill_funcinfclip( 226.475 );		// Delete clip inside anvilcase b
		kill_funcinfclip( 425.096 );		// Delete clip inside NODRAW triplewindow
		EntFire( "worldspawn", "RunScriptCode", "kill_funcinfclip( 130.518 )", 1 );		// Delete clip inside sodapop 2a (same)
		EntFire( "worldspawn", "RunScriptCode", "kill_funcinfclip( 151.678 )", 1 );		// Delete clip inside sodapop 2b (same)
		make_atomizer( "_atomizer_bsp_forklift", "-3527 3008 -256", "models/props\\cs_assault\\forklift_brokenlift.mdl", 60 );
		make_axiswarp( "_axiswarp_anvilcase", "y+", 64, "-64 0 -128", "64 1 0", "-2304 2455 -96" );
		make_axiswarp( "_axiswarp_sodapop1", "x+", 34, "0 -56 -184", "1 56 0", "-1400 1920 288" );
		make_axiswarp( "_axiswarp_sodapop2", "x-", 34, "0 -56 -184", "1 56 0", "-3209 1920 288" );
		make_brush( "_losfix_lightpanel",	"-100 -15 -2",	"90 15 2",	"-2299 2124 130" );
		make_brush( "_losfix_plywood1",		"-1 -52 -5",	"1 52 5",	"-2846 2934 -255" );
		make_brush( "_losfix_plywood2",		"-1 -52 -3",	"1 52 3",	"-1303 3098 -253" );
		make_brush( "_losfix_scaffolding1a",		"-1 -74 -30",	"1 36 30",	"-1988 2489 -83" );
		make_brush( "_losfix_scaffolding1b",		"-1 -60 -30",	"1 36 30",	"-1804 2489 -83" );
		make_brush( "_losfix_scaffolding1c",		"-84 -1 -30",	"98 1 0",	"-1903 2524 -83" );
		make_brush( "_losfix_scaffolding2a",		"-1 -74 -30",	"1 36 30",	"-2668 2489 -83" );
		make_brush( "_losfix_scaffolding2b",		"-1 -60 -30",	"1 36 30",	"-2852 2489 -83" );
		make_brush( "_losfix_scaffolding2c",		"-84 -1 -30",	"98 1 0",	"-2767 2524 -83" );
		make_brush( "_losfix_start_trailer1",	"-104 -1 -8",	"104 1 8",	"-3740 3292 -248" );
		make_brush( "_losfix_start_trailer2",	"-104 -1 -8",	"104 1 8",	"-4097 3304 -248" );
		make_clip( "_axiswarp_anvilcase_clip", "SI Players", 1, "-64 0 0", "64 1 128", "-2304 2456 -224" );
		make_clip( "_axiswarp_sodapop1_clip", "SI Players", 1, "0 -56 0", "1 56 184", "-1399 1920 104" );
		make_clip( "_axiswarp_sodapop2_clip", "SI Players", 1, "0 -56 0", "1 56 184", "-3210 1920 104" );
		make_clip( "_missing_staircase_clip", "Everyone", 1, "-40 -40 -1", "40 40 40", "-922 1933 173", "0 315 0" );
		make_clip( "_smoother_windows", "SI Players and AI", 1, "-250 -32 0", "298 32 8", "-609 2387 329", "0 45 30" );
		make_ladder( "_ladder_fencedperch_cloned_scaffoldsingle", "-2976 3198 -152", "-910 259 304" );
		make_ladder( "_ladder_fireworksL_cloned_scaffoldsinglefork", "-2980 3298 -152", "771 -834 4" );
		make_ladder( "_ladder_fireworksR_cloned_scaffoldsinglefork", "-2980 3298 -152", "581 -834 4" );
		make_ladder( "_ladder_leftchopperwindowl_cloned_leftchopperwindowr", "-763.5005 2285.4995 240", "263 263 0" );
		make_ladder( "_ladder_startfenceback_cloned_fencecoverfront", "-3444 3528 -188", "3845 2199 8", "0 45 0", "0.70 0.70 0" );
		make_ladder( "_ladder_startfencefront_cloned_fencecoverback", "-3468 3592 -188", "3860 2114 8", "0 44 0", "-0.71 -0.69 0" );
		make_prop( "dynamic", "_missing_staircase", "models/props_interiors/stair_metal_02.mdl", "-840 1792 136", "0 315 0", "shadow_yes" );
		make_prop( "dynamic", "_yesdraw_infecteddoorway", "models/props_update/c2m5_infectedroom_doorway.mdl", "-3200 3972 0", "0 90 0", "shadow_yes" );
		make_prop( "dynamic", "_yesdraw_infectedroom", "models/props_update/c2m5_infectedroom.mdl", "-3200 3727 0", "0 -90 0", "shadow_yes" );
		make_prop( "physics", "_hittable_dumpleft", "models/props_junk/dumpster_2.mdl", "-1551 3682 -255", "0 270 0" );
		make_prop( "physics", "_hittable_dumpright", "models/props_junk/dumpster_2.mdl", "-3296 3682 -255", "0 270 0" );

		con_comment( "KILL:\tLeft and right defibrillators deleted for Versus. See: https://www.l4d.com/blog/post.php?id=3935" );

		kill_entity( Entities.FindByClassnameNearest( "weapon_defibrillator_spawn", Vector( -2667.81, 2358.75, 80.28 ), 8 ) );
		kill_entity( Entities.FindByClassnameNearest( "weapon_defibrillator_spawn", Vector( -1812.16, 2326.31, 80.28 ), 8 ) );

		con_comment( "KILL:\tExtra pills which are meant to be killed OnVersus but still spawn on 2nd round deleted for Versus." );

		kill_entity( Entities.FindByClassnameNearest( "weapon_pain_pills_spawn", Vector( -2534, 3449, -105 ), 6 ) );
		kill_entity( Entities.FindByClassnameNearest( "weapon_pain_pills_spawn", Vector( -2526, 3449, -105 ), 6 ) );
	}
}