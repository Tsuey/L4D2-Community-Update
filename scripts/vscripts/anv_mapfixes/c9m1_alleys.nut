g_Chapter = "CRASH COURSE - THE ALLEYS";

devchap( "ALL MODES" );

// FIXES_ALL

make_clip(	"_cliprework_rooftop01",	"Survivors",	1,	"-10 -340 0",		"10 340 600",		"-5434 -9392 336" );
make_clip(	"_cliprework_rooftop02",	"Survivors",	1,	"-580 -10 -130",	"580 10 576",		"-4864 -9722 352" );
make_clip(	"_commonhop_window",		"Survivors",	1,	"-32 -8 0",		"32 8 88",		"-4480 -10632 144" );
make_clip(	"_clipgap_alley",		"Survivors",	1,	"-8 -128 0",		"8 128 700",		"-4295 -8320 256" );
make_clip(	"_curvejump_van",		"Survivors",	1,	"-42 -128 -32",		"42 128 1337",		"-3311 -4407 -345" );
make_clip(	"_cliprework_mirrorwarehouse",	"Everyone",	1,	"-77 -238 0",		"76 248 296",		"-5412 -10506 64" );
make_clip(	"_permstuck_treea",		"Everyone",	1,	"-17 -17 0",		"17 17 128",		"-3520 -4949 -242" );
make_clip(	"_permstuck_treeb",		"Everyone",	1,	"-17 -17 0",		"17 17 128",		"-2656 -4782 -300" );
make_clip(	"_permstuck_treec",		"Everyone",	1,	"-17 -17 0",		"17 17 96",		"-865 -6583 -17" );
make_clip(	"_permstuck_treed",		"Everyone",	1,	"-17 -17 0",		"17 17 96",		"-577 -7055 -23" );
make_clip(	"_curvejump_railing",		"Survivors",	1,	"-100 -17 -64",		"42 17 888",		"-1714 -1650 64" );
make_clip( "_cliprework_noladders", "Survivors", 1, "-8 -176 0", "8 176 72", "-7976 -10924 208" );
make_clip( "_solidify_acunit", "Everyone", 1, "-4 -59 -7", "4 59 136", "-708 -1224 23" );
make_clip( "_commonhop_van", "Survivors", 1, "-114 -54 0", "149 60 773", "-2312 -9675 155", "0 38 0" );
make_clip( "_booster_trafficlighta", "Survivors", 1, "-80 -40 -80", "80 40 698", "-1420 -7002 230" );
make_clip( "_booster_trafficlightb", "Survivors", 1, "-100 -60 -140", "140 40 561", "-1364 -6902 367" );
make_clip( "_booster_trafficlightc", "Survivors", 1, "-42 -140 -80", "10 148 619", "-1094 -6917 309" );
make_clip( "_booster_trafficlightd", "Survivors", 1, "-120 -34 -80", "148 10 619", "-1242 -6515 309" );
make_clip( "_booster_acunit", "Survivors", 1, "-28 -60 -80", "29 60 624", "-1631 -6152 304" );
make_clip( "_booster_brokenframe", "Survivors", 1, "-80 -8 -80", "81 9 514", "-1965 -6409 414" );
make_clip( "_booster_rentsign", "Survivors", 1, "-16 -19 -80", "17 19 637", "-1648 -5552 291" );
make_clip( "_booster_enginecar", "Survivors", 1, "-180 -88 -180", "114 94 463", "-1982 -7055 465" );
make_clip( "_booster_telepole1", "Survivors", 1, "-8 -8 -80", "8 8 234", "-1111 -6480 694" );
make_clip( "_booster_telepole2", "Survivors", 1, "-8 -8 -80", "8 8 464", "50 -5432 464" );
make_clip( "_clipgap_survivoronly", "Survivors", 1, "-100 -24 -80", "108 40 1072", "1428 -4936 -144" );

con_comment( "LOGIC:\tBile anti-skip made 2 breakwalls indestructible until howitzer fires." );

EntFire( "zombie_breakwall01", "AddOutput", "minhealthdmg 2147483647" );
EntFire( "zombie_breakwall09", "AddOutput", "minhealthdmg 2147483647" );
EntFire( "fire_howitzer", "AddOutput", "OnPressed zombie_breakwall01:AddOutput:minhealthdmg 0:0:-1" );
EntFire( "fire_howitzer", "AddOutput", "OnPressed zombie_breakwall09:AddOutput:minhealthdmg 0:0:-1" );

if ( g_BaseMode == "versus" )
{
	devchap( "BASE VERSUS" );

	// FIXES

    make_clip(	"_allmodes_griefrooma",		"Survivors",	1,	"0 0 0",		"530 126 950",		"156 -6648 -22" );
    make_clip(	"_allmodes_griefroomb",		"Survivors",	1,	"0 -770 0",		"130 0 950",		"28 -6652 -22" );

}