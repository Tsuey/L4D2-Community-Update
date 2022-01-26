g_Chapter = "DEAD CENTER - MALL";

devchap( "ALL MODES" );

PrecacheModel( "models/props_interiors/breakwall_interior_noboards.mdl" );
PrecacheModel( "models/props_exteriors/guardshack_break07.mdl" );
PrecacheModel( "models/props_exteriors/guardshack_break02.mdl" );
PrecacheModel( "models/props_vents/vent_cluster006.mdl" );

function DoRoundFixes()
{
	make_clip(	"_commonhop_maproom",		"Survivors",	1,	"-24 -17 0",		"100 17 112",		"3673 -2517 424" );
	make_clip( "_cliprework_skylighta", "Survivors", 1, "-192 -193 -23", "192 191 57", "6464 -2591 559" );
	make_clip( "_cliprework_skylightb", "Survivors", 1, "-541 -189 -1", "547 195 32", "4173 -2627 793" );
	make_clip( "_cliprework_skylightc", "Survivors", 1, "-194 -544 -1", "190 544 32", "2274 -672 793" );
	make_clip( "_cliprework_skylightd", "Survivors", 1, "-1017 -167 0", "1018 149 32", "1465 -3418 794", "0 45 0" );
	make_clip( "_permstuck_colddrinks", "Everyone", 1, "-1 -1 -1", "1 1 1", "736 -548 363" );
	make_clip( "_commentary_shortcut_storeceiling", "Everyone", 1, "0 0 0", "196 196 32", "1159.05 -2466.62 442" );
	make_clip( "_commentary_shortcut_storevent", "Everyone", 1, "0 0 0", "48 48 64", "1680 -2526.44 384" );
	make_trigduck( "_duckqol_shopliftscanners", "-2 -88 0", "2 64 77", "5247 -2685 280" );

	con_comment( "FIX:\tMoved an exposed stairwell hurt trigger down inside a vending machine." );

	local hndHurtStairwell = Entities.FindByName( null, "hurt_stairwell" );

	if ( SafelyExists( hndHurtStairwell ) )
	{
		hndHurtStairwell.SetOrigin( Vector( 683.5, -583, 307 ) );
	}

	if ( HasPlayerControlledZombies() )
	{
		kill_entity( Entities.FindByClassnameNearest( "func_breakable", Vector( -1016.5, -4510.5, 561 ), 1 ) );
		kill_entity( Entities.FindByClassnameNearest( "func_breakable", Vector( -1155.47, -4510.5, 561 ), 1 ) );
		kill_entity( Entities.FindByClassnameNearest( "func_breakable", Vector( -1400.5, -4510.5, 561 ), 1 ) );
		kill_entity( Entities.FindByClassnameNearest( "func_breakable", Vector( 2558.5, -408.5, 561 ), 1 ) );
		kill_entity( Entities.FindByClassnameNearest( "func_breakable", Vector( 3964.5, -2910.5, 561 ), 1 ) );
		kill_entity( Entities.FindByClassnameNearest( "func_breakable", Vector( 4099.47, -2337.5, 561 ), 1 ) );
		kill_entity( Entities.FindByClassnameNearest( "func_breakable", Vector( 4103.5, -2910.5, 561 ), 1 ) );
		kill_entity( Entities.FindByClassnameNearest( "func_breakable", Vector( 4344.5, -2337.5, 561 ), 1 ) );
		kill_entity( Entities.FindByClassnameNearest( "func_breakable", Vector( 4348.54, -2910.5, 561 ), 1 ) );
		kill_entity( Entities.FindByClassnameNearest( "func_breakable", Vector( 4483.47, -2337.5, 561 ), 1 ) );
		kill_entity( Entities.FindByClassnameNearest( "func_breakable", Vector( 4487.5, -2910.5, 561 ), 1 ) );
		make_brush( "_losfix_end_gen",		"-28 -1 -8",	"28 1 8",	"-1940 -4434 544" );
		make_clip( "_ladderqol_lastroom_left", "SI Players", 1, "-564 -3 -31", "564 3 31", "-1280 -4503 509" );
		make_clip( "_ladderqol_lastroom_right", "SI Players", 1, "-564 -3 -31", "564 3 31", "-1280 -3945 509" );
		make_clip( "_ladderqol_maproom_left", "SI Players", 1, "-564 -3 -31", "564 3 31", "4224 -2903 509" );
		make_clip( "_ladderqol_maproom_right", "SI Players", 1, "-564 -3 -31", "564 3 31", "4224 -2345 509" );
		make_clip( "_ladderqol_oneway_left", "SI Players", 1, "-3 -564 -31", "3 564 31", "1993 -672 509" );
		make_clip( "_ladderqol_oneway_right", "SI Players", 1, "-3 -564 -31", "3 564 31", "2551 -672 509" );
		make_clip( "_skylighta_blocker1", "SI Players", 1, "-278 -246 0", "-268 246 172", "6463 -2592 586" );
		make_clip( "_skylighta_blocker2", "SI Players", 1, "262 -246 0", "272 246 172", "6463 -2592 586" );
		make_clip( "_skylighta_blocker3", "SI Players", 1, "-278 -246 0", "272 -236 172", "6463 -2592 586" );
		make_clip( "_skylighta_blocker4", "SI Players", 1, "-278 236 0", "272 246 172", "6463 -2592 586" );
		make_ladder( "_ladder_kappels_cloned_headroomvent", "612 -947 308", "7484 -2035.7 -148", "0 -90 0", "1 0 0" );
		make_ladder( "_ladder_lastroomSE_cloned_lastroomNE", "-1088 -4498.48 456", "-2176 -8448 0", "0 180 0", "0 -1 0" );
		make_ladder( "_ladder_lastroomSW_cloned_lastroomNW", "-1472 -4498.48 456", "-2944 -8448 0", "0 180 0", "0 -1 0" );
		make_ladder( "_ladder_maproomNE_cloned_onewayNW", "1997.48 -864 504", "3552 -4896 0", "0 90 0", "0 1 0" );
		make_ladder( "_ladder_maproomNW_cloned_onewaySW", "1997.48 -480 504", "3552 -4896 0", "0 90 0", "0 1 0" );
		make_ladder( "_ladder_maproomSE_cloned_onewayNE", "2546.48 -864 504", "3552 -4896 0", "0 90 0", "0 -1 0" );
		make_ladder( "_ladder_maproomSW_cloned_onewaySE", "2546.48 -480 504", "3552 -4896 0", "0 90 0", "0 -1 0" );
		make_ladder( "_ladder_scaffold_cloned_sodavent", "754 -1300 351", "-895 -3732 -25" );
		make_ladder( "_ladder_toystoreceiling_cloned_ventexcessheight", "1726.36 -2531.13 299", "3799 -586 173", "0 -90 0", "-0.7 -0.7 0" );
		make_prop( "dynamic", "_cosmetic_breakwall1", "models/props_interiors/breakwall_interior_noboards.mdl", "238.1 -2505.6 344", "0 -45 0", "shadow_no", "solid_no" );
		make_prop( "dynamic", "_cosmetic_breakwall2", "models/props_interiors/breakwall_interior_noboards.mdl", "236.9 -2504.9 348", "0 -225 0", "shadow_no", "solid_no" );
		make_prop( "dynamic", "_ladder_toyvent1", "models/props_exteriors/guardshack_break07.mdl", "1271 -2310 431", "0 315 -95", "shadow_no", "solid_no" );
		make_prop( "dynamic", "_ladder_toyvent2", "models/props_exteriors/guardshack_break07.mdl", "1279 -2304 518", "0 300 85", "shadow_no", "solid_no" );
		make_prop( "dynamic", "_ladder_toyvent3", "models/props_exteriors/guardshack_break02.mdl", "1158 -2421 554", "0 125 0", "shadow_no", "solid_no" );
		make_prop( "dynamic", "_ladder_toyvent4", "models/props_vents/vent_cluster006.mdl", "1412 -2172 560.35", "0 315 0", "shadow_no" );
		make_prop( "dynamic", "_ladder_toyvent5", "models/props_vents/vent_cluster006.mdl", "1043 -2538 561", "0 315 0", "shadow_no" );
		make_trigmove( "_duckqol_justforkidz", "Duck", "-18 -18 0", "18 18 1", "1191.3 -2026 521" );
	}
}

function DoMapSpawnFixes()
{
	make_decal( "decals/vent01", "1279 -2411 280" );
}