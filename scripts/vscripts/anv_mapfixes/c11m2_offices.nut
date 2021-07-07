g_Chapter = "DEAD AIR - THE CRANE";

devchap( "ALL MODES" );

// FIXES_ALL

make_clip(	"_fallrevive_nopejumpa",	"Survivors",	1,	"-383 -8 0",		"2490 8 1400",		"6142 2312 9" );
make_clip(	"_fallrevive_nopejumpb",	"Survivors",	1,	"-8 -512 0",		"8 512 1400",		"8648 2672 16" );
make_clip(	"_permstuck_officechairs",	"Everyone",	1,	"-11 -11 -11",		"11 11 11",		"8865 4003 252" );
make_clip(	"_nav_craneledge",		"Survivors",	1,	"-17 0 -1",		"29 4 77",		"6117 3856 646" );
make_trighurt( "_instakill_semitrailer", "Survivor", "-269 -117 0", "273 121 8", "6854 2779 173" );

make_prop( "dynamic", "_omg_valve_wrongwayc", "models/props_vehicles/van.mdl", "8815 2888 10", "0 45 3", "shadow_no" );
make_prop( "dynamic", "_omg_valve_wrongwayg", "models/props_vehicles/van_glass.mdl", "8815 2888 10", "0 45 3", "shadow_no" );

if ( g_BaseMode == "versus" )
{
	devchap( "BASE VERSUS" );

	// FIXES

    // Piggyback on Survivor-filtered trigger that ready-ups end car alarm.

    con_comment( "LOGIC:\tAnti-shortcut trighurts will be deleted when a Survivor exits final office stairwell." );

    make_trighurt( "_finalstreet_trighurta", "Survivor", "-879 -112 0", "603 48 17", "9071 3888 196" );
    make_trighurt( "_finalstreet_trighurtb", "Survivor", "-1753 -823 0", "59 935 32", "8261 4759 196" );
    make_trighurt( "_finalstreet_trighurtc", "Survivor", "-781 -361 0", "359 599 32", "9101 4969 196" );
    DoEntFire( "!self", "AddOutput", "OnTrigger anv_mapfixes_finalstreet_trighurt*:Kill::0:-1", 0.0, null, Entities.FindByClassnameNearest( "trigger_once", Vector( 8616, 4320, 140 ), 1 ) );

}
if ( g_BaseMode == "survival" )
{
	devchap( "BASE SURVIVAL" );

	// FIXES

    make_clip( "_survival_electricgod", "Survivors", 1, "-40 -28 0", "79 43 273", "8328 3196 783" );

}

if ( HasPlayerControlledZombies() )
{
    kill_funcinfclip( 677.928 );	// Delete clip above roof on far-right corner of end area
    kill_funcinfclip( 827.238 );
    make_brush( "_losfix_copcar",		"-1 -70 -8",	"1 70 8",	"9613 4999 16" );
    make_brush( "_losfix_crane1",		"-21 -102 -41",	"21 102 41",	"5692 3913 784" );
    make_brush( "_losfix_crane2",		"-110 -87 -2",	"110 87 2",	"5823 3913 746" );
    make_brush( "_losfix_crane3",		"-34 -87 -2",	"34 87 2",	"6032 3914 746" );
    make_brush( "_losfix_crane4",		"-100 -2 -13",	"100 2 13",	"5886 3828 756" );
    make_brush( "_losfix_crane5",		"-1 -20 -20",	"1 20 20",	"5810 3914 1213" );
    make_brush( "_losfix_crane6",		"-12 -20 -1",	"12 20 1",	"5820 3914 1194" );
    make_brush( "_losfix_semi",		"-52 -1 -18",	"52 1 18",	"7412 5366 27" );
    make_brush( "_losfix_van",		"-1 -80 -8",	"1 80 8",	"8754 5174.01 16" );
    make_clip( "_meticulous_funcinfclip01", "SI Players", 1, "-309 -64 0", "331 64 862", "6197 4672 1056" );
    make_clip( "_meticulous_funcinfclip02", "SI Players", 1, "-8 -470 0", "8 470 668", "9668 6033 536", "0 8 0" );
    make_clip( "_meticulous_funcinfclip03", "SI Players", 1, "-360 -360 0", "568 360 352", "8904 3512 1056" );
    make_ladder( "_ladder_endchaingate_cloned_endtallstraight", "7156 4653 92", "16110 10158 0", "0 -180 0", "0 -1 0" );
    make_ladder( "_ladder_endcornerleft_cloned_farendmiddle", "6641.3789 5199.9937 68", "2837 117 0" );
    make_ladder( "_ladder_endcornerright_cloned_farendmiddle", "6641.3789 5199.9937 68", "2837 -222 0" );
    make_ladder( "_ladder_endcornertop_cloned_undercranedump", "6580 3987.5 342", "3020 1568 -132" );
    make_ladder( "_ladder_officefoyerB_cloned_firebarrelfence", "5199 3376 92", "3109.9 332 548.35" );
    make_ladder( "_ladder_officefoyerT_cloned_undercranepipe", "6158 3857.01 268", "12159 -2450 1009", "0 90 -7", "-1 0 0" );
    make_ladder( "_ladder_poleconnection_cloned_semiexploit", "6780 3067 268", "85 549 513" );
    make_prop( "dynamic", "_officefoyer_wrongwaya", "models/props_misc/wrongway_sign01_optimized.mdl", "8544 3284 1122", "0 180 0", "shadow_no", "solid_no", "255 255 255", "17", "217" );
    make_prop( "dynamic", "_officefoyer_wrongwayb", "models/props_misc/wrongway_sign01_optimized.mdl", "8544 3761 1122", "0 180 0", "shadow_no", "solid_no", "255 255 255", "17", "217" );
    make_prop( "dynamic", "_solidify_officefoyer_pole", "models/props_trainstation/pole_384connection001a.mdl", "8511.9 3565.75 1248.34", "0 90 0", "shadow_no" );
    patch_ladder( "8596 5497.5 92.3941", "0 4 0" );
    patch_ladder( "8260 5497.5 92.3941", "0 4 0" );
}