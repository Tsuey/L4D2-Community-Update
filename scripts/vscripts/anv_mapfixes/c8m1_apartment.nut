g_Chapter = "NO MERCY - APARTMENTS";

devchap( "ALL MODES" );

// FIXES_ALL

make_clip(	"_fallrevive_griefroom",	"Survivors",	1,	"-8 -40 -276",		"8 40 276",		"632 984 292" );
make_clip(	"_truckjump_window",		"Survivors",	1,	"-32 -8 -44",		"32 8 44",		"1728 3976 268" );
make_clip(	"_cliprework_rooftop03",	"Survivors",	1,	"-513 -409 0",		"513 409 4040",		"2047 2792.5 495.5" );
make_clip(	"_commonhop_electricalbox",	"Survivors",	1,	"-36 -52 0",		"50 64 287",		"2526 2418 209" );
make_clip(	"_cliprework_rooftop02",	"Survivors",	1,	"-474 -216 0",		"474 216 4040",		"2004 1996 640" );
make_clip(	"_cliprework_rooftop04",	"Survivors",	1,	"-216 -474 0",		"216 474 4040",		"2766 943 800" );
make_clip(	"_cliprework_rooftop01",	"Survivors",	1,	"-426 -313 0",		"426 313 4040",		"1943 480 800" );
make_clip(	"_clipextend_van",		"Survivors",	1,	"-99 -99 0",		"99 99 4239",		"2786 2528 404.7" );
make_clip(	"_cliprework_unattackable",	"Survivors",	1,	"-383 -600 0",		"129 1192 5000",	"127 2648.5 16" );
make_clip(	"_booster_corner",		"Survivors",	1,	"-513 -209 0",		"513 209 4242",		"512 5296.1 272" );
make_clip(	"_booster_windows",		"Survivors",	1,	"-8 -96 -44",		"8 96 44",		"2040 4672 268" );
make_clip(	"_booster_rubble",		"Survivors",	1,	"-8 -84 -44",		"8 24 4239",		"2952 5236 374.2" );
make_clip( "_clipextend_crushescape", "Survivors", 1, "-91 -1 0", "101 2 1042", "2459 767 853" );
make_clip( "_cliprework_rooftop05", "Survivors", 1, "-257 -183 0", "259 192 4042", "1793 1595 640" );
make_clip( "_clipextend_unattackable", "Survivors", 1, "-1459 -71 0", "461 73 4042", "2483 5327 528" );
make_clip( "_clipextend_policefence", "Survivors", 1, "-405 -16 0", "395 16 4042", "1173 2032 656" );
make_clip( "_clipextend_subwayfence", "Survivors", 1, "-4 -139 0", "6 152 280", "3266 4137 552", "0 -8 0" );
make_clip( "_nav_electricalboxa", "Survivors", 1, "-4 -29 0", "6 29 379", "2476 1819 125" );
make_clip( "_nav_electricalboxb", "Survivors", 1, "-30 -4 0", "30 6 513", "2016 2188 127" );
make_clip( "_cliprework_subwayupper", "Survivors", 1, "-201 -94 0", "215 90 4322", "2921 4194 156" );
make_clip( "_cliprework_subwayledge", "Survivors", 1, "-218 -18 132", "233 3 4322", "3014 4017 156" );
make_clip( "_cliprework_subwayfence", "Survivors", 1, "-5 -143 0", "4 149 3926", "3268 4141 552", "0 -8 0" );
make_clip( "_subwins_smoother", "Everyone", 1, "-120 -9 0", "120 9 3", "2968 4103 48" );
make_trighurt( "_instakill_griefroom", "Survivor", "-512 -1080 0", "384 1080 125", "1152 936 8" );

con_comment( "FIX:\tFans will now rotate. Server-side entities used to have Client-side Animation spawnflag." );

EntFire( "fanblade*", "AddOutput", "spawnflags 129" );