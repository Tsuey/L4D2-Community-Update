g_Chapter = "DEVELOPER - c5m1_waterfront_sndscape";

devchap( "ALL MODES" );

// FIXES_ALL

con_comment( "FIX:\tTotal of 4 out of 5 traffic cones need to be made non-solid -- yes, for memes." );

unsolidify_model( "models/props_fortifications/orange_cone001_reference.mdl" );

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