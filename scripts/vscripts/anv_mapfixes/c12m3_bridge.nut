g_Chapter = "BLOOD HARVEST - THE BRIDGE";

devchap( "ALL MODES" );

// FIXES_ALL

make_clip( "_dispcrouch_preslope", "Everyone", 1, "-64 -128 -64", "64 256 88", "3090 -10118 -23", "20 0 0" );
make_clip( "_dispcrouch_trains", "Everyone", 1, "-500 -50 -169", "500 50 169", "4120 -14380 88", "0 6 0" );
make_clip( "_dispcrouch_eventlever", "Everyone", 1, "-412 -8 -61", "380 42 120", "8302 -13946 21", "0 -149 0" );
make_clip( "_dispcrouch_recompilefail", "Everyone", 1, "-620 -17 0", "620 17 70", "5930 -14086 -70", "0 3 0" );
make_clip( "_permstuck_eventlever", "Everyone", 1, "-17 -17 -17", "17 17 17", "8150 -13811 57" );
make_clip( "_nav_bridgecollapsea", "Survivors", 1, "-9 -10 0", "19 19 310", "5854 -12656 -41.3", "5 0 0" );
make_clip( "_nav_bridgecollapseb", "Survivors", 1, "-9 -10 0", "19 19 310", "6000 -12656 -41.3", "-5 0 0" );
make_clip( "_stuckwarp_endtunnel", "Everyone", 1, "-18 -60 0", "48 68 84", "968 -12932 20" );
make_clip( "_permstuck_terribadcliff", "Everyone", 1, "-68 -1 0", "68 46 148", "7317 -11487 451" );

con_comment( "MOVER:\tClip \"_bridge_dynamic_clip\" simulated to move when bridge collapses." );

make_clip( "_bridge_dynamic_clip", "Survivors", 1, "-69 -926 0", "69 6 1450", "5932 -13314 272" );
EntFire( "train_engine_button", "AddOutput", "OnPressed anv_mapfixes_bridge_dynamic_clip:AddOutput:origin 5932 -13784 272:0:-1" );

if ( g_BaseMode == "coop" || g_BaseMode == "realism" )
{
	devchap( "BASE COOP" );

	// FIXES

    patch_spawninfront( "7136 -11876 394", "0 -164 -24", "800 4 134" );

}
if ( g_BaseMode == "versus" )
{
	devchap( "BASE VERSUS" );

	// FIXES

    patch_spawninfront( "7136 -11876 394", "0 -164 -24", "800 4 134" );

}
if ( g_BaseMode == "survival" )
{
	devchap( "BASE SURVIVAL" );

	// FIXES

    make_clip( "_booster_sandtower", "Survivors", 1, "-106 -78 0", "82 75 1162", "4911 -13119 568" );
    make_clip( "_missing_tree_1", "Survivors", 1, "-23 -23 0", "23 23 1302", "2678 -13830 418" );
    make_clip( "_missing_tree_2", "Survivors", 1, "-23 -23 0", "23 23 1302", "3066 -14082 418" );
    make_clip( "_missing_tree_3", "Survivors", 1, "-23 -23 0", "23 23 1302", "4214 -12710 418" );
    make_clip( "_missing_tree_4", "Survivors", 1, "-23 -23 0", "23 23 1302", "3730 -14198 418" );

}