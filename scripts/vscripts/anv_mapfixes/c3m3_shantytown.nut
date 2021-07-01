g_Chapter = "SWAMP FEVER - SHANTY TOWN";

devchap( "ALL MODES" );

// FIXES_ALL

make_clip(	"_endhaybails_collision",	"SI Players and AI",	1,	"-42 -66 -24",		"42 66 24",		"5126 -3967 378" );
make_clip(	"_permstuck_fridge",		"Everyone",	1,	"-12 -10 -73",		"12 50 0",		"-3791 -2972 136" );
make_clip( "_trailerhouse_smoother1", "Everyone", 1, "-8 -213 0", "25 219 14", "-3294 -324 -8", "45 15 0" );
make_clip( "_trailerhouse_smoother2", "Everyone", 1, "-8 -33 0", "25 59 14", "-3298 -549 -8", "45 -75 0" );
make_clip( "_skyboxshield_endsafehouse", "SI Players", 1, "-185 -50 -40", "183 50 82", "5067 -3777 552" );

make_prop( "dynamic", "_permstuck_cratebot", "models/props_crates/static_crate_40.mdl", "-3749.85 -183.67 -3.164", "0 0 0" );
make_prop( "dynamic", "_permstuck_cratetop", "models/props_crates/static_crate_40.mdl", "-3749.85 -182.67 36.837", "0 -30 0" );

if ( g_BaseMode == "coop" || g_BaseMode == "realism" )
{
	devchap( "BASE COOP" );

	// FIXES

}
if ( g_BaseMode == "versus" )
{
	devchap( "BASE VERSUS" );

	// FIXES

    make_clip(	"_shortcut_window",		"Survivors",	1,	"-6 -66 -64",		"6 66 110",		"-4120 -2232 38" );
    make_clip( "_shortcut_barricadetarp", "Survivors", 1, "-107 -114 -1", "103 82 742", "-4786 1014 298" );

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