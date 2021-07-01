g_Chapter = "THE PARISH - PARK";

devchap( "ALL MODES" );

// FIXES_ALL

make_clip(	"_ladderqol_event",		"SI Players",	1,	"-2.5 -18 -161.5",	"2.5 18 161.5",		"-8446 -5214 -86" );
make_clip(	"_skybox_shieldb",		"SI Players",	1,	"-145 -212 -77",	"145 212 77",		"-2971 -1264 125" );
make_clip(	"_skybox_shielda",		"SI Players",	1,	"-240 -60 -20",		"240 60 77",		"-4014 -1296 68.8" );
make_clip( "_booster_busdepot_extend", "Survivors", 1, "-425 -57 0", "381 85 1504", "-8078 -6407 160" );
make_clip( "_booster_escapegap", "Survivors", 1, "-73 -66 1420", "8 129 32", "-9436 -5212 184", "0 -59 0" );
make_clip( "_booster_watchtower_extend", "Survivors", 1, "-65 -76 0", "62 65 1142", "-8161 -5821 529" );
make_clip( "_cliprework_parkarchway", "Survivors", 1, "-37 -404 -164", "35 402 1484", "-8125 -2207 180" );
make_clip( "_cliprework_anomalous", "Survivors", 1, "-76 -90 -71", "20 92 86", "-9237 -3866 58" );
make_clip( "_ghostgrief_and_stuckwarp", "Everyone", 1, "-8 -1246 -21", "18 1106 50", "-10562 -4034 -5" );
make_clip( "_nav_electricalbox", "Survivors", 1, "-35 -6 0", "24 5 1817", "-6222 -7610 -153" );
make_clip( "_ladderqol_purpleclip1", "SI Players", 1, "0 -245 -24", "1 308 32", "-9340 -5876 -132" );
make_clip( "_ladderqol_purpleclip2", "SI Players", 1, "-96 -2 -4", "129 -1 29", "-8096 -5539 -129" );
make_clip( "_ladderqol_purpleclip3", "SI Players", 1, "-96 -2 -4", "129 -1 29", "-7456 -5539 -129" );
make_clip( "_permstuck_longbarricade", "Everyone", 1, "-491 -16 0", "54 26 168", "-6390 -8479 -247" );
make_clip( "_cliprework_missingno", "Survivors", 1, "-164 -272 0", "172 240 1626", "-10092 -5520 48" );

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

    make_clip(	"_nav_eventsign",		"Survivors",	1,	"-4 -10 -908",		"4 10 908",		"-8552 -6310 756" );
    patch_ladder( "-9260 -5130 -152", "0 14 0" );

}
if ( g_BaseMode == "scavenge" )
{
	devchap( "BASE SCAVENGE" );

	// FIXES

    make_clip( "_safedoor_antighost", "SI Players", 1, "-2 -32 0", "2 32 107", "-3775 -1368 -344" );

}