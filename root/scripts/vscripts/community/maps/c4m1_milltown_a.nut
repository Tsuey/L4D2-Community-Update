g_Chapter = "HARD RAIN - MILLTOWN";

devchap( "ALL MODES" );

PrecacheModel( "models/props_downtown/gutter_downspout_straight_160_02.mdl" );
PrecacheModel( "models/props_interiors/concretepillar01_dm_base.mdl" );
PrecacheModel( "models/props_interiors/concretepillar01.mdl" );
PrecacheModel( "models/props_pipes/PipeSet02d_512_001a.mdl" );
PrecacheModel( "models/props_mill/PipeSet08d_512_001a.mdl" );

function DoRoundFixes()
{
	make_clip(	"_woodwindow","Survivors",	1,	"-48 -1 -39",		"48 1 39",		"4144 -1423 391" );
	make_clip(	"_permstuck_shruba",		"SI Players",	1,	"-60 -32 -36",		"60 72 60",		"3668 -1664 132" );
	make_clip(	"_permstuck_shrubb",		"SI Players",	1,	"-64 -64 -48",		"64 64 48",		"3408 -1760 144" );
	make_clip(	"_commonhop_safehouse",		"Survivors",	1,	"-280 -456 0",		"280 456 1100",		"3984 -1863 464" );
	make_clip(	"_booster_burgertankpole",	"Survivors",	1,	"-12 -12 -170",		"12 12 1000",		"-5800 7496 603" );
	make_clip(	"_booster_burgertankspin",	"Survivors",	1,	"-216 -216 -170",	"216 216 640",		"-5800 7496 915" );
	make_clip( "_booster_ginnytop", "Survivors", 1, "-22 -29 0", "17 29 1150", "-5425 6789 385", "0 45 0" );
	make_clip( "_booster_ginnyjon", "Survivors", 1, "-6 -4 -284", "10 4 0", "-5425 6789 385", "0 45 0" );
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

	// Prevent Survivor bots from picking up items inside c4m4's saferoom.

	local item = null;

	while ( item = Entities.FindInSphere( item, Vector( -3140, 7815, 175 ), 80 ) )
	{
		if ( item.IsValid() )
		{
			if ( item.GetClassname().find("weapon_") != null )
				NetProps.SetPropInt( item, "m_fEffects", 32 );
		}
	}

	if ( g_BaseMode == "versus" )
	{
		devchap( "BASE VERSUS" );

		// FIXES

		make_clip( "_treehouse_whitefence", "Survivors", 1, "-17 -80 0", "17 77 1125", "1767 2219 267" );

	}
	if ( g_BaseMode == "survival" )
	{
		devchap( "BASE SURVIVAL" );

		// FIXES

		make_clip( "_survivalbig_skyboxcap", "Survivors", 1, "-1742 -907 0", "1706 1757 32", "-5802 7499 1248" );

	}

	if ( HasPlayerControlledZombies() )
	{
		make_brush( "_losfix_ambulance1",	"-90 -1 -8",	"91 1 8",	"711 4748 102" );
		make_brush( "_losfix_ambulance2",	"-1 -56 -8",	"1 57 8",	"803 4690 102" );
		make_brush( "_losfix_burger_gen",	"-24 -1 -8",	"24 1 8",	"-5448 6765 107" );
		make_brush( "_losfix_dumpster",		"-185 -1 -8",	"185 1 8",	"3550 343 128" );
		make_brush( "_losfix_gen1",		"-28 -1 -10",	"28 1 10",	"241 5987 107" );
		make_brush( "_losfix_gen2",		"-22 -1 -8",	"22 1 8",	"3448 -1345 113" );
		make_brush( "_losfix_semia",		"-40 -1 -15",	"40 1 15",	"-4771 7156 113" );
		make_brush( "_losfix_semib",		"-1 -34 -15",	"1 40 15",	"-4790 7180 113" );
		make_brush( "_losfix_trailer1",		"-1 -48 -10",	"1 48 10",	"-3370 7548 106" );
		make_brush( "_losfix_trailer2",		"-56 -1 -10",	"57 1 10",	"-3428 7594 106" );
		make_brush( "_losfix_trailer3",		"-86 -1 -10",	"86 1 10",	"-3510 7618 106" );
		make_brush( "_losfix_truck",		"-62 -1 -10",	"62 1 10",	"3217 -1376 114" );
		make_brush( "_losfix_truck_jump",	"-70 -1 -10",	"70 1 10",	"2949 2885 108" );
		make_clip( "_ladder_dumpsterhouse_clip", "Everyone", 1, "-8 -16 0", "26 8 168", "1638 4032 217", "0 45 0" );
		make_clip( "_ladder_safehousetall_clip", "SI Players", 1, "-20 -2 -2", "8 2 310", "3725 -1537 101", "0 45 0" );
		make_clip( "_ladder_sweetrelief_clip", "Everyone", 1, "-8 -16 0", "8 9 212", "-5746 6595 96", "0 53 0" );
		make_clip( "_ladder_yellowhousetree_topdenial", "SI Players", 1, "-8 -32 0", "8 32 62", "2244 3123 378", "-7 0 0" );
		make_clip( "_playgroundhouse_clip", "Survivors", 1, "-54 -177 -35", "635 176 1176", "-2074 7312 360" );
		make_clip( "_safehousehedge_blocker", "SI Players", 1, "-690 -122 -20", "139 93 2122", "4401 -2207 438" );
		make_ladder( "_ladder_autosalvagefront_cloned_playgroundroof", "-2041.58 7141.5 215.154", "-4077 930 8" );
		make_ladder( "_ladder_classyjimboblue_cloned_garagesalehouse", "2468 2634 184", "-6814 4053 0" );
		make_ladder( "_ladder_cornerhomeplants_cloned_garagesalehome", "2468 2634 184", "3773 4652 128", "0 90 0", "-1 0 0" );
		make_ladder( "_ladder_cornerhometankfight_cloned_treehousefence", "2058.5 2999.08 151.11", "1958 155 0" );
		make_ladder( "_ladder_cullingsub_cloned_cullingbuddy", "-4083 7580 170", "-11738 3696 -9", "0 -90 0", "0 -1 0" );
		make_ladder( "_ladder_dumpsterhouse_cloned_alarmtrailer", "677.5 2966 212.223", "-1309 4697 88", "0 270 0", "0 -1 0" );
		make_ladder( "_ladder_finalhouse_cloned_yellowhouse", "3510.5 917 182.881", "2993 3583 -14", "0 -90 0", "0 1 0" );
		make_ladder( "_ladder_gaselecbox_cloned_autosalvageback", "-5876.19 8673.97 236.888", "4059 13901 -58", "0 90 0", "-1 0 0" );
		make_ladder( "_ladder_grocerypillar_cloned_garagesalehouse", "2468 2634 184", "-8299 8596 5", "0 -90 0", "1 0 0" );
		make_ladder( "_ladder_mobilepickup_cloned_alarmtrailer", "677.5 2966 212.223", "1675 8269 -36", "0 -180 0", "-1 0 0" );
		make_ladder( "_ladder_safehousefenceback_cloned_cullingbuddy", "-4083 7580 170", "7421 -9698 -9" );
		make_ladder( "_ladder_safehousetall_cloned_tallbuildingleft", "-885 5961 269.556", "9680 -675 -26", "0 90 0", "-1 0 0" );
		make_ladder( "_ladder_saferoofpipe_cloned_tallbuildingleft", "-885 5961 269.556", "9680 -880 -26", "0 90 0", "-1 0 0" );
		make_ladder( "_ladder_sweetrelief_cloned_autosalvageback", "-5876.19 8673.97 236.888", "112 -2069 -56" );
		make_ladder( "_ladder_tallbuildingright_cloned_tallbuildingleft", "-885 5961 269.557", "5057 6467 -2", "0 90 0", "-1 0 0" );
		make_ladder( "_ladder_trailerqol_cloned_alarmtrailer", "677.5 2966 212.223", "2555 3388 -66", "0 66 0", "0.4 0.9 0" );
		make_ladder( "_ladder_vinehouseqol_cloned_alarmtrailer", "677.5 2966 212.223", "-3107 6241 -32", "0 -90 0", "0 -1 0" );
		make_ladder( "_ladder_woodhouseqol_cloned_alarmtrailer", "677.5 2966 212.223", "2908 4383 -40", "0 90 0", "0 1 0" );
		make_ladder( "_ladder_yellowhousetree_cloned_playgroundgutter", "-2041.58 7141.5 215.154", "9311 5106 -851", "3 90 6", "1 0 0" );
		make_prop( "dynamic", "_ladder_finalhouse_pipe", "models/props_downtown/gutter_downspout_straight_160_02.mdl", "3910 71 248", "0 90 0", "shadow_no" );
		make_prop( "dynamic", "_ladder_grocerypillar_bust", "models/props_interiors/concretepillar01_dm_base.mdl", "-5680 6576 160.2", "0 0 0", "shadow_no" );
		make_prop( "dynamic", "_ladder_grocerypillar_prop", "models/props_interiors/concretepillar01.mdl", "-5680 6128 163.8", "0 0 0", "shadow_no" );
		make_prop( "dynamic", "_ladder_safehouse_pipe", "models/props_pipes/PipeSet02d_512_001a.mdl", "3726 -1560 160", "-90 90 0", "shadow_no", "solid_no" );
		make_prop( "dynamic", "_ladder_saferoofpipe_pipe", "models/props_mill/PipeSet08d_512_001a.mdl", "3726 -1765 158", "90 90 0", "shadow_no" );

		EntFire( g_UpdateName + "_ladder_grocerypillar_prop", "AddOutput", "OnBreak " + g_UpdateName + "_ladder_grocerypillar_cloned_garagesalehouse:Kill::0:-1" );
	}
}

function DoMapSpawnFixes()
{
	make_decal( "decals/rollermine_crater",	"-5671 6579 225" );
}