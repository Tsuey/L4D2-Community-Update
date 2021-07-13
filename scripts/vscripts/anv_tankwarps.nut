printl( "VSCRIPT: Running anv_tankwarps.nut" );

/*
Only runs in versus mode, excludes TAAANNKK mutation
Teleports tanks which spawn in problematic areas to more reasonable locations
AI Tank is teleported instantly and angles are not set to preserve Valve's randomness
Does not support maps with more than 1 tank spawn (ie finales) - but could in the future if necessary
*/

::anv_tankwarps <-
{
	iTankCount = 0,

	function OnGameEvent_tank_spawn( params )
	{
		if( "tankid" in params )
		{
			local hndTank = EntIndexToHScript( params["tankid"] );
			iTankCount++;

			if( iTankCount == 1 )
			{
				if( g_FixScriptTable != null && "DoTankWarp" in g_FixScriptTable )
				{
					g_FixScriptTable["DoTankWarp"]( hndTank );
				}
			}
		}
	}

	// Check that the tank's position is within a set of cords [x(min), y(min), x(max), y(max)]
	function CheckToWarpTank( tank, cords )
	{
		local vPosition = tank.GetOrigin();

		if( vPosition.x >= cords[0] && vPosition.x < cords[2] && vPosition.y >= cords[1] && vPosition.y < cords[3] )
		{
			return true;
		}
		else
		{
			return false;
		}
	}
}

__CollectEventCallbacks( ::anv_tankwarps, "OnGameEvent_", "GameEventCallbacks", RegisterScriptGameEventListener );