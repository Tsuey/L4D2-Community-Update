g_Chapter = "HARD RAIN - MILLTOWN";

devchap( "ALL MODES" );

// FIXES_ALL

make_clip(	"_woodwindow","Survivors",	1,	"-48 -1 -39",		"48 1 39",		"4144 -1423 391" );
make_clip(	"_permstuck_shruba",		"SI Players",	1,	"-60 -32 -36",		"60 72 60",		"3668 -1664 132" );
make_clip(	"_permstuck_shrubb",		"SI Players",	1,	"-64 -64 -48",		"64 64 48",		"3408 -1760 144" );
make_clip(	"_commonhop_safehouse",		"Survivors",	1,	"-280 -456 0",		"280 456 1100",		"3984 -1863 464" );
make_clip(	"_booster_burgertankpole",	"Survivors",	1,	"-12 -12 -170",		"12 12 1000",		"-5800 7496 603" );
make_clip(	"_booster_burgertankspin",	"Survivors",	1,	"-216 -216 -170",	"216 216 640",		"-5800 7496 915" );
make_clip( "_booster_ginnytop", "Survivors", 1, "-22 -29 0", "17 29 1150", "-5425 6789 385", "0 45 0" );
make_clip( "_booster_ginnyjon", "Survivors", 1, "6 -4 -284", "-10 4 0", "-5425 6789 385", "0 45 0" );
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