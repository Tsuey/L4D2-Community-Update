g_Chapter = "DARK CARNIVAL - FAIRGROUND";

devchap( "ALL MODES" );

// FIXES_ALL

make_clip(	"_bunnyhop_roundtable",		"Survivors",	1,	"-45 -256 0",		"100 256 502",		"2360 -244 266" );
make_clip(	"_booster_unattackable",	"Survivors",	1,	"-100 -17 0",		"700 17 512",		"4000 -2304 268" );
make_clip(	"_forklift_roof",		"Survivors",	1,	"-7 -128 0",		"10 128 575",		"1750 -1660 193" );
make_clip(	"_commonhop_whitefence",	"Survivors",	1,	"-77 -5 0",		"77 5 777",		"-3903 -1141 -15" );
make_clip(	"_commonhop_carouselroofs",	"Survivors",	1,	"-230 -5 0",		"302 1142 666",		"-990 -5501 192" );
make_clip(	"_void_filler","Everyone",	1,	"-222 0 -125",		"222 16 55",		"-1792 -7311 250" );
make_clip(	"_charger_smoother",		"Everyone",	1,	"-56 -256 -6",		"56 256 6",		"-3119 -896 152",	"-40 0 0" );
make_clip( "_cliprework_unattackable", "Survivors", 1, "-8 -1009 0", "8 1007 128", "-504 -1535 128" );
make_clip( "_cliprework_beanbinninga", "Survivors", 1, "-8 -961 0", "8 959 128", "-888 -1535 128" );
make_clip( "_cliprework_beanbinningb", "Survivors", 1, "-178 -11 0", "190 5 128", "-702 -2549 128" );
make_clip( "_cliprework_unattackablea", "Survivors", 1, "-23 -1191 0", "29 177 597", "-3405 -6489 204" );
make_clip( "_cliprework_unattackableb", "Survivors", 1, "-178 -24 0", "82 24 597", "-3510 -6336 204" );
make_clip( "_cliprework_unattackablec", "Survivors", 1, "-24 -236 0", "24 304 597", "-3664 -6076 204" );
make_clip( "_cliprework_unattackabled", "Survivors", 1, "-1108 -23 0", "324 21 597", "-4012 -5793 204" );
make_clip( "_cliprework_unattackablee", "Survivors", 1, "-4 -303 0", "4 865 492", "-4352 -5473 272" );
make_clip( "_cliprework_wrongwaya", "Survivors", 1, "-207 -7 0", "218 1 578", "-481 -5505 192" );
make_clip( "_cliprework_wrongwayb", "Survivors", 1, "-8 -866 0", "8 799 578", "-258 -6303 192" );
make_clip( "_cliprework_wrongwayc", "Survivors", 1, "-2113 -10 0", "1219 5 578", "-1471 -7166 192" );
make_clip( "_nav_exitsign", "Survivors", 1, "-8 -11 0", "11 12 120", "1048 -1269 128" );
make_clip( "_cliprework_blockergap", "Survivors", 1, "-121 -8 0", "123 8 384", "-4235 -3968 384" );
make_clip( "_unattackable_traintunnel", "Survivors", 1, "-324 -1040 -171", "220 1040 342", "-604 -1536 428" );
make_clip( "_dispcollision_fairgrounds", "All and Physics", 1, "-1400 -1700 -2", "1400 1700 0", "-1903 -142 -128" );

if ( g_BaseMode == "coop" || g_BaseMode == "realism" )
{
	devchap( "BASE COOP" );

	// FIXES

}
if ( g_BaseMode == "versus" )
{
	devchap( "BASE VERSUS" );

	// FIXES

    make_clip(	"_booster_uppertrackb",		"Survivors",	1,	"-64 -448 -320",	"64 448 320",		"-1536 -2368 448" );
    make_clip(	"_booster_uppertracka",		"Survivors",	1,	"-57 -313 -208.5",	"57 313 208.5",		"-2721 -825 337" );
    make_clip( "_clipextend_carouselboost", "Survivors", 1, "-234 -4 0", "234 4 666", "-1446 -5248 192" );

    // Piggyback on Survivor-filtered trigger just beyond the carousel off switch.

    con_comment( "LOGIC:\tAnti-boost ToL clips will be deleted by existing trigger after carousel switch." );

    make_clip( "_tol_clip_brush_a", "Survivors", 1, "-818 -16 0", "82 599 572", "-3530 -5162 192" );
    make_clip( "_tol_clip_brush_b", "Survivors", 1, "-9 -263 0", "488 -1 572", "-3439 -5178 192" );
    DoEntFire( "!self", "AddOutput", "OnTrigger anv_mapfixes_tol_clip_brush*:Kill::-1", 0.0, null, Entities.FindByClassnameNearest( "trigger_once", Vector( -2496, -6544, 4 ), 1 ) );

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