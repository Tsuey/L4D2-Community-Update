g_Chapter = "NO MERCY - ROOFTOP";

devchap( "ALL MODES" );

// FIXES_ALL

make_clip( "_charger_smoother_01", "Everyone", 1, "-4 -216 -17",	"4 232 1",	"7932 8496 5780",	"46 0 0" );
make_clip( "_charger_smoother_02", "Everyone", 1, "-4 -90 -17",	"4 66 1",	"7804 8058 5780",	"46 0 0" );
make_clip( "_charger_smoother_03", "Everyone", 1, "-4 -90 -17",	"4 274 1",	"7804 8974 5780",	"46 0 0" );
make_clip( "_charger_smoother_04", "Everyone", 1, "-4 -90 -17",	"8 117 1",	"7877 8795 5780",	"46 38.6 0" );
make_clip( "_charger_smoother_05", "Everyone", 1, "-809 -4 -17",	"343 4 1",	"7273 9436 5780",	"0 0 -46" );
make_clip( "_charger_smoother_06", "Everyone", 1, "-809 -4 -17",	"343 4 1",	"7273 7780 5780",	"0 0 46" );
make_clip( "_charger_smoother_07", "Everyone", 1, "-109 -4 -17",	"160 4 1",	"5421 7780 5780",	"0 0 46" );
make_clip( "_charger_smoother_08", "Everyone", 1, "-4 -216 -17",	"4 232 1",	"4996 8496 5780",	"-46 0 0" );
make_clip( "_charger_smoother_09", "Everyone", 1, "-4 -74 -17",	"4 78 1",	"5124 8962 5780",	"-46 0 0" );
make_clip( "_charger_smoother_10", "Everyone", 1, "-4 -74 -17",	"4 78 1",	"5124 8042 5780",	"-46 0 0" );
make_clip( "_charger_smoother_11", "Everyone", 1, "-4 -90 -21",	"8 116 1",	"5049 8798 5780",	"-46 -38.6 0" );
make_clip( "_charger_smoother_12", "Everyone", 1, "-4 -90 -21",	"8 116 1",	"5066 8188 5780",	"-46 38.6 0" );
make_clip( "_charger_smoother_13", "Everyone", 1, "-106 -4 -17",	"160 4 1",	"5418 9228 5780",	"0 0 -46" );
make_clip( "_charger_smoother_14", "Everyone", 1, "-352 -4 -17",	"672 4 1",	"6112 9644 5652",	"0 0 -46" );
make_clip( "_charger_smoother_15", "Everyone", 1, "-4 -22 -17",	"4 22 1",	"6988 9462 5652",	"46 0 0" );
make_clip( "_charger_smoother_16", "Everyone", 1, "-4 -154 -17",	"4 98 1",	"5556 9386 5652",	"-46 0 0" );
make_clip( "_charger_smoother_17", "Everyone", 1, "-4 -138 -17",	"4 116 1",	"5666 9572 5652",	"-46 -52.1 0" );
make_clip( "_charger_smoother_18", "Everyone", 1, "-4 -114 -17",	"4 140 1",	"6897 9557 5652",	"46 52.1 0" );
make_clip( "_charger_smoother_19", "Everyone", 1, "-4 -48 -17",	"4 206 1",	"6988 7570 5652",	"46 0 0" );
make_clip( "_charger_smoother_20", "Everyone", 1, "-4 -114 -17",	"4 140 1",	"6875 7434 5652",	"46 -52.6 0" );
make_clip( "_charger_smoother_21", "Everyone", 1, "-352 -4 -17",	"668 4 1",	"6114 7364 5652",	"0 0 46" );
make_clip( "_charger_smoother_22", "Everyone", 1, "-4 -138 -17",	"4 116 1",	"5649 7449 5652",	"-46 52.6 0" );
make_clip( "_charger_smoother_23", "Everyone", 1, "-4 -108 -17",	"4 146 1",	"5556 7630 5652",	"-46 0 0" );
make_clip( "_charger_smoother_24", "Everyone", 1, "-8 -4 -17",	"8 4 1",	"5816 7780 5780",	"0 0 46" );
make_clip( "_charger_smoother_25", "Everyone", 1, "-8 -4 -17",	"8 4 1",	"5816 9228 5780",	"0 0 -46" );
make_clip( "_charger_smoother_26", "Everyone", 1, "-4 -90 -17",	"8 113 1",	"7861 8193 5780",	"46 -38.6 0" );
make_clip( "_railing_rampright", "Everyone", 1, "-1 -78 0", "1 140 32", "5473 8478 6000", "0 0 45" );
make_clip( "_railing_rampleft", "Everyone", 1, "-1 -78 0", "1 125 32", "5567 8478 6000", "0 0 45" );

if ( g_BaseMode == "coop" || g_BaseMode == "realism" )
{
	devchap( "BASE COOP" );

	// FIXES

    // Already present in anv_versus.nut just mirroring it here so Coopers can meme, too.

    make_ladder( "_ladder_saferoomlulz_cloned_rooftopmain", "5924 8561.1 6018", "13896 2362 -447", "0 90 0", "0 1 0", 0 );

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

}
if ( g_BaseMode == "scavenge" )
{
	devchap( "BASE SCAVENGE" );

	// FIXES

    con_comment( "SCAV:\tDeleted named safe door to no longer disconnect tongues when in CHECKPOINT." );

    EntFire( "checkpoint_exit", "Kill" );

    con_comment( "SCAV:\tSpawned physics clip to prevent can falling through displacement." );

    make_clip( "_dispcollision_rooftop", "All and Physics", 1, "-101 -64 0", "160 64 32", "6825 9535 5612", "0 -37.5 0" );

}