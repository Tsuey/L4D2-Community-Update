g_Chapter = "DEAD CENTER - HOTEL";

devchap( "ALL MODES" );

// FIXES_ALL

make_clip(	"_cliphang_window",		"Survivors",	1,	"-72 -123 -12",		"127 14 44",		"2335 6420 2804" );
make_clip(	"_cliphang_ledge",		"Survivors",	1,	"-450 -8 0",		"1130 8 216",		"1222 6232 2912" );
make_clip(	"_barricadefire_bypass",	"Survivors",	1,	"-17 -96 -64",		"17 96 64",		"1326 5624 2528" );

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