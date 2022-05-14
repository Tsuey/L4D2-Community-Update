g_Chapter = "CRASH COURSE - THE ALLEYS";

devchap( "ALL MODES" );

PrecacheModel( "models/props_update/c9m1_nodraw_window.mdl" );
PrecacheModel( "models/props_junk/dumpster.mdl" );
PrecacheModel( "models/editor/playerstart.mdl" );
PrecacheModel( "models/props_highway/plywood_01.mdl" );

function DoRoundFixes()
{
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
	make_clip( "_permstuck_boxwreck_weird", "Everyone", 1, "-1 -1 0", "1 1 1", "-2836.7 -7030 128" );

	con_comment( "LOGIC:\tBile anti-skip made 2 breakwalls indestructible until howitzer fires." );

	EntFire( "zombie_breakwall01", "AddOutput", "minhealthdmg 2147483647" );
	EntFire( "zombie_breakwall09", "AddOutput", "minhealthdmg 2147483647" );
	EntFire( "fire_howitzer", "AddOutput", "OnPressed zombie_breakwall01:AddOutput:minhealthdmg 0:0:-1" );
	EntFire( "fire_howitzer", "AddOutput", "OnPressed zombie_breakwall09:AddOutput:minhealthdmg 0:0:-1" );

	if ( g_BaseMode == "versus" )
	{
		devchap( "BASE VERSUS" );

		// FIXES

		make_clip(	"_allmodes_griefrooma",		"Survivors",	1,	"0 0 0",		"530 126 950",		"156 -6648 -22" );
		make_clip(	"_allmodes_griefroomb",		"Survivors",	1,	"0 -770 0",		"130 0 950",		"28 -6652 -22" );
	}

	if ( HasPlayerControlledZombies() )
	{
		make_atomizer( "_atomizer_bsp_forklift", "-6392 -10719 64", "models/props\\cs_assault\\forklift_brokenlift.mdl", 60 );
		make_atomizer( "_atomizer_l4d1_dumpster", "-10312 -9907 0", "models/props_junk/dumpster.mdl", 30 );
		make_brush( "_losfix_ambulance",	"-1 -80 -11",	"1 60 11",	"-1431 -4449 71" );
		make_brush( "_losfix_boxcar",		"-1 -32 -10",	"1 32 10",	"-7360 -10074 2" );
		make_brush( "_losfix_shelf1",		"-1 -28 -5",	"1 28 5",	"-5331 -10944 69" );
		make_brush( "_losfix_shelf2",		"-1 -30 -5",	"1 30 5",	"561 -2002 -171" );
		make_clip( "_ladder_aftertanker_clipleft", "Everyone", 1, "-14 -4 0", "15 4 608", "-2248 -5372 -224", "0 -55 0" );
		make_clip( "_ladder_aftertanker_clipright", "Everyone", 1, "-15 -4 0", "14 4 608", "-2292 -5372 -224", "0 55 0" );
		make_clip( "_ladder_dualwindowshared_clip", "SI Players and AI", 1, "-8 -186 0", "32 186 16", "-7960 -10924 191", "42 0 0" );
		make_ladder( "_ladder_aftertankerB_cloned_flatnosetruck", "-6318 -10227 191.524", "4048 4867 -384" );
		make_ladder( "_ladder_aftertankerT_cloned_flatnosetruck", "-6318 -10227 191.524", "4048 4867 0" );
		make_ladder( "_ladder_armybarricadeleftfront_cloned_armybarricadeleftback", "-1601 -4847 126", "-3226 -9766 0", "0 -180 0", "0 -1 0" );
		make_ladder( "_ladder_deliveryfence_cloned_extrabarricade", "-368 -7289 -159.75", "-6281 -3706 291" );
		make_ladder( "_ladder_dualwindowleft_cloned_startacunit", "-8715 -9616 112", "727 -1160 -17" );
		make_ladder( "_ladder_dualwindowright_cloned_startacunit", "-8715 -9616 112", "727 -1457 -17" );
		make_ladder( "_ladder_eventsemitrailer_cloned_semitrailerleft", "-4464 -10412 83.5", "-10119 -946 -193", "0 90 0", "1 0 0" );
		make_ladder( "_ladder_firebarrelleft_cloned_firebarrelright", "-4581 -9840 128", "-14660 -5157 -64", "0 90 0", "0 -1 0" );
		make_ladder( "_ladder_gooddeliveryvan_cloned_fencedinstart", "-8308 -10255 140", "5414 -5752 -35", "0 -30 0", "-0.5 -0.86 0" );
		make_ladder( "_ladder_parkourpipeB_cloned_stainedfence", "-2953 -10850 93.792", "8003 -12985 1246", "-21 -90 0", "-1 0 0" );
		make_ladder( "_ladder_parkourpipeT_cloned_endbackfence", "-768 -865 -148", "-3712 -9404 553", "0 90 0", "-1 0 0" );
		make_ladder( "_ladder_parkourtruck_cloned_truckpassage", "-2528 -9543 128", "6483 -12894 -94", "0 -90 0", "-1 0 0" );
		make_ladder( "_ladder_semifenceleft_cloned_endbackfence", "-768 -865 -148", "-3298 -9394 224" );
		make_ladder( "_ladder_semifenceright_cloned_endbackfence", "-768 -865 -148", "-3682 -9394 224" );
		make_ladder( "_ladder_semitrailerright_cloned_semitrailerleft", "-4464 -10412 83.5", "310 7 0" );
		make_ladder( "_ladder_shortvanqol_cloned_shortwarehouse", "-5615 -10230.5 32", "-1398 -9 4" );
		make_ladder( "_ladder_wreckedboxcar_cloned_bridgesemitrailer", "-1486.02 -3948.02 143", "-1860 -2843 -88" );
		make_ladder( "_ladder_yesdrawwindow_cloned_boxwreckback", "-3452 -8277 71.4813", "-1028 -2347 -8" );
		make_prop( "dynamic", "_yesdrawwindow_surface", "models/props_update/c9m1_nodraw_window.mdl", "-4350.5 -10816 192", "0 270 0", "shadow_no" );
		patch_ladder( "-5432 -11009 224", "-450 0 0" );		// Move ladder on long brick wall closer to fence
		patch_ladder( "-7056 -11023 140", "360 0 0" );		// Move ladder behind fence closer to play

		con_comment( "PROP:\tDumpster near \"_ladder_yesdrawwindow\" moved to improve accessibility." );

		kill_entity( Entities.FindByClassnameNearest( "prop_physics", Vector( -4433.81, -10580.1, 1.9375 ), 8 ) );
		make_prop( "physics", "_replacement_dumpster", "models/props_junk/dumpster.mdl", "-4392 -10597 5", "0 90 0", "shadow_no" );

		con_comment( "LOGIC:\tLowered health of 4 breakwalls from 8.3 scratches to 5 scratches." );

		DoEntFire( "!self", "AddOutput", "health 30", 0.0, null, Entities.FindByClassnameNearest( "func_breakable", Vector( -1672, -5952, 96 ), 1 ) );
		DoEntFire( "!self", "AddOutput", "health 30", 0.0, null, Entities.FindByClassnameNearest( "func_breakable", Vector( -1672, -5696, 96 ), 1 ) );
		EntFire( "zombie_breakwall01", "AddOutput", "health 30" );
		EntFire( "zombie_breakwall09", "AddOutput", "health 30" );

		con_comment( "KILL:\tDeleted 5 func_brush wooden planks and 5 func_brush entry blockers." );

		EntFire( "versus_doorblockers", "Kill" );

		kill_funcinfclip( 145.969 );		// Delete clip in 1st closet
		kill_funcinfclip( 206.482 );		// Delete clip in 2nd closet
		kill_funcinfclip( 159.308 );		// Delete clip in 3rd closet
		kill_funcinfclip( 146.816 );		// Delete clip in 4th closet
		kill_funcinfclip( 129.286 );		// Delete clip in 5th closet

		// It's a secret to everybody. Except you.

		local hndCrowbar = Entities.FindByClassnameNearest( "weapon_melee_spawn", Vector( 112, -2512, -175 ), 8 );

		if ( SafelyExists( hndCrowbar ) && hndCrowbar.GetModelName() == "models/weapons/melee/w_crowbar.mdl" )
		{
			make_prop( "dynamic", "_concerned_citizen", "models/editor/playerstart.mdl", "123 -2394 -191", "0 270 10", "shadow_no", "solid_yes", "50 50 50" );
			make_prop( "dynamic", "_concerned_ply1", "models/props_highway/plywood_01.mdl", "163 -2415 -166", "0 0 0", "shadow_no" );
			make_prop( "dynamic", "_concerned_ply2", "models/props_highway/plywood_01.mdl", "163 -2415 -170", "0 0 0", "shadow_no" );

			DoEntFire( "!self", "skin", "1", 0.0, null, hndCrowbar );
			DoEntFire( "!self", "AddOutput", "weaponskin 1", 0.0, null, hndCrowbar );
		}
	}
}

function DoMapSpawnFixes()
{
	if ( HasPlayerControlledZombies() )
	{
		patch_nav_checkpoint( "337 -1550 -176" );
	}
}