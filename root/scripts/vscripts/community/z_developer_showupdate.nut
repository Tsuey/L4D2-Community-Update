/*****************************************************************************
**  SHOW UPDATE DEMO  ( DEVELOPER MODE ONLY )
**
**  File "mapfixes.nut" will have already explained "script ShowUpdate()"
**  with 'devchap( "TUTORIAL" )' if it's an Official Valve map -- Community maps
**  have no updates and do nothing. Everything here requires "developer 1" or 2
**  and manual running of HideUpdate() or ShowUpdate().
**
**  HideUpdate() deletes the Timer Think and clears all visual changes.
**
**  ShowUpdate() creates the Timer Think, displays a tutorial regarding CLIP
**  (blocker) color coding which correspond with "r_drawclipbrushes 2" or 1,
**  then draws all new blockers and glows new props. Also useful to force a
**  re-catalog of any created/deleted "mapfixes"-prefixed entities.
**
**  DebugRedraw() is only called programmatically and isn't manual like the
**  others. It loops through all "mapfixes"-prefixed blockers and props
**  and uses DebugDrawBox() or "StartGlowing" on them accordingly, also drawing
**  their names as overlays with DebugDrawText(). DebugDrawText() has a couple
**  limitations: (1) "useViewCheck" parameter as "false" is the best setting
**  as it draws multiple names and through walls whereas "true" is singular
**  names not through walls; (2) even when "false" it only draws text of origins
**  in view which is the reason DebugRedraw() exists to constantly refresh it
**  to support tester movement; and (3) it has been confirmed on four machines
**  to never draw text if equal or greater than 9487 units away from testers.
**  Redrawing wouldn't be required if it were DebugDrawBox() alone, but doing
**  so empowers us with some "WYSIWYG" editing.
**
**  For those using this function in-game be aware that blockers you create
**  manually will have their DebugDrawBox's persist round transition but the
**  actual entity itself won't.
**
**  Note that "angles" should be used sparingly because DebugDrawBoxDirection()
**  only supports ForwardVector Y/yaw -- it won't represent X/pitch and Z/roll.
**  Kerry added DebugDrawBoxAngles() to use instead but rotated clips always
**  block Physics so they're still visually identified for evaluation.
**
**  All of this is strictly opt-in and manual because while redrawing doesn't
**  cause flickering on DebugDrawBox()'s, if "nav_edit 1" or "director_debug 1"
**  is in use those tools will flicker every 1 second. Draws are client-side
**  where even if it's your own server it takes ~7 seconds to exist where draws
**  before then will be missed -- but not if it's manual!
*****************************************************************************/

// Call to cease and desist DebugRedraw(). Technically fires "StopGlowing" to all blockers,
// too, but only props will process that Input and it's more efficient than another loop.

function HideUpdate()
{
	EntFire( g_UpdateName + "_DebugRedraw_timer", "Kill" );

	// Fail-safe 2nd DebugDrawClear to resolve a rare use timing of it not clearing.

	DebugDrawClear();
	EntFire( "worldspawn", "RunScriptCode", "DebugDrawClear()", 0.1 );
	EntFire( g_UpdateName + "*", "StopGlowing" );

	// Disable glows on props highlighted by ShowUpdate without with g_UpdateName prefixed.

	if ( g_TutorialShown )
	{
		
		for ( local index = 0;
				g_arrayFixHandles[index] != null && index <= g_arrayFixHandles.len();
				index++ )
		{
			if ( ! g_arrayFixHandles[index].IsValid() )
			{
				g_arrayFixHandles.remove( index );	// Entity is not valid, remove from array and skip.
				printl( "Invalid entity '" + index + "' removed from drawing index." );
				break;
			}
			
			EntFire( g_arrayFixHandles[index].GetName(), "StopGlowing" );
		}

		// Clean up global arrays.
		
		g_arrayFixHandles.clear();
		g_arrayLadderSources.clear();
		g_arrayFixHandles <- array( 1, null );
		g_arrayLadderSources <- array( 1, null);
	}

}

// Opacity override for DebugDrawBox's (default 37).

g_BoxOpacity <- 37;

// Define "constants" for colors used with DebugDrawBox.
// Constants and enums cannot be vectors, so make do with variables.

COLOR_CLIP_RED			<- Vector( 255,   0,   0 );
COLOR_CLIP_PINK			<- Vector( 185,   0, 185 );
COLOR_CLIP_GREEN		<- Vector(   0, 255,   0 );
COLOR_CLIP_BLUE			<- Vector(   0,   0, 255 );
COLOR_CLIP_LTBLUE		<- Vector(   0, 128, 255 );
COLOR_CLIP_BLACK		<- Vector(   0,   0,   0 );
COLOR_BRUSH_LTGREEN		<- Vector( 108, 200,  64 );
COLOR_NAV_ORANGE		<- Vector( 255,  45,   0 );
COLOR_TRIGGER_YELLOW	<- Vector( 255, 255,   0 );
COLOR_LADDER_WHITE		<- Vector( 255, 255, 255 );
COLOR_LADDER_PURPLE		<- Vector( 134,  60, 218 );
COLOR_LADDER_ORANGE		<- Vector( 255, 128,  64 );

// Only show CLIP (blocker) color coding tutorial once per load session.

g_TutorialShown <- false;

// Initialize SetFilter settings.

g_SetFilterClip <- 1;
g_SetFilterBrush <- 1;
g_SetFilterNav <- 1;
g_SetFilterTrigger <- 1;
g_SetFilterLadder <- 1;
g_SetFilterProp <- 1;
g_SetFilterText <- 1;
g_SetFilterClipType <- -1;

// Wrapper functions for ShowUpdate to allow the arguments to function with key binds.

function ShowUpdateAll()
{
	ShowUpdate( "all" )
}

function ShowUpdateNoCommunity()
{
	ShowUpdate( "nocoummunity" )
}

// Call to create a logic_timer as 1/10th of a Think to start DebugRedraw(). This Timer
// is named "g_UpdateName + _DebugRedraw_timer" and only exists if it's manually created.

function ShowUpdate( showGroup = "community" )
{

	// Ignore case sensitivity for arguments.
	showGroup = showGroup.tolower();

	// Print a quick tutorial to console for CLIP (blocker) color coding and binds.

	if ( ! g_TutorialShown )
	{
		printl( "\nSHOW UPDATE DEMO MODE" );
		printl( "_____________________" );
		
		printl( "\nCLIP (blocker) color coding:\n" );
		printl( "\tRED\t\tEveryone" );
		printl( "\tPINK\t\tSurvivors" );
		printl( "\tGREEN\t\tSI Players" );
		printl( "\tBLUE\t\tSI Players and AI" );
		printl( "\tLT BLUE\t\tAll and Physics" );
		
		printl( "\nOther color coding:\n" );
		printl( "\tLT GREEN\tBrush (blocks LOS & hitreg)" );
		printl( "\tORANGE\t\tNavigation blocked" );
		printl( "\tYELLOW\t\tTrigger volume" );
		printl( "\tWHITE\t\tInfected ladder clone" );
		printl( "\tPURPLE\t\tModified infected ladders / non-community ladders" );
		
		printl( "\nDrawn boxes marked \"ANGLED\" unpreventably block Physics." );
		printl( "Adjust box opacity with \"script g_BoxOpacity = #\" (0-255)." );
		
		printl( "\nUse \"r_drawclipbrushes 2\" or 1 to see BSP-baked brushes." );
		
		printl( "\nRecommended tester binds:\n" );
		printl( "\tbind [ \"script ShowUpdate(); r_drawclipbrushes 2\"" );
		printl( "\tbind ] \"script HideUpdate(); r_drawclipbrushes 0\"" );
		
		printl( "\nRecommended \"map mapname versus\" test environment:\n" );
		printl( "\t\"jointeam 2; sb_all_bot_game 1; sb_stop 1; god 1; director_stop\"" );
		
		printl( "\nExit with \"script HideUpdate()\" (if used with nav_edit and" );
		printl( "director_debug this also stops their flickering). If you use" );
		printl( "a make_ function, run ShowUpdate() again to apply changes." );
		
		printl( "\nUse \"script ShowUpdateAll()\" or \"script ShowUpdate(\"all\")\"" );
		printl( "to highlight community and non-community entities at the same time." );
		printl( "\nUse \"script ShowUpdateNoCommunity()\" or \"script ShowUpdate(\"nocommunity\")\"" );
		printl( "to only highlight non-community entities." );
		
		printl( "\nEntities highlighted by ShowUpdate() can be filtered with \"script SetFilter()\"" );
		printl( "Usage: script SetFilter(\"ENTITY GROUP\", \"FILTER VALUE\", \"CLIP TYPE [optional]\")" );
		printl( "Use \"script FilterHelp()\" for a full tutorial." );

		g_TutorialShown = true;
	}

	// Catalog all "mapfixes"-prefixed entities by populating a Handle array.
	// The "find" returns the earliest character index where 0 means it's a match.
	// The Timer (and any "helper entities") have no reason to be in this array.

	// Initialize global arrays.

	g_arrayFixHandles <- array( 1, null );
	g_arrayLadderSources <- array( 1, null);

	local entity = Entities.First();	// Start looping from "worldspawn".

	local index = 0;					// Increment not on loop but rather confirmed matches.

	while( ( entity = Entities.Next( entity ) ) != null )
	{
		
		// Store entity properties.
		
		local strEntityName = entity.GetName();
		local strClassname = entity.GetClassname();
		
		// Only check entities that we care about.
		
		switch ( strClassname )
		{
			case "env_physics_blocker":
			case "env_player_blocker":
			case "func_brush":
			case "func_nav_blocker":
			case "trigger_multiple":
			case "trigger_once":
			case "trigger_push":
			case "trigger_hurt":
			case "trigger_hurt_ghost":
			case "trigger_auto_crouch":
			case "trigger_playermovement":
			case "trigger_teleport":
			case "trigger_look":
			case "func_simpleladder":
				break;
			case "prop_dynamic":
			case "prop_dynamic_override":
			case "prop_physics":
			case "prop_physics_override":
				EntFire( strEntityName, "StopGlowing" ); // Reset glows on all models.
				break;
			default:
				continue; // Skip everything else.
				break;
		}
		
		// Determine which entities to index based on argument given in ShowUpdate().
		
		local communityUpdateEntity = strEntityName.find( g_UpdateName );
		local validEntity = 0;
		
		switch ( showGroup )
		{
			case "all":
				break;
			case "nocommunity":
				if ( communityUpdateEntity == 0 ) continue; // Found g_UpdateName at start of name, skip entity.
				break;
			default:
				if ( strClassname == "env_player_blocker" ) break; // Entity is a commentary blocker, index it.
				if ( communityUpdateEntity != 0 ) continue; // Did not find g_UpdateName at start of name, skip entity.
				break;
		}
		
		if ( strEntityName != g_UpdateName + "_DebugRedraw_timer" )
		{
			// Confirmed to be a fix entity so add it to array.
			
			g_arrayFixHandles[index] = entity;
			
			index++;
			
			// Resize array for next entity.
			
			g_arrayFixHandles.resize( index + 1 , null );
		}
	}

	printl( "\nIndexed "+ index + " entities!\n" );

	// Timer that DebugRedraw()'s every 1 second, better than AddThinkToEnt() because it
	// runs 1/10th as often and still looks good. Only make if one doesn't already exist.

	if ( Entities.FindByName( null, g_UpdateName + "_DebugRedraw_timer" ) == null )
	{
		SpawnEntityFromTable( "logic_timer",
		{
			targetname	=	g_UpdateName + "_DebugRedraw_timer",
			RefireTime	=	1,
			connections =
			{
				OnTimer =
				{
					cmd1 = "worldspawnCallScriptFunctionDebugRedraw0-1"
				}
			}
		} );
	}

	DebugRedraw()
}

// Declare function that houses the redraw loop the above Timer runs every 1 second.

function DebugRedraw()
{
	local index = 0;

	// Clear ladder model sources array at the start of a redraw.

	g_arrayLadderSources.clear()

	// Clear debug overlay info before starting a new redraw.
	// Props don't need to be "redrawn" since the one "StartGlowing" is sufficient.

	DebugDrawClear();

	// Draw all indexed entities.

	for ( index = 0;
			g_arrayFixHandles[index] != null && index <= g_arrayFixHandles.len();
			index++ )
	{
		// Remove invalid or deleted entities from array before drawing.
		
		if ( ! g_arrayFixHandles[index].IsValid() )
		{
			g_arrayFixHandles.remove( index );	// Entity is not valid, remove from array and skip.
			printl( "Invalid entity '" + index + "' removed from drawing index." );
			break;
		}
		
		// Store entity handles and values.
		
		local hndFixHandle = g_arrayFixHandles[index];
		local strClassname = hndFixHandle.GetClassname();
		local strTargetname = hndFixHandle.GetName();
		local vecOrigin = hndFixHandle.GetOrigin();
		local vecAngles = hndFixHandle.GetAngles();
		
		// Evaulate classname and apply debug draw.
		
		switch ( strClassname )
		{
			
			// Restore Keyvalues from make_clip() to draw visible box for invisible blocker.
			
			case "env_physics_blocker":
			case "env_player_blocker":
				
				local intBlockType = NetProps.GetPropInt( hndFixHandle, "m_nBlockType" );
				local blockerIsAngled = false;
				
				// Post-fix " (ANGLED)" to all blockers that have non-"0 0 0" rotation. This is
				// warned in ShowUpdate()'s tutorial. Engine forces rotated clips to block Physics!
				// NetProp "m_angRotation" used instead of GetAngles() because it returns a Vector.
				if ( NetProps.GetPropVector( hndFixHandle, "m_angRotation" ).tostring() != Vector( 0, 0, 0 ).tostring() )
				{
					blockerIsAngled = true;
					strTargetname = strTargetname + " (ANGLED)";
				}
				
				// See SetFilter function for values.
				
				switch ( g_SetFilterClip )
				{
					case 0:
						continue;
						break;
					case 1:
						break;
					case 2:
						if ( strClassname == "env_player_blocker" ) continue;
						break;
					case 3:
						if ( strClassname == "env_physics_blocker" ) continue;
						break;
					case 4:
						if ( blockerIsAngled == false ) continue;
						break;
				}
				
				if ( g_SetFilterClipType != -1 )
				{
					if ( g_SetFilterClipType != intBlockType ) continue;
				}
				
				local vecMins = NetProps.GetPropVector( hndFixHandle, "m_Collision.m_vecMins" );
				local vecMaxs = NetProps.GetPropVector( hndFixHandle, "m_Collision.m_vecMaxs" );
				local vecBoxColor = null;
				
				// Color debug box by BlockType.

				switch ( intBlockType )
				{
					case 0:	vecBoxColor = COLOR_CLIP_RED;		break;	// Everyone
					case 1:	vecBoxColor = COLOR_CLIP_PINK;		break;	// Survivors
					case 2:	vecBoxColor = COLOR_CLIP_GREEN;		break;	// SI Players
					case 3:	vecBoxColor = COLOR_CLIP_BLUE;		break;	// SI Players and AI
					case 4:	vecBoxColor = COLOR_CLIP_LTBLUE;	break;	// All and Physics
					default: vecBoxColor = COLOR_CLIP_BLACK;	break;	// Invalid/other values
				}

				// Note DebugDrawBoxDirection() with GetForwardVector() only supports Y (yaw).
				// X/pitch and Z/roll don't show. Kerry added DebugDrawBoxAngles() to fix this.
				// DebugDrawBoxAngles() requires a QAngle which GetAngles() returns!

				DebugDrawBoxAngles( vecOrigin, vecMins, vecMaxs,
							vecAngles, vecBoxColor,
							g_BoxOpacity, 99999999 );
				
				// Label env_player_blocker separately, we assume they are always from _commentary.txt
				
				local clipType = "";
				switch ( strClassname )
				{
					case "env_physics_blocker":	clipType =	"CLIP";  break;
					case "env_player_blocker":	clipType =	"PCLIP"; break;
				}
				
				// Draw text to identify entity.
				
				DebugRedrawName( vecOrigin, strTargetname, clipType, index);
				
				break;
			
			// Restore Keyvalues from make_brush() to draw visible box for invisible brush.
			
			case "func_brush":
			
				// See SetFilter function for values.
				
				switch ( g_SetFilterBrush )
				{
					case 0:
						continue;
						break;
					case 1:
						if ( NetProps.GetPropInt( hndFixHandle, "m_nModelIndex" ) != 0 ) continue; // Brushes from scripts won't have a model.
						break;
					case 2:
						break;
				}
				
				local vecMins = NetProps.GetPropVector( hndFixHandle, "m_Collision.m_vecMins" );
				local vecMaxs = NetProps.GetPropVector( hndFixHandle, "m_Collision.m_vecMaxs" );
				local vecBoxColor = COLOR_BRUSH_LTGREEN;

				// Brush rotation unsupported so GetAngles() does nothing.

				DebugDrawBoxAngles( vecOrigin, vecMins, vecMaxs,
							vecAngles, vecBoxColor,
							g_BoxOpacity, 99999999 );

				// Draw text to identify entity.
				
				DebugRedrawName( vecOrigin, strTargetname, "BRUSH", index);

				break;
			
			// Restore Keyvalues from make_navblock() to draw visible box for navblocked region.
			
			case "func_nav_blocker":
			
				// See SetFilter function for values.
				
				switch ( g_SetFilterNav )
				{
					case 0:
						continue;
						break;
					case 1:
						if ( NetProps.GetPropInt( hndFixHandle, "m_nModelIndex" ) != 0 ) continue; // Brushes from scripts won't have a model.
						break;
					case 2:
						break;
				}

				local vecMins = NetProps.GetPropVector( hndFixHandle, "m_Collision.m_vecMins" );
				local vecMaxs = NetProps.GetPropVector( hndFixHandle, "m_Collision.m_vecMaxs" );
				local vecBoxColor = COLOR_NAV_ORANGE;

				// Rotation on navblockers is especially unsupported and always 0's.

				DebugDrawBoxAngles( vecOrigin, vecMins, vecMaxs,
							vecAngles, vecBoxColor,
							g_BoxOpacity, 99999999 );

				// Draw text to identify entity.
				
				DebugRedrawName( vecOrigin, strTargetname, "NAVBLOCK", index);
				
				break;
			
			// Restore Keyvalues from several "trigger_" entities to draw visible boxes for them.
			
			case "trigger_multiple":
			case "trigger_once":
			case "trigger_push":
			case "trigger_hurt":
			case "trigger_hurt_ghost":
			case "trigger_auto_crouch":
			case "trigger_playermovement":
			case "trigger_teleport":
			case "trigger_look":
			
				// See SetFilter function for values.
				
				switch ( g_SetFilterTrigger )
				{
					case 0:
						continue;
						break;
					case 1:
						if ( NetProps.GetPropInt( hndFixHandle, "m_nModelIndex" ) != 0 ) continue; // Brushes from scripts won't have a model.
						break;
					case 2:
						break;
				}
				
				local vecMins = NetProps.GetPropVector( hndFixHandle, "m_Collision.m_vecMins" );
				local vecMaxs = NetProps.GetPropVector( hndFixHandle, "m_Collision.m_vecMaxs" );
				local vecBoxColor = COLOR_TRIGGER_YELLOW;

				// Triggers are a wildcard but try to draw Angles just in case they're non-0.
				// Note that "trigger_push" rotation has unknown mild influence on Push Direction
				// that's only noticeable with Death Toll 5's Rockslide RNG. Angles definitely don't
				// impact actual collidability and is why "trigger_hurt" fails entirely with them.

				DebugDrawBoxAngles( vecOrigin, vecMins, vecMaxs,
							vecAngles, vecBoxColor,
							g_BoxOpacity, 99999999 );

				// Draw text to identify entity.
				
				DebugRedrawName( vecOrigin, strTargetname, "TRIGGER", index);
				
				break;
			
			// Extract vecMins/vecMaxs from make_ladder() to draw visible box around cloned Infected Ladder.
			
			case "func_simpleladder":
			
				local vecMins = NetProps.GetPropVector( hndFixHandle, "m_Collision.m_vecMins" );
				local vecMaxs = NetProps.GetPropVector( hndFixHandle, "m_Collision.m_vecMaxs" );
				local vecBoxColor = COLOR_LADDER_WHITE;
				
				// Draw moved non-update-named ladders in purple.
				
				if ( strTargetname.find( g_UpdateName ) == null)
				{
					vecBoxColor = COLOR_LADDER_PURPLE;
				}
				
				// See SetFilter function for values.
				
				switch ( g_SetFilterLadder )
				{
					case 0:
						continue;
						break;
					case 1:
						if ( vecOrigin.tostring() == Vector( 0, 0, 0 ).tostring() )	// Ladders from scripts won't be at (0,0,0). Also highlights ladders that are not new but have been moved.
						{
							continue;
						}
						break;
					case 2:
						if ( vecOrigin.tostring() == Vector( 0, 0, 0 ).tostring() )	// Highlights built in ladders.
						{
							vecBoxColor = COLOR_LADDER_ORANGE;
						}
						break;
				}
				
				// Draw text at the SOURCE ladder's location for inspection/comparison.
				// For fun, sprinkle in its modelindex-turned-model so that it
				// can at least be compared with "developer 1" Table dumps!
				
				local modelName = hndFixHandle.GetModelName();
				
				DebugRedrawCloneSource(vecMins, modelName)

				// By the grace of GabeN with a sparkle of luck from Kerry ladders can be rotated.

				// Salt the opacity with + 24 so it stands out a bit more.

				DebugDrawBoxAngles( vecOrigin, vecMins, vecMaxs,
							vecAngles, vecBoxColor,
							g_BoxOpacity + 24, 99999999 );

				// Draw text to identify entity.
				
				DebugRedrawName( vecOrigin + MathLadderOrigin(vecMins, vecMaxs, vecAngles), strTargetname, "LADDER", index);
				
				break;
			
			// Keyvalues from make_prop() don't need restoration as attributes can be visually assessed.
			
			case "prop_dynamic":
			case "prop_dynamic_override":
			case "prop_physics":
			case "prop_physics_override":
			
				// See SetFilter function for values.
				
				switch ( g_SetFilterProp )
				{
					case 0:
						EntFire( strTargetname, "StopGlowing" );
						continue;
						break;
					case 1:
						break;
					case 2:
						if ( strClassname == "prop_physics" || strClassname == "prop_physics_override" ) continue;
						break;
					case 3:
						if ( strClassname == "prop_dynamic" || strClassname == "prop_dynamic_override" ) continue;
						break;
				}
				
				EntFire( strTargetname, "StartGlowing" );

				// Draw text to identify entity.
				
				DebugRedrawName( vecOrigin, strTargetname, "PROP", index);
				
				break;
				
			default:
				break;
		}
	}
}

// Function to handle the drawing of text on highlighted entities.

function DebugRedrawName( origin, name, entityType, index )
{
	
	// See SetFilter function for values.

	local UseViewCheck = false;

	if ( g_SetFilterText == 0 )
	{
		return;
	}
	else if ( g_SetFilterText == 2 )
	{
		UseViewCheck = true;
	}

	local namePrefix = entityType + ": ";
	local additionalPrefix = "";

	// Rules by entity type.

	switch ( entityType )
	{
		case "CLIP":
			additionalPrefix = "(LUMP)" // Prefix for non-mapfixes entities.
			break;
		case "PCLIP":
			additionalPrefix = "(COMMENTARY)" // Prefix for commentary blocker entities (env_player_blocker).
			break;
		default:
			break;
	}

	// Entity does not have a targetname.

	if ( name == "" )
	{
		name = "unnamed";
	}

	// Build display text and check for g_UpdateName string within entity name.

	if ( name.find( g_UpdateName ) == null )
	{
		namePrefix = additionalPrefix + " " + namePrefix;		// g_UpdateName was not found, mark as non-mapfixes entity.
	}
	else
	{
		name = name.slice( g_UpdateName.len(), name.len() );	// g_UpdateName string was found, remove it.
	}

	DebugDrawText( origin, namePrefix + name + " (" + index + ")", UseViewCheck, 10 );
}

// Function to handle the drawing of text on cloned ladder models.

function DebugRedrawCloneSource( origin, modelName )
{

	// See SetFilter function for values.

	local UseViewCheck = false;

	if ( g_SetFilterText == 0 )
	{
		return;
	}
	else if ( g_SetFilterText == 2 )
	{
		UseViewCheck = true;
	}

	// Build list of used ladder sources to avoid duplicating text.

	if ( g_arrayLadderSources.find( modelName ) == null )
	{
		DebugDrawText( origin, "LADDER CLONE SOURCE (" + modelName + ")", UseViewCheck, 10 );
		g_arrayLadderSources.resize( g_arrayLadderSources.len() + 1 , null );
		g_arrayLadderSources.append( modelName );
	}
}

// Calculate correct position to display text at with MathLadderOrigin, otherwise labels for rotated ladders will be displaced.

function MathLadderOrigin( vecMins, vecMaxs, vecAngles )
{

	// Position of ladder mins and maxs to transform.

	local vectorX = ( vecMins.x + vecMaxs.x ) / 2;
	local vectorY = ( vecMins.y + vecMaxs.y ) / 2;
	local vectorZ = ( vecMins.z + vecMaxs.z ) / 2;

	// Angle ladder is rotated by, in radians.

	local angleX = ( vecAngles.z * PI ) / 180;
	local angleY = ( vecAngles.x * PI ) / 180;
	local angleZ = ( vecAngles.y * PI ) / 180;

	// Store trig calculations.

	local cosX = cos( angleX );
	local cosY = cos( angleY );
	local cosZ = cos( angleZ );
	local sinX = sin( angleX );
	local sinY = sin( angleY );
	local sinZ = sin( angleZ );

	// Mid-calculation variables.

	local transformedX = 0;
	local transformedY = 0;
	local transformedZ = 0;

	// 3D rotation matrix.

	transformedY = ( cosX * vectorY ) - ( sinX * vectorZ );
	transformedZ = ( cosX * vectorZ ) + ( sinX * vectorY );
	vectorY = transformedY;
	vectorZ = transformedZ;

	transformedX = ( cosY * vectorX ) + ( sinY * vectorZ );
	transformedZ = ( cosY * vectorZ ) - ( sinY * vectorX );
	vectorX = transformedX;
	vectorZ = transformedZ;

	transformedX = ( cosZ * vectorX ) - ( sinZ * vectorY );
	transformedY = ( cosZ * vectorY ) + ( sinZ * vectorX );
	vectorX = transformedX;
	vectorY = transformedY;

	// Final result is the offset of the ladder from the world's origin (0,0,0), but corrected for rotation.
	// GetOrigin gives us the offset of the ladder from its cloned model.
	// Adding them together produces the actual position of the ladder in the world.

	return Vector( vectorX, vectorY, vectorZ );
}

// Function to change filtering for highlighted entities.
// Entering "all" in the value argument will default to 1, entering "none" will default to 0.

/*
** Entity Filters:
** all
**		- Entities:	All below entities
**		- Values:	0 = Hides all entity groups, 1 = Shows all entity groups (Default)
** clip
** 		- Entities:	env_physics_blocker, env_player_blocker
**		- Values:	0 = Hide all clips, 1 = Show all clips (Default), 2 = Only env_physics_blocker, 3 = Only env_player_blocker, 4 = Only angled blockers
** brush
** 		- Entities:	func_brush
**		- Values:	0 = Hide all brushes, 1 = Show all brushes with "model" key value set to "0" (Default), 2 = Shows all brushes
** nav
** 		- Entities:	func_nav_blocker
**		- Values:	0 = Hide all nav blockers, 1 = Show all nav blockers with "model" key value set to "0" (Default), 2 = Shows all nav blockers
** trigger
** 		- Entities:	trigger_multiple, trigger_once, trigger_push, trigger_hurt, trigger_hurt_ghost, trigger_auto_crouch,
**					trigger_playermovement, trigger_teleport
**		- Values:	0 = Hide all triggers, 1 = Show all triggers with "model" key value set to "0" (Default), 2 = Shows all triggers
** ladder
** 		- Entities:	func_simpleladders
**		- Values:	0 = Hide all ladders, 1 = Show all ladders with non-zero "origin" key value (Default), 2 = Shows all ladders
** prop
** 		- Entities:	prop_dynamic, prop_dynamic_override, prop_physics, prop_physics_override
**		- Values:	0 = Hide all props, 1 = Shows all props (Default), 2 = Show dynamic props only, 3 = Show physics props only
** text
**		- Entities: Debug text
**		- Values:	0 = Hides all text, 1 = Shows all text (Default), 2 = Shows text only if there is a direct line of sight
**
** Clip Type Filters:
**		- Entities:	env_physics_blocker, env_player_blocker - Filters by BlockType key value
**		- Values:	all (-1) = All block types (Default), 0 = Everyone, 1 = Survivors, 2 = Player Infected,
**					3 = All Special Infected (Player and AI), 4 = All players and physics objects (env_physics_blocker only)
*/

function SetFilter( entityGroup = null, value = null, clipType = null )
{

	// Ignore case sensitivity for arguments.

	entityGroup = entityGroup.tolower();

	// Catch invalid values for "value" argument.
	
	if ( typeof value != "integer" || value < 0 )
	{
		if ( value == "all" )
		{
			value = 1;
		}
		else if ( value == "none" )
		{
			value = 0;
		}
		else
		{
			printl( "\nValue: '" + value + "' is not a valid value.\n" );
			return;
		}
	}
	
	// Catch invalid values for "clipType" argument.
	
	if ( clipType != null )
	{
		if (typeof clipType != "integer" || clipType < -1 || clipType > 4 )
		{
			if ( clipType == "all" )
			{
				g_SetFilterClipType <- -1;
				printl( "\nClip Type filter set to: '-1'.\n" );
			}
			else
			{
				printl( "\nClip Type: '" + clipType + "' is not a valid value.\n" );
				return;
			}
		}
		else
		{
			if ( clipType != null )
			{
				g_SetFilterClipType <- clipType;
				printl( "\nClip Type filter set to: '" + clipType + "'.\n" );
			}
		}
	}

	// Change filter settings to parsed arguments.
	// Catch if value provided is outside the possible range, set to default if it is.
	
	switch ( entityGroup )
	{
		case "all":
			if (value > 1)
			{
				value = 1;
			}
			g_SetFilterClip <- value;
			g_SetFilterBrush <- value;
			g_SetFilterNav <- value;
			g_SetFilterTrigger <- value;
			g_SetFilterLadder <- value;
			g_SetFilterProp <- value;
			break;
		case "clip":
			if (value > 4)
			{
				value = 1;
			}
			g_SetFilterClip <- value;
			break;
		case "brush":
			if (value > 2)
			{
				value = 1;
			}
			g_SetFilterBrush <- value;
			break;
		case "nav":
			if (value > 2)
			{
				value = 1;
			}
			g_SetFilterNav <- value;
			break;
		case "trigger":
			if (value > 2)
			{
				value = 1;
			}
			g_SetFilterTrigger <- value;
			break;
		case "ladder":
			if (value > 2)
			{
				value = 1;
			}
			g_SetFilterLadder <- value;
			break;
		case "prop":
			if (value > 3)
			{
				value = 1;
			}
			g_SetFilterProp <- value;
			break;
		case "text":
			if (value > 2)
			{
				value = 1;
			}
			g_SetFilterText <- value;
			break;
		default:
			printl("\nEntity Group: '" + entityGroup + "' is not valid.\n");
			return;
			break;
	}
	
	// Disable active glows on props when filter is changed.

	if ( g_TutorialShown )
	{
		for ( local index = 0;
				g_arrayFixHandles[index] != null && index <= g_arrayFixHandles.len();
				index++ )
		{
			EntFire( g_arrayFixHandles[index].GetName(), "StopGlowing" );
		}
	}

	printl("\nShowing Group: '" + entityGroup + "', with filter: '" + value + "'.\n");
}

function FilterHelp()
{
	printl( "Usage: script SetFilter(\"ENTITY GROUP\", \"FILTER VALUE\", \"CLIP TYPE [optional]\")" );
	
	printl( "\nENTITY GROUP\tGroup of entity types to change filters for." );
	
	printl( "\nFILTER VALUE\tValue to set entity group filter to." );
	printl( "Using a value of \"all\" will set the filter to '1', showing all entities." );
	printl( "Using a value of \"none\" sets the filter to '0', hiding all entities.\n" );
	
	printl( "\nCLIP TYPE\t[optional] Value to filter clips by block type." );
	printl( "Using a value of \"all\" sets the filter to '-1', showing all entities." );
	printl( "VALUES:" );
	printl( "-1\tShows all clips regardless of block type (default)" );
	printl( "0\tEveryone (red)" );
	printl( "1\tSurvivor (pink)" );
	printl( "2\tPlayer Infected (green)" );
	printl( "3\tAll Special Infected (Player and AI) (blue)" );
	printl( "4\tAll players and physics objects (light blue)" );
	
	printl( "\nENTITY GROUP AND FILTER VALUES:" );
	
	printl( "\nGROUP:" );
	printl( "all\tSets filters for all groups together" );
	printl( "VALUES:" );
	printl( "0\tHides all entity groups" );
	printl( "1\tShows all entity groups (default)" );
	
	printl( "\nGROUP:" );
	printl( "clip\tSets filters for all clip entities: env_physics_blocker, env_player_blocker" );
	printl( "VALUES:" );
	printl( "0\tHide all clips" );
	printl( "1\tShow all clips (default)" );
	printl( "2\tShows only env_physics_blocker" );
	printl( "3\tShows only env_player_blocker" );
	printl( "4\tShows only angled blockers" );
	
	printl( "\nGROUP:" );
	printl( "brush\tSets filters for brush entities: func_brush" );
	printl( "VALUES:" );
	printl( "0\tHide all brushes" );
	printl( "1\tShows all brushes created via scripting (without a brush model) (default)" );
	printl( "2\tShows all brushes (including those with a brush model)" );
	
	printl( "\nGROUP:" );
	printl( "nav\tSets filters for nav entities: func_nav_blocker" );
	printl( "VALUES:" );
	printl( "0\tHide all nav blockers" );
	printl( "1\tShows all nav blockers created via scripting (without a brush model) (default)" );
	printl( "2\tShows all nav blockers (including those with a brush model)" );
	
	printl( "\nGROUP:" );
	printl( "trigger\tSets filters for trigger entities: trigger_multiple, trigger_once, trigger_push, trigger_hurt,trigger_hurt_ghost, trigger_auto_crouch, trigger_playermovement, trigger_teleport" );
	printl( "VALUES:" );
	printl( "0\tHide all triggers" );
	printl( "1\tShows all triggers created via scripting (without a brush model) (default)" );
	printl( "2\tShows all triggers (including those with a brush model)" );
	
	printl( "\nGROUP:" );
	printl( "ladder\tSets filters for ladder entities: func_simpleladders" );
	printl( "VALUES:" );
	printl( "0\tHide all ladders" );
	printl( "1\tShows all ladders created or moved via scripting (non-zero origin value) (default)" );
	printl( "2\tShows all ladders (including those with an origin value at 0,0,0)" );
	
	printl( "\nGROUP:" );
	printl( "prop\tSets filters for prop entities: prop_dynamic, prop_dynamic_override, prop_physics, prop_physics_override)" );
	printl( "VALUES:" );
	printl( "0\tHide all props" );
	printl( "1\tShows all props (default)" );
	printl( "2\tShows dynamic props only" );
	printl( "3\tShows physics props only" );
	
	printl( "\nGROUP:" );
	printl( "text\tSets filters for text labels on highlighted entities" );
	printl( "VALUES:" );
	printl( "0\tHide all text" );
	printl( "1\tShows all text (default)" );
	printl( "2\tShows text only if there is a direct line of sight with the entity" );
}