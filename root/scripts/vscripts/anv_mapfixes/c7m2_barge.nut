g_Chapter = "THE SACRIFICE - BARGE";

devchap( "ALL MODES" );

function DoRoundFixes()
{
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

	if ( g_BaseMode == "scavenge" )
	{
		devchap( "BASE SCAVENGE" );

		// FIXES

		make_clip(	"_scavenge_jump_woodbrush",	"Survivors",	1,	"-842 -8 0",		"216 8 988",		"-9100 392 262" );

	}

	if ( HasPlayerControlledZombies() )
	{
		make_ladder( "_ladder_bluecontback_cloned_bluecontfront", "6787.2104 2431.76 196", "13183 4909 -6", "0 180 0", "-1 0 0" );
		make_ladder( "_ladder_comicboatsleftL_cloned_toolhouse", "-633 2008 254.462", "2764 -592 -344", "6 64.4 0", "0.43 0.9 0" );
		make_ladder( "_ladder_comicboatsleftR_cloned_toolhouse", "-633 2008 254.462", "2738 -580 -344", "6 64.4 0", "0.43 0.9 0" );
		make_ladder( "_ladder_comicboatsright_cloned_toolhouse", "-633 2008 254.462", "1602 555 -222", "0 90 0", "0 1 0" );
		make_ladder( "_ladder_comicpylonleft_cloned_toolhouse", "-633 2008 254.462", "1190 -2732 -8", "-2 -19 -5", "0.93 -0.35 0" );
		make_ladder( "_ladder_comicpylonright_cloned_toolhouse", "-633 2008 254.462", "783 -2540 26", "-2 -19 -5", "0.93 -0.35 0" );
		make_ladder( "_ladder_comicwitchboat_cloned_toolhouse", "-633 2008 254.462", "971 3616 -216", "-6 155.8 1", "-0.91 0.4 0" );
		make_ladder( "_ladder_endbarricadeleft_cloned_vanishbarricade", "-8918.5 1728 198.5", "-1940 4860 -3", "0 30 0", "0.86 0.5 0" );
		make_ladder( "_ladder_endbarricaderight_cloned_nomanssemi", "-6769.9307 249.9129 83.622", "-2373 430 103", "0 -12 0", "-0.87 -0.5 0" );
		make_ladder( "_ladder_overpassgapleft_cloned_fourcontainers", "2024 2585 312", "1089 7 -48" );
		make_ladder( "_ladder_overpassgapright_cloned_fourcontainers", "2024 2585 312", "1410 7 -48" );
		make_ladder( "_ladder_permstuckend_cloned_toolhouse", "-633 2008 254.462", "-8964 3427 -54", "0 105 0", "-0.24 0.96 0" );
		make_ladder( "_ladder_pondareafence_cloned_startflatnosefence", "9572 914 204", "-741 841 0" );
		make_ladder( "_ladder_shedwindow_cloned_barrelshort", "3576 2015 165.579", "5985 4958 -100", "0 -90 0", "-1 0 0" );
		make_ladder( "_ladder_silofenceclone1_cloned_silofencesource", "6816 321 248.1575", "-1250 127 0" );
		make_ladder( "_ladder_spectroleumtanker_cloned_spectroleumfence", "6269 632 204.057", "-676 -1582 -6", "0 20.17 0", "-0.94 -0.33 0" );
		make_ladder( "_ladder_startroombrick_cloned_startareasemi", "10355 1488 210.5", "-94 911 13" );
		make_ladder( "_ladder_tankpolesfenceleft_cloned_tankpolesfenceright", "1617 544 332", "0 -515 0" );
		make_ladder( "_ladder_tankpoleswallL_cloned_tankpolesfenceright", "1617 544 332", "1532 960 -152", "0 -102.11 0", "-0.2 -0.97 0" );
		make_ladder( "_ladder_tankpoleswallR_cloned_tankpolesfenceright", "1617 544 332", "1560 954 -152", "0 -102.11 0", "-0.2 -0.97 0" );
	}
}