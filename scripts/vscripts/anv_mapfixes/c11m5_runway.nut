g_Chapter = "DEAD AIR - RUNWAY FINALE";

devchap( "ALL MODES" );

// FIXES_ALL

make_clip( "_lowthinwing_collision", "Everyone", 1, "-8 -116 -30", "8 111 32", "-6057 9725 -12" );
make_clip( "_nav_skybridge", "Survivors", 1, "-643 -102 0", "878 106 1427", "-6035 8761 32", "0 45 0" );
make_clip( "_nav_firering_cheese", "Survivors", 1, "-24 -86 0", "17 126 1632", "-3408 9155 -192" );
make_clip( "_planecrash_concreteramp", "SI Players", 1, "-290 -10 0", "345 10 185", "-4127 11223 -128", "0 -56 45" );

make_prop( "dynamic", "_terry", "models/deadbodies/dead_male_civilian_body.mdl", "-4154 9350 -140", "0 -111 0", "shadow_no", "solid_no" );
EntFire( "relay_outro_start", "AddOutput", "OnTrigger anv_mapfixes_terry:Kill::2:-1" );

if ( HasPlayerControlledZombies() )
{
    EntFire( "worldspawn", "RunScriptFile", "c11m5_versus_planecrash" );

    make_brush( "_losfix_lowthinwing",	"-8 -116 -30",	"8 111 32",	"-6057 9725 -12" );
    make_brush( "_losfix_truck1",		"-56 -1 -12",	"71 1 28",	"-5039 8665 -180" );
    make_brush( "_losfix_truck2",		"-1 -29 -12",	"1 60 14",	"-4968 8695 -181" );
    make_brush( "_losfix_truck3",		"-1 -28 -12",	"1 29 28",	"-5093 8635 -180" );
    make_clip( "_boardingramp_wallclip", "SI Players", 1, "-200 -4 -1", "333 3 1", "-5824 10391.5 220", "4 0 0" );
    make_clip( "_collapsedbuilding_clip1", "SI Players", 1, "-330 -190 -125", "330 185 220", "-6506 7723 -123", "-1 8 60" );
    make_clip( "_collapsedbuilding_clip2", "SI Players", 1, "-330 -240 -600", "325 200 1036", "-6495 7469 403" );
    make_clip( "_lowthinwing_collision", "Everyone", 1, "-8 -116 -30", "8 111 32", "-6057 9725 -12" );
    make_clip( "_planecrash_concreteramp", "SI Players", 1, "-290 -10 0", "345 10 185", "-4127 11223 -128", "0 -56 45" );
    make_ladder( "_ladder_boardingtables_cloned_cargocontainerfront", "-6663 9840 -127.879", "-1707 -769 287", "0 -13 0", "0.97 -0.22 0" );
    make_ladder( "_ladder_catertruckleft1_cloned_escapeplaneright", "-4166 9126 -96", "4184 4433 -19", "0 30.26 0", "0.86 0.5 0" );
    make_ladder( "_ladder_catertruckleft2_cloned_escapeplaneright", "-4166 9126 -96", "-12338 15912 -19", "0 -149.58 0", "-0.86 -0.5 0" );
    make_ladder( "_ladder_catertruckright1_cloned_escapeplaneright", "-4166 9126 -96", "-10848 335 -19", "0 -59.5 0", "0.5 -0.86 0" );
    make_ladder( "_ladder_catertruckright2_cloned_escapeplaneright", "-4166 9126 -96", "1280 16353 -19", "0 115.47 0", "-0.5 0.86 0" );
    make_ladder( "_ladder_collapsedbuilding_cloned_escapeplaneleft", "-4354 9230 -96", "-365 16080 -488", "6 117 0", "0.45 -0.89 0" );
    make_ladder( "_ladder_collapsedbuildingdoor_cloned_cargocontainerfront", "-6663 9840 -127.879", "-141 -2059 208" );
    make_ladder( "_ladder_skybridgeleft_cloned_skybridgemid", "-5626 10415 36", "5750 6079 0", "0 46 0", "-0.72 0.69 0" );
    make_ladder( "_ladder_wreckedengine_cloned_escapeplaneleft", "-4354 9230 -96", "-3933 -1386 -2219", "15 -14.3 7", "-0.96 0.27 0" );
    make_ladder( "_ladder_wreckedfuselage_cloned_cargoslanted", "-4332 8255.36 -114.329", "-5096 1415 56", "0 -21.65 0", "0.34 0.94 0" );
    make_ladder( "_ladder_wreckedrear_cloned_escapeplaneleft", "-4354 9230 -96", "-2781 246 -12", "0 -5.65 0", "-1 0.1 0" );
    make_prop( "dynamic",		"_losblocker_fireline_tractor",	"models/props_vehicles/airport_baggage_tractor.mdl",	"-2980.23 10393 -141",		"70 180 -10",		"shadow_no" );

    DoEntFire( "!self", "AddOutput", "OnBreak anv_mapfixes_boardingramp_wallclip:Kill::0:-1", 0.0, null, Entities.FindByClassnameNearest( "func_breakable", Vector( -5913.99, 10371.6, 162.64 ), 1 ) );
    DoEntFire( "!self", "AddOutput", "OnBreak anv_mapfixes_boardingramp_wallclip:Kill::0:-1", 0.0, null, Entities.FindByClassnameNearest( "func_breakable", Vector( -5727.82, 10368.7, 143.43 ), 1 ) );
    DoEntFire( "!self", "AddOutput", "OnBreak anv_mapfixes_boardingramp_wallclip:Kill::0:-1", 0.0, null, Entities.FindByClassnameNearest( "func_breakable", Vector( -5611.89, 10356, 143.21 ), 1 ) );

    con_comment( "PROP:\tBaggage cart under the plane wing moved closer to the ring of fire to give infected better spawn points" );

    kill_entity( Entities.FindByClassnameNearest( "prop_physics", Vector( -3708, 8863, -165.5 ), 8 ) );
    make_prop( "physics", "_replacement_baggagecart", "models/props_vehicles/airport_baggage_cart2.mdl", "-3791 9604 -191", "0 60 0", "shadow_no" );
}