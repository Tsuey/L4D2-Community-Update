g_Chapter = "HARD RAIN - TOWN ESCAPE";

devchap( "ALL MODES" );

PrecacheModel( "models/props_interiors/concretepillar01_dm_base.mdl" );
PrecacheModel( "models/props_interiors/concretepillar01.mdl" );
PrecacheModel( "models/props_interiors/concretepiller01_dm01.mdl" );
PrecacheModel( "models/props_interiors/concretepiller01_dm01_1.mdl" );
PrecacheModel( "models/props_interiors/concretepiller01_dm01_2.mdl" );
PrecacheModel( "models/props_interiors/concretepiller01_dm01_3.mdl" );
PrecacheModel( "models/props_interiors/concretepiller01_dm01_4.mdl" );

function DoRoundFixes()
{
	// make_clip(	"_backtrack_dumpster",		"Survivors",	1,	"-32 -40 0",		"32 40 1337",		"-4128 7481 150" );
	// make_clip(	"_backtrack_flatnose",		"Survivors",	1,	"0 -110 0",		"540 8 1212",		"-4632 7208 272",	"0 -34 0" );
	make_clip(	"_booster_burgertankpole",	"Survivors",	1,	"-12 -12 -170",		"12 12 1000",		"-5800 7496 603" );
	make_clip(	"_booster_burgertankspin",	"Survivors",	1,	"-216 -216 -170",	"216 216 640",		"-5800 7496 915" );
	make_clip( "_permstuck_highuptree", "Everyone", 1, "-32 -54 0", "24 24 10", "-3312 7326 315" );
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
	make_clip( "_dockm5only_smoother", "Everyone", 1, "0 -376 0", "8 820 32", "-7039 7701 91", "-45 0 0" );
	make_clip( "_commentary_clipgap_water", "Everyone", 1, "-500 -528 -80", "400 200 3000", "-7580.84 6948.33 -303" );
	make_clip( "_commentary_smoother_burgersuv_a", "All and Physics", 1, "0 -5 0", "70 10 10", "-6577 7549 169.753", "0 30 0" );
	make_clip( "_commentary_smoother_burgersuv_b", "All and Physics", 1, "0 -10 0", "70 8 10", "-6582 7554 161.753", "0 30 0" );
	make_clip( "_commentary_smoother_burgersuv_c", "All and Physics", 1, "0 -10 0", "70 5 10", "-6586 7562 153.753", "0 30 0" );
	make_clip( "_commentary_booster_burgertree_a1", "Survivors", 1, "-148 -99 -608", "148 99 608", "-6255 6674 928" );
	make_clip( "_commentary_booster_burgertree_a2", "Survivors", 1, "-37 -93 -552", "37 93 552", "-6257 6827 984" );
	make_clip( "_commentary_booster_burgertree_b1", "Survivors", 1, "-100 -81 -604", "100 81 604", "-4726 6761 932" );
	make_clip( "_commentary_booster_burgertree_b2", "Survivors", 1, "-46 -112 -584", "46 112 584", "-4783 6887 952" );
	make_clip( "_commentary_booster_burgertree_c1", "Survivors", 1, "-142 -123 -608", "142 123 608", "-7004 8145 928" );
	make_clip( "_commentary_booster_burgertree_c2", "Survivors", 1, "-58 -61 -616", "58 61 616", "-6824 8307 920" );
	make_clip( "_commentary_booster_burgertree_d", "Survivors", 1, "-148 -145 -612", "148 145 612", "-4701 8538 924" );
	make_clip( "_commentary_booster_burgertree_e", "Survivors", 1, "-178 -136 -608", "178 136 608", "-5397 7956 928" );
	make_clip( "_commentary_booster_burgertree_f", "Survivors", 1, "-178 -134 -628", "178 134 628", "-6806 7205 908" );

	if ( g_BaseMode == "coop" || g_BaseMode == "realism" )
	{
		// Get nav tiles by position because IDS can change if edited later on
		make_trig_godspot([
			Vector(-7189, 7412, 86),
			Vector(-7145, 7415, 116)
		])
	}
	if ( HasPlayerControlledZombies() )
	{
		make_brush( "_losfix_burger_gen",	"-24 -1 -8",	"24 1 8",	"-5448 6765 107" );
		make_brush( "_losfix_dock_truck",	"-2 -75 -10",	"2 80 16",	"-6538 7550 105" );
		make_brush( "_losfix_semia",		"-40 -1 -15",	"40 1 15",	"-4771 7156 113" );
		make_brush( "_losfix_semib",		"-1 -34 -15",	"1 40 15",	"-4790 7180 113" );
		make_clip( "_burgertank_windowsmoother1", "Everyone", 1, "-5 -120 0", "6 120 4", "-5663 7268 135" );
		make_clip( "_burgertank_windowsmoother2", "Everyone", 1, "-90 -5 0", "90 6 4", "-5798 7505 135" );
		make_clip( "_burgertank_windowsmoother3", "Everyone", 1, "-90 -5 0", "90 6 4", "-6022 7777 135" );
		make_clip( "_dockm5only_smoother", "Everyone", 1, "0 -376 0", "8 820 32", "-7039 7701 91", "-45 0 0" );
		make_clip( "_ladder_sweetrelief_clip", "Everyone", 1, "-8 -16 0", "8 9 212", "-5746 6595 96", "0 53 0" );
		make_ladder( "_ladder_autosalvagefront_cloned_playgroundroof", "-2041.58 7141.5 215.154", "-4077 930 8" );
		make_ladder( "_ladder_classyjimboblue_cloned_garagesalehouse", "2468 2634 184", "-6814 4053 0" );
		make_ladder( "_ladder_cullingsub_cloned_cullingbuddy", "-4083 7580 170", "-11738 3696 -9", "0 -90 0", "0 -1 0" );
		make_ladder( "_ladder_gaselecbox_cloned_autosalvageback", "-5876.19 8673.97 236.888", "4059 13901 -58", "0 90 0", "-1 0 0" );
		make_ladder( "_ladder_grocerypillar_cloned_garagesalehouse", "2468 2634 184", "-8299 8596 12", "0 -90 0", "1 0 0" );
		make_ladder( "_ladder_sweetrelief_cloned_autosalvageback", "-5876.19 8673.97 236.888", "112 -2069 -56" );
		make_prop( "dynamic", "_ladder_grocerypillar_bust", "models/props_interiors/concretepillar01_dm_base.mdl", "-5680 6576 160.2", "0 0 0", "shadow_no" );
		make_prop( "dynamic", "_ladder_grocerypillar_prop", "models/props_interiors/concretepillar01.mdl", "-5680 6128 163.8", "0 0 0", "shadow_no" );

		EntFire( g_UpdateName + "_ladder_grocerypillar_prop", "AddOutput", "OnBreak " + g_UpdateName + "_ladder_grocerypillar_cloned_garagesalehouse:Kill::0:-1" );
	}
}

function DoMapSpawnFixes()
{
	make_decal( "decals/rollermine_crater",	"-5671 6579 225" );
}
