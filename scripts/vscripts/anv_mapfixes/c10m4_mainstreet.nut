g_Chapter = "DEATH TOLL - THE TOWN";

devchap( "ALL MODES" );

// FIXES_ALL

make_clip(	"_commonhop_bankwindow",	"Survivors",	1,	"-120 -5 0",		"120 17 1612",		"-672 -4351 176" );
make_clip(	"_cliprework_church",		"Survivors",	1,	"-256 -16 -164",	"256 16 1040",		"-3010 30 720.9" );
make_clip(	"_cliprework_buses",		"Survivors",	1,	"-160 -6 -164",		"160 6 620",		"-1437 -461 1124" );
make_clip(	"_cliprework_houses01",		"Survivors",	1,	"-8 -80 -0",		"8 80 1221",		"744 -324 512" );
make_clip(	"_cliprework_houses02",		"Survivors",	1,	"-100 -8 -170",		"100 8 1221",		"854 -272 512" );
make_clip(	"_cliprework_houses03",		"Survivors",	1,	"-100 -8 -100",		"100 8 1221",		"1400 -158 512" );
make_clip(	"_cliprework_houses04",		"Survivors",	1,	"-32 -8 -70",		"32 8 1221",		"1993 -254 512" );
make_clip(	"_cliprework_houses05",		"Survivors",	1,	"-400 -8 -150",		"32 216 1221",		"2883 -465 602" );
make_clip( "_dispcrouch_spawn", "Everyone", 1, "-140 -32 -64", "100 32 90", "-4294 -1729 -2", "0 -5 0" );
make_clip( "_cliprework_unattackable", "Survivors", 1, "-8 -396 -164", "24 216 850", "-1608 -2368 884" );
make_clip( "_cliprework_electricalbox", "Survivors", 1, "-6 -33 0", "5 25 406", "2667 -1769 164" );
make_clip( "_cliprework_windows", "Survivors", 1, "-16 -304 -20", "0 288 68", "2688 -2136 372" );
make_clip( "_cliprework_balcony", "Survivors", 1, "-86 -50 0", "84 46 1392", "2822 -1694 336" );
make_clip( "_cliprework_awning", "Survivors", 1, "-68 -103 -68", "43 107 1431", "2885 -1580 297" );
make_trighurt( "_instakill_deathcharger", "Survivor", "-256 -453 -17", "256 453 0", "-2449 122 -43" );
patch_spawninfront( "288 -5284 93", "0 -96 0", "544 96 17" );

if ( g_BaseMode == "versus" )
{
	devchap( "BASE VERSUS" );

	// FIXES

    make_clip( "_cliprework_trucknuke", "Survivors", 1, "-180 -60 -2", "115 60 1624", "693 -1867 105", "0 43 0" );

    make_clip( "_cliprework_eventskip1", "Survivors", 1, "-55 -1 0", "58 1 1588", "852 -2433 140" );
    make_clip( "_cliprework_eventskip2", "Survivors", 1, "-209 -2 0", "192 2 1588", "661 -2569 140", "0 45 0" );
    make_clip( "_cliprework_eventskip3", "Survivors", 1, "-156 -1 0", "141 1 1588", "372 -2717 140" );
    make_clip( "_cliprework_eventskip4", "Survivors", 1, "-26 -59 0", "-24 41 1588", "242 -2757 140" );

}
if ( g_BaseMode == "survival" )
{
	devchap( "BASE SURVIVAL" );

	// FIXES

    make_clip( "_booster_eatsign", "Survivors", 1, "-10 -64 -48", "10 69 1442", "-1649 -3723 293" );

}