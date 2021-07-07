g_Chapter = "DEATH TOLL - BOAT HOUSE FINALE";

devchap( "ALL MODES" );

// FIXES_ALL

make_clip(	"_cliprework_startarea02",	"Survivors",	1,	"-1500 -16 -124",	"1500 16 880",		"2738 3824 412" );
make_clip(	"_cliprework_startarea01",	"Survivors",	1,	"-16 -1080 -216",	"16 0 700",		"1311.5 3785 596" );
make_clip(	"_cliprework_startarea03",	"Survivors",	1,	"-16 -1710 -450",	"16 0 500",		"4250 3811 792" );
make_clip( "_permstuck_cornertree", "SI Players", 1, "-17 -17 -17", "17 17 17", "4414.32 1858 17" );
make_clip( "_solidify_railposta", "Everyone", 1, "-6 -2 0", "6 2 33.8", "3924 -4516 -24" );
make_clip( "_solidify_railpostb", "Everyone", 1, "-6 -2 0", "6 2 33.8", "4020 -4516 -24" );
make_clip( "_solidify_railpostc", "Everyone", 1, "-2 -6 0", "2 6 33.8", "4116 -4228 -24" );
make_clip( "_solidify_railpostd", "Everyone", 1, "-2 -6 0", "2 6 33.8", "4116 -4132 -24" );
make_clip( "_solidify_railposte", "Everyone", 1, "-2 -6 0", "2 6 33.8", "4116 -4036 -24" );
make_clip( "_solidify_railpostf", "Everyone", 1, "-6 -2 0", "6 2 33.8", "4020 -3940 -24" );
make_clip( "_commonhop_backyard1", "Survivors", 1, "-1 -315 0", "1 315 922", "2689 2237 347" );
make_clip( "_commonhop_backyard2", "Survivors", 1, "-502 94 -180", "511 96 922", "2179 2456 360" );
make_clip( "_commonhop_backyard3", "Survivors", 1, "-242 94 -180", "146 96 922", "1505 2509 360", "0 -24 0" );
make_clip( "_commonhop_backyard4", "Survivors", 1, "-43 -54 -1", "34 28 1", "2175 2582 219" );
make_clip( "_nav_rockcliff_complete", "Survivors", 1, "-96 -348 -440", "15 276 1058", "6430 -4504 222", "0 6 0" );
make_clip( "_permstuck_rockclipwedge", "Survivors", 1, "-44 -246 -111", "38 166 1037", "1386 -4758 -161" );

// Not confirmed canon. Drainage fence or ranchhouse padlock are equally open-ended.

make_prop( "dynamic",		"_laststand_truck",		"models/props_vehicles/pickup_truck_2004.mdl",		"1261.08 1237.97 -207.962",		"3.2 191.071 3.5",			"shadow_yes",	"solid_yes",	"67 108 112" );
make_prop( "dynamic",		"_laststand_truckglass",	"models/props_vehicles/pickup_truck_2004_glass.mdl",		"1261.08 1237.97 -207.962",		"3.2 191.071 3.5",			"shadow_no",	"solid_yes",	"67 108 112" );
make_prop( "dynamic",		"_laststand_ammocan1",		"models/props/de_prodigy/ammo_can_02.mdl",		"1345.13 1232.73 -158.673",		"-1.487 280.487 1.214" );
make_prop( "dynamic",		"_laststand_ammocan2",		"models/props/de_prodigy/ammo_can_02.mdl",		"1337.56 1234.67 -164.912",		"-1.487 280.487 1.214" );
make_prop( "dynamic",		"_laststand_oldmanmurray",	"models/props_crates/static_crate_40.mdl",		"1310 1260.02 -166.166",		"1.214 190.519 1.488" );
make_prop( "dynamic",		"_laststand_ammocan3",		"models/props/de_prodigy/ammo_can_02.mdl",		"1305.72 1280.81 -142.713",		"1.188 191.518 85.509" );
make_prop( "dynamic",		"_laststand_lantern",		"models/props_unique/spawn_apartment/lantern.mdl",		"1340 1251 -163.04",		"1.201 191.019 3.498",			"shadow_no",	"solid_no" );

// The only finale without a one-way point-of-no-return... until now! (No delay needed for this trigger_finale inject)

con_comment( "LOGIC:\tRockslide and point-of-no-return entities will spawn when finale is started." );

function c10m5_rockslide()
{
	make_prop( "dynamic", "_rockslide_permtree", "models/props_foliage/trees_cluster01.mdl", "4220 -314 -221.9", "-11.9 255.7 -2.05", "shadow_no" );

	make_prop( "dynamic", "_rockslide_static_1a", "models/props/cs_militia/militiarock01.mdl", "4759 169 -96.8125", "18.3691 139.3506 313.0225", "shadow_no", "solid_yes", "255 255 255" );
	make_prop( "dynamic", "_rockslide_static_1b", "models/props/cs_militia/militiarock01.mdl", "4378.5313 -104.9063 -86.4063", "348.2227 79.4092 234.6680", "shadow_no", "solid_yes", "222 222 222" );
	make_prop( "dynamic", "_rockslide_static_1c", "models/props/cs_militia/militiarock01.mdl", "4480.125 -2.7188 -149.9375", "2.6807 26.7188 148.2275", "shadow_no", "solid_yes", "177 177 177" );
	make_prop( "dynamic", "_rockslide_static_2a", "models/props/cs_militia/militiarock02.mdl", "4606.125 98.625 -81.7813", "321.9873 261.167 46.4941", "shadow_no", "solid_yes", "255 255 255" );
	make_prop( "dynamic", "_rockslide_static_2b", "models/props/cs_militia/militiarock02.mdl", "4494.4688 -23.4688 -136.5", "10.415 39.7266 329.0625", "shadow_no", "solid_yes", "222 222 222" );
	make_prop( "dynamic", "_rockslide_static_2c", "models/props/cs_militia/militiarock02.mdl", "4450.1875 -119.8125 -83.0938", "342.1143 278.4375 110.7861", "shadow_no", "solid_yes", "177 177 177" );

	//make_navblock( "_rockslide_navblockera", "Everyone", "Apply", "-1116 -128 -216", "0 128 666", "5194 245 -216" );
	//make_navblock( "_rockslide_navblockerb", "Everyone", "Apply", "-128 -845 -216", "128 500 666", "3950 -127 -216" );
	//make_navblock( "_rockslide_navblockerc", "Everyone", "Apply", "-1337 -32 -216", "216 64 666", "6310 501 -216" );

	make_clip( "_rockslide_survivorclipa", "Survivors", 1, "-572 -120 0", "399 -100 1100", "4455 -54 -224", "0 35 0" );
	make_clip( "_rockslide_survivorclipb", "Survivors", 1, "-17 -17 -17", "17 17 17", "4187 -415 -153" );
	make_clip( "_rockslide_survivorclipc", "Everyone", 1, "-17 -17 -17", "17 17 17", "4226 -192 -132" );

	make_trighurt( "_rockslide_trighurta", "Infected", "-128 -116 0", "148 96 225", "4417 -83 -221" );
	make_trighurt( "_rockslide_trighurtb", "Infected", "-128 -116 0", "148 96 225", "4667 157 -221" );

	EntFire( g_UpdateName + "_rockslide_trighurt*", "Kill", "", 1 );
}

EntFire( "trigger_finale", "AddOutput", "UseStart worldspawn:CallScriptFunction:c10m5_rockslide:0:-1" );

if ( g_BaseMode == "versus" )
{
	devchap( "BASE VERSUS" );

	// FIXES

    make_clip(	"_indoor_roof",			"Survivors",	1,	"-60 -84 -28",		"60 84 28",		"2244 4076 100" );

}
if ( g_BaseMode == "survival" )
{
	devchap( "BASE SURVIVAL" );

	// FIXES

    make_clip( "_survival_docksrocks", "Survivors", 1, "-78 -161 0", "87 153 1462", "2201 -4720 -174", "0 24 0" );

}

if ( HasPlayerControlledZombies() )
{
	make_brush( "_losfix_van",		"-1 -70 -8",	"1 70 8",	"3736 753 -181" );
	make_clip( "_ladder_middlehouse_clip", "Everyone", 1, "-10 -7 0", "10 -4 160", "3488 -3063 -84", "0 -34 0" );
	make_clip( "_rock_infected_clipqol", "SI Players", 1, "-140 -135 -105", "140 135 105", "3340 -5010 -324" );
	make_clip( "_rock_survivor_clipright", "Survivors", 1, "-195 -240 -216", "50 183 1700", "3255 -4984 -253" );
	make_clip( "_rock_survivor_clipleft", "Survivors", 1, "0 -240 -216", "200 105 1700", "3255 -4984 -253" );
	make_clip( "_rock_survivor_clipwedge", "Survivors", 1, "-255 -120 -216", "100 150 1700", "3255 -4984 -253" );
	make_clip( "_solidify_permstuck1", "SI Players", 1, "-17 -17 -17", "17 17 17", "2100 253 -112" );
	make_clip( "_solidify_permstuck2", "SI Players", 1, "-17 -17 -17", "17 17 17", "3141 387 -168" );
	make_clip( "_solidify_permstuck3", "SI Players", 1, "-17 -17 -17", "17 17 17", "5463 220 222" );
	make_clip( "_solidify_permstuck4", "SI Players", 1, "-17 -17 -17", "17 17 17", "6736 -2753 207" );
	make_clip( "_solidify_permstuck5", "SI Players", 1, "-17 -17 -17", "17 17 17", "2914 -1462 213" );
	make_clip( "_solidify_railposta", "Everyone", 1, "-6 -2 0", "6 2 33.8", "3924 -4516 -24" );
	make_clip( "_solidify_railpostb", "Everyone", 1, "-6 -2 0", "6 2 33.8", "4020 -4516 -24" );
	make_clip( "_solidify_railpostc", "Everyone", 1, "-2 -6 0", "2 6 33.8", "4116 -4228 -24" );
	make_clip( "_solidify_railpostd", "Everyone", 1, "-2 -6 0", "2 6 33.8", "4116 -4132 -24" );
	make_clip( "_solidify_railposte", "Everyone", 1, "-2 -6 0", "2 6 33.8", "4116 -4036 -24" );
	make_clip( "_solidify_railpostf", "Everyone", 1, "-6 -2 0", "6 2 33.8", "4020 -3940 -24" );
	make_ladder( "_ladder_firebarrelarea_cloned_eventperimloner", "6406.5 -2736 -31", "1374 -7828 1500", "13 90 0", "0 -1 0" );
	make_ladder( "_ladder_middlehouse_cloned_docksinwater", "3518 -4704.5 -205.5", "-16 1630 201" );
	make_ladder( "_ladder_tankfightcorner_cloned_eventperimloner", "6406.5 -2736 -31", "-1460 -7078 1500", "13 77 0", "-0.24 -0.97 0" );
	make_navblock( "_rock_navblock_outabounds", "Everyone", "Apply", "-32 -32 -216", "700 0 216", "2951 -5211 -295" );
	make_navblock( "_rock_navblock_underneath", "Everyone", "Apply", "-128 -128 -216", "0 0 216", "3198 -4848 -295" );
	make_prop( "dynamic", "_losblocker_tallladder", "models/props/cs_militia/militiarock01.mdl", "5639 -419 292", "-35.6616 352.555 -19.0887", "shadow_no" );
	make_prop( "dynamic", "_propladder_back", "models/props/cs_militia/militiarock02.mdl", "5205 -2 -118", "-3.36983 12.0544 17.6989", "shadow_no" );
	make_prop( "dynamic", "_propladder_front", "models/props/cs_militia/militiarock03.mdl", "4521 370 -250", "29.7193 155.282 23.7211", "shadow_no" );
	make_prop( "dynamic", "_rock_nav", "models/props_foliage/rock_coast02f.mdl", "3050 -5000 -438", "90 190 0", "191 191 191" );
	make_prop( "dynamic", "_rock_rene", "models/props_foliage/rock_coast02f.mdl", "3250 -4977 -242", "-5 177 3", "191 191 191" );
	make_prop( "dynamic", "_solidify_tree01", "models/props_foliage/trees_cluster02.mdl", "6115.44 -1254.23 254.159", "0.0 144.5 0.0", "shadow_no" );
	make_prop( "dynamic", "_solidify_tree02", "models/props_foliage/trees_cluster01.mdl", "5840.49 -1231.82 262.096", "0.0 185.5 0.0", "shadow_no" );
	make_prop( "dynamic", "_solidify_tree03", "models/props_foliage/trees_cluster02.mdl", "5674.99 -173.235 286.403", "5.75837 274.813 12.6214", "shadow_no" );
	make_prop( "dynamic", "_solidify_tree04", "models/props_foliage/trees_cluster01.mdl", "5482.81 241.228 132.695", "-12.1912 25.172 7.18842", "shadow_no" );
	make_prop( "dynamic", "_solidify_tree05", "models/props_foliage/trees_cluster02.mdl", "5140.97 482.588 161.3", "-5.34185 52.754 5.27212", "shadow_no" );
	make_prop( "dynamic", "_solidify_tree06", "models/props_foliage/trees_cluster01.mdl", "4947.63 841.389 177.102", "-15.3542 25.5395 5.64541", "shadow_no" );
	make_prop( "dynamic", "_solidify_tree07", "models/props_foliage/trees_cluster02.mdl", "4596 -847.291 46.5099", "-10.7147 193.235 -2.50372", "shadow_no" );
	make_prop( "dynamic", "_solidify_tree08", "models/props_foliage/trees_cluster01.mdl", "4472.11 -1332.35 92.7903", "3.1137 10.7052 10.6639", "shadow_no" );
	make_prop( "dynamic", "_solidify_tree09", "models/props_foliage/trees_cluster02.mdl", "3330.26 -1363.53 109.319", "0.0 173.5 0.0", "shadow_no" );
	make_prop( "dynamic", "_solidify_tree10", "models/props_foliage/trees_cluster01.mdl", "2913.72 -1441.18 125.267", "-6.93085 51.3826 10.6265", "shadow_no" );
	make_prop( "dynamic", "_solidify_tree11", "models/props_foliage/trees_cluster02.mdl", "2806.21 -1397.96 136.034", "-5.62152 106.407 -2.15325", "shadow_no" );
	make_prop( "dynamic", "_solidify_tree12", "models/props_foliage/trees_cluster02.mdl", "6591.85 -1674.72 249.755", "5.97716 272.278 -1.19737", "shadow_no" );
	make_prop( "dynamic", "_solidify_tree13", "models/props_foliage/trees_cluster01.mdl", "6860.31 -1957.59 260.658", "4.82922 217.555 1.29717", "shadow_no" );
	make_prop( "dynamic", "_solidify_tree14", "models/props_foliage/trees_cluster02.mdl", "6936.06 -2695.45 140.336", "-9.40842 32.8524 -16.7709", "shadow_no" );
	make_prop( "dynamic", "_solidify_tree15", "models/props_foliage/trees_cluster01.mdl", "6743.79 -2761.88 140.372", "-7.2427 336.942 -0.575684", "shadow_no" );
	make_prop( "dynamic", "_solidify_tree16", "models/props_foliage/old_tree01.mdl", "6754.94 -3134.69 175.772", "3.99839 219.252 11.5523", "shadow_no" );
	make_prop( "dynamic", "_solidify_tree17", "models/props_foliage/trees_cluster02.mdl", "6691.45 -3321.24 167.145", "-5.27616 263.338 11.0332", "shadow_no" );
	make_prop( "dynamic", "_solidify_tree18", "models/props_foliage/old_tree01.mdl", "3392 -87.0611 -192", "0.295558 271.978 -8.4949", "shadow_no" );
	make_prop( "dynamic", "_solidify_tree19", "models/props_foliage/trees_cluster02.mdl", "3343.3 304.445 -195.784", "-2.83356 324.754 -6.57611", "shadow_no" );
	make_prop( "dynamic", "_solidify_tree20", "models/props_foliage/trees_cluster01.mdl", "3135.65 343.649 -172.46", "4.82922 270.055 1.29717", "shadow_no" );
	make_prop( "dynamic", "_solidify_tree21", "models/props_foliage/trees_cluster02.mdl", "3004 -49.16 -159.143", "0.0 193.0 0.0", "shadow_no" );
	make_prop( "dynamic", "_solidify_tree22", "models/props_foliage/old_tree01.mdl", "2800 176.84 -175", "0.0 152.0 0.0", "shadow_no" );
	make_prop( "dynamic", "_solidify_tree23", "models/props_foliage/trees_cluster02.mdl", "2600 166.84 -176", "0.0 197.0 0.0", "shadow_no" );
	make_prop( "dynamic", "_solidify_tree24", "models/props_foliage/trees_cluster02.mdl", "2472.84 354 -191", "0.0 342.0 0.0", "shadow_no" );
	make_prop( "dynamic", "_solidify_tree25", "models/props_foliage/trees_cluster01.mdl", "2103.88 254.77 -193.143", "0.0 43.0 0.0", "shadow_no" );
	make_prop( "dynamic", "_solidify_tree26", "models/props_foliage/trees_cluster02.mdl", "2236.99 768.711 -202.778", "-6.18811 116.848 12.0217", "shadow_no" );
	make_prop( "dynamic", "_solidify_tree27", "models/props_foliage/old_tree01.mdl", "2157.68 1276.4 -199.196", "-2.87053 121.382 4.69345", "shadow_no" );
	make_prop( "dynamic", "_solidify_tree28", "models/props_foliage/trees_cluster02.mdl", "5416.34 565.308 209.588", "0.0 268.0 0.0", "shadow_no" );
	make_prop( "physics",		"_hittable_log",		"models/props_foliage/tree_trunk_fallen.mdl",		"5405 -2480 -103",		"0 0 2", "shadow_no" );
	make_prop( "physics_ovr", "_hittable_rock", "models/props/cs_militia/militiarock01.mdl", "1721 -1971 -4", "10.6 49.1 10.9", "shadow_no" );
	patch_nav_obscured( "5298 328 153" );
	patch_nav_obscured( "5020 664 190" );
}