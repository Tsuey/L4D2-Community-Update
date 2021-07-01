g_Chapter = "DEATH TOLL - THE CHURCH";

devchap( "ALL MODES" );

// FIXES_ALL

make_clip(	"_commonhop_saferoom",		"Survivors",	1,	"-576 -2892 -165",	"576 368 1000",		"-8080 -5684 421" );
make_clip(	"_commonhop_traintoroof",	"Survivors",	1,	"-789 -626 -165",	"744 762 994",		"-12000 -8094 286" );
make_clip(	"_commonhop_stationroof",	"Survivors",	1,	"-184 -430 -200",	"174 380 470",		"-12632 -6040 500" );
make_clip(	"_dispcrouch_flatcartunnel",	"Everyone",	1,	"-100 -38 -64",		"38 38 256",		"-12534 -3574 -36" );
make_clip(	"_holdoutsafe_cabinmountain",	"Survivors",	1,	"-340 -50 -245",	"340 50 1122",		"-7518 -2770 307" );
make_clip(	"_cliprework_watchtower",	"Survivors",	1,	"0 -358 0",		"358 0 180",		"-10438 -6325 542" );
make_clip(	"_cliprework_rockcliff01",	"Survivors",	1,	"-600 -160 -592",	"911 160 592",		"-6272 -2688 848" );
make_clip(	"_cliprework_roadblock",	"Survivors",	1,	"-45 -1200 0",		"45 455 512",		"-4585 -944 496" );
make_clip(	"_cliprework_churchlonga",	"Survivors",	1,	"-45 -9 -555",		"2310 9 944",		"-4533 -503 496" );
make_clip(	"_cliprework_rockcliff02",	"Survivors",	1,	"-145 -360 -420",	"180 216 592",		"-7043 -3005 848" );
make_clip(	"_cliprework_churchlongb",	"Survivors",	1,	"-9 -45 -369",		"9 2400 1166",		"-2232 -467 290" );
make_clip(	"_clipextend_trainstationa",	"Survivors",	1,	"-24 -1300 0",		"24 1300 640",		"-12811 -7486 344" );
make_clip(	"_clipextend_trainstationb",	"Survivors",	1,	"-1200 -9 0",		"216 77 690",		"-13001 -5725.4 344" );
make_clip( "_dipscrouch_multicliff", "Everyone", 1, "-487 -60 -100", "86 4 39", "-13282 -3756 240", "0 43 0" );
make_clip( "_cliprework_church01", "Survivors", 1, "-260 -169 -80", "286 9 864", "-3070 25 576" );
make_clip( "_cliprework_church02", "Survivors", 1, "-618 -80 -80", "486 32 864", "-2710 1072 576" );
make_clip( "_cliprework_church03", "Survivors", 1, "-554 -102 -80", "486 62 864", "-3798 930 576" );
make_clip( "_cliprework_church04", "Survivors", 1, "-218 -102 -80", "206 250 864", "-4538 578 576" );
make_clip( "_cliprework_church05", "Survivors", 1, "-430 -10 -80", "206 10 864", "-4962 712 576" );
make_clip( "_cliprework_church06", "Survivors", 1, "-10 -545 -80", "10 430 864", "-5528 137 576" );
make_clip( "_cliprework_church07", "Survivors", 1, "-180 -9 -80", "80 9 864", "-3390 -135 576" );
make_clip( "_cliprework_church08", "Survivors", 1, "-100 -100 -80", "100 0 864", "-5492 667 576", "0 45 0" );
make_clip( "_cliprework_church09", "Survivors", 1, "-40 -175 -80", "20 175 864", "-3612 -319 576", "0 -24 0" );
make_clip( "_cliprework_church10", "Survivors", 1, "-80 -490 -80", "32 486 864", "-2256 506 576" );
make_clip( "_cliprework_church11", "Survivors", 1, "-144 -160 -80", "144 160 704", "-2928 448 736" );
make_clip( "_cliprework_church12", "Survivors", 1, "-226 -284 -80", "222 420 704", "-2558 220 736" );
make_clip( "_cliprework_corner1", "Survivors", 1, "-487 -60 39", "86 4 784", "-13282 -3756 240", "0 43 0" );
make_clip( "_cliprework_corner2", "Survivors", 1, "-550 -60 -17", "711 4 784", "-12651 -3566 400", "0 14 0" );
make_clip( "_tankpunch_booster", "Survivors", 1, "-8 -302 -110", "158 960 1322", "-8838 -4633 124", "0 51 0" );
make_clip( "_permstuck_triplerock", "Everyone", 1, "-78 -86 -80", "88 96 32", "-9539 -4313 16", "0 41 0" );
make_clip( "_cliprework_vulnerable", "Survivors", 1, "-1085 -16 -90", "1048 16 1192", "-8709 -3352 269", "0 34 0" );
make_clip( "_cliprework_churchwindows", "Survivors", 1, "-4 -120 0", "4 120 100", "-2372 192 194" );
make_clip( "_clipextend_padlockgate", "Survivors", 1, "-14 -311 0", "14 405 1102", "-8594 -5033 344" );
make_clip( "_permstuck_openedrockcliff", "SI Players", 1, "-17 -17 0", "17 17 32", "-9247 -3950 412" );
make_clip( "_permstuck_fatcliffladder1", "SI Players", 1, "-17 -34 0", "17 17 32", "-8302 -3322 383" );
make_clip( "_permstuck_fatcliffladder2", "SI Players", 1, "-17 -34 0", "17 17 32", "-8224 -3527 378" );
make_clip( "_chargerassist_brokenwall", "Survivors", 1, "-128 0 0", "128 64 275", "-2480 1104 221" );
make_clip( "_booster_watertowerclip", "Survivors", 1, "-538 -16 0", "348 66 900", "-6472 -871 1024", "0 15 0" );

if ( g_BaseMode == "coop" || g_BaseMode == "realism" )
{
	devchap( "BASE COOP" );

	// FIXES

}
if ( g_BaseMode == "versus" )
{
	devchap( "BASE VERSUS" );

	// FIXES

    make_clip( "_cliprework_smokertrolling", "Survivors", 1, "-207 -21 0", "219 8 259", "-11857 -5323 85" );

}
if ( g_BaseMode == "survival" )
{
	devchap( "BASE SURVIVAL" );

	// FIXES

}
if ( g_BaseMode == "scavenge" )
{
	devchap( "BASE SCAVENGE" );

	// FIXES

}