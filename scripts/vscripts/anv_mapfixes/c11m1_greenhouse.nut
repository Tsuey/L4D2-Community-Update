g_Chapter = "DEAD AIR - THE GREENHOUSE";

devchap( "ALL MODES" );

// FIXES_ALL

make_clip(	"_oddhang_electricalbox",	"Survivors",	1,	"-8 -376 -466",		"0 0 174",		"3338 1147 466" );
make_clip(	"_ladderqol_electricalbox",	"SI Players",	1,	"-6 -60 -536",		"0 6 104",		"3340 1151 536" );
make_clip(	"_cliprework_stunfall",		"Survivors",	1,	"-96 -8 -400",		"96 8 1337",		"2464 784 409" );
make_clip(	"_stunfall_jeep",		"Survivors",	1,	"-8 -177 0",		"8 177 1724",		"4669 1491 8" );
make_clip(	"_cliprework_nopedocks01",	"Survivors",	1,	"-4155 -8 0",		"6600 8 1700",		"4221.4 -1175 16" );
make_clip(	"_tankpunch_escapeladder",	"Survivors",	1,	"-48 -88 0",		"48 88 1470",		"3412 -932 259" );
make_clip(	"_cliprework_nopedocks02",	"Survivors",	1,	"-8 -64 0",		"8 64 1818",		"2312 -1141 16" );
make_clip(	"_cliprework_unattackable",	"Survivors",	1,	"-160 -600 0",		"160 600 1818",		"7188.6 -601.2 16" );
make_clip( "_stunfall_lamp", "Survivors", 1, "-888 0 0", "979 17 1724", "5549 1313 8" );
make_clip( "_outtabounds_ledge", "Survivors", 1, "-148 -145 0", "100 141 1100", "2700 649 640" );
make_trighurt( "_instakill_thankyoufailzz", "Survivor", "-2828 -46 -149", "1881 225 0", "5148 -1121 165" );

if ( g_BaseMode == "coop" || g_BaseMode == "realism" )
{
	devchap( "BASE COOP" );

	// FIXES

}
if ( g_BaseMode == "versus" )
{
	devchap( "BASE VERSUS" );

	// FIXES

    make_clip(	"_commonhop_greenhouse",	"Survivors",	1,	"0 -320 -176",		"3 240 690",		"5226 -752 1023" );
    make_clip( "_cliprework_endpassage", "Survivors", 1, "-6 -224 0", "6 224 78", "4858 2552 274" );

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