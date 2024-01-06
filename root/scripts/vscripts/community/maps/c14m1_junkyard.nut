g_Chapter = "LAST STAND - THE JUNKYARD";

devchap( "ALL MODES" );

// Secret room
PrecacheModel( "models/deadbodies/dead_male_sittingchair.mdl" );
PrecacheModel( "models/props/cs_office/computer_caseb.mdl" );
PrecacheModel( "models/props/cs_office/computer_caseb_p1.mdl" );
PrecacheModel( "models/props/cs_office/computer_caseb_p1a.mdl" );
PrecacheModel( "models/props/cs_office/computer_caseb_p2.mdl" );
PrecacheModel( "models/props/cs_office/computer_caseb_p2a.mdl" );
PrecacheModel( "models/props/cs_office/computer_caseb_p3.mdl" );
PrecacheModel( "models/props/cs_office/computer_caseb_p3a.mdl" );
PrecacheModel( "models/props/cs_office/computer_caseb_p4.mdl" );
PrecacheModel( "models/props/cs_office/computer_caseb_p4a.mdl" );
PrecacheModel( "models/props/cs_office/computer_caseb_p4b.mdl" );
PrecacheModel( "models/props/cs_office/computer_caseb_p5.mdl" );
PrecacheModel( "models/props/cs_office/computer_caseb_p5a.mdl" );
PrecacheModel( "models/props/cs_office/computer_caseb_p5b.mdl" );
PrecacheModel( "models/props/cs_office/computer_caseb_p6.mdl" );
PrecacheModel( "models/props/cs_office/computer_caseb_p6a.mdl" );
PrecacheModel( "models/props/cs_office/computer_caseb_p6b.mdl" );
PrecacheModel( "models/props/cs_office/computer_caseb_p7.mdl" );
PrecacheModel( "models/props/cs_office/computer_caseb_p7a.mdl" );
PrecacheModel( "models/props/cs_office/computer_caseb_p8.mdl" );
PrecacheModel( "models/props/cs_office/computer_caseb_p8a.mdl" );
PrecacheModel( "models/props/cs_office/computer_caseb_p9.mdl" );
PrecacheModel( "models/props/cs_office/computer_caseb_p9a.mdl" );
PrecacheModel( "models/props/cs_office/computer_caseb_gib1.mdl" );
PrecacheModel( "models/props/cs_office/computer_caseb_gib2.mdl" );
PrecacheModel( "models/props/cs_office/computer_mouse.mdl" );
PrecacheModel( "models/props_lighting/lightbulb01a.mdl" );
PrecacheModel( "models/props_interiors/computer_monitor.mdl" );
PrecacheModel( "models/props_interiors/computer_monitor_p1.mdl" );
PrecacheModel( "models/props_interiors/computer_monitor_p1a.mdl" );
PrecacheModel( "models/props_interiors/computer_monitor_p2.mdl" );
PrecacheModel( "models/props_interiors/computer_monitor_p2a.mdl" );
PrecacheModel( "models/props_downtown/booth_table.mdl" );
PrecacheModel( "models/props_c17/computer01_keyboard.mdl" );

function DoRoundFixes()
{
	con_comment( "CVAR:\tSet \"director_convert_pills\" to 0 to prevent excess defib conversion." );

	Convars.SetValue( "director_convert_pills", 0 );

	make_prop( "dynamic", "_oneway_little_crate", "models/props_crates/static_crate_40.mdl", "-1544 -4760 -291.53", "2.10389 352.602 88.4171", "shadow_no" );
	make_prop( "dynamic", "_oneway_big_crate", "models/props/de_nuke/crate_small.mdl", "-1604 -4764 -308.04", "1.21232 343.98 2.21686", "shadow_no" );
	make_clip(	"_crate_headbump", "Everyone", 1, "-124 -8 -68.5", "124 8 68.5", "-1524 -4824 -245" );
	//patch_ladder( "-1647 -4772 -256.98", "0 112 15" );

	EntFire( "worldspawn", "RunScriptFile", "c14m1_junkyard" );

	// Francis' spawn X coordinate now changes from -4070 to -4058 when the intro finishes
	// to fix his spawn inside the plywood that he leans on. On solo Mutations with no
	// teammates to warp to, the player can get stuck and die here before getting control.
	// Note that the stuck timer persists even when paused, so if a player is both unlucky
	// enough to get stuck and also pauses, in extremely rare cases this may fire late.

	EntityOutputs.AddOutput( Entities.FindByName( null, "relay_intro_finished" ), "OnTrigger", "surv_p8", "AddOutput", "origin -4058 -10540 -303.64", 1.0, -1 );

	// Similar for Zoey briefly spawning stuck in the truck, but it's only a mild annoyance
	// instead of ever resulting in her death.

	EntityOutputs.AddOutput( Entities.FindByName( null, "relay_intro_finished" ), "OnTrigger", "surv_p5", "AddOutput", "origin -4207 -10491 -309.53", 1.0, -1 );

	// FIXES_ALL_EXCEPT_VERSUS

	if ( g_BaseMode != "versus" )
	{
		local wep_spawners = null;

		while ( wep_spawners = Entities.FindByClassname( wep_spawners, "weapon_*" ) )
		{
			if ( wep_spawners.IsValid() )
			{
				if ( !NetProps.HasProp( wep_spawners, "m_weaponID" ) )
					continue;

				local spawnflags = NetProps.GetPropInt( wep_spawners, "m_spawnflags" );

				if ( spawnflags == ( spawnflags | 4 ) )
					NetProps.SetPropInt( wep_spawners, "m_spawnflags", ( spawnflags & ~4 ) );
			}
		}
	}
	if ( g_BaseMode == "versus" )
	{
		EntFire( "car_alarm_prop", "Kill", null, 0 );
		EntFire( "car_alarm_event", "Kill", null, 0 );
		EntFire( "car_alarm_remarkable", "Kill", null, 0 );
		make_prop( "physics", "_replace_alarm_car", "models/props_vehicles/cara_95sedan.mdl", "-1501.48 -3502.26 -253.532", "0.537318 159.501 1.19641", "shadow_no", "solid_yes", "138 37 9" );
		make_prop( "dynamic", "_replace_alarm_car_glass", "models/props_vehicles/cara_95sedan_glass.mdl", "-1501.48 -3502.26 -253.532", "0.537318 159.501 1.19641", "shadow_no" );
		EntFire( g_UpdateName + "_replace_alarm_car_glass",	"SetParent", g_UpdateName + "_replace_alarm_car", 0 );
	}
}