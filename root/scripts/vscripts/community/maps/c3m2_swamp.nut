g_Chapter = "SWAMP FEVER - SWAMP";

devchap( "ALL MODES" );

PrecacheModel( "models/props_crates/static_crate_40.mdl" );
PrecacheModel( "models/props_highway/corrugated_panel_damaged_01.mdl" );
PrecacheModel( "models/props_foliage/swamp_fallentree01_bare.mdl" );
PrecacheModel( "models/props_foliage/urban_tree_giant01.mdl" );

function DoRoundFixes()
{
	// This map is clipped like a tunnel. No known gamebreaking exploits.

	make_clip( "_boat_smoother", "Everyone", 1, "-16 -24 0", "16 24 30", "-7863 5391 -8", "-10 -30 0" );
	make_clip( "_permstuck_behindrocks", "Everyone", 1, "-14 -40 -24", "14 40 24", "-5326 5524 16" );
	make_clip( "_permstuck_cypressknees", "Everyone", 1, "-1 -1 -25", "1 1 25", "-4399 3202 9" );

	if ( g_BaseMode == "versus" )
	{
		devchap( "BASE VERSUS" );

		// FIXES

		make_clip( "_brokenhouse_hedgegap", "Survivors", 1, "-68 -468 0", "98 257 502", "3915 2029 145", "0 -11 0" );

		con_comment( "LOGIC:\tAnti-skip plane clips will be deleted when door is blown." );

		make_clip( "_cabin_door_button_a", "Survivors", 1, "-138 -176 -13", "138 372 444", "-1932 3700 196", "0 28 0" );
		make_clip( "_cabin_door_button_b", "Survivors", 1, "-147 -434 -70", "138 404 444", "-1888 3079 226" );
		make_clip( "_cabin_door_button_c", "Survivors", 1, "-112 -516 -30", "108 431 521", "-1622 2298 162", "0 28 0" );
		make_clip( "_commentary_planeclimb_a", "Survivors", 1, "-29 -3 -44", "29 3 44", "-1931 2612 124" );
		make_clip( "_commentary_planeclimb_b", "Survivors", 1, "-36 -14 -44", "36 14 44", "-1908 2578 124", "0 300 0" );
		EntFire( "Blow_door", "AddOutput", "OnTrigger " + g_UpdateName + "_cabin_door_button*:Kill::0:-1" );
	}

	if ( HasPlayerControlledZombies() )
	{
		make_brush( "_losfix_end_gen1",		"-20 -1 -8",	"20 1 8",	"8011 2779 128" );
		make_brush( "_losfix_end_gen2",		"-1 -13 -8",	"1 12 8",	"8007 2793 128" );
		make_clip( "_propladder_crate_qol", "SI Players", 1, "-36 -2 -8", "44 4 8", "8055 100 166", "0 27 0" );
		make_clip( "_commentary_clipgap_postcrash", "Everyone", 1, "0 0 0", "280 96 660", "31.0388 1957.69 -14.6749" );
		make_ladder( "_ladder_brokenhomeleft_cloned_airplanewingmini", "-1690.5 2951.13 38.3488", "-2031 6319 98", "0 93.74 0", "1 0 0" );
		make_ladder( "_ladder_brokenhomeright_cloned_airplanewingmini", "-1690.5 2951.13 38.3488", "-2030.5 6344 98", "0 93.74 0", "1 0 0" );
		make_ladder( "_ladder_corrugatedhome_cloned_airplaneleft", "-2060 3278 96", "3919.22 26.78 66" );
		make_ladder( "_ladder_crashedplanetail_cloned_crashedplaneright", "-2060.0002 2942.0005 102", "1558 994 -28", "0 33.5 0", "-0.83 -0.55 0" );
		make_ladder( "_ladder_endbarricadeleft1_cloned_airplaneleft", "-2060 3278 96", "4933 -1163 88", "0 -100 0", "0.17 0.98 0" );
		make_ladder( "_ladder_endbarricadeleft2_cloned_airplaneleft", "-2060 3278 96", "4955 -1167 88", "0 -100 0", "0.17 0.98 0" );
		make_ladder( "_ladder_endbarricaderight1_cloned_airplaneleft", "-2060 3278 96", "4779 -1165 88", "0 -100 0", "0.17 0.98 0" );
		make_ladder( "_ladder_endbarricaderight2_cloned_airplaneleft", "-2060 3278 96", "4757 -1161 88", "0 -100 0", "0.17 0.98 0" );
		make_ladder( "_ladder_endfence_cloned_airplaneleft", "-2060 3278 96", "9772 -3705 32" );
		make_ladder( "_ladder_finalhome_cloned_airplaneleft", "-2060 3278 96", "4610 4959 -25", "0 180 0", "1 0 0" );
		make_prop( "dynamic",		"_propladder_endcratea",	"models/props_crates/static_crate_40.mdl",	"8045 79 118.63",		"0 221.5 0",		"shadow_no" );
		make_prop( "dynamic",		"_propladder_endcrateb",	"models/props_crates/static_crate_40.mdl",	"8083 102 118.63",		"0 297 0",		"shadow_no" );
		make_prop( "dynamic", "_ladder_corrugatedhome_panel", "models/props_highway/corrugated_panel_damaged_01.mdl", "1855 3334 82", "80 180 2", "shadow_no" );
		make_prop( "physics",	"_hittable_fallentree",	"models/props_foliage/swamp_fallentree01_bare.mdl",	"3225 1879 1",		"0 -34 0" );
		make_prop( "dynamic", "_propladder_endsaferoof1", "models/props_crates/static_crate_40.mdl", "7777 -603 126", "0 0 0", "shadow_no" );
		make_prop( "dynamic", "_propladder_endsaferoof2", "models/props_crates/static_crate_40.mdl", "7775 -646 126", "0 -83 0", "shadow_no" );
		make_prop( "dynamic", "_propladder_endsaferoof3", "models/props_crates/static_crate_40.mdl", "7775 -646 166", "0 -187 0", "shadow_no" );
		make_prop( "dynamic", "_solidify_endtreegiant", "models/props_foliage/urban_tree_giant01.mdl", "7849 -791 126.481", "0 203.16 0", "shadow_no" );
	}
}