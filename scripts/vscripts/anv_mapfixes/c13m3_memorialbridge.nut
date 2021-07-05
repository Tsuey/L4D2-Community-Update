g_Chapter = "COLD STREAM - MEMORIAL BRIDGE";

devchap( "ALL MODES" );

// FIXES_ALL

make_clip(	"_permstuck_treea",		"Everyone",	1,	"-18 -17 -446",		"18 17 446",		"-3603 -6160 897" );
make_clip(	"_permstuck_treeb",		"Everyone",	1,	"-30 -75 -476.5",	"30 75 476.5",		"-3343 -5975 854" );
make_clip(	"_permstuck_treed",		"Everyone",	1,	"-22 -20.5 -91.5",	"22 20.5 91.5",		"-3310 -3600 405" );
make_clip(	"_permstuck_treec",		"Everyone",	1,	"-30 -16 -110",		"30 16 110",		"-3305 -4815 442" );
make_clip(	"_permstuck_jaynjer",		"Everyone",	1,	"-42 -52 -32",		"42 42 90",		"-4495 -4584 719" );
make_clip( "_hangcancel_perimeter", "Survivors", 1, "-25 -44 0", "28 94 1484", "13 -3620 896", "0 -8 0" );
make_clip( "_sneaky_hunter", "SI Players", 1, "-19 -1242 0", "37 615 112", "5666 -5383 272" );
make_clip( "_permstuck_shrubtreea", "Everyone", 1, "-17 -17 -17", "17 17 17", "-5080 -5712 970" );
make_clip( "_permstuck_shrubtreeb", "Everyone", 1, "-17 -17 -17", "17 17 17", "-5034 -5307 970" );
make_clip( "_permstuck_shrubtreec", "Everyone", 1, "-17 -17 -17", "17 17 17", "-4964 -4637 949" );
make_clip( "_cliprework_shrubwalla", "Survivors", 1, "-188 -16 -365", "402 16 849", "-4360 -6081 815", "0 -36 0" );
make_clip( "_cliprework_shrubwallb", "Survivors", 1, "-568 -16 -365", "822 16 849", "-4540 -5175 815", "0 -89 0" );
make_clip( "_cliprework_shrubwallc", "Survivors", 1, "-34 -16 -365", "108 16 849", "-4540 -4507 815", "0 -108 0" );
make_clip( "_cliprework_shrubwalld", "Survivors", 1, "-724 -16 -365", "108 16 497", "-4498 -4375 815", "0 -115 0" );
make_clip( "_cliprework_shrubwalle", "Survivors", 1, "-275 -16 -365", "116 16 815", "-4093 -3646 815", "0 -135 0" );
make_clip( "_clipextend_bridgeleft1", "Survivors", 1, "0 -26 0", "2012 26 317", "-2128 -3706 1538" );
make_clip( "_clipextend_bridgeleft2", "Survivors", 1, "0 -26 0", "344 26 317", "380 -3706 1538" );
make_clip( "_clipextend_bridgeright1", "Survivors", 1, "0 -30 0", "462 29 317", "-2128 -4480 1538" );
make_clip( "_clipextend_bridgeright2", "Survivors", 1, "0 -30 0", "476 29 317", "-1334 -4480 1538" );
make_clip( "_clipextend_bridgeright3", "Survivors", 1, "0 -30 0", "1376 29 317", "-600 -4480 1538" );
make_clip( "_cliprework_enddumpsters", "Survivors", 1, "-77 -130 0", "77 130 768", "5964 -3954 494" );
make_clip( "_bridge_collision", "All and Physics", 1, "-45 -473 0", "46 463 4", "1004 -4091 586" );

if ( g_BaseMode == "coop" || g_BaseMode == "realism" )
{
	devchap( "BASE COOP" );

	// FIXES

    patch_ladder( "-410.09 -4121.79 1386", "15 15 10" );

}
if ( g_BaseMode == "versus" )
{
	devchap( "BASE VERSUS" );

	// FIXES

    con_comment( "LOGIC:\tAnti-shortcut tanker clip will be deleted upon its destruction." );

    make_clip( "_shortcut_tanker", "Survivors", 1, "-58 -577 0", "58 271 527", "1092 -3999 1328", "0 27 0" );
    EntFire( "tanker_destruction_relay", "AddOutput", "OnTrigger anv_mapfixes_shortcut_tanker:Kill::0:-1" );

}