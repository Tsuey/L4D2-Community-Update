g_Chapter = "COLD STREAM - CUT-THROAT CREEK";

devchap( "ALL MODES" );

// FIXES_ALL

make_clip(	"_permstuck_treetunnel",	"Everyone",	1,	"-16 -17 -10",		"17 16 45",		"-492.1 -186.3 -385" );
make_clip(	"_dispcrouch_toomany",		"Everyone",	1,	"0 0 -80",		"128 128 9001",		"-3028 -6154 413" );
make_clip( "_eventskip_rooftop", "Survivors", 1, "-317 -401 0", "323 367 689", "-3891 -8135 723" );
make_clip( "_eventskip_fence1", "Survivors", 1, "-59 -16 0", "60 16 910", "-4268 -8520 504" );
make_clip( "_eventskip_fence2", "Survivors", 1, "-151 -20 0", "849 20 914", "-3409 -7764 500" );
make_clip( "_cliprework_startbooster", "Survivors", 1, "-86 -520 -863", "203 361 226", "-4930 -5987 1188" );
make_clip( "_cliprework_endbooster", "Survivors", 1, "-72 -103 -175", "63 91 1415", "-1175 1405 57" );
make_clip( "_dispcrouch_onewaydrop", "Everyone", 1, "-402 -64 -64", "465 18 422", "-3893 -5852 -128" );
make_clip( "_cliprework_dispcrouch00", "SI Players and AI", 1, "-64 -149 -164", "18 87 146", "-4030 -5257 132", "0 -5 0" );
make_clip( "_cliprework_dispcrouch01", "Survivors", 1, "-64 -269 -64", "18 277 1446", "-4030 -5357 -32", "0 -5 0" );
make_clip( "_cliprework_dispcrouch02", "Survivors", 1, "-64 -269 -64", "18 1097 1446", "-4020 -4815 -32", "0 3 0" );
make_clip( "_cliprework_dispcrouch03", "Survivors", 1, "-64 -102 -64", "18 478 1446", "-4180 -1920 -32", "0 -21 0" );
make_clip( "_cliprework_dispcrouch04", "Survivors", 1, "-64 -22 -64", "18 408 1446", "-3971 -1527 -32", "0 -94 0" );
make_clip( "_cliprework_dispcrouch05", "Survivors", 1, "-64 -22 -64", "18 439 1446", "-3551 -1552 -32", "0 -64 0" );
make_clip( "_cliprework_dispcrouch06", "Survivors", 1, "-64 -157 -64", "18 369 1446", "-3126 -1398 -32", "0 -104 0" );
make_clip( "_cliprework_dispcrouch07", "Survivors", 1, "-64 -157 -64", "18 451 1446", "-2619 -1469 -31", "0 -84 0" );
make_clip( "_cliprework_dispcrouch08", "SI Players", 1, "-138 -16 -128", "48 16 216", "-2314 -2346 130", "0 -15 0" );
make_clip( "_cliprework_dispcrouch09", "SI Players", 1, "-138 -16 -128", "198 16 216", "-2172 -2422 130", "0 -17 0" );
make_clip( "_cliprework_dispcrouch10", "SI Players", 1, "-138 -16 -128", "488 16 108", "-1839 -2492 130", "0 13 0" );
make_clip( "_cliprework_dispcrouch11", "SI Players", 1, "-138 -16 -177", "488 16 0", "-1238 -2465 130", "0 -1 0" );
make_clip( "_cliprework_dispcrouch12", "SI Players", 1, "-8 -171 -42", "8 188 102", "415 -921 77", "0 -5 0" );
make_clip( "_dispcrouch_waterfall", "Everyone", 1, "-64 -188 -64", "18 263 272", "-2184 -1700 -288", "0 -10 0" );
make_clip( "_permstuck_umheymatt", "Everyone", 1, "-16 -128 0", "16 128 142", "13 5280 -117" );

if ( g_BaseMode == "coop" || g_BaseMode == "realism" )
{
	devchap( "BASE COOP" );

	// FIXES

}
if ( g_BaseMode == "versus" )
{
	devchap( "BASE VERSUS" );

	// FIXES

    make_clip( "_commonhop_endshortcut", "Survivors", 1, "-94 -35 -153", "93 -29 1437", "-693 4555 35", "0 5 0" );

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