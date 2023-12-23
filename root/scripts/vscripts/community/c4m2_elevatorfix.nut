/*****************************************************************************
**  SUGARMILL_A ELEVATOR FIX
**
**  If a survivor skips past the elevator, the other survivors will not be
**  able to activate the elevator, as it requires all living survivors to be
**  inside it, preventing the other survivors from using the elevator.
**
**  This fix checks the positions of all survivors when the elevator button
**  is pressed (only while locked) to see if they are either inside the
**  elevator, or have skipped past the elevator, and allows it to be used if
**  all checks are passed.
**
**  If all survivors are inside the elevator as normal, this script will not
**  be run, the standard logic will be used to activate the elevator.
*****************************************************************************/

printl( "Logic modified for elevator softlock fix" );

// Define area below elevator entrance level.
local c4m2_areaField_vecMin = Vector( -3072, -14816, -32 );
local c4m2_areaField_vecMax = Vector(  1024, -9472,   624 );

// Define area within elevator shaft.
local c4m2_areaElevator_vecMin = Vector( -1576, -9632, 624 );
local c4m2_areaElevator_vecMax = Vector( -1400, -9496, 2528 );

// Injected I/O. If button_inelevator is pressed while locked, check survivor positions to see if any survivors have skipped the elevator, and if remaining survivors are in the elevator.
EntFire( "button_inelevator", "AddOutput", "OnUseLocked worldspawn:RunScriptCode:c4m2_CheckSurvivors():0:-1" );

// Loop through all survivors to check if their positions are within the defined areas.
// End the loop if we find a valid survivor that is outside these areas.
function c4m2_CheckSurvivors()
{
	if ( developer() > 0 ) { printl( "Ran c4m2_CheckSurvivors" ); }

	local checkPassed = true;

	// Loop through all living survivors.
	for ( local hndSurvivor; ( hndSurvivor = Entities.FindByClassname( hndSurvivor, "player" ) ) != null; )
	{
		// Emulate standard behaviour by ignoring dead, incapped, and hanging survivors.
		if ( hndSurvivor.IsSurvivor() && ! hndSurvivor.IsDead() && ! hndSurvivor.IsDying() && ! hndSurvivor.IsIncapacitated() && ! hndSurvivor.IsHangingFromLedge() )
		{
			// Validate position of this survivor.
			checkPassed = c4m2_ValidatePosition( hndSurvivor.GetOrigin() );

			// A survivor failed the check, end the function early and do not activate the elevator.
			if ( checkPassed == false ) { return false; }
		}
	}

	// Successfully validated all survivors, so activate the elevator.
	if ( developer() > 0 ) { printl( "All survivors have passed validation, activating elevator" ); }

	// Remove the elevator button denial director hint to avoid confusion.
	EntFire( "event_elevator_deny", "Kill" );

	// Simulate button press on button_inelevator to run its OnPressed events.
	// Button has to be unlocked for the Press input to work.
	EntFire( "button_inelevator", "Unlock" );
	EntFire( "button_inelevator", "Press" );
}

// Check if the passed survivor position is between the min and max vectors of the defined areas.
// Returns true if survivor is within the defined areas.
// Returns false if survivor is outside the defined areas.
function c4m2_ValidatePosition( vecSurvivor )
{
	if ( developer() > 0 ) { printl( "Validating position: " + vecSurvivor ); }

	if ( ( vecSurvivor.x > c4m2_areaField_vecMin.x && vecSurvivor.x < c4m2_areaField_vecMax.x &&
		 vecSurvivor.y > c4m2_areaField_vecMin.y && vecSurvivor.y < c4m2_areaField_vecMax.y &&
		 vecSurvivor.z > c4m2_areaField_vecMin.z && vecSurvivor.z < c4m2_areaField_vecMax.z )
		 ||
		 ( vecSurvivor.x > c4m2_areaElevator_vecMin.x && vecSurvivor.x < c4m2_areaElevator_vecMax.x &&
		 vecSurvivor.y > c4m2_areaElevator_vecMin.y && vecSurvivor.y < c4m2_areaElevator_vecMax.y &&
		 vecSurvivor.z > c4m2_areaElevator_vecMin.z && vecSurvivor.z < c4m2_areaElevator_vecMax.z ) )
	{
		if ( developer() > 0 ) { printl( "Position passed validation" ); }
		return true;
	}

	if ( developer() > 0 ) { printl( "Position failed validation" ); }
	return false;
}
