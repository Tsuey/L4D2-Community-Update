g_Chapter = "THE PASSING - UNDERGROUND";

devchap( "ALL MODES" );

// FIXES_ALL

make_clip(	"_permstuck_startfence",	"Survivors",	1,	"-80 -1 0",		"80 1 768",		"2384 -1280 0" );
make_clip(	"_cliphang_rooftop",		"Survivors",	1,	"-192 -490 0",		"208 476 420",		"224 2406 336" );
make_clip( "_cliprework_roofvent", "Survivors", 1, "-319 -182 0", "321 159 412", "1471 2017 352" );
make_clip( "_booster_bluestripes", "Survivors", 1, "-234 -92 0", "222 105 732", "1574 4577 32" );
make_clip( "_booster_dualwindows", "Survivors", 1, "-10 -168 -1", "10 140 89", "1953 561 178", "0 7 0" );
make_clip( "_booster_balcony1", "Survivors", 1, "-20 -146 0", "23 150 640", "537 46 209" );
make_clip( "_booster_balcony2", "Survivors", 1, "-24 -114 -98", "20 118 640", "1960 86 242" );
make_clip( "_booster_balcony3", "Survivors", 1, "-37 -25 0", "35 23 640", "1285 -151 384" );
make_clip( "_booster_balcony4", "Survivors", 1, "-9 -323 0", "39 327 640", "1497 798 317" );
make_clip( "_booster_balcony5", "Survivors", 1, "-325 -9 -112", "323 35 640", "1077 1293 420" );
make_clip( "_booster_balcony6", "Survivors", 1, "-182 -22 -74", "184 25 640", "342 1303 241" );
make_clip( "_booster_balcony7", "Survivors", 1, "-106 -23 -65", "112 24 640", "413 4566 157" );
make_clip( "_booster_bigescape", "Survivors", 1, "-233 -67 -92", "218 62 640", "903 2723 187" );
make_clip( "_frontloader_smoother", "Everyone", 1, "-14 -53 0", "27 53 32", "836 1612 -148" );
make_clip( "_ghostgrief_noio_gate1", "Everyone", 1, "-3 -39 0", "3 39 32", "2547 5704 -950" );
make_clip( "_ghostgrief_noio_gate2", "Everyone", 1, "-3 -39 0", "3 39 32", "5187 5445 -950" );
make_clip( "_booster_electricalbox", "Survivors", 1, "-28 -5 -20", "32 5 836", "917 3163 -4" );
make_clip( "_booster_acunit", "Survivors", 1, "-64 -32 0", "64 32 721", "743 3135 111" );
make_clip( "_dispsteps_smoother1", "Everyone", 1, "-95 -104 -4", "150 104 4", "2553 -936 -186", "33.5 0 0" );
make_clip( "_dispsteps_smoother2", "Everyone", 1, "-95 -104 -4", "135 104 4", "2201 -936 -58", "33.5 0 0" );
make_clip( "_plankescape_smoother", "Everyone", 1, "-82 -30 0", "143 31 8", "190 2976 120", "45 0 0" );
make_clip( "_permstuck_orangefence", "Everyone", 1, "-32 -32 0", "32 32 64", "2188 1856 -64" );
make_clip( "_booster_awningnlights", "Survivors", 1, "-124 -41 0", "129 56 762", "1264 3705 8" );
make_clip( "_nav_bagselecbox", "Survivors", 1, "-7 -34 0", "4 28 822", "636 2243 -70" );
make_trigduck( "_duckqol_poolhallwin", "-2 -34 -46.5", "4 34 46.5", "1480 986.4 38.5" );
make_trigduck( "_duckqol_missingpipe", "-117 -40 -28", "117 40 28", "1824 1528 -164" );

make_prop( "dynamic", "_permstuck_gasmeter", "models/props_urban/gas_meter.mdl", "2202 1859.8 -70.5", "0 0 0" );

if ( g_BaseMode == "coop" || g_BaseMode == "realism" )
{
	devchap( "BASE COOP" );

	// FIXES

    make_ladder( "_ladder_frontloaderright_cloned_frontloaderleft", "803 1554 -151.5", "1607 3220 0", "0 180 0", "0 1 0", 0 );

}
if ( g_BaseMode == "survival" )
{
	devchap( "BASE SURVIVAL" );

	// FIXES

    make_ladder( "_ladder_frontloaderright_cloned_frontloaderleft", "803 1554 -151.5", "1607 3220 0", "0 180 0", "0 1 0", 0 );

    // MESS == make_clip( "_survivalbig_skyboxcap", "Survivors", 1, "-1093 -3406 -40", "1759 2002 382", "581 3150 387" );

}

if ( HasPlayerControlledZombies() )
{
	make_brush( "_losfix_crates",	"-2 -30 -3",	"2 30 3",	"1820 4757 -115" );
	make_brush( "_losfix_strangebalcony",	"-400 -2 -8",	"240 2 8",	"1552 1854 344" );
	make_brush( "_losfix_van1",		"-72 -1 -8",	"72 1 8",	"535 4275 -153" );
	make_brush( "_losfix_van2",		"-72 -1 -8",	"72 1 8",	"1592 4299 -153" );
	make_ladder( "_ladder_barplankqolB_cloned_barelecbox", "421 1994 136", "2394 2455 -256", "0 90 0", "0 1 0" );
	make_ladder( "_ladder_barplankqolT_cloned_barelecbox", "421 1994 136", "2394 2455 0", "0 90 0", "0 1 0" );
	make_ladder( "_ladder_crawfishelecbox_cloned_sucktheheads", "2080 -836 168", "4138 -1342 0", "0 180 0", "0 1 0" );
	make_ladder( "_ladder_forkliftvines_cloned_startfenceback", "2408 -1284 -64", "-1130 4196 -48" );
	make_ladder( "_ladder_frontloaderright_cloned_frontloaderleft", "803 1554 -151.5", "1607 3220 0", "0 180 0", "0 1 0", 0 );
	make_ladder( "_ladder_pipesfencefront_cloned_pipesfenceback", "2384 1566 1", "4757 3130 0", "0 180 0", "-1 0 0" );
	make_ladder( "_ladder_poolhalldropleft_cloned_poolhalldropright", "1113 1308 -94.8019", "250 0 0" );
	make_ladder( "_ladder_stanleydoor_cloned_sewerdropleft", "1627.5 5554 -1132", "12817 4901 46", "0 90 0", "0 -1 0" );
	make_ladder( "_ladder_startfenceback_cloned_startfence", "2408 -1284 -64", "719 -3792 160", "0 90 0", "1 0 0" );
	make_ladder( "_ladder_startfencefront_cloned_startfenceback", "2408 -1284 -64", "4820 -2566 0", "0 180 0", "0 1 0" );
	make_prop( "dynamic", "_solidify_ventlarge", "models/props_rooftop/vent_large1.mdl", "1312.21 1963.61 334.677", "0 270 0", "shadow_no" );
}