g_Chapter = "NO MERCY - HOSPITAL";

devchap( "ALL MODES" );

PrecacheModel( "models/props_vents/VentBreakable01_DM01_Frame.mdl" );
PrecacheModel( "models/props_rooftop/acvent03.mdl" );
PrecacheModel( "models/props/cs_office/Light_shop.mdl" );
PrecacheModel( "models/props_update/c8m4_skylight_rooftop.mdl" );
PrecacheModel( "models/props_misc/wrongway_sign01_optimized.mdl" );
PrecacheModel( "models/props_vents/VentBreakable01.mdl" );

function DoRoundFixes()
{
	EntFire( "worldspawn", "RunScriptFile", "community/c8m4_elevatorfix" );

	make_clip(	"_permstuck_cabinetchair",	"Everyone",	1,	"-15 -15 -24",		"15 15 10",		"11935 13061 312" );
	make_clip(	"_witch_windows",		"Survivors",	1,	"3 -440 0",		"9 424 64",		"12909 12360 320" );
	make_clip(	"_booster_skylights",		"Survivors",	1,	"-256 -88 0",		"256 88 8",		"12550 12112 448" );
	make_clip(	"_nav_elevatorbutton",		"Survivors",	1,	"-4 -1 0",		"4 4 86",		"13491 15103 493" );
	make_clip( "_counterweight_edging", "Survivors", 1, "-25 -54 -666", "17 56 666", "13144 15243 5526" );
	make_clip( "_commentary_vent_oob_a", "Survivors", 1, "-4 -32 -40", "4 32 40", "12924 15104 664" );
	make_clip( "_commentary_vent_oob_b", "Survivors", 1, "-8 -56 -8", "56 8 8", "13608 14932 562.54" );
	make_clip( "_commentary_vent_oob_c", "Survivors", 1, "-8 -56 -8", "56 8 8", "13416 14952 570.788" );
	make_clip( "_commentary_vent_oob_d", "Survivors", 1, "-8 -56 -8", "56 8 8", "13288 14856 568" );
	make_clip( "_commentary_vent_oob_e", "Survivors", 1, "-8 -56 -8", "56 8 8", "13224 14344 565.252" );
	make_clip( "_commentary_vent_oob_f", "Survivors", 1, "-8 -56 -8", "56 8 8", "13032 14440 566.645" );
	make_clip( "_commentary_vent_oob_g", "Survivors", 1, "-8 -88 -8", "88 8 8", "13672 14472 566.523" );
	make_clip( "_commentary_vent_oob_h", "Survivors", 1, "-8 -88 -8", "88 8 8", "13608 14280 565.083" );

	con_comment( "FIX:\tLower and upper elevator doors will no longer break if SI spawn inside them." );

	EntFire( "door_elevouterlow", "AddOutput", "wait -1" );
	EntFire( "door_elevouterhigh", "AddOutput", "wait -1" );

	con_comment( "FIX:\tUpper generator prop made immovable until Survivors reach top of elevator." );

	EntFire( "generator01",		"DisableMotion" );
	EntFire( "elevator",		"AddOutput",	"OnReachedTop generator01:EnableMotion::0:-1" );

	if ( HasPlayerControlledZombies() )
	{
		EntFire( g_UpdateName + "_yesdrawskylight_hanginglight*", "skin", "1" );
		kill_entity( Entities.FindByName( null, "vent_ceiling_02" ) );
		kill_entity( Entities.FindByName( null, "vent_ceiling_03" ) );
		make_brush( "_losfix_icucurtain1_los", "-16 -3.6 0", "16 3.6 128", "11936 14463 424" );
		make_brush( "_losfix_icucurtain2_los", "-16 -3.6 0", "16 3.6 128", "11936 14575 424" );
		make_brush( "_losfix_icucurtain3_los", "-16 -3.6 0", "16 3.6 128", "11936 14687 424" );
		make_brush( "_losfix_icucurtain4_los", "-16 -3.6 0", "16 3.6 128", "11936 14799 424" );
		make_brush( "_losfix_icucurtain5_los", "-16 -3.6 0", "16 3.6 128", "11936 14911 424" );
		make_clip( "_losfix_icucurtain1_coll", "Everyone", 1, "-16 -3.6 0", "16 3.6 128", "11936 14463 424" );
		make_clip( "_losfix_icucurtain2_coll", "Everyone", 1, "-16 -3.6 0", "16 3.6 128", "11936 14575 424" );
		make_clip( "_losfix_icucurtain3_coll", "Everyone", 1, "-16 -3.6 0", "16 3.6 128", "11936 14687 424" );
		make_clip( "_losfix_icucurtain4_coll", "Everyone", 1, "-16 -3.6 0", "16 3.6 128", "11936 14799 424" );
		make_clip( "_losfix_icucurtain5_coll", "Everyone", 1, "-16 -3.6 0", "16 3.6 128", "11936 14911 424" );
		make_clip( "_yesdrawskylight_clipwaya", "SI Players", 1, "-8 -300 0", "0 300 376", "11912 12204 448" );
		make_clip( "_yesdrawskylight_clipwayb", "SI Players", 1, "-512 0 0", "512 8 376", "12416 11904 448" );
		make_clip( "_yesdrawskylight_clipwayc", "SI Players", 1, "0 -300 0", "8 300 376", "12920 12204 448" );
		make_ladder( "_ladder_skylighthanglight_cloned_shortestvent", "12918.5 15104 551", "27454 -726 -108", "0 90 0", "0 -1 0" );
		make_ladder( "_ladder_ventceiling02left_cloned_sinkvent", "12918.5 15104 551", "-1856 27209 -48", "0 -90 0", "0 1 0" );
		make_ladder( "_ladder_ventceiling03right_cloned_sinkvent", "12918.5 15104 551", "169 -689 10" );
		make_prop( "dynamic", "_ventceiling02_static", "models/props_vents/VentBreakable01_DM01_Frame.mdl", "13248 14320 554", "90 90 0", "shadow_no", "solid_no" );
		make_prop( "dynamic", "_yesdrawskylight_acvent1", "models/props_rooftop/acvent03.mdl", "12343 12237 448", "0 0 0", "shadow_no" );
		make_prop( "dynamic", "_yesdrawskylight_acvent2", "models/props_rooftop/acvent03.mdl", "12343 12365 448", "0 0 0", "shadow_no" );
		make_prop( "dynamic", "_yesdrawskylight_hanginglight1", "models/props/cs_office/Light_shop.mdl", "12348.2 12200.3 373", "0 0 0", "shadow_no", "solid_no" );
		make_prop( "dynamic", "_yesdrawskylight_hanginglight2", "models/props/cs_office/Light_shop.mdl", "12380 12758 373", "0 0 0", "shadow_no", "solid_no" );
		make_prop( "dynamic", "_yesdrawskylight_hanginglight3", "models/props/cs_office/Light_shop.mdl", "12380 12911 373", "0 0 0", "shadow_no", "solid_no" );
		make_prop( "dynamic", "_yesdrawskylight_roof", "models/props_update/c8m4_skylight_rooftop.mdl", "12416 12216 447", "0 270 0", "shadow_no" );
		make_prop( "dynamic", "_yesdrawskylight_wrongway1", "models/props_misc/wrongway_sign01_optimized.mdl", "11903.5 12326.2 511.365", "0 0 0", "shadow_no", "solid_no", "255 255 255", 217, 17 );
		make_prop( "dynamic", "_yesdrawskylight_wrongway2", "models/props_misc/wrongway_sign01_optimized.mdl", "11903.5 12070.2 511.365", "0 0 0", "shadow_no", "solid_no", "255 255 255", 217, 17 );
		make_prop( "dynamic", "_yesdrawskylight_wrongway3", "models/props_misc/wrongway_sign01_optimized.mdl", "12117.5 11902.2 511.365", "0 90 0", "shadow_no", "solid_no", "255 255 255", 217, 17 );
		make_prop( "dynamic", "_yesdrawskylight_wrongway4", "models/props_misc/wrongway_sign01_optimized.mdl", "12415.5 11902.2 511.365", "0 90 0", "shadow_no", "solid_no", "255 255 255", 217, 17 );
		make_prop( "dynamic", "_yesdrawskylight_wrongway5", "models/props_misc/wrongway_sign01_optimized.mdl", "12713.5 11902.2 511.365", "0 90 0", "shadow_no", "solid_no", "255 255 255", 217, 17 );
		make_prop( "dynamic", "_yesdrawskylight_wrongway6", "models/props_misc/wrongway_sign01_optimized.mdl", "12927.5 12070.2 511.365", "0 180 0", "shadow_no", "solid_no", "255 255 255", 217, 17 );
		make_prop( "dynamic", "_yesdrawskylight_wrongway7", "models/props_misc/wrongway_sign01_optimized.mdl", "12927.5 12326.2 511.365", "0 180 0", "shadow_no", "solid_no", "255 255 255", 217, 17 );
		make_prop( "dynamic_ovr", "_ventceiling03_static", "models/props_vents/VentBreakable01.mdl", "13090 14416 520", "0 180 0", "shadow_no" );

		EntFire( g_UpdateName + "_ladder_skylighthanglight_cloned_shortestvent", "SetParent", g_UpdateName + "_yesdrawskylight_hanginglight1" );

		EntFire( g_UpdateName + "_ladder_ventceiling02left_cloned_sinkvent", "SetParent", g_UpdateName + "_ventceiling02_static" );

		con_comment( "QOL:\tThe breakable railings in the cafeteria have had their health reduced for Versus-only QoL." );
		DoEntFire( "!self", "AddOutput", "health 18", 0.0, null, Entities.FindByClassnameNearest( "func_breakable", Vector( 12423, 12014, 244.5 ), 1 ) );
		DoEntFire( "!self", "AddOutput", "health 18", 0.0, null, Entities.FindByClassnameNearest( "func_breakable", Vector( 12278, 12150.5, 308.5 ), 1 ) );
		DoEntFire( "!self", "AddOutput", "health 18", 0.0, null, Entities.FindByClassnameNearest( "func_breakable", Vector( 12278, 12716, 308.5 ), 1 ) );
		DoEntFire( "!self", "AddOutput", "health 18", 0.0, null, Entities.FindByClassnameNearest( "func_breakable", Vector( 12278, 12935.5, 308.5 ), 1 ) );
	}
}