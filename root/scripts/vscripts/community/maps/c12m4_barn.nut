g_Chapter = "BLOOD HARVEST - THE TRAIN STATION";

devchap( "ALL MODES" );

PrecacheModel( "models/props/cs_militia/fireplacechimney01.mdl" );
PrecacheModel( "models/props_mill/PipeSet08d_256_001a.mdl" );
PrecacheModel( "models/props_rooftop/Gutter_Pipe_256.mdl" );

function DoRoundFixes()
{
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

	// FIX: Prevent skipping bridge horde by forcing it even if fence is jumped.

	con_comment( "TRIG:\tNew trigger will enforce onslaught even if fence is jumped." );

	// Make blockers to (temporarily) prevent train car commonhop skip.

	make_clip( "_eventskip_commonhopa", "Survivors", 1, "-70 -260 0", "70 300 1700", "10548 -4639 66", "0 -60 0" );
	make_clip( "_eventskip_commonhopb", "Survivors", 1, "-70 -380 0", "70 290 1653", "10125 -4780 113", "0 -45 0" );

	// Create new trigger to enforce onslaught even if Survivors alternatively jump fence.

	SpawnEntityFromTable( "trigger_once",
	{
		targetname	= g_UpdateName + "_eventskip_fence_trigonce",
		StartDisabled	= 0,
		spawnflags	= 1,
		filtername	= "anv_globalfixes_filter_survivor",
		origin		= Vector( 10553, -3506, -452 )
	} );

	EntFire( g_UpdateName + "_eventskip_fence_trigonce", "AddOutput", "mins -8 -216 0" );
	EntFire( g_UpdateName + "_eventskip_fence_trigonce", "AddOutput", "maxs 8 145 365" );
	EntFire( g_UpdateName + "_eventskip_fence_trigonce", "AddOutput", "solid 2" );

	// Inject I/O into original trigger_once (at the normal window path) to delete the
	// blockers and also delete the (then-redundant) new trigger_once. If new trigger
	// is touched first then delete original. New trigger deletes the blockers. Note that
	// original uses "OnTrigger" instead of "OnStartTouch".

	EntFire( "window_trigger", "AddOutput", "OnTrigger " + g_UpdateName + "_eventskip_commonhop*:Kill::0:-1" );
	EntFire( "window_trigger", "AddOutput", "OnTrigger " + g_UpdateName + "_eventskip_fence_trigonce:Kill::0:-1" );

	EntFire( g_UpdateName + "_eventskip_fence_trigonce", "AddOutput", "OnTrigger " + g_UpdateName + "_eventskip_commonhop*:Kill::0:-1" );
	EntFire( g_UpdateName + "_eventskip_fence_trigonce", "AddOutput", "OnTrigger window_trigger:Kill::0:-1" );

	// Replicate the original trigger_once's "OnTrigger" Outputs to the new trigger.

	EntFire( g_UpdateName + "_eventskip_fence_trigonce", "AddOutput", "OnTrigger director:EndScript::0:-1" );
	EntFire( g_UpdateName + "_eventskip_fence_trigonce", "AddOutput", "OnTrigger zombie_spawn_relay:Trigger::1:-1" );
	EntFire( g_UpdateName + "_eventskip_fence_trigonce", "AddOutput", "OnTrigger onslaught:GenerateGameEvent::1:-1" );
	EntFire( g_UpdateName + "_eventskip_fence_trigonce", "AddOutput", "OnTrigger director:BeginScript:c12m4_onslaught:1.5:-1" );

	if ( g_BaseMode == "coop" || g_BaseMode == "realism" )
	{
		devchap( "BASE COOP" );

		// FIXES

		con_comment( "TRIG_UNDO:\tDelete blockers which prevent train car commonhop skip for Coop-only." );

		EntFire( g_UpdateName + "_eventskip_commonhop*", "Kill", null, 4 );
	}
	if ( g_BaseMode == "versus" )
	{
		devchap( "BASE VERSUS" );

		// FIXES

		make_clip( "_commonhop_roadsidefence", "Survivors", 1, "-3 -29 0", "5 27 1608", "10647 -7547 84" );
		make_clip( "_clipextend_traintruss", "Survivors", 1, "-204 -4 0", "208 128 1462", "10444 -7516 232" );

		make_clip(	"_shortcut_warehouse",		"Survivors",	1,	"0 -32 -32",		"8 64 256",		"10272 -7848 152" );
		make_clip(	"_commonhop_traintruss",	"Survivors",	1,	"-160 -120 -55",	"160 120 1545",		"10879 -7463 116" );
	}

	if ( HasPlayerControlledZombies() )
	{
		make_brush( "_losfix_semia",		"-1 -30 -15",	"1 30 15",	"11440 -7078 -56" );
		make_brush( "_losfix_semib",		"-50 -1 -15",	"30 1 15",	"11440 -7048 -56" );
		make_clip( "_ladder_barnhousedoor_clip", "Everyone", 1, "-2 -112 9", "2 112 21", "8994 -9312 471" );
		make_clip( "_ladder_finalrooftop_permstuck", "Everyone", 1, "-53 -19 0", "21 31 100", "10827 -4563 -62" );
		make_clip( "_ladder_siloleft_clip1", "SI Players", 1, "-50 -24 0", "50 24 1", "8556 -7849 1035", "0 -52 0" );
		make_clip( "_ladder_siloleft_clip2", "SI Players", 1, "-50 -24 0", "50 24 1", "8541 -7849 1052", "0 -52 0" );
		make_clip( "_ladder_siloright_clip1", "SI Players", 1, "-50 -24 0", "50 24 1", "8909 -7849 1035", "0 -52 0" );
		make_clip( "_ladder_siloright_clip2", "SI Players", 1, "-50 -24 0", "50 24 1", "8894 -7849 1052", "0 -52 0" );
		make_clip( "_ladder_siloshared_clip", "SI Players", 1, "-170 -136 -72", "183 76 64", "8608 -7937 1001" );
		make_clip( "_ladder_upperplanks_clipleft", "Everyone", 1, "-16 -5 0", "1 4 179", "10743 -9075 -11", "0 -33 0" );
		make_clip( "_ladder_upperplanks_clipright", "Everyone", 1, "-46 -5 0", "25 4 179", "10678 -9067 -11" );
		make_ladder( "_ladder_atlanticdiesel_cloned_trussfenceback", "10528 -7510 10", "436 -211 250" );
		make_ladder( "_ladder_atlanticroofback_cloned_atlanticpipe", "11150 -9016 104.5", "447 1011 -40" );
		make_ladder( "_ladder_atlanticroofleftB_cloned_bridgetower", "10321 -1894 162.5", "304 -5778 -282" );
		make_ladder( "_ladder_atlanticroofleftT_cloned_bridgetower", "10321 -1894 162.5", "304 -5778 -90" );
		make_ladder( "_ladder_barnhousedoor_cloned_atlanticpipe", "11150 -9016 104.5", "-2157 -216 327" );
		make_ladder( "_ladder_crashedback_cloned_trussfencefront", "10384 -7522 10", "5 -2721 -52" );
		make_ladder( "_ladder_crashedfront_cloned_trussfenceback", "10528 -7510 10", "-226.425 -2677 -37" );
		make_ladder( "_ladder_elevatedhome_cloned_trussfencefront", "10384 -7522 10", "-1016 -72 16", "0 9 0", "0.16 -0.98 0" );
		make_ladder( "_ladder_finalrooftopB_cloned_bridgetower", "10321 -1894 162.5", "504 -2712 -251" );
		make_ladder( "_ladder_finalrooftopT_cloned_bridgetower", "10321 -1894 162.5", "504 -2712 -59" );
		make_ladder( "_ladder_rocklobboxcar_cloned_trussfencefront", "10384 -7522 10", "23 -1461 27" );
		make_ladder( "_ladder_shortfenceL_cloned_trussfencefront", "10384 -7522 10", "-860 -555 243" );
		make_ladder( "_ladder_shortfenceR_cloned_bridgetower", "10321 -1894 162.5", "-1177 -8175 165.5" );
		make_ladder( "_ladder_siloleft_cloned_atlanticpipe", "11150 -9016 104.5", "-5753 -7451 420", "0 37.5 0", "0.78 0.62 0" );
		make_ladder( "_ladder_siloleft_cloned_atlanticpipe", "11150 -9016 104.5", "-5753 -7451 740", "0 37.5 0", "0.78 0.62 0" );
		make_ladder( "_ladder_siloright_cloned_atlanticpipe", "11150 -9016 104.5", "-5401 -7452 420", "0 37.5 0", "0.78 0.62 0" );
		make_ladder( "_ladder_siloright_cloned_atlanticpipe", "11150 -9016 104.5", "-5401 -7452 740", "0 37.5 0", "0.78 0.62 0" );
		make_ladder( "_ladder_upperplanks_cloned_bridgetower", "10321 -1894 162.5", "12612 1256 -89", "0 -90 0", "0 1 0" );
		make_ladder( "_ladder_wreckedboxcar_cloned_trussfencefront", "10384 -7522 10", "-1595 -10109 -10", "0 58 0", "0.85 -0.53 0" );
		make_prop( "dynamic", "_ladder_atlanticroofback_pipe", "models/props_mill/PipeSet08d_256_001a.mdl", "11590 -8002 77", "-90 90 180", "shadow_no" );
		make_prop( "dynamic", "_ladder_atlanticroofleft_pipe", "models/props_rooftop/Gutter_Pipe_256.mdl", "10632 -7672 168", "0 -90 0", "shadow_no" );
		make_prop( "dynamic", "_ladder_finalrooftop_pipe", "models/props_mill/PipeSet08d_256_001a.mdl", "10842 -4603 84", "90 90 0", "shadow_no" );
		make_prop( "dynamic", "_solidify_finalchimney1", "models/props/cs_militia/fireplacechimney01.mdl", "11020 -4586 329", "0 135 0", "shadow_no" );
		make_prop( "dynamic", "_solidify_finalchimney2", "models/props/cs_militia/fireplacechimney01.mdl", "11020 -4073 329", "0 135 0", "shadow_no" );
		patch_ladder( "11314.7 -4535 -259.108", "0 -22 9" );
	}

	// Resolve stuck Tank spawns for Taaannnk! Mutation.

	if ( g_MutaMode == "mutation19" )
	{
		// There's 60 func_playerinfected_clip on this map but most smooth
		// perimeter fences and all are thick enough to block excess nav.
		// Only exception appears to be behind the starting safe room.

		make_clip( "_tankstuck_safeback", "SI Players", 1, "-170 -640 -100", "170 225 1700", "7704 -11710 425" );
	}
}

function DoTankWarp( hndTank )
{
	// Move Tank spawn from hillside before event area to top of trains (~60% boss flow).

	if ( CheckToWarpTank( hndTank, [10535, -5508, 11360, -4625] ) )
	{
		hndTank.SetOrigin( Vector( 10492, -4633, 57.9 ) );
	}
}