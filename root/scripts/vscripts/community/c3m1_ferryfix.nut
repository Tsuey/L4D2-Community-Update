/*****************************************************************************
**  PLANKCOUNTRY FERRY FIX
**
**  If a survivor skips past the ferry, the other survivors will not be
**  able to activate the ferry, as it requires all living survivors to be
**  inside it, preventing the other survivors from using the ferry.
**
**  This fix checks the positions of all survivors when the ferry button
**  is pressed (only while locked) to see if they are either inside the
**  ferry, or have skipped past the ferry, and allows it to be used if
**  all checks are passed.
**
**  If all survivors are inside the ferry as normal, this script will not
**  be run, the standard logic will be used to activate the ferry.
*****************************************************************************/

printl( "Logic modified for ferry softlock fix" );

// Define area below ferry entrance level.
local c4m2_areaSwamp_vecMin = Vector( -4344, 328, -248 );
local c4m2_areaSwamp_vecMax = Vector(  -8, 10232, 1016 );

// Define area within ferry.
local c4m2_areaFerry_vecMin = Vector( -5344, 5960, -16 );
local c4m2_areaFerry_vecMax = Vector( -5152, 6168, 128 );

// Injected I/O. If button_inferry is pressed while locked, check survivor positions to see if any survivors have skipped the ferry, and if remaining survivors are in the ferry.
EntFire( "ferry_tram_button", "AddOutput", "OnUseLocked worldspawn:RunScriptCode:c3m1_CheckSurvivors():0:-1" );

// Loop through all survivors to check if their positions are within the defined areas.
// End the loop if we find a valid survivor that is outside these areas.
function c3m1_CheckSurvivors()
{
	if ( developer() > 0 ) { printl( "Ran c3m1_CheckSurvivors" ); }

	local checkPassed = true;

	// Loop through all living survivors.
	for ( local hndSurvivor; ( hndSurvivor = Entities.FindByClassname( hndSurvivor, "player" ) ) != null; )
	{
		// Emulate standard behaviour by ignoring dead, incapped, and hanging survivors.
		if ( hndSurvivor.IsSurvivor() && ! hndSurvivor.IsDead() && ! hndSurvivor.IsDying() && ! hndSurvivor.IsIncapacitated() && ! hndSurvivor.IsHangingFromLedge() )
		{
			// Validate position of this survivor.
			checkPassed = c3m1_ValidatePosition( hndSurvivor.GetOrigin() );

			// A survivor failed the check, end the function early and do not activate the ferry.
			if ( checkPassed == false ) { return false; }
		}
	}

	// Successfully validated all survivors, so activate the ferry.
	if ( developer() > 0 ) { printl( "All survivors have passed validation, activating ferry" ); }

	// Remove the ferry button denial director hint to avoid confusion.
	//EntFire( "event_ferry_deny", "Kill" );

	// Simulate button press on button_inferry to run its OnPressed events.
	// Button has to be unlocked for the Press input to work.
	EntFire( "ferry_tram_button", "Unlock" );
	EntFire( "ferry_tram_button", "Press" );
}

// Check if the passed survivor position is between the min and max vectors of the defined areas.
// Returns true if survivor is within the defined areas.
// Returns false if survivor is outside the defined areas.
function c3m1_ValidatePosition( vecSurvivor )
{
	if ( developer() > 0 ) { printl( "Validating position: " + vecSurvivor ); }

	if ( ( vecSurvivor.x > c4m2_areaSwamp_vecMin.x && vecSurvivor.x < c4m2_areaSwamp_vecMax.x &&
		 vecSurvivor.y > c4m2_areaSwamp_vecMin.y && vecSurvivor.y < c4m2_areaSwamp_vecMax.y &&
		 vecSurvivor.z > c4m2_areaSwamp_vecMin.z && vecSurvivor.z < c4m2_areaSwamp_vecMax.z )
		 ||
		 ( vecSurvivor.x > c4m2_areaFerry_vecMin.x && vecSurvivor.x < c4m2_areaFerry_vecMax.x &&
		 vecSurvivor.y > c4m2_areaFerry_vecMin.y && vecSurvivor.y < c4m2_areaFerry_vecMax.y &&
		 vecSurvivor.z > c4m2_areaFerry_vecMin.z && vecSurvivor.z < c4m2_areaFerry_vecMax.z ) )
	{
		if ( developer() > 0 ) { printl( "Position passed validation" ); }
		return true;
	}

	if ( developer() > 0 ) { printl( "Position failed validation" ); }
	return false;
}
