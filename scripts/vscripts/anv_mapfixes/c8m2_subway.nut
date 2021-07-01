g_Chapter = "NO MERCY - SUBWAY";

devchap( "ALL MODES" );

// FIXES_ALL

make_clip(	"_permstuck_piperoom",		"Everyone",	1,	"-88 -2 -17",		"88 2 10",		"7474 2355 -216" );
make_clip(	"_tankwarp_pillar",		"Everyone",	1,	"-17 0 -2",		"10 12 88",		"7565 4164 -95" );
make_clip(	"_busstop_fence",		"Survivors",	1,	"-512 -76 -620",	"512 76 620",		"8600 5556 788" );
make_clip(	"_dispcrouch_cavea",		"Everyone",	1,	"-42 -120 -80",		"0 145 80",		"4354 3430 -174.7" );
make_clip(	"_dispcrouch_caveb",		"Everyone",	1,	"-120 -42 -80",		"470 0 80",		"4497 3316 -174.7" );
make_clip(	"_booster_windowandfence",	"Survivors",	1,	"0 -64 0",		"128 50 1068",		"8416 3888 344" );
make_clip(	"_booster_pipe",		"Survivors",	1,	"-64 -32 0",		"64 32 90",		"7351 3792 144" );
make_clip(	"_booster_beama",		"Survivors",	1,	"-9 -474 -24",		"9 686 192",		"7176 3138 424" );
make_clip(	"_booster_beamb",		"Survivors",	1,	"-9 -474 -24",		"9 686 192",		"7380 3138 424" );
make_clip(	"_booster_beamc",		"Survivors",	1,	"-17 -474 -24",		"9 686 192",		"7568 3138 424" );
make_clip(	"_booster_beamd",		"Survivors",	1,	"-17 -474 -24",		"10 686 192",		"7754 3138 424" );
make_clip(	"_booster_beame",		"Survivors",	1,	"-9 -474 -24",		"10 686 192",		"7943 3138 424" );
make_clip(	"_booster_boxrow",		"Survivors",	1,	"-370 -4 0",		"290 4 216",		"7827 3816 381" );
make_clip( "_stuckwarp_underspawn", "Everyone", 1, "-11 -7 0", "-3 10 70", "3111 2775 -70" );
make_clip( "_stuckwarp_tunnelend", "Everyone", 1, "-12 -24 -14", "137 73 70", "4182 2831 -70", "0 -1 0" );
make_clip( "_tankwarp_solidify", "SI Players and AI", 1, "-26 -30 0", "98 6 100", "5977 4742 -335", "0 -22 0" );
make_clip( "_unattackable_building", "Survivors", 1, "-126 -320 -32", "157 348 512", "9311 4256 704" );
make_clip( "_unattackable_backalley1", "Survivors", 1, "-252 -311 0", "260 337 772", "6780 4279 632" );
make_clip( "_unattackable_backalley2", "Survivors", 1, "-1191 -320 0", "1153 320 752", "8319 3520 660" );
make_clip( "_unattackable_backalley3", "Survivors", 1, "-58 -7 0", "70 7 1402", "10298 3765 16" );
make_clip( "_unattackable_backalley4", "Survivors", 1, "-359 -381 0", "393 387 722", "10871 4221 688" );
make_clip( "_unattackable_pawnshop1", "Survivors", 1, "-8 -298 0", "8 434 1402", "11272 5336 16" );
make_clip( "_unattackable_pawnshop2", "Survivors", 1, "-1024 -16 -105", "1152 16 912", "10112 5744 512" );
make_clip( "_clipextend_ledgehang", "Survivors", 1, "-306 -80 0", "334 80 992", "9394 5648 416" );
make_clip( "_unattackable_tanker1", "Survivors", 1, "-38 -461 0", "48 532 892", "6750 5141 512", "0 -26 0" );
make_clip( "_unattackable_tanker2", "Survivors", 1, "-698 -12 -32", "428 12 872", "7700 5622 536" );
make_clip( "_ladderqol_orangebags", "SI Players and AI", 1, "-29 -23 27", "24 32 32", "10660 5215 16", "-45 0 0" );
make_clip( "_genroomrail_smoother1", "Everyone", 1, "-1 -33 0", "0 34 40", "7285 3633 248" );
make_clip( "_genroomrail_smoother2", "Everyone", 1, "-1 -65 0", "0 66 40", "7285 2878 248" );
make_clip( "_nav_tankjukepipes", "Survivors", 1, "-37 -168 0", "28 168 95", "8276 3656 140" );

con_comment( "FIX:\tGenerator Room has 13 hanging lights and 9 need to be made non-solid." );

unsolidify_model( "models/props/de_nuke/IndustrialLight01.mdl" );

if ( g_BaseMode == "coop" || g_BaseMode == "realism" )
{
	devchap( "BASE COOP" );

	// FIXES

}
if ( g_BaseMode == "versus" )
{
	devchap( "BASE VERSUS" );

	// FIXES

    make_clip( "_nav_backlightleft", "Survivors", 1, "6 -13 -61", "9 15 84", "5249 4124 -265" );
    make_clip( "_nav_backlightright", "Survivors", 1, "6 -13 -61", "9 15 84", "5243 4210 -265" );

    make_clip( "_subwaymount_in", "Survivors", 1, "-49 -248 0", "63 247 58", "6337 3137 -154", "0 41 0" );
    make_clip( "_subwaymount_out", "Survivors", 1, "-49 -248 0", "63 247 58", "6769 2895 -154", "0 79 0" );

}
if ( g_BaseMode == "survival" )
{
	devchap( "BASE SURVIVAL" );

	// FIXES

    make_clip(	"_survival_vendors",		"Survivors",	1,	"-80 -32 0",		"80 55 284",		"7406 3769 381.4" );

}
if ( g_BaseMode == "scavenge" )
{
	devchap( "BASE SCAVENGE" );

	// FIXES

}