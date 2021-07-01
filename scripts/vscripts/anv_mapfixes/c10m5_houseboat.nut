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

if ( g_BaseMode == "coop" || g_BaseMode == "realism" )
{
	devchap( "BASE COOP" );

	// FIXES

}
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
if ( g_BaseMode == "scavenge" )
{
	devchap( "BASE SCAVENGE" );

	// FIXES

}