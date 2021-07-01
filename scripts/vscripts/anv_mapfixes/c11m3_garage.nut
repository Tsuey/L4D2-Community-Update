g_Chapter = "DEAD AIR - THE CONSTRUCTION SITE";

devchap( "ALL MODES" );

// FIXES_ALL

make_clip(	"_dispcrouch_rubblepipes",	"Everyone",	1,	"-32 -420 0",		"32 420 216",		"-6060 758 -125" );
make_clip(	"_clipgap_roof",		"Survivors",	1,	"-17 -54 0",		"18 54 1000",		"-2226 5494 825" );
make_clip(	"_permstuck_processortanks",	"Everyone",	1,	"-64 -32 -84",		"64 0 10",		"-3000 2129 103" );
make_clip(	"_cliprework_construction01",	"Survivors",	1,	"-666 -32 -176",	"780 8 1150",		"-6885 -2488 712" );
make_clip(	"_cliprework_construction02",	"Survivors",	1,	"-32 -32 -176",		"8 345 1150",		"-7518 -2488 712" );
make_clip(	"_cliprework_construction03",	"Survivors",	1,	"-386 -32 -176",	"460 8 741",		"-5645 -884 1118" );
make_clip(	"_cliprework_construction04",	"Survivors",	1,	"-8 -472 0",		"1337 488 888",		"-5384 -1528 1000" );
make_clip(	"_cliprework_startarea02",	"Survivors",	1,	"-8 -360 0",		"8 360 1122",		"-5008 -2351 712" );
make_clip(	"_cliprework_startarea01",	"Survivors",	1,	"-8 -469 0",		"8 469 1313",		"-4232 -3186 548" );
make_clip( "_nav_constructwin", "Survivors", 1, "-64 -8 0", "64 8 128", "-5776 -1304 216" );
make_clip( "_permstuck_watertank", "Everyone", 1, "-16 -16 0", "16 16 111", "-4044 2880 16" );

make_prop( "dynamic", "_nav_constructwin_propper", "models/props_update/plywood_128.mdl", "-5776 -1302 280", "0 0 90", "shadow_no" );

con_comment( "FIX:\tTanks prevented from being able to punch barricade gascans to delete them." );

NetProps.SetPropInt( Entities.FindByName( null, "barricade_gas_can" ), "m_Collision.m_usSolidFlags", 2 );

if ( g_BaseMode == "coop" || g_BaseMode == "realism" )
{
	devchap( "BASE COOP" );

	// FIXES

}
if ( g_BaseMode == "versus" )
{
	devchap( "BASE VERSUS" );

	// FIXES

    make_clip(	"_booster_windows",		"Survivors",	1,	"-6 -80 0",		"6 80 128",		"-3082 3152 160" );
    make_clip(	"_bunnyhop_windows",		"Survivors",	1,	"-6 -180 0",		"6 180 128",		"-2954 1393 160" );

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