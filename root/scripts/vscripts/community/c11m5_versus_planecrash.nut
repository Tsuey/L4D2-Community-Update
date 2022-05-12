/*****************************************************************************
**  PLANECRASH LADDERS AND LOS FIXES
**
**  For 10 years the planecrash wreckage has been a non-solid pile of waste to
**  Infected players. This transforms it into attackable space consequently
**  nerfing an over-powered Survivor camp spot in the process. To compensate,
**  for Versus mode only Commons will no longer approach from the wreckage as
**  that's reserved for players -- the navblockers prevent Commons and Tanks
**  from spawning there. Pushers ensure players don't get stuck.
**
**  The LOS fixes allow players to spawn with clips compensating for collision;
**  this because func_brush cannot be rotated and have janky collision alone.
**
**  Modifies Human-Controlled SI modes only.
*****************************************************************************/

con_comment( "FILE:\tRunScriptFile'd \"c11m5_versus_planecrash.nut\" for ladders and LOS fixes." );

// Inject logic_relay to start pushing away (pre) at first touchdown
// and once movement ceases spawn in the entities (post).

EntFire( "planecrash_trigger", "AddOutput", "OnTrigger worldspawn:CallScriptFunction:c11m5_planecrash_pre:26:-1" );
EntFire( "planecrash_trigger", "AddOutput", "OnTrigger worldspawn:CallScriptFunction:c11m5_planecrash_post:28:-1" );

// Called to block crash site navmesh and push away any SI Players.

function c11m5_planecrash_pre()
{
	make_navblock( "_debris_navblock_1",	"Infected",		"Apply",	"-298 -196 -104",	"238 636 217",	"-4085 11291 -88" );
	make_navblock( "_debris_navblock_2",	"Infected",		"Apply",	"-288 54 -104",		"38 556 217",	"-3735 10741 -88" );
	make_navblock( "_debris_navblock_3",	"Infected",		"Apply",	"-288 174 -104",	"38 556 217",	"-3575 10531 -88" );
	make_navblock( "_debris_navblock_4",	"Infected",		"Apply",	"-338 249 -104",	"-22 376 217",	"-3435 10361 -88" );
	// make_navblock( "_debris_navblock_5",	"Infected",		"Apply",	"-192 287 -104",	"-52 339 217",	"-3435 10271 -88" );
	make_navblock( "_debris_navblock_6",	"Infected",		"Apply",	"-288 137 -104",	"28 469 267",	"-3085 10771 -88" );
	make_navblock( "_debris_navblock_7",	"Infected",		"Apply",	"-288 195 -104",	"198 409 267",	"-2795 10681 -88" );
	make_navblock( "_debris_navblock_8",	"Infected",		"Apply",	"-204 115 -104",	"198 409 267",	"-2795 10471 -88" );

	make_trigpush( "_debris_trigpush_1",	"Infected",	610,	"0 0 0",	"-298 -196 -104",	"238 636 217",	"-4085 11291 -88" );
	make_trigpush( "_debris_trigpush_2",	"Infected",	610,	"0 0 0",	"-288 54 -104",		"38 556 217",	"-3735 10741 -88" );
	make_trigpush( "_debris_trigpush_3",	"Infected",	610,	"0 0 0",	"-288 174 -104",	"38 556 217",	"-3575 10531 -88" );
	make_trigpush( "_debris_trigpush_4",	"Infected",	610,	"0 0 0",	"-338 249 -104",	"-22 376 217",	"-3435 10361 -88" );
	make_trigpush( "_debris_trigpush_5",	"Infected",	610,	"0 0 0",	"-192 287 -104",	"-52 339 217",	"-3435 10271 -88" );
	make_trigpush( "_debris_trigpush_6",	"Infected",	610,	"0 180 0",	"-288 137 -104",	"28 469 267",	"-3085 10771 -88" );
	make_trigpush( "_debris_trigpush_7",	"Infected",	610,	"0 180 0",	"-288 195 -104",	"198 409 267",	"-2795 10681 -88" );
	make_trigpush( "_debris_trigpush_8",	"Infected",	610,	"0 180 0",	"-204 115 -104",	"198 409 267",	"-2795 10471 -88" );

	// Re-Apply again one second after because "planecrash_navblocker" botched originals.

	EntFire( g_UpdateName + "_debris_navblock_*", "BlockNav", null, 3 );

	// Keep pushing for one extra second after (post) entities spawned.

	EntFire( g_UpdateName + "_debris_trigpush_*", "Kill", null, 3 );
}

// Called to spawn in the new entities.

function c11m5_planecrash_post()
{
	// Infected ladders.

	make_ladder( "_ladder_debriscabinleft_cloned_escapeplaneright", "-4166 9126 -96", "4680 4870 65", "0 30 0", "0.87 0.5 0" );
	make_ladder( "_ladder_debriscabinright_cloned_escapeplaneright", "-4166 9126 -96", "4185 5608 41", "0 30 0", "0.87 0.5 0" );
	make_ladder( "_ladder_debriscabinfront_cloned_escapeplaneleft", "-4354 9230 -96", "4616 4820 50", "0 30 0", "-0.87 -0.5 0" );
	make_ladder( "_ladder_debriswing_cloned_cargocontainerright", "-6992 8825 -127.879", "3939 2263 168" );

	// LOS brushes and the collision clips that encase them.

	// LOS plane wing.

	make_brush( "_losfix_debris_1a",	"-1 -12 -40",	"1 12 40",	"-3020 11040 35" );
	make_brush( "_losfix_debris_1b",	"-150 -1 -42",	"150 1 42",	"-2870 11028 33" );
	make_brush( "_losfix_debris_1c",	"-1 -40 -49",	"1 40 49",	"-2720 10988 26" );
	make_brush( "_losfix_debris_1d",	"-21 -1 -59",	"21 1 59",	"-2699 10948 16" );
	make_brush( "_losfix_debris_1e",	"-1 -35 -68",	"1 35 68",	"-2678 10913 7" );
	make_brush( "_losfix_debris_1f",	"-8 -1 -68",	"8 1 68",	"-2670 10878 7" );
	make_clip( "_losfix_debris_1clipa",	"SI Players",	1,	"-216 -10 0",	"120 10 190",	"-2854 10895 -17",	"0 0 -55" );
	make_clip( "_losfix_debris_1clipb",	"SI Players",	1,	"-240 12 -66",	"143 42 97",	"-2867 11010 3",	"5.4 -9 0" );
	make_clip( "_losfix_debris_1clipc",	"SI Players",	1,	"-68 -2 -50",	"18 48 73",	"-2706 10945 3",	"0 -49 0" );
	make_clip( "_losfix_debris_1clipd",	"SI Players",	1,	"-68 -2 -50",	"79 48 73",	"-2672 10881 3",	"0 -64 0" );
	make_clip( "_losfix_debris_1clipe",	"SI Players",	1,	"-70 -12 -50",	"26 12 73",	"-2670 10894 3",	"0 -90 0" );

	// LOS plane wing vertical.

	make_brush( "_losfix_debris_2a",	"-1 -8 -24",	"1 8 24",	"-2733 10965 99" );
	make_brush( "_losfix_debris_2b",	"-8 -1 -28",	"8 1 28",	"-2725 10957 103" );
	make_brush( "_losfix_debris_2c",	"-1 -26 -35",	"1 26 35",	"-2717 10931 100" );
	make_brush( "_losfix_debris_2d",	"-10 -1 -53",	"10 1 53",	"-2707 10905 118" );
	make_brush( "_losfix_debris_2e",	"-1 -25 -53",	"1 25 53",	"-2697 10880 118" );
	make_brush( "_losfix_debris_2f",	"-10 -1 -53",	"10 1 53",	"-2687 10855 118" );
	make_brush( "_losfix_debris_2g",	"-1 -25 -53",	"1 25 53",	"-2677 10830 118" );
	make_brush( "_losfix_debris_2h",	"-10 -1 -53",	"10 1 53",	"-2667 10805 118" );
	make_clip( "_losfix_debris_2clip",	"SI Players",	1,	"-108 -10 -32",	"255 17 95",	"-2698 10884 69",	"-35 -73 5" );

	// LOS plane fuselage.

	make_brush( "_losfix_debris_3a",	"-80 -1 -63",	"80 1 63",	"-3220 11085 42" );
	make_brush( "_losfix_debris_3b",	"-1 -40 -63",	"1 40 63",	"-3300 11125 42" );
	make_clip( "_losfix_debris_3clip",	"SI Players",	1,	"-145 -90 -96",	"125 90 95",	"-3217 11068 48",	"20 -48 0" );

	// LOS plane tail.

	make_brush( "_losfix_debris_4a",	"-1 -50 -52",	"1 50 52",	"-2910 10743 -26" );
	make_brush( "_losfix_debris_4b",	"-26 -1 -46",	"26 1 46",	"-2936 10743 -20" );
	make_brush( "_losfix_debris_4c",	"-12 -1 -47",	"12 1 47",	"-2898 10693 -33" );
	make_brush( "_losfix_debris_4d",	"-1 -14 -44",	"1 14 44",	"-2886 10679 -48" );
	make_brush( "_losfix_debris_4e",	"-10 -1 -37",	"10 1 37",	"-2876 10665 -55" );
	make_brush( "_losfix_debris_4f",	"-1 -10 -34",	"1 10 34",	"-2866 10655 -65" );
	make_brush( "_losfix_debris_4g",	"-1 -6 -32",	"1 6 32",	"-2866 10639 -73" );
	make_brush( "_losfix_debris_4h",	"-1 -6 -32",	"1 6 32",	"-2866 10627 -83" );
	make_clip( "_losfix_debris_4clip",	"SI Players",	1,	"-145 -45 -64",	"115 50 74",	"-2910 10714 -61",	"40 -60 0" );

	// LOS plane cabin.

	make_brush( "_losfix_debris_5a",	"-10 -1 -75",	"10 1 75",	"-3490 10660 -53" );
	make_brush( "_losfix_debris_5b",	"-20 -1 -90",	"20 1 90",	"-3520 10660 -43" );
	make_brush( "_losfix_debris_5c",	"-1 -30 -90",	"1 30 90",	"-3540 10690 -43" );
	make_brush( "_losfix_debris_5d",	"-50 -1 -90",	"50 1 90",	"-3590 10720 -43" );
	make_brush( "_losfix_debris_5e",	"-1 -65 -90",	"1 65 90",	"-3640 10785 -43" );
	make_brush( "_losfix_debris_5f",	"-100 -1 -90",	"100 1 90",	"-3740 10850 -43" );
	make_brush( "_losfix_debris_5g",	"-1 -100 -90",	"1 100 90",	"-3840 10950 -43" );
	make_brush( "_losfix_debris_5h",	"-80 -1 -75",	"80 1 75",	"-3920 11050 -28" );
	make_brush( "_losfix_debris_5i",	"-30 -1 -50",	"30 1 50",	"-4030 11050 -43" );
	make_brush( "_losfix_debris_5j",	"-1 -20 -50",	"1 20 50",	"-3755 10640 0" );
	make_brush( "_losfix_debris_5k",	"-10 -1 -50",	"10 1 50",	"-3765 10660 0" );
	make_brush( "_losfix_debris_5l",	"-1 -20 -50",	"1 20 50",	"-3775 10680 0" );
	make_brush( "_losfix_debris_5m",	"-12 -1 -50",	"12 1 50",	"-3787 10700 0" );
	make_brush( "_losfix_debris_5n",	"-1 -10 -50",	"1 10 50",	"-3799 10710 0" );
	make_clip( "_losfix_debris_5clipa",	"SI Players",	1,	"-17 -70 -42",	"180 77 152",	"-3618 10750 -70",	"10 -60 0" );
	make_clip( "_losfix_debris_5clipb",	"SI Players",	1,	"-188 -156 0",	"206 96 228",	"-3716 10867 -178",	"0 -61 0" );
	make_clip( "_losfix_debris_5clipc",	"SI Players",	1,	"-98 -6 -67",	"11 276 160",	"-3893 10838 -110",	"0 33 0" );
	make_clip( "_losfix_debris_5clipd",	"SI Players",	1,	"-98 -316 -77",	"99 0 112",	"-3995 11241 -42",	"0 30 0" );
	make_clip( "_losfix_debris_5clipe",	"SI Players",	1,	"-48 -316 -77",	"73 -14 112",	"-4108 11488 -102",	"0 30 -12" );

	// LOS plane cabin top.

	make_brush( "_losfix_debris_6a",	"-20 -1 -39",	"20 1 39",	"-3750 10790 86" );
	make_brush( "_losfix_debris_6b",	"-1 -45 -129",	"1 45 129",	"-3770 10805 -4" );
	make_brush( "_losfix_debris_6c",	"-20 -1 -37",	"20 1 37",	"-3790 10850 84" );
	make_brush( "_losfix_debris_6d",	"-20 -30 -1",	"20 30 1",	"-3750 10820 48" );
	make_brush( "_losfix_debris_6e",	"-35 -40 -7",	"25 30 7",	"-3565 10690 53" );
	make_brush( "_losfix_debris_6f",	"-35 -60 -7",	"75 40 7",	"-3965 10935 41" );
	make_clip( "_losfix_debris_6clipa",	"SI Players",	1,	"-55 -27 0",	"7 76 76",	"-3744 10808 50",	"0 38 0" );
	make_clip( "_losfix_debris_6clipb",	"SI Players",	1,	"-44 -87 0",	"27 106 76",	"-3654 10898 50",	"0 38 0" );

	// Plane nose (no LOS needed).

	make_clip( "_losfix_debris_7clipa",	"SI Players",	1,	"-34 -70 -70",	"120 70 90",	"-4340 11609 -169",	"-23 0 0" );
	make_clip( "_losfix_debris_7clipb",	"SI Players",	1,	"-100 -90 -70",	"140 90 90",	"-4179 11609 -148",	"10 0 0" );
	make_clip( "_losfix_debris_7clipc",	"SI Players",	1,	"-128 -83 0",	"92 166 62",	"-3977 11658 -191",	"0 30 0" );
	make_clip( "_losfix_debris_7clipd",	"SI Players",	1,	"-102 -50 0",	"128 78 76",	"-4090 11838 -210",	"-5 0 -8" );
}