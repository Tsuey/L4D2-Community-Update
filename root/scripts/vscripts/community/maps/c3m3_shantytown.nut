g_Chapter = "SWAMP FEVER - SHANTY TOWN";

devchap( "ALL MODES" );

PrecacheModel( "models/props_crates/static_crate_40.mdl" );
PrecacheModel( "models/props_update/c3m3_nodrawfence.mdl" );
PrecacheModel( "models/props_canal/boat001a.mdl" );
PrecacheModel( "models/props_canal/boat001a_chunk01.mdl" );
PrecacheModel( "models/props_canal/boat001a_chunk02.mdl" );
PrecacheModel( "models/props_canal/boat001a_chunk03.mdl" );
PrecacheModel( "models/props_canal/boat001a_chunk04.mdl" );
PrecacheModel( "models/props_canal/boat001a_chunk05.mdl" );
PrecacheModel( "models/props_canal/boat001a_chunk06.mdl" );
PrecacheModel( "models/props_canal/boat001a_chunk07.mdl" );
PrecacheModel( "models/props_canal/boat001a_chunk08.mdl" );
PrecacheModel( "models/props_canal/boat001a_chunk09.mdl" );
PrecacheModel( "models/props_canal/boat001a_chunk010.mdl" );
PrecacheModel( "models/props_foliage/swamp_fallentree01_bare.mdl" );

function DoRoundFixes()
{
	make_clip(	"_endhaybails_collision",	"SI Players and AI",	1,	"-42 -66 -24",		"42 66 24",		"5126 -3967 378" );
	make_clip(	"_permstuck_fridge",		"Everyone",	1,	"-12 -10 -73",		"12 50 0",		"-3791 -2972 136" );
	make_clip( "_trailerhouse_smoother1", "Everyone", 1, "-8 -213 0", "25 219 14", "-3294 -324 -8", "45 15 0" );
	make_clip( "_trailerhouse_smoother2", "Everyone", 1, "-8 -33 0", "25 59 14", "-3298 -549 -8", "45 -75 0" );
	make_clip( "_permstuck_cypressknees_a", "Everyone", 1, "-1 -3 -29", "1 3 29", "-702 -2870 14" );
	make_clip( "_permstuck_cypressknees_b", "Everyone", 1, "-8 -12 -32", "8 12 32", "-1176 -4650 12" );
	make_clip( "_skyboxshield_endsafehouse", "SI Players", 1, "-185 -50 -40", "183 50 82", "5067 -3777 552" );

	make_prop( "dynamic", "_permstuck_cratebot", "models/props_crates/static_crate_40.mdl", "-3749.85 -183.67 -3.164", "0 0 0" );
	make_prop( "dynamic", "_permstuck_cratetop", "models/props_crates/static_crate_40.mdl", "-3749.85 -182.67 36.837", "0 -30 0" );

	make_trigmove( "_antistuck_crouch1", "Duck", "-186.0 -70.0 -30.0", "186.0 70.0 30.0", "-4333.0 -2855.0 16.9" );
	make_trigmove( "_antistuck_crouch2", "Duck", "-65 -30 -30", "65 30 30", "-4875 -2730 18.5" );
	make_trigmove( "_antistuck_crouch3", "Duck", "-26 -69 -30", "26 69 30", "-3691 -3155 16.5" );
	make_trigmove( "_antistuck_crouch4", "Duck", "-12.5 -2 -30", "12.5 2 30", "-5233.5 -3123 21.8" );
	make_trigmove( "_antistuck_crouch5", "Duck", "-29.5 -7.5 -30.0", "29.5 7.5 30.0", "-2652.5 -1078.5 13.0" );
	make_trigmove( "_antistuck_crouch6", "Duck", "-53.0 -47.0 -30.0", "53.0 47.0 30.0", "-2746.0 -1271.0 21.0" );
	make_trigmove( "_antistuck_crouch7", "Duck", "-56.5 -50.0 -30.0", "56.5 50.0 30.0", "-2591.5 -723.0 21.9" );

	if ( g_BaseMode == "versus" )
	{
		devchap( "BASE VERSUS" );

		// FIXES

		make_clip(	"_shortcut_window",		"Survivors",	1,	"-6 -66 -64",		"6 66 110",		"-4120 -2232 38" );
		make_clip( "_shortcut_barricadetarp", "Survivors", 1, "-107 -114 -1", "103 82 742", "-4786 1014 298" );
		make_clip( "_commentary_shortcut_firebarrel_a", "Survivors", 1, "0 0 0", "64 64 256", "-3880 -1674 110.628" );
		make_clip( "_commentary_shortcut_firebarrel_b", "Survivors", 1, "0 0 0", "96 12 16", "-3968.53 -1692.92 92.6282" );
	}

	if ( HasPlayerControlledZombies() )
	{
		kill_funcinfclip( 1392.94 );		// Delete clip behind saferoom stretching the orange fences introducing no exploits
		make_brush( "_losfix_endhaybailsa",	"-8 -64 0",	"8 70 50",	"5125 -3966.5 350" );
		make_brush( "_losfix_endhaybailsb",	"-8 -26 0",	"8 22 30",	"5125 -3966.5 402" );
		make_brush( "_losfix_opening_gen",	"-20 -1 -10",	"20 1 10",	"-4385 -2721 131" );
		make_brush( "_losfix_opening_trailer",	"-100 -1 -15",	"100 1 15",	"-3332 417 -1" );
		make_brush( "_losfix_start_truck1",	"-45 -1 -12",	"45 1 12",	"-5171 1649 139" );
		make_brush( "_losfix_start_truck2",	"-1 -45 -12",	"1 46 12",	"-5214 1602 139" );
		make_clip(	"_permstuck_bridgehouse_bush",	"SI Players",	1,	"-27 -74 -62",		"27 74 62",		"-1771 -162 60" );
		make_clip(	"_permstuck_lanternbush",	"SI Players",	1,	"-28 -14 -24",		"28 14 24",		"-832 -2840 13" );
		make_clip(	"_endhaybails_collisiona",	"SI Players",	1,	"-42 -66 -24",		"42 66 24",		"5126 -3967 378" );
		make_clip(	"_endhaybails_collisionb",	"SI Players",	1,	"-42 -25 -24",		"42 25 24",		"5126 -3967 426" );
		make_clip( "_ladder_afterplankfront_clip", "SI Players", 1, "7 -154 16", "15 43 32", "381 -4026 79" );
		make_clip( "_ladder_endsafehousetall_clip", "Everyone", 1, "-8 -16 0", "13 16 264", "4754 -3718 209" );
		make_clip( "_ladder_longtiltedlog_clipbot", "SI Players", 1, "-19 -16 0", "19 10 17", "-4037 -867 -21", "0 64 -77" );
		make_clip( "_ladder_longtiltedlog_cliptop", "SI Players", 1, "-19 -16 0", "19 10 17", "-4103 -835 268", "0 64 -60" );
		make_clip( "_ladder_plankhomeroof_clipleft", "Everyone", 1, "-8 5 -124", "13 6 105", "59 -4103 109", "0 45 0" );
		make_clip( "_ladder_plankhomeroof_clipright", "Everyone", 1, "-8 5 -1", "13 6 105", "33 -4099 109", "0 -45 0" );
		make_clip( "_ladder_startsafehouse_solidify_a", "SI Players", 1, "-86 -5 -3", "86 5 3", "-5950 1872 244", "0 8 0" );
		make_clip( "_ladder_startsafehouse_solidify_b", "SI Players", 1, "-3 -54 -3", "3 54 3", "-5983 1922 257", "0 0 6" );
		make_clip( "_ladder_startsafehouse_solidify_c", "SI Players", 1, "-2 -54 -3", "2 54 3", "-5953 1922 257", "0 2 6" );
		make_clip( "_ladder_startsafehouse_solidify_d", "SI Players", 1, "-2 -54 -3", "2 54 3", "-5926 1922 257", "0 -2 6" );
		make_clip( "_ladder_startsafehouse_solidify_e", "SI Players", 1, "-2 -54 -3", "2 54 3", "-5897 1922 257", "0 -2 6" );
		make_ladder( "_ladder_afterplankfront_cloned_afterplankback", "795 -4272 104", "1185 -8350 -10", "0 -180 0", "-1 0 0" );
		make_ladder( "_ladder_boatpanel_cloned_metalfence", "-4411 1178 136", "64 -1898 -85" );
		make_ladder( "_ladder_bridgehouseB_cloned_logfencefirst", "-4256 132 69", "-6200 -577.1 -58", "0 -180 0", "0 -1 0" );
		make_ladder( "_ladder_bridgehouseT_cloned_firebarrelhouse", "-3290 -1704 51.5", "1241 1035 50" );
		make_ladder( "_ladder_bugnethome_cloned_metalfence", "-4411 1178 136", "-10133 -677 7", "0 -180 0", "0 -1 0" );
		make_ladder( "_ladder_endsafehousetall_cloned_buglampoon", "-3984 -2900 117", "1843 266 224", "0 90 0", "-1 0 0" );
		make_ladder( "_ladder_eventstartlowground_cloned_startshantyshop", "-4900 1094 229", "5267 -5587 -230" );
		make_ladder( "_ladder_eventmidlowground_cloned_gunshackback", "-3756 -3241 53", "4337 -1130 -18" );
		make_ladder( "_ladder_eventendlowground_cloned_gunshackback", "-3756 -3241 53", "4995 -315 -44" );
		make_ladder( "_ladder_gonefishing_cloned_tallstartarea", "-5539 306 229", "-5864, -6927, -52", "0 -90 0", "0 1 0" );
		make_ladder( "_ladder_logfencenext_cloned_logfencefirst", "-4256 132 69", "-699 -2893 -40", "0 -40.35 0", "0.64 0.76 0" );
		make_ladder( "_ladder_longtiltedlog_cloned_privateproperty", "-3984 -3272 117", "-5224 4145 -438", "0 64 -8", "0.9 -0.45 0" );
		make_ladder( "_ladder_mehsurvival_cloned_startouthouse", "-5121 306 229", "-2386 -5650 -136", "0 -74.77 0", "0.26 -0.97 0" );
		make_ladder( "_ladder_outhouseroof_cloned_metalfence", "-4411 1178 136", "-1263 -4067 42", "0 -0.14 0", "0 1 0" );
		make_ladder( "_ladder_plankhomeroof_cloned_afterplankback", "795 -4272 104", "-4224 -4882 6", "0 90 0", "0 1 0" );
		make_ladder( "_ladder_safehouselow_cloned_highgenerator", "-4504 -2644 41", "9230 -881 238" );
		make_ladder( "_ladder_shortcuttrailerfront_cloned_privateproperty", "-5539 306 229", "1424.64 -2005.34 -173", "0 6 0", "-0.99 -0.1 0" );
		make_ladder( "_ladder_smalltrailerlogs_cloned_startsmalltrailer", "-5813.92 1030.64 192", "-2866 5580 -132", "0 90 0", "-0.26 -0.96 0" );
		make_ladder( "_ladder_startbehindrooftop_cloned_startshantyshop", "-4900 1510 229", "277 -1 0" );
		make_ladder( "_ladder_startnodrawfence_cloned_shantyshop", "-4900 1510 229", "-487.218 532.125 0" );
		make_ladder( "_ladder_startpicketqol_cloned_startpicketroof", "-4660 643 205.5", "-3999 4832 -43", "0 90 0", "-1 0 0" );
		make_ladder( "_ladder_startsafehouse_cloned_shantyshop", "-4900 1094 229", "-1107 763 -85" );
		make_ladder( "_ladder_tarptrailerwood_cloned_startouthouse", "-5121 306 229", "200 -1056 -175" );
		make_prop( "dynamic", "_permstuck_cratebot", "models/props_crates/static_crate_40.mdl", "-3749.85 -183.67 -3.164", "0 0 0" );
		make_prop( "dynamic", "_yesdraw_nodrawfence", "models/props_update/c3m3_nodrawfence.mdl", "-5212 1765 213.5", "0 -90 0", "shadow_no", "solid_no" );
		make_prop( "dynamic_ovr", "_ladder_mehsurvival_boat", "models/props_canal/boat001a.mdl", "-3438 -612 42", "95 15 90", "shadow_no" );
		make_prop( "physics",		"_hittable_fallentree",		"models/props_foliage/swamp_fallentree01_bare.mdl",	"-3935 -1120 -11",		"0 34 0" );
		patch_ladder( "-4304 -194 88.5", "0 -3 0" );
	}
}