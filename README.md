# L4D2-Community-Update

Help us shape the potential future of L4D2 vanilla.

Exploit fixes and PvP enhancements for the original 13 campaigns were done using VScript files.

# Caution

Kerry Davis has approved sharing of the non-encrypted VScript files.

You can do whatever you want with them.

However, if you intend to use these files as a template for your own mods (replacing "mapfixes.nut" entirely), please rename "mapspawn.nut" to "mapspawn_addon.nut" which will allow you to not override the base game fixes.

Alternatively, if you're a server admin already settled with your Stripper:Source files, create an empty "mapspawn.nut" file to opt-out!

# Organization

Folder | Purpose
------ | -------
changelogs | Cumulative for each stretch of time before all hotfixes go live.<br><br>Includes dedicated credits list. This will be maintained but if you've long been missing, please open a PR.
root | Hotfix files for test VPK's that ultimately target going in-game officially.<br><br>Please keep all source files and everything else out. Upload original un-changed files before modified files.
sources | Valve requires QC and other source files for every model we recompile.<br><br>This includes textures but not materials.
tools | Some of the lighter-weight custom tools that our team uses, for community reference.<br><br>See its README for operational details.

# Contributors

Dedicated credits list:

https://github.com/Tsuey/L4D2-Community-Update/blob/master/changelogs/README.md

https://www.l4d.com/laststand/

https://steamcommunity.com/groups/l4d2cut

# Videos

Because sometimes watching is just better than reading:

[![L4D2 Last Stand VS: Directors' Commentary Part 1 (Dead Center 2)](https://i.imgur.com/zHGZbamm.jpg)](https://www.youtube.com/watch?v=27lFQod69X4 "L4D2 Last Stand VS: Directors' Commentary Part 1 (Dead Center 2)") [![Tutorial: See all the Versus Changes in L4D2 Last Stand Update!](https://i.imgur.com/9qTlqk4m.jpg)](https://www.youtube.com/watch?v=eKrOtGaLWAs "Tutorial: See all the Versus Changes in L4D2 Last Stand Update!")

# Resources

Community Update Testing Initiative (Workshop mirror):

https://steamcommunity.com/sharedfiles/filedetails/?id=1959405608

ShowUpdate() guide and changelog links:

https://steamcommunity.com/workshop/filedetails/discussion/1959405608/2841165820087455557/

MrFailzz' Coop/speedrunner-focused changelog with navmesh changes:

https://hackmd.io/@failzz/rJ5S7EZHw

Valve development thread:

https://steamcommunity.com/app/550/discussions/1/1651043320659915818/

# Technical

This is a near-comprehensive, single-file solution to patching or adding content to any map, on any base or mutation mode, in a manner that persists rounds. Includes entity creation functions that maximize code re-use with a focus on user clarity and debugging.

This project had 1 simple goal: to replace Valve's previous inefficient usage of _commentary.txt files to patch maps.

Valve maps only: Survivor and Infected given new activator filters with names consistent across all maps!

New global variables powered by "mapspawn.nut":

	g_MapName		Identical to "Director.GetMapName().tolower()"
	g_MutaMode		Identical to "Director.GetGameMode()"
	g_BaseMode		Identical to "Director.GetGameModeBase()"
	g_Chapter		Stores each "friendly name" (only for Valve campaigns)
	g_UpdateName		Prefixes "anv_mapfixes" to new entities
	g_UpdateRanOnce		Run code only once outside of "mapspawn.nut"

Added new feature-full entity maker and edit functions in "anv_functions.nut":

Almost everything is a String:

	* Denotes optional parameters (wherever possible i.e. often Angles)

	^ Denotes non-String parameters (floats or integers i.e. "Init state")

	? Denotes user-friendly String options

		"Clips who?"	= Everyone | Survivors | SI Players | SI Players and AI | All and Physics
		"Team blocked?"	= Everyone | Survivors | Infected
		"Start state?"	= Apply | Remove
		"Push what?"	= Everything | Survivor | Infected | Physics
		"Hurt who?"	= Everyone | Survivor | Infected | Ghost
		"Option?"	= Duck | Walk | Jump
		"Prop type?"	= dynamic | dynamic_ovr | physics | physics_ovr
		"Shadows?"	= shadow_yes | shadow_no
		"Solidity?"	= solid_yes | solid_no
		"Team climb?"	= 0 (Both) | 1 (Survivor) | 2 (Infected)
		"Axis?"		= x+ | x- | y+ | y-

	make_clip		Targetname	Clips who?	^Init state	Box mins	Box maxs	Origin		*Angles

	make_brush		Targetname	Box mins	Box maxs	Origin		! Blocks stuff clips don't i.e. bullet hitreg

	make_navblock		Targetname	Team blocked?	Start state?	Box mins	Box maxs	Origin

	make_trigpush		Targetname	Push what?	^Speed		Push Direction	Box mins	Box maxs	Origin
				*Angles		*Filter Override		! Angles have unknown mild influence but mostly don't work

	make_trighurt		Targetname	Hurt who?	Box mins	Box maxs	Origin		! Creates an insta-kill volume

	make_trigduck		Targetname	Box mins	Box maxs	Origin		! Auto-crouch into small passages

	make_trigmove		Targetname	Option?		Box mins	Box maxs	Origin		! Enforces movement Option

	make_prop		Prop type?	Targetname	Model path	Origin		*Angles		*Shadows?	*Solidity?
				*Render color	*^FadeMinDist	*^FadeMaxDist	*^Mass scale
				! Targetname with "_solidify" prefix only for 1:1 copied prop_statics; prop_dynamics with prefix will not render!

	make_decal		Texture path	Origin

	SafelyExists		Entity handle	! Ensures no crashes or red console errors when deleting or modifying entities

	kill_entity		Entity handle	! Used for removing Versus defibrillators or func_breakable skylights to add Ladders

	clone_model		Entity handle	! Returns guaranteed-precached "*#" model of any entity that SafelyExists ("null" if not found)

	kill_funcinfclip	Desired radius	! Checksum uniquely referring to them to VERY selectively delete bothersome Versus clips

	find_ladder		Desired VSSM	*^Radius	! See code documentation on VSSM, bad input will produce nothing

	patch_ladder		Desired VSSM	Offset origin	*New normal	! 0 1 0 North | 0 -1 0 South | 1 0 0 West | -1 0 0 East

	make_ladder		Ladder name	Desired VSSM	Offset origin	*Offset angles	*New normal	*^Team climb?	*^Radius
				! Only modify Normal if the clone was rotated -- if none, the original's is ported over

	InfectedLadders_Spawn	! No parameters: Relies on InfectedLadders() being declared then delay-loads them for ALL gamemodes
				! Infected ladders are relevant to ALL gamemodes since they can be connected to NAV mesh and used by bots!
		DEPRECATED

	InfectedHumEnts_Spawn	! No parameters: Relies on InfectedHumEnts() being declared and produces them on Versus / VS Survival / Scavenge
				! Reserved for exception handling; make_prop() already handles the "_solidify" prefixes!
		DEPRECATED

	patch_nav_obscured	Origin nav area	! Runs once b/c "OBSCURED" permanently applied

	patch_nav_checkpoint	Origin nav area	! Runs once b/c "CHECKPOINT" permanently applied

	patch_spawninfront	Origin		Box mins	Box maxs	! Stop Commons spawning inside Survivors in end safe rooms

	make_atomizer		Targetname	Origin		Model path	^Delete timer	! Disintegrates Tank/Charger chokepoint blockades

	make_axiswarp		Targetname	Axis?		^Offset		Box mins	Box maxs	Origin		! Bandaid fixes

	modify_trigfilter	Origin		*Filter name	*Class name

	unsolidify_prop		Entity handle	! Un-solidifies a specific dynamic/physics prop

	unsolidify_model	Model path	! Un-solidifies all props with this model

	SpawnGlobalFilters	! No parameters: Creates a "filter_activator_team" for Survivor & Infected
				! Named "anv_globalfixes_filter_survivor" & "anv_globalfixes_filter_infected"

	StringToVector_Valve	String		Delimiter

	VectorToString_Valve	^Vector

	con_comment		Comment		! Does printl() with \newline after only if "developer() > 0"

	devchap			Mode		! Developer indication of if "TUTORIAL", "ALL MODES", "BASE VERSUS", etc.
						! Always notifies of Anniversary Map Fixes update w/ more details if "developer 1"
