g_Chapter = "DEATH TOLL - THE DRAINS";

devchap( "ALL MODES" );

// FIXES_ALL

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