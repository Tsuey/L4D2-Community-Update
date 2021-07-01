g_Chapter = "DEATH TOLL - THE TURNPIKE";

devchap( "ALL MODES" );

// FIXES_ALL

make_clip(	"_dispcrouch_hardone",		"Everyone",	1,	"-30 -216 -17",		"32 145 180",		"-11790 -12821 -65" );
make_clip(	"_booster_funnel",		"Survivors",	1,	"-32 -32 -64",		"32 32 365",		"-12976 -12262 100" );
make_clip(	"_curvejump_rocky",		"Survivors",	1,	"-32 -128 -80",		"32 128 1001",		"-13152 -11044 60.6" );
make_clip(	"_cliprework_hillside01",	"Survivors",	1,	"-121 -690 -136",	"1456 667 777",		"-11849.1 -10286.1 504.3" );
make_clip(	"_cliprework_hillside02",	"Survivors",	1,	"-264.5 -483 -519.5",	"264.5 483 519.5",	"-10597.5 -10811 848.5" );
make_clip( "_unattackable_tunnelsolidify", "Survivors", 1, "-625 -77 -144", "415 67 784", "-12367 -9747 496" );
make_clip( "_dispcrouch_popular", "Everyone", 1, "-9 -136 0", "8 112 106", "-10569 -11466 -510", "0 28 0" );
make_clip( "_dispcrouch_unknown", "Everyone", 1, "-77 -17 0", "77 11 122", "-10812 -11821 -507", "0 -8 0" );
make_clip( "_dispcrouch_endarea", "Everyone", 1, "-74 -32 -64", "204 42 90", "-11880 -6636 -24", "0 -36 0" );
make_clip( "_cliprework_dispcrouch_1a", "Survivors", 1, "-478 -120 -50", "563 -17 1138", "-13714 -12191 142", "0 -6 0" );
make_clip( "_cliprework_dispcrouch_1b", "Everyone", 1, "-478 -120 -650", "563 -17 -170", "-13714 -12191 142", "0 -6 0" );
make_clip( "_cliprework_dispcrouch_2a", "Survivors", 1, "-478 -120 -50", "563 -17 1138", "-14360 -11744 142", "0 -55 0" );
make_clip( "_cliprework_dispcrouch_2b", "Everyone", 1, "-478 -120 -650", "563 -17 -170", "-14360 -11744 142", "0 -55 0" );
make_clip( "_cliprework_dispcrouch_endarea1", "Everyone", 1, "-448 -55 0", "288 116 182", "-11066 -5132 -84" );
make_clip( "_cliprework_dispcrouch_endarea2", "Everyone", 1, "-98 -16 -90", "304 16 82", "-10896 -5942 5", "0 -7 0" );
make_clip( "_permstuck_endrocktree", "SI Players", 1, "-98 -16 -100", "18 16 17", "-10228 -5209 388", "0 18 0" );
make_clip( "_permstuck_endrockcorner", "Everyone", 1, "-8 -79 -186", "95 130 174", "-11277 -6770 193", "0 -35 0" );
make_clip( "_dispcrouch_endrocktinytop", "Everyone", 1, "-8 -37 0", "8 121 148", "-11216 -6525 62" );
make_clip( "_dispcrouch_endrockparkour", "Everyone", 1, "-8 -116 0", "8 56 115", "-12284 -6439 147", "0 9 0" );

// Not confirmed canon -- but probably.

make_prop( "dynamic", "_crashcourse_armoredvan_glass", "models/props_vehicles/deliveryvan_armored_glass.mdl", "-11274 -15292 -150.2", "14.32 90 -5.15", "shadow_no" );
make_prop( "dynamic", "_crashcourse_armoredvan", "models/props_vehicles/deliveryvan_armored.mdl", "-11274 -15292 -150.2", "14.32 90 -5.15" );

if ( g_BaseMode == "coop" || g_BaseMode == "realism" )
{
	devchap( "BASE COOP" );

	// FIXES

}
if ( g_BaseMode == "versus" )
{
	devchap( "BASE VERSUS" );

	// FIXES

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