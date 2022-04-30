//Nescius' navmesh comparison script
//0. script_execute nav_compare
//1. load old nav
//2. script Store()
//3. load new nav (nav_load)
//4. script Compare()

//g_ModeScript.DeepPrintTable(allAreas);
//DebugDrawBoxAngles(Vector origin, Vector min, Vector max, QAngle direction, Vector rgb, int alpha, float duration)

function DebugDrawNavBox(a, b, color, alpha, pad=2, duration=99999) {
	local center = (a + b) * 0.5;
	DebugDrawBoxAngles(center, center - a - Vector(pad,pad,0), center - b + Vector(pad,pad,0), QAngle(0,0,0), color, alpha, duration);
}

function Store() {
	::storedAreas <- {};
	local allAreas = {};
	NavMesh.GetAllAreas(allAreas);

	foreach(area in allAreas) {
		storedAreas[area.GetID()] <- {
			origin = area.GetCenter(),
			nw = area.GetCorner(0),
			ne = area.GetCorner(1),
			se = area.GetCorner(2),
			sw = area.GetCorner(3),
			xSize = area.GetSizeX(),
			ySize = area.GetSizeY(),
			spawnAttr = area.GetSpawnAttributes(),
			attr = area.GetAttributes(),
		}
	}
}

::comp <- function(k) {
	local area = storedAreas[k];
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
			DebugDrawNavBox(area.nw, area.se, Vector(r,g,b), 128);
			//newArea.DebugDrawFilled(r, g, b, 150, 999999, true);
		}
		newAreas.rawdelete(newArea.GetID());
	}
	else {
		DebugDrawNavBox(area.nw, area.se, Vector(64,0,0), 192, 1);
	}
}

::drawNew <- function() {
	foreach(area in newAreas) {
		DebugDrawNavBox(area.GetCorner(0), area.GetCorner(2), Vector(255,255,255), 192, 1);
	}
}

function Compare(delay=0.00025) {
	DebugDrawClear();
	local i = 0;

	::newAreas <- {};
	local allAreas = {};
	NavMesh.GetAllAreas(allAreas);
	foreach(area in allAreas) {
		newAreas[area.GetID()] <- area;
	}

	foreach(k, area in storedAreas) {
		EntFire("worldspawn", "RunScriptCode", format("comp(%d)", k), delay*i++);
	}
	EntFire("worldspawn", "RunScriptCode", "drawNew()", delay*i);
}
