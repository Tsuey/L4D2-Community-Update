g_Chapter = "THE PARISH - WATERFRONT";

devchap( "ALL MODES" );

PrecacheModel( "models/props/cs_militia/boxes_garage_lower.mdl" );
PrecacheModel( "models/props_highway/plywood_01.mdl" );
PrecacheModel( "models/props_swamp/plank001b_192.mdl" );
PrecacheModel( "models/props_downtown/gutter_downspout_straight01.mdl" );
PrecacheModel( "models/props_street/trashbin01.mdl" );
PrecacheModel( "models/props/cs_italy/it_mkt_table2.mdl" );
PrecacheModel( "models/props/cs_militia/newspaperstack01.mdl" );
PrecacheModel( "models/props/cs_militia/boxes_frontroom.mdl" );

function DoRoundFixes()
{
	make_clip(	"_vuln_balconya",		"Survivors",	1,	"-48 -192 -76",		"48 192 76",		"-720 -128 -140" );
	make_clip(	"_vuln_balconyb",		"Survivors",	1,	"-48 -256 -253",	"48 256 253",		"-1136 -512 196" );
	make_clip(	"_vuln_balconyc",		"Survivors",	1,	"0 0 0",		"65 256 150",		"-737 -2048 -208" );
	make_clip(	"_vuln_balconyd",		"Survivors",	1,	"-518 -64 0",		"0 0 320",		"-687 -2304 -176" );
	make_clip(	"_skybox_shielda",		"SI Players",	1,	"-64 -6 0",		"64 6 20",		"-384 -2054 124" );
	make_clip(	"_skybox_shieldd",		"SI Players",	1,	"-21 -252.5 -147",	"21 252.5 147",		"-3948 257 130" );
	make_clip(	"_skybox_shieldb",		"SI Players",	1,	"-277 -115 -138",	"283 115 100",		"-1543.5 -1855.5 249.6" );
	make_clip(	"_skybox_shieldc",		"SI Players",	1,	"-145 -212 -19",	"165 212 77",		"-2971 -1264 125" );
	make_clip(	"_signhop_awning",		"Survivors",	1,	"-55 -320 -80",		"55 320 216",		"-3088 -250 -70.5" );
	make_clip(	"_cliprework_roofandwindows",	"Survivors",	1,	"-53 -256 0",		"723 256 365",		"-3279 -819 -140.6" );
	make_clip(	"_nav_jukebox",			"Survivors",	1,	"-20 -14 -88",		"20 14 88",		"-1492 -1685 -287" );
	make_clip(	"_nav_outhouse",		"Survivors",	1,	"0 0 -30",		"60 50 50",		"-970.4 -2352 -221.7" );
	make_clip(	"_nav_bienlamps",		"Survivors",	1,	"-32 -75 0",		"6 75 330",		"-664 -835 -184" );
	make_clip( "_rampstep_smoother", "Everyone", 1, "-40 -5 0", "40 1 3", "776 44 -374", "0 0 45" );
	make_clip( "_nav_electricalbox", "Survivors", 1, "-35 -4 0", "28 3 576", "-1392 -252 -374" );
	make_clip( "_cliprework_balconya", "Survivors", 1, "-398 -54 -17", "269 44 278", "-2700 -2346 -157" );
	make_clip( "_cliprework_balconyb", "Survivors", 1, "-161 -47 0", "186 50 340", "-2937 -2098 -216" );
	make_clip( "_cliprework_huntergap", "SI Players", 1, "-136 0 0", "136 17 32", "-40 1408 80" );
	make_clip( "_permstuck_dropbehindfence", "Everyone", 1, "-226 -7 -104", "294 41 177", "-982 -2793 144" );
	make_clip( "_cliprework_unattackable", "Survivors", 1, "-802 -203 0", "558 213 832", "-2446 299 -376" );
	make_clip( "_ledgehang_startfenceleft", "Survivors", 1, "-16 -48 0", "10 48 379", "589 -142 -251", "0 29 0" );
	make_clip( "_ledgehang_startfenceright", "Survivors", 1, "-8 -24 0", "8 24 360", "599 45 -232", "0 -15 0" );
	make_clip( "_commentary_shortcut_forsale_a", "Survivors", 1, "-4 -128 -209", "4 128 209", "-1700 -128 -35" );
	make_clip( "_commentary_shortcut_forsale_b", "Survivors", 1, "0 0 0", "128 128 128", "-2140 -288 -294.972" );
	make_clip( "_commentary_nav_bienville_windows", "Survivors", 1, "-4 -384 -80", "6 512 256", "-662 -880 -100.086" );
	make_clip( "_commentary_clipgap_redhouse", "Survivors", 1, "0 0 0", "48 48 128", "-3136 464 -264.871" );
	make_clip( "_commentary_electricalbox", "Survivors", 1, "-24 -8 -80", "24 8 384", "-3832 -1144 -250" );
	make_clip( "_commentary_clipgap_endsaferoom_a", "Survivors", 1, "-360 -48 -72", "360 48 72", "-3316 -1280 64" );
	make_clip( "_commentary_clipgap_endsaferoom_b", "Survivors", 1, "-290 -144 -72", "290 144 72", "-3966 -1296 64" );
	make_clip( "_commentary_clipgap_endfence", "Survivors", 1, "-176 -32 -256", "176 32 256", "-4079 -1120 -120" );

	if ( g_BaseMode == "versus" )
	{
		devchap( "BASE VERSUS" );

		// FIXES

		make_clip(	"_clipgap_fence",		"Survivors",	1,	"-32 -12 -82",		"32 12 82",		"-1740 -1284 -134" );
	}

	if ( HasPlayerControlledZombies() )
	{
		make_brush( "_losfix_bus",		"-1 -96 -14",	"1 128 14",	"-868 -1515 -363" );
		make_brush( "_losfix_van",		"-100 -1 -12",	"100 1 12",	"-918 -1852 -365" );
		make_clip( "_ladder_endbluehouse_clip", "Everyone", 1, "-2 -8 -160", "2 8 160", "-3805 52.25 -200", "0 45 0" );
		make_clip( "_ladder_endgutterm2mirr_clip", "Everyone", 1, "-4.09 -13 0", "0 23 338", "-3196 -1079 -376" );
		make_ladder( "_ladder_backpropladder_cloned_waterfrontfence", "-920 438 -304", "-367 -2821 -8" );
		make_ladder( "_ladder_bienville_cloned_brickgutter", "-2086 -1984 -216", "1428 1278 -93" );
		make_ladder( "_ladder_boothwindow_cloned_whitetablepath", "-2566 -1272 -284", "-572 -4931 0", "0 -90 0", "0 1 0" );
		make_ladder( "_ladder_endbluehouse_cloned_waterfrontbrick", "-192 78.0956 -216", "-3879 -161 16", "0 270 0", "1 0 0" );
		make_ladder( "_ladder_endgutterm2mirr_cloned_telephonegutter", "-1236 -1274 -213.5", "-4452 -2337 -24", "0 -180 0", "0 -1 0" );
		make_ladder( "_ladder_kitchenelecbox_cloned_telephonegutter", "-1236 -1274 -213.5", "-3305 550 -109", "0 90 0", "-1 0 0" );
		make_ladder( "_ladder_kitchenwindow_cloned_telephonegutter", "-1236 -1274 -213.5", "-1282 -1900 -135", "0 -90 0", "1 0 0" );
		make_ladder( "_ladder_startroofqol_cloned_whitetablepath", "-2566 -1272 -284", "1853 -2855 -5", "0 -90 0", "0 1 0" );
		make_ladder( "_ladder_startwtflongright_cloned_startwtflongleft", "118 912 -392", "3 -661 0" );
		make_ladder( "_ladder_tankwaterfront_cloned_telephonegutter", "-1236 -1274 -213.5", "-1936 888 0", "0 90 0", "-1 0 0" );
		make_ladder( "_ladder_yellowbarriersroof_cloned_alleygutter", "-2086 -1984 -216", "-2639 27 18", "0 90 0", "0 -1 0" );
		make_ladder( "_ladder_permstuck_endsaferoom", "-2566 -1272 -284", "-1347 153 -28" );
		make_prop( "dynamic",		"_losblocker_boxes",		"models/props/cs_militia/boxes_garage_lower.mdl",	"-26 -1108 -375.742",		"0 135.5 0",		"shadow_no" );
		make_prop( "dynamic",		"_propladder_planka",		"models/props_highway/plywood_01.mdl",		"-167 -48 -195.766",		"-34 0.6025 -0.3587" );
		make_prop( "dynamic",		"_propladder_plankb",		"models/props_swamp/plank001b_192.mdl",		"-2176 -2538 -320",		"0 0 35" );
		make_prop( "dynamic", "_ladder_endgutterm2mirr_pipe", "models/props_downtown/gutter_downspout_straight01.mdl", "-3216 -1056 -89", "0 270 0", "shadow_no" );
		make_prop( "dynamic", "_ladder_endgutterbluehouse_pipe", "models/props_downtown/gutter_downspout_straight01.mdl", "-3808 31 -55", "0 0 0", "shadow_no" );
		make_prop( "dynamic", "_ladder_startroofqol_pipe", "models/props_downtown/gutter_downspout_straight01.mdl", "580 -308 -222", "0 90 0", "shadow_no" );
		make_prop( "dynamic", "_commentary_propladder_wall_table", "models/props/cs_italy/it_mkt_table2.mdl", "-1740 -2426 -324", "0 270 84", "shadow_no", "solid_yes", "255 255 255", "800", "600" );
		make_prop( "dynamic", "_commentary_propladder_wall_newspapers", "models/props/cs_militia/newspaperstack01.mdl", "-1730 -2431 -312.199", "0 0 0", "shadow_no", "solid_yes", "255 255 255", "800", "600" );
		make_prop( "dynamic", "_commentary_propladder_wall_boxes", "models/props/cs_militia/boxes_frontroom.mdl", "-1716 -2447 -376", "0 0 0", "shadow_no", "solid_yes", "255 255 255", "800", "600" );
		patch_ladder( "-2592 -1030 -208", "12 -3 0" );

		con_comment( "PROP:\tTrashbin near \"_ladder_endbluehouse\" moved to improve accessibility." );

		kill_entity( Entities.FindByClassnameNearest( "prop_physics", Vector( -3785, 22, -375.624 ), 8 ) );
		make_prop( "physics", "_replacement_trashbin", "models/props_street/trashbin01.mdl", "-3781 118 -376", "0 17 0" );
	}
}

function DoMapSpawnFixes()
{
	if ( HasPlayerControlledZombies() )
	{
		patch_nav_checkpoint( "-3764 -1224 -344" );
	}
}