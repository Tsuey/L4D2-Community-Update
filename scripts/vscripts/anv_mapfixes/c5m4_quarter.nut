g_Chapter = "THE PARISH - QUARTER";

devchap( "ALL MODES" );

// FIXES_ALL

make_clip(	"_vuln_balconya",		"Survivors",	1,	"-41 -64 -171.5",	"41 64 171.5",		"-3542 4573 395" );
make_clip(	"_vuln_balconyb",		"Survivors",	1,	"-243 -50 -161",	"243 50 161",		"-3360 4688 384" );
make_clip(	"_vuln_balconyd",		"Survivors",	1,	"-131 -33 -232",	"131 33 232",		"-2814 2912 615" );
make_clip(	"_vuln_balconye",		"Survivors",	1,	"-132.5 -33.5 -169.5",	"132.5 33.5 169.5",	"-2401 2912 553" );
make_clip(	"_vuln_balconyf",		"Survivors",	1,	"-261 -50 -409",	"261 50 409",		"-1839 2896 632" );
make_clip(	"_vuln_balconyc",		"Survivors",	1,	"-257.5 -34.5 -279.5",	"257.5 34.5 279.5",	"-3326 2531 535" );
make_clip(	"_commonhop_bench",		"Survivors",	1,	"-1020 -17 -310",	"250 17 610",		"-2684 2447 545" );
make_clip(	"_clip_anomaly",		"SI Players",	1,	"-36 -86 -44.5",	"36 86 44.5",		"-1918 661 503" );
make_clip(	"_clipgap_fence",		"Survivors",	1,	"-56 -2 -270",		"56 2 888",		"-2216 3200 309" );
make_clip(	"_booster_float",		"Survivors",	1,	"-430 -320 0",		"999 280 777",		"-986.4 -395 385" );
make_clip(	"_clipextend_afterfloata",	"Survivors",	1,	"-120 -354 -36",	"160 350 845",		"-2592 665 312.5" );
make_clip(	"_clipextend_garage",		"Survivors",	1,	"-320 -8 0",		"320 8 732",		"-1264 2992 420" );
make_clip(	"_clipextend_1ststreet",	"Survivors",	1,	"-8 -296 0",		"272 42 600",		"-368 2887 576" );
make_clip(	"_commonhop_electricalbox",	"Survivors",	1,	"-8 -64 0",		"8 64 752",		"-80 1535 400" );
make_clip(	"_clipextend_afterfloatb",	"Survivors",	1,	"-4 -94 0",		"4 94 128",		"-2700 222 432" );
make_clip(	"_clipextend_2ndstreeta",	"Survivors",	1,	"-8 -246 0",		"95 216 768",		"-2848 -840 384" );
make_clip(	"_vuln_balconyg",		"Survivors",	1,	"-525 -48 0",		"525 54 737",		"-2440 -1040 416" );
make_clip(	"_clipextend_2ndstreetb",	"Survivors",	1,	"-50 -216 -32",		"36 216 737",		"-519 -870 420" );
make_clip(	"_clipextend_finalarea",	"Survivors",	1,	"-380 -47 0",		"380 47 737",		"81 -1075 416" );
make_clip(	"_clipextend_endfences",	"Survivors",	1,	"-12 -666 0",		"12 666 717",		"1700 -2016 430" );
make_clip(	"_clipgaps_finalrun",		"Survivors",	1,	"-1580 -16 -38",	"450 55 96",		"364 -2743 416" );
make_clip( "_clipgaps_defibtrick", "Survivors", 1, "-239 -30 0", "209 26 772", "-977 -2658 380" );
make_clip( "_commonhop_fountain", "Survivors", 1, "-44 -44 0", "44 44 144", "-3360 4288 234" );
make_clip( "_cliprework_rollupdoor", "Survivors", 1, "-8 -183 0", "8 169 777", "-1670 1687 324" );
make_clip( "_cliprework_unattackable", "Survivors", 1, "-28 -245 0", "28 235 704", "-3828 2709 448" );
make_clip( "_void_cliprework", "Survivors", 1, "-288 -223 0", "288 401 697", "-224 -1425 456" );
make_clip( "_void_filler", "SI Players", 1, "-64 17 -90", "65 301 -3", "-224 -1425 677" );

con_comment( "FIX:\tTotal of 13 out of 13 traffic cones need to be made non-solid -- finally we can!" );

unsolidify_model( "models/props_fortifications/orange_cone001_reference.mdl" );

if ( g_BaseMode == "versus" )
{
	devchap( "BASE VERSUS" );

	// FIXES

    make_clip(	"_commonhop_signalbox",		"Survivors",	1,	"-19 -44 -527",		"19 64 527",		"-1645 1946 591" );
    make_clip(	"_commonhop_rollupdoor",	"Survivors",	1,	"-13 -65 -376",		"13 65 528",		"-1652 1745 573" );
    make_clip(	"_commonhop_fountain",		"Survivors",	1,	"-71 -222 0",		"71 700 777",		"-2881 3746 399" );
    make_clip( "_clipgap_leftfence", "Survivors", 1, "-32 -4 0", "32 4 208", "-2976 3452 184" );

    // Piggyback on Survivor-filtered trigger that queries Director for car alarm.

    con_comment( "LOGIC:\tTMP shortcut fence clip will be deleted when a Survivor exits final building." );

    make_clip( "_shortcut_fence_TMP", "Survivors", 1, "-84 -12 0", "86 9 149", "-1836 -1212 208" );
    DoEntFire( "!self", "AddOutput", "OnTrigger anv_mapfixes_shortcut_fence_TMP:Kill::0:-1", 0.0, null, Entities.FindByClassnameNearest( "trigger_once", Vector( -1540, -1604, 314 ), 1 ) );

}

if ( HasPlayerControlledZombies() )
{
    make_brush( "_losfix_bus1",		"-1 -75 -12",	"1 75 12",	"-87 2569 76" );
    make_brush( "_losfix_bus2",		"-1 -76 -12",	"1 75 12",	"-228 2780 74" );
    make_brush( "_losfix_bus3",		"-54 -1 -12",	"54 1 12",	"-176 2703 74" );
    make_brush( "_losfix_memefence", "-80 0 0", "80 1 96", "-2512 2443 64" );
    make_brush( "_losfix_van",		"-1 -85 -10",	"1 85 10",	"-2513 2807 72" );
    make_clip( "_ladder_busjazzclub_balconystep", "SI Players", 1, "-316 2 0", "326 5 6", "-324 2590 218" );
    make_clip( "_ladder_billiards_clip", "Survivors", 1, "-160 0 -252", "24 1 60", "-848 1999.1 316" );
    make_clip( "_ladder_billiardsqol_clip", "Everyone", 1, "0 0 -154", "4 18 0", "-832 1999.1 218" );
    make_clip( "_ladder_endtriplewindow_clip", "SI Players", 1, "-4 -96 0", "4 96 2", "-2 -2304 298" );
    make_clip( "_ladder_fountainvinesB_clip", "Everyone", 1, "-8 -126 0", "0 130 179", "-3200 4158 64" );
    make_clip( "_ladder_garagerooftops_clipbot", "SI Players", 1, "-23 -19 0", "19 2 16", "-1346 2958 64" );
    make_clip( "_ladder_garagerooftops_cliptop", "SI Players", 1, "-47 -19 0", "66 2 44", "-1346 2974 64" );
    make_ladder( "_ladder_balconygutter_cloned_eventacvent", "-1414 1288 592", "830 -984 -96" );
    make_ladder( "_ladder_billiards_cloned_billiardsdrop", "-1392 2489 240", "545 -493.9 -120" );
    make_ladder( "_ladder_busjazzclub_cloned_startwhitefence", "-3296 3698 134", "-1427 -2032 -3", "0 -54.6 0", "-0.82 -0.58 0" );
    make_ladder( "_ladder_endsemifront_cloned_endsemiback", "1122.36 -2274.4004 146.7381", "2144 -4483 0", "0 180 0", "-0.96 0.28 0" );
    make_ladder( "_ladder_endtriplewindow_cloned_firstgutterladder", "-3706 4400 170", "3706 -6704 22" );
    make_ladder( "_ladder_floatfarcorner_cloned_floatreartall", "-1722 -288 248", "-62 1265 -16" );
    make_ladder( "_ladder_floatfronttall_cloned_floatreartall", "-1722 -288 248", "0 400 0" );
    make_ladder( "_ladder_fountainvinesB_cloned_firstgutterladder", "-3706 4400 170", "-6911 8598 -29", "0 -180 0", "-1 0 0" );
    make_ladder( "_ladder_fountainvinesT_cloned_startrightpicket", "-3424 3458 126", "387 7583 224", "0 90 0", "-1 0 0" );
    make_ladder( "_ladder_garagerooftops_cloned_startwhitefence", "-3296 3698 134", "1950 -707 16" );
    make_ladder( "_ladder_laststreetextend_cloned_floatpointyfence", "-1600 -382 124", "212 -264 352" );
    make_ladder( "_ladder_poolhallinleft_cloned_poolhalloutright", "-384 1598 144", "-769 3218 9", "0 180 0", "0 1 0" );
    make_ladder( "_ladder_poolhallinright_cloned_poolhalloutleft", "-640 1598 144", "-1281 3218 9", "0 180 0", "0 1 0" );
    make_ladder( "_ladder_postfloatlowroof_cloned_eventscaffoldright", "-1152 454 170", "-1472 569 244" );
    make_ladder( "_ladder_prefloatalley_cloned_unusedwrongway", "-26 1728 234", "-1852 1566 -4", "0 -90 0", "0 -1 0" );
    make_ladder( "_ladder_unusedareain_cloned_onewayvanfence", "-2512 2434 144", "270 765 0" );
}