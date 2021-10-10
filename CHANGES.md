1.1.2 (Oct 3rd, 2021)
=====================
Summary
-------

- Release candidate
- 1 contributor

### What's new

Anyone may test these and report issues.

Valve will be kept up-to-date and ship when they can.

- Quick fix for invisible Forklift.

### Contributors

- Tsuey

1.1.1 (Oct 2nd, 2021)
=====================
Summary
-------

- Release candidate
- 3 contributors
- 6 pull requests

### What's new

Anyone may test these and report issues.

Valve will be kept up-to-date and ship when they can.

#### Lump:
##### Hard Rain 2:

- Fixed multiple item spawns from falling into the ground.
- Fixed unreachable pipe_bomb and adrenaline spawn.
- Moved two upgrade spawns over to a new shelf prop so they spawn when transitioning from map 1.

##### Blood Harvest 2:

- Removed shadows from the breakwall prop_dynamic entities.

#### Navmesh:
##### Hard Rain 2:

- Fixed -9999 flow areas.
- Survivor bots can save you in more places.
- Lot of bad connections fixed.
- Lot of merging.

#### Talker:

- Anything for the survivors that uses "then " will now use "then self" instead.
- Swapped Francis' ArriveBoat02 and ArriveBoat03 placements.
- Fixed two of Coach's rules using "IsTalkCoach" twice.
- Many tweaks to rules referring to leaving the starting area.
- Fixed RemarkC13M1DownHereMechanic rule having the wrong name. (Thanks, Haruko)
- Swapped Louis' ArriveChopper line placements.
- Deleted C6M3_ElevatorCancel rules for the L4D2 survivors (they had no real functionality).
- Added IsNotAlone to the C1M1Elevator lines for Coach, Gambler, Mechanic and Producer.
- Added NoOneInSafeSpot to the "outside" vehicle nags.
- Split the vehicle nags for C6M3 for Coach, Gambler and Producer.
- Added NotAloneOutsideSafeSpot to C5M5RunToHeliRareCoach.
- Added the FinalVehicleArrived concept for Dark Carnival and Swamp Fever.
- Updated criteria definitions for IsIncappedStarted and IsIncappedBleeding.
- Added IsNotAlone to the c1m1_enter_elevator concept for Coach, Gambler, Mechanic and Producer.

#### Models:

- Improved collision and usability of the Forklift hittable for Versus Tanks.

#### Materials:

- Reduced the env map intensity on "models/props/cs_militia/refrigerator01.mdl".
- Reduced the env map intensity on pipebomb, hunting rifle, and worn variants.

### Contributors

In alphabetical order by first name:

- Evgeniy Kazakov
- Raymond Nondorf
- Tsuey

Pull requests
-------------

- [#70] Update c12m2_traintunnel lumps (Raymond Nondorf)
- [#71] Updated talker scripts with Xanaguy's changes (Raymond Nondorf)
- [#72] Add missing IntroEnd concepts (Raymond Nondorf)
- [#73] Update c4m2 lump and nav (Raymond Nondorf)
- [#74] Update talker scripts (Raymond Nondorf)
- [#81] Update for RocketDude, Assets, Tools and Readme (Tsuey)

1.1.0 (Sep 24th, 2021)
======================
Summary
-------

- Release candidate
- 5 contributors
- 6 pull requests

### What's new

It is exactly 1 year since L4D2's Last Stand Update was released.

This update is a huge re-organization with modest re-writes and a lot more fixes.

Anyone may test these and report issues. Valve will be kept up-to-date and ship when they can.

Note: Customization scripts [#13](https://github.com/Tsuey/L4D2-Community-Update/issues/13) are pending, but bandaids [SirPlease/L4D2-Competitive-Rework#320](https://github.com/SirPlease/L4D2-Competitive-Rework/pull/320) have been applied with competitive config's simple removal of "anv_versus.nut".

#### Lump:

- Lump edits to account for changed weapon density values.
- c4m2_sugarmill_a and c4m3_sugarmill_b: Added a prop to make it easier for infected bots to navigate.
- c12m2_traintunnel: Added missing breakwall texture to wall in warehouse.
- c12m4_barn: Removed unreachable pill spawn.

#### Navmesh:

- Various nav fixes for -9999 flow areas.
- Better bot nav in various maps (i.e. c1m2 hedges).
- c1m2_streets: Fixed nav areas in order for the warp_to_checkpoint concommand to work properly.
- c1m3_mall: Added c1streets place name to the ceda evac center area.
- Harmless file size optimization and merging.

#### Map fixes:

- c8m3_sewers: Mitigator axiswarp for getting stuck in scissor lift.
- c10m1_caves: Bandaid nav clip fix for stuck SI bot spawns behind tunnel's 2nd barricade.
- c11m4_terminal: Rubble axiswarp with QoL and OoB clips to reduce stuck bot and player Tank spawns.
- c12m3_bridge: Permstuck in tree near shed (for SI / RocketDude).
- c13m2_southpinestream: Fix a regression with easy event skip clip and a permstuck clip nearby.

#### Map Quality-of-Life:

- c8m3_sewers: Fred?!

#### Versus fixes:

- c5m3_cemetery: New ladder in far corner of manhole drop area to fix permstuck.
- c7m2_barge: Delete func clip that blocks SI access into end closet.
- c8m3_sewers: Thicken SI warehouse clip Tanks could potentially spawn behind.
- c12m2_traintunnel: SI permstuck beyond the end of tunnel just before end safe room.

#### Versus Survival (just this mode):

- Thickened 24 clips across 10 maps to eliminate stuck Tank spawns.
- Dramatically reduced stuck Tank spawns on maps...
- c1m2_streets: Delete all func SI clip.
- c3m1_plankcountry: Delete all func SI clip, a TLS clip, added tree axiswarp.
- c5m4_quarter: Delete all func SI clip.
- c8m2_subway: Added visual vending machine step to get back in-bounds.
- c9m2_lots: Delete 1 fence model to direct SI players in-bounds.
- c10m2_drainage: Delete all func SI clip, 1 fence model, and add 3 ladders to assist in-bounds.
- c10m4_mainstreet: Add 2 anti-stuck clips for behind event barricade and far corner.
- c11m2_offices: Delete 1 func SI clip for final street left barricade.
- c12m3_bridge: Delete 1 func SI clip for wrongway at end of train tunnel.
- Made it auto-trigger any outputs on the entity used to start Survival if the pre-round timer expires.

#### L4D1 Co-op:

- Set the cvar z_tank_autoshotgun_dmg_scale 1.

#### L4D1 Survival:

- Set the cvar z_tank_autoshotgun_dmg_scale 1.
- Disabled water slowdown.

#### Taaannnk!! (just this mutation):

- Thickened 24 clips across 10 maps to eliminate stuck Tank spawns.
- Dramatically reduced stuck Tank spawns on maps...
- c1m2_streets: Delete all func SI clip.
- c2m2_fairgrounds: Delete all func SI clip.
- c3m1_plankcountry: Delete all func SI clip, a TLS clip, added tree axiswarp.
- c5m2_park: Clip for Tank stuck spot on start roof.
- c5m4_quarter: Delete all func SI clip.
- c6m1_riverbank: Clip for Tank stuck spot behind start fence.
- c8m1_apartment: Delete 1 func SI clip and add 2 anti-stuck clips.
- c8m2_subway: Add anti-stuck 6 clips for rubble and end area.
- c8m3_sewers: Delete 3 func SI clips and add anti-stuck clip on start rooftops.
- c9m2_lots: Clip for Tank stuck spot far behind start area.
- c10m1_caves: Delete 8 func SI clips and add clip to fix a permstuck deletions caused.
- c10m2_drainage: Delete all func SI clip.
- c10m3_ranchhouse: Delete 2 func SI clip and add 2 anti-stuck clips.
- c10m4_mainstreet: Add 2 anti-stuck clips from Versus Survival and 1 along house row.
- c11m1_greenhouse: Delete 1 func SI clip for fence in end area.
- c11m2_offices: Delete 2 func SI clip for final street and add anti-stuck fence clip.
- c11m3_garage: Clip for Tank stuck spots immediately behind start fence.
- c12m1_hilltop: Add 2 anti-stuck clips to extend 2 wrongway func SI clips.
- c12m2_traintunnel: Clip for Tank stuck spot at end of tunnel.
- c12m3_bridge: Delete 1 func SI clip for wrongway at end of train tunnel.
- c12m4_barn: Clip for Tank stuck spot behind start safe room.
- Players no longer need to wait for incapped Survivors in order to progress at areas like elevators.

#### Death's Door:

- Enabled B&W state when under 25% health.

#### Tank Run:

- The first map of a Campaign will now spawn two Tier 1 weapons near the start area if no other Tier 1's are nearby.
- Made it so Survivors are auto-revived instantly when incapacitated or hanging from a ledge.
- Car alarms will now spawn a Tank if triggered.
- Disabled water slowdown for all maps.
- Set Survivor revive health to 50.

#### Instructor lessons:

- "Tank Claw" hint had incorrect binding "+attack2".
- "Tank Rock" hint had incorrect binding "+attack".
- "Jockey Leap" hint had the incorrect ability_use of "ability_spit", and now uses the correct "ability_leap".

#### Other:

- Added render coloring support to the Hunter, Smoker, Boomer and Charger models.
- Fixed Audio and Keyboard/Mouse menus in the Options flyout having broken navigation keys when trying to use the arrow keys or a controller.
- Gave the knife its old slash pattern back.

#### ShowUpdate():

- Countless fixes and enhancements.
- Added arguments and filters for added control.
- Rotated ladder DebugDrawText now displays properly.
- Added trigger_teleport and trigger_look to potential highlights.
- Full support for commentary, lump and other mod blockers regardless of prefix.
- No more "Accessed null instance" error if array entities are deleted.
- Note: Requires DebugDrawClear(); will always conflict with other scripts that use it.

### Contributors

In alphabetical order by first name:

- Derpduck
- Evgeniy Kazakov
- Raymond Nondorf
- Treescrub
- Tsuey

Pull requests
-------------

- [#23] Split fixes into map specific scripts (Treescrub)
- [#27] Major code update (Evgeniy Kazakov)
- [#34] Changed unsafe EntFire calls to DoEntFire (Treescrub)
- [#61] Updated Various Files (Raymond Nondorf)
- [#65] Removed accidentally restored and obsolete anv_* files (Evgeniy Kazakov)
- [#67] Update z_developer_showupdate (Derpduck)

1.0.1 (Jul 2nd, 2021)
=====================
Summary
-------

- Release candidate
- 1 contributor

### What's new

Long-standing, non-contentious fixes / enhancements are in and code rot cleaned, after 9 months of gradual de-synchronization from the live game. Future releases will ideally include anv_customization.nut so competitive configs no longer need to risk modifying outdated anv_versus.nut.

#### Map fixes:

- c1m3_mall: Block permstuck at alternative path vending machine.
- c2m5_concert: Prevent bass and anvil cases from disappearing.
- c3m1_plankcountry: Patched janky ladder near the event for all modes.
- c3m1_plankcountry: Swamp gator has been given a proper name... and some bite.
- c4m1_milltown_a: Prevent Survivor bots from picking up items inside c4m4's saferoom.
- c5m2_park: Eliminate permstuck spot that a previous ladder patch created.
- c5m4_quarter: Fixed "mins" for a commonhop clip at an electrical box.
- c8m1_apartment: Lift anti-grief kill trigger off ground to prevent an incap glitch.
- c9m1_alleys: Block rare permstuck spot between the boxwreck and traffic light.
- c13m2_southpinestream: Fix permstuck next to military truck leading to barricade.
- c13m3_memorialbridge: Enlargened a permstuck clip to fully fix it.

#### Map Quality-of-Life:

- c1m3_mall: Auto-crouch for starting gate at shoplift scanners.
- c1m4_atrium: Clips for kiosks to assist jumping and booth auto-crouch.
- c9m2_lots: Clip to prevent gascans from falling between finale buses.

#### Versus fixes:

- c1m1_hotel: Move Ghost SI exploit killtrigger down a lot to solve a rare issue.
- c2m1_highway: Add navblocker at fence/car to prevent Tank spawn flow exploit.
- c2m4_barns: Food cart ladder replaced with better clone and smoothed it with a new clip.
- c5m1_waterfront: Improved a clip that blocks getting stuck in skybox.
- c5m2_park: Solidify a prop_static chimney for LOS blocking QoL.
- c8m1_apartment: Add clip to patch a ladder shortcut at the start.
- c11m4_terminal: Fix SI permstuck spot inside the end rubble.
- c12m2_traintunnel: Fix prop from slightly hovering above vent.
- c12m4_barn: Patched fence Infected ladder next to lawnmower room.
- c14m2_lighthouse: Fix displacement crouch to get under finale map.

### Contributors

- Tsuey

1.0.0 (Sep 24th, 2020)
======================
Summary
-------

- Original TLS release
- 2+ contributors

### What's new

LEFT 4 DEAD 2 "LAST STAND" UPDATE
https://store.steampowered.com/oldnews/75849
https://www.l4d.com/laststand/

Steam Workshop Mirror (w/ changelogs/guides):

TLS Community Update Testing Initiative
https://steamcommunity.com/sharedfiles/filedetails/1959405608

TODO...