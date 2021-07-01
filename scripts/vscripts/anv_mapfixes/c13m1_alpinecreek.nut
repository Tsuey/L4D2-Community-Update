g_Chapter = "COLD STREAM - ALPINE CREEK";

devchap( "ALL MODES" );

// FIXES_ALL

make_clip(	"_dispcrouch_watchtower",	"Everyone",	1,	"-64 -17 0",		"64 17 128",		"-3025 2861 186" );
make_clip(	"_sneaky_hunter",		"SI Players",	1,	"-963 -450 -256",	"1160 360 0",		"-1169 1555 482" );
make_clip( "_permstuck_cornercabin", "Everyone", 1, "-11 -12 -38", "14 12 32", "1465 3478 540" );
make_clip( "_dispcrouch_spawn", "Everyone", 1, "-32 -131 -147", "16 386 108", "-3244 54 151", "0 11 0" );

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