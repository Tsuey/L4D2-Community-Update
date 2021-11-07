local flDeleteDelay = 30;

local bIsAtomizerInitialized = false;

function InitAtomizer( path, deleteAfter )
{
	if ( !bIsAtomizerInitialized )
	{
		bIsAtomizerInitialized = true;

		self.ConnectOutput( "OnStartTouch", "HandleObjectTouch" );
		self.ConnectOutput( "OnEndTouch", "HandleObjectEndTouch" );
	}

	AddModelToFilter( path );
	flDeleteDelay = deleteAfter;
}

function ShutdownAtomizer()
{
	if ( !bIsAtomizerInitialized )
	{
		return;
	}

	bIsAtomizerInitialized = false;

	self.DisconnectOutput( "OnStartTouch", "HandleObjectTouch" );
	self.DisconnectOutput( "OnEndTouch", "HandleObjectEndTouch" );
}

local rgFilterModels = [];

function AddModelToFilter( path )
{
	if ( path == null )
	{
		return;
	}

	if ( rgFilterModels.find( path ) == null )
	{
		rgFilterModels.push( path );
	}
}

function RemoveModelFromFilter( path )
{
	local index = rgFilterModels.find( path );
	if ( index != null )
	{
		rgFilterModels.remove( index );
	}
}

local rgTrackedObjects = [];

local FindTrackedObject = function ( hndlEntity )
{
	if ( hndlEntity == null )
	{
		return null;
	}

	foreach ( index, tblObjectData in rgTrackedObjects )
	{
		if ( tblObjectData.m_hndlEntity == hndlEntity )
		{
			return index;
		}
	}

	return null;
}

local RemoveTrackedObjectByIndex = function ( index )
{
	local objectData = rgTrackedObjects[ index ];

	local hndlEntity = objectData.m_hndlEntity;
	if ( hndlEntity != null && hndlEntity.IsValid() && !objectData.rawin( "m_flGlowAfter" ) )
	{
		DoEntFire( "!caller", "StopGlowing", "", 0, hndlEntity, hndlEntity );
	}

	rgTrackedObjects.remove( index );

	if ( rgTrackedObjects.len() == 0 )
	{
		// BUG: Unable to remove think callback from callback
		DoEntFire( "!caller", "CallScriptFunction", "MaybeStopThinking", 0, self, self );
	}
}

// Callbacks
function HandleObjectTouch()
{
	// Msg( "HandleObjectTouch() " );
	// printl( activator );

	// Validate model
	if ( rgFilterModels.len() > 0 && rgFilterModels.find( activator.GetModelName() ) == null )
	{
		return;
	}
	
	local index = FindTrackedObject( activator );
	if ( index != null )
	{
		// Reset tracking data for object
		RemoveTrackedObjectByIndex( index );
	}

	local tblObjectData =
	{
		m_hndlEntity = activator.weakref(),
		m_flDeleteAfterTime = Time() + flDeleteDelay,
	};

	if ( flDeleteDelay >= 5 )
	{
		tblObjectData.rawset( "m_flGlowAfter", tblObjectData.m_flDeleteAfterTime - 5 );
	}

	rgTrackedObjects.push( tblObjectData );
	
	if ( rgTrackedObjects.len() == 1 )
	{
		// Msg( "Starting to Think()! \n" );
		// NOTE: Timer frequency depends on sv_script_think_interval value
		AddThinkToEnt( self, "HandleAtomizerThink" );
	}
}

function HandleObjectEndTouch()
{
	// Msg( "HandleObjectEndTouch() " );
	// printl( activator );
	
	local index = FindTrackedObject( activator );
	if ( index != null )
	{
		RemoveTrackedObjectByIndex( index );
	}
}

function HandleAtomizerThink()
{
	local flTime = Time();

	foreach ( index, tblObjectData in rgTrackedObjects )
	{
		local hndlEntity = tblObjectData.m_hndlEntity;
		if ( hndlEntity == null || !hndlEntity.IsValid() )
		{
			// Msg( "Dead entity handle!\n" );
			RemoveTrackedObjectByIndex( index );

			continue;
		}

		if ( tblObjectData.m_flDeleteAfterTime < flTime )
		{
			con_comment( "atomizer_logic: Removing blocking entity " + hndlEntity.tostring() );

			RemoveTrackedObjectByIndex( index );
			hndlEntity.Kill();

			continue;
		}

		if ( tblObjectData.rawin( "m_flGlowAfter" ) && tblObjectData.rawget( "m_flGlowAfter" ) < flTime )
		{
			// Msg( "StartGlowing() " );
			// printl( hndlEntity );

			DoEntFire( "!caller", "StartGlowing", "", 0, hndlEntity, hndlEntity );

			tblObjectData.rawdelete( "m_flGlowAfter" );
		}
	}
}

function MaybeStopThinking()
{
	// Since DoEntFire is asynchronous, we can't guarantee safety to remove think func - do the check first
	if ( rgTrackedObjects.len() == 0 )
	{
		// Msg( "Stopped Think()-ing! \n" );
		AddThinkToEnt( self, null );
	}
}
