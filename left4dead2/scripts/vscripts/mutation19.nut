//-----------------------------------------------------
Msg("Activating Mutation 19\n");


DirectorOptions <-
{
	ActiveChallenge = 1

//	cm_frustrationTimer = 0
	cm_TankRun = true
	cm_ShouldHurry = true
	cm_AutoSpawnInfectedGhosts = true

	PreferredSpecialDirection = SPAWN_BEHIND_SURVIVORS
	BehindSurvivorsSpawnDistance = 2000
	TankRunSpawnDelay = 15

	MobMaxPending = 0

	// Always convert to the TANK!!!
	function ConvertZombieClass( iClass )
	{
		return 8;
	}	

	weaponsToConvert =
	{
		weapon_first_aid_kit = "weapon_pain_pills_spawn"
	}

	function ConvertWeaponSpawn( classname )
	{
		if ( classname in weaponsToConvert )
		{
			return weaponsToConvert[classname];
		}
		return 0;
	}
}

function OnGameEvent_round_start_post_nav( params )
{
	local function CheckOutputs( entity, outputName )
	{
		local ent = entity;
		local output = outputName;
		while ( ent )
		{
			local target = null;
			local targetOutput = "";
			local nElements = EntityOutputs.GetNumElements( ent, output );
			for ( local i = 0; i < nElements; i++ )
			{
				local outputs = {};
				EntityOutputs.GetOutputTable( ent, output, outputs, i );
				local outputTarget = Entities.FindByName( null, outputs.target );
				if ( !outputTarget )
					continue;
				
				if ( outputs.input == "Unlock" || outputs.input == "Enable" || outputs.input == "SetValueTest" || outputs.input == "MoveToFloor" )
					return outputTarget;
				else
				{
					if ( outputTarget.GetClassname() == "logic_relay" && outputs.input == "Trigger" )
					{
						target = outputTarget;
						targetOutput = "OnTrigger";
					}
				}
			}
			ent = target;
			output = targetOutput;
		}
		return null;
	}
	for ( local trigger; trigger = Entities.FindByClassname( trigger, "trigger_multiple" ); )
	{
		if ( NetProps.GetPropInt( trigger, "m_bAllowIncapTouch" ) == 0 || !EntityOutputs.HasAction( trigger, "OnEntireTeamStartTouch" ) )
			continue;
		
		NetProps.SetPropInt( trigger, "m_bAllowIncapTouch", 0 );
		local target = CheckOutputs( trigger, "OnEntireTeamStartTouch" );
		if ( !target )
			continue;
		
		if ( target.GetClassname() == "logic_relay" )
		{
			for ( local button; button = Entities.FindByClassname( button, "func_button" ); )
			{
				local nElements = EntityOutputs.GetNumElements( button, "OnPressed" );
				for ( local i = 0; i < nElements; i++ )
				{
					local outputs = {};
					EntityOutputs.GetOutputTable( button, "OnPressed", outputs, i );
					if ( outputs.target == target.GetName() )
					{
						target = button;
						break;
					}
				}
			}
		}
		else if ( target.GetClassname() == "logic_branch" )
		{
			local foundListener = false;
			for ( local listener; listener = Entities.FindByClassname( listener, "logic_branch_listener" ); )
			{
				for ( local i = 0; i < 16; i++ )
				{
					if ( NetProps.GetPropString( listener, "m_nLogicBranchNames[" + i + "]" ) == target.GetName() )
					{
						foundListener = true;
						break;
					}
				}
				
				if ( foundListener )
				{
					local nElements = EntityOutputs.GetNumElements( listener, "OnAllTrue" );
					for ( local i = 0; i < nElements; i++ )
					{
						local outputs = {};
						EntityOutputs.GetOutputTable( listener, "OnAllTrue", outputs, i );
						if ( outputs.input == "Unlock" )
						{
							target = Entities.FindByName( null, outputs.target );
							break;
						}
					}
					break;
				}
			}
		}

		local validOutputs = { func_button_timed = "OnTimeUp", func_button = "OnPressed", script_func_button = "OnPressed", prop_door_rotating = "OnOpen" };
		if ( !target.GetClassname() in validOutputs )
			continue;
		
		target.ValidateScriptScope();
		local targetScope = target.GetScriptScope();
		targetScope.OverrideTrigger <- trigger;
		targetScope.UseEnt <- function()
		{
			for ( local player; player = Entities.FindByClassname( player, "player" ); )
			{
				if ( player.IsSurvivor() && player.IsIncapacitated() )
				{
					if ( !OverrideTrigger.IsTouching( player ) )
						player.TakeDamage( player.GetHealth(), 0, null );
				}
			}
			self.DisconnectOutput( validOutputs[target.GetClassname()], "UseEnt" );
		}
		target.ConnectOutput( validOutputs[target.GetClassname()], "UseEnt" );
	}
}
