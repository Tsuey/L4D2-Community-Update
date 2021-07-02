g_Chapter = "THE SACRIFICE - BARGE";

devchap( "ALL MODES" );

// FIXES_ALL

make_clip(	"_cliprework_startbricks",	"Survivors",	1,	"-177 -32 0",		"177 32 959",		"9800 1728 321" );
make_clip(	"_permstuck_flatnosecargo",	"Everyone",	1,	"-64 -32 0",		"64 32 121",		"5793 2568 130" );
make_clip(	"_curvejump_fenceledge",	"Survivors",	1,	"-64 -128 0",		"640 128 800",		"-1984 0 160" );
make_clip( "_stuckwarp_railwayoverpass", "Everyone", 1, "-30 -152 -45", "26 210 58", "2726 2775 374" );
make_clip( "_nav_windowrecess", "Survivors", 1, "-23 -4 0", "23 4 88", "-1944 1412 192" );
make_clip( "_ghostgrief_acunit", "Survivors", 1, "-60 -29 0", "60 33 894", "-10240 383 386" );
make_clip( "_ghostgrief_coalbarge", "Survivors", 1, "-22 -104 0", "3 316 177", "-8700 170 -78", "-15 47 0" );
make_clip( "_ghostgrief_unitfromdeath", "Survivors", 1, "-7 -80 0", "3 80 177", "-7399 -1199 -128", "-15 45 0" );
make_clip( "_booster_littleroof", "Survivors", 1, "-253 -63 0", "259 65 960", "-1795 1471 320" );
make_clip( "_booster_yawningman", "Survivors", 1, "-115 -23 0", "119 23 949", "-1294 1513 331" );
make_clip( "_booster_dualstacks", "Survivors", 1, "-214 -104 0", "201 121 704", "-3080 671 576" );
make_clip( "_booster_cementlips", "Survivors", 1, "-573 -9 0", "578 10 76", "-2882 1688 132" );
make_clip( "_booster_fenceledge", "Survivors", 1, "-345 -139 0", "311 89 1152", "-3767 1835 128" );
make_clip( "_booster_gravelacun", "Survivors", 1, "-33 -60 0", "29 61 947", "-6495 1144 333" );
make_clip( "_booster_solidify_windows", "Survivors", 1, "-152 -270 0", "152 270 168", "11032 606 336" );

if ( g_BaseMode == "scavenge" )
{
	devchap( "BASE SCAVENGE" );

	// FIXES

    make_clip(	"_scavenge_jump_woodbrush",	"Survivors",	1,	"-842 -8 0",		"216 8 988",		"-9100 392 262" );

}