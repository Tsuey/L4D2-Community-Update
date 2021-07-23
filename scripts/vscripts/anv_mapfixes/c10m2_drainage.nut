g_Chapter = "DEATH TOLL - THE DRAINS";

devchap( "ALL MODES" );

function DoRoundFixes()
{
    make_clip(	"_commonhop_cisterntunnela",	"Survivors",	1,	"-17 -80 0",		"17 80 164",		"-9477 -7279 -308" );
    make_clip(	"_commonhop_cisterntunnelb",	"Survivors",	1,	"-80 -17 0",		"80 17 164",		"-9872 -6886 -308" );
    make_clip(	"_commonhop_bagstoroof",	"Survivors",	1,	"-420 -1600 -100",	"420 171 920",		"-7118 -6111 351" );
    make_clip(	"_unattackable_pipea",		"Survivors",	1,	"-80 -4 -56",		"80 669 88",		"-7790 -8110 -388" );
    make_clip(	"_unattackable_pipeb",		"Survivors",	1,	"-4 -80 -56",		"669 80 88",		"-8339 -9043 -388" );
    make_clip(	"_unattackable_pipec",		"Survivors",	1,	"-4 -80 -56",		"669 80 88",		"-9144 -9043 -388" );
    make_clip( "_nav_electricalbox", "Survivors", 1, "-6 -30 0", "3 27 172", "-10806 -8537 -347", "0 -45 0" );
    make_clip( "_unattackable_debrisfall", "Survivors", 1, "-119 -137 0", "74 113 12", "-9870 -8168 -180" );
    make_clip( "_cliprework_cisternroof", "Survivors", 1, "-124 -136 12", "132 120 22", "-9860 -7288 -98" );
    make_clip( "_cliprework_endrooftop1", "Survivors", 1, "-270 -550 -151", "270 514 662", "-6448 -6730 620" );
    make_clip( "_cliprework_endrooftop2", "Survivors", 1, "-8 -366 0", "8 318 1026", "-7500 -5634 256" );
    make_clip( "_nav_cistern_anomaly", "Survivors", 1, "-17 -6 0", "11 4 127", "-9859 -7064 -221" );
    make_clip( "_nav_cistern_highpipe1", "Survivors", 1, "-23 -56 0", "23 56 97", "-9935 -6961 -191" );
    make_clip( "_nav_cistern_highpipe2", "Survivors", 1, "-21 -60 0", "29 59 75", "-9812 -6957 -169" );
    make_clip( "_nav_cistern_highpipe3", "Survivors", 1, "-42 -16 0", "39 16 83", "-9533 -7217 -169" );
    make_clip( "_nav_cistern_tunnelexit", "Survivors", 1, "-80 -11 0", "82 13 125", "-9872 -7669 -219" );
    make_clip( "_nav_cistern_angpipe1", "Survivors", 1, "-31 -93 0", "20 128 135", "-9988 -7555 -229", "0 -20 0" );
    make_clip( "_nav_cistern_angpipe2", "Survivors", 1, "-31 -93 0", "20 128 135", "-10155 -7450 -229", "0 -60 0" );
    make_clip( "_nav_cistern_angpipe3", "Survivors", 1, "-31 -93 0", "20 128 135", "-10166 -7137 -229", "0 -110 0" );
    make_clip( "_nav_cistern_angpipe4", "Survivors", 1, "-31 -93 0", "20 128 135", "-9723 -6991 -229", "0 -195 0" );
    make_clip( "_nav_cistern_angpipe5", "Survivors", 1, "-31 -93 0", "20 128 135", "-9727 -7542 -229", "0 -150 0" );
    make_clip( "_ledgehang_endsaferoof", "Survivors", 1, "-279 -66 0", "231 66 93", "-8361 -5553 131" );
    make_clip( "_smoother_pipes1", "Everyone", 1, "-640 -2 -28", "204 2 32", "-8712 -7404 -609", "-19 0 36" );
    make_clip( "_smoother_pipes2", "Everyone", 1, "-640 -2 -28", "204 2 32", "-8712 -7159 -615", "-19 0 -36" );
    make_clip( "_smoother_pipes3", "Everyone", 1, "-207 -2 -28", "243 2 32", "-8307 -7154.5 -541", "0 0 -36" );
    make_clip( "_chargerassist_eventbutton", "Survivors", 1, "-82 -16 0", "82 64 100", "-8706 -7744 -308" );
    make_clip( "_chargerassist_footlocker", "Survivors", 1, "-64 -82 0", "8 82 100", "-8992 -8554 -308" );
    make_clip( "_grating_smoothera", "Everyone", 1, "-326 -450 -2", "0 0 1", "-8642 -7855 -528.613" );
    make_clip( "_grating_smootherb", "Everyone", 1, "-326 -495 -2", "-45 -450 1", "-8642 -7855 -528.613" );

    if ( g_BaseMode == "versus" )
    {
        devchap( "BASE VERSUS" );

        // FIXES

        make_clip( "_shortcut_commonhop", "Survivors", 1, "-25 69 -89", "-22 73 91", "-8050 -8422 -487" );

        make_clip(	"_bunnyhop_endwindow",		"Survivors",	1,	"-606 -7 0",		"100 7 128",		"-7998 -6007 -48" );
        make_clip(	"_commonhop_pipe",		"Survivors",	1,	"-4 -104 -56",		"4 104 56",		"-8044 -7280 -408" );
        make_clip( "_cliprework_commonhop", "Survivors", 1, "-172 -8 -44", "172 8 44", "-6452 -6008 136" );

    }

    if ( HasPlayerControlledZombies() )
    {
        make_brush( "_losfix_bridge_base1",	"-19 -1 -78",	"19 1 78",	"-8693 -8517 -498" );
        make_brush( "_losfix_bridge_base2",	"-53 -1 -35",	"53 1 35",	"-8404 -8517 -541" );
        make_brush( "_losfix_bridge_base3",	"-19 -1 -78",	"19 1 78",	"-8115 -8517 -498" );
        make_brush( "_losfix_bridge_base4",		"-18 -40 -1",	"20 42 1",	"-8693 -8568 -400" );
        make_brush( "_losfix_bridge_base5",		"-18 -40 -1",	"20 42 1",	"-8117 -8568 -400" );
        make_brush( "_losfix_dynamic_bridge1",		"-107 -1 -84",	"107 1 84",	"-8566 -8525 -289" );
        make_brush( "_losfix_dynamic_bridge2",		"-107 -1 -84",	"107 1 84",	"-8243 -8525 -289" );
        make_brush( "_losfix_dynamic_bridge_floor1",	"-134 -43 -1",	"134 43 1",	"-8538 -8566 -196" );
        make_brush( "_losfix_dynamic_bridge_floor2",	"-134 -43 -1",	"134 43 1",	"-8270 -8566 -196" );
        make_brush( "_losfix_van",		"-1 -108 -14",	"1 108 14",	"-7071 -5218 -30" );
        make_clip( "_ladder_quickstairwell_clip", "SI Players", 1, "-8 -1 0", "8 1 28", "-6394 -7264.7 89", "0 -20 0" );
        make_clip( "_ladder_starttriplebig_clip", "Everyone", 1, "-48 -16 -22", "66 16 1", "-11632 -8168 -231" );
        make_ladder( "_ladder_endtrainbox_cloned_endchainlink", "-6592 -5341 5.2833", "-1659 -382 -6" );
        make_ladder( "_ladder_quickstairwell_cloned_wrongturn", "-6592 -5313 14.2833", "218 -1949 -2" );
        make_ladder( "_ladder_starttriplebig_cloned_startcoolingtanks", "-11639 -8492 -350", "84 246 0" );
        make_ladder( "_ladder_warewinright_cloned_wrongturn", "-6592 -5313 14.2833", "0 -687 0" );

        con_comment( "MOVER:\tLOS dynamic fixes parented to move with bridge." );

        EntFire( g_UpdateName + "_losfix_dynamic_bridge1", "SetParent", "platform_01" );
        EntFire( g_UpdateName + "_losfix_dynamic_bridge2", "SetParent", "platform_02" );
        EntFire( g_UpdateName + "_losfix_dynamic_bridge_floor1", "SetParent", "platform_01" );
        EntFire( g_UpdateName + "_losfix_dynamic_bridge_floor2", "SetParent", "platform_02" );

        con_comment( "PROP:\tBarrels at end of sewers moved to reduce stuck-warp obligation." );

        Entities.FindByClassnameNearest( "prop_physics", Vector( -7055, -6681, -205 ), 8 ).SetOrigin( Vector( -7055, -6731, -208 ) );
        Entities.FindByClassnameNearest( "prop_physics", Vector( -7016, -6697, -206 ), 8 ).SetOrigin( Vector( -7016, -6747, -209 ) );
        Entities.FindByClassnameNearest( "prop_physics", Vector( -7000, -6674, -205 ), 8 ).SetOrigin( Vector( -7000, -6724, -208 ) );
    }
}