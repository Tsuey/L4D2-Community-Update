allAreas <- {};
newAreas <- {};
NavMesh.GetAllAreas(allAreas);
DebugDrawClear();

foreach(area in allAreas) {
    newAreas[area.GetID()] <- area;
}

g_ModeScript.DeepPrintTable(allAreas);

//DebugDrawBoxAngles(Vector origin, Vector min, Vector max, QAngle direction, Vector rgb, int alpha, float duration)

function DebugDrawRectangle(a, b, color, alpha, duration) {
    local center = (a + b) * 0.5;
    DebugDrawBoxAngles(center, center - a - Vector(5,5,0), center - b + Vector(5,5,0) , QAngle(0,0,0), color, alpha, duration)
}

if(!("storedAreas" in DirectorScript)) {
    DirectorScript.storedAreas <- {};

    foreach(area in allAreas) {
        DirectorScript.storedAreas[area.GetID()] <- {
            origin = area.GetCenter(),
            nw = area.GetCorner(0),
            ne = area.GetCorner(1),
            se = area.GetCorner(2),
            sw = area.GetCorner(3),
            xSize = area.GetSizeX(),
            ySize = area.GetSizeY(),
            spawnAttr = area.GetSpawnAttributes(),
            attr = area.GetAttributes()
        }
    }
}
else {
    foreach(area in DirectorScript.storedAreas) {
        local r = 0, g = 0, b = 0;
        local rayStart = area.origin + Vector(0,0,50);
        local rayEnd = rayStart - Vector(0,0,100);
        local newArea = NavMesh.FindNavAreaAlongRay(rayStart, rayEnd, null);

        if(newArea) {
            if(newArea.GetSizeX() != area.xSize || newArea.GetSizeY() != area.ySize) {
                r = 255;
            }
            if((newArea.GetSpawnAttributes() ^ area.spawnAttr) & ~117587968) {
                g = 255;
            }
            if((newArea.GetAttributes() ^ area.attr) & ~(-134217728)) {
                b = 255;
            }

            if(r||g||b) {
                DebugDrawRectangle(area.nw, area.se, Vector(r,g,b), 128, 120);
                //newArea.DebugDrawFilled(r, g, b, 150, 999999, true);
            }
            newAreas.rawdelete(newArea.GetID());
        }
        else {
            DebugDrawRectangle(area.nw, area.se, Vector(0,0,0), 128, 120);
        }

    }
    foreach(area in newAreas) {
        area.DebugDrawFilled(255, 255, 255, 128, 120, true);
    }
}

function resetStored() {
    DirectorScript.rawdelete("storedAreas");
    g_ModeScript.rawdelete("allAreas");
    g_ModeScript.rawdelete("newAreas");
}
