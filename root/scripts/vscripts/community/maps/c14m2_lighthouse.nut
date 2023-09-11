g_Chapter = "LAST STAND - LIGHTHOUSE FINALE";

devchap( "ALL MODES" );

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
	if ( g_BaseMode == "versus" )
	{
		devchap( "BASE VERSUS" );

		// FIXES

		make_clip( "_permstuck_treefence", "Everyone", 1, "-8 -8 -27", "8 8 27", "-2552 4572 482" );
	}

	if ( HasPlayerControlledZombies() )
	{
		make_clip( "_dispcrouch_cliffside", "SI Players", 1, "-120 -8 -80", "120 8 80", "127 -818 428", "0 8 -10" );
	}
}