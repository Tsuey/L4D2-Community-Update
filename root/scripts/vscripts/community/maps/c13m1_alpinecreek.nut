g_Chapter = "COLD STREAM - ALPINE CREEK";

devchap( "ALL MODES" );

function DoRoundFixes()
{
	make_clip(	"_dispcrouch_watchtower",	"Everyone",	1,	"-64 -17 0",		"64 17 128",		"-3025 2861 186" );
	make_clip(	"_sneaky_hunter",		"SI Players",	1,	"-963 -450 -256",	"1160 360 0",		"-1169 1555 482" );
	make_clip( "_permstuck_cornercabin", "Everyone", 1, "-11 -12 -38", "14 12 32", "1465 3478 540" );
	make_clip( "_dispcrouch_spawn", "Everyone", 1, "-32 -131 -147", "16 386 108", "-3244 54 151", "0 11 0" );

	if ( HasPlayerControlledZombies() )
	{
		make_ladder( "_ladder_crossoverbackB_cloned_mrlogsuperwide", "954 1027.5 474.3475", "-2055 3751 -274", "0 -90 0", "1 0 0" );
		make_ladder( "_ladder_crossoverbackT_cloned_mrlogsuperwide", "954 1027.5 474.3475", "-2165 3751 -100", "0 -90 0", "1 0 0" );
		make_ladder( "_ladder_crossoverfrontB_cloned_mrlogsuperwide", "954 1027.5 474.3475", "-479 1690 -313", "0 90 0", "-1 0 0" );
		make_ladder( "_ladder_crossoverfrontT_cloned_mrlogsuperwide", "954 1027.5 474.3475", "-330 1690 17", "0 90 -8", "-1 0 0" );
		make_ladder( "_ladder_crossoverupway_cloned_bunkerdoor", "1064 223 652", "-2326 2962 -84" );
	}
}