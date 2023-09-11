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
}