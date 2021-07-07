g_Chapter = "THE SACRIFICE - DOCKS";

devchap( "ALL MODES" );

// FIXES_ALL

make_clip(	"_bunnyhop_boat",		"Survivors",	1,	"-180 -200 0",		"180 200 1180",		"11970 -820 -157" );
make_clip(	"_ghostgrief_dockledge",	"Everyone",	1,	"-48 -11 -21",		"42 7 71",		"10228 -340 -107" );
make_clip(	"_clipgap_intersection",	"Survivors",	1,	"-64 -32 0",		"64 32 140.85",		"6612 2234 294" );
make_clip( "_booster_lonerpipe", "Survivors", 1, "-13 -12 0", "14 10 475", "9236 750 550" );
make_clip( "_clipextend_arena_tree", "Survivors", 1, "-158 -137 0", "152 165 284", "9054 49 740" );
make_clip( "_clipextend_arena_fence1", "Survivors", 1, "-16 -391 0", "16 389 528", "9418 371 496" );
make_clip( "_clipextend_arena_fence2", "Survivors", 1, "-936 -16 0", "1390 15 528", "8077 -311 496", "0 13 0" );
make_clip( "_cliprework_ventshafts", "Survivors", 1, "-814 -79 -16", "1010 65 80", "3870 1647 336" );
make_clip( "_commonhop_endwindows", "Survivors", 1, "-459 -16 0", "453 16 128", "2563 2560 336" );
make_clip( "_clipextend_rubblecar", "Survivors", 1, "-418 -326 -223", "382 253 932", "11026 -1196 90" );

if ( g_BaseMode == "coop" || g_BaseMode == "realism" )
{
	devchap( "BASE COOP" );

	// FIXES

    // Tank bug where tank_door_clip causes BLOCKED_ZOMBIE attribute but is erroneously
    // removed with ~5 second delay after it's deleted -- the clip isn't necessary any
    // way because of other collisions, so delete it instantly OnPressed to give it the
    // extra time. Finally, originally the navblocker is UnblockNav'd OnFullyOpen which
    // is also too late since it waits for the func_movelinear, so do that OnTimeUp.

    con_comment( "LOGIC:\tCoop-only boxcar Tank door clip and navblocker modified to fix forced-suicide trick." );

    EntFire( "tankdoorin_button", "AddOutput", "OnPressed tank_door_clip:Kill::0:-1" );
    EntFire( "tankdoorin_button", "AddOutput", "OnTimeUp tankdoorinnavblocker:UnblockNav::0:-1" );

}

if ( HasPlayerControlledZombies() )
{
    make_clip( "_ladder_tankwinleft_clip", "SI Players", 1, "-26 0 0", "26 1 6", "7335 944 224" );
    make_clip( "_ladder_tankwinright_clip", "SI Players", 1, "-26 0 0", "26 1 6", "7591 944 224" );
    make_ladder( "_ladder_brickyardleft1_cloned_brickyard2nd", "4712 193 224", "-72 -639 1" );
    make_ladder( "_ladder_brickyardleft2_cloned_brickyard3rd", "3713 352 192", "4576 -4096 1", "0 90 0", "0 1 0" );
    make_ladder( "_ladder_brickyardleft3_cloned_brickyard1st", "5441 -418 224", "-1730 64 1" );
    make_ladder( "_ladder_brickyardright1_cloned_brickyard3rd", "3713 352 192", "5569 -3458 1", "0 90 0", "0 1 0" );
    make_ladder( "_ladder_brickyardright2_cloned_brickyard3rd", "3713 352 192", "4545 -3457 1", "0 90 0", "0 1 0" );
    make_ladder( "_ladder_midfencefar_cloned_midstreetnear", "11391 2256 204.538", "-778 -311 0" );
    make_ladder( "_ladder_midfencenear_cloned_midstreetfar", "10621 2064 204.5", "782 0 0" );
    make_ladder( "_ladder_parkourvent_cloned_roofshortest", "5559 1168 352", "10439 2848 -48", "0 180 0", "1 0 0" );
    make_ladder( "_ladder_tankwinleft_cloned_brickoffice", "5944 823 256", "1390 105 -136" );
    make_ladder( "_ladder_tankwinright_cloned_brickoffice", "5944 823 256", "1646 105 -136" );
}