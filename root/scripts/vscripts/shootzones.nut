ModeSpawns <-
[
	["ShootzoneTrigger", "shootzone_trigger_spawn_*", "shootzone_trigger_group", SPAWN_FLAGS.SPAWN],
	[ "ShootzoneSound", SPAWN_FLAGS.NOSPAWN ],
]


MutationState <-
{
	allPlayers = []
	playersInShootzone = []
	allShootzones = []
	enabledShootzones = []
	lastEnabledShootzoneID = -1
	FirstTime = true
}


MutationOptions <-
{
    cm_CommonLimit = 30 // Maximum number of common zombies alive in the world at the same time
 	//MegaMobSize = 20 // Total number of common zombies in a mob. (never more than CommonLimit at one time)
 	//cm_WanderingZombieDensityModifier = 0 // lets get rid of the wandering zombies
 	cm_MaxSpecials  = 0 // removes all special infected from spawning
 	cm_TankLimit    = 0 // removes all tanks from spawning
 	cm_WitchLimit   = 0 // removes all witches from spawning
	//BoomerLimit  = 0
 	//ChargerLimit = 0
 	//HunterLimit  = 0
	//JockeyLimit  = 0
	//SpitterLimit = 0
	//SmokerLimit  = 0
}


ShootzonesHUD <-
{
	Fields = 
	{
		player1   = { slot = HUD_LEFT_TOP,  name = "player1", dataval = "OUT", flags = HUD_FLAG_NOTVISIBLE | HUD_FLAG_ALIGN_LEFT },
		player2   = { slot = HUD_LEFT_BOT,  name = "player2", dataval = "OUT", flags = HUD_FLAG_NOTVISIBLE | HUD_FLAG_ALIGN_LEFT },
		player3   = { slot = HUD_RIGHT_TOP, name = "player3", dataval = "OUT", flags = HUD_FLAG_NOTVISIBLE | HUD_FLAG_ALIGN_LEFT },
		player4   = { slot = HUD_RIGHT_BOT, name = "player4", dataval = "OUT", flags = HUD_FLAG_NOTVISIBLE | HUD_FLAG_ALIGN_LEFT },
	}
}


function ShootzoneThinkSpawnCB( entity, rarity )
{
	printl( "Think Spawn!!!" )

	//entity.ValidateScriptScope()
	entity.GetScriptScope().ShootzoneThink <- function()
	{
		g_ModeScript.RecomputePlayersInShootzones()
	}
}


function OnGameplayStart()
{
	printl( "Starting SHOOTZONES!" )
	printl( "Max Flow Distance: " + GetMaxFlowDistance() )

	//Add all the players
	local playerEnt = null
	while ( playerEnt = Entities.FindByClassname( playerEnt, "player" ) )
	{
		if ( playerEnt.IsSurvivor() )
		{
			playerEnt.ValidateScriptScope()
			playerEnt.GetScriptScope().currentShootzone <- -1
			//playerEnt.GetScriptScope().currentShootzone = -1
			SessionState.allPlayers.append( playerEnt)
		}
	}

	//Initialize the HUD
	foreach ( index, playerEnt in SessionState.allPlayers )
	{
		local hudField = "player" + ( index + 1 )
		ShootzonesHUD.Fields[hudField].dataval = SessionState.allPlayers[index].GetPlayerName() + ": OUT"
		ShootzonesHUD.Fields[hudField].flags = ShootzonesHUD.Fields[hudField].flags & ~HUD_FLAG_NOTVISIBLE
	}

	EnableShootzones()

	//ScriptedMode_AddUpdate( RecomputePlayersInShootzones.bindenv(this) )

	local shootzone_think =
	{
		function GetSpawnList()      { return [ EntityGroup.SpawnTables.shootzone_think ] }
		function GetEntityGroup()    { return EntityGroup }
		EntityGroup =
		{
			SpawnTables =
			{
				shootzone_think = 
				{
					initialSpawn = true
					SpawnInfo =
					{
						classname = "logic_script"
						angles = Vector( 0, 0, 90 )
						targetname = "shootzone_think"
						origin = Vector( 0, 0, 0 )
						vscripts = "NULL_SCRIPT_NAME"
						thinkfunction = "ShootzoneThink"
					}
				}
			} // SpawnTables
		} // EntityGroup
	}

	local shootzoneThinkGroup = shootzone_think.GetEntityGroup()
	shootzoneThinkGroup.SpawnTables[ "shootzone_think" ].PostPlaceCB <- ShootzoneThinkSpawnCB
	g_MapScript.SpawnSingleAt( shootzoneThinkGroup, Vector( 0, 0, 0 ) , QAngle( 0, 0, 0 ) )
	g_MapScript.SpawnSingleAt( g_MapScript.GetEntityGroup( "ShootzoneSound" ), Vector( 0, 0, 0 ) , QAngle( 0, 0, 0 ) )

}


function OnActivate()
{
}


function OnEntityGroupRegistered( name, group )
{
	if ( name == "ShootzoneTrigger" )
	{
		group.GetEntityGroup().SpawnTables[ "shootzone_script" ].PostPlaceCB <- ShootzoneScriptSpawnCB
	}
}


function ShootzoneScriptSpawnCB( entity, rarity )
{
	printl( "Script spawned: " + entity + ", name: " + entity.GetName() )

	local shootzoneScope = entity.GetScriptScope()

	//Set the id of the shootzone
	shootzoneScope.id = SessionState.allShootzones.len()
	printl( "Shootzone ID: " + shootzoneScope.id )
	
	//Flow distance for the shootzone
	shootzoneScope.flowDistance = GetFlowDistanceForPosition( shootzoneScope.origin )
	shootzoneScope.flowPercent = GetFlowPercentForPosition( shootzoneScope.origin, true )
	shootzoneScope.flowPercent1 = GetFlowPercentForPosition( shootzoneScope.origin, false )
	printl( "Flow Distance: " + shootzoneScope.flowDistance )
	printl( "Flow Percent: " + shootzoneScope.flowPercent )

	//Add the shootzone to the list of all the shootzones
	SessionState.allShootzones.append( entity )
	
}


// HUD setup/control - our HUD is pretty simple in dash
function SetupModeHUD( )
{
	HUDSetLayout( ShootzonesHUD )

	HUDPlace( HUD_LEFT_TOP, 0.01, 0.06, 0.2, 0.04 )
	HUDPlace( HUD_LEFT_BOT, 0.01, 0.11, 0.2, 0.04 )
	HUDPlace( HUD_RIGHT_TOP, 0.01, 0.16, 0.2, 0.04 )
	HUDPlace( HUD_RIGHT_BOT, 0.01, 0.21, 0.2, 0.04 )
}


function FindShootzoneClosestToPlayers()
{

}

function EnableShootzones()
{
	//Cycle through the shootzones and keep 3 enabled at all times
	if ( SessionState.allShootzones.len() < 3 )
	{
		foreach ( shootzone in SessionState.allShootzones )
		{
			shootzone.GetScriptScope().EnableShootzone()
			SessionState.enabledShootzones.append( shootzone )

			SessionState.lastEnabledShootzoneID = shootzone.GetScriptScope().id
		}
	}
	else
	{
		local index = SessionState.lastEnabledShootzoneID + 1
		while ( SessionState.enabledShootzones.len() < 3 )
		{
			if ( index >= SessionState.allShootzones.len() )
			{
				index = 0;
			}

			//Enable the next available shootzone in the list
			local currentShootzone = SessionState.allShootzones[index]
			if ( currentShootzone.GetScriptScope().isEnabled == false )
			{
				currentShootzone.GetScriptScope().EnableShootzone()
				SessionState.enabledShootzones.append( currentShootzone )

				SessionState.lastEnabledShootzoneID = currentShootzone.GetScriptScope().id
			}

			index++
		}
	}
}


function RecomputePlayersInShootzones()
{
//	if ( SessionState.FirstTime )
//	{
//		foreach ( shootzone in SessionState.allShootzones )
//		{
//			local shootzoneScope = shootzone.GetScriptScope()
//			DebugDrawText( shootzoneScope.origin, "Distance: " + shootzoneScope.flowDistance + "\nPercent: " + shootzoneScope.flowPercent + "%", false, 100000 )
//		}
//		
//		SessionState.FirstTime = false;
//	}

	//Keep track of players currently in a shootzone
	local prevShootzonePlayers = clone( SessionState.playersInShootzone )

	//Recompute which players are in an active shootzone
	SessionState.playersInShootzone.clear()

	foreach ( playerEnt in SessionState.allPlayers )
	{
		foreach ( shootzone in SessionState.enabledShootzones )
		{
			local shootzoneScope = shootzone.GetScriptScope()
			if ( shootzoneScope.isActive )
			{
				local playerToShootzone = playerEnt.GetOrigin() - shootzoneScope.origin
				local playerDistance = playerToShootzone.Length()

				if ( playerDistance < 150 )
				{
					playerEnt.GetScriptScope().currentShootzone = shootzoneScope.id
					SessionState.playersInShootzone.append( playerEnt )
					break;
				}
			}
		}	
	}

	//foreach ( shootzone in SessionState.allShootzones )
	//{
		//local shootzoneScope = shootzone.GetScriptScope()
		//local vecto = SessionState.allPlayers[0].GetOrigin() - shootzoneScope.origin
		//local dist = vecto.Length()
		//
		//if ( dist < 500 )
		//{
			//DebugDrawText( shootzoneScope.origin, "Distance: " + shootzoneScope.flowDistance + "\nPercent: " + shootzoneScope.flowPercent + "%\nPercent2: " + shootzoneScope.flowPercent1, false, 0.15 )
			//
			//DebugDrawLine( shootzoneScope.origin, SessionState.allPlayers[0].GetOrigin(), 255, 0, 0, false, 0.2 )
		//}
	//}
//
	foreach ( index, playerEnt in SessionState.allPlayers )
	{
		//This player just entered a shootzone
		if ( prevShootzonePlayers.find( playerEnt ) == null &&
			 SessionState.playersInShootzone.find( playerEnt ) != null )
		{
			//Start playing the sound for players that just entered the shootzone
			printl( playerEnt.GetPlayerName() + " entered shootzone " + playerEnt.GetScriptScope().currentShootzone )
			EmitSoundOnClient( "c2m4.BadMan1", playerEnt )
		}

		//This player just exited a shootzone
		if ( prevShootzonePlayers.find( playerEnt ) != null &&
			 SessionState.playersInShootzone.find( playerEnt ) == null )
		{
			//Stop playing the sound for players that just exited the shootzone
			printl( playerEnt.GetPlayerName() +" exited shootzone " + playerEnt.GetScriptScope().currentShootzone )

			playerEnt.GetScriptScope().currentShootzone = -1
			StopSoundOn( "c2m4.BadMan1", playerEnt )
		}

		local inOrOut = "OUT"
		foreach ( shootzonePlayer in SessionState.playersInShootzone )
		{
			if ( shootzonePlayer.GetPlayerName() == playerEnt.GetPlayerName() )
			{
				inOrOut = "IN"
				break;
			}
		}

		//Set the player HUD flags
		local hudField = "player" + ( index + 1 )
		ShootzonesHUD.Fields[hudField].dataval = SessionState.allPlayers[index].GetPlayerName() + ": " + inOrOut
		ShootzonesHUD.Fields[hudField].flags = ShootzonesHUD.Fields[hudField].flags & ~HUD_FLAG_NOTVISIBLE
	}
}


function ShootzoneTimedOut( shootzoneID )
{
	foreach ( index, shootzone in SessionState.enabledShootzones )
	{
		if ( shootzone.GetScriptScope().id == shootzoneID )
		{
			SessionState.enabledShootzones.remove( index )
			break
		}
	}

	EnableShootzones()
}


function AllowTakeDamage( damageTable )
{
	foreach ( playerEnt in SessionState.allPlayers )
	{
		//If the attacker is a player
		if ( playerEnt == damageTable.Attacker )
		{
			//If the attacking player is in a shootzone then do damage
			foreach ( shootzonePlayer in SessionState.playersInShootzone )
			{
				if ( shootzonePlayer == damageTable.Attacker )
				{
					//printl( "Damage done by shootzone player: " + shootzonePlayer.GetPlayerName() )
					return true
				}
			}

			//Attacking player is not in a shootzone
			//printl( "Attacking player is not in shootzone: " + playerEnt.GetPlayerName() )
			return false
		}
	}

	//Attacker is not a player
	return true
}
