g_Chapter = "DARK CARNIVAL - BARNS";

devchap( "ALL MODES" );

// FIXES_ALL

make_clip(	"_outhouse_saferoof",		"Survivors",	1,	"-94 -32 0",		"94 32 1111",		"2608 3920 -88" );
make_clip( "_booster_barnbeam1", "Survivors", 1, "-145 -3 0", "158 5 65", "-2022 -129 32" );
make_clip( "_booster_barnbeam2", "Survivors", 1, "-145 -3 0", "158 5 65", "-2022 -321 32" );
make_clip( "_booster_barnbeam3", "Survivors", 1, "-145 -3 0", "158 5 65", "-1318 63 32" );
make_clip( "_booster_barnbeam4", "Survivors", 1, "-145 -3 0", "158 5 65", "-1318 -129 32" );
make_clip( "_booster_barnbeam5", "Survivors", 1, "-145 -3 0", "158 5 65", "-1318 -321 32" );
make_clip( "_booster_barnbeam6", "Survivors", 1, "-125 -11 0", "138 5 82", "-614 63 32" );
make_clip( "_booster_barnbeam7", "Survivors", 1, "-145 -3 0", "158 5 65", "-614 -129 32" );
make_clip( "_booster_barnbeam8", "Survivors", 1, "-145 -3 0", "158 5 65", "-614 -321 32" );
make_clip( "_nav_eventfenceback", "Survivors", 1, "-8 -159 0", "25 164 1036", "-2266 807 -12", "0 72 0" );
make_clip( "_booster_clipextend", "Survivors", 1, "-38 -67 0", "10 61 668", "646 1995 356" );
make_clip( "_cliprework_finalfence", "Survivors", 1, "-96 -6 0", "120 11 704", "-120 2446 320" );
make_clip( "_booster_lightpole1", "Survivors", 1, "-59 -20 0", "64 18 637", "280 2077 387" );
make_clip( "_booster_lightpole2", "Survivors", 1, "-20 -59 0", "18 64 637", "1 1508 387" );
make_clip( "_booster_lightpole3", "Survivors", 1, "-20 -59 0", "18 64 637", "-226 846 387" );
make_clip( "_booster_lightpole4", "Survivors", 1, "-20 -59 0", "18 64 637", "-483 1508 387" );
make_clip( "_booster_lightpole5", "Survivors", 1, "-20 -59 0", "18 64 637", "-985 1508 387" );
make_clip( "_booster_lightpole6", "Survivors", 1, "-20 -59 0", "18 64 637", "-1765 1508 387" );
make_clip( "_booster_lightpole7", "Survivors", 1, "-20 -59 0", "18 64 637", "-2162 901 387" );
make_clip( "_booster_lightpole8", "Survivors", 1, "-20 -59 0", "18 64 637", "-1198 902 387" );
make_clip( "_booster_dualtents", "Survivors", 1, "-80 -221 0", "59 232 607", "-2993 1146 417" );
make_clip( "_booster_awning", "Survivors", 1, "-17 -16 -34", "274 13 134", "-3119 528 5" );
make_clip( "_booster_elecroof", "Survivors", 1, "-170 -28 0", "182 21 967", "426 2316 57" );
make_clip( "_ladder_askewhedgeshared_base", "Everyone", 1, "-2 -336 0", "4 195 128", "609 1233 -192" );
patch_spawninfront( "-596 2312 -256", "-76 -8 0", "76 8 160" );
patch_spawninfront( "-508 2503 -256", "-8 -51 0", "8 51 160" );

if ( g_BaseMode == "coop" || g_BaseMode == "realism" )
{
	devchap( "BASE COOP" );

	// FIXES

    con_comment( "KILL:\tSafe roof exploit unpatched for Coop (popular request)." );

    EntFire( g_UpdateName + "_outhouse_saferoof", "Kill" );

}
if ( g_BaseMode == "versus" )
{
	devchap( "BASE VERSUS" );

	// FIXES

    make_clip( "_commonhop_generator1", "Survivors", 1, "-35 -16 0", "35 16 50", "-1716 273 -81", "0 0 20" );
    make_clip( "_commonhop_generator2", "Everyone", 1, "8 0 0", "58 8 164", "-1660 275 -192", "0 -19 0" );

}
if ( g_BaseMode == "survival" )
{
	devchap( "BASE SURVIVAL" );

	// FIXES

    make_clip( "_eventskip_fencehang", "Survivors", 1, "-6 -50 0", "6 50 1072", "398 1990 -48" );

    make_clip( "_nav_eventfencea", "Survivors", 1, "-49 -3 0", "48 14 1045", "-2751 749 -21" );
    make_clip( "_nav_eventfenceb", "Survivors", 1, "-49 -3 0", "48 14 1045", "-2499 749 -21" );

    make_clip( "_ladder_askewhedgeshared_clip", "SI Players and AI", 1, "-3 -279 -7", "3 245 79", "593 1177 -63" );
    make_ladder( "_ladder_askewhedgebotr1_cloned_askewhedgebotl", "610 1209.88 -123.984", "0 26 0" );
    make_ladder( "_ladder_askewhedgebotr2_cloned_askewhedgebotl", "610 1209.88 -123.984", "0 52 0" );
    make_ladder( "_ladder_askewhedgetopl1_cloned_askewhedgetopr", "594 1262 -24", "0 -26 0" );
    make_ladder( "_ladder_askewhedgetopl2_cloned_askewhedgetopr", "594 1262 -24", "0 -52 0" );

}