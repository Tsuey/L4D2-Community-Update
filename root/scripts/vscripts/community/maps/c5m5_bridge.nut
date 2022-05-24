g_Chapter = "THE PARISH - BRIDGE";

devchap( "ALL MODES" );

PrecacheModel( "models/props_rooftop/acunit01.mdl" );
PrecacheModel( "models/props_rooftop/acvent03.mdl" );

function DoRoundFixes()
{
	make_clip( "_antiboost_finaleskip",		"Survivors",	1, "-216 -295 -96",	"216 330 9001",	"-12017 6306 779" );
	make_clip( "_permstuck_semiwheels",		"Everyone",		1, "-45 -30 -75",	"45 30 75",		"5929 6072 475" );
	make_clip( "_endfence_curvejump",		"Survivors",	1, "-112 -80 -180",	"112 80 2400",	"9552 6640 556" );
	make_clip( "_endfence_commonhop",		"Survivors",	1, "-24 -240 -55",	"24 240 17",	"9480 6320 705" );
	make_clip( "_bunnyhop_fence",			"Survivors",	1, "-68 -71 -163",	"68 80 163",	"-11827 6526 611" );
	make_clip( "_solidify_bridgepier01",	"Everyone",		1, "-42 -280 -8",	"42 280 177",	"-11786 6325 200" );
	make_clip( "_solidify_bridgepier03",	"Everyone",		1, "-42 -280 -8",	"42 280 177",	"-9226 6325 200" );
	make_clip( "_solidify_bridgepier02",	"Everyone",		1, "-42 -280 -8",	"42 280 177",	"-11274 6325 200" );
	make_clip( "_solidify_bridgepier04",	"Everyone",		1, "-42 -280 -8",	"42 280 177",	"-8586 6325 200" );
	make_clip( "_solidify_bridgepier05",	"Everyone",		1, "-42 -280 -8",	"42 280 177",	"-7434 6325 200" );
	make_clip( "_solidify_bridgepier06",	"Everyone",		1, "-42 -280 -8",	"42 280 177",	"-6154 6325 200" );
	make_clip( "_solidify_bridgepier07",	"Everyone",		1, "-42 -280 -8",	"42 280 177",	"-4618 6325 200" );
	make_clip( "_solidify_bridgepier08",	"Everyone",		1, "-42 -280 -8",	"42 280 177",	"-3082 6325 200" );
	make_clip( "_solidify_bridgepier09",	"Everyone",		1, "-42 -280 -8",	"42 280 177",	"-1546 6325 200" );
	make_clip( "_solidify_bridgepier10",	"Everyone",		1, "-42 -280 -8",	"42 280 177",	"-10 6325 200" );
	make_clip( "_solidify_bridgepier11",	"Everyone",		1, "-42 -280 -8",	"42 280 177",	"1526 6325 200" );
	make_clip( "_solidify_bridgepier12",	"Everyone",		1, "-42 -280 -8",	"42 280 177",	"3062 6325 200" );
	make_clip( "_solidify_bridgepier13",	"Everyone",		1, "-42 -280 -8",	"42 280 177",	"3990 6326 200" );
	make_clip( "_solidify_bridgepier14",	"Everyone",		1, "-42 -280 -8",	"42 280 177",	"4599 6326 200" );
	make_clip( "_solidify_bridgepier15",	"Everyone",		1, "-42 -280 -8",	"42 280 177",	"6662 6326 200" );
	make_clip( "_solidify_bridgepier16",	"Everyone",		1, "-42 -280 -8",	"42 280 177",	"7270 6326 200" );
	make_clip( "_solidify_bridgepier17",	"Everyone",		1, "-42 -280 -8",	"42 280 177",	"8694 6326 200" );
	make_clip( "_booster_lighta",			"Survivors",	1, "-55 -55 -17",	"55 55 2121",	"8755 5850 978.9" );
	make_clip( "_booster_fence",			"Survivors",	1, "-99 -99 0",		"99 99 1337",	"8422 5899 831" );
	make_clip( "_booster_generatora",		"Survivors",	1, "-32 -32 -17",	"32 32 2121",	"8362 5702 753" );
	make_clip( "_booster_lightb",			"Survivors",	1, "-55 -55 -17",	"55 55 2121",	"9352 5101 977.9" );
	make_clip( "_booster_lightc",			"Survivors",	1, "-55 -55 -17",	"55 55 2121",	"9670 4237 977.9" );
	make_clip( "_booster_lightd",			"Survivors",	1, "-55 -55 -17",	"55 55 2121",	"9856 3385 962.9" );
	make_clip( "_booster_sign",				"Survivors",	1, "-150 -45 -17",	"150 45 2121",	"9418 3972 798.3" );
	make_clip( "_booster_acunit",			"Survivors",	1, "-35 -65 -17",	"35 65 2121",	"8352 1700 474.9" );
	make_clip( "_booster_rollupdoor",		"Survivors",	1, "-13 -70 0",		"13 70 2121",	"8331 1888 346.3" );
	make_clip( "_booster_generatorb",		"Survivors",	1, "-32 -32 -17",	"32 32 2121",	"8526 3995 485.8" );
	make_clip( "_booster_generatorc",		"Survivors",	1, "-32 -32 -17",	"32 32 2121",	"8245 3460 485.8" );
	make_clip( "_booster_tree",				"Survivors",	1, "-110 -170 -17",	"120 140 2121",	"7975 2389 434" );
	make_clip( "_cliprework_jeepbean",		"Survivors",	1, "-339 -243 0",	"528 260 1258",	"8967 6328 790" );
	make_clip( "_endrubble_smoother",		"Everyone",		1, "-8 -41 0",		"8 38 8",		"8209 6208 456",	"45 0 0" );
	make_clip( "_ramp_smoother",			"Everyone",		1, "-6 -42 0",		"3 42 2",		"8041 4102 180",	"-30 -30 0" );
	make_clip( "_clipextend_endchopper",	"Survivors",	1, "-125 -506 0",	"135 299 1852",	"7383 3797 1199",	"0 25 0" );
	patch_outro( "relay_leave_heli", "ptemplate_finale" );

	if ( g_BaseMode == "versus" )
	{
		devchap( "BASE VERSUS" );

		// FIXES

		make_clip( "_bunnyhop_girder",			"Survivors",	1, "-610 -17 -101",	"40 24 256",	"-5528 6568 860" );
		make_clip( "_solidify_girderleft",		"Survivors",	1, "-500 0 0",		"0 40 50",		"4544 6600 750" );
		make_clip( "_solidify_girderright",		"Survivors",	1, "-500 -40 0",	"0 0 50",		"4544 6050 750" );
		make_clip( "_solidify_stuckwarp1",		"Survivors",	1, "-26 -10 -37",	"61 11 32",		"4152 6617 729" );
		make_clip( "_solidify_stuckwarp2",		"Survivors",	1, "-26 -10 -37",	"61 11 32",		"4152 6034 729" );
		make_clip( "_solidify_stuckwarp3",		"Survivors",	1, "-86 -10 -37",	"15 11 32",		"4502 6034 729" );
		make_clip( "_solidify_stuckwarp4",		"Survivors",	1, "-86 -10 -37",	"15 11 32",		"4502 6617 729" );
		make_clip( "_solidify_alt_girderleft",	"Survivors",	1, "-500 0 0",		"0 40 50",		"7187 6600 750" );
		make_clip( "_solidify_alt_girderright",	"Survivors",	1, "-500 -40 0",	"0 0 50",		"7187 6050 750" );
		make_clip( "_solidify_alt_stuckwarp1",	"Survivors",	1, "-26 -10 -37",	"61 11 32",		"6795 6617 729" );
		make_clip( "_solidify_alt_stuckwarp2",	"Survivors",	1, "-26 -10 -37",	"61 11 32",		"6795 6034 729" );
		make_clip( "_solidify_alt_stuckwarp3",	"Survivors",	1, "-86 -10 -37",	"15 11 32",		"7145 6034 729" );
		make_clip( "_solidify_alt_stuckwarp4",	"Survivors",	1, "-86 -10 -37",	"15 11 32",		"7145 6617 729" );
	}
	if ( g_BaseMode == "survival" )
	{
		devchap( "BASE SURVIVAL" );

		// FIXES

		make_clip( "_survivalbig_skyboxcap",	"Survivors",	1, "-2388 -2396 0",		"1787 2736 32",	"8074 3332 1536" );
		make_clip( "_booster_helipada",			"Survivors",	1, "-1640 -17 -240",	"32 17 2882",	"7481 2202 175" );
		make_clip( "_booster_helipadb",			"Survivors",	1, "-17 -1800 -240",	"17 1240 2882",	"5856 4019 176" );
		make_clip( "_booster_helipadc",			"Survivors",	1, "-1640 -17 -240",	"1240 17 2882",	"7479 5276 176" );
	}

	if ( HasPlayerControlledZombies() )
	{
		make_ladder( "_ladder_endcedatrailer_cloned_endchainlink", "9271.145 4057.18 273.355", "2143 -5517 15", "0 28.54 0", "-0.82 -0.56 0" );
		make_ladder( "_ladder_endlosfence_cloned_backnodraw", "10073.0508 2663.2498 380.7315", "-2019 6285 -111", "0 -35 0", "0.91 -0.4 0" );
		make_ladder( "_ladder_finalsidehouse_cloned_finalrungs", "9310.49 3329.52 330", "7740 -5532 87", "0 56 0", "-0.49 -0.86 0" );
		make_ladder( "_ladder_forconsistencysake_cloned_firstscaffrightback", "1027 6081.5 640", "-3583 -6 0" );
		make_ladder( "_ladder_slantedbridgeup_cloned_farendfence", "9514.01 6428.48 528", "-4906 152 200" );
		make_prop( "dynamic", "_solidify_finalsidehouse_acunit", "models/props_rooftop/acunit01.mdl", "10092.1 4520.26 491", "0 150 0", "shadow_no" );
		make_prop( "dynamic", "_solidify_finalsidehouse_acvent", "models/props_rooftop/acvent03.mdl", "10185.5 4360.08 594", "0 150 0", "shadow_no" );
		patch_ladder( "9271.145 4057.18 273.355", "0 0 0", "-1 0 0" );
	}
}

function DoTankWarp( hndTank )
{
	// Move all bridge Tank spawns a bit further down the bridge to discourage rushing.

	if ( CheckToWarpTank( hndTank, [-1450, 5955, -100, 6705] ) )
	{
		hndTank.SetOrigin( Vector( 830, 6328, 792 ) );
	}
	else if ( CheckToWarpTank( hndTank, [-100, 5955, 2000, 6705] ) )
	{
		hndTank.SetOrigin( Vector( 2720, 6338, 792 ));
	}
	else if ( CheckToWarpTank( hndTank, [2000, 5955, 4740, 6705] ) )
	{
		hndTank.SetOrigin( Vector( 4285, 6325, 792 ) );
	}
}