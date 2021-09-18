//-----------------------------------------------------
Msg("Activating Mutation 15\n");


DirectorOptions <- 
{
	ActiveChallenge = 1

	cm_ProhibitBosses = 0
	cm_CommonLimit = 25
	cm_TankLimit = 1
	ZombieTankHealth = 2667

	SurvivalSetupTime = 90

	weaponsToRemove =
	{
		weapon_upgradepack_explosive = 0
	}

	function AllowWeaponSpawn( classname )
	{
		if ( classname in weaponsToRemove )
		{
			return false;
		}
		return true;
	}
}

function OnGameEvent_survival_round_start( params )
{
	EntFire( "info_director", "PanicEvent" );
	
	if ( SessionState.MapName == "c1m2_steets" )
		EntFire( "store_doors", "Open" );
	else if ( SessionState.MapName == "c7m1_docks" )
	{
		EntFire( "tankdoorin", "Open" );
		EntFire( "tankdoorin_button", "Kill" );
		EntFire( "tank_sound_timer", "Disable" );
		EntFire( "doorsound", "PlaySound" );
		EntFire( "tank_fog", "Enable" );
		EntFire( "tank_fog", "Disable", "", 0.5 );
		EntFire( "big_splash", "Start" );
		EntFire( "big_splash", "Stop", "", 2 );
		EntFire( "coop_tank", "Trigger" );
		EntFire( "radio_game_event", "Kill" );
		EntFire( "tank_door_clip", "Kill" );
		EntFire( "director", "EnableTankFrustration" );
		EntFire( "battlefield_cleared", "UnblockNav", "", 60 );
		EntFire( "tank_car_camera_clip", "Kill" );
	}
	else if ( SessionState.MapName == "c11m5_runway" )
		EntFire( "planecrash_trigger", "Trigger", "", 16 );
	else if ( SessionState.MapName == "c12m2_traintunnel" )
		EntFire( "emergency_door", "Open" );
}
