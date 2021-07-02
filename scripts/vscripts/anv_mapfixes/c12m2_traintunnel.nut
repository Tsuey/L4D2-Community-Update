g_Chapter = "BLOOD HARVEST - THE TUNNEL";

devchap( "ALL MODES" );

// FIXES_ALL

make_clip(	"_cliprework_outdoors01",	"Survivors",	1,	"-1171 405 -80",	"1171 422 1575",	"-7720 -8476 616" );
make_clip(	"_cliprework_outdoors03",	"Survivors",	1,	"-1171 -422 -312",	"1171 -405 1575",	"-7720 -8476 616" );
make_clip(	"_cliprework_outdoors02",	"Survivors",	1,	"1154 -422 -192",	"1171 422 1575",	"-7720 -8476 616" );
make_clip(	"_cliprework_outdoors04",	"Survivors",	1,	"-1171 -422 -80",	"-1154 422 1575",	"-7720 -8476 616" );
make_clip( "_nav_eventlight1", "Survivors", 1, "-5 -10 0", "5 10 129", "-8021 -7500 191" );
make_clip( "_nav_eventlight2", "Survivors", 1, "-5 -10 0", "5 10 73", "-6613 -7752 247" );
make_clip( "_stuckwarp_rocketdude", "Everyone", 1, "-24 -48 0", "24 48 71", "-5430 -8170 217" );
make_clip( "_rubble_smoother", "Everyone", 1, "-38 -166 0", "20 190 32", "-1777 -9480 -25", "33 23 28" );
make_trigduck( "_duckqol_ventduct", "-5 -26 -28", "5 26 28", "-8728 -7494 92" );

if ( g_BaseMode == "survival" )
{
	devchap( "BASE SURVIVAL" );

	// FIXES

    make_clip( "_nav_wareshelf", "Survivors", 1, "-25 -85 -234", "44 80 252", "-8740 -6996 170" );

    make_navblock( "_survival_navblock_stairs", "Everyone", "Apply", "-4 -101 0", "4 0 32", "-6688 -7711 -80" );

}