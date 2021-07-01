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

if ( g_BaseMode == "coop" || g_BaseMode == "realism" )
{
	devchap( "BASE COOP" );

	// FIXES

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

}
if ( g_BaseMode == "scavenge" )
{
	devchap( "BASE SCAVENGE" );

	// FIXES

}