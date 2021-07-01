g_Chapter = "BLOOD HARVEST - FARMHOUSE FINALE";

devchap( "ALL MODES" );

// FIXES_ALL

make_clip(	"_dispcrouch_spawn_right",	"Everyone",	1,	"-12 -216 -100",	"200 216 128",		"11102 150 -115" );
make_clip(	"_dispcrouch_spawn_left",	"Everyone",	1,	"-26 -216 -100",	"26 216 128",		"10210 1423 -29" );
make_clip(	"_permstuck_tree_a",		"Everyone",	1,	"-16 -16 -16",		"16 16 16",		"10675 528 -7" );
make_clip(	"_permstuck_tree_b",		"Everyone",	1,	"-16 -16 -16",		"16 16 16",		"10794 1843 -27" );
make_clip(	"_permstuck_tree_c",		"Everyone",	1,	"-16 -16 -16",		"16 16 16",		"10456 3463 4" );
make_clip(	"_permstuck_tree_d",		"Everyone",	1,	"-16 -16 -16",		"16 16 16",		"11064 4373 -10" );
make_clip(	"_permstuck_tree_e",		"Everyone",	1,	"-16 -16 -16",		"16 16 1600",		"7710 1651 270" );
make_clip(	"_permstuck_tree_f",		"Everyone",	1,	"-16 -16 -16",		"16 16 1600",		"6852 -750 252" );
make_clip(	"_permstuck_tree_g",		"Everyone",	1,	"-16 -16 -16",		"16 16 1600",		"6448 3092 260" );
make_clip(	"_permstuck_tree_h",		"Everyone",	1,	"-16 -16 -16",		"16 16 1600",		"5624 3236 260" );
make_clip(	"_clip_anomaly",		"Survivors",	1,	"-384 -40 -740",	"450 40 720",		"5504 3304 1136" );
make_clip( "_wrongway_clipa", "Everyone", 1, "-1600 -61 0", "401 128 1640", "6044 3997 196" );
make_clip( "_wrongway_clipb", "Everyone", 1, "-288 -61 0", "600 128 1640", "6706 4072 196", "0 16 0" );
make_clip(	"_booster_barnroof",		"Survivors",	1,	"-8 -434 0",		"8 434 360",		"6986 -154 548" );
make_clip(	"_booster_haybarn",		"Survivors",	1,	"-364 -293 0",		"352 425 1317",		"8459 424 539.5" );
make_clip(	"_booster_estateroof",		"Survivors",	1,	"-575 -261 0",		"325 389 1258",		"6837 1124 598" );
make_clip(	"_booster_dualsilos",		"Survivors",	1,	"-360 -234 0",		"360 187 995",		"7362 2650 861" );
make_clip( "_clip_anomaly_ugh", "Survivors", 1, "-8 -20 -751", "448 13 751", "6216 3331 1101" );
make_clip( "_undermap_exploit", "Survivors", 1, "-81 -166 0", "85 76 1385", "4473 3860 451" );
make_clip( "_cooponly_idle_warp", "Survivors", 1, "-81 -37 0", "55 35 1102", "8849 3493 760" );
make_clip( "_nav_and_stuckwarp", "Everyone", 1, "-45 -2 -62", "163 6 58", "6485 1090 308" );

// For some maps the trigger_finale might exist after "round_start" and require delay -- but not here either!

con_comment( "LOGIC:\tPoint-of-no-return clip will be Enabled when finale is started." );

make_clip( "_point_of_no_return", "Survivors", 0, "-148 -16 0", "148 26 1660", "9017 3511 202" );
EntFire( "trigger_finale", "AddOutput", "FinaleStart anv_mapfixes_point_of_no_return:Enable::0:-1" );

if ( g_BaseMode == "coop" || g_BaseMode == "realism" )
{
	devchap( "BASE COOP" );

	// FIXES

}
if ( g_BaseMode == "versus" )
{
	devchap( "BASE VERSUS" );

	// FIXES

}
if ( g_BaseMode == "survival" )
{
	devchap( "BASE SURVIVAL" );

	// FIXES

}
if ( g_BaseMode == "scavenge" )
{
	devchap( "BASE SCAVENGE" );

	// FIXES

}