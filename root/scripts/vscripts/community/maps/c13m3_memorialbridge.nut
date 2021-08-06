g_Chapter = "COLD STREAM - MEMORIAL BRIDGE";

devchap( "ALL MODES" );

function DoRoundFixes()
{
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
        EntFire( "tanker_destruction_relay", "AddOutput", "OnTrigger " + g_UpdateName + "_shortcut_tanker:Kill::0:-1" );

    }

    // FIX: Prevent using water (or ladder) as a cushion to shortcut jump off bridge.

    // Un-patch for Coop because this isn't an out of bounds or softlock.

    // Between you and me, I almost accidentally insta-killed all Survivalists.

    if ( g_BaseMode != "coop" && g_BaseMode != "realism" && g_BaseMode != "survival" )
    {
        con_comment( "TRIG:\tAnti-shortcut \"_watercushion_trigonce\" deletes trighurt at stair descent." );

        make_trighurt( "_watercushion_trighurt", "Survivor", "-2470 -1486 -128", "480 858 32", "2441 -4194 270" );

        SpawnEntityFromTable( "trigger_once",
        {
            targetname	= g_UpdateName + "_watercushion_trigonce",
            StartDisabled	= 0,
            spawnflags	= 1,
            filtername	= "anv_globalfixes_filter_survivor",
            origin		= Vector( 912, -4537, 575 )
        } );

        EntFire( g_UpdateName + "_watercushion_trigonce", "AddOutput", "mins -148 -103 -319" );
        EntFire( g_UpdateName + "_watercushion_trigonce", "AddOutput", "maxs 139 985 401" );
        EntFire( g_UpdateName + "_watercushion_trigonce", "AddOutput", "solid 2" );

        EntFire( g_UpdateName + "_watercushion_trigonce", "AddOutput", "OnStartTouch " + g_UpdateName + "_watercushion_trighurt:Kill::0:-1" );
    }

    if ( HasPlayerControlledZombies() )
    {
        make_brush( "_losfix_bus",		"-1 -204 -8",	"1 204 8",	"1782 -4004 1335" );
        make_brush( "_losfix_gastruck",		"-36 -1 -12",	"36 1 12",	"-2933 -3970 1340" );
        make_ladder( "_ladder_endbrick_cloned_shortbase", "830 -3760 192", "9493 -5323 188", "0 -90 0", "0 1 0" );
        make_ladder( "_ladder_shrubwall1_cloned_shortbase", "830 -3760 192", "-5443 -1047 601" );
        make_ladder( "_ladder_shrubwall2_cloned_shortbase", "830 -3760 192", "-5373 -542 614" );
        make_ladder( "_ladder_sosemerge_cloned_shortbase", "830 -3760 192", "-4989 -1291 352" );
        make_ladder( "_ladder_supertallstart_cloned_samespot", "-3391 -4804 975", "0 305 0" );
        make_prop( "dynamic",		"_losblocker_acvent",		"models/props_rooftop/acvent04.mdl",		"6027 -6087 542",		"0 90 0",		"shadow_no" );
        make_prop( "dynamic",		"_propladder_bricka",		"models/props_industrial/brickpallets.mdl",	"5797.57 -6183.4 412.857",	"0 0 0",		"shadow_no" );
        make_prop( "dynamic",		"_propladder_brickb",		"models/props_industrial/brickpallets.mdl",	"5733 -6184 412.857",		"0 0 0",		"shadow_no" );
        make_prop( "dynamic",		"_propladder_brickc",		"models/props_industrial/brickpallets.mdl",	"5797.48 -6183.82 476.857",	"0 180 0",		"shadow_no" );
        make_prop( "dynamic",		"_propladder_brickd",		"models/props_industrial/brickpallets.mdl",	"5796.57 -6248.4 445.857",	"0 0 0",		"shadow_no" );
        make_prop( "dynamic",		"_propladder_bricke",		"models/props_industrial/brickpallets.mdl",	"5797.48 -6248.82 412.857",	"0 180 0",		"shadow_no" );
        make_prop( "dynamic",		"_propladder_brickf",		"models/props_industrial/brickpallets.mdl",	"5732.91 -6249.42 412.857",	"0 180 0",		"shadow_no" );
        make_prop( "dynamic",		"_propladder_brickg",		"models/props_industrial/brickpallets.mdl",	"5754 -6439 396.857",		"0 180 0",		"shadow_no" );
        patch_ladder( "-410.09 -4121.79 1386", "15 15 10" );
    }
}