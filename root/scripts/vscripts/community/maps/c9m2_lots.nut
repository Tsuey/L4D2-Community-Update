g_Chapter = "CRASH COURSE - THE TRUCK DEPOT FINALE";

devchap( "ALL MODES" );

function DoRoundFixes()
{
    make_clip(	"_commonhop_windowsa",		"Survivors",	1,	"-2 -128 -44",		"2 128 44",		"6850 7040 268" );
    make_clip(	"_commonhop_windowsb",		"Survivors",	1,	"-96 -2 -44",		"96 2 44",		"7328 6850 268" );
    make_clip(	"_permstuck_treea",		"Everyone",	1,	"-17 -17 0",		"17 17 128",		"973 -1632 -231" );
    make_clip(	"_permstuck_treeb",		"Everyone",	1,	"-17 -17 0",		"17 17 128",		"5050.6 2458.2 -106.6" );
    make_clip(	"_permstuck_treec",		"Everyone",	1,	"-17 -17 0",		"17 17 128",		"3516 616 -198.6" );
    make_clip(	"_permstuck_treed",		"Everyone",	1,	"-17 -17 0",		"17 17 128",		"3845 1192 -141" );
    make_clip(	"_permstuck_treee",		"Everyone",	1,	"-17 -17 0",		"17 17 128",		"2257 2997 -70.4" );
    make_clip(	"_permstuck_treef",		"Everyone",	1,	"-17 -17 0",		"17 17 128",		"2054 4320 25.8" );
    make_clip(	"_permstuck_treeg",		"Everyone",	1,	"-17 -17 0",		"17 17 128",		"6724 7421 62.2" );
    make_clip(	"_cliprework_rooftop",		"Survivors",	1,	"-164 -710 0",		"216 600 865",		"4118 886 288" );
    make_clip(	"_cliprework_unattackable",	"Survivors",	1,	"-17 -64 0",		"26 64 8",		"6246 1852 29" );
    make_clip(	"_cliprework_tracka",		"Survivors",	1,	"-216 -64 0",		"216 3000 950",		"5437 -52 206.3" );
    make_clip(	"_cliprework_trackb",		"Survivors",	1,	"-216 -64 0",		"222 3000 777",		"5437.3 5128 385" );
    make_clip(	"_clipgap_fence",		"Survivors",	1,	"-32 -4 0",		"32 4 1111",		"5791 8132 65.8" );
    make_clip(	"_booster_rollupdoors",		"Survivors",	1,	"-777 -460 0",		"11 299 999",		"6541 5853 250" );
    make_clip(	"_booster_rollupdoor",		"Survivors",	1,	"-70 -11 0",		"70 11 888",		"7040 6836 280" );
    make_clip(	"_booster_liftframes",		"Survivors",	1,	"-11 -420 0",		"11 90 128",		"7844 6657 371.3" );
    make_clip(	"_booster_boxtop",		"Survivors",	1,	"-35 -409 0",		"31 35 169",		"8479 5823 304.9" );
    make_clip( "_booster_elecbox", "Survivors", 1, "-4 -20 -80", "4 25 718", "7548 5412 434" );
    make_clip( "_booster_ventpipe", "Survivors", 1, "-13 -14 -80", "17 14 657", "7535 6160 495" );
    make_clip( "_nav_jump_semitrailer", "Survivors", 1, "-4 -94 0", "4 188 288", "5756 1062 -32" );
    make_clip( "_nav_jump_cargowindow", "Survivors", 1, "-5 -85 0", "4 89 86", "2044 3030 49" );
    make_clip( "_booster_armoredtop", "Survivors", 1, "-158 -65 0", "172 59 63", "7838 6366 449" );
    make_clip( "_collisionqol_finalebuses", "All and Physics", 1, "-236 -32 0", "236 32 108", "6675 6470 65" );
    make_trigmove( "_duckqol_finalevent", "Duck", "0 -32 0", "8 32 1", "7568 7392 447" );

    con_comment( "LOGIC:\tFinale switch will re-Lock when all Survivors aren't inside trigger." );

    EntFire( "finale_button_unlocker", "AddOutput", "OnEntireTeamEndTouch finaleswitch_initial:Lock::0:-1" );

    con_comment( "LOGIC:\tPoint-of-no-return clip will be Enabled when finale switch is full." );

    make_clip( "_point_of_no_return", "Survivors", 0, "-16 -169 -168", "58 169 784", "5750 7177 368" );
    EntFire( "finaleswitch_initial", "AddOutput", "OnTimeUp " + g_UpdateName + "_point_of_no_return:Enable::0:-1" );

    if ( HasPlayerControlledZombies() )
    {
        make_brush( "_losfix_gen1a",		"-1 -24 -8",	"1 24 8",	"6853 5881 50" );
        make_brush( "_losfix_gen1b",		"-14 -1 -8",	"15 1 8",	"6837 5885 50" );
        make_brush( "_losfix_gen2a",		"-1 -28 -8",	"1 28 8",	"7498 6786 55" );
        make_brush( "_losfix_gen2b",		"-12 -1 -8",	"13 1 8",	"7484 6779 55" );
        make_brush( "_losfix_semi1a",		"-1 -32 -13",	"1 32 13",	"4519 -91 -206" );
        make_brush( "_losfix_semi1b",		"-40 -1 -13",	"41 1 13",	"4477 -121 -206" );
        make_brush( "_losfix_semi2",		"-1 -50 -15",	"1 50 15",	"3560 4539 10" );
        make_ladder( "_ladder_armybusfront_cloned_finalebus", "6547.86 6579 107.421", "623 -9374 -262", "0 34.7 0", "-0.57 0.82 0" );
        make_ladder( "_ladder_backfenceright_cloned_backfenceleft", "4631 4016 76", "18 579 0" );
        make_ladder( "_ladder_bluecontainerplus_cloned_bluecontainer", "3952 2421 -55.5", "1464 6691 11", "0 -90 0", "-1 0 0" );
        make_ladder( "_ladder_buggycullfix_cloned_bluecontainer", "3952 2421 -55.5", "1810 4245 -124", "0 -144.2 0", "-0.58 0.81 0" );
        make_ladder( "_ladder_containeryardsemi_cloned_metalsupplysemi", "4388 2361 -33.3145", "5405 -1211 2", "0 90 0", "0 -1 0" );
        make_ladder( "_ladder_crashedbus_cloned_finalebus", "6547.86 6579 107.421", "7859 -9216 -265", "0 61.75 0", "-0.9 0.44 0" );
        make_ladder( "_ladder_finaleshelffront_cloned_finaleshelfback", "8724 6143 320", "2369 14507 0", "0 -90 0", "-1 0 0" );
        make_ladder( "_ladder_permstuck_cloned_finalecornerfence", "5920 7375 124", "-130 752 1" );
        make_ladder( "_ladder_startareasemi_cloned_metalsupplysemi", "4388 2361 -33.3145", "-1583 4005 -114", "0 -93.25 0", "0 1 0" );
        make_ladder( "_ladder_startfenceright_cloned_startfenceleft", "1456 -1675 -148", "-370 0 0" );
        make_ladder( "_ladder_startroofbrick_cloned_startroofpipe", "1788.5 -1545 -60", "-697 -3531 -24", "0 90 0", "1 0 0" );
        make_ladder( "_ladder_warehousesemi_cloned_metalsupplysemi", "4388 2361 -33.3145", "-538 7796 115", "0 -70.42 0", "-0.34 0.94 0" );
        make_ladder( "_ladder_whitecontainer_cloned_bluecontainer", "3952 2421 -55.5", "625 7652 24", "0 -96.9 0", "-1 0.1 0" );
        make_prop( "dynamic", "_solidify_startacvent1", "models/props_rooftop/acvent01.mdl", "-99.0076 -574.692 310.902", "18.5 0 0", "shadow_no" );
        make_prop( "dynamic", "_solidify_startacvent2", "models/props_rooftop/acvent01.mdl", "-99.2042 -750.692 310.934", "18.5 0 0", "shadow_no" );

        con_comment( "KILL:\tDeleted 7 func_brush wooden planks and 7 func_brush entry blockers." );

        EntFire( "versus_doorblockers", "Kill" );

        kill_funcinfclip( 149.409 );		// Delete clip in 1st closet
        kill_funcinfclip( 150.29 );		// Delete clip in 2nd closet
        kill_funcinfclip( 142.109 );		// Delete clip in 3rd closet
        kill_funcinfclip( 137.706 );		// Delete clip in 4th closet
        kill_funcinfclip( 149.676 );		// Delete clip in 5th closet
        kill_funcinfclip( 159.458 );		// Delete clip in 6th closet
        EntFire( "worldspawn", "RunScriptCode", "kill_funcinfclip( 159.458 )", 1 );		// Delete clip in 7th closet (same)
    }
}