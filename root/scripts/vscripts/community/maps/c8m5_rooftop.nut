g_Chapter = "NO MERCY - ROOFTOP";

devchap( "ALL MODES" );

PrecacheModel( "models/props_rooftop/Gutter_Pipe_256.mdl" );
PrecacheModel( "models/props_pipes/PipeSet02d_512_001a.mdl" );
PrecacheModel( "models/props_pipes/PipeSet32d_256_001a.mdl" );

function DoRoundFixes()
{
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
	if ( g_BaseMode == "scavenge" )
	{
		devchap( "BASE SCAVENGE" );

		// FIXES

		con_comment( "SCAV:\tDeleted named safe door to no longer disconnect tongues when in CHECKPOINT." );

		EntFire( "checkpoint_exit", "Kill" );

		con_comment( "SCAV:\tSpawned physics clip to prevent can falling through displacement." );

		make_clip( "_dispcollision_rooftop", "All and Physics", 1, "-101 -64 0", "160 64 32", "6825 9535 5612", "0 -37.5 0" );

	}

	if ( HasPlayerControlledZombies() )
	{
		make_brush( "_losfix_pipes1",		"-4 -156 -1",	"4 156 1",	"5830 8147 6055.36" );
		make_brush( "_losfix_pipes2",		"-4 -156 -1",	"4 156 1",	"5982 8852 6055.36" );
		make_clip( "_ladder_helipadcosmetic_clip", "Everyone", 1, "-16 -8 0", "16 -3 3", "7288 8968 6206" );
		make_clip( "_ladder_missingpiece_clipl", "Everyone", 1, "-3 -2 0", "16 4 180", "6460 7911 5772", "0 45 0" );
		make_clip( "_ladder_missingpiece_clipr", "Everyone", 1, "-8 -2 0", "12 4 180", "6462 7951 5772", "0 -45 0" );
		make_ladder( "_ladder_deathchargenew_cloned_deathcharge", "5878 7479.5 5797.9", "268 136 148" );
		make_ladder( "_ladder_deathjockeynew_cloned_deathjockey", "6419 9528.5 5797.9", "-470 -104 148" );
		make_ladder( "_ladder_helipadclimbable_cloned_satelliteyellow", "6712.5 8704 6112", "-1415.96 15683.6 29", "0.1 -90 0", "0 -1 0" );
		make_ladder( "_ladder_helipadcosmetic_cloned_deathcharge", "5878 7479.5 5797.9", "1410 1746.313 -67", "0 0 2.5", "0 -1 0" );
		make_ladder( "_ladder_missingpiece_cloned_northgutter", "5878 7479.5 5797.895", "13952 2055 0.25", "0 90 0", "1 0 0" );
		make_ladder( "_ladder_saferoomlulz_cloned_rooftopmain", "5924 8561.1 6018", "13896 2362 -447", "0 90 0", "0 1 0", 0 );
		make_ladder( "_ladder_startstairwell_cloned_deathjockey", "6419 9528.5 5797.9", "-998 -940.5 -108" );
		make_ladder( "_ladder_transformer1_cloned_deathcharge", "5878 7479.5 5797.9", "14206 1770 -112.5", "0 90 0", "1 0 0" );
		make_ladder( "_ladder_transformer2_cloned_deathcharge", "5878 7479.5 5797.9", "13174.9 2001.42 -16", "0 90 0", "1 0 0" );
		make_ladder( "_ladder_transformer3_cloned_deathjockey", "6419 9528.5 5797.9", "15006 2704 -16", "0 90 0", "-1 0 0" );
		make_ladder( "_ladder_transformer4_cloned_deathcharge", "5878 7479.5 5797.9", "1833.28 913.736 -16.5" );
		make_ladder( "_ladder_transformer5_cloned_deathjockey", "6419 9528.5 5797.9", "-3190 15179 163.5", "0 -90 0", "1 0 0" );
		make_ladder( "_ladder_uponewayside_cloned_longshaft", "7018 8992.5 4800", "-1437.5 16118 166", "0 -90 0", "1 0 0" );
		make_prop( "dynamic", "_ladder_missingpiece_pipe", "models/props_rooftop/Gutter_Pipe_256.mdl", "6464 7933 5952", "0 90 0", "shadow_no" );
		make_prop( "dynamic", "_ladder_startstairwell_pipe", "models/props_pipes/PipeSet02d_512_001a.mdl", "5421 8586 5587.8", "-90 0 0", "shadow_no" );
		make_prop( "dynamic", "_ladder_transformer5_patch", "models/props_pipes/PipeSet32d_256_001a.mdl", "6340 8757 5784", "-90 -64 0", "shadow_no" );
		make_prop( "dynamic", "_ladder_uponewayside_pipe", "models/props_pipes/PipeSet02d_512_001a.mdl", "7553 9100 5950", "-90 -90 0", "shadow_no" );
	}
}

function DoMapSpawnFixes()
{
	make_decal( "decals/decalstain002a", "6480 8794 6161" );
	make_decal( "decals/prodconcrete05", "7281 8960 6191" );
	make_decal( "decals/debris_concrete001a",	"7283 8926 6088" );
	make_decal( "decals/prodconcrete04",		"5942 9424 5983" );
	make_decal( "decals/infstains",			"6188 7616 5967" );
}