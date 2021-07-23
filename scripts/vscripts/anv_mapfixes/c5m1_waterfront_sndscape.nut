g_Chapter = "DEVELOPER - c5m1_waterfront_sndscape";

devchap( "ALL MODES" );

function DoRoundFixes()
{
    con_comment( "FIX:\tTotal of 4 out of 5 traffic cones need to be made non-solid -- yes, for memes." );

    unsolidify_model( "models/props_fortifications/orange_cone001_reference.mdl" );
}