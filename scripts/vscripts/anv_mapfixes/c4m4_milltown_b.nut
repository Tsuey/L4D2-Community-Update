g_Chapter = "HARD RAIN - RETURN TO TOWN";

devchap( "ALL MODES" );

// FIXES_ALL

make_clip(	"_woodwindow",          "Survivors",	1,	"-48 -1 -39",		"48 1 39",		"4144 -1423 391" );
make_clip(	"_permstuck_shruba",		"SI Players",	1,	"-60 -32 -36",		"60 72 60",		"3668 -1664 132" );
make_clip(	"_permstuck_shrubb",		"SI Players",	1,	"-64 -64 -48",		"64 64 48",		"3408 -1760 144" );
make_clip(	"_commonhop_safehouse",		"Survivors",	1,	"-280 -456 0",		"280 456 1100",		"3984 -1863 464" );
make_trigduck( "_duckqol_greenposts1", "-60 -97 0", "60 97 142", "-2021 5568 98" );
make_trigduck( "_duckqol_greenposts2", "-60 -97 0", "60 97 142", "1069 6976 224" );
make_trigduck( "_duckqol_playground", "-156 -1 0", "156 1 77", "-1442 6968 119" );

make_clip( "_permstuck_highuptree", "Everyone", 1, "-32 -54 0", "24 24 10", "-3312 7326 315" );

if ( g_BaseMode == "versus" )
{
	devchap( "BASE VERSUS" );

	// FIXES

    make_clip( "_treehouse_whitefence", "Survivors", 1, "-17 -80 0", "17 77 1125", "1767 2219 267" );

}

if ( HasPlayerControlledZombies() )
{
	make_brush( "_losfix_ambulance1",	"-90 -1 -8",	"91 1 8",	"711 4748 102" );
	make_brush( "_losfix_ambulance2",	"-1 -56 -8",	"1 57 8",	"803 4690 102" );
	make_brush( "_losfix_dumpster",		"-185 -1 -8",	"185 1 8",	"3550 343 128" );
	make_brush( "_losfix_gen1",		"-28 -1 -10",	"28 1 10",	"241 5987 107" );
	make_brush( "_losfix_gen2",		"-22 -1 -8",	"22 1 8",	"3448 -1345 113" );
	make_brush( "_losfix_truck",		"-62 -1 -10",	"62 1 10",	"3217 -1376 114" );
	make_brush( "_losfix_truck_jump",	"-70 -1 -10",	"70 1 10",	"2949 2885 108" );
	make_clip( "_ladder_dumpsterhouse_clip", "Everyone", 1, "-8 -16 0", "26 8 168", "1638 4032 217", "0 45 0" );
	make_clip( "_ladder_yellowhousetree_topdenial", "SI Players", 1, "-8 -32 0", "8 32 62", "2244 3123 378", "-7 0 0" );
	make_clip( "_ladder_safehousetall_clip", "SI Players", 1, "-20 -2 -2", "8 2 310", "3725 -1537 101", "0 45 0" );
	make_clip( "_playgroundhouse_clip", "Survivors", 1, "-54 -177 -35", "635 176 1176", "-2074 7312 360" );
	make_clip( "_safehousehedge_blocker", "SI Players", 1, "-690 -122 -20", "139 93 2122", "4401 -2207 438" );
	make_ladder( "_ladder_cornerhomeplants_cloned_garagesalehome", "2468 2634 184", "3773 4652 128", "0 90 0", "-1 0 0" );
	make_ladder( "_ladder_cornerhometankfight_cloned_treehousefence", "2058.5 2999.08 151.11", "1958 155 0" );
	make_ladder( "_ladder_dumpsterhouse_cloned_alarmtrailer", "677.5 2966 212.223", "-1309 4697 88", "0 270 0", "0 -1 0" );
	make_ladder( "_ladder_finalhouse_cloned_yellowhouse", "3510.5 917 182.881", "2993 3583 -14", "0 -90 0", "0 1 0" );
	make_ladder( "_ladder_mobilepickup_cloned_alarmtrailer", "677.5 2966 212.223", "1675 8269 -36", "0 -180 0", "-1 0 0" );
	make_ladder( "_ladder_safehousefenceback_cloned_cullingbuddy", "-4083 7580 170", "7421 -9698 -9" );
	make_ladder( "_ladder_safehousetall_cloned_tallbuildingleft", "-885 5961 269.556", "9680 -675 -26", "0 90 0", "-1 0 0" );
	make_ladder( "_ladder_saferoofpipe_cloned_tallbuildingleft", "-885 5961 269.556", "9680 -880 -26", "0 90 0", "-1 0 0" );
	make_ladder( "_ladder_tallbuildingright_cloned_tallbuildingleft", "-885 5961 269.557", "5057 6467 -2", "0 90 0", "-1 0 0" );
	make_ladder( "_ladder_trailerqol_cloned_alarmtrailer", "677.5 2966 212.223", "2555 3388 -66", "0 66 0", "0.4 0.9 0" );
	make_ladder( "_ladder_vinehouseqol_cloned_alarmtrailer", "677.5 2966 212.223", "-3107 6241 -32", "0 -90 0", "0 -1 0" );
	make_ladder( "_ladder_woodhouseqol_cloned_alarmtrailer", "677.5 2966 212.223", "2908 4383 -40", "0 90 0", "0 1 0" );
	make_ladder( "_ladder_yellowhousetree_cloned_playgroundgutter", "-2041.58 7141.5 215.154", "9311 5106 -851", "3 90 6", "1 0 0" );
	make_prop( "dynamic", "_ladder_finalhouse_pipe", "models/props_downtown/gutter_downspout_straight_160_02.mdl", "3910 71 248", "0 90 0", "shadow_no" );
	make_prop( "dynamic", "_ladder_safehouse_pipe", "models/props_pipes/PipeSet02d_512_001a.mdl", "3726 -1560 160", "-90 90 0", "shadow_no", "solid_no" );
	make_prop( "dynamic", "_ladder_saferoofpipe_pipe", "models/props_mill/PipeSet08d_512_001a.mdl", "3726 -1765 158", "90 90 0", "shadow_no" );
}