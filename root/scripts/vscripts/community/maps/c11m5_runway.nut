g_Chapter = "DEAD AIR - RUNWAY FINALE";

devchap( "ALL MODES" );

PrecacheModel( "models/deadbodies/dead_male_civilian_body.mdl" );
PrecacheModel( "models/props_vehicles/airport_baggage_tractor.mdl" );
PrecacheModel( "models/props_vehicles/airport_baggage_cart2.mdl" );

function DoRoundFixes()
{
	make_clip( "_lowthinwing_collision", "Everyone", 1, "-8 -116 -30", "8 111 32", "-6057 9725 -12" );
	make_clip( "_nav_firering_cheese", "Survivors", 1, "-24 -86 0", "17 126 1632", "-3408 9155 -192" );
	make_clip( "_planecrash_concreteramp", "SI Players", 1, "-290 -10 0", "345 10 185", "-4127 11223 -128", "0 -56 45" );

	make_prop( "dynamic", "_terry", "models/deadbodies/dead_male_civilian_body.mdl", "-4154 9350 -140", "0 -111 0", "shadow_no", "solid_no" );
	EntFire( "relay_outro_start", "AddOutput", "OnTrigger " + g_UpdateName + "_terry:Kill::2:-1" );

	if ( g_BaseMode == "survival" )
	{
		make_clip( "_nav_skybridge", "Survivors", 1, "-643 -102 0", "878 106 1427", "-6035 8761 32", "0 45 0" );
	}

	if ( HasPlayerControlledZombies() )
	{
		EntFire( "worldspawn", "RunScriptFile", "community/c11m5_versus_planecrash" );

		make_brush( "_losfix_lowthinwing",	"-8 -116 -30",	"8 111 32",	"-6057 9725 -12" );
		make_brush( "_losfix_truck1",		"-56 -1 -12",	"71 1 28",	"-5039 8665 -180" );
		make_brush( "_losfix_truck2",		"-1 -29 -12",	"1 60 14",	"-4968 8695 -181" );
		make_brush( "_losfix_truck3",		"-1 -28 -12",	"1 29 28",	"-5093 8635 -180" );
		make_clip( "_boardingramp_wallclip", "SI Players", 1, "-200 -4 -1", "333 3 1", "-5824 10391.5 220", "4 0 0" );
		make_clip( "_collapsedbuilding_clip1", "SI Players", 1, "-330 -190 -125", "330 185 220", "-6506 7723 -123", "-1 8 60" );
		make_clip( "_collapsedbuilding_clip2", "SI Players", 1, "-330 -240 -600", "325 200 1036", "-6495 7469 403" );
		make_clip( "_lowthinwing_collision", "Everyone", 1, "-8 -116 -30", "8 111 32", "-6057 9725 -12" );
		make_clip( "_planecrash_concreteramp", "SI Players", 1, "-290 -10 0", "345 10 185", "-4127 11223 -128", "0 -56 45" );
		make_clip( "_ladderqol_wreckedengine", "SI Players", 1, "-14 -19 -1", "14 19 1", "-5459 8461 10", "-40 -14.5 0" );
		make_ladder( "_ladder_boardingtables_cloned_cargocontainerfront", "-6663 9840 -127.879", "-1804 -813 292", "0 -13.5 0", "0.97 -0.23 0" );
		make_ladder( "_ladder_catertruckleft1_cloned_escapeplaneright", "-4166 9126 -96", "4158 4400 -19", "0 30 0", "0.86 0.5 0" );
		make_ladder( "_ladder_catertruckleft2_cloned_escapeplaneright", "-4166 9126 -96", "-12299 15975 -19", "0 -150 0", "-0.86 -0.5 0" );
		make_ladder( "_ladder_catertruckright1_cloned_escapeplaneright", "-4166 9126 -96", "-10917 386 -19", "0 -60 0", "0.5 -0.866 0" );
		make_ladder( "_ladder_catertruckright2_cloned_escapeplaneleft", "-4354 9230 -96", "-10909 228 -19", "0 300.5 0", "-0.507 0.862 0" );
		make_ladder( "_ladder_collapsedbuilding_cloned_escapeplaneleft", "-4354 9230 -96", "-288 16026 -485", "6 116.5 0", "0.44 -0.89 0.1" );
		make_ladder( "_ladder_collapsedbuildingdoor_cloned_cargocontainerfront", "-6663 9840 -127.879", "-141 -2059 208" );
		make_ladder( "_ladder_skybridgeleft_cloned_skybridgemid", "-5626 10415 36", "5692 5879 0", "0 45 0", "-0.71 0.71 0" );
		make_ladder( "_ladder_wreckedengine_cloned_escapeplaneleft", "-4354 9230 -96", "-3707 -1526 -1127", "15 -14.5 0", "-0.935 0.242 0.259" );
		make_ladder( "_ladder_wreckedfuselage_cloned_cargoslanted", "-4332 8255.36 -114.329", "-5065 1422 51", "0 -21.5 0", "0.317 0.807 0.5" );
		make_ladder( "_ladder_wreckedrear_cloned_escapeplaneleft", "-4354 9230 -96", "-2679 285 -11", "0 -5 0", "-0.996 0.087 0" );
		make_prop( "dynamic",		"_losblocker_fireline_tractor",	"models/props_vehicles/airport_baggage_tractor.mdl",	"-2980.23 10393 -141",		"70 180 -10",		"shadow_no" );

		DoEntFire( "!self", "AddOutput", "OnBreak " + g_UpdateName + "_boardingramp_wallclip:Kill::0:-1", 0.0, null, Entities.FindByClassnameNearest( "func_breakable", Vector( -5913.99, 10371.6, 162.64 ), 1 ) );
		DoEntFire( "!self", "AddOutput", "OnBreak " + g_UpdateName + "_boardingramp_wallclip:Kill::0:-1", 0.0, null, Entities.FindByClassnameNearest( "func_breakable", Vector( -5727.82, 10368.7, 143.43 ), 1 ) );
		DoEntFire( "!self", "AddOutput", "OnBreak " + g_UpdateName + "_boardingramp_wallclip:Kill::0:-1", 0.0, null, Entities.FindByClassnameNearest( "func_breakable", Vector( -5611.89, 10356, 143.21 ), 1 ) );

		con_comment( "PROP:\tBaggage cart under the plane wing moved closer to the ring of fire to give infected better spawn points" );

		kill_entity( Entities.FindByClassnameNearest( "prop_physics", Vector( -3708, 8863, -165.5 ), 8 ) );
		make_prop( "physics", "_replacement_baggagecart", "models/props_vehicles/airport_baggage_cart2.mdl", "-3791 9604 -191", "0 60 0", "shadow_no" );
	}
}