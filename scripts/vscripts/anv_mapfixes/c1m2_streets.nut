g_Chapter = "DEAD CENTER - STREETS";

devchap( "ALL MODES" );

// FIXES_ALL

make_clip(	"_mindthegap_lolvalve",		"SI Players",	1,	"-32 -4 -64",		"32 4 64",		"-2472 137 64" );
make_clip(	"_stuckwarpassist_walltovoid",	"SI Players",	1,	"-1536 -476 -5",	"0 500 0",		"-5056 1500 1344" );
make_clip( "_nav_cedaramp_in", "SI Players and AI", 1, "0 -18 -14", "10 21 51", "-4268 2566 75", "-50 -35 0" );
make_clip( "_nav_cedaramp_out", "SI Players and AI", 1, "-95 -20 4", "38 17 11", "-4322 2567 102", "-8 0 0" );
make_clip( "_colastore_clipgap", "Survivors", 1, "-8 -97 0", "8 75 856", "-6792 -3215 616" );
make_clip( "_colastore_clipawn", "Survivors", 1, "-23 -541 1", "41 547 17", "-7017 -1699 599" );
make_clip( "_ladderqol_railing", "SI Players", 1, "-138 -1 -12", "758 4 36", "-2614 2319 300" );
make_clip( "_save4lesscurb_smoother1", "Everyone", 1, "-7 -110 0", "14 113 5", "-6515 -2681 384" );
make_clip( "_save4lesscurb_smoother2", "Everyone", 1, "-7 -127 0", "14 129 5", "-6515 -2302 384" );
make_clip( "_save4lesscurb_smoother3", "Everyone", 1, "-7 -432 0", "9 435 5", "-6899 -1601 384" );
make_clip("_ladderqol_smootherl", "Everyone", 1, "-7 -190 0", "7 190 2", "-6059 -2238 430", "-45 0 0" );
make_clip("_ladderqol_smootherm", "Everyone", 1, "-7 -255 0", "7 118 2", "-6060 -2586 427", "-45 0 0" );
make_clip("_ladderqol_smootherr", "Everyone", 1, "-7 -36 0", "7 77 2", "-6056 -2960 412", "-45 0 0" );
make_clip( "_whitakercurb_smoother1", "Everyone", 1, "-9 -315 0", "15 294 6", "-5525 -2349 448" );
make_clip( "_whitakercurb_smoother2", "Everyone", 1, "-9 -208 0", "15 160 6", "-5525 -1719 448" );
make_clip( "_booster_bridgestairsa", "Survivors", 1, "-4 -84 0", "4 84 700", "-5572 932 768" );
make_clip( "_booster_bridgestairsb", "Survivors", 1, "-56 -8 0", "56 8 700", "-5512 1016 832" );
make_clip( "_booster_building", "Survivors", 1, "-8 -384 0", "8 384 128", "-5064 1408 1344" );

if ( g_BaseMode == "coop" || g_BaseMode == "realism" )
{
	devchap( "BASE COOP" );

	// FIXES

}
if ( g_BaseMode == "versus" )
{
	devchap( "BASE VERSUS" );

	// FIXES

    make_clip(	"_booster_mallroof",		"Survivors",	1,	"0 -130 -377",		"2150 136 448",		"-9218 -4415 1024" );

}
if ( g_BaseMode == "survival" )
{
	devchap( "BASE SURVIVAL" );

	// FIXES

    make_clip( "_tanker_blowfish", "Survivors", 1, "-85 -435 -6", "33 331 791", "-6740 -758 681", "0 328 0" );

}
if ( g_BaseMode == "scavenge" )
{
	devchap( "BASE SCAVENGE" );

	// FIXES

}