g_Chapter = "BLOOD HARVEST - THE TUNNEL";

devchap( "ALL MODES" );

// FIXES_ALL

make_clip(	"_cliprework_outdoors01",	"Survivors",	1,	"-1171 405 -80",	"1171 422 1575",	"-7720 -8476 616" );
make_clip(	"_cliprework_outdoors03",	"Survivors",	1,	"-1171 -422 -312",	"1171 -405 1575",	"-7720 -8476 616" );
make_clip(	"_cliprework_outdoors02",	"Survivors",	1,	"1154 -422 -192",	"1171 422 1575",	"-7720 -8476 616" );
make_clip(	"_cliprework_outdoors04",	"Survivors",	1,	"-1171 -422 -80",	"-1154 422 1575",	"-7720 -8476 616" );
make_clip( "_nav_eventlight1", "Survivors", 1, "-5 -10 0", "5 10 129", "-8021 -7500 191" );
make_clip( "_nav_eventlight2", "Survivors", 1, "-5 -10 0", "5 10 73", "-6613 -7752 247" );
make_clip( "_stuckwarp_rocketdude", "Everyone", 1, "-24 -48 0", "24 48 71", "-5430 -8170 217" );
make_clip( "_rubble_smoother", "Everyone", 1, "-38 -166 0", "20 190 32", "-1777 -9480 -25", "33 23 28" );
make_trigduck( "_duckqol_ventduct", "-5 -26 -28", "5 26 28", "-8728 -7494 92" );

if ( g_BaseMode == "survival" )
{
	devchap( "BASE SURVIVAL" );

	// FIXES

    make_clip( "_nav_wareshelf", "Survivors", 1, "-25 -85 -234", "44 80 252", "-8740 -6996 170" );

    make_navblock( "_survival_navblock_stairs", "Everyone", "Apply", "-4 -101 0", "4 0 32", "-6688 -7711 -80" );

}

if ( HasPlayerControlledZombies() )
{
    kill_funcinfclip( 741.034 );	// Delete clip above RICHARDSON ATLANTIC building for Hunter-only
    make_atomizer( "_atomizer_bsp_forkliftinnie", "-8604 -7271 -64", "models/props\\cs_assault\\forklift_brokenlift.mdl", 60 );
    make_atomizer( "_atomizer_bsp_forkliftoutie", "-8604 -7531 -64", "models/props\\cs_assault\\forklift_brokenlift.mdl", 30 );
    make_clip( "_charger_smoother_01", "Everyone", 1, "-4 -136 -17",	"4 718 1",	"-8733 -8038 176",	"46 -90 0" );
    make_clip( "_charger_smoother_02", "Everyone", 1, "-4 -132 -17",	"4 700 1",	"-7500 -8038 176",	"46 -90 0" );
    make_clip( "_ladder_indoorventduct_clip", "Everyone", 1, "-22 -32 0", "42 32 223", "-8170 -6300 -64" );
    make_clip( "_ladder_parkourvent_clip", "SI Players", 1, "-1 -17 0", "0 17 64", "-8723 -7415 163" );
    make_clip( "_meticulous_funcinfclip01", "SI Players", 1, "-492 -6 -977", "553 6 657", "-7806 -7614 1536", "0 38 0" );
    make_ladder( "_ladder_boxcarbm1mirr_cloned_firstwindow", "-6728.5 -6458 72", "-2053 -15104 -120", "0 -90 0", "0 1 0" );
    make_ladder( "_ladder_boxcarcm1mirr_cloned_firstwindow", "-6728.5 -6458 72", "-14627 -1792 -120", "0 90 0", "0 -1 0" );
    make_ladder( "_ladder_eventdoorback_cloned_triplepipes", "-7252 -8080.5 370", "-15712 -333 -250", "0 90 0", "1 0 0" );
    make_ladder( "_ladder_eventdoorfront_cloned_triplepipes", "-7252 -8080.5 370", "64 -14840 -250", "0 -90 0", "-1 0 0" );
    make_ladder( "_ladder_indoorboxcar_cloned_warehousecorner", "-8767.5 -7152 113", "1199 622 -172" );
    make_ladder( "_ladder_indoorventduct_cloned_unusedcliff", "-6124 -7222.8 175.5", "-906 -12423 -260", "0 -90 0", "1 0 0" );
    make_ladder( "_ladder_parkourvent_cloned_insideboxcar", "-5991 -8719 32", "-2735 1304 72" );
    make_ladder( "_ladder_skybridgeleftB_cloned_trackstoshed", "-7726 -8871.5 132", "78 -584 417", "0 0 0" );
    make_ladder( "_ladder_skybridgeleftT_cloned_trackstoshed", "-7726 -8871.5 132", "78 -584 641", "0 0 0" );
    make_ladder( "_ladder_skybridgem1mirr_cloned_restoredbluebox", "-5991 -8719 32", "911 -14630 722", "0 -90 0", "0 -1 0" );
    make_ladder( "_ladder_skybridgerightB_cloned_trackstoshed", "-7726 -8871.5 132", "-242 -584 417", "0 0 0" );
    make_ladder( "_ladder_skybridgerightT_cloned_trackstoshed", "-7726 -8871.5 132", "-242 -584 641", "0 0 0" );
    make_ladder( "_ladder_starthugevent_cloned_traintracktall", "-7726 -8871.5 132", "-15592 751 -24", "0 90 0", "-1 0 0" );
    make_ladder( "_ladder_tankbeamescape_cloned_insideboxcar", "-5991 -8719 32", "737 -14088 84", "0 -90 0", "0 -1 0" );
    make_ladder( "_ladder_warehouseboxes_cloned_warehousecorner", "-8767.5 -7152 113", "1601 988 -115" );
    patch_ladder( "-4322 -8715 32", "71 0 21" );
    patch_ladder( "-5991 -8719 32", "247 0 21" );

    make_prop( "dynamic", "_easter_dorykcir", "models/weapons/melee/w_crowbar.mdl", "-8690 -7340 201", "0 -45 90", "shadow_no" );
    make_prop( "dynamic_ovr", "_easter_yofffej", "models/props_junk/gnome.mdl", "-8695.10 -7340.17 210.7719", "0 45 0", "shadow_no" );
    EntFire( g_UpdateName + "_easter_dorykcir", "skin", "1" );

    con_comment( "QOL:\tDeleted blockers to allow ghost infected to pass through the event door for Versus-only QoL." );
    kill_entity( Entities.FindByClassnameNearest( "func_brush", Vector( -8600, -7540, -8.13 ), 1 ) );
    kill_entity( Entities.FindByClassnameNearest( "func_brush", Vector( -8600, -7524, -8.13 ), 1 ) );
    EntFire( "emergency_door_sign", "DisableCollision", 1 );
}