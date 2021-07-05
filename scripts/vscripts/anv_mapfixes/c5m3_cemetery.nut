g_Chapter = "THE PARISH - CEMETERY";

devchap( "ALL MODES" );

// FIXES_ALL

make_clip(	"_commonhop_rooftop",		"Survivors",	1,	"-24 -4 -28",		"24 4 88",		"3080 1407 222" );
make_clip(	"_sewer_holed",			"Survivors",	1,	"-4 -40 -44",		"4 40 44",		"5212 -112 -116" );
make_clip(	"_sewer_holec",			"Survivors",	1,	"-264 -4 -44",		"264 4 44",		"5968 -452 -116" );
make_clip(	"_sewer_holeb",			"Survivors",	1,	"-4 -376 -44",		"4 376 44",		"6532 224 -116" );
make_clip(	"_sewer_holea",			"Survivors",	1,	"-384 -4 -44",		"384 4 44",		"5848 964 -116" );
make_clip(	"_bunnyhop_underfence",		"Survivors",	1,	"-36 -2 -268",		"36 2 268",		"5948 -2330 688" );
make_clip(	"_commonhop_overpass",		"Survivors",	1,	"-544 -576 -160",	"544 576 365",		"4896 7744 320" );
make_clip(	"_manhole_fencea",		"Survivors",	1,	"-136 -584 -160",	"0 584 320",		"4489 1194 321" );
make_clip(	"_manhole_fenceb",		"Survivors",	1,	"-56 -122.5 -160",	"56 122.5 320",		"4445 504 320",		"0 15 0" );
make_clip(	"_manhole_fencec",		"Survivors",	1,	"-56 -122.5 -160",	"56 122.5 320",		"4437 268 320",		"0 -15 0" );
make_clip(	"_manhole_fenced",		"Survivors",	1,	"-36.5 -151 -160",	"36.5 151 320",		"4399 33 326" );
make_clip(	"_manhole_fencee",		"Survivors",	1,	"-180 -40 -160",	"180 40 320",		"4182 -127 328" );
make_clip(	"_ladderqol_overpass",		"SI Players",	1,	"-18.5 -12 -95",	"18.5 12 95",		"5851 8704 192" );
make_clip(	"_stuckwarp_wrongwaya",		"SI Players",	1,	"-82.5 -201 -111",	"82.5 201 111",		"6275 9035 242" );
make_clip(	"_stuckwarp_wrongwayb",		"SI Players",	1,	"-21.5 -276 -111",	"21.5 276 111",		"6336 8960 242" );
make_clip(	"_permstuck_jetstrike",		"Everyone",	1,	"-46.5 -27.5 -25",	"46.5 27.5 25",		"6233 -2190 453" );
make_clip(	"_permstuck_cemetery",		"Everyone",	1,	"-145 -27 0",		"145 27 1234",		"7453 -6553 95" );
make_clip(	"_commonhop_endfence",		"Survivors",	1,	"-64 -4 -44",		"64 4 580",		"9152 -9004 380" );
make_clip(	"_stuckwarp_staircase",		"Everyone",	1,	"-32 -4 -64",		"64 4 458",		"3504 2668 182" );
make_clip(	"_permstuck_dualfence",		"Survivors",	1,	"-28 -445 0",		"28 445 654",		"3421 733 3.1" );
make_clip( "_cliprework_pinkhouse", "Survivors", 1, "-386 -270 0", "414 274 320", "3434 4094 360" );
make_clip( "_cliprework_perchroof", "Survivors", 1, "-136 -192 0", "136 192 487", "4856 3040 164" );
make_clip( "_nav_brokenhome_highcorner", "Survivors", 1, "-4 -83 0", "16 378 469", "2052 2534 160" );
make_clip( "_nav_opencrypt", "Survivors", 1, "-26 -47 0", "7 49 1000", "9604 -6659 344" );
make_clip( "_nav_cornertree", "Survivors", 1, "-83 -116 0", "97 180 935", "10459 -4981 409" );

if ( g_BaseMode == "versus" )
{
	devchap( "BASE VERSUS" );

	// FIXES

    make_clip( "_shortcut_vanjump", "Survivors", 1, "-41 0 0", "41 5 59", "4425 5257 28", "0 -16 10" );

    make_clip( "_nav_brokenhome_shortcuta", "Survivors", 1, "-5 -51 0", "5 66 130", "2301 958 31", "-10 0 0" );
    make_clip( "_nav_brokenhome_shortcutb", "Survivors", 1, "-5 -51 0", "5 66 130", "2302 1290 31", "-10 0 0" );

}