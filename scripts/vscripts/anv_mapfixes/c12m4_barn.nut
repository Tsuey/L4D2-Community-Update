g_Chapter = "BLOOD HARVEST - THE TRAIN STATION";

devchap( "ALL MODES" );

// FIXES_ALL

make_clip(	"_dispcrouch_traintracka",	"Everyone",	1,	"-420 -355 -16",	"16 64 555",		"10250 -10145 -78" );
make_clip(	"_dispcrouch_traintrackb",	"Everyone",	1,	"-420 -255 -16",	"16 99 555",		"10120 -10600 -78" );
make_clip(	"_curvejump_bridgeend",		"Survivors",	1,	"-70 -6 -218",		"70 6 218",		"10230 -486 154" );
make_clip( "_dispcrouch_trainwall_one", "Everyone", 1, "-64 -640 -32", "8 0 36", "10203 -6505 -58", "0 2.5 0" );
make_clip( "_dispcrouch_trainwall_two", "Everyone", 1, "-64 -100 -32", "17 140 36", "10177 -6376 -58", "0 6 0" );
make_clip( "_dispcrouch_trainwall_three", "Everyone", 1, "-45 -320 -77", "21 216 64", "9813 -4120 0", "0 -7 0" );
make_clip( "_permstuck_clifftree", "Everyone", 1, "-17 -7 -7", "17 17 17", "10193 -6483 137" );
make_clip( "_permstuck_theonetheonly", "Everyone", 1, "-8 -15 0", "15 11 472", "11327 -8674 -64" );
make_clip( "_cliprework_pullcharge", "Survivors", 1, "-278 -17 -803", "1849 17 1042", "9272 -11114 646" );
make_clip( "_permstuck_forgottena", "Everyone", 1, "-17 -17 -17", "17 17 17", "9477 -11134 602" );
make_clip( "_permstuck_forgottenb", "Everyone", 1, "-17 -17 -17", "17 17 17", "9268 -10468 565" );
make_clip( "_permstuck_forgottenc", "Everyone", 1, "-17 -17 -17", "17 17 17", "9236 -9823 415" );
make_clip( "_permstuck_forgottend", "Everyone", 1, "-17 -17 -17", "17 17 17", "10118 -9681 527" );
make_clip( "_permstuck_forgottene", "Everyone", 1, "-17 -17 -17", "17 17 17", "9742 -9561 499" );
make_clip( "_permstuck_forgottenf", "Everyone", 1, "-17 -17 -17", "17 17 17", "9740 -9194 435" );
make_clip( "_permstuck_forgotteng", "Everyone", 1, "-17 -17 -17", "17 17 17", "10077 -9388 447" );
make_clip( "_permstuck_forgottenh", "Everyone", 1, "-17 -17 -17", "17 17 17", "10103 -8810 320" );
make_clip( "_permstuck_thanksagain", "Everyone", 1, "-14 -42 0", "34 47 32", "11403 -4579 -402" );
make_clip( "_event_window", "SI Players and AI", 1, "-12 -26 0", "12 26 16", "10876 -4166 88" );
patch_spawninfront( "10454 -1032 -64", "-142 -8 0", "142 8 420" );

make_prop( "dynamic", "_solidify_survivorchimney", "models/props/cs_militia/fireplacechimney01.mdl", "10862.2 -6085.53 120.492", "0 135 0", "shadow_no" );

if ( g_BaseMode == "coop" || g_BaseMode == "realism" )
{
	devchap( "BASE COOP" );

	// FIXES

    con_comment( "TRIG_UNDO:\tDelete anv_maptrigs.nut blockers which prevent train car commonhop skip for Coop-only." );

    EntFire( g_UpdateName + "_eventskip_commonhop*", "Kill", null, 4 );

}
if ( g_BaseMode == "versus" )
{
	devchap( "BASE VERSUS" );

	// FIXES

    make_clip( "_commonhop_roadsidefence", "Survivors", 1, "-3 -29 0", "5 27 1608", "10647 -7547 84" );
    make_clip( "_clipextend_traintruss", "Survivors", 1, "-204 -4 0", "208 128 1462", "10444 -7516 232" );

    make_clip(	"_shortcut_warehouse",		"Survivors",	1,	"0 -32 -32",		"8 64 256",		"10272 -7848 152" );
    make_clip(	"_commonhop_traintruss",	"Survivors",	1,	"-160 -120 -55",	"160 120 1545",		"10879 -7463 116" );

}