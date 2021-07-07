g_Chapter = "COLD STREAM - CUT-THROAT CREEK";

devchap( "ALL MODES" );

// FIXES_ALL

make_clip(	"_permstuck_treetunnel",	"Everyone",	1,	"-16 -17 -10",		"17 16 45",		"-492.1 -186.3 -385" );
make_clip(	"_dispcrouch_toomany",		"Everyone",	1,	"0 0 -80",		"128 128 9001",		"-3028 -6154 413" );
make_clip( "_eventskip_rooftop", "Survivors", 1, "-317 -401 0", "323 367 689", "-3891 -8135 723" );
make_clip( "_eventskip_fence1", "Survivors", 1, "-59 -16 0", "60 16 910", "-4268 -8520 504" );
make_clip( "_eventskip_fence2", "Survivors", 1, "-151 -20 0", "849 20 914", "-3409 -7764 500" );
make_clip( "_cliprework_startbooster", "Survivors", 1, "-86 -520 -863", "203 361 226", "-4930 -5987 1188" );
make_clip( "_cliprework_endbooster", "Survivors", 1, "-72 -103 -175", "63 91 1415", "-1175 1405 57" );
make_clip( "_dispcrouch_onewaydrop", "Everyone", 1, "-402 -64 -64", "465 18 422", "-3893 -5852 -128" );
make_clip( "_cliprework_dispcrouch00", "SI Players and AI", 1, "-64 -149 -164", "18 87 146", "-4030 -5257 132", "0 -5 0" );
make_clip( "_cliprework_dispcrouch01", "Survivors", 1, "-64 -269 -64", "18 277 1446", "-4030 -5357 -32", "0 -5 0" );
make_clip( "_cliprework_dispcrouch02", "Survivors", 1, "-64 -269 -64", "18 1097 1446", "-4020 -4815 -32", "0 3 0" );
make_clip( "_cliprework_dispcrouch03", "Survivors", 1, "-64 -102 -64", "18 478 1446", "-4180 -1920 -32", "0 -21 0" );
make_clip( "_cliprework_dispcrouch04", "Survivors", 1, "-64 -22 -64", "18 408 1446", "-3971 -1527 -32", "0 -94 0" );
make_clip( "_cliprework_dispcrouch05", "Survivors", 1, "-64 -22 -64", "18 439 1446", "-3551 -1552 -32", "0 -64 0" );
make_clip( "_cliprework_dispcrouch06", "Survivors", 1, "-64 -157 -64", "18 369 1446", "-3126 -1398 -32", "0 -104 0" );
make_clip( "_cliprework_dispcrouch07", "Survivors", 1, "-64 -157 -64", "18 451 1446", "-2619 -1469 -31", "0 -84 0" );
make_clip( "_cliprework_dispcrouch08", "SI Players", 1, "-138 -16 -128", "48 16 216", "-2314 -2346 130", "0 -15 0" );
make_clip( "_cliprework_dispcrouch09", "SI Players", 1, "-138 -16 -128", "198 16 216", "-2172 -2422 130", "0 -17 0" );
make_clip( "_cliprework_dispcrouch10", "SI Players", 1, "-138 -16 -128", "488 16 108", "-1839 -2492 130", "0 13 0" );
make_clip( "_cliprework_dispcrouch11", "SI Players", 1, "-138 -16 -177", "488 16 0", "-1238 -2465 130", "0 -1 0" );
make_clip( "_cliprework_dispcrouch12", "SI Players", 1, "-8 -171 -42", "8 188 102", "415 -921 77", "0 -5 0" );
make_clip( "_dispcrouch_waterfall", "Everyone", 1, "-64 -188 -64", "18 263 272", "-2184 -1700 -288", "0 -10 0" );
make_clip( "_permstuck_umheymatt", "Everyone", 1, "-16 -128 0", "16 128 142", "13 5280 -117" );

if ( g_BaseMode == "versus" )
{
	devchap( "BASE VERSUS" );

	// FIXES

    make_clip( "_commonhop_endshortcut", "Survivors", 1, "-94 -35 -153", "93 -29 1437", "-693 4555 35", "0 5 0" );

}

if ( HasPlayerControlledZombies() )
{
	kill_entity( Entities.FindByClassnameNearest( "prop_physics", Vector( -521.5, -1260.25, -399.53125 ), 8 ) );
	make_clip(	"_ladder_startstreamL_clip",	"SI Players",	1,	"0 -30 -8",	"120 60 8",	"-4028 -5137 345", "0 90 31" );
	make_clip(	"_ladder_littlecliff_qola",	"SI Players",	1,	"-60 0 -8",	"40 50 8",	"-3685 -1397 312", "0 20 45" );
	make_clip(	"_ladder_littlecliff_qolb",	"SI Players",	1,	"-60 -24 -8",	"44 20 12",	"-3706 -1352 366", "0 20 45" );
	make_brush( "_losfix_gen1",		"-1 -24 -8",	"1 24 8",	"-821 5675.32 -110" );
	make_brush( "_losfix_gen2",		"-24 -1 -8",	"24 1 8",	"-838 4598 -110" );
	make_ladder( "_ladder_cornerlowroofl_cloned_endbackarea", "-1 5304 -43.124", "-1245 660 107" );
	make_ladder( "_ladder_cornerlowroofr_cloned_endbackarea", "-1 5304 -43.124", "-1245 692 107" );
	make_ladder( "_ladder_enddumpsterL_cloned_endstackback", "-38 5888 -55.124", "-6748 5750 -30", "0 -90 0", "0 -1 0" );
	make_ladder( "_ladder_enddumpsterR_cloned_endstackback", "-38 5888 -55.124", "-6469 5752 -30", "0 -90 0", "0 -1 0" );
	make_ladder( "_ladder_endstackfront_cloned_endstackback", "-38 5888 -55.124", "-1302 11213 -4", "0 -168 0", "-0.98 -0.2 0" );
	make_ladder( "_ladder_endwarehouseR_cloned_endwarehouseL", "178 4845.5 -18.624", "0 -685 0" );
	make_ladder( "_ladder_fourthstream_cloned_secondstream", "-4184 -3448.5 244", "-27 1450 -100" );
	make_ladder( "_ladder_littlecliff_cloned_waterfall", "-2164 -1760 -112", "-573 -1861 460", "-6 -48.11 0", "0.67 -0.74 0" );
	make_ladder( "_ladder_thirdstream_cloned_secondstream", "-4184 -3448.5 244", "-8270 -4977 -88", "0 168 0", "-0.98 0.2 0" );
	make_ladder( "_ladder_stairsfence_cloned_backfence", "-898 1668.5 -49.1", "684 730 0" );
	make_ladder( "_ladder_startstreamL_cloned_startstreamR", "-3559.5 -4536.5 185", "-7540 -9590 8", "0 180 0", "1 0 0" );
	make_navblock( "_losblocker_startshrubnavblock", "Everyone", "Apply", "-64 -64 -64", "64 64 64", "-3400 -7300 360" );
	make_prop( "dynamic",		"_losblocker_startshrubwall",	"models/props_foliage/swamp_shrubwall_block_256_deep.mdl",	"-3388 -7294 335",		"0 231 0",		"shadow_no" );
	make_prop( "dynamic", "_solidify_startcluster1", "models/props_foliage/urban_trees_cluster01.mdl", "-3130 -6492 366.443", "0 0 0", "shadow_no" );
	make_prop( "dynamic", "_solidify_startcluster2", "models/props_foliage/urban_trees_cluster01.mdl", "-3168 -5984 317.023", "0 0 0", "shadow_no" );
	make_prop( "physics", "_hittable_replacement", "models/props_foliage/tree_trunk_fallen.mdl", "-714 -863 -385", "0 100 0", "shadow_yes", "solid_yes", "255 255 255", -1, 0, 1.5 );
	patch_ladder( "-1 5304 -43.124", "50 0 0" );
	patch_ladder( "-202.0005 -1483.2271 -224", "0 0 10" );
	patch_ladder( "145 4845.5 202", "-15 0 0" );
	patch_ladder( "159 4845.5 159", "-15 0 0" );
	patch_ladder( "178 4845.5 109.5", "-17 0 0" );
	patch_ladder( "195 4845.5 -18.624", "-17 0 0" );
}