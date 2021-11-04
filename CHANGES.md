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
- Hard Rain 2 and 3: Added a prop to make it easier for infected bots to navigate.
- Blood Harvest 2: Added missing breakwall texture to wall in warehouse.
- Blood Harvert 4: Removed unreachable pills spawn.

#### Navmesh:

- Various nav fixes for -9999 flow areas.
- Improved and fixed bot nav in various maps<!-- including..-->.
- Harmless file size optimization through merging, deleting and ID compression.
- Dead Center 2: Fixed nav areas in order for the warp_to_checkpoint concommand to work properly.
- Dead Center 3: Added c1streets place name to the ceda evac center area.

##### Cold Stream 2:

- Many new paths up and down the left and right banks from the first tall rock in the middle of the riverbed to just outside the end tunnel.
- Two new paths down the rockfall cliff over the lampposts to the left and right of the janky ladder/ramps.
- New paths along the guardrail to the left of the bus exiting the tunnel and left of the ambulance further ahead.
- Various new paths up tall vehicles like buses, vans and truck, notably onto the side by side buses after the main metal barricade.
- New JUMP path over almost the entire length of the cliff bushes right of the road with connections between large vehicles.
- Fixed infamous Godspot on top of fuel truck.
- New path up the right side of the army truck's hood.
- Added NO_MOBS NOTHREAT to the bus roof's front at the main metal barricade, EMPTY to the bus roof after the ambulance, and EMPTY NO_MOBS to the riverbed just before the bridge.
- New path on top of the main metal barricade that leads to both sides of the cliff bushes and new tricky jump back up it.
- Changed the positions of paths over the roadside fence before the ambulance.
- New path for commons over the metal barricade at the back of the barrels event.
- New path for specials down the cliff above the second humvee at the barrels event.
- New path along the very thin 'outer skirt' of the bridge to the left of the barrels with JUMP paths down from it.

#### Map fixes:

- No Mercy 3: Mitigator axiswarp for getting stuck in scissor lift.
- Death Tool 1: Bandaid nav clip fix for stuck SI bot spawns behind tunnel's 2nd barricade.
- Dead Air 4: Rubble axiswarp with QoL and OoB clips to reduce stuck bot and player Tank spawns.
- Blood Harvest 3: Permstuck in tree near shed (for SI / RocketDude).
- Cold Stream 2: Fix a regression with easy event skip clip and a permstuck clip nearby.

#### Map Quality-of-Life:

- No Mercy 3: Fred?!

#### Versus fixes:

- The Parish 3: New ladder in far corner of manhole drop area to fix permstuck.
- The Sacrifice 2: Delete func clip that blocks SI access into end closet.
- No Mercy 3: Thicken SI warehouse clip Tanks could potentially spawn behind.
- Blood Harvest 2: SI permstuck beyond the end of tunnel just before end safe room.

#### Versus Survival (just this mode):

- Thickened 24 clips across 10 maps to eliminate stuck Tank spawns.
- Dramatically reduced stuck Tank spawns on maps...
- Made it auto-trigger any outputs on the entity used to start Survival if the pre-round timer expires.
- Dead Center 2: Delete all func SI clip.
- Swamp Fever 1: Delete all func SI clip, a TLS clip, added tree axiswarp.
- The Parish 4: Delete all func SI clip.
- No Mercy 2: Added visual vending machine step to get back in-bounds.
- Crash Course 2: Delete 1 fence model to direct SI players in-bounds.
- Death Toll 2: Delete all func SI clip, 1 fence model, and add 3 ladders to assist in-bounds.
- Death Toll 4: Add 2 anti-stuck clips for behind event barricade and far corner.
- Dead Air 2: Delete 1 func SI clip for final street left barricade.
- Blood Harvest 3: Delete 1 func SI clip for wrongway at end of train tunnel.

#### L4D1 Co-op:

- Set the cvar z_tank_autoshotgun_dmg_scale 1.

#### L4D1 Survival:

- Set the cvar z_tank_autoshotgun_dmg_scale 1.
- Disabled water slowdown.

#### Taaannnk!! (just this mutation):

- Thickened 24 clips across 10 maps to eliminate stuck Tank spawns.
- Dramatically reduced stuck Tank spawns on maps...
- Players no longer need to wait for incapped Survivors in order to progress at areas like elevators.
- Dead Center 2: Delete all func SI clip.
- The Passing 1: Clip for Tank stuck spot behind start fence.
- Dark Carnival 2: Delete all func SI clip.
- Swamp Fever 1: Delete all func SI clip, a TLS clip, added tree axiswarp.
- The Parish 2: Clip for Tank stuck spot on start roof.
- The Parish 4: Delete all func SI clip.
- No Mercy 1: Delete 1 func SI clip and add 2 anti-stuck clips.
- No Mercy 2: Add anti-stuck 6 clips for rubble and end area.
- No Mercy 3: Delete 3 func SI clips and add anti-stuck clip on start rooftops.
- Crash Course 2: Clip for Tank stuck spot far behind start area.
- Death Toll 1: Delete 8 func SI clips and add clip to fix a permstuck deletions caused.
- Death Toll 2: Delete all func SI clip.
- Death Toll 3: Delete 2 func SI clip and add 2 anti-stuck clips.
- Death Toll 4: Add 2 anti-stuck clips from Versus Survival and 1 along house row.
- Dead Air 1: Delete 1 func SI clip for fence in end area.
- Dead Air 2: Delete 2 func SI clip for final street and add anti-stuck fence clip.
- Dead Air 3: Clip for Tank stuck spots immediately behind start fence.
- Blood Harvest 1: Add 2 anti-stuck clips to extend 2 wrongway func SI clips.
- Blood Harvest 2: Clip for Tank stuck spot at end of tunnel.
- Blood Harvest 3: Delete 1 func SI clip for wrongway at end of train tunnel.
- Blood Harvest 4: Clip for Tank stuck spot behind start safe room.

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

1.0.1 (Jul 2nd, 2021)
=====================
Summary
-------

- Release candidate
- 1 contributor

### What's new

Long-standing, non-contentious fixes / enhancements are in and code rot cleaned, after 9 months of gradual de-synchronization from the live game. Future releases will ideally include anv_customization.nut so competitive configs no longer need to risk modifying outdated anv_versus.nut.

#### Map fixes:

- Dead Center 3: Block permstuck at alternative path vending machine.
- Dark Carnival 5: Prevent bass and anvil cases from disappearing.
- Swamp Fever 1: Patched janky ladder near the event for all modes.
- Swamp Fever 1: Swamp gator has been given a proper name... and some bite.
- Hard Rain 1: Prevent Survivor bots from picking up items inside Hard Rain 4's saferoom.
- The Parish 2: Eliminate permstuck spot that a previous ladder patch created.
- The Parish 4: Fixed "mins" for a commonhop clip at an electrical box.
- No Mercy 1: Lift anti-grief kill trigger off ground to prevent an incap glitch.
- Crash Course 1: Block rare permstuck spot between the boxwreck and traffic light.
- Cold Stream 2: Fix permstuck next to military truck leading to barricade.
- Cold Stream 3: Enlargened a permstuck clip to fully fix it.

#### Map Quality-of-Life:

- Dead Center 3: Auto-crouch for starting gate at shoplift scanners.
- Dead Center 4: Clips for kiosks to assist jumping and booth auto-crouch.
- Crash Course 2: Clip to prevent gascans from falling between finale buses.

#### Versus fixes:

- Dead Center 1: Move Ghost SI exploit killtrigger down a lot to solve a rare issue.
- Dark Carnival 1: Add navblocker at fence/car to prevent Tank spawn flow exploit.
- Dark Carnival 4: Food cart ladder replaced with better clone and smoothed it with a new clip.
- The Parish 1: Improved a clip that blocks getting stuck in skybox.
- The Parish 2: Solidify a prop_static chimney for LOS blocking QoL.
- No Mercy 1: Add clip to patch a ladder shortcut at the start.
- Dead Air 4: Fix SI permstuck spot inside the end rubble.
- Blood Harvest 2: Fix prop from slightly hovering above vent.
- Blood Harvest 4: Patched fence Infected ladder next to lawnmower room.
- The Last Stand 2: Fix displacement crouch to get under finale map.

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