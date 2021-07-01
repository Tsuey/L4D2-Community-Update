g_Chapter = "DEAD AIR - THE TERMINAL";

devchap( "ALL MODES" );

// FIXES_ALL

make_clip(	"_conveyorvent_upper",		"Survivors",	1,	"-8 -32 -32",		"8 32 32",		"632 928 368" );
make_clip(	"_conveyorvent_lower",		"Survivors",	1,	"0 -32 -32",		"8 32 32",		"712 928 160" );
make_clip(	"_permstuck_ladderqol",		"SI Players",	1,	"-21 -21 -12",		"21 21 12",		"580 3565 524" );
make_clip(	"_booster_atlaswon",		"Survivors",	1,	"-600 -600 0",		"600 600 8",		"1978.4 1555.4 448" );
make_clip(	"_booster_drophole",		"Survivors",	1,	"-120 -190 0",		"120 24 8",		"-15 5336 512" );
make_clip(	"_booster_barbyoutcrop",	"Survivors",	1,	"-105 -38 0",		"24 38 400",		"302 4460 488" );
make_clip(	"_booster_skylight",		"Survivors",	1,	"-420 -700 0",		"420 700 216",		"-39 4459 763" );
make_clip(	"_booster_vent",		"Survivors",	1,	"-42 -24 -29",		"254 24 31",		"386 4112 241" );
make_clip(	"_booster_bannerb",		"Survivors",	1,	"-42 -2 -32",		"42 2 256",		"-200 4163 600" );
make_clip(	"_booster_bannera",		"Survivors",	1,	"-42 -2 -32",		"42 2 365",		"-200 4674 472" );
make_clip(	"_booster_pipea",		"Survivors",	1,	"-11 -7 -32",		"24 24 216",		"302 5096 519" );
make_clip(	"_booster_pipeb",		"Survivors",	1,	"-12 -7 -32",		"24 29 216",		"302 3801 519" );
make_clip( "_chairbodypile_smoother", "Everyone", 1, "-50 -25 0", "25 40 8", "500 5301 295", "10 0 -15" );
make_clip( "_hallwayguard_right", "Everyone", 1, "-14 15 0", "9 16 128", "693 5566.3 296", "0 45 0" );
make_clip( "_hallwayguard_left", "Everyone", 1, "-9 16 0", "14 15 128", "667.5 5679.3 296", "0 -45 0" );

make_prop( "dynamic", "_cosmetic_wallpaper", "models/props_unique/zombiebreakwallexteriorairport01_main.mdl", "2507.95 3263.99 216", "0 180 0", "shadow_no" );
make_prop( "dynamic", "_cosmetic_wallblock", "models/props_unique/zombiebreakwallhospitalexterior01_main.mdl", "2507.99 3263.99 252", "0 180 0", "shadow_no" );
EntFire( g_UpdateName + "_cosmetic_wallblock", "Skin", 5 );

// These are parented so it's necessary to fix func_rotating first then beam_spotlight.

con_comment( "LIGHTS:\tMetal detector spotlight was never moved for L4D2's port -- but it's fixed now!" );

EntFire( "securityrotator1",	"AddOutput",	"origin 1025.7 1750.9 125.456",		0 );
EntFire( "securityspotlight1",	"AddOutput",	"origin 1025.7 1750.9 125.456",		1 );

if ( g_BaseMode == "coop" || g_BaseMode == "realism" )
{
	devchap( "BASE COOP" );

	// FIXES

    patch_spawninfront( "2552 4080 152", "0 -16 0", "614 16 244" );

}
if ( g_BaseMode == "versus" )
{
	devchap( "BASE VERSUS" );

	// FIXES

    patch_spawninfront( "2552 4080 152", "0 -16 0", "614 16 244" );

    make_clip( "_altpath_escalator", "Survivors", 1, "-37 -6 -35", "25 6 175", "2289 1737 51", "0 0 -2.5" );

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