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

if ( HasPlayerControlledZombies() )
{
    kill_funcinfclip( 698.195 );		// Delete clip directly above bridge tunnel entrance, then patch in exploits created
    kill_funcinfclip( 1086.93 );		// Delete clip on tunnel entrance side of the hill
    kill_funcinfclip( 1105.65 );		// Delete clip on overpass side of the hill
    make_brush( "_losfix_semi",		"-50 -1 -15",	"50 1 15",	"-12260 -11102 -49" );
    make_brush( "_losfix_earlyvan",		"-48 -1 -8",	"48 1 8",	"-12318 -8360 -56" );
    make_brush( "_losfix_latevan1",		"-1 -45 -8",	"0 45 18",	"-12951 -6686 -56" );
    make_brush( "_losfix_latevan2",		"-45 -1 -8",	"45 0 18",	"-12997 -6640 -56" );
    make_clip( "_ladder_bridgetunnel_backboard", "Everyone", 1, "-248 -10 -84", "308 6 48", "-12348 -9814 272" );
    make_clip( "_ladder_bridgetunnel_clip", "Everyone", 1, "-8 -8 0", "22 3 74", "-12617 -9856 -50", "0 21 0" );
    make_clip( "_meticulous_funcinfclip01", "SI Players", 1, "-415 -16 0", "401 45 782", "-12353 -9664 496" );
    make_clip( "_meticulous_funcinfclip02", "SI Players", 1, "-8 -420 -128", "45 550 782", "-11980 -9735 496" );
    make_clip( "_meticulous_funcinfclip03", "SI Players", 1, "-8 -89 0", "45 55 782", "-12031 -9735 496" );
    make_clip( "_meticulous_funcinfclip04", "SI Players", 1, "-38 -16 -144", "218 16 782", "-12975 -9745 496", "0 23 0" );
    make_clip( "_yesdrawcliff_clip1", "SI Players", 1, "-510 -17 -128", "464 17 782", "-11472 -10279 496", "0 -11 0" );
    make_clip( "_yesdrawcliff_clip2", "SI Players", 1, "-510 -17 -128", "464 17 782", "-10881 -10752 496", "0 108 0" );
    make_ladder( "_ladder_bridgetunnelB1_cloned_endfencedumpster", "-12168 -5667 -12", "-467 -4199 22" );
    make_ladder( "_ladder_bridgetunnelB2_cloned_endfencesafehouse", "-10352 -4599 677.106", "-2912 -5267 -3532", "17 0 0" );
    make_ladder( "_ladder_bridgetunnelT_cloned_firsttunnelhole", "-12352 -8413 56", "-115 -1411 320" );
    make_ladder( "_ladder_trafficlightB_cloned_secondtunnelhole", "-13047.5 -6072 56", "-14008 4027 3239", "-16 72 -3", "0.32 0.95 0" );
    make_ladder( "_ladder_trafficlightT_cloned_secondtunnelhole", "-13047.5 -6072 56", "-14053 3927 3628", "-16.8 72 -3", "0.32 0.95 0" );
    make_prop( "dynamic", "_bridgetunnel_wrongway", "models/props_misc/wrongway_sign01_optimized.mdl", "-11988 -9752 544", "0 180 0", "shadow_no", "solid_no", "255 255 255", "17", "217" );
    make_prop( "dynamic", "_yesdrawcliff_rocks1", "models/props_wasteland/rock_cliff01.mdl", "-11723 -9966 520", "0 273 0", "shadow_no" );
    make_prop( "dynamic", "_yesdrawcliff_rocks2", "models/props_wasteland/rock_cliff01.mdl", "-11429 -10350 520", "0 0 0", "shadow_no" );
    make_trigmove( "_duckqol_trafficlight", "Duck", "-8 -8 -32", "8 16 32", "-12158 -9866 60" );
}