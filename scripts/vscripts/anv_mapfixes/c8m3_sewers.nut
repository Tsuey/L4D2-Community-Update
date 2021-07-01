g_Chapter = "NO MERCY - SEWER";

devchap( "ALL MODES" );

// FIXES_ALL

make_clip(	"_commonhop_trashbags",		"Survivors",	1,	"-256 -670 0",		"4 95 1190",		"10693 5279 17" );
make_clip(	"_clipextend_roofandfence",	"Survivors",	1,	"-4 -1010 0",		"4 420 1200",		"10525 6365 24" );
make_clip(	"_filecabinet_hole",		"Survivors",	1,	"-32 -32 -4",		"32 32 4",		"10928 8208 292" );
make_clip(	"_permstuck_semitrailer",	"SI Players",	1,	"-24 -10 0",		"24 17 171",		"13349 11144 24" );
make_clip(	"_booster_escapeladder",	"Survivors",	1,	"-47 -88 0",		"42 112 929",		"14680 13819 255" );
make_clip( "_nav_garagewindow1", "Everyone", 1, "-5 -36 0", "5 36 32", "12044 5900 19" );
make_clip( "_nav_garagewindow2", "Everyone", 1, "-64 -5 0", "64 5 32", "11928 5948 19" );
make_clip( "_unattackable_wrongway1", "Survivors", 1, "-518 -7 0", "1002 7 652", "11030 4601 560" );
make_clip( "_unattackable_wrongway2", "Survivors", 1, "-232 -7 0", "737 7 742", "12264 4532 468" );
make_clip( "_unattackable_wrongway3", "Survivors", 1, "-7 -1225 -248", "7 2578 632", "13003 5742 568" );
make_clip( "_unattackable_hospital1", "Survivors", 1, "-7 -331 -9", "7 1396 1717", "12473 12235 457" );
make_clip( "_unattackable_hospital2", "Survivors", 1, "-7 -339 -449", "7 429 737", "12473 11475 457" );
make_clip( "_unattackable_hospital3", "Survivors", 1, "-1314 -17 -456", "893 16 742", "13890 10833 464" );
make_clip( "_unattackable_hospital4", "Survivors", 1, "-7 -626 0", "8 1602 576", "14791 11454 608" );
make_clip( "_clipextend_alley", "Survivors", 1, "-54 -29 0", "236 29 782", "12774 8347 432" );
make_clip( "_clipextend_warehouse1", "Survivors", 1, "-270 -753 -43", "290 799 372", "10742 7529 843" );
make_clip( "_clipextend_warehouse2", "Survivors", 1, "-787 -413 0", "909 403 372", "11795 7941 800" );
make_trigduck( "_duckqol_warehousevent", "-9 -26 -28", "9 26 28", "12712 8148 304" );

make_clip(	"_gasstationroof_TMP",		"Survivors",	1,	"0 -794 0",		"503 0 700",		"12186 6694 324" );

make_clip(	"_ladderqol_scissorlift",	"Everyone",	0,	"-54 -1 -184",		"8 8 58",		"12687 7171 16" );

con_comment( "LOGIC:\tTMP Gas Station roof clip will be deleted when it explodes." );

EntFire( "gas_explosion_sound_relay", "AddOutput", "OnTrigger anv_mapfixes_gasstationroof_TMP:Kill::0:-1" );

con_comment( "MOVER:\tClip \"_ladderqol_scissorlift\" simulated to move up with Scissor Lift." );

EntFire( "washer_lift_button2", "AddOutput", "OnPressed anv_mapfixes_ladderqol_scissorlift:Enable::2:-1" );
EntFire( "washer_lift_button2", "AddOutput", "OnPressed anv_mapfixes_ladderqol_scissorlift:AddOutput:origin 12687 7170 62:4:-1" );
EntFire( "washer_lift_button2", "AddOutput", "OnPressed anv_mapfixes_ladderqol_scissorlift:AddOutput:origin 12687 7170 108:6:-1" );
EntFire( "washer_lift_button2", "AddOutput", "OnPressed anv_mapfixes_ladderqol_scissorlift:AddOutput:origin 12687 7170 154:8:-1" );
EntFire( "washer_lift_button2", "AddOutput", "OnPressed anv_mapfixes_ladderqol_scissorlift:AddOutput:origin 12687 7170 200:10:-1" );
EntFire( "washer_lift_button2", "AddOutput", "OnPressed anv_mapfixes_ladderqol_scissorlift:Kill::12:-1" );

if ( g_BaseMode == "coop" || g_BaseMode == "realism" )
{
	devchap( "BASE COOP" );

	// FIXES

}
if ( g_BaseMode == "versus" )
{
	devchap( "BASE VERSUS" );

	// FIXES

    make_clip(	"_window_ricky",		"Survivors",	1,	"-368 0 0",		"144 4 80",		"13680 11132 208" );
    make_clip(	"_commonhop_trimescape",	"Survivors",	1,	"-288 -1 0",		"312 5 525",		"14240 11137 208" );

    con_comment( "LOGIC:\tTMP shortcut booster clips will be deleted when Scissor Lift is started.\n"
	       + "\tCaution: Do not delete this logic otherwise the clips are gamebreakers." );

    make_clip(	"_shortcut_booster_TMP1",	"Survivors",	1,	"-126 -19 0",		"127 20 1048",		"10897 6764 176" );
    make_clip(	"_shortcut_booster_TMP2",	"Survivors",	1,	"-24 -303 0",		"24 304 972",		"11032 7048 252" );

    EntFire( "washer_lift_button2", "AddOutput", "OnPressed anv_mapfixes_shortcut_booster_TMP*:Kill::0:-1" );

}
if ( g_BaseMode == "survival" )
{
	devchap( "BASE SURVIVAL" );

	// FIXES

    con_comment( "LOGIC:\tGas Station explosion will alternatively start Survival timer." );

    EntFire( "gas_explosion_sound_relay", "AddOutput", "OnTrigger director:PanicEvent::2:-1" );

}
if ( g_BaseMode == "scavenge" )
{
	devchap( "BASE SCAVENGE" );

	// FIXES

}