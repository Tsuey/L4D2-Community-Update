g_Chapter = "NO MERCY - SEWER";

devchap( "ALL MODES" );

function DoRoundFixes()
{
    make_clip(	"_commonhop_trashbags",		"Survivors",	1,	"-256 -670 0",		"4 95 1190",		"10693 5279 17" );
    make_clip(	"_clipextend_roofandfence",	"Survivors",	1,	"-4 -1010 0",		"4 420 1200",		"10525 6365 24" );
    make_clip(	"_filecabinet_hole",		"Survivors",	1,	"-32 -32 -4",		"32 32 4",		"10928 8208 292" );
    make_clip(	"_permstuck_semitrailer",	"SI Players",	1,	"-24 -10 0",		"24 17 171",		"13349 11144 24" );
    make_clip(	"_booster_escapeladder",	"Survivors",	1,	"-47 -88 0",		"42 112 929",		"14680 13819 255" );
    make_clip( "_nav_garagewindow1", "Everyone", 1, "-5 -36 0", "5 36 32", "12044 5900 19" );
    make_clip( "_nav_garagewindow2", "Everyone", 1, "-64 -5 0", "64 5 32", "11928 5948 19" );
    make_clip( "_unattackable_wrongway1", "Survivors", 1, "-518 -7 0", "1002 7 652", "11030 4601 560" );
    make_clip( "_unattackable_wrongway2", "Survivors", 1, "-232 -7 0", "737 7 742", "12264 4532 468" );
    make_clip( "_unattackable_wrongway3", "Survivors", 1, "-7 -1225 -248", "7 2578 632", "13003 5742 568" );
    make_clip( "_unattackable_hospital1", "Survivors", 1, "-7 -331 -9", "7 1396 1717", "12473 12235 457" );
    make_clip( "_unattackable_hospital2", "Survivors", 1, "-7 -339 -449", "7 429 737", "12473 11475 457" );
    make_clip( "_unattackable_hospital3", "Survivors", 1, "-1314 -17 -456", "893 16 742", "13890 10833 464" );
    make_clip( "_unattackable_hospital4", "Survivors", 1, "-7 -626 0", "8 1602 576", "14791 11454 608" );
    make_clip( "_clipextend_alley", "Survivors", 1, "-54 -29 0", "236 29 782", "12774 8347 432" );
    make_clip( "_clipextend_warehouse1", "Survivors", 1, "-270 -753 -43", "290 799 372", "10742 7529 843" );
    make_clip( "_clipextend_warehouse2", "Survivors", 1, "-787 -413 0", "909 403 372", "11795 7941 800" );
    make_trigduck( "_duckqol_warehousevent", "-9 -26 -28", "9 26 28", "12712 8148 304" );

    make_clip(	"_gasstationroof_TMP",		"Survivors",	1,	"0 -794 0",		"503 0 700",		"12186 6694 324" );

    make_clip(	"_ladderqol_scissorlift",	"Everyone",	0,	"-54 -1 -184",		"8 8 58",		"12687 7171 16" );

    con_comment( "LOGIC:\tTMP Gas Station roof clip will be deleted when it explodes." );

    EntFire( "gas_explosion_sound_relay", "AddOutput", "OnTrigger anv_mapfixes_gasstationroof_TMP:Kill::0:-1" );

    con_comment( "MOVER:\tClip \"_ladderqol_scissorlift\" simulated to move up with Scissor Lift." );

    EntFire( "washer_lift_button2", "AddOutput", "OnPressed anv_mapfixes_ladderqol_scissorlift:Enable::2:-1" );
    EntFire( "washer_lift_button2", "AddOutput", "OnPressed anv_mapfixes_ladderqol_scissorlift:AddOutput:origin 12687 7170 62:4:-1" );
    EntFire( "washer_lift_button2", "AddOutput", "OnPressed anv_mapfixes_ladderqol_scissorlift:AddOutput:origin 12687 7170 108:6:-1" );
    EntFire( "washer_lift_button2", "AddOutput", "OnPressed anv_mapfixes_ladderqol_scissorlift:AddOutput:origin 12687 7170 154:8:-1" );
    EntFire( "washer_lift_button2", "AddOutput", "OnPressed anv_mapfixes_ladderqol_scissorlift:AddOutput:origin 12687 7170 200:10:-1" );
    EntFire( "washer_lift_button2", "AddOutput", "OnPressed anv_mapfixes_ladderqol_scissorlift:Kill::12:-1" );


    if ( g_BaseMode == "versus" )
    {
        devchap( "BASE VERSUS" );

        // FIXES

        make_clip(	"_window_ricky",		"Survivors",	1,	"-368 0 0",		"144 4 80",		"13680 11132 208" );
        make_clip(	"_commonhop_trimescape",	"Survivors",	1,	"-288 -1 0",		"312 5 525",		"14240 11137 208" );

        con_comment( "LOGIC:\tTMP shortcut booster clips will be deleted when Scissor Lift is started.\n"
            + "\tCaution: Do not delete this logic otherwise the clips are gamebreakers." );

        make_clip(	"_shortcut_booster_TMP1",	"Survivors",	1,	"-126 -19 0",		"127 20 1048",		"10897 6764 176" );
        make_clip(	"_shortcut_booster_TMP2",	"Survivors",	1,	"-24 -303 0",		"24 304 972",		"11032 7048 252" );

        EntFire( "washer_lift_button2", "AddOutput", "OnPressed anv_mapfixes_shortcut_booster_TMP*:Kill::0:-1" );

    }
    if ( g_BaseMode == "survival" )
    {
        devchap( "BASE SURVIVAL" );

        // FIXES

        con_comment( "LOGIC:\tGas Station explosion will alternatively start Survival timer." );

        EntFire( "gas_explosion_sound_relay", "AddOutput", "OnTrigger director:PanicEvent::2:-1" );

    }

    function c8m3_DynamicLadder()
    {
        make_ladder( "_ladder_gasdynamictop_cloned_burgerbackm", "10516.5 6416 84.4385", "2187 197 159" );
        make_ladder( "_ladder_gasdynamicbot_cloned_burgerbackm", "10516.5 6416 84.4385", "2187 197 31" );
    }

    if ( HasPlayerControlledZombies() )
    {
        kill_entity( Entities.FindByClassnameNearest( "func_brush", Vector( 10528, 6170.91, 62.5938 ), 1 ) );
        kill_entity( Entities.FindByClassnameNearest( "func_brush", Vector( 10528, 6558.31, 62.5938 ), 1 ) );
        kill_entity( Entities.FindByClassnameNearest( "func_brush", Vector( 14794, 11567.2, 625.313 ), 1 ) );
        kill_funcinfclip( 525.363 );		// Delete clip at end manhole blocking left rooftop
        kill_funcinfclip( 546.035 );		// Delete clip at end manhole blocking right rooftop
        kill_funcinfclip( 767.643 );		// Delete clip blocking Burger Tank fence and 3 unusable ladders
        kill_funcinfclip( 851.288 );		// Delete clip blocking EASTERN WATERWORKS rooftop above Scissor Lift
        make_atomizer( "_atomizer_bsp_forklift", "12695 8149 16", "models/props\\cs_assault\\forklift_brokenlift.mdl", 60 );
        make_atomizer( "_atomizer_bsp_manholecars", "14272 11613 -20", "models/props_vehicles/cara_82hatchback.mdl", 60 );
        make_atomizer( "_atomizer_bsp_manholedump", "14272 11613 -30", "models/props_junk/dumpster.mdl", 60 );
        make_atomizer( "_atomizer_bsp_manholeflip", "14272 11613 -10", "models/props_vehicles/cara_95sedan_wrecked.mdl", 60 );
        make_brush( "_losfix_copcar",		"-1 -70 -8",	"1 70 8",	"10222 5963 16" );
        make_brush( "_losfix_gasstation_los", "-45 -185 0", "45 185 1", "12659 6089 312" );
        make_brush( "_losfix_pipes",		"-56 -1 -8",	"68 1 20",	"13490 7744.5 -249" );
        make_brush( "_losfix_semi",		"-1 -48 -15",	"1 48 15",	"11906 6664 30" );
        make_brush( "_losfix_sewage_tank1a",	"-132 -1 -6",	"132 1 6",	"13472 8306 -251" );
        make_brush( "_losfix_sewage_tank1b",	"-132 -1 -6",	"132 1 6",	"13472 7893 -251" );
        make_brush( "_losfix_sewage_tank2a",	"-132 -1 -6",	"132 1 6",	"13042 7891 -251" );
        make_brush( "_losfix_sewage_tank2b",	"-132 -1 -6",	"132 1 6",	"13042 8120 -251" );
        make_brush( "_losfix_sewage_tank2c",	"-132 -1 -6",	"132 1 6",	"13040 8300 -251" );
        make_clip( "_burgerfence_blocker1", "SI Players", 1, "-419 -675 0", "-409 615 1202", "10137 6395 8" );
        make_clip( "_burgerfence_blocker2", "SI Players", 1, "-419 -675 0", "384 -665 1202", "10137 6395 8" );
        make_clip( "_burgerfence_blocker3", "SI Players", 1, "-419 605 0", "384 615 1202", "10137 6395 8" );
        make_clip( "_ladder_burgerfenceshared_clip", "SI Players", 1, "0 -434 0", "6 398 149", "10521 6386 8" );
        make_clip( "_ladder_scissormini_clipleft", "Everyone", 1, "-18 -8 0", "18 8 106", "12044 7545 323", "0 -45 0" );
        make_clip( "_ladder_scissormini_clipright", "Everyone", 1, "-18 -8 0", "18 8 106", "12094 7545 323", "0 45 0" );
        make_clip( "_ladder_warehousealley_clip", "Everyone", 1, "-22 0 -32", "39 4 96", "12789 8317 48" );
        make_clip( "_losfix_gasstation_coll", "SI Players", 1, "-45 -185 0", "45 185 3", "12659 6089 312" );
        make_clip( "_meticulous_funcinfclip01", "SI Players", 1, "-8 -295 0", "8 319 601", "15184 11445 608" );
        make_clip( "_meticulous_funcinfclip02", "SI Players", 1, "-156 -6 0", "228 6 473", "14964 11156 736" );
        make_clip( "_meticulous_funcinfclip03", "SI Players", 1, "-207 -16 0", "175 61.5 463", "13584 10754 746" );
        make_clip( "_waterworks_blocker", "SI Players", 1, "-8 -728 0", "8 358 412", "13008 7408 800" );
        make_clip( "_waterworks_collision", "SI Players", 1, "-41 -245 0", "32 247 110", "12761 7407 857" );
        make_ladder( "_ladder_brickapartment_cloned_unusedmercyback", "11899.5 12470 232", "-460 -6825 112" );
        make_ladder( "_ladder_gasstationfence_cloned_warehousepipe", "11904 8299.5 161", "959 -2392 14" );
        make_ladder( "_ladder_overturnedsemiB_cloned_nodrawfence", "12930.5 5831 90", "-2546 3593 511", "0 -14.27 -5", "0.96 -0.27 0" );
        make_ladder( "_ladder_overturnedsemiT_cloned_sewerdropB", "14128 8198 -476", "-2795 -2229 688" );
        make_ladder( "_ladder_sewerup1_cloned_uppershafts", "12735 10083 -348", "278 445 88" );
        make_ladder( "_ladder_sewerup2_cloned_uppershafts", "12735 10083 -348", "278 933 88" );
        make_ladder( "_ladder_startpawnrear_cloned_warehousepipe", "11904 8299.5 161", "-768 -3429 -26" );
        make_ladder( "_ladder_warehousealley_cloned_endminialley", "13912 10818.5 90", "-1160 -2501 0" );
        make_ladder( "_ladder_warehouseexittall_cloned_unusedmercyback", "11899.5 12470 232", "640 -4441 -177" );
        make_ladder( "_ladder_warehousemiddleB_cloned_endminialley", "13912 10818.5 90", "-2392 -2811 -45" );
        make_ladder( "_ladder_warehousemiddleT_cloned_burgerentrance", "11408 5435.55 110", "59 2641 67" );
        make_ladder( "_ladder_warehouserightboxes_cloned_mercyside", "12708 11903.5 232", "-958 -4167 -177" );
        make_ladder( "_ladder_warehousewindow_cloned_endminialley", "13912 10818.5 90", "-2857 -2629 -20" );
        make_prop( "dynamic", "_burgerfence_wrongwaya", "models/props_misc/wrongway_sign01_optimized.mdl", "10357 7000 65", "0 -90 0", "shadow_no", "solid_no", "255 255 255", "17", "217" );
        make_prop( "dynamic", "_burgerfence_wrongwayb", "models/props_misc/wrongway_sign01_optimized.mdl", "10057 7000 65", "0 -90 0", "shadow_no", "solid_no", "255 255 255", "17", "217" );
        make_prop( "dynamic", "_burgerfence_wrongwayc", "models/props_misc/wrongway_sign01_optimized.mdl", "9757 7000 65", "0 -90 0", "shadow_no", "solid_no", "255 255 255", "17", "217" );
        make_prop( "dynamic", "_ladder_scissormini_pipeB", "models/props_mill/pipeset08d_64_001a.mdl", "12070 7541 351", "90 180 0", "shadow_no" );
        make_prop( "dynamic", "_ladder_scissormini_pipeT", "models/props_mill/pipeset08d_64_001a.mdl", "12070 7541 405", "90 180 0", "shadow_no" );
        make_prop( "dynamic", "_permstuck_dumpsterspool", "models/props_industrial/wire_spool_02.mdl", "10419 6513 45", "40 65 0", "shadow_no" );
        make_prop( "dynamic", "_propladder_gasstation", "models/props_rooftop/acvent02.mdl", "12766 6626 320", "0 180 0" );
        make_prop( "dynamic", "_waterworks_wrongwaya", "models/props_misc/wrongway_sign01_optimized.mdl", "13004 6822 855", "0 180 0", "shadow_no", "solid_no", "255 255 255", "17", "217" );
        make_prop( "dynamic", "_waterworks_wrongwayb", "models/props_misc/wrongway_sign01_optimized.mdl", "13004 7122 855", "0 180 0", "shadow_no", "solid_no", "255 255 255", "17", "217" );
        make_prop( "dynamic", "_waterworks_wrongwayc", "models/props_misc/wrongway_sign01_optimized.mdl", "13004 7422 855", "0 180 0", "shadow_no", "solid_no", "255 255 255", "17", "217" );
        make_prop( "dynamic", "_waterworks_wrongwayd", "models/props_misc/wrongway_sign01_optimized.mdl", "13004 7722 855", "0 180 0", "shadow_no", "solid_no", "255 255 255", "17", "217" );
        make_prop( "dynamic", "_waterworks_wrongwaye", "models/props_misc/wrongway_sign01_optimized.mdl", "12914 7765 855", "0 -90 0", "shadow_no", "solid_no", "255 255 255", "17", "217" );

        con_comment( "VIS:\tInfected ladder \"_scissormini\" parented to its pipe to force render." );

        make_ladder( "_ladder_scissormini_cloned_sewerdropB", "14128 8198 -476", "26197 15730 852.2", "0 -180 0", "0 -1 0" );
        EntFire( g_UpdateName + "_ladder_scissormini_cloned_sewerdropB", "SetParent", g_UpdateName + "_ladder_scissormini_pipeT" );

        con_comment( "LOGIC:\tGas Station explosion will spawn a new Infected ladder." );

        EntFire( "gas_explosion_sound_relay", "AddOutput", "OnTrigger worldspawn:CallScriptFunction:c8m3_DynamicLadder:2:-1" );
    }
}