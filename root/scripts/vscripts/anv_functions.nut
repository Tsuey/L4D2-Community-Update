/*****************************************************************************
**  MAKE_CLIP
**
**  All functions here are as minimalist and feature-full as possible designed
**  to create or modify entities with single lines of code. This is by far the
**  most used "make_" function and is used to replace _commentary.txt's job of
**  patching exploits with env_player_blockers that don't feel like real clips.
**
**  All parameters except angles are required. BlockTypes changed to string forms
**  such as "Everyone", with InitialState only 0 if part of I/O. It's important
**  to observe that if all angles are "0 0 0" then env_physics_blocker only pays
**  attention to "mins" and "maxs"; if they are non-0 like "1 0 0" they'll only
**  pay attention to "boxmins" and "boxmaxs". The entity's only limitation is
**  that if a clip requires angles and therefore uses boxmins/boxmaxs, then that
**  clip unavoidably blocks Physics props like gnomes/gascans -- luckily, rotated
**  clips are rarely used or placed high-up or on displacements when they are.
**
**  All confusion is easily avoided by always setting all 4 Keyvalues. Even if
**  only the specific ones necessary are set, if a "Survivor" blocker has non-0
**  angles it absolutely must use boxmins/boxmaxs to have collision with the caveat
**  that it'll inevitably block gascans/gnomes, too. It's all about placement.
**
**  "SI Players and AI" does not block Commons, but "All and Physics" blocks all
**  these (enforced even if all angles are 0):
**
**	Survivors + SI Players and AI + Common Corpses + Gascans + Gnome
**
**  If "developer 1" one-line entity descriptions are printed to console.
**  This is designed to be used with ShowUpdate() to visualize created blockers.
**
**  Entity functions almost always assume users give each entity a unique name.
*****************************************************************************/

function make_clip ( user_strTargetname,
		     user_strBlockType,
		     user_intInitialState,
		     user_strMins,
		     user_strMaxs,
		     user_strOrigin,
		     user_strAngles = "0 0 0" )
{
	local intBlockType = null;

	// ShowUpdate() colors mimic "r_drawclipbrushes" and provided for reference.

	switch( user_strBlockType )
	{
		case "Everyone":		intBlockType = 0;	break;		// RED
		case "Survivors":		intBlockType = 1;	break;		// PINK
		case "SI Players":		intBlockType = 2;	break;		// GREEN
		case "SI Players and AI":	intBlockType = 3;	break;		// BLUE
		case "All and Physics":		intBlockType = 4;	break;		// LT BLUE
	}

	local vecMins = StringToVector_Valve( user_strMins, " " );
	local vecMaxs = StringToVector_Valve( user_strMaxs, " " );

	SpawnEntityFromTable( "env_physics_blocker",
	{
		targetname	=	g_UpdateName + user_strTargetname,
		BlockType	=	intBlockType,
		initialstate	=	user_intInitialState,
		mins		=	vecMins,
		boxmins		=	vecMins,
		maxs		=	vecMaxs,
		boxmaxs		=	vecMaxs,
		origin		=	StringToVector_Valve( user_strOrigin, " " ),
		angles		=	StringToVector_Valve( user_strAngles, " " )
	} );

	if ( developer() > 0 )
	{
		printl( "env_physics_blocker \"" + user_strTargetname + "\" blocks " + user_strBlockType
			+ " w/ initialstate " + user_intInitialState + " @ setpos_exact " + user_strOrigin + "\n" );
	}
}

/*****************************************************************************
**  MAKE_BRUSH
**
**  Brushes block everything that env_physics_blockers don't. This includes:
**
**	Alive Commons + Pipebomb + Molotov + SI vomit/tongue + bullet hitreg
**
**  Used extensively by "_losfix"-prefixed entities to provide SI Players with
**  an invisible obstruction that blocks LOS -- done cautiously given that it
**  still has collision which sometimes needs to be encased within new clips!
**
**  The next useful purpose is blocking Alive Commons to fake blocks they can
**  actually climb or mitigate prop navigational failures that force crouching.
**  Brushes also block Survivor corpses and are thus used for defib-trick fixes,
**  whereas env_physics_blockers only block Common corpses.
**
**  ShowUpdate() draws in LT GREEN and rotation is unsupported by engine.
*****************************************************************************/

function make_brush ( user_strTargetname,
		      user_strMins,
		      user_strMaxs,
		      user_strOrigin )
{
	SpawnEntityFromTable( "func_brush",
	{
		targetname	=	g_UpdateName + user_strTargetname,
		origin		=	StringToVector_Valve( user_strOrigin, " " )
	} );

	EntFire( g_UpdateName + user_strTargetname, "AddOutput", "mins " + user_strMins );
	EntFire( g_UpdateName + user_strTargetname, "AddOutput", "maxs " + user_strMaxs );
	EntFire( g_UpdateName + user_strTargetname, "AddOutput", "solid 2" );

	if ( developer() > 0 )
	{
		printl( "func_brush \"" + user_strTargetname + "\" created @ setpos_exact " + user_strOrigin + "\n" );
	}
}

/*****************************************************************************
**  MAKE_NAVBLOCK
**
**  Quickly create func_nav_blockers to fix nav bugs or add LOS blockers.
**
**  Accepts "Everyone", "Survivors", or "Infected" where "Apply" immediately
**  adds BLOCKED_SURVIVOR and/or BLOCKED_ZOMBIE to the nav area or "Remove"
**  used to spawn the navblocker initially disabled. Manual firings using
**  either "BlockNav" or "UnblockNav" can override these in I/O at any time.
**
**  ShowUpdate() draws in ORANGE and rotation is unsupported by engine. It's
**  critical to note that its mins/maxs must be impeccable -- while clips support
**  a mins/maxs like "-50 25 -50" "50 50 50", func_nav_blocker does not, and
**  if used the blocked attributes remove unreliably on UnblockNav or Kill and
**  if rotation is used it'll apply attributes as if it wasn't rotated.
**
**  The engine automatically clears blocked attributes on round transition.
*****************************************************************************/

function make_navblock ( user_strTargetname,
			 user_strTeamBlock,
			 user_strState,
			 user_strMins,
			 user_strMaxs,
			 user_strOrigin )
{
	local intTeamBlock = null;

	switch( user_strTeamBlock )
	{
		case "Everyone":	intTeamBlock = -1;	break;
		case "Survivors":	intTeamBlock =  2;	break;
		case "Infected":	intTeamBlock =  3;	break;
	}

	SpawnEntityFromTable( "func_nav_blocker",
	{
		targetname	=	g_UpdateName + user_strTargetname,
		teamToBlock	=	intTeamBlock,
		origin		=	StringToVector_Valve( user_strOrigin, " " )
	} );

	EntFire( g_UpdateName + user_strTargetname, "AddOutput", "mins " + user_strMins );
	EntFire( g_UpdateName + user_strTargetname, "AddOutput", "maxs " + user_strMaxs );
	EntFire( g_UpdateName + user_strTargetname, "AddOutput", "solid 2" );

	switch( user_strState )
	{
		case "Apply":		EntFire( g_UpdateName + user_strTargetname, "BlockNav"   );	break;
		case "Remove":		EntFire( g_UpdateName + user_strTargetname, "UnblockNav" );	break;
	}

	if ( developer() > 0 )
	{
		printl( "func_nav_blocker \"" + user_strTargetname + "\" blocks " + user_strTeamBlock
			+ " w/ " + user_strState + " @ setpos_exact " + user_strOrigin + "\n" );
	}
}

/*****************************************************************************
**  MAKE_TRIGPUSH
**
**  Pusher volume for "Everything", "Survivor", "Infected" or "Physics".
**
**  When it comes to trigger_multiple and trigger_once their Keyvalues are so
**  specific it's more efficient to not have functions -- except push & hurt.
**
**  While versatile, undeletable SI Player wrongway signs aren't applicable here
**  because trigger_push cannot be used as a one-way barrier -- make_axiswarp()
**  was added as a way to create a one-way barrier. Even though max velocity of
**  1000 (where even 1001 spams "DataTable warning: player: Out-of-range value")
**  technically works, it was deemed far too exploitable. Use cases are reduced
**  to Quality-of-Life Infected ladder improvements and niche Survivor fixes.
**
**  "Everything" (64) even if it were instead "spawnflags 2" for NPC cannot ever
**  push Commons (Alive/Corpses) -- triggers were updated to detect weapons like
**  Gascans but not SI vomit/tongue (tongue keeps full control if pulled through).
**  Pushing is only supported on Clients (Players/AI), Physics Objects (trashbin),
**  Gnome, Pipebomb, SI acid balls, and Tank rocks. Default is always Clients (1)
**  only and if "Physics" (8) will exclude Clients. Filter Override requires the
**  full name and can be anything (i.e. an optimized filter_multi).
**
**  Push Direction format is "x y z" where x 90 is down -90 is up and z doesn't
**  effect any change. Only y is ever used.
**
**  ShowUpdate() draws all triggers YELLOW and trigger_push CANNOT be rotated;
**  however, Angles are optional because they still have unknown influence. In
**  the case of Death Toll 5's Rockslide, if Angles are all-0 instead of "0 35 0"
**  it will fail, and integrating the difference into Push Direction won't help.
**  ShowUpdate() will draw Angles but activators inside are only pushed by the
**  invisible all-0 volume. Technically Angles aren't supported but do have a
**  mild enough influence to keep as an option -- but all-0 is recommended.
*****************************************************************************/

function make_trigpush ( user_strTargetname,
			 user_strActivator,
			 user_intSpeed,
			 user_strDirection,
			 user_strMins,
			 user_strMaxs,
			 user_strOrigin,
			 user_strAngles		=	"0 0 0",
			 user_strFilterOverride	=	"" )
{
	// Determine activator filter. Type always Clients (1) unless explicitly not.

	local strFiltername = "";
	local intSpawnflags = 1;

	switch( user_strActivator )
	{
		case "Everything":	intSpawnflags = 64;					break;
		case "Survivor":	strFiltername = "anv_globalfixes_filter_survivor";	break;
		case "Infected":	strFiltername = "anv_globalfixes_filter_infected";	break;
		case "Physics":		intSpawnflags = 8;					break;
	}

	// Allow custom filters to be used independent of activator type.

	if ( user_strFilterOverride != "" )
	{
		strFiltername = user_strFilterOverride;
	}

	// Spawn the pusher.

	SpawnEntityFromTable( "trigger_push",
	{
		targetname	=	g_UpdateName + user_strTargetname,
		filtername	=	strFiltername,
		spawnflags	=	intSpawnflags,
		speed		=	user_intSpeed,
		pushdir		=	StringToVector_Valve( user_strDirection, " " ),
		origin		=	StringToVector_Valve( user_strOrigin, " " ),
		angles		=	StringToVector_Valve( user_strAngles, " " )
	} );

	EntFire( g_UpdateName + user_strTargetname, "AddOutput", "mins " + user_strMins );
	EntFire( g_UpdateName + user_strTargetname, "AddOutput", "maxs " + user_strMaxs );
	EntFire( g_UpdateName + user_strTargetname, "AddOutput", "solid 2" );

	if ( developer() > 0 )
	{
		printl( "trigger_push \"" + user_strTargetname + "\" pushes " + user_strActivator
			+ " w/ speed " + user_intSpeed + " @ setpos_exact " + user_strOrigin + "\n" );
	}
}

/*****************************************************************************
**  MAKE_TRIGHURT
**
**  Insta-kill volume for "Everyone", "Survivor", "Infected" or "Ghost".
**
**  Kill volumes have broad exploit patching applications but are also used
**  for "_pullcharge"-prefixed Smoker/Charger combos that get Survivors out of
**  bounds killing them instead of allowing further map escape.
**
**  Spawnflags 1 (Client) is all that's needed because 2 (NPC) kills Commons
**  which will be problematic for some uses -- supplement with AddOutput for
**  rare cases to change "spawnflags" (instant effect change).
**
**  Damage type for trigger_hurt is usually CRUSH (1) -- trigger_hurt_ghost
**  has a couple things to note, though:
**
**	+ "Everyone" kills Survivor/Infected but never Ghost
**	+ trigger_hurt with "Infected" kills spawned SI but not ghosted
**	+ _ghost only kills spawned SI if CRUSH (1)
**	+ _ghost requires FALL (32) to kill ghost SI	<-- BUG
**	+ _ghost will always kill both with FALL (32)
**	+ _ghost does not support killing just ghost SI
**
**  To avoid exaggerated Infected ragdoll deaths both use "nodmgforce 1".
**
**  Damages always set to insta-kill. Vast majority of uses will have hurts
**  always enabled and sometimes Killed, so "StartDisabled 0" is assumed.
**
**  ShowUpdate() draws all triggers YELLOW and trigger_hurt CANNOT be rotated.
*****************************************************************************/

function make_trighurt ( user_strTargetname,
			 user_strActivator,
			 user_strMins,
			 user_strMaxs,
			 user_strOrigin )
{
	// Both trigger_hurt and trigger_hurt_ghost have these in common.

	local tblKeyvalues =
	{
		targetname	=	g_UpdateName + user_strTargetname,
		spawnflags	=	1,
		nodmgforce	=	1,
		damage		=	10000,
		damagecap	=	10000,
		origin		=	StringToVector_Valve( user_strOrigin, " " )
	};

	// Now reconcile their differences.

	local strClassname = null;

	switch( user_strActivator )
	{
		case "Everyone":

			strClassname = "trigger_hurt";
			tblKeyvalues.damagetype <- 1;
			break;

		case "Survivor":

			strClassname = "trigger_hurt";
			tblKeyvalues.filtername <- "anv_globalfixes_filter_survivor";
			tblKeyvalues.damagetype <- 1;
			break;

		case "Infected":

			strClassname = "trigger_hurt";
			tblKeyvalues.filtername <- "anv_globalfixes_filter_infected";
			tblKeyvalues.damagetype <- 1;
			break;

		case "Ghost":

			strClassname = "trigger_hurt_ghost";
			tblKeyvalues.filtername <- "anv_globalfixes_filter_infected";
			tblKeyvalues.damagetype <- 32;
			break;
	}

	// We're done defining so spawn it.

	SpawnEntityFromTable( strClassname, tblKeyvalues );

	// Finally apply mins/maxs.

	EntFire( g_UpdateName + user_strTargetname, "AddOutput", "mins " + user_strMins );
	EntFire( g_UpdateName + user_strTargetname, "AddOutput", "maxs " + user_strMaxs );
	EntFire( g_UpdateName + user_strTargetname, "AddOutput", "solid 2" );

	if ( developer() > 0 )
	{
		printl( strClassname + " \"" + user_strTargetname + "\" insta-kills " + user_strActivator
			+ " @ setpos_exact " + user_strOrigin + "\n" );
	}
}

/*****************************************************************************
**  MAKE_TRIGDUCK
**
**  Creates a "trigger_auto_crouch" volume. Note similar make_trigmove() "Duck"
**  but different in that these require proximity to a small passage to work.
**
**  Commons (NPC) duck fine but sometimes SI bots (Clients) do not, therefore
**  these correct SI bot behavior. It's also less intrusive than make_trigmove()
**  because the bot or player must be actively pressing into the passage for
**  the auto-crouch to happen where letting go without entry will un-crouch.
**
**  ShowUpdate() draws all triggers YELLOW with rotation irrelevant by nature.
*****************************************************************************/

function make_trigduck ( user_strTargetname,
			 user_strMins,
			 user_strMaxs,
			 user_strOrigin )
{
	SpawnEntityFromTable( "trigger_auto_crouch",
	{
		targetname	=	g_UpdateName + user_strTargetname,
		spawnflags	=	1,
		origin		=	StringToVector_Valve( user_strOrigin, " " )
	} );

	EntFire( g_UpdateName + user_strTargetname, "AddOutput", "mins " + user_strMins );
	EntFire( g_UpdateName + user_strTargetname, "AddOutput", "maxs " + user_strMaxs );
	EntFire( g_UpdateName + user_strTargetname, "AddOutput", "solid 2" );

	if ( developer() > 0 )
	{
		printl( "trigger_auto_crouch \"" + user_strTargetname + "\" created @ setpos_exact " + user_strOrigin + "\n" );
	}
}

/*****************************************************************************
**  MAKE_TRIGMOVE
**
**  Creates a "trigger_playermovement" entity with Options:
**
**	"Duck"			Force Client to always Duck
**	"Walk"			Force Client to always Walk
**	"Jump"			Prevent Client from Jumping
**
**  Contains extra features over make_trigduck(). Mainly is used to force-dodge
**  prop_static obstructions with new Infected ladders or as force-feedback for
**  new 360-degree Beam ladders.
**
**  Uses are few and far between for team filters to be safely ignored. Caution
**  that deleting the trigger after a movement change has been enforced will
**  not un-apply the effect -- never fire Kill to these!
**
**  ShowUpdate() draws all triggers YELLOW and these CANNOT be rotated.
*****************************************************************************/

function make_trigmove ( user_strTargetname,
			 user_strOption,
			 user_strMins,
			 user_strMaxs,
			 user_strOrigin )
{
	// Always Clients (1) with Option added.

	local intSpawnflags = 0;

	switch( user_strOption )
	{
		case "Duck":		intSpawnflags = 2048;		break;
		case "Walk":		intSpawnflags = 4096;		break;
		case "Jump":		intSpawnflags = 8192;		break;
	}

	SpawnEntityFromTable( "trigger_playermovement",
	{
		targetname	=	g_UpdateName + user_strTargetname,
		spawnflags	=	1 + intSpawnflags,
		origin		=	StringToVector_Valve( user_strOrigin, " " )
	} );

	EntFire( g_UpdateName + user_strTargetname, "AddOutput", "mins " + user_strMins );
	EntFire( g_UpdateName + user_strTargetname, "AddOutput", "maxs " + user_strMaxs );
	EntFire( g_UpdateName + user_strTargetname, "AddOutput", "solid 2" );

	if ( developer() > 0 )
	{
		printl( "trigger_playermovement \"" + user_strTargetname + "\" with Option " + user_strOption
			+ " @ setpos_exact " + user_strOrigin + "\n" );
	}
}

/*****************************************************************************
**  MAKE_PROP
**
**  This function combines the most useful features from four entities:
**
**	"dynamic"	https://developer.valvesoftware.com/wiki/Prop_dynamic
**	"dynamic_ovr"	https://developer.valvesoftware.com/wiki/Prop_dynamic_override
**	"physics"	https://developer.valvesoftware.com/wiki/Prop_physics
**	"physics_ovr"	https://developer.valvesoftware.com/wiki/Prop_physics_override
**
**  Parameters (required unless specified):
**
**	user_strType		One of the four above (i.e. "dynamic")
**	user_strTargetname	Entity name
**	user_strModel		Full Hammer-style file path to model
**	user_strOrigin		Location
**	user_strAngles		OPTIONAL: Rotation of the prop
**	user_strShadows		OPTIONAL: Either "shadow_yes" or "shadow_no"
**	user_strSolidity	OPTIONAL: Either "solid_yes" or "solid_no"
**	user_strRenderColor	OPTIONAL: Where "0 0 0" is black
**	user_flFadeMinDist	OPTIONAL: Best left at default -1.0
**	user_flFadeMaxDist	OPTIONAL: Best left at default  0.0
**	user_flMassScale	OPTIONAL: Weight of prop_physics (1.0 default)
**
**  Fade min/max are only intended for Infected "wrongway" signs. Mass scale
**  is used to override prop_physics models that are too heavy for Tanks to hit.
**  Excluded are "StartDisabled", skins, size scaling, parenting, animations,
**  and "lightingorigin": these can be supplemented by EntFire() as required
**  but parenting will be the only one ever used by any Valve fix.
**
**  Dynamic and physics props are identical except four key differences:
**
**	1. Dynamic are solid when "solid 6" and non-solid when "solid 0".
**	   Physics are solid when "spawnflags 0" and non-solid when "spawnflags 4".
**	   Much of the code is resolving this distinction, where "spawnflags 4"
**	   is instead turning physics props into "debris".
**
**	2. Non-solid dynamic cannot be shot or hit at all whereas non-solid
**	   physics ("debris") can still be shot or hit by Tanks (but won't do
**	   any damage to victims in its trajectory).
**
**	3. Ghost Infected can freely move through physics props but dynamic
**	   props will stop them. For example, Ghosts are used to being able
**	   to run through cars, but it's the dynamic glass model that stops them.
**
**	4. Physics props are all that can use "user_flMassScale". The code
**	   ensures this parameter is ignored if it's a dynamic.
**
**  Otherwise shadows, coloring, and fade min/max are the same for all four.
**
**  Internal massScale default is 0.0 but 1.0 behaves identical and looks better.
**
**  Also note "prop_physics_override" generates "prop_physics", not _overrides.
**
**	CAUTION:
**
**  Function forces props prefixed with "_solidify" to not render. Solidifying
**  non-solid 1:1 prop_statics is critical for improving Versus LOS, with those
**  entities spawned by InfectedHumEnts_Spawn() -- which technically could do
**  it with an EntFire() but "reported ENTITY_CHANGE_NONE" spams for each. All
**  are exact copies and only cause overlap artifacts if rendered twice.
*****************************************************************************/

function make_prop ( user_strType,
		     user_strTargetname,
		     user_strModel,
		     user_strOrigin,
		     user_strAngles		=	"0 0 0",
		     user_strShadows		=	"shadow_yes",
		     user_strSolidity		=	"solid_yes",
		     user_strRenderColor	=	"255 255 255",
		     user_flFadeMinDist		=	-1.0,
		     user_flFadeMaxDist		=	 0.0,
		     user_flMassScale		=	 1.0 )
{
	local tblKeyvalues =
	{
		targetname	=	g_UpdateName + user_strTargetname,
		model		=	user_strModel,
		origin		=	StringToVector_Valve( user_strOrigin, " " ),
		angles		=	StringToVector_Valve( user_strAngles, " " ),
		rendercolor	=	StringToVector_Valve( user_strRenderColor, " " ),
		fademindist	=	user_flFadeMinDist,
		fademaxdist	=	user_flFadeMaxDist
	};

	switch( user_strShadows )
	{
		case "shadow_yes":	tblKeyvalues.disableshadows <- 0;	break;
		case "shadow_no":	tblKeyvalues.disableshadows <- 1;	break;
	}

	// Resolve the most significant distinction between classes.

	switch( user_strSolidity )
	{
		case "solid_yes":

			if ( user_strType == "dynamic" || user_strType == "dynamic_ovr" )
			{
				tblKeyvalues.solid <- 6;
			}
			if ( user_strType == "physics" || user_strType == "physics_ovr" )
			{
				tblKeyvalues.spawnflags <- 0;
			}

			break;

		case "solid_no":

			if ( user_strType == "dynamic" || user_strType == "dynamic_ovr" )
			{
				tblKeyvalues.solid <- 0;
			}
			if ( user_strType == "physics" || user_strType == "physics_ovr" )
			{
				tblKeyvalues.spawnflags <- 4;
			}

			break;
	}

	// Mass is only relevant to physics props.

	if ( user_strType == "physics" || user_strType == "physics_ovr" )
	{
		tblKeyvalues.massScale <- user_flMassScale;
	}

	// If "user_strTargetname" begins with "_solidify" then change
	// the default from NORMAL = 0 to NONE = 10. Note that Disable
	// still blocks LOS but results in bumpy collision and doesn't
	// block bullets -- the below avoids both problems. Note "find"
	// is case sensitive so always use lowercase.

	if ( user_strTargetname.find( "_solidify" ) == 0 )
	{
		tblKeyvalues.rendermode <- 10;
	}

	local strClassname = null;

	switch( user_strType )
	{
		case "dynamic":		strClassname = "prop_dynamic";			break;
		case "dynamic_ovr":	strClassname = "prop_dynamic_override";		break;
		case "physics":		strClassname = "prop_physics";			break;
		case "physics_ovr":	strClassname = "prop_physics_override";		break;
	}

	// We're done defining so spawn it.

	SpawnEntityFromTable( strClassname, tblKeyvalues );

	// Dump almost everything but require rarer stuff to be relevant.

	if ( developer() > 0 )
	{
		print( strClassname + " \"" + user_strTargetname + "\" "
		       + user_strShadows + " & " + user_strSolidity
		       + " w/ \"" + user_strModel + "\"" );

		// Color change could just be pass-through to the others,
		// so just dump everything else that's cool. Fade Min/Max
		// are excluded since they'll have "wrongway" in the name.

		if ( user_strRenderColor != "255 255 255" )
		{
			print( " & color \"" + user_strRenderColor + "\"" );
		}
		if ( user_flMassScale != 1.0 )
		{
			print( " & mass " + user_flMassScale );
		}

		printl( " @ setpos_exact " + user_strOrigin + "\n" );
	}
}

/*****************************************************************************
**  MAKE_DECAL
**
**  Paints an infodecal onto the nearest surface.
**
**  Nameless infodecals auto-Activate and are necessary to have them apply to
**  the world early enough to persist player's rejoins to the server. Note it
**  is impossible to remove early-spawned decals from the map like No Mercy 5's
**  wall outlets -- the only exception is if they're applied to a breakable
**  Infected wall in which case the 2nd Versus team suffers non-persistence.
**  If not applied long before "round_start" they're lost on player rejoin.
**
**  See file "mapspawn.nut" for more details and all instant application calls.
*****************************************************************************/

function make_decal( strTexture, strOrigin )
{
	SpawnEntityFromTable( "infodecal",
	{
		texture		=	strTexture,
		origin		=	StringToVector_Valve( strOrigin, " " )
	} );

	if ( developer() > 0 )
	{
		printl( "infodecal \"" + strTexture + "\" painted @ setpos_exact " + strOrigin + "\n" );
	}
}

/*****************************************************************************
**  ENTITY HANDLING
**
**  These tiny functions are as powerful as they are potentially dangerous, SO
**  a ton of hours (and minidumps) later these should be crash/error-proof.
**
**  Function SafelyExists() accepts a Handle to an entity and returns "true"
**  if it safely exists. First and foremost the Handle must not be "null" to
**  avoid abrupt script terminations from entities we're modifying not existing,
**  THEN since it exists that much ensure it IsValid() to avoid console errors.
**
**  Function kill_entity() accepts a Handle then deletes that entity, which
**  could be Dark Carnival 5's Versus defibrillators or func_breakables deleted
**  to make room for Dead Center 1/3 ladders. Kill() needs entity to exist.
**  Note that EntFire() has a minor delay so deleting entities already in the
**  map to re-create them could backfire since it'll delete the replacement,
**  but Kill() deletes it immediately.
**
**  Function clone_model() use cases range from cloning Dark Carnival 5's brush
**  trigger that deletes players to replace it to adding new Infected ladders.
**  It relies heavily on SafelyExists() because if it returns a brush that isn't
**  the one requested the game will either spawn in the wrong brush which could
**  be anything or Crash-to-Desktop because the model isn't precached. Before
**  Kerry's C++ update to add GetModelName() & IsModelPrecached(), a more risky
**  method found the "m_nModelIndex" NetProp then did -1 to yield the String,
**  in addition to ensuring it was > 0 so it's not null or worldspawn. Conversion
**  arithmetic has been obsoleted with GetModelName(). By design this can clone
**  anything and safety ultimately relies on the user feeding in a sane Handle
**  from an entity that already exists i.e. with FindByClassnameNearest(). With
**  these protections and proper use it's 100% safe.
**
**  Functions prefixed with "modify_" make necessary use of SafelyExists().
*****************************************************************************/

function SafelyExists( hndEntity )
{
	if ( hndEntity != null && hndEntity.IsValid() )
	{
		return true;
	}
	else
	{
		return false;
	}
}

////////////////////////////////////////////////////////////////////////////////////
// Dumps the entity Handle itself (which includes Classname and can be anything).
// This isn't used in other functions because (1) its developer output would "echo"
// and (2) script flow concludes entities exist by other means.
////////////////////////////////////////////////////////////////////////////////////

function kill_entity( hndEntity )
{
	if ( SafelyExists( hndEntity ) )
	{
		hndEntity.Kill();

		if ( developer() > 0 )
		{
			printl( "Deleted " + hndEntity + " @ setpos_exact "
				+ VectorToString_Valve( hndEntity.GetOrigin() ) + "\n" );
		}
	}
}

////////////////////////////////////////////////////////////////////////////////////
// Returns the "*#"-styled model of any entity. It will never be the wrong model as
// long as all make_ladder() calls are thoroughly tested. The only potential danger
// is Engine Error crashes for "UTIL_SetModel: not precached: *-1" which will not
// happen because of the safety redundancy.
//
// This allows BSP's to be recompiled and their model indices to change while never
// breaking cloned brushes (like Infected ladders) because they're cloned by exact
// targetname or coordinates. In contrast, recompiles would break lump implementation.
//
// NO DEVELOPER OUTPUT: Functions like make_ladder() which call this output their
// own formats with the String returned from here -- some may use con_comment() to
// explain what's going on instead, i.e. Dark Carnival 5 player-deleting trigger fix.
////////////////////////////////////////////////////////////////////////////////////

function clone_model( hndEntity )
{
	if ( SafelyExists( hndEntity ) )
	{
		local strModel = hndEntity.GetModelName();

		// Maybe impossible to be false but stay safe!

		if ( IsModelPrecached( strModel ) )
		{
			// Return "*#"-styled Keyvalue String.

			return strModel;
		}
		else
		{
			return null;
		}
	}
}

/*****************************************************************************
**  INFECTED LADDERS
**
**  Workflow suite of ladder fixing functions. Every ladder needs a place to
**  exist, then needs to be found for cloning, then if already exists but is
**  just broken just fix it instead, or make a new one, then spawn them in.
**
**  kill_funcinfclip()
**
**	Useful for fixing stuck spawns on Taaannnkk! Mutation most notably
**	No Mercy 3, but also necessary on maps like Blood Harvest 5 to add
**	new ladders like the barricade's -- meticulously re-creating every
**	deleted clip to prevent the introduction of exploits. Several of them
**	block off existing Infected ladders that are impossible to use.
**
**	The best way to uniquely identify these is "m_Collision.m_flRadius"
**	with values like "4564.93" -- just "m_flRadius" could be used but it
**	has "1.73922e-035" notation. As it's a brush its "m_vecOrigin" is all
**	0's often enough to disregard that for identification. Other options
**	are "m_Collision.m_vecMins"/Maxs but the radius is already LengthSqr()
**	of both so they're already represented.
**
**	Floats must be converted to String due to rare compare imprecision.
**	Before any are deleted their radius is verified unique.
**
**  find_ladder()
**
**	NetProp "m_vecSpecifiedSurroundingMaxs" is magic for several reasons:
**
**		1. If it's used correctly with "m_Collision." it will be all
**		   0's -- if it's used wrong it returns the func_simpleladder's
**		   exact world origin, presumably the same used by ent_text.
**
**		2. While m_vecMins/Maxs would also work for unique identification
**		   of ladders, the origin is much easier to understand -- but
**		   the Mins/Maxs are useful for ShowUpdate() to draw them.
**
**		3. VSSM (for short) is all 0's during and for a bit after map
**		   load -- it takes ~8 seconds to exist, varying drastically
**		   based on players and server performance.
**
**	VSSM is LengthSqr() compared to a manual user-discovered "origin",
**	looping through all func_simpleladders in the map until one within very
**	close proximity is found, then returns that ladder as a Handle.
**
**	This is the first step to patching or cloning ladders.
**
**  patch_ladder()
**
**	Accepts an "origin" to a known-existing ladder which find_ladder()
**	discovers then accepts another parameter to change its location.
**	This is used to correct Dark Carnival 4's electrical box ladder.
**
**		IMPORTANT: The "origin" changed to is relative from the
**		ladder's original location -- it has its own "center" that
**		is independent from worldspawn's "0 0 0".
**
**	An optional third parameter accepts new Normals to correct existing
**	ladders that are unclimbable due to wrong faces. This is used to
**	correct Dark Carnival 1's parking lot fence ladder.
**
**	Facing towards the ladder's "TOOLS/CLIMB_VERSUS" texture this is how
**	the Normals work -- there is a rough tolerance of 0.2 on the "raycast"
**	that determines the Normal, so 0.8 and 1.0 may yield identical results:
**
**		0 1 0		exactly North
**		0 -1 0		exactly South
**		1 0 0		exactly West
**		-1 0 0		exactly East
**
**	Now that we can fix existing ladders, let's start making our own !!
**
**  make_ladder()
**
**	Best practices for cloning Infected ladders:
**
**		+ Don't clone ladders within extreme close radius of each other
**		+ Only rotate a cloned ladder when there's no alternatives
**		+ Even if you rotate and it's still climbable still update Normals
**		+ Use "nav_edit 1; nav_show_compass 1" to visualize Normals
**		+ Average the 0.2 tolerance, so if both 0.5 and 0.7 work use 0.6
**		+ If the VSSM parameter must be rounded never round more than 0.1
**		+ The radius exists as BSP recompile and float imprecision fail-safe
**		+ Avoid very tall ladders (No Mercy 4 shaft / Blood Harvest 5 start)
**
**	Normal parameter is optional. If a ladder isn't rotated the original
**	climbable face is ported over. Override Normals when there's rotation.
**
**  InfectedLadders_Spawn()
**
**	Each map with new ladders declares InfectedLadders() and then calls
**	this function, both under "ALL MODES". A logic_timer "retry Think"
**	gives a little extra time after the first VSSM becomes non-0 to then
**	spawn in the ladders -- a necessary delay for find_ladder() to work.
**	Failure to do this will mean ladders don't spawn for the first round.
**	Second round this happens again but completes almost immediately because
**	once VSSM's are populated it's forever.
**
**	InfectedLadders() is declared in "ALL MODES" which this function relies
**	on to have been created. New ladders can be connected to NAV for bots.
**
**  ShowUpdate draws new/cloned Infected ladders in WHITE. Supplemental use of
**  make_clip() creates the "guides" on both sides of the ladder so Survivors
**  don't bump into them and make_prop() creates the visual pipes. Cloned ladders
**  do not come with new NAV connections, so SI bots and Commons can't use them.
*****************************************************************************/

//////////////////////////////////////////////////////////////////////////////
//	kill_funcinfclip:
//
// Accepts the Radius of the func_playerinfected_clip to delete.
//
// Radius is equivalent to a "checksum" that verifies it as unique. Using map
// Blood Harvest 5 as example, its five clips already integrate vecMins/Maxs:
//
//	flRadius	vecMins			vecMaxs			(mins-maxs).Length() / 2
//
//	4564.93		-3225, -2373,  -393	 2665, 4397, 1289	4564.92
//	3833.37		 8191,  -161,   -97	13393, 5121, 1857.1	3833.37
//	2022.66		12415,  -993, -2049	13057, -159, 1857	2022.66
//	 572.373	 -203,  -529,   -81	  203,  529,   81	 572.375
//	3279.91		 9471, -4545, -2049	13057, -683, 1857	3279.91
//
// Thus if "m_Collision.m_flRadius" is manually confirmed unique from all other
// clips, it has 100% identification integrity.
//
// In Blood Harvest 5's case, clip "4564.93" (origin "7320 1220 568.0625") and
// clip "3833.37" (origin "0 0 0") are deleted for new barricade and one-way
// drop ladders -- respectively with the far edge tree matte and out of bounds
// areas meticulously re-clipped to prevent adding new exploits. Its other clips
// have two under the bridge and another obstructing nothing all kept & harmless.
//
// Again, can't use FindByClassnameNearest() because "origin" is not unique.
//////////////////////////////////////////////////////////////////////////////

function kill_funcinfclip( flDesiredRadius )
{
	local hndFuncInfClip	= null;
	local flCompareRadius	= null;

	while( ( hndFuncInfClip = Entities.FindByClassname( hndFuncInfClip, "func_playerinfected_clip" ) ) != null )
	{
		flCompareRadius = NetProps.GetPropFloat( hndFuncInfClip, "m_Collision.m_flRadius" );

		// Convert tostring for identical precision. A < > tolerance of 0.001
		// was experimented with but failed for some clips. There's no universe
		// where we care about Radius in terms of it being a number; it's purely
		// a checksum hash and can be thought of as an alternative targetname.

		if ( flDesiredRadius.tostring() == flCompareRadius.tostring() )
		{
			// Don't use kill_entity() to avoid double console output.
			// Mandatory safety for Community Servers given that they'll
			// have deleted ALL of these and this code would've failed.

			if ( SafelyExists( hndFuncInfClip ) )
			{
				hndFuncInfClip.Kill();

				if ( developer() > 0 )
				{
					// With just GetOrigin() it's most likely all 0's
					// for most maps. When it's all 0's, print vecMins
					// instead as a very good approximation.

					local vecLocation = hndFuncInfClip.GetOrigin();

					if ( vecLocation.x == 0 && vecLocation.y == 0 && vecLocation.z == 0 )
					{
						vecLocation = NetProps.GetPropVector( hndFuncInfClip, "m_Collision.m_vecMins" );
					}

					printl( "Deleted func_playerinfected_clip with Radius checksum "
						+ flDesiredRadius + " @ approximate setpos_exact "
						+ VectorToString_Valve( vecLocation ) + "\n" );
				}
			}

			break;
		}
	}
}

//////////////////////////////////////////////////////////////////////////////
//	find_ladder:
//
// Accepts strDesiredVSSM where "Desired" always refers to the location of the
// ladder sought to be modified or cloned -- there's no guarantee that it will
// produce a result, hence all the clone_model() safeguards.
//
// The VSSM must be found manually via developer dump functions.
//
// Euclidean Calculus:
//
//	LengthSqr() returns "squared length" of vector "x^2 + y^2 + z^2" and is
//	less expensive than Length() because it skips square root calculation.
//	We only need to know the (any order) difference and not exact length.
//
//	Floats can be imprecise by 0.000006. While locational acquisition of
//	the model is immune to recompile, if the ladder is physically moved
//	then it will not be found.
//
//	Radius of 1.4 is used so the operand is roughly 2 (1.96), which should
//	always work -- if it doesn't it's easy to update -- and allows ladders
//	extremely close to other ladders to be fixed, of which Dark Carnival 1's
//	parking lot fence ladder is close but has 3x+ this wiggle room.
//
//	Radius of 1.4 supports a shift of up to 0.47 on all 3 axis -- never round
//	VSSM's more than 0.1 (anv_mapfixes.nut rounds to nearest 0.01 or less).
//
// Function patch_ladder() tweaks ladders found with this and make_ladder()
// passes the found ladder to clone_model() to get its "model" Keyvalue so it
// can be cloned. If there's no match to "return hndLadder", then it wasn't
// found so "return null" to ensure that clone_model() receives "null" which
// uses SafelyExists() to do nothing when "null". On top of all this make_ladder()
// only proceeds if "strModel != null". Redundancy!
//
// Function make_ladder() is greatly simplified and modularized by this.
//////////////////////////////////////////////////////////////////////////////

function find_ladder( strDesiredVSSM, flRadius = 1.4 )
{
	local hndLadder		= null;
	local vecDesiredVSSM	= StringToVector_Valve( strDesiredVSSM, " " );
	local vecCompareVSSM	= null;

	while( ( hndLadder = Entities.FindByClassname( hndLadder, "func_simpleladder" ) ) != null )
	{
		// TODO: Replace with GetCenter(). The vecMaxs/vecMins approach
		// replaced the "VSSM", and now the replacement is obsolete since
		// this has been added to get "true origins". Low-priority, isn't
		// going to noticeably boost efficiency and I fear rare edge cases
		// of broken ladders if before/after spawn counts aren't verified.

		// Instead of using NetProp "m_vecSpecifiedSurroundingMaxs" which requires a
		// dynamic delay and reveals the exact center origin of the ladder, derive it
		// directly from its vecMins/vecMaxs so that it can be spawned instantly!

		local vecMaxs = NetProps.GetPropVector( hndLadder, "m_Collision.m_vecMaxs" );
		local vecMins = NetProps.GetPropVector( hndLadder, "m_Collision.m_vecMins" );

		vecCompareVSSM = Vector( vecMaxs.x - ((vecMaxs.x-vecMins.x)/2),
					 vecMaxs.y - ((vecMaxs.y-vecMins.y)/2),
					 vecMaxs.z - ((vecMaxs.z-vecMins.z)/2) );

		if ( flRadius * flRadius > ( vecDesiredVSSM - vecCompareVSSM ).LengthSqr() )
		{
			if ( developer() > 0 )
			{
				// The only DEVELOPER OUTPUT without a trailing \n.
				// Output from patch_ladder() or make_ladder() follows.

				printl( "Ladder found w/ VSSM @ \"" + strDesiredVSSM + "\"" );
			}

			// Cease these tests the moment a match is found.

			return hndLadder;
		}
	}

	// Runs if nothing was found.

	if ( developer() > 0 )
	{
		printl( "WARNING: Ladder was NOT found w/ VSSM @ \"" + strDesiredVSSM + "\""
			+ "\nMap NOT altered. Bad input, wrong map, or ladder was physically moved!\n" );
	}

	return null;
}

//////////////////////////////////////////////////////////////////////////////
//	patch_ladder:
//
// Accepts user_strDesiredVSSM which is fed into the above find_ladder().
//
// The only ways existing ladders need to be patched is by slightly moving them
// or fixing their Normals. This function does both but if location doesn't
// need fixing specifying it as "0 0 0" will pass-through to Normals.
//
// CAUTION: Move ladder sparingly if it's connected to navmesh.
//////////////////////////////////////////////////////////////////////////////

function patch_ladder ( user_strDesiredVSSM,
			user_strOffsetOrigin,
			user_strNormalOverride = null )
{
	local hndLadder		= find_ladder( user_strDesiredVSSM );

	// Only do anything, including console output, if SafelyExists().
	// Otherwise, it's find_ladder()'s job to say it wasn't found.
	// Without this check it'd regurgitate bad input or critically fail.

	if ( SafelyExists( hndLadder ) )
	{
		if ( user_strOffsetOrigin != "0 0 0" )
		{
			hndLadder.SetOrigin( StringToVector_Valve( user_strOffsetOrigin, " " ) );

			if ( developer() > 0 )		{ printl( "Ladder shifted w/ offset @ \"" + user_strOffsetOrigin + "\"\n" ); }
		}

		if ( user_strNormalOverride != null )
		{
			NetProps.SetPropVector( hndLadder, "m_climbableNormal", StringToVector_Valve( user_strNormalOverride, " " ) );

			if ( developer() > 0 )		{ printl( "Ladder normal changed to \"" + user_strNormalOverride + "\"\n" ); }
		}
	}
}

//////////////////////////////////////////////////////////////////////////////
//	make_ladder:
//
// Cloned ladders are immune to breakage from BSP recompiles because the VSSM
// is dynamically retrieved by location -- only physical movement of originals
// will fail causing find_ladder() to come up empty and this function stops.
//
// Accepts the following parameters (top 3 required):
//
//	user_strNewLadderName		Targetname for clone, blank if null
//	user_strDesiredVSSM		VSSM of ladder desired for cloning
//	user_strOffsetOrigin		Offset from original's local origin
//	user_strOffsetAngles		Offset (minor changes = drastic effect)
//	user_strNormalOverride		Use only if the clone was rotated
//	user_intTeam			Default 2 (Infected), 1/Survivor, 0/Both
//	user_flRadius			Ignore unless something goes wrong
//
// Example call with perfect data to create Blood Harvest 5's new ladder:
//
//	make_ladder( "_ladder_barricadefront_cloned_oneway", "9020 3500 272", "-2970 -3 41" );
//
// Example call with extended parameters for Dead Center 3 start's new ladder:
//
//	make_ladder( "_ladder_kappels_cloned_headroomvent", "612 -947 308", "7484 -2035.7 -148", "0 -90 0", "1 0 0" );
//
// Angles require massive trial-and-error and ideally found with Scout Editor
// because some maps like Dead Center 2 are very large. Rotating ladders on
// large maps will cause the "TOOLS/CLIMB_VERSUS" texture to vanish if any
// origin axis is 16416+ (16-bit integer max = 2^16 or 65536 / 4 16384 + 32).
//
// Rotating a cloned ladder even 1 degree drastically changes origin and will
// usually place it out of view. VMF map files use func_ladder which converts
// to func_simpleladder on BSP compile.
//
// Observe that clone_model() returns null if there's nothing to clone and while
// setting a "model" to null is harmless (it's only an issue when it's the wrong
// or non-precached model), this function does nothing if it returned null.
// Normal NetProp mostly required because normal.x/y/z have periods.
//
// Normal from original ladder is ported to the clone (unless overridden). There
// is no failure output because find_ladder() already logs when it's not found.
//
// NOTE: Clones of clones is unsupported as clones have a blank VSSM. Subsequent
// runs will not process cloned ladders because they're added to end of queue.
//////////////////////////////////////////////////////////////////////////////

function make_ladder ( user_strNewLadderName,
		       user_strDesiredVSSM,
		       user_strOffsetOrigin,
		       user_strOffsetAngles	=	"0 0 0",
		       user_strNormalOverride	=	null,
		       user_intTeam		=	2,
		       user_flRadius		=	1.4 )
{
	local hndLadder		= find_ladder( user_strDesiredVSSM, user_flRadius );

	local strModel		= clone_model( hndLadder );

	// While patch_ladder() requires SafelyExists(), here clone_model()
	// already ensured that. This is protected with high redundancy.

	if ( strModel != null )
	{
		local tblKeyvalues =
		{
			targetname	=	g_UpdateName + user_strNewLadderName,
			model		=	strModel,
			origin		=	StringToVector_Valve( user_strOffsetOrigin, " " ),
			angles		=	StringToVector_Valve( user_strOffsetAngles, " " ),
			team		=	user_intTeam
		};

		local hndLadderClone = SpawnEntityFromTable( "func_simpleladder", tblKeyvalues );

		if ( user_strNormalOverride == null )
		{
			local vecNormalPorted = NetProps.GetPropVector( hndLadder, "m_climbableNormal" );

			NetProps.SetPropVector( hndLadderClone, "m_climbableNormal", vecNormalPorted );
		}

		if ( user_strNormalOverride != null )
		{
			NetProps.SetPropVector( hndLadderClone, "m_climbableNormal", StringToVector_Valve( user_strNormalOverride, " " ) );
		}

		// Dump almost everything but only if it's relevant.

		if ( developer() > 0 )
		{
			print( "LADDER " + strModel + ": \"" + user_strNewLadderName
			       + "\" CLONED w/ offset @ \"" + user_strOffsetOrigin + "\"" );

			if ( user_strOffsetAngles != "0 0 0" )
			{
				print( " & angles \"" + user_strOffsetAngles + "\"" );
			}
			if ( user_strNormalOverride != null )
			{
				print( " w/ Normal Override \"" + user_strNormalOverride + "\"" );
			}

			printl( "\n" );
		}
	}
}

//////////////////////////////////////////////////////////////////////////////
//	InfectedLadders_Spawn:
//
// Spawns (or patches) ladders on ALL gamemodes since they can be connected to
// NAV mesh and used by bots! Most new ladders are designed specifically with
// players in mind instead of bots, but some benefit Survival to resolve stuck
// SI bots or basic patches to ladders Survivors can climb. New ladders often
// come with new pipe model props and clips to visualize the new ladders, which
// are far less confusing if just spawned for all gamemodes.
//
// Looks for the 1st func_simpleladder and every 1 second does nothing if its
// VSSM isn't yet populated -- once populated, immediately delete logic_timer
// then wait an over-cautious 2 seconds to ensure ALL are populated, then spawn.
// All find_ladder() calls require delay-loads until the VSSM's are non-0, and
// both make_ladder() and patch_ladder() rely on it. Note that patched ladders
// can still be cloned as the VSSM doesn't change even if they are moved!
//
// A fixed / static delay will not work since map load times constantly vary,
// where VSSM takes 5-6 seconds but "c5m1_waterfront_sndscape" takes up to 9.
// Ladders will be retried repeatedly until they're beyond-safe to spawn.
// Players shouldn't notice the delay as at most 1-2 seconds of this waiting
// is observable. With "display_game_events 1" the VSSM is (usually) populated
// after "player_team" (first join) and before "player_connect_full" -- there
// is no definitive known moment.
//////////////////////////////////////////////////////////////////////////////

// DEPRECATED & NOT USED OFFICIALLY :: KEPT AS LAST-RESORT FALLBACK OR HISTORICAL REFERENCE

function InfectedLadders_Spawn()
{
	// Game Event "player_connect_full" appears to be late enough for VSSM's to
	// exist so this dynamic delay is no longer necessary. Spawn instantly for now.

	EntFire( "worldspawn", "CallScriptFunction", "InfectedLadders" );

//	// Required global function so anv_mapfixes.nut InfectedLadders_Spawn() call
//	// can find it -- if not global, its logic_timer will stall and do nothing.
//
//	::RetryThink <- function()
//	{
//		local hndFirstLadder	= Entities.FindByClassname( null, "func_simpleladder" );
//		local vecFirstVSSM	= NetProps.GetPropVector( hndFirstLadder, "m_vecSpecifiedSurroundingMaxs" );
//
//		// Of ~450 unique VSSM's used, only "-11120 -7697 0", "-900 -2432 0",
//		// and "2047 256 0" are on the exact ground of Z = 0. Of those ~450,
//		// X and Y are never 0. Evaluating with Z != 0 could cause rare issues
//		// if those are first, so instead ensure all are 0 then ! to do nothing.
//
//		if ( ! ( vecFirstVSSM.x == 0 && vecFirstVSSM.y == 0 && vecFirstVSSM.z == 0 ) )
//		{
//			EntFire( "worldspawn", "CallScriptFunction", "InfectedLadders", 2.16 );
//
//			EntFire( g_UpdateName + "_InfectedLadders_Spawn", "Kill" );
//		}
//		else if ( developer() > 0 )
//		{
//			printl( "Server Time " + Time() + ": Waiting for Infected Ladders...\n" );
//		}
//
//		// If "hndFirstLadder" is null it means the map has 0 func_simpleladder.
//		// Maps like Dead Center 1 and "curling_stadium" have 0, so delete the
//		// logic_timer so it doesn't exist and developer spam forever. Strangely,
//		// if either of those maps are the first loaded in a game session then
//		// "vecFirstVSSM" will be all-0's -- the moment a map with ladders like
//		// Dark Carnival 1 is loaded, they'll be non-0, then if a map without
//		// ladders is loaded again the value will have remained the same as from
//		// the previous map i.e. "(vector : (1234, 5678, 910))". This code is
//		// only necessary if a map with 0 ladders is loaded first. It's a guess
//		// this is due to some "VScript leak" or "NetProp anomaly", but produces
//		// no issues with even high-volume multi-map ladder spawns.
//
//		if ( hndFirstLadder == null ) { EntFire( g_UpdateName + "_InfectedLadders_Spawn", "Kill" ); }
//	}
//
//	SpawnEntityFromTable( "logic_timer",
//	{
//		targetname	= g_UpdateName + "_InfectedLadders_Spawn",
//		RefireTime	= 1,
//		connections =
//		{
//			OnTimer =
//			{
//				cmd1 = "!selfCallScriptFunctionRetryThink0-1"
//			}
//		}
//	} );
}

/*****************************************************************************
**  INFECTEDHUMENTS_SPAWN
**
**  Similar to but simpler than InfectedLadders_Spawn(). Gamemodes.txt flags
**  "playercontrolledzombies = 1" for all Versus/Scavenge basemodes; however,
**  VS Survival ("mutation15") is really basemmode Survival with this set to 1.
**  Function runs for all those plus future unknowns.
**
**  Some maps like Death Toll 3 and 5 have non-solid trees that'd otherwise
**  be useful for SI Players to spawn behind. File anv_mapfixes.nut declares
**  an "ALL MODES" function InfectedHumEnts() then runs InfectedHumEnts_Spawn()
**  which produces them on gamemodes with Human-controlled SI.
**
**  Entities prefixed with "_solidify" and "_losfix" are the main focus here
**  both only relevant to Humans -- kill_funcinfclip() calls also pooled here
**  since func_playerinfected_clip only block Humans. Delay-loads unnecessary.
**
**  NOTE: Reserved for exception handling; make_prop() un-renders "_solidify"!
*****************************************************************************/

// DEPRECATED & NOT USED OFFICIALLY :: KEPT AS LAST-RESORT FALLBACK OR HISTORICAL REFERENCE

function InfectedHumEnts_Spawn()
{
	if ( HasPlayerControlledZombies() )
	{
		// Simply spawn all anv_mapfixes.nut-declared entities.

		EntFire( "worldspawn", "CallScriptFunction", "InfectedHumEnts" );
	}
}

/*****************************************************************************
**  PATCH_NAV_OBSCURED
**
**  Adds "OBSCURED" (4096) attribute to NAV areas to assist Versus players with
**  spawning. Large, thick trees are marked this so Commons and SI Players can
**  materialize even if a Survivor is looking directly at it provided they're
**  still ~400 units away from it.
**
**  Some maps lack "OBSCURED" in places that could benefit from them and may be
**  best to keep to Versus since it risks imbalancing Commons in other modes.
**  It is impossible to remove these attributes (i.e. Parish 1's exploit). If a
**  func_nav_blocker has added BLOCKED_ZOMBIE to the area, Ghost SI won't be able
**  to spawn even if marked "OBSCURED" -- however, if also LOS'd they can.
**
**  Requires near-exact coordinates and 1 call for each nav area changed. Only
**  needs to run once since changes persist entire load session.
*****************************************************************************/

function patch_nav_obscured( user_strOrigin )
{
	if ( g_UpdateRanOnce == false )
	{
		local hndNavAttr = SpawnEntityFromTable( "point_nav_attribute_region",
		{
			spawnflags	=	4096,
			mins		=	Vector( 0, 0, 0 ),
			maxs		=	Vector( 1, 1, 1 ),
			origin		=	StringToVector_Valve( user_strOrigin, " " )
		} );

		DoEntFire( "!self", "ApplyNavAttributes", "", 0.0, null, hndNavAttr );

		hndNavAttr.Kill();

		if ( developer() > 0 )
		{
			printl( "Navmesh modified w/ OBSCURED @ setpos_exact " + user_strOrigin + "\n" );
		}
	}
}

/*****************************************************************************
**  PATCH_NAV_CHECKPOINT
**
**  The following safe rooms have NAV that's technically OUTSIDE. In Coop this
**  causes the Director to spawn prematurely, in TAANK! Mutation it can result
**  in Tanks spawning inside the safe room, and in Versus it can be abused by
**  the Survivor team to infinitely camp with the doors never auto-opening.
**
**  This is how each map is exploitable, standing up against door in each case:
**
**	mapname			which door?	"anv_mapfixes.nut" call
**
**	c2m2_fairgrounds	start		patch_nav_checkpoint( "1737 2712 4" );
**	c2m2_fairgrounds	end		patch_nav_checkpoint( "-4337 -5511 -64" );
**	c2m3_coaster		start		patch_nav_checkpoint( "3852 2037 -64" );
**	c5m1_waterfront		end		patch_nav_checkpoint( "-3764 -1224 -344" );
**	c6m3_port		start		patch_nav_checkpoint( "-2227 -362 -256" );
**	c9m1_alleys		end		patch_nav_checkpoint( "337 -1550 -176" );
**	c11m4_terminal		end		patch_nav_checkpoint( "3175 4562 152" );
**
**  This function simply applies "spawnflags 2048" to the 1 NAV square in each
**  of those safe rooms that lack "select_with_attribute CHECKPOINT". Note that
**  there's some close-calls which aren't exploitable, like "c5m4_quarter" and
**  cases where there's gaps but the recent-most NAV touched was "CHECKPOINT".
**
**  This exploit is unique from old ones where Survivors could stand outside or
**  Special Infected inside the "info_changelevel" trigger volume -- of which,
**  all were long fixed (except SWAMP FEVER 1 in ZoneMod only). Hiding places
**  inside safe rooms (like SACRIFICE 2 ceiling) are just that: hiding places.
*****************************************************************************/

function patch_nav_checkpoint( user_strOrigin )
{
	if ( g_UpdateRanOnce == false )
	{
		local hndNavAttr = SpawnEntityFromTable( "point_nav_attribute_region",
		{
			spawnflags	=	2048,
			mins		=	Vector( 0, 0, 0 ),
			maxs		=	Vector( 1, 1, 1 ),
			origin		=	StringToVector_Valve( user_strOrigin, " " )
		} );

		DoEntFire( "!self", "ApplyNavAttributes", "", 0.0, null, hndNavAttr );

		hndNavAttr.Kill();

		if ( developer() > 0 )
		{
			printl( "Navmesh modified w/ CHECKPOINT @ setpos_exact " + user_strOrigin + "\n" );
		}
	}
}

/*****************************************************************************
**  SPAWN_IN_FRONT_OF_SURVIVORS ONSLAUGHT EVENT BUG
**
**  A total of 6 maps require this fix. Cold Stream 2 worst-case-scenario call:
**
**	patch_spawninfront( "78 8574 -405", "-70 -8 0", "70 8 256" );
**
**  When all 4 Survivors enter the end safe room's CHECKPOINT NAV, Commons do
**  cease spawning inside the end safe room -- except for when only one made it
**  or bots have been deleted. Many map onslaught events have a trigger_once
**  inside the end safe room that fires "EndScript" to terminate it, including
**  Death Toll 4 and Blood Harvest 4. Other maps like Cold Stream 2 lack this
**  and will constantly spawn on top of the Survivors even with door closed.
**  Maps like Passing 2 avoid this with "EMPTY NO_MOBS NOTHREAT" marking outside
**  the safe room -- but that doesn't work for cases they NEED to spawn inside.
**
**  This function creates a trigger_once on the aforementioned maps, in addition
**  to Dead Air 4, Blood Harvest 3, and Dark Carnival 4 to modify DirectorOptions
**  so "PreferredMobDirection" becomes "SPAWN_NO_PREFERENCE" when Survivors are
**  comfortably close to end safe room. It doesn't "EndScript" but rather lets
**  the events run the same as always exclusively removing the Survivor bug.
**
**  ShowUpdate() draws all trigger_once in YELLOW.
*****************************************************************************/

function patch_spawninfront( strOrigin, strMins, strMaxs )
{
	SpawnEntityFromTable( "trigger_once",
	{
		targetname	= g_UpdateName + "_spawnnopreference_trigonce",
		spawnflags	= 1,
		filtername	= "anv_globalfixes_filter_survivor",
		origin		= StringToVector_Valve( strOrigin, " " ),
		connections =
		{
			OnStartTouch =
			{
				cmd1 = "!selfRunScriptCodeg_MapScript.LocalScript.DirectorOptions.PreferredMobDirection <- -101"
			}
		}
	} );

	EntFire( g_UpdateName + "_spawnnopreference_trigonce", "AddOutput", "mins " + strMins );
	EntFire( g_UpdateName + "_spawnnopreference_trigonce", "AddOutput", "maxs " + strMaxs );
	EntFire( g_UpdateName + "_spawnnopreference_trigonce", "AddOutput", "solid 2" );

	if ( developer() > 0 )
	{
		printl( "trigger_once SPAWN_IN_FRONT_OF_SURVIVORS fix created @ setpos_exact " + strOrigin + "\n" );
	}
}

/*****************************************************************************
**  MAKE_ATOMIZER
**
**  Tanks are able to hit prop_physics with rocks which causes them to never
**  de-spawn -- normally of which happens 60 seconds after the last punch.
**  Similarly, Chargers are able to displace the same props. Both exploits can
**  be used to permanently block chokepoints in Versus preventing progression.
**
**  Sometime in 2009, Dark Carnival 2 had a forklift before its chokepoint
**  removed because it was exploitable -- this update re-adds and fixes with:
**
**	make_atomizer( "_atomizer_bsp_forklift", "2752 -1529 0", "models/props/cs_assault/forklift.mdl", 15 );
**
**  Several maps are exploitable, but the 2009 forklift was special because it
**  was very quick to setup -- so it's deleted after only 15 contiguous seconds
**  of it being inside the trigger's volume instead of the standard 60 seconds.
**  In most places the delay is 60 seconds to ensure there's no difference from
**  the prop being punched -- thus, in most cases these triggers will never take
**  out an in-play prop, except expedited cases like Dark Carnival 2 of which
**  there are two nearby dumpsters to use instead.
**
**  A specific model is required with triggers locked to "Physics Objects" (8)
**  to ensure players are never deleted -- even if the spawned filters themselves
**  were deleted, the worst-case scenario is it'd delete props of any model.
**  If two props are hit into the same trigger, both are cleared on same delay.
**
**  Props are telegraphed to Survivors with a 5 second glow before deletion.
**  This is to help players adjust to the new reality they can progress again.
**
**  ShowUpdate() draws all trigger_multiple in YELLOW.
*****************************************************************************/

function make_atomizer( user_strTargetname,
			user_strOrigin,
			user_strModel,
			user_intKillTimer )
{
	SpawnEntityFromTable( "filter_activator_model",
	{
		targetname	= g_UpdateName + user_strTargetname + "_filter",
		Negated		= "Allow entities that match criteria",
		model		= user_strModel
	} );

	SpawnEntityFromTable( "logic_timer",
	{
		targetname	= g_UpdateName + user_strTargetname + "_timer",
		StartDisabled	= 1,
		RefireTime	= user_intKillTimer,
		connections =
		{
			OnTimer =
			{
				cmd1 = "anv_mapfixes_atomizer_monitoredStartGlowing0-1"
				cmd2 = "anv_mapfixes_atomizer_monitoredKill5-1"
				cmd3 = "!selfDisable0-1"
				cmd4 = "!selfResetTimer0-1"
			}
		}
	} );

	SpawnEntityFromTable( "trigger_multiple",
	{
		targetname	= g_UpdateName + user_strTargetname + "_trigmult",
		origin		= StringToVector_Valve( user_strOrigin, " " ),
		spawnflags	= 8,
		filtername	= g_UpdateName + user_strTargetname + "_filter",
		connections =
		{
			OnStartTouch =
			{
				cmd1 = g_UpdateName + user_strTargetname + "_timer" + "Enable0-1"
				cmd2 = "!activatorAddOutputtargetname anv_mapfixes_atomizer_monitored0-1"
				cmd3 = "!selfAddOutputspawnflags 00-1"
			}
			OnEndTouch =
			{
				cmd1 = g_UpdateName + user_strTargetname + "_timer" + "Disable0-1"
				cmd2 = g_UpdateName + user_strTargetname + "_timer" + "ResetTimer0-1"
				cmd3 = "!selfAddOutputspawnflags 80-1"
			}
		}
	} );

	EntFire( g_UpdateName + user_strTargetname + "_trigmult", "AddOutput", "mins -50 -50 0" );
	EntFire( g_UpdateName + user_strTargetname + "_trigmult", "AddOutput", "maxs 50 50 100" );
	EntFire( g_UpdateName + user_strTargetname + "_trigmult", "AddOutput", "solid 2" );

	if ( developer() > 0 )
	{
		printl( "trigger_multiple Tank/Charger chokepoint atomizer created @ setpos_exact " + user_strOrigin + "\n" );
	}
}

/*****************************************************************************
**  MAKE_AXISWARP
**
**  Creates a trigger_multiple that warps the player based on parameters:
**
**	user_strAxis		Direction of the warp as "x+/-" or "y+/-"
**	user_intOffset		Distance of the warp along that direction
**
**  Undeletable invisible walls or SKYBOX are a fact of life and this function
**  creates a trigger_multiple that will offset players through them. These are
**  also placed to accompany undeletable SI Player wrongway signs. Deletable
**  func_illusionary or func_brush wrongway signs is always preferred, but those
**  undeletable prop_statics are salvaged by forcing one-way traversability.
**
**  A usage example is Dark Carnival 5's finale where func_playerinfected_clips
**  that cause SI Players to spawn inside walls are deleted, but the undeletable
**  wrongway signs are reinforced with a clip and axis warp to be one-way only.
**  While make_trigpush() could accomplish this they were too exploitable.
**
**  This warp is along a single axis. Momentum is not preserved because pre-warp
**  velocity is lost due to wall collision and Hunter/Charger require too many
**  high-speed exceptions. Use for simple corrective warps only. Doubles as a
**  Survivor pseudo-push invisible wall (there's no filter) which is accidentally
**  useful because func_playerinfected_clips only block SI Players.
**
**  ShowUpdate() draws all trigger_multiple in YELLOW.
*****************************************************************************/

function make_axiswarp ( user_strTargetname,
			 user_strAxis,
			 user_intOffset,
			 user_strMins,
			 user_strMaxs,
			 user_strOrigin )
{
	// Translation result is stored as a String for OnStartTouch.

	local strCommand = null;

	switch( user_strAxis )
	{
		case "x+":	strCommand = "+ Vector( " + user_intOffset + ", 0, 0 ) );";	break;
		case "x-":	strCommand = "- Vector( " + user_intOffset + ", 0, 0 ) );";	break;
		case "y+":	strCommand = "+ Vector( 0, " + user_intOffset + ", 0 ) );";	break;
		case "y-":	strCommand = "- Vector( 0, " + user_intOffset + ", 0 ) );";	break;
	}

	// Trigger that warps activators. Caution that RunScriptCode has a byte limit
	// of 254 this code falls well within (86 minimum with tons of float room).

	SpawnEntityFromTable( "trigger_multiple",
	{
		targetname	= g_UpdateName + user_strTargetname + "_trigmult",
		origin		= StringToVector_Valve( user_strOrigin, " " ),
		spawnflags	= 1,
		allowghost	= 1,
		connections =
		{
			OnStartTouch =
			{
				cmd1 = "worldspawnRunScriptCodeactivator.SetOrigin( activator.GetOrigin() " + strCommand + "0-1"
			}
		}
	} );

	EntFire( g_UpdateName + user_strTargetname + "_trigmult", "AddOutput", "mins " + user_strMins );
	EntFire( g_UpdateName + user_strTargetname + "_trigmult", "AddOutput", "maxs " + user_strMaxs );
	EntFire( g_UpdateName + user_strTargetname + "_trigmult", "AddOutput", "solid 2" );

	if ( developer() > 0 )
	{
		printl( "trigger_multiple " + user_strAxis + " axis warp created @ setpos_exact " + user_strOrigin + "\n" );
	}
}

/*****************************************************************************
**  MODIFY_TRIGFILTER
**
**  Example call from Dead Center 1's Versus lobby fix to not kill SI Players:
**
**	modify_trigfilter( "1600 4608 1648", "filter_survivor", "trigger_hurt" );
**
**  This function fixes who can activate a trigger. On Dead Center 1 the skylight
**  glass shouldn't kill SI Players; on Dark Carnival the chopper sequences
**  are inconsistent; and on No Mercy 2 Infected can trigger the chopper fly-over.
**
**  NetProp "m_hFilter" is mandatory while "m_iFilterName" is only changed to
**  ensure "ent_dump" reports the updated filter.
**
**  Defaults to using new built-in Survivor filter but ideally overridden with
**  one already in the map. Defaults to "trigger_once" since they're the most
**  common but anything can be specified instead.
*****************************************************************************/

function modify_trigfilter( strOrigin,
			    strFiltername	=	"anv_globalfixes_filter_survivor",
			    strClassname	=	"trigger_once" )
{
	local hndTrigger	= Entities.FindByClassnameNearest( strClassname, StringToVector_Valve( strOrigin, " " ), 1 );

	local hndFiltername	= Entities.FindByName( null, strFiltername );

	if ( SafelyExists( hndTrigger ) && SafelyExists( hndFiltername ) )
	{
		NetProps.SetPropString( hndTrigger, "m_iFilterName", strFiltername );
		NetProps.SetPropEntity( hndTrigger, "m_hFilter", hndFiltername );
	}

	if ( developer() > 0 )
	{
		printl( strClassname + " filter modified to " + strFiltername + " @ setpos_exact " + strOrigin + "\n" );
	}
}

/*****************************************************************************
**  CORRECTING PROP SOLIDITY
**
**  Throughout all maps, "models/props_fortifications/orange_cone001_reference.mdl"
**  is used 161 times where they're non-solid debris. PARISH 4 is the extreme
**  exception where all 13 are solid and players get stuck on too many. These
**  functions resolve this problem on a map-specific, case-by-base basis.
**
**  The vast majority of smaller prop_physics have "spawnflags 260" which makes
**  them debris (4) and "Generate output on +use" (256) -- spawnflags cannot
**  change prop_physics solidity post-creation so "m_CollisionGroup" changes it
**  from 0 (normal) to 1 (debris). Orange cones are the worst offender by far
**  and are much smaller than "traffic_barrier001.mdl" which are always non-solid.
**
**	unsolidify_prop		Pass it a Handle to a dynamic or physics prop
**	unsolidify_model	Pass it a model path to un-solidify ALL of them
**
**  When it comes to prop_dynamics, several ceiling lights on NO MERCY 2 Survival
**  Generator Room can be boosted onto and AFK'd on -- they have DisableCollision.
**  Some of them already non-solid. We're resolving obvious inconsistency.
**
**  Just text dump, DebugDrawCircle() too fleeting to work with ShowUpdate().
*****************************************************************************/

function unsolidify_prop( user_hndProp )
{
	local strClassname = user_hndProp.GetClassname();

	if ( strClassname == "prop_dynamic" )
	{
		DoEntFire( "!self", "DisableCollision", "", 0.0, null, user_hndProp );
	}

	if ( strClassname == "prop_physics" )
	{
		NetProps.SetPropInt( user_hndProp, "m_CollisionGroup", 1 );
	}

	if ( developer() > 0 )
	{
		printl( "Un-solidified " + strClassname + " @ setpos_exact "
			+ VectorToString_Valve( user_hndProp.GetOrigin() ) + "\n" );
	}
}

function unsolidify_model( user_strModel )
{
	local hndProp = null;

	while( ( hndProp = Entities.FindByModel( hndProp, user_strModel ) ) != null )
	{
		unsolidify_prop( hndProp );
	}

	if ( developer() > 0 )
	{
		printl( "Un-solidified ALL props with model: \"" + user_strModel + "\"\n" );
	}
}

/*****************************************************************************
**  GLOBAL FILTERS
**
**  Most maps have team filters, but if we're to rely on them for the creation
**  or modification of triggers they need to be consistently named.
**
**  Function is called each round by Apply_Quadmode_Map_Specific_Fixes() and
**  the filters are instantly deleted if it's a non-Valve map. Note that filters
**  for Tank aren't provided as triggers are slow to respond to player Tanks,
**  and Scavenge Gascans cannot be detected by triggers.
*****************************************************************************/

function SpawnGlobalFilters()
{
	SpawnEntityFromTable( "filter_activator_team",
	{
		targetname		=	"anv_globalfixes_filter_survivor",
		Negated			=	"Allow entities that match criteria",
		filterteam		=	2
	} );

	SpawnEntityFromTable( "filter_activator_team",
	{
		targetname		=	"anv_globalfixes_filter_infected",
		Negated			=	"Allow entities that match criteria",
		filterteam		=	3
	} );
}

/*****************************************************************************
**  HELPER FUNCTIONS
**
**  Instead of bundling libraries, here lies only what's needed. Given that
**  "StringToVector" is an extremely common function name and some don't use
**  float precision, the name is unique to prevent conflicts (such as blockers
**  not being exactly where they were intended, or triggers).
*****************************************************************************/

//////////////////////////////////////////////////////////////////////////////
// Convert any String to a Vector with floating-point precision.
//////////////////////////////////////////////////////////////////////////////

function StringToVector_Valve( string, delimiter )
{
	local vector = Vector( 0, 0, 0 );

	local parse = split( string, delimiter );

	vector.x = parse[0].tofloat();
	vector.y = parse[1].tofloat();
	vector.z = parse[2].tofloat();

	return vector;
}

function VectorToString_Valve( vector )
{
	return vector.x + " " + vector.y + " " + vector.z;
}

//////////////////////////////////////////////////////////////////////////////
// Equivalent to built-in printl() but only outputs anything if DEVELOPER MODE.
// This is used in "anv_mapfixes.nut" to have code comments in-game for fixes
// that require logic or trigger injection. Accompanies entity dumps.
//////////////////////////////////////////////////////////////////////////////

function con_comment( strComment )
{
	if ( developer() > 0 )
	{
		printl( strComment + "\n" );
	}
}

/*****************************************************************************
**  DEBUG AND DUMP AWARENESS
**
**  Only when "developer 1" display the fixed map's name and base mode in console.
**  Confirms that even maps/modes without fixes are still running their case. An
**  example of output: "MAP FIXES :: LAST STAND - THE LIGHTHOUSE ( ALL MODES )".
**
**  File "anv_mapfixes.nut" runs this when "BASE COOP / VERSUS / SURVIVAL / SCAVENGE"
**  (here simplified to just != "TUTORIAL") for only the Official Valve maps.
**  After all entities have been spawned (and dumped if DEVELOPER MODE) if it's
**  an Official Valve map 'devchap( "TUTORIAL" )' then runs to inform testers
**  about "script ShowUpdate()" to see all changes.
**
**  DEVELOPER MODE is required for everything here EXCEPT the "else if" condition
**  which will ALWAYS announce "Anniversary Map Fixes" presence. The name "devchap"
**  is derived from it being mostly for DEVELOPER MODE and printing chapter name.
*****************************************************************************/

function devchap( mode )
{
	// Stamp the chapter and gamemode (i.e. "ALL MODES" or "BASE VERSUS") the applied fixes belong to.

	if ( developer() > 0 && mode != "TUTORIAL" )
	{
		printl( "\n################################################################################\n" +
			"####\n" + "####    MAP FIXES :: " + g_Chapter + " ( " + mode + " )\n####" +
			"\n################################################################################\n" );
	}

	// Ensure the tutorial is only shown once per "round_start" and always show "developer 1" notice.
	// Function is called with 'devchap( "TUTORIAL" )' at end of "anv_mapfixes.nut".

	if ( developer() > 0 && mode == "TUTORIAL" )
	{
		printl( "Anniversary Map Fixes: Run or bind \"script ShowUpdate()\" and \"script HideUpdate()\"" );
		printl( "to draw new blockers and glow new props. They are named according to purpose and" );
		printl( "you can see entity definitions above. If you make/delete \"anv_mapfixes\"-prefixed" );
		printl( "entities, toggle Hide/Show to apply changes. Please report all issues and concerns" );
		printl( "to Tsuey's Workshop https://steamcommunity.com/sharedfiles/filedetails/?id=1959405608\n" );
	}
	else if ( mode == "TUTORIAL" )
	{
		printl( "Anniversary Map Fixes: Restart with Launch Option -dev to reveal verbose entity debug dumps." );
		printl( "Anniversary Demo Mode: Run \"script_execute z_developer_showupdate\" >> \"script ShowUpdate()\"." );
	}
}