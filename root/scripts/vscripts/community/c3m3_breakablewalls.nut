::breakableWalls <- [];

local wallAreas = {};
NavMesh.GetAreasWithAttributes( 8, wallAreas ); //NO_JUMP areas indicate prop_wall_breakable is above them

local ix = 0, ent = null;
foreach( area in wallAreas )
{
    if ( ent = Entities.FindByClassnameWithin( null, "prop_wall_breakable", area.GetCenter(), 20 ) )
    {
        area.MarkAsBlocked( -1 );

        breakableWalls.append( ent );
        EntityOutputs.AddOutput( ent, "OnBreak", "worldspawn", "RunScriptCode", format( "if(!breakableWalls[%d].IsValid())NavMesh.GetNavAreaByID(%d).UnblockArea()", ix++, area.GetID() ), 0.5, -1 );
    }
}

local screenAreas = {};
NavMesh.GetAreasWithAttributes( 512, screenAreas ); //DONT_HIDE areas indicate bug screen prop_dynamic is above them
local screenRegex = regexp( "models/props_shacks/screen0\\d\\.mdl" );

foreach( area in screenAreas )
{
    for ( local screen = null; screen = Entities.FindByClassnameWithin( screen, "prop_dynamic", area.GetCenter(), 15 ); )
    {
        if ( screenRegex.match( screen.GetModelName() ) )
        {
            area.MarkAsBlocked( -1 );
            EntityOutputs.AddOutput( screen, "OnTakeDamage", "worldspawn", "RunScriptCode", format( "NavMesh.GetNavAreaByID(%d).UnblockArea()", area.GetID() ), 0.5, -1 );
            break;
        }
    }
}

EntFire( "walkway_water_avoidance", "AddOutput", "maxs 500 500 60" );
EntFire( "walkway_water_avoidance", "RunScriptCode", "{t<-{},NavMesh.GetNavAreasOverlappingEntityExtent(self, t)}foreach(a in t) if(a.IsUnderwater() && !a.HasAttributes(32)) a.MarkObstacleToAvoid(100)", 0.1 );