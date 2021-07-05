g_Chapter = "THE PARISH - WATERFRONT";

devchap( "ALL MODES" );

// FIXES_ALL

make_clip(	"_vuln_balconya",		"Survivors",	1,	"-48 -192 -76",		"48 192 76",		"-720 -128 -140" );
make_clip(	"_vuln_balconyb",		"Survivors",	1,	"-48 -256 -253",	"48 256 253",		"-1136 -512 196" );
make_clip(	"_vuln_balconyc",		"Survivors",	1,	"0 0 0",		"65 256 150",		"-737 -2048 -208" );
make_clip(	"_vuln_balconyd",		"Survivors",	1,	"-518 -64 0",		"0 0 320",		"-687 -2304 -176" );
//make_clip(	"_phonebooth_hopandnav",	"Survivors",	1,	"-37 -14 -153",		"37 14 555",		"-1731 -2370 -224" );
make_clip(	"_skybox_shielda",		"SI Players",	1,	"-64 -6 0",		"64 6 20",		"-384 -2054 124" );
make_clip(	"_skybox_shieldd",		"SI Players",	1,	"-21 -252.5 -147",	"21 252.5 147",		"-3948 257 130" );
make_clip(	"_skybox_shieldb",		"SI Players",	1,	"-277 -115 -138",	"283 115 100",		"-1543.5 -1855.5 249.6" );
make_clip(	"_skybox_shieldc",		"SI Players",	1,	"-145 -212 -19",	"165 212 77",		"-2971 -1264 125" );
make_clip(	"_signhop_awning",		"Survivors",	1,	"-55 -320 -80",		"55 320 216",		"-3088 -250 -70.5" );
make_clip(	"_cliprework_roofandwindows",	"Survivors",	1,	"-53 -256 0",		"723 256 365",		"-3279 -819 -140.6" );
make_clip(	"_nav_jukebox",			"Survivors",	1,	"-20 -14 -88",		"20 14 88",		"-1492 -1685 -287" );
make_clip(	"_nav_outhouse",		"Survivors",	1,	"0 0 -30",		"60 50 50",		"-970.4 -2352 -221.7" );
make_clip(	"_nav_bienlamps",		"Survivors",	1,	"-32 -75 0",		"6 75 330",		"-664 -835 -184" );
make_clip( "_rampstep_smoother", "Everyone", 1, "-40 -5 0", "40 1 3", "776 44 -374", "0 0 45" );
make_clip( "_nav_electricalbox", "Survivors", 1, "-35 -4 0", "28 3 576", "-1392 -252 -374" );
make_clip( "_cliprework_balconya", "Survivors", 1, "-398 -54 -17", "269 44 278", "-2700 -2346 -157" );
make_clip( "_cliprework_balconyb", "Survivors", 1, "-161 -47 0", "186 50 340", "-2937 -2098 -216" );
make_clip( "_cliprework_huntergap", "SI Players", 1, "-136 0 0", "136 17 32", "-40 1408 80" );
make_clip( "_permstuck_dropbehindfence", "Everyone", 1, "-226 -7 -104", "294 41 177", "-982 -2793 144" );
make_clip( "_cliprework_unattackable", "Survivors", 1, "-802 -203 0", "558 213 832", "-2446 299 -376" );
make_clip( "_ledgehang_startfenceleft", "Survivors", 1, "-16 -48 0", "10 48 379", "589 -142 -251", "0 29 0" );
make_clip( "_ledgehang_startfenceright", "Survivors", 1, "-8 -24 0", "8 24 360", "599 45 -232", "0 -15 0" );

if ( g_BaseMode == "versus" )
{
	devchap( "BASE VERSUS" );

	// FIXES

    make_clip(	"_clipgap_fence",		"Survivors",	1,	"-32 -12 -82",		"32 12 82",		"-1740 -1284 -134" );

}