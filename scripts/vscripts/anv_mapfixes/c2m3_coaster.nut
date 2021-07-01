g_Chapter = "DARK CARNIVAL - COASTER";

devchap( "ALL MODES" );

// FIXES_ALL

make_clip(	"_smokerinfamya",		"SI Players",	1,	"-4000 -80 -1337",	"0 1600 0",		"-4450 2525 309" );
make_clip(	"_smokerinfamyb",		"SI Players",	1,	"-4000 0 0",		"160 1111 1337",	"-4450 3005 309" );
make_clip(	"_smokerinfamyc",		"SI Players",	1,	"-4000 -289 0",		"0 271 1337",		"-5119 2734 309" );
make_clip(	"_shortcut_commonhopa",		"Survivors",	1,	"-10 -10 -64",		"10 10 216",		"-3720 1144 96" );
make_clip(	"_shortcut_commonhopb",		"Survivors",	1,	"-10 -10 -56",		"10 10 232",		"-3720 1352 72" );
make_clip(	"_shortcut_commonhopc",		"Survivors",	1,	"-10 -10 -52",		"10 10 227",		"-3720 1768 77" );
make_clip(	"_stuckwarp_gatearm",		"Everyone",	1,	"-31 -36 -54",		"31 36 54",		"-3799 1100 82" );
make_clip(	"_cliprework_tunnelb",		"Survivors",	1,	"-777 -110 -108",	"82 360 1100",		"-3418 3460 652" );
make_clip(	"_cliprework_tunnela",		"Survivors",	1,	"-300 -80 -108",	"82 360 1100",		"-3902 3021 655" );
make_clip( "_nav_extinguisher", "Survivors", 1, "-16 -4 0", "16 4 44", "-325 4116 244" );
make_clip( "_commonhop_curvedrail", "Survivors", 1, "-5 -120 0", "17 260 25", "-3498 2060 250" );
make_clip( "_cliprework_fourvents", "Survivors", 1, "-223 -1 0", "225 4 64", "239 3676 272" );
make_clip( "_cliprework_semipermstuck", "Everyone", 1, "-20 -50 0", "19 22 32", "-3254 2792 0", "0 -15 0" );
make_clip( "_cliprework_culdesaca", "Survivors", 1, "-95 -4 0", "98 4 206", "-3917 2979 152", "0 25 0" );
make_clip( "_cliprework_culdesacb", "Survivors", 1, "-176 -4 0", "142 4 1603", "-3659 3066 152", "0 15 0" );
make_clip( "_cliprework_culdesacc", "Survivors", 1, "-175 -4 0", "178 4 206", "-3351 3058 152", "0 -15 0" );
make_clip( "_cliprework_culdesacd", "Survivors", 1, "-4 -280 0", "4 106 1387", "-3493 3256 368" );
make_clip( "_shortcut_commonhopd", "Survivors", 1, "-10 -10 -56", "10 10 227", "-3512 1352 77" );
make_clip( "_shortcut_commonhope", "Survivors", 1, "-10 -10 -56", "10 10 227", "-3512 1768 77" );
make_clip( "_shortcut_commonhopf", "Survivors", 1, "-10 -10 -56", "10 10 263", "-3720 1976 57" );
make_clip( "_cliprework_shrubgap", "Survivors", 1, "-112 -80 0", "112 80 286", "-3072 128 152" );
make_clip( "_onewaybreakwall_elecbox", "Everyone", 1, "-64 -4 0", "64 4 236", "-64 3524 100" );
make_clip( "_endbridge_shiftsmoother1", "Everyone", 1, "-1 -42 0", "1 38 2", "-4183 2320 272" );
make_clip( "_endbridge_shiftsmoother2", "Everyone", 1, "-42 -1 0", "38 1 2", "-4729 2277 164" );
make_clip( "_permstuck_irredeemable", "SI Players", 1, "-48 -42 0", "16 94 152", "-2064 -174 0" );
make_clip( "_permstuck_swanroom_rest", "Everyone", 1, "-54 -20 0", "58 29 108", "510 4084 -7" );
make_clip( "_semiperm_coastergate", "Survivors", 1, "-64 -664 0", "64 16 140", "-2784 1688 0" );
make_clip( "_recompilepls_pillar1", "Survivors", 1, "-10 -10 0", "10 10 272", "-3760 2360 0" );
make_clip( "_recompilepls_pillar2", "Survivors", 1, "-10 -10 0", "10 10 272", "-3760 2280 0" );
make_clip( "_recompilepls_pillar3", "Survivors", 1, "-10 -10 0", "10 10 272", "-4032 2280 0" );
make_clip( "_recompilepls_pillar4", "Survivors", 1, "-10 -10 0", "10 10 272", "-4032 2360 0" );
make_clip( "_recompilepls_pillar5", "Survivors", 1, "-10 -10 0", "10 10 272", "-4176 2360 0" );
make_clip( "_recompilepls_pillar6", "Survivors", 1, "-10 -10 0", "10 10 272", "-4176 2280 0" );
make_clip( "_cliprework_permstuck", "Survivors", 1, "-93 -81 -55", "108 47 88", "-3266 3057 413" );
make_clip( "_stuckwarp_swanstairs", "Everyone", 1, "-52 0 0", "143 3 37", "298 4192 43", "-34.5 0 0" );
make_brush( "_permstuck_swanroom_dead", "-54 -20 0", "58 29 108", "510 4084 -7" );
make_trigduck( "_duckqol_swanhole", "-5 -32 -32", "5 32 32", "1348 4096 32" );

make_clip( "_onewayhole_blockclip", "Everyone", 1, "-64 -13 -20", "64 13 28", "336 3777 180", "0 160 0" );
make_prop( "dynamic", "_onewayhole_blockpipe", "models/props_pipes/pipeset08d_128_001a.mdl", "336 3777 180", "0 160 90", "shadow_no" );

//con_comment( "LOGIC:\tBeta Coaster Rubble restored for Campaign and Survival relays." );

//make_prop( "dynamic", "_dynamic_coaster_rubble", "models/rollercoaster/coaster_debris.mdl", "0 0 -8", "0 0 0", "shadow_no", "solid_no" );
//EntFire( "relay_start_onslaught", "AddOutput", "OnTrigger anv_mapfixes_dynamic_coaster_rubble:SetAnimation:debris:6.33:-1" );
//EntFire( "relay_panicevent", "AddOutput", "OnTrigger anv_mapfixes_dynamic_coaster_rubble:SetAnimation:debris:6.33:-1" );

if ( g_BaseMode == "coop" || g_BaseMode == "realism" )
{
	devchap( "BASE COOP" );

	// FIXES

}
if ( g_BaseMode == "versus" )
{
	devchap( "BASE VERSUS" );

	// FIXES

    make_clip(	"_shortcut_longjump",		"Survivors",	1,	"-17 -216 0",		"17 216 1580",		"-4240 2616 171" );

    make_clip(	"_shortcut_supports",		"Survivors",	1,	"-86 -10 -137",		"86 10 32",		"-3904 2062 96" );
    make_clip(	"_cliprework_scaffnuke_skipa",	"Survivors",	1,	"-120 -111 -48",	"150 88 310",		"-3044 3000 177" );
    make_clip(	"_cliprework_scaffnuke_skipb",	"Survivors",	1,	"-90 -211 -48",		"82 0 310",		"-2788 2760 177" );
    make_clip(	"_cliprework_scaffnuke_skipc",	"Survivors",	1,	"-120 -111 -48",	"20 -73 1545",		"-3044 3000 177" );
    make_clip(	"_cliprework_scaffnuke_skipd",	"Survivors",	1,	"-90 -211 -48",		"-61 0 1545",		"-2788 2760 177" );
    make_clip(	"_cliprework_roofa",		"Survivors",	1,	"-108 -224 -320",	"108 224 1100",		"-3596 1560 640" );
    make_clip(	"_cliprework_roofb",		"Survivors",	1,	"-295 -444 -280",	"295 444 1100",		"-3970 1558 640" );
    make_clip(	"_cliprework_sign",		"Survivors",	1,	"-307 -70 0",		"307 70 1320",		"-3902 2321 431" );
    make_clip( "_chargerassist_container", "Survivors", 1, "-207 -62 0", "182 66 832", "-718 590 128" );
    make_clip( "_shortcut_commonhopg", "Survivors", 1, "-10 -10 -56", "10 10 103", "-3848 1976 57" );
    make_clip( "_shortcut_supportdropa", "Survivors", 1, "-28 -55 0", "35 35 1150", "-3260 2854 576" );
    make_clip( "_shortcut_supportdropb", "Survivors", 1, "-28 -216 0", "35 35 1150", "-3300 2810 576" );
    make_clip( "_shortcut_finally_done", "Survivors", 1, "-8 -146 0", "0 146 255", "-2894 2609 253", "9 0 0" );
    make_clip( "_booster_eventskip1", "Survivors", 1, "-253 -16 -459", "332 23 32", "-3106 3081 960" );
    make_clip( "_booster_eventskip2", "Survivors", 1, "-253 -72 -459", "-246 23 32", "-3106 3081 960" );

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