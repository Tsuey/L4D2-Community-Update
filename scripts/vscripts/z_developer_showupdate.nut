/*****************************************************************************
**  SHOW UPDATE DEMO  ( DEVELOPER MODE ONLY )
**
**  File "anv_mapfixes.nut" will have already explained "script ShowUpdate()"
**  with 'devchap( "TUTORIAL" )' if it's an Official Valve map -- Community maps
**  have no updates and do nothing. Everything here requires "developer 1" or 2
**  and manual running of HideUpdate() or ShowUpdate().
**
**  HideUpdate() deletes the Timer Think and clears all visual changes.
**
**  ShowUpdate() creates the Timer Think, displays a tutorial regarding CLIP
**  (blocker) color coding which correspond with "r_drawclipbrushes 2" or 1,
**  then draws all new blockers and glows new props. Also useful to force a
**  re-catalog of any created/deleted "anv_mapfixes"-prefixed entities.
**
**  DebugRedraw() is only called programmatically and isn't manual like the
**  others. It loops through all "anv_mapfixes"-prefixed blockers and props
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
	EntFire( "anv_mapfixes_DebugRedraw_timer", "Kill" );

	// Fail-safe 2nd DebugDrawClear to resolve a rare use timing of it not clearing.

	DebugDrawClear();
	EntFire( "worldspawn", "RunScriptCode", "DebugDrawClear()", 0.1 );
	EntFire( g_UpdateName + "*", "StopGlowing" );
}

// Opacity override for DebugDrawBox's (default 37).

g_BoxOpacity <- 37;

// Only show CLIP (blocker) color coding tutorial once per load session.

g_TutorialShown <- false;

// Call to create a logic_timer as 1/10th of a Think to start DebugRedraw(). This Timer
// is named "anv_mapfixes_DebugRedraw_timer" and only exists if it's manually created.

function ShowUpdate()
{
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
		printl( "\tBLACK\t\tLump and _commentary.txt blockers" );
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
		printl( "a make_ function, run ShowUpdate() again to apply changes.\n" );

		g_TutorialShown = true;
	}

	// Catalog all "anv_mapfixes"-prefixed entities by populating a Handle array.
	// The "find" returns the earliest character index where 0 means it's a match.
	// The Timer (and any "helper entities") have no reason to be in this array.

	g_arrayFixHandles <- array( 200, null );	// We'll never need all 200 fix entities.

	local entity = Entities.First();		// Start looping from "worldspawn".

	local index = 0;				// Increment not on loop but rather confirmed matches.

	while( ( entity = Entities.Next( entity ) ) != null )
	{
		if ( entity.GetName().find( g_UpdateName ) == 0
		  && entity.GetName() != "anv_mapfixes_DebugRedraw_timer" )
		{
			// Confirmed to be a fix entity so add it to array.

			g_arrayFixHandles[index] = entity;

			index++;
		}
	}

	// Timer that DebugRedraw()'s every 1 second, better than AddThinkToEnt() because it
	// runs 1/10th as often and still looks good. Only make if one doesn't already exist.

	if ( Entities.FindByName( null, "anv_mapfixes_DebugRedraw_timer" ) == null )
	{
		SpawnEntityFromTable( "logic_timer",
		{
			targetname	=	"anv_mapfixes_DebugRedraw_timer",
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
}

// Declare function that houses the redraw loop the above Timer runs every 1 second.
// The IsValid() avoids "Accessed null instance" error if an entity within Handle array
// is deleted -- this will still break redraws, hence "TUTORIAL" to explain Hide/Show toggle.

function DebugRedraw()
{
	// Draw all "anv_mapfixes"-prefixed entities.

	for ( local index = 0;
	      g_arrayFixHandles[index] != null && g_arrayFixHandles[index].IsValid();
	      index++ )
	{
		// Only clear for 1st redrawn entity. If absent, only last-most blocker is drawn.
		// Props don't need to be "redrawn" since the one "StartGlowing" is sufficient.

		if ( index == 0 )
		{
			DebugDrawClear();
		}

		// Variables for readability. GetOrigin() and GetName() read well without them.

		local strClassname = g_arrayFixHandles[index].GetClassname();
		local hndFixHandle = g_arrayFixHandles[index];

		// Restore Keyvalues from make_clip() to draw visible box for invisible blocker.

		if ( strClassname == "env_physics_blocker" )
		{
			local intBlockType = NetProps.GetPropInt( hndFixHandle, "m_nBlockType" );

			local vecBoxColor = null;

			switch( intBlockType )
			{
				case 0:	vecBoxColor = Vector( 255,   0,   0 );	break;	// "Everyone" (RED)
				case 1:	vecBoxColor = Vector( 185,   0, 185 );	break;	// "Survivors" (PINK)
				case 2:	vecBoxColor = Vector(   0, 255,   0 );	break;	// "SI Players" (GREEN)
				case 3:	vecBoxColor = Vector(   0,   0, 255 );	break;	// "SI Players and AI" (BLUE)
				case 4:	vecBoxColor = Vector(   0, 128, 255 );	break;	// "All and Physics" (LT BLUE)
			}

			local vecMins = NetProps.GetPropVector( hndFixHandle, "m_Collision.m_vecMins" );
			local vecMaxs = NetProps.GetPropVector( hndFixHandle, "m_Collision.m_vecMaxs" );

			// Note DebugDrawBoxDirection() with GetForwardVector() only supports Y (yaw).
			// X/pitch and Z/roll don't show. Kerry added DebugDrawBoxAngles() to fix this.
			// DebugDrawBoxAngles() requires a QAngle which GetAngles() returns!

			DebugDrawBoxAngles( hndFixHandle.GetOrigin(), vecMins, vecMaxs,
					    hndFixHandle.GetAngles(), vecBoxColor,
					    g_BoxOpacity, 99999999 );

			// Post-fix " (ANGLED)" to all blockers that have non-"0 0 0" rotation. This is
			// warned in ShowUpdate()'s tutorial. Engine forces rotated clips to block Physics!
			// NetProp "m_angRotation" used instead of GetAngles() because it returns a Vector.

			local strPseudonym = hndFixHandle.GetName();

			if ( NetProps.GetPropVector( hndFixHandle, "m_angRotation" ).tostring() != Vector( 0, 0, 0 ).tostring() )
			{
				strPseudonym = strPseudonym + " (ANGLED)";
			}

			// Slice "anv_mapfixes" out of name by using lengths and prefix "CLIP: " instead.

			DebugDrawText( hndFixHandle.GetOrigin(),
				       "CLIP: " + strPseudonym.slice( g_UpdateName.len(), strPseudonym.len() ),
				       false, 99999999 );
		}

		// Restore Keyvalues from make_brush() to draw visible box for invisible brush.

		if ( strClassname == "func_brush" )
		{
			local vecBoxColor = Vector( 32, 255, 64 );	// LT GREEN

			local vecMins = NetProps.GetPropVector( hndFixHandle, "m_Collision.m_vecMins" );
			local vecMaxs = NetProps.GetPropVector( hndFixHandle, "m_Collision.m_vecMaxs" );

			// Brush rotation unsupported so GetAngles() does nothing.

			DebugDrawBoxAngles( hndFixHandle.GetOrigin(), vecMins, vecMaxs,
					    hndFixHandle.GetAngles(), vecBoxColor,
					    g_BoxOpacity, 99999999 );

			// Slice "anv_mapfixes" out of name by using lengths and prefix "BRUSH: " instead.

			DebugDrawText( hndFixHandle.GetOrigin(),
				       "BRUSH: " + hndFixHandle.GetName().slice( g_UpdateName.len(), hndFixHandle.GetName().len() ),
				       false, 99999999 );
		}

		// Restore Keyvalues from make_navblock() to draw visible box for navblocked region.

		if ( strClassname == "func_nav_blocker" )
		{
			local vecBoxColor = Vector( 255, 45, 0 );	// ORANGE

			local vecMins = NetProps.GetPropVector( hndFixHandle, "m_Collision.m_vecMins" );
			local vecMaxs = NetProps.GetPropVector( hndFixHandle, "m_Collision.m_vecMaxs" );

			// Rotation on navblockers is especially unsupported and always 0's.

			DebugDrawBoxAngles( hndFixHandle.GetOrigin(), vecMins, vecMaxs,
					    hndFixHandle.GetAngles(), vecBoxColor,
					    g_BoxOpacity, 99999999 );

			// Slice "anv_mapfixes" out of name by using lengths and prefix "NAVBLOCK: " instead.

			DebugDrawText( hndFixHandle.GetOrigin(),
				       "NAVBLOCK: " + hndFixHandle.GetName().slice( g_UpdateName.len(), hndFixHandle.GetName().len() ),
				       false, 99999999 );
		}

		// Restore Keyvalues from several "trigger_" entities to draw visible boxes for them.

		if ( strClassname == "trigger_multiple"
		  || strClassname == "trigger_once"
		  || strClassname == "trigger_push"
		  || strClassname == "trigger_hurt"
		  || strClassname == "trigger_hurt_ghost"
		  || strClassname == "trigger_auto_crouch"
		  || strClassname == "trigger_playermovement" )
		{
			local vecBoxColor = Vector( 255, 255, 0 );	// YELLOW

			local vecMins = NetProps.GetPropVector( hndFixHandle, "m_Collision.m_vecMins" );
			local vecMaxs = NetProps.GetPropVector( hndFixHandle, "m_Collision.m_vecMaxs" );

			// Triggers are a wildcard but try to draw Angles just in case they're non-0.
			// Note that "trigger_push" rotation has unknown mild influence on Push Direction
			// that's only noticeable with Death Toll 5's Rockslide RNG. Angles definitely don't
			// impact actual collidability and is why "trigger_hurt" fails entirely with them.

			DebugDrawBoxAngles( hndFixHandle.GetOrigin(), vecMins, vecMaxs,
					    hndFixHandle.GetAngles(), vecBoxColor,
					    g_BoxOpacity, 99999999 );

			// Slice "anv_mapfixes" out of name by using lengths and prefix "TRIGGER: " instead.

			DebugDrawText( hndFixHandle.GetOrigin(),
				       "TRIGGER: " + hndFixHandle.GetName().slice( g_UpdateName.len(), hndFixHandle.GetName().len() ),
				       false, 99999999 );
		}

		// Extract vecMins/vecMaxs from make_ladder() to draw visible box around cloned Infected Ladder.

		if ( strClassname == "func_simpleladder" )
		{
			local vecBoxColor = Vector( 255, 255, 255 );	// WHITE

			local vecMins = NetProps.GetPropVector( hndFixHandle, "m_Collision.m_vecMins" );
			local vecMaxs = NetProps.GetPropVector( hndFixHandle, "m_Collision.m_vecMaxs" );

			// By the grace of GabeN with a sparkle of luck from Kerry ladders can be rotated.

			// Salt the opacity with + 24 so it stands out a bit more.

			DebugDrawBoxAngles( hndFixHandle.GetOrigin(), vecMins, vecMaxs,
					    hndFixHandle.GetAngles(), vecBoxColor,
					    g_BoxOpacity + 24, 99999999 );

			// Slice "anv_mapfixes" out of name by using lengths and prefix "LADDER: " instead.

			// LADDERS ONLY:
			//
			//	The math here is a bit confusing but comes down to this, an example
			//	extracted from Parish 2's new "_ladder_farcorner_cloned_horsehedge":
			//
			//		-5703.076172 -4246.962891 -246.501984		Where the tester sees drawn box
			//		-6441.002441 -3077.000000 -257.000000		vecMins far away b/c cloned brush
			//		-6359.000000 -3059.000000 -127.000000		vecMaxs, also misleading
			//		  695.000000 -1186.000000  -16.000000		GetOrigin(), source ladder shift/offset
			//
			//	There's no crazy math needed here. While just how DebugDrawBox()
			//	still works so perfectly is a bit of a mystery, simply adding
			//	vecMins to GetOrigin() will produce the final, visible location
			//	of the cloned ladder. The fact NetProp "m_vecSpecifiedSurroundingMaxs"
			//	is not populated for clones requires this to determine location
			//	(and isn't worth risking the game crashing if the VSSM is force-set).
			//	Without adding them the text is placed towards the map's origin.
			//////////////////////////////////////////////////////////////////////////////

			// Draw the CLONED ladder's targetname where DebugDrawBox is / players actually use it.

			DebugDrawText( vecMins + hndFixHandle.GetOrigin(),
				       "LADDER: " + hndFixHandle.GetName().slice( g_UpdateName.len(), hndFixHandle.GetName().len() ),
				       false, 99999999 );

			// Draw text at the SOURCE ladder's location for inspection/comparison. Given that several
			// of these will often overlap because the same source was used, they'd be unreadable, so
			// the text is simple here. For fun, sprinkle in its modelindex-turned-model so that it
			// can at least be compared with "developer 1" Table dumps!

			DebugDrawText( vecMins, "LADDER CLONE SOURCE (" + hndFixHandle.GetModelName() + ")", false, 99999999 );
		}

		// Keyvalues from make_prop() don't need restoration as attributes can be visually assessed.

		if ( strClassname == "prop_dynamic"
		  || strClassname == "prop_dynamic_override"
		  || strClassname == "prop_physics"
		  || strClassname == "prop_physics_override" )
		{
			EntFire( hndFixHandle.GetName(), "StartGlowing" );

			// Slice "anv_mapfixes" out of name by using lengths and prefix "PROP: " instead.

			DebugDrawText( hndFixHandle.GetOrigin(),
				       "PROP: " + hndFixHandle.GetName().slice( g_UpdateName.len(), hndFixHandle.GetName().len() ),
				       false, 99999999 );
		}
	}

	// To be complete, draw in BLACK all player and physics blockers that are NOT
	// "anv_mapfixes"-prefixed. This reveals lump and _commentary.txt blockers.

	local hndPlay = null;

	while( ( hndPlay = Entities.FindByClassname( hndPlay, "env_player_blocker" ) ) != null )
	{
		if ( hndPlay.GetName().find( "anv_mapfixes" ) != 0 )
		{
			local mins = NetProps.GetPropVector( hndPlay, "m_Collision.m_vecMins" );
			local maxs = NetProps.GetPropVector( hndPlay, "m_Collision.m_vecMaxs" );

			local vecBoxColor = Vector( 0, 0, 0 );

			DebugDrawBoxAngles( hndPlay.GetOrigin(), mins, maxs,
					    hndPlay.GetAngles(), vecBoxColor,
					    g_BoxOpacity + 61, 99999999 );
		}
	}

	local hndPhys = null;

	while( ( hndPhys = Entities.FindByClassname( hndPhys, "env_physics_blocker" ) ) != null )
	{
		if ( hndPhys.GetName().find( "anv_mapfixes" ) != 0 )
		{
			local mins = NetProps.GetPropVector( hndPhys, "m_Collision.m_vecMins" );
			local maxs = NetProps.GetPropVector( hndPhys, "m_Collision.m_vecMaxs" );

			local vecBoxColor = Vector( 0, 0, 0 );

			DebugDrawBoxAngles( hndPhys.GetOrigin(), mins, maxs,
					    hndPhys.GetAngles(), vecBoxColor,
					    g_BoxOpacity + 61, 99999999 );
		}
	}
}