g_Chapter = "DEAD AIR - THE GREENHOUSE";

devchap( "ALL MODES" );

function DoRoundFixes()
{
    make_clip(	"_oddhang_electricalbox",	"Survivors",	1,	"-8 -376 -466",		"0 0 174",		"3338 1147 466" );
    make_clip(	"_ladderqol_electricalbox",	"SI Players",	1,	"-6 -60 -536",		"0 6 104",		"3340 1151 536" );
    make_clip(	"_cliprework_stunfall",		"Survivors",	1,	"-96 -8 -400",		"96 8 1337",		"2464 784 409" );
    make_clip(	"_stunfall_jeep",		"Survivors",	1,	"-8 -177 0",		"8 177 1724",		"4669 1491 8" );
    make_clip(	"_cliprework_nopedocks01",	"Survivors",	1,	"-4155 -8 0",		"6600 8 1700",		"4221.4 -1175 16" );
    make_clip(	"_tankpunch_escapeladder",	"Survivors",	1,	"-48 -88 0",		"48 88 1470",		"3412 -932 259" );
    make_clip(	"_cliprework_nopedocks02",	"Survivors",	1,	"-8 -64 0",		"8 64 1818",		"2312 -1141 16" );
    make_clip(	"_cliprework_unattackable",	"Survivors",	1,	"-160 -600 0",		"160 600 1818",		"7188.6 -601.2 16" );
    make_clip( "_stunfall_lamp", "Survivors", 1, "-888 0 0", "979 17 1724", "5549 1313 8" );
    make_clip( "_outtabounds_ledge", "Survivors", 1, "-148 -145 0", "100 141 1100", "2700 649 640" );
    make_trighurt( "_instakill_thankyoufailzz", "Survivor", "-2828 -46 -149", "1881 225 0", "5148 -1121 165" );

    if ( g_BaseMode == "versus" )
    {
        devchap( "BASE VERSUS" );

        // FIXES

        make_clip(	"_commonhop_greenhouse",	"Survivors",	1,	"0 -320 -176",		"3 240 690",		"5226 -752 1023" );
        make_clip( "_cliprework_endpassage", "Survivors", 1, "-6 -224 0", "6 224 78", "4858 2552 274" );

    }

    if ( HasPlayerControlledZombies() )
    {
        kill_funcinfclip( 625.928 );	// Delete clip shielding access away from greenhouse roof
        kill_funcinfclip( 985.253 );	// Delete clip shielding in dropping through roof holes
        kill_funcinfclip( 730.438 );	// Delete clip above Holly Street station building
        kill_funcinfclip( 608.147 );	// Delete clip above roof near Crane, Hunter-only so don't add ladder, fix added exploit
        kill_funcinfclip( 677.928 );	// Delete clip to right of end area, also Hunter-only so no ladder, fix added exploit
        kill_funcinfclip( 827.238 );	// Delete clip above office entrance roof for a new attack spot (Tank buff)
        kill_funcinfclip( 726.55 );	// Delete clip on tall rooftop across from greenhouse
        kill_funcinfclip( 138.95 );	// Delete clip (that's oddly tapered) at end of electrical pole
        kill_funcinfclip( 900.059 );	// Delete clip covering the entirety of adjacent long-jump rooftop
        kill_funcinfclip( 883.739 );	// Delete clip along greenhouse roof's far right wedge
        make_brush( "_losfix_semi1",		"-40 -1 -27",	"40 1 27",	"3456 2233 43" );
        make_brush( "_losfix_semi2",		"-1 -50 -15",	"1 50 15",	"3999 2268 23" );
        make_brush( "_losfix_semi3",		"-20 -1 -15",	"21 1 15",	"3977 2264 23" );
        make_brush( "_losfix_van",		"-70 -1 -8",	"70 1 8",	"3729 2932 15" );
        make_clip( "_bustedwatertower_clip", "SI Players", 1, "-440 -187 -448", "440 149 264", "3872 -909 1464" );
        make_clip( "_greenhouse_gutterleft", "SI Players and AI", 1, "-479 -1 0", "581 0 17", "5707 -993 984" );
        make_clip( "_greenhouse_gutterright", "SI Players and AI", 1, "-479 -1 0", "1301 0 17", "5707 -271 984" );
        make_clip( "_greenhouse_randomgapa", "SI Players", 1, "-112 -2 -1", "20 2 1", "4874 -752 923" );
        make_clip( "_greenhouse_randomgapb", "SI Players", 1, "-64 -2 -1", "0 2 1", "5823 -633 1088" );
        make_clip( "_greenhouse_saferoof_survivor", "Survivors", 1, "-242 -350 0", "480 349 800", "6530 -541 1004" );
        make_clip( "_greenhouse_saferoof_infected", "SI Players", 1, "-242 -350 0", "480 349 800", "6530 -541 1004" );
        make_clip( "_greenhouse_saferoof_infecgap", "SI Players", 1, "-8 -16 0", "8 16 32", "6296 -208 943" );
        make_clip( "_meticulous_funcinfclip01", "SI Players and AI", 1, "-530 -3 0", "530 3 888", "5758 -1069 848" );
        make_clip( "_meticulous_funcinfclip02", "SI Players and AI", 1, "-368 -3 0", "350 3 888", "6658 -893 916" );
        make_clip( "_meticulous_funcinfclip03", "SI Players and AI", 1, "-130 -3 0", "350 3 888", "6658 -199 916" );
        make_clip( "_meticulous_funcinfclip04", "SI Players and AI", 1, "-3 -381 0", "3 307 888", "7011 -509 908" );
        make_clip( "_meticulous_funcinfclip05", "SI Players and AI", 1, "-3 -94 0", "3 88 888", "6291 -978 848" );
        make_clip( "_yesdraw_longjump_clip", "SI Players", 1, "-682 -500 -436", "322 380 436", "3010 3568 1292" );
        make_clip( "_yesdraw_longjump_stuck", "SI Players", 1, "-24 -240 0", "8 208 128", "2584 2864 728" );
        make_ladder( "_ladder_endcarpetwin_cloned_onewayupper", "2872 1156.5 559", "2237 5217 -535", "0 -90 0", "1 0 0" );
        make_ladder( "_ladder_endupperwalkway_cloned_longnosegrille", "4060.65 2328.76 49.8259", "9369 1162 182", "0 135 0", "-1 0 0" );
        make_ladder( "_ladder_greenhousebox_cloned_firstbuildfront", "4360.5 384 692.5", "4678 3728 2", "0 -90 0", "0 -1 0" );
        make_ladder( "_ladder_greenhouseroof_cloned_betweenacunits", "3322.5 726 732.5", "1907 -1313 229" );
        make_ladder( "_ladder_startplankdoor_cloned_endchainlink", "2632 2367 92.5", "7133 -2174 503", "0 90 0", "-1 0 0" );
        make_prop( "dynamic", "_bustedwatertower_wrongwaya", "models/props_misc/wrongway_sign01_optimized.mdl", "4069 -758 1264", "0 90 0", "shadow_no", "solid_no", "255 255 255", 217, 17 );
        make_prop( "dynamic", "_bustedwatertower_wrongwayb", "models/props_misc/wrongway_sign01_optimized.mdl", "3664 -758 1264", "0 90 0", "shadow_no", "solid_no", "255 255 255", 217, 17 );
        make_prop( "dynamic", "_yesdraw_longjump_roofa", "models/props_update/c8m1_rooftop_1.mdl", "3088 3312 856", "0 90 0", "shadow_no", "solid_no" );
        make_prop( "dynamic", "_yesdraw_longjump_roofb", "models/props_update/c8m1_rooftop_1.mdl", "2832 3312 855.9", "0 90 0", "shadow_no", "solid_no" );
        make_prop( "dynamic", "_yesdraw_longjump_wrongwaya", "models/props_misc/wrongway_sign01_optimized.mdl", "3090 3065 918", "0 -90 0", "shadow_no", "solid_no", "255 255 255", 500, 17 );
        make_prop( "dynamic", "_yesdraw_longjump_wrongwayb", "models/props_misc/wrongway_sign01_optimized.mdl", "2805 3065 918", "0 -90 0", "shadow_no", "solid_no", "255 255 255", 500, 17 );
        make_prop( "dynamic", "_yesdrawgreenhouse_panels", "models/props_update/c11m1_greenhouse_nodraw.mdl", "6118.9 -632 943", "0 270 0", "shadow_no" );
        make_prop( "dynamic", "_yesdrawgreenhouse_plywood", "models/props_update/c11m1_greenhouse_plywood.mdl", "5524 -717 968", "0 270 0", "shadow_no" );
        make_prop( "dynamic", "_yesdrawgreenhouse_wrongwaya", "models/props_misc/wrongway_sign01_optimized.mdl", "6305 -633 1148", "0 180 0", "shadow_no", "solid_no", "255 255 255", 500, 17 );
        make_prop( "dynamic", "_yesdrawgreenhouse_wrongwayb", "models/props_misc/wrongway_sign01_optimized.mdl", "6305 -395 1148", "0 180 0", "shadow_no", "solid_no", "255 255 255", 500, 17 );
        local strEndUpperWalkway = clone_model( Entities.FindByClassnameNearest( "func_illusionary", Vector( 4063, 2331, 49.83 ), 1 ) );

        if ( strEndUpperWalkway != null )
        {
            SpawnEntityFromTable( "func_illusionary",
            {
                targetname	= g_UpdateName + "_endupperwalkway_illus",
                model		= strEndUpperWalkway,
                origin		= Vector( 4853, 2387, 232 ),
                angles		= Vector( 0, 135, 0 )
            } );
        }
    }
}