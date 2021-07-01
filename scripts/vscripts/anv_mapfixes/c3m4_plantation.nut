g_Chapter = "SWAMP FEVER - PLANTATION";

devchap( "ALL MODES" );

// FIXES_ALL

make_clip(	"_permstuck_housetarp",		"Everyone",	1,	"-24 -24 0",		"24 24 120",		"-1753 -996 16" );
make_clip(	"_commonhop_mansionroof",	"Survivors",	1,	"-711 -21 0",		"711 21 500",		"1856 -596 640" );
make_clip( "_stuckwarp_understairs", "Everyone", 1, "4 -55 -25", "39 57 21", "2816 119 162" );
make_clip( "_booster_mansionroofa", "Survivors", 1, "-204 -23 0", "212 105 533", "1660 527 640" );
make_clip( "_booster_mansionroofb", "Survivors", 1, "-580 -341 0", "588 105 533", "1660 399 640" );
make_clip( "_booster_mansionroofc", "Survivors", 1, "-924 -201 0", "736 152 533", "1660 -47 640" );
make_clip( "_booster_scaffoldpins", "Survivors", 1, "-199 -1 0", "146 9 909", "527 177 243" );
make_clip( "_booster_treeleft", "Survivors", 1, "-148 -116 0", "208 116 753", "735 1518 373" );
make_clip( "_booster_treeright", "Survivors", 1, "-130 -179 0", "145 156 753", "2558 1526 373" );
make_clip( "_nav_tinytree1", "Survivors", 1, "-108 -66 0", "68 66 842", "1485 997 311" );
make_clip( "_nav_tinytree2", "Survivors", 1, "-68 -66 0", "78 106 842", "1835 937 311" );
make_clip( "_nav_tinytree3", "Survivors", 1, "-118 -96 0", "98 146 842", "1825 1227 311" );
make_clip( "_nav_tinytree4", "Survivors", 1, "-48 -46 0", "88 96 842", "1555 1227 311" );
make_clip( "_nav_tinytree5", "Survivors", 1, "-58 -16 0", "98 126 842", "1429 1887 311" );
make_clip( "_nav_tinytree6", "Survivors", 1, "-68 -66 0", "138 156 842", "1839 1817 311" );
make_brush( "_defibtrick_undermap_dead", "-16 -58 -120", "24 54 0", "688 122 248" );

// For some maps the trigger_finale might exist after "round_start" and require delay -- but not this one!

con_comment( "LOGIC:\tPoint-of-no-return clip will be Enabled when finale is started." );

make_clip( "_point_of_no_return", "Survivors", 0, "-168 -164 12", "128 92 196", "2064 -412 396" );
EntFire( "trigger_finale", "AddOutput", "FinaleStart anv_mapfixes_point_of_no_return:Enable::0:-1" );

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

    make_clip( "_nav_shelvings", "Survivors", 1, "-48 -56 0", "65 56 63", "2127 -504 345" );

    con_comment( "FIX:\tPoint-of-no-return clip Enabled instantly to block Survivalists from boosting out." );

    EntFire( g_UpdateName + "_point_of_no_return", "Enable" );

}
if ( g_BaseMode == "scavenge" )
{
	devchap( "BASE SCAVENGE" );

	// FIXES

}