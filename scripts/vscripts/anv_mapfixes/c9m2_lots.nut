g_Chapter = "CRASH COURSE - THE TRUCK DEPOT FINALE";

devchap( "ALL MODES" );

// FIXES_ALL

make_clip(	"_commonhop_windowsa",		"Survivors",	1,	"-2 -128 -44",		"2 128 44",		"6850 7040 268" );
make_clip(	"_commonhop_windowsb",		"Survivors",	1,	"-96 -2 -44",		"96 2 44",		"7328 6850 268" );
make_clip(	"_permstuck_treea",		"Everyone",	1,	"-17 -17 0",		"17 17 128",		"973 -1632 -231" );
make_clip(	"_permstuck_treeb",		"Everyone",	1,	"-17 -17 0",		"17 17 128",		"5050.6 2458.2 -106.6" );
make_clip(	"_permstuck_treec",		"Everyone",	1,	"-17 -17 0",		"17 17 128",		"3516 616 -198.6" );
make_clip(	"_permstuck_treed",		"Everyone",	1,	"-17 -17 0",		"17 17 128",		"3845 1192 -141" );
make_clip(	"_permstuck_treee",		"Everyone",	1,	"-17 -17 0",		"17 17 128",		"2257 2997 -70.4" );
make_clip(	"_permstuck_treef",		"Everyone",	1,	"-17 -17 0",		"17 17 128",		"2054 4320 25.8" );
make_clip(	"_permstuck_treeg",		"Everyone",	1,	"-17 -17 0",		"17 17 128",		"6724 7421 62.2" );
make_clip(	"_cliprework_rooftop",		"Survivors",	1,	"-164 -710 0",		"216 600 865",		"4118 886 288" );
make_clip(	"_cliprework_unattackable",	"Survivors",	1,	"-17 -64 0",		"26 64 8",		"6246 1852 29" );
make_clip(	"_cliprework_tracka",		"Survivors",	1,	"-216 -64 0",		"216 3000 950",		"5437 -52 206.3" );
make_clip(	"_cliprework_trackb",		"Survivors",	1,	"-216 -64 0",		"222 3000 777",		"5437.3 5128 385" );
make_clip(	"_clipgap_fence",		"Survivors",	1,	"-32 -4 0",		"32 4 1111",		"5791 8132 65.8" );
make_clip(	"_booster_rollupdoors",		"Survivors",	1,	"-777 -460 0",		"11 299 999",		"6541 5853 250" );
make_clip(	"_booster_rollupdoor",		"Survivors",	1,	"-70 -11 0",		"70 11 888",		"7040 6836 280" );
make_clip(	"_booster_liftframes",		"Survivors",	1,	"-11 -420 0",		"11 90 128",		"7844 6657 371.3" );
make_clip(	"_booster_boxtop",		"Survivors",	1,	"-35 -409 0",		"31 35 169",		"8479 5823 304.9" );
make_clip( "_booster_elecbox", "Survivors", 1, "-4 -20 -80", "4 25 718", "7548 5412 434" );
make_clip( "_booster_ventpipe", "Survivors", 1, "-13 -14 -80", "17 14 657", "7535 6160 495" );
make_clip( "_nav_jump_semitrailer", "Survivors", 1, "-4 -94 0", "4 188 288", "5756 1062 -32" );
make_clip( "_nav_jump_cargowindow", "Survivors", 1, "-5 -85 0", "4 89 86", "2044 3030 49" );
make_clip( "_booster_armoredtop", "Survivors", 1, "-158 -65 0", "172 59 63", "7838 6366 449" );
make_trigmove( "_duckqol_finalevent", "Duck", "0 -32 0", "8 32 1", "7568 7392 447" );

con_comment( "LOGIC:\tFinale switch will re-Lock when all Survivors aren't inside trigger." );

EntFire( "finale_button_unlocker", "AddOutput", "OnEntireTeamEndTouch finaleswitch_initial:Lock::0:-1" );

con_comment( "LOGIC:\tPoint-of-no-return clip will be Enabled when finale switch is full." );

make_clip( "_point_of_no_return", "Survivors", 0, "-16 -169 -168", "58 169 784", "5750 7177 368" );
EntFire( "finaleswitch_initial", "AddOutput", "OnTimeUp anv_mapfixes_point_of_no_return:Enable::0:-1" );