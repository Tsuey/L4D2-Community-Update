g_Chapter = "SWAMP FEVER - PLANK COUNTRY";

devchap( "ALL MODES" );

// FIXES_ALL

make_clip(	"_hedge_behindtrains",		"Survivors",	1,	"-532 -120 0",		"800 58 701",		"-11078 8237 320" );
make_clip(	"_commonhop_crossing",		"Survivors",	1,	"-99 -260 0",		"99 426 691",		"-1025 4859 332" );
make_clip(	"_clipgap_fence",		"Survivors",	1,	"-4 -124 -155",		"4 124 155",		"-11084 7220 428" );
make_clip(	"_permstuck_coolingtank",	"Everyone",	1,	"-62 -58 -56",		"21 21 56",		"-10754 8610 216" );
make_clip( "_commonhop_coolingtank", "Survivors", 1, "-74 -236 0", "70 156 880", "-6806 7572 144" );
make_clip( "_booster_treetop", "Survivors", 1, "-108 -186 0", "108 174 717", "-5696 7348 247" );
make_clip( "_chargerassist_trainwheel", "Survivors", 1, "-133 -444 -130", "28 131 765", "-12379 8416 259", "0 -19 0" );
make_clip( "_chargerassist_fenceladdy", "Survivors", 1, "-94 0 -41", "88 11 952", "-6248 5650 72" );
make_clip( "_cliprework_garage", "Survivors", 1, "-558 -274 0", "483 270 536", "-11106 10498 488" );
make_clip( "_cliprework_house", "Survivors", 1, "-259 -526 0", "257 530 704", "-11343 7758 320" );
make_clip( "_fallenlog_shrub_survivor", "Survivors", 1, "-182 -383 -99", "27 142 941", "560 9614 83", "0 19 0" );
make_clip( "_fallenlog_shrub_infected", "SI Players and AI", 1, "-182 -383 -99", "27 142 61", "560 9614 83", "0 19 0" );
make_clip( "_chargerassist_commonhop1", "Survivors", 1, "-155 -16 0", "117 5 864", "-7093 6280 160" );
make_clip( "_chargerassist_commonhop2", "Survivors", 1, "-49 -170 0", "63 134 864", "-7093 6452 160", "0 -3 0" );
make_clip( "_booster_powerpole", "Survivors", 1, "-9 -8 0", "9 10 582", "-7630 6718 444" );
patch_ladder( "-6084.5 6272 90", "6 0 0" );

// Tsuey's note: Special thanks to the person who originally complained
// on the Steam Forums that there weren't any gators -- I'm unable to
// re-find your thread. Special thanks to Rise for naming him Fred; we
// can't spell Friend without it. Left4Facts Discord btw. :fred:

make_prop( "dynamic", "_fred", "models/props_fairgrounds/alligator.mdl", "-5274 7386 -19", "0 150 0", "shadow_no", "solid_no" );

// Allow only SI Players to stand on it while maintaining its non-solidity
// because it'd be inhumane for Survivors to put bullet holes on him. Also
// prevents Fred from becoming a godspot.

make_clip( "_fred_collision", "SI Players", 1, "-3.6 -17 0", "3.6 16 3", "-5274 7386 -17", "0 150 0" );

// Incrementally "bites" both Spawned and Ghost SI. Doesn't damage Survivors
// but it's difficult to even reach it without hanging and we dare not move
// him. Does 120 DPS, 60 per hit, or something. It's a trigger_hurt_ghost.

make_trighurt( "_fred_pain_cuddles", "Ghost", "-4 -4 -4", "4 4 4", "-5280 7375 -12" );
EntFire( g_UpdateName + "_fred_pain_cuddles", "SetDamage", 120 );

if ( g_BaseMode == "versus" )
{
	devchap( "BASE VERSUS" );

	// FIXES

    make_clip(	"_cliprework_jonesroof",	"Survivors",	1,	"-276 -296 -396",	"276 296 396",		"-8304 7216 628" );

}
if ( g_BaseMode == "survival" )
{
	devchap( "BASE SURVIVAL" );

	// FIXES

    make_clip( "_survivalcrit_bayouboost", "Survivors", 1, "-64 -351 0", "-2 321 1045", "-4358 6079 -21" );
    make_clip( "_survival_brushextenda", "Survivors", 1, "-674 -60 0", "400 160 717", "-7967 7806 308" );
    make_clip( "_survival_brushextendb", "Survivors", 1, "-224 4 0", "236 594 717", "-8832 7232 336" );
    make_clip( "_survival_brushextendc", "Survivors", 1, "-289 -16 0", "439 20 717", "-9471 7496 384" );
    make_clip( "_nav_pubsign", "Survivors", 1, "-4 -34 0", "4 31 822", "-7264 7167 202" );
    make_clip( "_nav_trailertree", "Survivors", 1, "-48 -26 0", "78 36 742", "-7742 7721 287" );

}