g_Chapter = "HARD RAIN - TOWN ESCAPE";

devchap( "ALL MODES" );

// FIXES_ALL

//make_clip(	"_backtrack_dumpster",		"Survivors",	1,	"-32 -40 0",		"32 40 1337",		"-4128 7481 150" );
//make_clip(	"_backtrack_flatnose",		"Survivors",	1,	"0 -110 0",		"540 8 1212",		"-4632 7208 272",	"0 -34 0" );
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

// Non-1st rounds require a delay because this trigger_finale exists after "round_start".

con_comment( "LOGIC:\tPoint-of-no-return clip will be Enabled when finale is started." );

make_clip( "_point_of_no_return", "Survivors", 0, "-73 -135 0", "19 135 1361", "-4077 7139 125" );
EntFire( "trigger_finale", "AddOutput", "FinaleStart anv_mapfixes_point_of_no_return:Enable::0:-1", 1 );