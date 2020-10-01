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
				switch( g_MapName )
				{
					case "c1m2_streets":
					{
						// move tank spawn at ceda truck drop to the top of the stairs (~44% boss flow)
						if( CheckToWarpTank( hndTank, [-4755, 555, -4295, 1110] ) )
						{
							hndTank.SetOrigin( Vector( -5025, 725, 384.1 ) );
						}
						break;
					}
					case "c2m2_fairgrounds":
					{
						// move tank spawn inside carousel fence to behind the carousel (~80% boss flow)
						if( CheckToWarpTank( hndTank, [-2750, -5450, -1450, -4925] ) )
						{
							hndTank.SetOrigin( Vector( -1725, -5900, 68.0 ) );
						}
						break;
					}
					case "c2m3_coaster":
					{
						// move tank spawn in the swan room to the next room forward (~25% boss flow)
						if( CheckToWarpTank( hndTank, [-300, 4100, 720, 4850] ) )
						{
							hndTank.SetOrigin( Vector( -312, 4155, 128.1 ) );
						}
						// move tank spawn after the coaster one way drop to the button area (76-79% boss flow)
						else if( CheckToWarpTank( hndTank, [-3700, 400, -3100, 1775] ) )
						{
							hndTank.SetOrigin( Vector( -3810, 1845, 160.1 ) );
						}
						// additional warp for the coaster one way drop area (80-83% boss flow)
						else if( CheckToWarpTank( hndTank, [-3700, 1775, -3100, 2850] ) )
						{
							hndTank.SetOrigin( Vector( -3423, 3480, 368.1 ) );
						}
						break;
					}
					case "c5m5_bridge":
					{
						// move all bridge tank spawns a bit further down the bridge to discourage rushing
						if( CheckToWarpTank( hndTank, [-1450, 5955, -100, 6705] ) )
						{
							hndTank.SetOrigin( Vector( 830, 6328, 792 ) );
						}
						else if( CheckToWarpTank( hndTank, [-100, 5955, 2000, 6705] ) )
						{
							hndTank.SetOrigin( Vector( 2720, 6338, 792 ));
						}
						else if( CheckToWarpTank( hndTank, [2000, 5955, 4740, 6705] ) )
						{
							hndTank.SetOrigin( Vector( 4285, 6325, 792 ) );
						}
						break;
					}
					case "c12m4_barn":
					{
						// move tank spawn from hillside before event area to top of trains (~60% boss flow)
						if( CheckToWarpTank( hndTank, [10535, -5508, 11360, -4625] ) )
						{
							hndTank.SetOrigin( Vector( 10492, -4633, 57.9 ) );
						}
						break;
					}
					case "c13m4_cutthroatcreek":
					{
						// move tank spawns back a bit to discourage rushing
						if( CheckToWarpTank( hndTank, [-1910, -2100, -470, -850] ) )
						{
							hndTank.SetOrigin( Vector( -488, -516, -374.9 ) );
						}
						else if( CheckToWarpTank( hndTank, [-960, -850, -195, 50] ) )
						{
							hndTank.SetOrigin( Vector( -672, 362, -381.8 ) );
						}
						break;
					}
					default:
						break;
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