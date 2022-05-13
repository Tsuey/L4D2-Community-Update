//-----------------------------------------------------
Msg("Activating Mutation 15\n");


DirectorOptions <-
{
	ActiveChallenge = 1

	cm_ProhibitBosses = false
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
	local validStartNames = { func_button_timed = "OnTimeUp", func_button = "OnPressed", script_func_button = "OnPressed", trigger_finale = "UseStart", prop_door_rotating = "OnOpen" };
	local function GetSurvivalStartEntity()
	{
		local validIO = { logic_relay = { input = "Trigger", output = "OnTrigger" }, logic_timer = { input = "Enable", output = "OnTimer" } };
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
					
					if ( outputTarget.GetClassname() == "info_director" && outputs.input.find( "PanicEvent" ) != null )
						return outputTarget;
					else
					{
						if ( (outputTarget.GetClassname() in validIO) && (outputs.input == validIO[outputTarget.GetClassname()].input) )
						{
							target = outputTarget;
							targetOutput = validIO[outputTarget.GetClassname()].output;
						}
					}
				}
				ent = target;
				output = targetOutput;
			}
			return null;
		}

		foreach( classname, output in validStartNames )
		{
			for ( local ent; ent = Entities.FindByClassname( ent, classname ); )
			{
				if ( !EntityOutputs.HasAction( ent, output ) )
					continue;
				
				local target = CheckOutputs( ent, output );
				if ( (!target) || (target.GetClassname() != "info_director") )
					continue;
				
				return ent;
			}
		}
		return null;
	}

	EntFire( "info_director", "PanicEvent" );

	local startEntity = GetSurvivalStartEntity();
	if ( startEntity )
	{
		if ( startEntity.GetClassname() == "func_button_timed" || startEntity.GetClassname() == "trigger_finale" )
		{
			local nElements = EntityOutputs.GetNumElements( startEntity, validStartNames[startEntity.GetClassname()] );
			for ( local i = 0; i < nElements; i++ )
			{
				local outputs = {};
				EntityOutputs.GetOutputTable( startEntity, validStartNames[startEntity.GetClassname()], outputs, i );
				EntFire( outputs.target, outputs.input, outputs.parameter, outputs.delay );
			}
		}
		else
		{
			EntFire( startEntity.GetName(), "Unlock" );
			EntFire( startEntity.GetName(), "Press" );
			EntFire( startEntity.GetName(), "Open" );
		}
	}
}
