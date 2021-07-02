g_Chapter = "THE PASSING - PORT";

devchap( "ALL MODES" );

// FIXES_ALL

make_clip(	"_solidify_girder",		"Survivors",	1,	"-17 -80 -170",		"2 240 240",		"200 -1280 145" );
make_clip(	"_booster_bridgea",		"Survivors",	1,	"-234 -550 -17",	"255 0 0",		"0 -638 216" );
make_clip(	"_booster_bridgeb",		"Survivors",	1,	"-234 -17 -17",		"210 0 1017",		"0 -1200 216" );
make_clip( "_booster_tent", "Survivors", 1, "-61 -66 -30", "69 64 730", "1196 -847 294" );
make_clip( "_booster_streetlamp", "Survivors", 1, "-9 -11 0", "9 9 715", "1493 -368 308" );
make_clip( "_booster_generator_side", "Survivors", 1, "-10 -28 0", "6 29 930", "1848 928 98", "0 75 0" );
make_clip( "_booster_generator_main", "Survivors", 1, "-45 -32 -80", "29 45 702", "-484 -580 326" );
make_clip( "_booster_signalboxes", "Survivors", 1, "-118 -21 0", "98 19 920", "-570 -859 104" );
make_clip( "_booster_trimandbox", "Survivors", 1, "-518 -31 0", "11 80 551", "-859 1591 473" );
make_clip( "_booster_fencefinish", "Survivors", 1, "-13 -249 0", "11 247 887", "-243 -631 137" );
make_clip( "_booster_telepole1", "Survivors", 1, "-17 -66 -79", "25 66 387", "-232 1481 640" );
make_clip( "_booster_telepole2", "Survivors", 1, "-8 -67 -79", "11 66 387", "252 1092 640", "0 -44 0" );
make_clip( "_booster_telepole3", "Survivors", 1, "-17 -66 -79", "25 66 387", "-1423 1481 640" );
make_clip( "_booster_telepole4", "Survivors", 1, "-11 -67 -79", "10 65 387", "-2461 1234 640" );
make_clip( "_booster_telepole5", "Survivors", 1, "-17 -66 -79", "25 66 540", "258 153 480", "0 -45 0" );
make_clip( "_booster_telepole6", "Survivors", 1, "-17 -66 -79", "25 66 540", "-625 87 480" );
make_clip( "_booster_telepole7", "Survivors", 1, "-13 -68 -79", "11 63 680", "1562 170 345", "0 5 0" );
make_clip( "_booster_badcorner", "Survivors", 1, "-219 -142 -35", "133 50 695", "-2342 -258 329" );
make_clip( "_booster_acunit", "Survivors", 1, "-30 -93 0", "31 28 600", "-1568 -639 424" );
make_clip( "_booster_electricalbox", "Survivors", 1, "-5 -29 0", "6 20 923", "-251 -932 101" );
make_clip( "_booster_elecwiresa", "Survivors", 1, "-15 -102 0", "62 12 724", "-1537 -256 300" );
make_clip( "_booster_elecwiresb", "Survivors", 1, "-15 -33 0", "62 14 846", "255 -255 178" );
make_clip( "_booster_elecwiresc", "Survivors", 1, "-22 -13 0", "18 4 668", "262 -772 356" );
make_clip( "_booster_elecwiresd", "Survivors", 1, "-425 -310 0", "24 11 632", "-234 1078 392" );
make_clip( "_booster_for_lease", "Survivors", 1, "-20 -20 0", "19 13 640", "-1917 1555 384" );
make_clip( "_booster_genroom_shelf", "Survivors", 1, "-30 -79 0", "34 81 79", "-738 -801 233" );
make_clip( "_booster_light_dual", "Survivors", 1, "-106 -20 0", "104 36 699", "-2208 1532 325" );
make_clip( "_booster_lighta", "Survivors", 1, "-10 -16 0", "10 17 229", "-1540 23 187" );
make_clip( "_booster_lightb", "Survivors", 1, "-17 -10 0", "16 10 838", "-647 -568 186" );
make_clip( "_booster_lightc", "Survivors", 1, "-11 -22 0", "11 35 855", "593 -234 169" );
make_clip( "_booster_itwasatriumph", "Survivors", 1, "-13 -19 0", "13 19 95", "899 -426 53" );
make_clip( "_bridge_curbsmoother1", "Everyone", 1, "-128 -267 0", "-127 182 8", "-1 -1014 -8" );
make_clip( "_bridge_curbsmoother2", "Everyone", 1, "127 -267 0", "128 182 8", "1 -1014 -8" );
make_brush( "_losblock_plywoodc6only", "-1 -81 0", "1 66 72", "193 -1124 16" );
//make_clip( "_cliprework_newsandelec1", "Everyone", 1, "-9 -98 0", "11 98 176", "245 -509 0" );
//make_clip( "_cliprework_newsandelec2", "Everyone", 1, "-17 0 0", "17 5 132", "241 -404 44", "0 27 0" );
//make_clip( "_cliprework_newsandelec3", "Everyone", 1, "-5 -48 0", "0 48 132", "229 -456 44" );
//make_clip( "_cliprework_newsandelec4", "Everyone", 1, "-17 0 0", "17 5 132", "239 -512 44", "0 -26 0" );
make_clip( "_booster_windows", "Survivors", 1, "-8 -400 0", "8 400 96", "-1032 568 352" );
make_clip( "_window_smoother_c6only", "SI Players", 1, "-9 -400 0", "3 400 8", "-1023 568 352", "30 0 0" );
make_clip( "_booster_coolingtanks", "Survivors", 1, "-117 -56 -120", "117 56 80", "-1473 958 402" );

con_comment( "FIX:\tTotal of 2 out of 2 traffic cones need to be made non-solid -- c7m3 already OK." );

unsolidify_model( "models/props_fortifications/orange_cone001_reference.mdl" );