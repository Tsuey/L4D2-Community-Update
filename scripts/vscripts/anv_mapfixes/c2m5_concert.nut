g_Chapter = "DARK CARNIVAL - CONCERT";

devchap( "ALL MODES" );

// FIXES_ALL

make_clip(	"_nav_lightingtrussa",		"Survivors",	1,	"-11 -506 0",		"11 506 65",		"-1275 2261 368" );
make_clip(	"_nav_lightingtrussd",		"Survivors",	1,	"-11 -506 0",		"11 506 65",		"-2060 2261 368" );
make_clip(	"_nav_lightingtrussf",		"Survivors",	1,	"-11 -506 0",		"11 506 65",		"-2549 2261 368" );
make_clip(	"_nav_lightingtrussh",		"Survivors",	1,	"-11 -506 0",		"11.5 506 65",		"-3065 2261 368" );
make_clip(	"_nav_lightingtrussi",		"Survivors",	1,	"-11 -506 0",		"11.5 506 65",		"-3318 2261 368" );
make_clip(	"_nav_lightingtrussg",		"Survivors",	1,	"-11 -506 0",		"11.5 506 65",		"-2822.5 2261 367.7" );
make_clip(	"_nav_lightingtrusse",		"Survivors",	1,	"-11 -506 0",		"11 506 65",		"-2296 2261 368" );
make_clip(	"_nav_lightingtrussb",		"Survivors",	1,	"-11 -506 0",		"11 506 65",		"-1544 2261 368" );
make_clip(	"_nav_lightingtrussc",		"Survivors",	1,	"-11 -506 0",		"11 506 65",		"-1800 2261 368" );
make_clip( "_permstuck_fence", "Survivors", 1, "-1 -102 0", "4 102 128", "-1110 2274 -112", "0 44 0" );
make_clip( "_cliprework_lastwindow", "Survivors", 1, "-9 -36 -8", "11 35 747", "-3853 2279 280", "0 45 0" );
make_clip( "_nav_duediligence", "Survivors", 1, "-3 -49 0", "5 48 1152", "-997 3049 -128" );
make_clip( "_cliprework_concertlights", "Survivors", 1, "-324 -74 0", "318 73 162", "-2305 3277 140" );
make_clip( "_cliprework_concertposter", "Survivors", 1, "-338 -16 -200", "338 17 98", "-2304 3687 204" );
make_clip( "_cliprework_concertroofio", "Survivors", 1, "-656 -32 -98", "616 515 652", "-2302 3197 352" );
make_clip( "_smoother_windows", "SI Players and AI", 1, "-250 -32 0", "298 32 8", "-609 2387 329", "0 45 30" );
make_clip( "_missing_staircase_clip", "Everyone", 1, "-40 -40 -1", "40 40 40", "-922 1933 173", "0 315 0" );
make_clip( "_booster_lightleft", "Survivors", 1, "-8 -104 0", "8 29 725", "-2472 3148 278" );
make_clip( "_booster_lightright", "Survivors", 1, "-8 -104 0", "8 29 725", "-2152 3148 278" );
//make_clip( "_commentary_replace_01", "Survivors", 1, "-40 -84 -256", "40 84 944", "-1248 3316 80" );
make_clip( "_backstairs_left", "Survivors", 1, "-8 -160 0", "8 160 760", "-4086 2688 264" );
make_clip( "_backstairs_right", "Survivors", 1, "-8 -158 0", "8 197 760", "-951 2073 264", "0 -45 0" );

if ( g_BaseMode == "coop" || g_BaseMode == "realism" )
{
	devchap( "BASE COOP" );

	// FIXES

    make_prop( "dynamic", "_helistuck_caseunique", "models/props_fairgrounds/bass_case.mdl", "-3466 2899 -106", "-15 1 89.73", "shadow_no" );
    make_prop( "dynamic", "_helistuck_casecaster", "models/props_fairgrounds/anvil_case_casters_64.mdl", "-3488 2870 -128", "0 180 0", "shadow_no" );

}
if ( g_BaseMode == "versus" )
{
	devchap( "BASE VERSUS" );

	// FIXES

    make_prop( "dynamic", "_helistuck_caseunique", "models/props_fairgrounds/bass_case.mdl", "-3466 2899 -106", "-15 1 89.73", "shadow_no" );
    make_prop( "dynamic", "_helistuck_casecaster", "models/props_fairgrounds/anvil_case_casters_64.mdl", "-3488 2870 -128", "0 180 0", "shadow_no" );

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