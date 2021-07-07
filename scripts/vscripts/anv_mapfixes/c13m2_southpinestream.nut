g_Chapter = "COLD STREAM - SOUTH PINE STREAM";

devchap( "ALL MODES" );

// FIXES_ALL

make_clip(	"_idkground",			"Everyone",	1,	"-32 -32 0",		"32 32 16",		"5345 1744 290" );
make_clip(	"_dispcrouch_upandaway",	"Everyone",	1,	"-120 -16 -64",		"64 16 128",		"5924 1261 485" );
make_clip(	"_permstuck_chopperrocks",	"Everyone",	1,	"-32 -34 0",		"32 34 17",		"2150 1224 195" );
make_clip(	"_permstuck_longhedge_a",	"Everyone",	1,	"-256 -32 -128",	"32 32 128",		"2003 2644 480" );
make_clip(	"_permstuck_longhedge_b",	"Everyone",	1,	"-32 -128 -128",	"100 64 128",		"1226 3072 420" );
make_clip(	"_permstuck_longhedge_c",	"Everyone",	1,	"-32 -32 -32",		"32 32 32",		"1100 3444 506" );
make_clip(	"_permstuck_longhedge_d",	"Everyone",	1,	"-32 -32 -32",		"32 32 32",		"1072 3879 464" );
make_clip(	"_permstuck_longhedge_e",	"Everyone",	1,	"-32 -555 -17",		"88 555 128",		"1100 4480 324" );
make_clip(	"_permstuck_tree_a",		"Everyone",	1,	"-17 -17 0",		"17 17 8",		"6747 2745 762" );
make_clip(	"_permstuck_tree_b",		"Everyone",	1,	"-17 -17 0",		"17 17 8",		"1573 1991 441" );
make_clip(	"_permstuck_tree_c",		"Everyone",	1,	"-17 -17 0",		"17 17 8",		"147 3367 301" );
make_clip(	"_permstuck_tree_d",		"Everyone",	1,	"-17 -17 0",		"17 17 8",		"392 4679 277" );
make_clip(	"_permstuck_tree_e",		"Everyone",	1,	"-17 -17 0",		"17 17 8",		"-1459 4319 330" );
make_clip(	"_permstuck_tree_f",		"Everyone",	1,	"-17 -17 0",		"17 17 8",		"723 6019 375" );
make_clip(	"_surfsup",			"Survivors",	1,	"-490 -420 0",		"420 420 2160",		"-1485 5630 404" );
make_clip(	"_dispcrouch_barrelstent",	"Everyone",	1,	"-17 -99 0",		"34 99 128",		"979 5656 272" );
make_clip( "_permstuck_tree_g", "Everyone", 1, "-17 -17 -32", "17 17 0", "908 6871 697" );
make_clip( "_permstuck_tree_h", "Everyone", 1, "-17 -17 -32", "17 17 0", "984 6655 798" );
make_clip( "_permstuck_tree_i", "Everyone", 1, "-17 -17 -32", "17 17 0", "1151 6258 932" );
make_clip( "_permstuck_tree_j", "Everyone", 1, "-17 -17 -32", "17 17 0", "1153 5929 981" );
make_clip( "_stuckwarp_yellowbarrels", "Everyone", 1, "-108 -16 0", "59 13 128", "4861 2732 608", "0 -17 0" );
make_clip( "_permstuck_taito_ftw", "Everyone", 1, "-8 -8 -8", "28 24 28", "2552 2292 460" );
patch_spawninfront( "78 8574 -405", "-70 -8 0", "70 8 256" );

if ( g_BaseMode == "versus" )
{
	devchap( "BASE VERSUS" );

	// FIXES

    make_clip( "_shortcut_easybigskip1", "Survivors", 1, "-8 -56 0", "8 56 2442", "506 4983 253", "0 46 0" );
    make_clip( "_shortcut_easybigskip2", "Survivors", 1, "-64 -66 0", "8 260 2442", "503 4713 253", "0 -10 0" );
    make_clip( "_shortcut_easybigskip3", "Survivors", 1, "-64 -316 0", "8 96 2442", "483 4553 253", "0 -4 0" );

}

if ( HasPlayerControlledZombies() )
{
    make_brush( "_losfix_gastruck1",	"-45 -1 -18",	"45 1 18",	"4992 2301 617" );
    make_brush( "_losfix_gastruck2",	"-1 -40 -18",	"1 40 18",	"4082 2256 524" );
    make_ladder( "_ladder_eventphysfence_cloned_endfencefront", "-1401.11 5244.2798 344", "1045 469 9" );
    make_ladder( "_ladder_posttanksecret_cloned_cliffstraightwide", "6914.6465 2713.7744 601", "14585 5833 1212", "10 -176.74 0", "-0.69 0.72 0" );
    make_ladder( "_ladder_pretankleft_cloned_cliffstraightwide", "6914.6465 2713.7744 601", "15420 1150 17", "0 141.65 0", "0 1 0" );
    make_ladder( "_ladder_pretankright_cloned_cliffstraightwide", "6914.6465 2713.7744 601", "5680 -3340 1200", "10 52.84 0", "1 0.1 0" );
}