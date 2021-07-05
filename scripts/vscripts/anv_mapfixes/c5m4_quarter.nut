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
make_clip(	"_commonhop_electricalbox",	"Survivors",	1,	"8 -64 0",		"8 64 752",		"-80 1535 400" );
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