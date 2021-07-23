g_Chapter = "DEAD CENTER - ATRIUM";

devchap( "ALL MODES" );

function DoRoundFixes()
{
    make_clip(	"_booster_storefrontleft",	"Survivors",	1,	"-900 -16 0",		"900 82 36",		"-4256 -4464 196" );
    make_clip(	"_booster_storefrontright",	"Survivors",	1,	"-169 -32 0",		"785 16 36",		"-3344 -3280 196" );
    make_clip( "_booster_pillarclip", "Survivors", 1, "-18 -32 0", "38 8 362", "-3434 -3533 472", "0 45 0" );
    make_clip( "_booster_cedaplastic", "Survivors", 1, "-125 -2 -22", "130 1 186", "-2787 -4193 302" );
    make_clip( "_booster_thicklongledge", "Survivors", 1, "-3856 0 -72", "0 81 256", "-2368 -4224 1080" );
    make_clip( "_booster_nodrawcorner", "Survivors", 1, "-555 -400 0", "0 400 256", "-5770 -3926 1024", "0 45 0" );
    make_clip( "_booster_libertymall", "Survivors", 1, "-18 -257 0", "18 257 500", "-2386 -3840 824" );
    make_clip( "_booster_fallbanner", "Survivors", 1, "-1 -81 0", "1 81 256", "-2929 -3889.5 991" );
    make_clip( "_booster_bridgeroof", "Survivors", 1, "-345 -110 0", "345 18 512", "-3339 -3857 864", "0 -70.5 0" );
    make_clip( "_booster_hardhatsa", "Survivors", 1, "-128 -14 0", "128 14 512", "-3070 -4206 536" );
    make_clip( "_booster_hardhatsb", "Survivors", 1, "-42 -14 0", "42 14 512", "-3370 -4206 536" );
    make_clip( "_booster_highbalcony", "Survivors", 1, "-260 -162 0", "260 162 520", "-4695 -4336 792" );
    make_clip( "_booster_glassbalcony", "Survivors", 1, "-128 -82 0", "128 0 1", "-3688 -4334 791" );
    make_clip( "_nav_ladyshoes", "Survivors", 1, "-103 -3 0", "70 3 56", "-4971 -4461 432" );
    make_clip( "_collision_atrium", "All and Physics", 1, "-2400 -3200 -2", "2400 3200 0", "-4452 -3208 0" );
    make_clip( "_kiosk_qol_1", "Everyone", 1, "-44 -44 -1", "44 44 0", "-3208 -3864 94" );
    make_clip( "_kiosk_qol_2a", "Everyone", 1, "-44 -44 -1", "44 44 0", "-4080 -4005 94" );
    make_clip( "_kiosk_qol_2b", "Everyone", 1, "-100 -1 -1", "100 1 0", "-4081 -3949 94" );
    make_clip( "_kiosk_qol_3a", "Everyone", 1, "-44 -44 -1", "44 44 0", "-4848 -3935 94" );
    make_clip( "_kiosk_qol_3b", "Everyone", 1, "-1 -100 -1", "1 100 0", "-4796 -3936 94" );
    make_trigduck( "_duckqol_informationbooth", "-96 -8 0", "96 8 64", "-4448 -3865 44" );

    if ( HasPlayerControlledZombies() )
    {
        make_ladder( "_ladder_plywoodback_cloned_plywoodfront", "-3311 -4299 588", "-6627 -8597 0", "0 180 0", "-1 0 0" );
        make_ladder( "_ladder_columnfarcorner_cloned_columngibbs", "-5044 -3531 443.893", "-1008.53 0 0" );
        make_ladder( "_ladder_columnbooth_cloned_columngibbs", "-5044 -3531 443.893", "-8255 1902 -220", "0 90 0", "1 0 0" );
        make_ladder( "_ladder_columnplywood_cloned_columnbusystairs", "-4948 -4181 310.5", "-504 0 0" );
        make_ladder( "_ladder_columnstairsright_cloned_columnbusystairs", "-4948 -4181 310.5", "1008 0 -216" );
        make_ladder( "_ladder_columnstairsleft_cloned_columnbusystairs", "-4948 -4181 310.5", "1512 0 -216" );
        make_ladder( "_ladder_columnfallbanner_cloned_columnbusystairs", "-4948 -4181 310.5", "2016 0 0" );
    }
}