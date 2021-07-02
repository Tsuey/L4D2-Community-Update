g_Chapter = "LAST STAND - LIGHTHOUSE FINALE";

devchap( "ALL MODES" );

// FIXES_ALL

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