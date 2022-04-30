# Merged Changelogs from Original 9-24-2020 Launch

Every changelog or reference the Update Team has ever assembled, is forever preserved here!

### Contents

[A :: Major Map and Navmesh Changes for Version 2.2.0.0](#SectionA) ([source](https://hackmd.io/@failzz/rJ5S7EZHw))<br/>
[B :: Valve's Changelog up to Version 2.2.1.3](#SectionB) ([source](https://hackmd.io/@failzz/rkuEds88D))<br/>
[C :: Campaign Mode Clipping Q&A](#SectionC) ([source](https://hackmd.io/@failzz/S1G1ytPOv))<br/>
[D :: Campaign Mode Clipping Analysis](#SectionD) ([source](https://hackmd.io/@failzz/rJfUaHx8w))<br/>
[E :: Valve's C++ Changelog](#SectionE) ([source](https://store.steampowered.com/oldnews/75849))<br/>
[F :: General Modding Changelog](#SectionF) ([source](https://pastebin.com/BfJaf2cG))<br/>
[G :: Survivor Animations Changelog](#SectionG) ([source](https://pastebin.com/dWtYsbE5))<br/>
[H :: Talker Changelog](#SectionH) ([source](https://pastebin.com/QrziQws8))<br/>
[I :: RocketDude Changelog](#SectionI) ([source](https://pastebin.com/JYkK3kVe))<br/>
[J :: MAP FIX CHANGELOG :: VSCRIPT, LUMP FILES & MORE](#SectionJ) ([source](https://pastebin.com/fHeWVG6k))<br/>

--------------------------------
--------------------------------

# SectionA
==[top](#Contents)==

### Major Map and Navmesh Changes for Version 2.2.0.0

## Extra Changelogs
- [**Steam Changelog**](https://store.steampowered.com/news/75849/)
- [**General Changelog**](https://pastebin.com/BfJaf2cG)
- [**Map Fixes &amp; PVP Changelog**](https://pastebin.com/fHeWVG6k)
- [**Talker Changelog**](https://pastebin.com/QrziQws8)
- [**Survivor Animations Changelog**](https://pastebin.com/dWtYsbE5)

---

## General
- Singleplayer mode has been added as an option in the dropdown menu for all co-op gamemodes.
    - Singleplayer icon has been removed from the main menu carousel.
- Vote cooldown has been removed from singleplayer mode.
- Enabled the Private Game option in lobby permissions.
- Realism now has the proper delays between stages on L4D1 finales. 
- Several exploits with the idle mechanic have been fixed.
    - Idling after shooting the grenade launcher will no longer do massive damage to survivors.
    - Idling after being biled on will no longer clear your screen.
    - Idling repeatedly while grabbed by a charger will no longer prevent damage.
- Fixed infinite pistol spawning exploit.
- Fixed a longstanding bug that affected boss spawn rates on several maps.

---

## Weapons &amp; Items
- Two new melee weapons.
    - Pitchfork.
        - Sharp melee weapon.
        - Spawns on Hard Rain, Swamp Fever, Blood Harvest, and The Last Stand.
    - Shovel
        - Blunt melee weapon.
        - Spawns on Death Toll, Blood Harvest, Cold Stream, Swamp Fever, Hard Rain, The Parish, The Passing, The Sacrifice, No Mercy, and The Last Stand. 
- Melee lists has been updated for some campaigns.
    - Dead Center can spawn the golf club.
    - The Sacrifice can spawn the golf club, and tonfa.
    - No Mercy can spawn the tonfa.
    - Crash Course can spawn the frying pan, and tonfa.
    - Death Toll can spawn the fireaxe, and tonfa.
    - Dead Air can spawn the gold club, and tonfa.
    - Blood Harvest can spawn the tonfa.
- CSS weapons will now be available to everyone on all gamemodes.
    - Added cvar `director_cs_weapon_spawn_chance` (default 0.5) to set the chance of each CS weapon getting added to the spawn pool for each spawner. This is to reduce their likelihood in comparison to the standard weapons
        - CSS weapons will only spawn on RNG weapon spawns.
        - CSS snipers will not spawn in finale holdout areas, however they will be able to spawn in the starting saferooms.
    - Scout damage has been increased to 105 (was 90).
    - Knife has been tweaked slightly.
        - Swing speed has been reduced by 10%.
        - Swing hitrays are now a diagonal arc (was a horizontal sweep).
    - The CSS weapons have been re-built right-handed; script files will no longer be required for customizing these weapons
	- Fixed the mp5&#39;s melee shove canceling its reload animation.
	- Added incendiary gunfire audio for CSS weapons
	- Fixed a transition bug that would cause the CSS weapons to freeze after reloading
	- All CSS view models were rebuilt with improved finger orientation and new walk cycles
	- Improved view model meshes with less visible gaps
	- MP5 UI icon was changed to include the stock
	- Restored smooth groups on the view model of the MP5
	- Improved smoothing on the view model of the AWP
	- Fixed inverted vertex normals on the lens of the AWP
	- Fixed the flashlight not following the AWP&#39;s movement
	- Added phong to the view model materials
	- Knife uses frying pan animations for third person attacks
	- Reverted the Scout&#39;s gunfire audio back to the original CSS track
	- The AWP properly emits a muzzle flash when firing
	- Fixed a visual error where the SG552 appeared briefly unusable after reloading
	- Re-enabled mipmaps on view model textures
	- Re-enabled shell eject particles on view models
- Tier 1 shotgun reserve ammo has been increased to 72 (was 56).
- Tonfa swing hitrays are now a horizontal sweep (was a diagonal arc).
- Added individualized UI icons for all weapons and items; script files are no longer required for making custom hud icons
- New UI icons for the pistols, representing the models added in L4D2
- Higher quality view models for L4D1 weapons
- Higher quality view models for Desert Rifle, Grenade Launcher and M60.
- All view model sequences transition in and out of idle state with improved animation blending.
- Added new brass eject particles for pistols, smg&#39;s, desert eagle, rifles, AK &amp; M60.
- Fixed scripting error where the silenced smg used the wrong particle in 3rd person.
- Fixed a particle error where the silenced smg fell back to one of the regular smg&#39;s particles.
- Higher quality textures for L4D1 weapons and items.
- Added normal and exponent map for guitar.
- Restored missing flashlight wire on military sniper.
- Restored text on the side of the spas shotgun.
- Optimized world models by removing several unused and useless dmx bones and hitboxes.
- Weighted the magazines and pumps to move in all weapon world models.
- Flipped the scope on the hunting rifle&#39;s world model to face the correct direction.
- Added item pickup animations for Pistols, Dual Pistols and Desert Eagle.
- All weapon view models emit muzzle smoke from the correct position.
- Added jiggle bones to several view models &amp; world models.
    - Strap on the Silenced SMG.
    - Sling chain on the SMG.
    - Sling chain on the hunting rifle.
    - Flashlight wires on the SCAR and military sniper.
    - Stock and chain on the Spas shotgun.
    - Sling chain on the M16, a la L4D1 beta.
    - Sling chains on the grenade launcher.
    - Forward sight on the grenade launcher.
    - Straps and zippers on the medkit.
    - Starter cord on the chainsaw.
    - Molotov&#39;s cloth strap (world model).
    - Pipebomb&#39;s fuse (world model).
    - All jigglebones on the world models use LoD&#39;s to deactivate after a certain range.
- Added walking cycles and vertical posing for the pistols, Desert Eagle and defib.
- Rebuilt the Fireaxe &amp; Machete animations to no longer obscure the camera when playing at a higher Field of View.
- Moved origin positions of several view models farther from the camera, more centered and more consistant.
    - Desert Eagle
    - Hunting Rifle
    - AK
    - Rifle
    - Desert Rifle
    - Military Sniper
    - SMG
    - Silenced SMG
    - M60
    - Spas shotgun
    - Fireaxe
    - Machete
- Added 1st person arm support to Gnome &amp; Cola carryables.
- Fixed the M16, AK47 and SCAR not playing audio of operating their bolts when deployed.
- Fixed an error where the M16 played the AK47&#39;s foley deploy audio.
- Fixed visual clipping with the Desert Eagle&#39;s reloading, where the magazine could be seeing going through the grip.
- Fixed an error where the world model of the Desert Eagle and single-wielded pistol would not eject shell cases.
- Fixed incorrect positioning of muzzle and flashlight attachments on the Desert Eagle&#39;s world &amp; view models.
- Improved the Desert Eagle&#39;s view model mesh to display double-sided along the slide.
- Fixed the spas shotgun and military sniper&#39;s bolts going out-of-bounds during run animation.
- Fixed incorrect angle of shell eject attachment on M60 world model.
- The Desert Eagle uses the correct reload audio instead of the pistol&#39;s.
- Fixed incorrect positioning with the Military Sniper&#39;s bolt in the deploy and walk animations.
- Removed muzzle light from the Silenced SMG.
- Fixed incorrect positioning with the Spas shotgun&#39;s bolt in the walk animation.
- Fixed incorrect UV baking on parts of the Spas&#39;s inner layers, which would show a shell inside foregrip.
- Fixed the bolt of the SCAR going through the receiver during animation.
- Uzi SMG&#39;s bolt no longer moves when firing.
- Silenced SMG&#39;s bolt was rebuilt to move more correctly to the weapon&#39;s nature (opposite direction).
- Removed unweighted extra shell seen inside the view model of the Auto-shotgun during reloading.
- Fixed unnatural wrist twisting on the hunting rifle&#39;s vertical posing.
- Fixed arm twitching in the hunting rifle&#39;s idle loop cycle.
- Slowed down the rate at which the Minigun visually heats up.
- Fixed a visual error with the chains on the chainsaw during attack loop animation.
- Melee animation on single pistol and desert eagle was adjusted with less frames and a more streamlined motion.
- The magazines no longer clip with the weapon when the SCAR and M16 are reloading.
- Fixed the hunting rifle&#39;s bolt not moving with the weapon on the walk animation.
- Fixed various UV inaccuracies on the M60&#39;s view and world models.
- Increased frames-per-second of M60&#39;s fire sequence from 30 to 40 for a smoother display of the ammo belt&#39;s animation.
- Fixed unnatural twisting on the left hand of the machete animations.
- Removed blur particle from the machete and frying pan&#39;s shove attack.
- Fixed z-fighting textures on SCAR&#39;s view model trigger guard.
- Added animation to the shell doors on the Automatic shotguns.
    - Added double-sided faces to the inside of the mesh behind the shell door on the auto shotgun.
- Cleaned the ambient bake and UV of the AK47 base texture to correctly showcase the entire magazine.
- Added rotation dampening to the physics of the golfclub world model.
- Assigned new surfaceprop settings to various weapon world models, with new unique sounds.
- Fixed inconsistant camera angles on adrenaline animations.
- Pump shotguns, molotov, SG552 and Scout use more accurate collision models.
- Corrected a syntax error in electric_guitar.txt; &#34;player_activity_idle&#34; under &#34;secondaryattacks&#34; was written as &#34;ACT_SHOOT_SECONDARY_GUITARq&#34;; corrected to spell &#34;ACT_SHOOT_SECONDARY_GUITAR&#34;

---

## Audio
- Added individualized audio files and game sounds for silenced SMG, chrome shotgun, Spas shotgun, M60 and cricket bat
- Added individualized deploy audio for the MP5, Scout and SG552 and all melee weapons
- Waterfront sound script was modified to feature a full music set.
- Fixed &#34;npc.Biker_IncapacitatedInitial01&#34; playing the wrong sound (played &#34;No1.wav&#34; instead of &#34;IncapacitatedInitial01.wav&#34;)
- Fixed and restored broken sound &#34;Player.Biker_No01&#34;
- Restored missing &#34;Player.Biker_ArriveGeneric01&#34; game sound for Francis
- Restored missing &#34;Player.Biker_ReviveCriticalFriend01&#34; game sound for Francis
- Restored missing &#34;Player.Manager_Reloading01&#34; game sound for Louis
- Restored missing &#34;Player.TeenGirl_Hurrah23&#34; game sound for Zoey
- Fixed an oversight where &#34;Player.NamVet_ReactionPositive06&#34; had a volume level of 0 (now 0.6)
- Channel of &#34;PainPills.Use&#34; was changed from &#34;CHAN_BODY&#34; to &#34;CHAN_ITEM&#34; to prevent interruption from footstep audio
- Volume of &#34;AK47.FireIncendiary&#34; was lowered from 1.0 to 0.7, to match volume level of &#34;AK47.Fire&#34;
- Volume of &#34;Pistol.Fire&#34; was raised from 0.65 to 0.75, to match volume level of &#34;DualPistol.Fire&#34;
- Volume of &#34;Shotgun.Fire&#34; was raised from 0.7 to 1.0 to match volume level of Shotgun.FireIncendiary &amp; Shotgun_Chrome.Fire
- Pumpshotgun and Autoshotgun randomize between both loadshell sounds
- Fixed bad syntax in soundlevel of &#34;Achievement.Earned&#34; (Set &#34;SNDLVL_94dB&#34; instead of &#34;94&#34;)
- Fixed bad syntax in soundlevel of &#34;Minigun.SpinUp&#34;, &#34;Minigun.Fire&#34; &amp; &#34;Minigun.SpinDown&#34; (Set &#34;SNDLVL_94dB&#34; instead of &#34;94&#34;)
- All gunfire audio use a random pitch (97%-103%)
- Added unused hordeslayer tracks for L4D1 campaigns
- Added unused horde tracks for L4D1 campaigns
- Flashlight audio was split into two separate files for being switched on and off
- Changed channel on ChargerZombie.Charge from CHAN_VOICE to CHAN_STATIC, to prevent the charger&#39;s warcry from being interrupted by pain audio
- Added 4 lines for Francis from custom L4D1 maps (Dead Before Dawn, Night Terror, Last Drop) and created scenes, facial animations, soundscript entries &amp; subtitles for each
- Added missing fall04 WAVs for biker, manager and teengirl (currently they are copies of fallshort01, fallshort02 and fallshort02, respectively)
- Biker ReactionStartled03 &#34;Woah! Jesus...&#34; - raised volume on &#34;Jesus&#34;
- Changed channel on &#34;Inferno.StartSweeten&#34; from CHAN_WEAPON to CHAN_STATIC so it would play alongside &#34;Inferno.Start&#34; when a Molotov or gas can explodes, instead of overriding it
- Raised volume on Mob Signal music cues in L4D1 campaigns to be closer to how they were in L4D1
- Altered Waterfront music set to try splitting the difference with intentionally music-free custom campaigns; Replaced intro music with checkpoint intro cue, lowered loop volume
- Fixed a bug where L4D1&#39;s version of the leftfordeath music would cut short when mode of spectation was changed

---

## Survivors
- Fixed L4D1 survivors not selecting their canonical preferred weapons when scavenging.
- Allow survivors to pick up ammo while fighting a tank or in close combat if they are less than 40% full.
- Bots will use pills only if health &lt; 50 (was 60)
- Bots consider health to be critical at &lt; 30 (was 40). This means real health must be &lt; 5 before a bot will use first-aid over a full temp health buffer

---

## Infected
- L4D1 campaigns will now use the L4D1 models for the infected.
- Police infected will now drop their tonfa when they die.
- Burnt shaders have been added for all special infected.
- Fixed an animation bug where the Witch was damaging incapacitated survivors at an inconsistent rate, doing less damage than intended.
- Enabled `z_boomer_gibs` by default for all gamemodes.
- Bosses will no longer spawn inside end saferooms.
- Chargers will no longer stumble if they charge while already in contact with a survivor.

---

## Versus Changes
- Infected spawn timers now range from 20 seconds. (Previously ranged from 20-30)
- Jockey leap recharge time after incapping a survivor reduced from 30 to 25 seconds.
- Jockey ride damage reworked from 4 every 1 second, to 2 every 0.5 seconds. (Same damage per second)
- Reduced duration of bile jar effect on player controlled infected from 20 to 15 seconds.
- Reduced fire damage vs tank from 80 damage / second to 66 damage / second.
- Tank initial frustration &#34;grace period&#34; increased from 10 to 15 seconds.
- Removed tank spawn variation between teams.
- Tank chance changed to 100% on Hard Rain 4.
- Added 40% chance for tank to spawn on No Mercy 4.
- Added 20% chance for witches to spawn on No Mercy and Death Toll finales.
- CEDA zombies and Fallen Survivors no longer drop items in versus.
- 800+ new infected ladders, infected clip reworking to open many areas, and much more viewable with the ShowUpdate method posted above.

---

## Campaign Changes

:::info
The changes below apply to *both* campaign mode and versus mode. However, versus mode has a lot of extra changes which you will have to check the PVP changelog to see. They are simply too extensive to list here. Thank you!
:::

:::info
I would personally suggest to look at the new clipping changes with these new script functions:
`script ShowUpdate()` `script HideUpdate()`
In order to use these you must be running the game in developer mode. 
Add `-dev` to your launch options for L4D2.
:::

### Dead Center
#### **Map 1:**
- **Clipping:**
    - Survivors can no longer hang on the roof in order to get ontop of the hotel.
    - Survivors can no longer jump over a barricade of furniture that is on fire.
- **Navmesh:**
    - Fixed infected pathing ontop the overhang. [**Image**](https://i.imgur.com/ta7wanV.jpg)
    - Fixed infected pathing on AC units at the start of the level. [**Image**](https://i.imgur.com/stmcp15.jpg)

#### **Map 2:**
- **General:**
    - Whitaker has some shorter voicelines that will result in the gunstore door opening quicker.
- **Clipping:** 
    - Infected clipping to allow infected to get behind the CEDA trailer.
    - Survivors can no longer boost OOB near the long walkway before the Gunstore.
    - Survivors can no longer boost OOB at the Cola store.
    - QOL clips have been added to the curbs in the parking area by the Cola store.
    - Survivors can no longer boost OOB or back inbounds at the end of the level.
- **Navmesh:**
    - Fixed infected pathing onto the hood of the white truck. [**Image**](https://i.imgur.com/7cV1BhW.jpg)
    - Fixed infected pathing onto the white van. [**Image**](https://i.imgur.com/aYLoANj.jpg)
    - Fixed infected pathing behind the CEDA trailer. [**Image**](https://i.imgur.com/PXhjgRw.jpg)
    - Fixed infected pathing ontop the concrete ledge. [**Image**](https://i.imgur.com/CgstRib.jpg)
    - Fixed infected pathing ontop shelving in the cola store. [**Image**](https://imgur.com/a/dW3Y8o4)
    - Fixed infected pathing by the tree. [**Image**](https://i.imgur.com/SkIQ0Wp.jpg)
    - Fixed infected pathing ontop the evac sign. [**Image**](https://i.imgur.com/dxAvCqZ.jpg)
    - Fixed infected pathing ontop the bush. [**Image**](https://i.imgur.com/3Rrc1kP.jpg)

#### **Map 3:**
- **Clipping:**
    - Survivors can no longer commonjump OOB to the third floor of the map room.
    - Survivors can no longer boost up OOB through any of the four skylights.
- **Navmesh:**
    - Fixed infected pathing ontop of various shelves throughout the level. [**Image**](https://imgur.com/a/INr4Yvn)
    - Fixed infected pathing ontop of various kiosks throughout the level. [**Image**](https://imgur.com/a/J0InCEN)
    - Fixed infected pathing by the plants. [**Image**](https://i.imgur.com/lTyGdK9.jpg)
    - Fixed infected pathing ontop the tents. [**Image**](https://i.imgur.com/ADpU0DA.jpg)
    - Fixed infected pathing ontop various potted plants. [**Image**](https://imgur.com/a/hQTLQGs)

#### **Map 4:**
- **General:**
    - Survivors can no longer break the finale by incapping someone in the saferoom and then going down the elevator.
- **Clipping:**
    - Survivors can no longer boost to the top floor of the atrium before the elevator.
    - Survivors can no longer boost onto either of the balconies above the third floor.
    - Survivors can no longer jump onto a a thin ledge where infected cannot reach them.
    - Survivors can no longer boost onto the store signs.
    - Survivors can no longer boost onto a wooden wall that acts as a godspot.
- **Navmesh:**
    - Fixed infected pathing ontop the kiosks. [**Image**](https://i.imgur.com/fCdnUhq.jpg)
    - Fixed infected pathing ontop the scaffold. [**Image**](https://i.imgur.com/QboW9Bu.jpg)
    - Fixed infected pathing ontop a table. [**Image**](https://i.imgur.com/ZwAx6By.jpg)

---

### Dark Carnival
#### **Map 1:**
- **Clipping:**
    - Permanent stuckspot behind a fence at the start has been fixed.
    - Survivors can no longer boost ontop of several clips along the highway to get OOB.
    - Players can no longer crouch-clip to get through the displacements at the bottom of the hill.
    - Permanent stuckspots in three tree clusters by the roadside have been fixed.
    - Permanent stuckspot behind a barricade at the end has been fixed.
    - Survivors can no longer boost OOB at the end of the level.
- **Navmesh:**
    - Fixed infected pathing ontop the rocks. [**Image**](https://i.imgur.com/0TolMWD.jpg)
    - Fixed infected pathing ontop the bus and fence. [**Image**](https://i.imgur.com/aj53eJ8.jpg)
    - Fixed infected pathing ontop the van and truck. [**Image**](https://i.imgur.com/CtYFMUd.jpg)


#### **Map 2:**
- **Clipping:**
    - Survivors can no longer parkour to get ontop of the first warehouse.
    - Survivors can no longer boost through a gap in the clipping in order to get OOB near the first warehouse.
    - Survivors can no longer get onto the lower roof of the warehouse by the first forklift hittable.
    - Survivors can no longer jump onto an exit sign inside the first warehouse.
    - Survivors can no longer boost into or ontop of the building with the train ride.
    - QOL clip added to the entire ground in the fairgrounds area to ensure props do not fall through the ground.
    - Survivors can no longer boost over a white fence after the alley area to get OOB.
    - QOL clip added to the angled portion of the rooftop after going up the ladder to ensure chargers do not get stopped.
    - Survivors can no longer boost over the left side of the carousel event.
    - Survivors can no longer go far OOB by boosting ontop of any the buildings at the end of the level.
- **Navmesh:**
    - Fixed infected pathing ontop the small roof. [**Image**](https://i.imgur.com/Xz9LrHZ.jpg)
    - Fixed infected pathing ontop the hotdog stands. [**Image**](https://imgur.com/a/NfpzQm6)
    - Fixed infected pathing ontop the tents. [**Image**](https://i.imgur.com/yrRVDmE.jpg)
    - Fixed infected pathing ontop the gift shops. [**Image**](https://i.imgur.com/X6LY8Q4.jpg)
    - Fixed infected pathing on various shelves inside the warehouse. [**Image**](https://imgur.com/a/4W8kxdW)
    - Fixed infected pathing ontop the hedge. [**Image**](https://i.imgur.com/Go38PdK.jpg)

#### **Map 3:**
- **General**
    - QOL duck trigger added to the vent before the swan room.
- **Clipping:**
    - Permanent stuckspot in the swan room has been fixed.
    - Survivors can no longer do a stuckwarp on the stair railing in the swan room.
    - Survivors can no longer jump ontop of a fire extinguisher.
    - Survivors can no longer get into the four vents by the one way drop.
    - A new prop has been added to the one way drop to prevent survivors from standing on a small ledge inside the hole.
    - Survivors can no longer stand on the electrical box below the alternate one way drop behind the breakable wall.
    - Survivors can no longer boost ontop of a cargo container.
    - Survivors can no longer get stuck behind two gates that block where the roller coaster comes from.
    - Survivors can no longer climb up the coaster ride to skip starting the event.
    - Survivors can no longer skip the majority of the event by getting onto the railing and dropping to the latter half of the coaster tracks (4 new clips).
    - Survivors can no longer skip the coaster event by boosting through a gap in the clipping.
    - Survivors can no longer boost onto a bush that was not clipped before.
    - Survivors can no longer stand on the support beams to do common jumps at the end of the event.
    - Survivors can no longer do a jump from the support beam to get back onto the track at the end of the event.
    - Survivors can no longer jump down to the bushes OOB to skip going through the coaster tunnel section.
    - Survivors can no longer boost ontop of the roof of the coaster tunnel.
    - Survivors can no longer boost ontop of the roof of the building at the end of the event.
    - Survivors can no longer boost ontop of the roof of the walkway at the end of the event.
- **Navmesh:**
    - Fixed infected pathing in the ventalation shaft. [**Image**](https://imgur.com/a/goguR4I)
    - Fixed infected pathing on the rooftop. [**Image**](https://i.imgur.com/PhOiJbf.jpg)
    - Fixed infected pathing ontop the chainlink gate. [**Image**](https://i.imgur.com/JdM70aI.jpg)

#### **Map 4:**
- **General:**
    - There is now a trigger that will prevent commons from spawning in the saferoom at the end of the gauntlet event.
- **Clipping:**
    - Survivors can no longer boost ontop of an electrical box.
    - Survivors can no longer boost ontop of any of the lights.
    - Survivors can no longer jump or boost to the wooden beams inside the barn.
    - Survivors can no longer boost onto an awning by the event.
    - Survivors can no longer boost ontop of the clipping for the tents by the event.
    - Survivors can no longer do a jump onto a fence to backtrack to the entrance of the barn.
- **Navmesh:**
    - Fixed infected pathing ontop the hotdog stands. [**Image**](https://imgur.com/a/vCVgO0O)
    - Fixed infected pathing ontop the starting saferoom roof. [**Image**](https://i.imgur.com/xsJfFgs.jpg)
    - Fixed infected pathing ontop the scaffold by the event. [**Image**](https://i.imgur.com/bmBwucf.jpg)
    - Fixed infected pathing ontop the roof outside the end saferoom. [**Image**](https://i.imgur.com/O6U2ime.jpg)
    - Fixed infected pathing behind the bushes. [**Image**](https://i.imgur.com/lLTHMoN.jpg)
    - Fixed infected pathing ontop the overhang roof by the bumper cars. [**Image**](https://i.imgur.com/s9JkluI.jpg)
    - Fixed infected pathing ontop the tents outside the end saferoom. [**Image**](https://i.imgur.com/9ga0XZ1.jpg)

#### **Map 5:**
- **General:**
    - Survivors can no longer skip the helicopter flyover by standing in the end trigger.
    - Reanimated the helicopter in the finale of Dark Carnival to properly fly over the buildings added post-release.
    - Survivors will no longer be kicked from the server on carnival finale if they are incapped before getting out to the holdout area when the finale begins.
- **Clipping:**
    - Survivors can no longer jump over the barricade outside the saferoom where they will be permanently stuck.
    - Survivors can no longer boost onto the lighting trusses attached to the roof overhang.
    - Survivors can no longer boost into a window to get inside a OOB room.
    - Survivors can no longer boost OOB over the green fences on either side of the stadium.
    - Survivors can no longer boost ontop of the speakers or the roof above the stage area.
    - Survivors can no longer boost ontop of the lights above the stage area.
    - Survivors can no longer boost ontop the concert poster at the back of the stage area.
    - Survivors can no longer stand ontop of a thin ledge along a fence on the left side of the stadium (looking out from the stage).
    - Replace commentary blocker preventing survivors from getting ontop some boards that were a godspot.
    - New props by the right side helicopter landing (looking out from the stage) to prevent players from getting stuck.
- **Navmesh:**
    - Fixed infected pathing onto the rolled up metal door. [**Image**](https://i.imgur.com/zXT2TiS.jpg)
    - Fixed infected pathing ontop the vending machines. [**Image**](https://imgur.com/a/IE850SN)
    - Fixed infected pathing ontop the railing. [**Image**](https://i.imgur.com/StqIcgd.jpg)
    - Fixed infected pathing inside the second floor rooms. [**Image**](https://i.imgur.com/RYfUHzh.jpg)

---

### Swamp Fever
#### **Map 1:**
- **General:**
    - Survivors will no longer be invincible during the ferry event due to a bug.
    - Survivors will now be able to see an alligator in the water.
- **Clipping:**
    - Survivors can no longer jump onto the crashed traincar near the start.
    - Survivors can no longer boost onto the house behind the gas station to get OOB. Fixes gaps in old clipping.
    - Permanent stuckspot behind the first gas tank has been fixed.
    - Survivors can no longer get onto the Jones hop roof.
    - Survivors can no longer boost onto a powerline.
    - Survivors can no longer get ontop the white trailer.
    - Survivors can no longer get ontop the second gas tank.
    - Survivors can no longer boost into the tree by the ferry event.
    - Survivors can no longer jump onto a bush in the far corner of the map that could be used to get OOB.
    - Survivors can no longer boost onto the roof of the walkway.
- **Navmesh:**
    - Fixed infected pathing inside the house attic. 
    - Fixed infected pathing ontop the convenience store. 
    - Fixed infected pathing on the small ledge in the water beside the dock.
    - Fixed infected pathing ontop the traincar.
    - Fixed infected pathing behind the gas tank and RV.
    - Fixed infected pathing ontop various roofs.
    - Fixed survivor pathing exploit to teleport out of bounds.

#### **Map 2:**
- **Clipping:**
    - QOL clip added to prevent players from getting stuck on the boat at the start.
- **Navmesh:**
    - Fixed infected pathing on the fallen tree.
    - Fixed infected pathing ontop the shanty house roof.
    - Fixed infected pathing ontop the burned down house.

#### **Map 3:**
- **Clipping:**
    - Survivors can no longer get permanently stuck behind the fence beside the white trailer.
    - QOL clips added to prevent players from getting stuck on the deck of the house by the white trailer.
    - Permanent stuckspot behind a fridge has been fixed.
- **Navmesh:**
    - Fixed infected pathing ontop various shanty house roofs.
    - Fixed infected pathing onto the balcony of the house.
    - Fixed infected pathing onto the wooden supports of the house.
    - Fixed infected pathing ontop various rocks.
    - Fixed infected pathing ontop the end saferoom roof.
    - Fixed survivor pathing exploit to teleport through a clip to skip the panic event.

#### **Map 4:**
- **Clipping:**
    - Permanent stuckspot behind a tarp covering ghost boxes has been fixed.
    - Survivors can no longer boost ontop of the plantation.
    - Survivors can no longer get under the map by defibbing a player behind a bush.
    - Survivors can no longer boost or jump back into the area before entering the holdout area.
    - Survivors can no longer boost ontop any of the trees in the holdout area.
    - Survivors can no longer get onto parts of the scaffold in the holdout area.
- **Navmesh:**
    - Fixed infected not being able to path back to the start from the holdout area.
    - Fixed infected pathing ontop the chimneys on the plantation.
    - Fixed infected pathing ontop various hedges.
    - Fixed infected pathing in the attic of the plantation.
    - Fixed infected pathing ontop the scaffold.
    - Fixed infected pathing ontop the piled up furniture.

---

### Hard Rain
#### **Map 1:**
- **General:**
    - QOL duck trigger has been added to the playground area.
    - QOL duck trigger has been added to the first green house. In the area with the hanging plants.
    - QOL duck trigger has been added to the second green house. In the area with the hanging plants.
- **Clipping:**
    - Survivors can no longer boost over a clip for a green fence at the start. Valve clipping has been extended.
    - Survivors can no longer boost ontop of the Burger Tank sign.
    - Survivors can no longer boost ontop of a clip above one of the starting buildings. Fixes a gap in clipping.
    - Survivors can no longer get ontop of the generator at the start.
    - Survivors can no longer boost ontop the powerline.
    - QOL clip added to all the windows in the Burger Tank to prevent survivors getting stuck on the window frame.
    - Survivors can no longer get ontop of the gas sign.
    - Survivors can no longer boost onto the sign with the blue frame.
    - Survivors can no longer boost onto the clips for the green fencing. Valve clipping has been extended.
    - Survivors can no longer boost ontop the safehouse building at the end.
    - Survivors can no longer jump onto plywood covering an end saferoom window.

#### **Map 2:**
- **Clipping:**
    - Permanent stuckspot behind a bush at the start has been fixed.
    - Survivors can no longer boost onto the fence beside the road closed sign at the start.
    - Survivors can no longer commonjump onto the Ducatel roof.
    - Survivors can no longer jump onto an unclipped ledge by the ventalation shaft to get ontop of the Ducatel roof.
    - Survivors can no longer boost onto the roof of the side room in the first mill building.
    - The roof of the first mill building with the silos has been clipped.
    - Survivors can no longer boost OOB over the green fence by the dual silos in order to skip going through the second mill building.
    - Several permanent stuckspots behind some tanks in the mill area have been fixed.
    - QOL clips on some of the rubble in the mill area to ensure survivors do not get stuck on it.
    - Survivors can no longer boost OOB over the chainlink fence by the one way drop.
    - Permanent stuckspot behind the silos at the one way drop has been fixed.
    - The roof of the second mill building has been clipped.
    - QOL clip to prevent survivors from getting stuck on an infected ladder by a small office in the second mill building.
    - Survivors can no longer boost onto a tree cluster after the second mill building. Valve clipping has been extended.
    - Survivors can no longer boost ontop of the clipping above the thimble stack. Valve clipping has been extended.
    - Survivors can no longer boost onto of the roof of the garage with the semi trailer.
    - Survivors can no longer boost ontop of the generator by the small office. Valve clipping has been extended.
    - Survivors can no longer get ontop of the clipping above the Ducatel Sugar Co building.
    - Survivors can no longer climb up some of the rubble walls in the Ducatel Sugar Co building.
    - Survivors can no longer skip the elevator by jumping around the elevator shaft and landing on the metal supports.
    - Survivors can no longer get ontop of the roof of the large building to the side of the sugar cane field.
    - Survivors can no longer boost ontop of the roof of the gas station. This does not include the building.
- **Kill Trigger:**
    - Survivors can no longer skip the elevator event by dropping down the side of the Ducatel Sugar Co building and fall canceling.

#### **Map 3:**
- **Clipping:**
    - All clipping from map 2 is also on map 3.
    - Survivors can no longer walk around the edge of the corner on the Ducatel Sugar Co building to get to a spot infected cannot reach.

#### **Map 4:**
- **General:**
    - All QOL duck triggers from map 1 are also on map 4.
- **Clipping:**
    - All clipping from map 1 is also on map 4 where applicable.
    - Permanent stuckspot in a tree by the end saferoom has been fixed.

#### **Map 5:**
- **Clipping:**
    - All clipping from map 1 is also on map 5 where applicable.
    - Permanent stuckspot in a tree by the starting saferoom has been fixed.
    - Survivors can no longer boost or jump back out of the holdout area once the finale is started.
    - QOL clip added to the dock area to ensure chargers do not get stopped.

---

### The Parish
#### **Map 1:**
- **Clipping:**
    - QOL clip on the starting ramp to prevent players from getting stuck.
    - Survivors can no longer hang on either of the two barricades by the start of the level.
    - Survivors can no longer climb an electrical box in the small alley on the first street.
    - Survivors can no longer get onto any of the balconies of the buildings on the first street.
    - Survivors can no longer get ontop of the lambs by the Bienville building.
    - Survivors can no longer get ontop of the porta-potty
    - Survivors can no longer get onto the balconies at the end of the alleyway.
    - Survivors can no longer boost ontop the white concrete building by the fire barrel.
    - Survviors can no longer go far OOB behind the kitchen building.
    - Survivors can no longer boost ontop of the green awning.

#### **Map 2:**
- **Clipping:**
    - Survivors can no longer boost ontop of the archway at the park exit.
    - Survivors can no longer get ontop the fire escape on the dark red building by the highway overpass.
    - Survivors can no longer do a stuckwarp along the highway overpass along the hillside.
    - Survivors can no longer boost up into a gap in clipping to potentially skip the CEDA trailer event.
    - Survivors can no longer boost onto the concrete wall between the two highway overpasses.
    - Survivors can no longer boost to the highest point of the scaffold watchtower.
    - Survivors can no longer boost ontop of the sign of the bus depot.
    - Survivors can no longer get ontop of an electrical box in the bus parking area.
    - Permanent stuckspot behind the concrete barricades in the bus parking area has been fixed.

#### **Map 3:**
- **Clipping:**
    - Survivors can no longer boost ontop the concrete wall beside the overpass at the start.
    - Survivors can no longer boost onto the roof of the two story pink house.
    - Survivors can no longer go to the far back of the roof of the one story house behind the first white trailer.
    - Survivors can no longer do a stuckwarp at the wooden staircase.
    - Survivors can no longer parkour to the highest corner of the burnt down house.
    - Survivors can no longer commonjump onto the roof of the half burnt house by the third white trailer.
    - Permanent stuckspot between the two green fences has been fixed.
    - Survivors can no longer boost OOB over the chainlink fence by the manhole.
    - Survivors can no longer boost into any of the holes in the sewer section.
    - Survivors can no longer do a jump to get OOB onto the overpass. By the stairway leading to the overpass with the ambulance.
    - Permanent stuckspot between the semitruck and car on the overpass has been fixed.
    - Permanent stuckspot in the cemetery behind one of the metal fences has been fixed.
    - Survivors can no longer boost into a tree in the far corner of the cemetery.
    - Survivors can no longer boost onto one of the open crypts.
    - Survivors can no longer boost over a green fence near the end of the level in order to get OOB.

#### **Map 4:**
- **Clipping:**
    - Survivors can no longer boost ontop the balconies above the starting saferoom
    - Survivors can no longer commonjump ontop the fountain.
    - Survivors can no longer boost over the barricades at the one end of the first street to get OOB.
    - Survivors can no longer get onto any of the balconies on the first street.
    - Survivors can no longer commonjump from the green bench on the first street to get OOB.
    - Survivors can no longer boost over a metal fence in a small alley on the first street to get OOB.
    - Survivors can no longer boost onto the clipping above the garage on the first street to get OOB.
    - Survivors can no longer boost onto the clipping above the bus at the one end of the first street to get OOB.
    - Survivors can no longer boost onto the roof above the rollup door in the alleyway area.
    - Survivors can no longer boost onto the clipping above the metal fence at the end of the alleyway area.
    - Survivors can no longer boost onto a balcony in the horde event area.
    - Survivors can no longer boost onto the clipping above the lower roof in the small alleyway after the event area.
    - Survivors can no longer boost over the barricades at either ends of the second street to get OOB.
    - Survivors can no longer get onto any of the balconies on the second street.
    - Survivors can no longer boost onto a white house near the end of the level.
    - Survivors can no longer boost over the barricades near the end of the level to get OOB.
    - Survivors can no longer boost over the chainlink fence near the end saferoom to get OOB.

#### **Map 5:**
- **Clipping:** 
    - Survivors can no longer boost ontop of the bridge to skip starting the finale.
    - Permanent stuckspot behind the concrete barricades at the start has been fixed.
    - Survivors can no longer fall onto the concrete bridge supports.
    - Survivors can no longer do a crouch hop skip off a slanted metal support on the top area of the bridge.
    - Survivors can no longer climb up the girders at the end of the bridge to get to to top area.
    - Permanent stuckspot on the semitruck on the slanted section of the bridge has been fixed.
    - QOL clip on some of the rubble at the end of the bridge to prevent players from getting stuck.
    - Survivors can no longer walk all the way to the end of the top area of the bridge.
    - Survivors can no longer commonjump over some barricades to get OOB at the end of the bridge.
    - Survivors can no longer boost onto of any of the street lights at the exit to the bridge.
    - Survivors can no longer boost onto any of the generators near the exit to the bridge or helicopter.
    - Survivors can no longer boost onto the highway sign at the exit to the bridge.
    - Survivors can no longer boost onto a tree near the CEDA trailer at the end of the level.
    - Survivors can no longer boost onto a rollup door near the CEDA trailer at the end of the level.
    - Survivors can no longer boost onto an AC unit near the CEDA trailer at the end of the level.
    - QOL clip on the one ramp leading to the helipad to prevent players from getting stuck.

---

### The Passing
- **Map 1:**
    - **General:**
        - Windows have been added to Jimmy Gibbs car with a prop.
    - **Clipping:**
        - Permanent stuckspot in the tree by the start has been fixed.
        - Survivors can no longer walk along the ledge or fence at the start.
        - Survivors can no longer boost onto the Historic Rayford building.
        - Survivors can no longer get permanently stuck behind the barricades near the start.
        - Survivors can no longer boost over the metal fence to get OOB near the start.
        - Survivors can no longer boost into the windows of the apartment building near the start.
        - Survivors can no longer jump around the bush to get OOB near the parking lot area.
        - Survivors can no longer get onto the green awning by the souvenir shop.
        - Players can no longer crouch-clip to get through a displacement near a white van.
        - Survivors can no longer get permanently stuck behind the barricades by a bus.
        - Players can no longer crouch-clip to get through a displacement by the entrance to the apartment area.
        - Survivors can no longer jump into some windows along the balcony area where infected cannot reach them. Props have been added to indicate you cannot go here.
        - Survivors can no longer jump around or boost over some barricades to get into an OOB balcony area.
        - Survivors can no longer boost onto the gazebo.
        - Survivors can no longer boost onto the clipping above some bushes by the gazebo.
        - Survivors can no longer boost over some barricades to get OOB by the gazebo.
        - Survivors can no longer boost into any of the windows of the apartment buildings near the end saferoom.
        - Survivors can no longer boost onto the roof of the end saferoom building.
        - Survivors can no longer boost over a metal fence beside the end saferoom.
        - Survivors can no longer boost over some barricades to get OOB at the end of the road by the end saferoom.
- **Map 2:**
    - **General:**
        - QOL duck trigger added to the window to enter the pool hall.
        - QOL duck trigger added to one of the pipes in the contruction site area.
        - Ladder added to the front loader in the construction site.
    - **Clipping:**
        - QOL clip added to the stairs at the start to make them smoother.
        - Survivors can no longer get permanently stuck behind the metal fence near the start.
        - Survivors can no longer boost onto some of the balconies down the first street.
        - Survivors can no longer boost into the windows of the liquor store.
        - Permanent stuckspot by the porta-potty in the contruction site has been fixed. Prop added to indicate this.
        - Survivors can no longer boost onto the roof of the Electrical Wholesale building by the contruction area.
        - Survivors can no longer boost onto some of the balconies in the construction area.
        - Survivors can no longer boost or hang to get onto the roof of the Red Flight bar.
        - QOL clip added to the fire escape stairs at the Red Flight bar to make them smoother.
        - Survivors can no longer get onto two electrical boxes in the alley beside the Red Flight bar.
        - Survivors can no longer boost  onto the fire escape in the alley beside the Red Flight bar.
        - Survivors can no longer boost onto the AC unit in the alley beside the Red Flight bar.
        - Survivors can no longer get onto the green awning outside the apartments by the two way street area.
        - Survivors can no longer boost onto the balcony by the Jazz bar.
- **Map 3:**
    - **Clipping:**
        - Survivors can no longer boost onto an AC unit near the starting saferoom.
        - Survivors can no longer boost onto of any of the generators.
        - Survivors can no longer boost onto a shelf in the elevator room.
        - Survivors can no longer boost onto the draw bridge from inbounds.
        - Survivors can no longer boost onto any of the electrical poles.

---

### The Sacrifice
- **Map 1:**
    - **General:**
        - Survivors can no longer force the traincar tank to suicide by breaking the pathing.
    - **Clipping:**
        - Survivors can no longer jump onto the sunken boat.
        - Survivors can no longer boost onto the end of broken bridge.
        - Survivors can no longer boost onto a tree at the traincar event.
        - Survivors can no longer boost onto a pipe attached to the brick building at the traincar event.
        - Survivors can no longer skip the traincar event by boosting onto a clip above the chainlink fence.
        - Survivors can no longer boost OOB through a gap in the clipping by the crashed traincars.
        - Survivors can no longer get into the vents in the brick factory.
        - Survivors can no longer boost up into the windows by the endsaferoom.
- **Map 2:**
    - **Clipping:**
        - Survivors can no longer boost OOB over some brick stacks at the start.
        - Survivors can no longer boost into a non-solid window on the brick building at the start.
        - Permanent stuckspot by a green semitruck near the mechanic shop has been fixed.
        - Players can no longer stuckwarp from a spot under the overpass.
        - Survivors can no longer get onto the awning of the brick building by the cement trucks.
        - Survivors can no longer get onto the lower roof of the brick building by the cement trucks.
        - Survivors can no longer get onto the window of the brick building by the cement trucks.
        - Survivors can no longer boost onto the dual silos in the cement factory area.
        - Survivors can no longer get onto the back wall where the cement trucks are parked.
        - Survivors can no longer get onto a ledge by the fencing near the cargo containers.
        - Survivors can no longer boost onto the AC unit by the gravel pile.
        - Survivors can no longer stand on a weird collision spot on the coal barge.
        - Survivors can no longer boost to a AC unit above the water at the end of the level.
- **Map 3:**
    - **General:**
        - QOL LOS blocker added to a piece of plywood by the bridge.
    - **Clipping:**
        - Survivors can no longer boost onto any of the rooftops at the start.
        - Survivors can no longer boost OOB over the semitruck at the start.
        - Survivors can no longer boost onto any of the powerlines.
        - Survivors can no longer boost onto any of the generators.
        - Survivors can no longer boost onto a shelf in the elevator room.
        - Survivors can no longer boost OOB out of the windows in the elevator room.
        - Survivors can no longer boost or commonjump onto the bridge from inbounds.
        - QOL clip added to the sidewalk by the bridge to make it smoother.
        - Survivors can no longer get onto the jukebox.
        - Survivors can no longer boost onto the roof with the burger tank billboard.
        - Survivors can no longer boost onto the cooling tanks beside the interior generator.
        - Survivors can no longer get onto the tent in the picnic table area.
        - Survivors can no longer boost over a metal fence by the scaffold.

---

### No Mercy
- **Map 1:**
    - **General:**
        - Fixed a bug where the survivors could fire their weapon before the end of the intro cinematic in No Mercy.
    - **Clipping:**
        - Survivors can no longer boost onto any of the rooftops surrounding the apartment building.
        - Survivors can no longer boost over a clip above the broken fire escape to get OOB.
        - Survivors can no longer get onto any of the electrical boxes (3) in the alley section.
        - Survivors can no longer boost over a clip above the van in the alley section.
        - Survivors can no longer boost over the clip above the metal barricades by the police car.
        - Survivors can no longer boost over some wooden fences to get OOB where infected cannot reach them.
        - Survivors can no longer boost into the windows by the crashed semitruck.
        - Survivors can no longer boost onto the lower roof by the Simon Dairy building.
        - Survivors can no longer boost OOB by the building rubble.
        - Survivors can no longer get onto the subway roof.
        - QOL clip added to prevent players getting stuck on the window frames by the subway stairs.
        - Survivors can no longer boost over the clip above the chainlink fence behind the subway stairs.
    - **Kill Triggers:**
        - Survivors can no longer go down into the OOB streets area below the starting apartment roof.
- **Map 2:**
    - **Clipping:**
        - Players can no longer do a stuckwarp on a piece of rubble below the saferoom.
        - Players can no longer do a stuckwarp at the end of the tunnel below the saferoom.
        - Players can no longer crouch-clip through the displacement in the small cave in the subway.
        - Survivors can no longer get onto the two trains.
        - Permanent stuckspot in the piping room has been fixed.
        - Players can no longer do a stuckwarp in the room with the concrete pillars.
        - Survivors can no longer boost onto the L shape pipes by the generator room.
        - Survivors can no longer boost onto the metal support beams on the ceiling by the generator room.
        - QOL clip added to make some of the railings smoother in the generator room.
        - Survivors can no longer boost over the clip above a chainlink fence.
        - Survivors can no longer boost over the clip above the crashed semitruck.
        - Survivors can no longer boost onto the buildings or over clips to get OOB on the left side of the street.
        - Survivors can no longer boost onto some of the rooftops on the rightside of the street.
        - Survivors can no longer get into several OOB areas in the alleys where infected would not be able to reach them.
- **Map 3:**
    - **General:**
        - Survivors can no longer break the metal door with the grenade launcher idle exploit.
        - QOL duck trigger for a vent in the warehouse.
    - **Clipping:**
        - Survivors can no longer reach unattackable areas by boosting onto any of the rooftops at the start.
        - Survivors can no longer get onto the gas station roof. Clip will be removed if the gas station is shot.
        - Survivors can no longer boost onto the roof of the warehouse.
        - QOL clip added to prevent players getting stuck on the windows for the garage.
        - QOL clip added to prevent players from getting stuck on the ladder attached to the scissor lift.
        - Survivors can no longer boost into a ceiling vent in the warehouse.
        - Survivors can no longer reach unattackable areas by boosting onto some of the rooftops at the end of the level.
        - Survivors can no longer boost onto a fire escape at the end of the level.
- **Map 4:**
    - **General:**
        - Survivors will no longer fall through the elevator. Survivors will not be able to warp up to the roof with an idle exploit.
    - **Clipping:**
        - Survivors can no longer jump up onto some windows in the lobby area.
        - Survivors can no longer boost through the skylights.
        - Permanent stuckspot by a chair has been fixed.
        - Survivors can no longer jump onto the elevator button.
        - Clip has been added to solidify the elevator counterweight.
- **Map 5:**
    - **General:**
        - Players can now climb the ladder in the saferoom.
    - **Clipping:**
        - QOL clips have been added to all the edges of the rooftop to ensure chargers will not get stopped by the edge.

---

### Crash Course
- **Map 1**
    - **Clipping:**
        - Survivors can no longer boost into the windows by the elevated parking area at the start.
        - Players can no longer climb up the shelving in the middle of the first warehouse.
        - Survivors can no longer boost onto the rooftops of the garage outside the first warehouse.
        - Survivors can no longer commonjump over a white truck to get OOB.
        - Permanent stuckspots in two tree clusters by the crashed semitruck have been fixed.
        - Survivors can no longer jump around a white truck to get OOB.
        - Survivors can no longer boost to a OOB area behind a warehouse.
        - Survivors can no longer boost into an OOB room inside a brick apartment building.
        - Permanent stuckspots in two tree clusters by the howitzer have been fixed.
        - Survivors can no longer boost onto any of the streetlamps by the howitzer.
        - Survivors can no longer boost onto the crashed train by the howitzer.
        - Survivors can no longer boost onto the AC unit by the howitzer.
        - Survivors can no longer boost onto any of the signs attached to the empty building by the howitzer.
        - Survivors can no longer jump around the semitruck near the end of the level.
        - Players can no longer walk through the metal supports of an AC unit near the end of the level.
- **Map 2:**
    - **General:**
        - QOL duck trigger added to to a opening to the roof in the holdout area.
    - **Clipping:**
        - Permanent stuckspot in a tree cluster by the start has been fixed.
        - Survivors can no longer boost onto the rooftop with the billboard.
        - Survivors can no longer boost onto the first train tracks.
        - Survivors can no longer stand on the ledge above the double doors beside a semitruck.
        - Survivors can no longer boost over a chainlink fence to get OOB.
        - Permanent stuckspots in five tree clusters in the truck loading area have been fixed.
        - Survivors can no longer jump into a window from one of the cargo containers.
        - Survivors can no longer boost onto the second train tracks.
        - Survivors can no longer boost over a chainlink fence near the holdout area to get OOB.
        - Permanent stuckspot in a tree cluster beside the holdout area has been fixed.
        - Survivors can no longer boost or jump back out of the holdout area once the finale is started.
        - Survivors can no longer boost onto any of the metal roll up doors in the holdout area.
        - Survivors can no longer boost into the windows of the brick building in the holdout area.
        - Survivors can no longer boost onto a pipe in the holdout area.
        - Survivors can no longer boost onto an electrical box in the holdout area.
        - Survivors can no longer boost onto the truck lift in the holdout area.
        - Survivors can no longer boost onto the shelves in the holdout area.

---

### Death Toll
- **Map 1**
    - **Clipping:**
        - Players can no longer crouch-clip through the displacements of the cliff near the start.
        - Players can no longer crouch-clip through the displacements of the cliffs in the valley area.
        - Survivors can no longer boost up to some sections of the cliffs on the left side of the valley.
        - Survivors can no longer do a jump to get onto the cliffs on the left side of the valley.
        - Survivors can no longer boost up to some sections of the cliffs on the right side of the valley.
        - Survivors can no longer boost above the archway at the start of the tunnel.
        - Survivors can no longer crouch-clip through the displacements at the end of the level.
- **Map 2:**
    - **Clipping:**
        - Survivors can no longer get onto an electrical box at the start.
        - Survivors can no longer boost up the hole in the tunnel by the start.
        - Survivors can no longer boost onto any of the pipes in the cistern area.
        - Survivors can no longer boost into the tunnels in the cistern area.
        - Survivors can no longer boost up into the OOB area above the cistern area.
        - QOL clips added to make the angled sides of a tunnel smoother.
        - Survivors can no longer boost to the sewer tunnel at the end of the upward ramp.
        - Survivors can no longer get onto the piping below the stairs in the event room.
        - QOL clip added to the grate flooring to make it smoother.
        - Survivors can no longer boost up into the sewer tunnels in the event area.
        - Survivors can no longer boost into the the windows of the sewer building.
        - Survivors can no longer boost onto any of the rooftops at the end of the level.
        - Survivors can no longer do a jump to get into the large window at the end of the level.
        - Survivors can no longer boost onto the end saferoom traincar.
- **Map 3:**
    - **Clipping:**
        - Survivors can no longer boost onto the rooftop of the saferoom building at the start.
        - Survivors can no longer commonjump onto the watch tower in the train yard.
        - Survivors can no longer boost onto the roof of the brick building at the far end of the train yard.
        - Survivors can no longer boost onto the train station rooftop.
        - Survivors can no longer boost over the fence behind the train station.
        - Survivors can no longer walk all the way down the barbed wire fence by the train cars.
        - Players can no longer crouch-clip through the displacements by the train tunnel.
        - Survivor clip added to the cliff above the train tunnel.
        - Survivors can no longer boost over the chainlink fence down the dirt road.
        - Survivors can no longer boost onto the cliff by the house.
        - Permanent stuckspots in the rock clusters by the crashed bus have been fixed.
        - Survivors can no longer boost over the roadblock before the church.
        - Survivors can no longer boost onto the clipping above the concrete walls surrounding the church graveyard.
        - Survivors can no longer boost onto the clipping above the church.
- **Map 4:**
    - **General Changes:**
        - There is now a trigger that will prevent commons from spawning in the saferoom at the end of the gauntlet event.
    - **Clipping:**
        - Survivors can no longer boost onto the church roof.
        - Players can no longer crouch-clip through the cliffside at the start of the level.
        - Survivors can no longer boost through five gaps in the clipping by the houses.
        - Survivors can no longer boost through a gap in the clipping by the florist store.
        - Survivors can no longer boost onto a balcony outside the florist store to skip the event.
        - Survivors can no longer boost onto the green awning at the end of the first street.
        - Survivors can no longer boost onto an electrical box at the end of the first street.
        - Survivors can no longer boost onto a small balcony or through the windows to a building at the end of the first street.
        - Survivors can no longer boost into the large windows of the bank building.
- **Map 5:**
    - **General Changes:**
        - Secret prop added somewhere on the map. :eyes:
    - **Clipping:**
        - Survivors can no longer boost onto the rooftops of any of the buildings at the start.
        - Survivors can no longer boost over the barricades at either end of the street at the start.
        - Survivors can no longer boost over the two-story houses at the start.
        - Survivors can no longer boost onto some rocks along the cliff in the holdout area.
        - Permanent stuckspot by the large rock in the corner of the holdout area fixed.
        - QOL clips added to all the rail posts to the balcony of the main house in the holdout area.
         - Survivors can no longer run back to the start of the level once the finale is started. Props added to indicate this.

---

### Dead Air
- **Map 1:**
    - **Clipping:**
        - Survivors can no longer commnjump onto the greenhouse roof.
        - Survivors can no longer drop down to the streets by the docks.
        - Survivors can no longer drop down to the street leading to the end of the level where there should be a kill trigger.
        - Survivors can no longer boost to a fire escape.
        - Survivors can no longer walk around the ledge of the building after climbing the ladder.
        - Survivors can no longer drop down to the alley behind the building with the ladder.
        - Survivor clip added to prevent hanging off an electrical box by the one way drop.
        - Survivors can no longer boost to the second floor hallway above the end saferoom.
    - **Kill Triggers:**
        - Kill trigger added to the side of the streets by the docks.
- **Map 2:**
    - **General Changes:**
        - Van prop added to hide a wrong way sign.
    - **Clipping:**
        - Survivors can no longer stand on a ledge of the crane where infected cannot reach.
        - Survivors can no longer go far OOB on the streets below the crane event.
        - Permanent stuckspot by a chair in the offices has been fixed.
    - **Kill Triggers:**
        - Kill trigger added to a semitruck to prevent survivors from dropping OOB.
        - Survivors can no longer skip going through the offices by dropping down to the street and fall canceling.
- **Map 3:**
    - **Clipping:**
        - Survivors can no longer boost onto several rooftops in the construction site area.
        - Survivors can no longer skip the fire barricade by boosting ontop of one of the buildings in the construction site.
        - Survivors can no longer jump into one of the window openings in the construction site where infected cannot reach. Prop added to indicate this.
        - Survivors can no longer boost into three windows above a side room in the electric plant.
        - Permanent stuckspot by a gas tank in the electric plant has been fixed.
        - Survivors can no longer boost into the two windows with the fire in the electric plant.
        - Permanent stuckspot by some tanks inside the electric plant building has been fixed.
        - Survivors can no longer boost through a gap in the clipping by the crashed plane near the parking garage.
- **Map 4:**
    - **General Changes:** 
        - There is now a trigger that will prevent commons from spawning in the saferoom at the end of the gauntlet event.
        - Prop added to hide a nodraw wall that is inbounds.
    - **Clipping:**
        - QOL clip added to prevent players from getting stuck on a corner where the wall sticks out in the hallway.
        - QOL clip added to a pile of bodies by some chairs to make them smoother.
        - Survivors can no longer boost up the hole in the ceiling before the stairs.
        - Survivors can no longer boost through the skylight.
        - Survivors can no longer boost onto any of the hanging banners by the van event.
        - Survivors can no longer boost onto the pipes that are infected ladders by the van event.
        - Survivors can no longer boost onto a destroyed concrete support sticking out of the wall by the van event.
        - Survivors can no longer boost into a vent by the van event.
        - Survivors can no longer boost into the vents in the conveyor belt area.
        - Survivors can no longer boost through the hole in the ceiling by the Atlas statue.
- **Map 5:**
    - **General Changes:**
        - Terry has been added in the plane.
    - **Clipping:** 
        - Survivors can no longer boost onto the skybridge on the finale.
        - Survivors can no longer stand in a small area behind the fire barricade.
        - QOL clip added to a crashed plane tail wing that had no collision.

---

### Blood Harvest
- **Map 1:**
    - **Clipping:**
        - Survivors can no longer boost OOB to the left of the wooden bridge.
        - Survivors can no longer do a jump around the ledge of the chainlink fence to get OOB.
        - Survivors can no longer jump onto the metal support beams for the quarry.
        - Survivors can no longer boost onto a exhaust pipe on the quarry building.
    - **Kill Triggers:**
        - Kill trigger added to some of the large valley areas near the bridge.
        - Kill trigger added to a chainlink fence survivors could drop on.
        - Kill trigger added to an area by the quarry building.
- **Map 2:**
    - **General Changes:**
        - QOL duck trigger added to a vent.
    - **Clipping:**
        - Survivors can no longer jump onto two lights after the emergency door event.
        - Survivors can no longer boost OOB in the traincar loading area.
        - Players can no longer stuckwarp from ontop of one of the crashed traincars.
        - QOL clip added to the rubble by the end of the level to make it smoother.
- **Map 3:**
    - **General Changes:**
        - There is now a trigger that will prevent commons from spawning in the saferoom at the end of the gauntlet event.
    - **Clipping:**
        - Players can no longer crouch-clip through a displacement along the hillside near the start.
        - Players can no longer stuckwarp on some rubble at the end of a hallway.
        - Players can no longer crouch-clip through the displacements along the cliffs at the train station.
        - Permanent stuckspot in a tree cluster by the traincar event has been fixed.
        - Survivors can no longer boost onto a section of the wooden bridge.
        - Survivors can no longer skip the traincar event by doing a jump off the wooden bridge supports.
        - Permanent stuckspot in the rocks near the end saferoom has been fixed.
- **Map 4:**
    - **General Changes:**
        - Survivors can no longer skip the bridge event by jumping over the chainlink fence. The event will still be triggered.
        - There is now a trigger that will prevent commons from spawning in the saferoom at the end of the gauntlet event.
        - Chimney on the small house has been solidified with a prop.
    - **Clipping:**
        - Survivors can no longer do a jump around the fencing by the drop to get OOB.
        - Players can no longer crouch-clip through the displacements along the cliffside.
        - Permanent stuckspot in a tree cluster behind the warehouse building has been fixed.
        - Survivors can no longer commonjump onto a low roof of the warehouse building.
        - Permanent stuckspot in a tree by the small house has been fixed.
        - Permanent stuckspot in a tree cluster by the cliffside has been fixed.
        - Survivors can no longer do a jump around the clipping by the end saferoom to get OOB.
- **Map 5:**
    - **Clipping:**
        - Players can no longer crouch-clip through the displacements along the cliffs at the start.
        - Permanent stuckspots in four trees by the start have been fixed.
        - Survivors can no longer boost or jump back out of the holdout area once the finale is started.
        - Survivors can no longer do an up-warp onto a clip to get back to the starting area.
        - Permanent stuckspot in four tree clusters in the holdout area have been fixed.
        - Survivors can no longer boost onto the metal roof covering the haybales.
        - Survivors can no longer get punched onto the barns roof from a tank.
        - Survivors can no longer boost onto the roof of the main house.
        - Survivors can no longer boost onto the dual silos.
        - Players can no longer stand on the stair railing inside the main house.
        - Survivors can no longer stand on the invisible blockers near where the rescue vehicle comes from.
        - Survivors can no longer get under the map by boosting OOB.

---

### Cold Stream
- **Map 1:**
    - **Clipping:**
        - Players can no longer crouch-clip through the displacement of the cliffside at the start.
        - Players can no longer crouch-clip through the displacement of the small cliff by the watch tower.
- **Map 2:**
    - **General Changes:**
        - There is now a trigger that will prevent commons from spawning in the saferoom at the end of the gauntlet event.
    - **Clipping:**
        - Players can no longer crouch-clip through a displacement on the cliffside near the tank fight.
        - QOL clip added so players do not fall into a part of the ground that is lower than it should be.
        - Permanent stuckspot in a tree cluster by the street tunnel has been fixed.
        - Players can no longer stuckwarp from ontop the yellow barrels inside the maintenance closet on the street.
        - Permanent stuckspot by the crashed helicopter has been fixed.
        - Permanent stuckspots along the hedge by the cliffside have been fixed.
        - Permanent stuckspots in four tree clusters after the one way drop have been fixed.
        - Players can no longer crouch-clip through a displacement by the tent.
        - Permanent stuckspot in a tree cluster by the tent has been fixed.
- **Map 3:**
    - **Clipping:**
        - Permanent stuckspots in four tree clusters by the start have been fixed.
        - Survivors can no longer boost OOB over the hedges by the start.
        - Survivors can no longer jump onto the clipping along the side of the bridge.
        - Survivors can no longer do a hang fall cancel on the side of the bridge to fall onto a clip.
        - Survivors can no longer jump over the tanker truck before it explodes.
        - Survivors can no longer jump onto a dumpster in the junkyard area.
    - **Kill Triggers:**
        - Survivors can no longer drop off the bridge and survive with by using various exploits.
- **Map 4:**
    - **Clipping:**
        - Survivors can no longer boost over the chainlink fence to skip starting the finale.
        - Survivors can no longer boost onto the building to skip starting the finale.
        - Survivors can no longer boost through a gap in the clipping to get onto the cliffside OOB.
        - Players can no longer crouch-clip through two displacements near the first one way drop.
        - Survivors can no longer crouch-clip through various displacements along the first section of the stream.
        - Players can no longer crouch-clip through the displacement under the waterfall at the second one way drop.
        - Permanent stuckspot in a tree cluster before the tunnel has been fixed.
        - Survivors can no longer boost through a gap in clipping above the manhole.
        - Permanent stuckspot behind some metal barricades near the end has been fixed.

# SectionB
==[top](#Contents)==

### Valve's Changelog up to Version 2.2.1.3

Bug Fixes
- Fixed file path for CricketBat.Miss sound event.
- Fixed muzzle flash occurring if you melee immediately after shooting.
- Fixed a crash on zero-byte VPKs.
- Fixed a startup crash on Linux.
- Fixed some memory leaks in VGUI.
- Fixed text corruption when using emojis in player names or text.
- Fixed some text corruption related to UTF-8 conversion in some instances on Linux.
- Fixed some out-of-bounds reads with weapon indices.
- Fixed fps_max being reset when loading a new map.
- Fixed custom maps with no lights disabling lighting for the rest of the play session (mat_fullbright).
- Fixed addon info being truncated much earlier on Linux.
- Fixed selecting certain audio/video options via navigation via arrow keys or controller.
- Fixed Widowed (No Border) option on Linux.
- Fixed a crash if a script call to QueueSpeak() didn&#39;t pass any modifiers.
- Fixed a possible crash if a script-defined forbidden target is destroyed.
- Rebuilt gas can physics to fix an issue with falling through the world.
- Fixed an issue in Rocket Dude with a player getting moved to spectator after a level transition.
- Fixed two malformed player clips in c4m1 and c4m5.
- Fixed some incorrect place names in Cold Stream nav.
- Restored some missing commentary entities in c5m5.

Features and Updates
- Added a Vulkan render backend (currently accessible through the -vulkan command line parameter).
- Better support for ultrawide monitors in the UI and game (requires Vulkan if using Linux)
- Marked the game as DPI-aware for high DPI displays.
- Improved default settings for window size and type.
- Improved full-screen quad rendering performance.
- Made captions anti-aliased
- Marked fps_max and viewmodel_fov as FCVAR_RELEASE.
- Cvars &#39;survivor_incap_health&#39; and &#39;survivor_incap_decay_rate&#39; can now be changed after startup.
- New cvar &#39;charger_pz_claw_damage&#39;; functions the same as equivalent melee cvars for other specials.
- New archived cvar &#34;addons_hide_conflict_dialog&#34; suppresses the warning dialog in the addons screen. Any conflicting addons will still be highlighted in red with conflicts printed to the console.
- Added an FOV slider to the Multiplayer settings.
- Added a +bench_demo [name] &lt;stats output&gt;  command line parameter which will run a demo, and quit after it is finished.
- Added a -bench_settings [name] command line parameter to load a cfg/video_bench_{name}.txt file containing settings to load. There are a set of defaults provided, very_high_4k, very_high, high, medium and low.
- Lobbies that connect via a forced server IP are not considered for &#34;Official Only&#34; Quick Match searches.
- Overhauled UI usability on controller
- Added controller button icons across the UI.
- Made confirmation prompts accessible on controller.
- Now able to select mutations on controller.
- Now able to fully manage lobbys on controller.
- Now able to manage addons on controller.
- Now able to browse achievement details on controller.
- The game instructor (in-game hints) now shows controller buttons and hints.
- Added a flashlight binding to the default controller config.
- Made the intro video skippable by any button on a Steam Controller.

New Scripting Hooks


## 2.2.1.2
- Quick Match option for all modes allows players to prefer &#34;Official Servers Only&#34; or &#34;Any Servers&#34; 
- Added localized UI and subtitles for Vietnamese
- Increased string commands per second limit to fix some false disconnects 
- Prevent manually initiating some talker responses that trigger longer conversations 
- Fixed color correction for some maps where it was missing or incorrect 
- Fixed melee animation while carrying a fireworks crate 
- Fixed M60 not using the correct walk calm animation 
- MP5 changed to the slightly better rifle reload animation 
- SG552 changed to use assault rifle animations and military sniper zoom animations 
- Fixed incorrect sound cue for player infected when a survivor dies 
- Changed some mob onslaughts to classic panic events in the L4D mutation 
- Boomer bile slows tanks in Tank Run mutation 
- Several Rocket Dude mutation fixes and performance improvements 
- New survivor alert response rules for intense combat situations 
- Scripting: 
    - Fire the &#34;KilledZombie&#34; response concept when killing a Witch. 
    - New &#34;EntityOutputs&#34; class containing functions to manipulate entity output connections. 
        - GetNumElements, GetOutputTable, HasOutput, HasAction, AddOutput, RemoveOutput 
    - Expanded response rules testbed.

## 2.2.1.1
- Fixed survival stats getting reported during demo playback 
- Fixed response rules &#34;campaign&#34; criteria not recognizing DLC campaigns 
- Enabled stats reporting for CS weapons 
- Fixed some caption colors 
- Updated Spanish translations 
- Fixed talker typo 
- Script Functions: 
    - &#34;ForceVersusStart&#34; to force start the versus round. 
    - &#34;ForceSurvivalStart&#34; to force start the survival round. 
    - &#34;ForceScavengeStart&#34; to force start the scavenge round. 
    - &#34;QueueSpeak&#34; (hEntity, szConcept, flDelay, szCriteria) to queue a speech concept 
    - &#34;RushVictim&#34; (hVictim, flRange ) to force all common zombies in range to rush the victim. If hVictim isn&#39;t set, a random survivor will be chosen.

## 2.2.0.9
- Script: 
    - Global: &#34;LocalTime&#34; Fills out a table with the local time 
    - Player: &#34;IsSuppressingFallingDamage&#34; returns true if falling damage is currently suppressed for the player 
    - Run optional script &#34;response_testbed_addon.nut&#34; for all active addons 
    - Don&#39;t report addon file collisions for &#34;sound.cache&#34; 
- Other: 
    - Fixed talker typos 
    - Minor fixes to RocketDude and Taaaank! Mutations 
    - Enabled game stats reporting for DLC content 
    - Removed a legacy vpk loading path that allowed malformed vpks to crash the game.

## 2.2.0.8
- Script additions: 
    - Added &#34;Inflictor&#34; field to damage table for &#34;AllowTakeDamage&#34; 
    - Director function &#34;WarpAllSurvivorsToCheckpoint&#34; 
    - Director function &#34;WarpAllSurvivorsToBattlefield&#34; 
    - Director function &#34;WarpAllSurvivorsToFinale&#34; 
- Other: 
    - Updated RocketDude mutation to version 1.7.
    - Fixed some typos in talker scripts. 

## 2.2.0.7
- Honorary achievement for Gnome Chompski&#39;s upcoming journey into space on Rocket Lab&#39;s &#34;Return To Sender&#34; mission.

## 2.2.0.6
- Fixed a regression that caused map exploit fixes to appear in co-op modes again. 

## 2.2.0.4
### Patch 1
- Fixed a crash when decoding bones. 
- Fixed a mesh error when drawing the crosshair with colorblind mode active. 
- Fixed a double-add of the client shadow manager restore function. 
- Fixed mode-only addons sometimes getting removed on map load. 
- Fixed some military sniper activity names. 
- Changed crowbar and pitchfork to slash damage only. 
- &#34;AllowFallenSurvivorItem&#34; can be called outside of mutations. 
- Talker and survival updates.
---
### Patch 2
- Fixed The Last Stand&#39;s Village Scavenge map not having any weapons. 
- Recompiled common infected materials to fix visual errors on Linux. 
- Removed alarm glass from a non-alarm car. 
- Fixed Special Infected being able to trigger the helicopter flyover when leaving the bumper car building on Dark Carnival Barns. 
- c7m1 and c12m5: Fixed a few nav issues that caused tanks to get stuck. 
- c1m1: Marked all areas outside of building on ground as not allowing any spawns. 
- c11m5: Marked a few areas near the plane crash fire as no-threat to prevent tanks from spawning too close to the fire. 

## 2.2.0.3
### Patch 1
- Fixed &#34;New Haircut&#34; achievement to not allow club-type melee weapons. 
- Additional prevention of getting disconnected when spamming the scroll wheel. 
- In Survival mode, if a special infected reports as stuck for more than two minutes it will suicide. 
- Compiled captions and subtitles from dlc1. 
- Fixed a couple instances where tank could spawn outside the warp check zone (but was intended to be warped) 
- Added nav in ground in outer areas so that throwing a bile out there doesn&#39;t cause infected to just stand around. 
- Blood Harvest 2 Warehouse Survival: shortened a nav blocker next to some stairs. 
- Check for Realism in addition to Coop base mode for all exploit fixes to prevent some shortcut fixes from spawning in Realism Coop. 
- Moved 64 exploit blocks to Versus-only, most notably Dark Carnival 3 Coaster, Parish 5 Bridge and Dead Air 2 Crane. 
- Rocket Dude: 
    - removed PlayerUnderWater() 
    - added Speedrunner stats ( local use only ) 
    - improved script performance 
    - fixed script enabling glows for projectiles on multiple ticks 
    - removed obsolete code precaching an early dev model 
- Tank Run: 
    - During the finale, the double-Tank spawns are now set to 40 seconds instead of the normal 20 second timer. 
- Versus: 
    - Increased max ghost spawn timers to 24 seconds. 
    - Fixed witches time to kill on incapacitated survivors being faster than intended - it should now take the same time as pre-update. 
- Survival: 
    - Cane Field: 
        - Moved the ammo pile on the roof slightly. 
    - Float: 
        - Removed the ammo pile inside the house at the bottom of the stairs. 
    - Generator Room: 
        - Fixed ZombieDiscardRange not working properly. 
    - Crash Course Bridge: 
        - Marked nav areas behind a fence as NO MOBS. 
    - Gun Store: 
        - Clipped exploit area above barricades where infected wouldn&#39;t path to the Survivors. 
    - Cold Stream Junkyard: 
        - Removed alarmed car that&#39;s out-of-map. 
    - Terminal: 
        - Fixed ZombieSpawnRange not working properly. 
    - Waterfront: 
        - Blocked additional nav areas in an alley to prevent the Tank from getting stuck. 
- Versus Survival:
    - The train door will now automatically open when the countdown timer reaches 0 on Train Car. 
- c1m1: 
    - Fixed issue where survivor bots refused to path through the kitchen fire area. 
- c1m3: 
    - Moved an exposed stairwell hurt trigger down inside a vending machine to stop it from killing players. 
- c2m2: 
    - Fixed a forklift being breakable by survivors 
- c3m3: 
    - Slightly adjusted an infected ladder to improve usability 
- c4m1 + c4m4: 
    - Blocked survivor access to a rooftop next to the playground commonly used to grief 
    - Added a ladder from map 2/3 for consistency between maps and to help players who fall off the safe room roof 
- c5m2: 
    - Added an infected ladder to get out of a stuck spot 
    - Added a hittable dumpster behind the bathrooms in the park 
    - Replaced a prop ladder on top of the bus station with an infected ladder 
-  c5m3:
    - Replaced a prop ladder with an infected ladder (behind the fence immediately after survivors drop towards the cemetery) 
    - Added an extra ladder to the above mentioned fence 
-  c7m1: 
    - Fixed grenade launcher spawns having an incorrect count. 
-  c8m1: 
    - Added a clip to prevent players movement being obstructed by a ladder near the car alarm 
-  c11m1: 
    - Added wrong way signs above the greenhouse safe room 
-  Last Stand: 
    - Fixed rescue closet spawns in the Junkyard so Survivors don&#39;t get stuck in the floor or wall.
---
### Patch 2
- Last Stand:
    - Fixed ammo pile in Junkyard not spawning on second round of Versus.
    - Fixed exploit where the trigger used to quiet the Director could be activated after the finale started. 
- Survival: 
    - Fixed an issue where Fallen Survivors could still drop medkits on Riverbank. 
    - Fixed issue where several weapon spawners would absorb dropped weapons on Barge. 
- Tank Run:
    - Fixed an issue in Scavenge finales that prevented the escape vehicle from working. 
    - The Sacrifice finale will now spawn Tanks properly and the bridge will lower when the timer reaches 0. 
- RocketDude:
    - Fixed players ending up with no viewmodel and no avatar by rejoining a game where any survivor already left the safe room. 
    - Added support for custom playground maps ( a guide will provided by ReneTM ). 
    - Fixed players not instantly dying when jumping into c14m1 safe room water area. 
    - Fixed players not instantly dying when jumping into c14m2 finale water.
    - Lowered slow motion probability from 10% to 5% as requested by many players. 
    - Fixed RocketDude decals sometimes not showing up. 
    - Fixed new best times not saving. 
    - Added Start and finish textures. 
- Other: 
    - Updated several Mutations to fix the issue where the weapons in Whitaker&#39;s Gun Store weren&#39;t being removed or converted. 
    - Fixed tanks failing to spawn in versus on No Mercy 3 (at 90+% boss flow). 
    - Fixed tanks spawning before the finale on No Mercy 5. 
    - Fixed a few stuck Special Infected issues on survival maps. 
    - Fixed setting the input mode to joystick/Steam Input. 
    - Increased command limit before causing a disconnect. 
    - Fixed some reported model crashes.

## 2.2.0.2
### Patch 1
- Fixed some materials and models that were causing errors in workshop content. 
- Reduced CS weapon spawn chance. 
- Safe room intros will now continue regardless if anyone leaves the safe room. 
- Fixed some witch call-outs 
- Lit Bill&#39;s cigarette 
- Last Stand Junkyard: 
    - Reduced intensity of horde spawned from generators. 
    - Versus Mode: Added an ammo pile near the mechanic shop. 
    - Versus Mode: Added a fire axe spawn to the safe room. 
- Last Stand Lighthouse:
    - Reduced intensity of horde during the Scavenge event.
---
### Patch 2
- Reoriented some of the new HUD images 
- Updated several nav meshes based on feedback 
- Fixed a bug where a door model was lacking prop data 
- Fixed spontaneous muzzle flashes on certain rifles when playing online 
- Adjusted knife&#39;s attack delay 
- Fixed c10m3 versus survival tank spawn issue 
- Fixed stuck spots on a few survival maps 
- Various other fixes to the nav mesh from feedback 
- Fixed a typo in one of the new shotgun sounds 
- Fixed material sorting issues with skin mods on Molotov world model -
- Achievements: 
    - Only award &#34;Fat Ninja&#34; for a direct vomit attack, not a boomer explosion. 
    - Fixed &#34;Golden Freeman&#34; not awarding pickups on dedicated servers. 
    - Award survival medals to the entire team, including dead players. 
    - Fixed &#34;The Big Ten&#34; and &#34;Supreme Survivalist&#34; not unlocking on dedicated servers. 
    - Only award &#34;The Last Frontier&#34; on the Last Stand campaign. 
    - Don&#39;t award Survival achievements in Versus Survival and vice-versa 
- Survival: 
    - Waterfront 
        - Removed cars outside the playable area to prevent infected from getting stuck. 
    - Generator Room 
        - Increased ZombieDiscardRange. 
    - Church 
        - Removed Laser Sights. 
    - Streets 
        - Swapped the Military Sniper and the Ammo Pile spawns around. 
    - Warehouse 
        - Removed mortar bags from under some stairs. 
    - Cold Stream Junkyard 
        - Removed Laser Sights. 
- Versus Survival: 
    - Made it so the plane crash will trigger if the countdown timer reaches 0 on Runway. 
    - The Save 4 Less store door will now open when the timer reaches 0 on Gun Store. 
    - The alarmed door will now open when the timer reaches 0 on Warehouse. 
- Tank Run:
    - Updated finales so rescue timer won&#39;t appear in Scavenge finales (you need to collect all the gas cans). 
    - Fixed The Sacrifice finale not working properly. - Two Tanks will now spawn at once during the non-Scavenge finales.

## 2.2.0.1
### Patch 1
- Prevent a server crash when using voice chat. 
- Prevent gas can tunneling. 
- Fixed an animation bug with weapon melee. 
- Updated localizations 
- Updated Rocket Dude mutation.
---
### Patch 2
- Fixed voice data overflow on servers.
- Fixed carried prop collision to not interfere with bot movement.
- Fixed laser-sighted weapon spawn exploit in the gun shop.
- Reduced some ambient dialog frequency.

# SectionC
==[top](#Contents)==

### Campaign Mode Clipping Q&A

**How do you give feedback?**
You can discuss your thoughts on the [**L4DNation Discord**](https://discord.gg/SUb5aXUK6g), or if you would prefer you could contact Failzz (failzz#2940), Jacob (jcb#9679), or Tsuey (G-Force#7777) directly. You can also comment on this HackMD list. If you are unsure what to give feedback on you can simply state whether you would prefer more player freedom in Campaign mode. However, I would strongly suggest going through the list of proposed changes before forming an opinion.

---
**How do I view the new clips?**
Please run the game with `-dev` in your launch options, and use the `script ShowUpdate()` command in console to view the new clips, and `script HideUpdate()` to hide them. 

Tutorial on how to use the commands:
{%youtube eKrOtGaLWAs %}

---

**Why are we deciding to do this?**
We tried to ensure that the clipping we added was not too restrictive during development, however we have been talking with players since TLS released about the clipping changes for Campaign mode. Based on the feedback we have received we feel that some of the changes are too restrictive for a casual gamemode. We want to look into potentially less restrictive ways of fixing these issues. Our main goal is to ensure all players are able to have fun playing L4D2!

---

**What will stay fixed?**
We will still be blocking off anything that could be seen as game breaking, or could be used to potentially ruin other players&#39; experiences. We will only be removing clips that we deemed unnecessary. This includes redundant clips, clips that were only meant for versus mode, and clips we feel are too restrictive. However, we will be looking into alternative ways of fixing or deterring players from doing certain skips that does not involve blocking them completely.

---

**Shouldn&#39;t skips be fixed though?**
Contrary to what many people believe this is subjective. Not all developers fix skips and tricks that players figure out. This depends on how much freedom the player is intended to have, and in casual games it is generally fine to give the player more freedom to explore. In competitive PvP games these things are generally fixed though, which is why Versus mode is being handled differently.

---

**What about griefers and rushers?**
These are much bigger issues than just skips that players can do. Fixing skips with clipping is one way to approach this, but we want to look into alternative methods that are not as restrictive. Try to keep in mind that not all players who rush or use skips are griefers, and some of these people only play Singleplayer or Friends Only games.

---

**What does Valve think about this?**
We asked Kerry (Valve employee) about his thoughts on the rollercoaster skip on Dark Carnival. Here is a direct quote:
&gt; You&#39;re right, in non-competitive modes it&#39;s usually best to err on the side of letting people just have fun. I don&#39;t know for sure about the coaster - my guess is the LD intended for the survivors to play the coaster in full, but when the skip was discovered it wasn&#39;t considered to be an issue worth changing. If you&#39;re performing the skip, you&#39;re probably a pretty experienced player who has already played the map the &#34;correct&#34; way numerous times anyway.

---

To keep yourself up to date on the latest changes being made check [**Tsuey&#39;s Github.**](https://github.com/Tsuey/L4D2-Community-Update)

---

Below is the list of clips that we are proposing to make Versus exclusive.

Commentary blockers will be changed in the future, but can be ignored for now. Primary focus is on the new clipping introduced in TLS update.

- [ ] Blank checkboxes indicate the clip has not been changed.
- [x] Marked checkboxes indicate the clip has been changed on the current release version of the game.
- [ ] ~~clip_name_here~~ Crossed out names indicate we do not plan to change this clip at the current time (subject to change). You can ignore these for now.


---
## Dead Center
- **Map 1:**
    - **Commentary blockers:**
        - [ ] Replace with versus only clip. [**Image**](https://i.imgur.com/TMHwGhl.jpg)
        - [ ] Needs to be redone and made to be versus only. [**Image**](https://imgur.com/a/qCxEK88) 
        - [ ] Replace with versus only clip. [**Image**](https://i.imgur.com/9elsiZc.jpg) 

- **Map 2:**
    - [ ] ~~_booster_bridgestairsa~~
    - [ ] ~~_booster_bridgestairsb~~
    - [x] _booster_mallroof

- **Map 3:**
    - **Commentary blockers:**
        - [ ] This blocker seems useless?? [**Image**](https://i.imgur.com/c9oyveN.jpg) 

- **Map 4:**
    - **Commentary blockers:**
        - [ ] NAV FIX. Unnecessary blocker. [**Image**](https://i.imgur.com/2E1yWe6.jpg) 
    - [ ] _booster_cedaplastic
    - [ ] _booster_storefrontright
    - [ ] _booster_storefrontleft
    - [ ] _nav_ladyshoes
    - [ ] _booster_pillarclip

## Dark Carnival:
- **Map 1:**
    - [ ] _booster_motelsign
    - [ ] _clipextend_umbrella1
    - [ ] _clipextend_umbrella2
    - [ ] _clipextend_umbrella3
    - [ ] _clipextend_poolwalla
    - [ ] _clipextend_poolwallb

- **Map 2:**
    - **Commentary blockers:**
    - [ ] _forklift_roof
        - Add clip to prevent players going OOB. [**Image**](https://imgur.com/2lJuxwB) 
    - [ ] _nav_exitsign
    - [x] _booster_uppertracka
    - [x] _booster_uppertrackb
    - [x] _clipextend_carouselboost
    - [ ] ~~_cliprework_beanbinninga~~

- **Map 3:**
    - [x] _nav_extinguisher
    - [x] _chargerassist_container
    - [x] _shortcut_finally_done
    - [x] _cliprework_scaffnuke_skipa
    - [x] _cliprework_scaffnuke_skipb
    - [x] _cliprework_scaffnuke_skipc
    - [x] _cliprework_scaffnuke_skipd
    - [x] _shortcut_supportdropa
    - [x] _shortcut_supportdropb
    - [x] _booster_eventskip1
    - [x] _booster_eventskip2
    - [x] _shortcut_supports
    - [x] _shortcut_commonhopg
    - [x] _cliprework_roofa
    - [x] _cliprework_roofb
    - [x] _cliprework_sign
    - [ ] _cliprework_fourvents
    - [ ] _cliprework_shrubgap
    - [ ] _shortcut_commonhopa
    - [ ] _shortcut_commonhopb
    - [ ] _shortcut_commonhopc
    - [ ] _shortcut_commonhope
    - [ ] _shortcut_commonhopf

- **Map 4:**
    - **Commentary blockers:**
        - [ ] Replace with a versus only clip. [**Image**](https://i.imgur.com/1Vauyfc.jpg) 
    - [ ] _booster_barnbeam1
    - [ ] _booster_barnbeam2
    - [ ] _booster_barnbeam3
    - [ ] _booster_barnbeam4
    - [ ] _booster_barnbeam5
    - [ ] _booster_barnbeam6
    - [ ] _booster_barnbeam7
    - [ ] _booster_barnbeam8
    - [ ] _nav_eventfenceback
    - [ ] _booster_awning

- **Map 5:**
    - [ ] _nav_duediligence
    - [x] _commentary_replace_01
    - [ ] _cliprework_concertroofio
    - [ ] _booster_lightleft
    - [ ] _booster_lightright
    - [ ] _cliprework_concerposter

## Swamp Fever
- **Map 1:**
    - [ ] _chargerassist_trainwheel
    - [x] _cliprework_jonesroof
    - [ ] _chargerassist_commonhop1
    - [ ] _chargerassist_commonhop2
    - [ ] _commonhop_coolingtank
    - [ ] _chargerassist_fenceladdy

- **Map 2:**
    - **Commentary blockers:**
        - [ ] Remove entirely. [**Image**](https://imgur.com/a/R4W2R4G) 
        - [ ] Replace with versus only infected clip. [**Image**](https://i.imgur.com/Ajjl3fA.jpg) 


- **Map 3:**
    - **Commentary blockers:**
        - [ ] Replace with versus only clip. [**Image**](https://i.imgur.com/QxGKEfQ.jpg) 

- **Map 4:**
    - **Commentary blockers:**
        - [ ] Replace with versus only clip [**Image**](https://i.imgur.com/oLsskjO.jpg) 
    - [ ] _booster_scaffoldpins
    - [ ] _point_of_no_return
    - [ ] _commonhop_mansionroof
    - [ ] _booster_mansionroofa
    - [ ] _booster_mansionroofb
    - [ ] _booster_mansionroofc

## Hard Rain
- **Map 1/4/5:**
    - **Commentary blockers:**
        - [ ] NAV FIX. Remove entirely. [**Image**](https://i.imgur.com/F3zFbx1.jpg) 
    - [ ] _booster_ginnytop
    - [ ] _booster_ginnyjon
    - [ ] _woodwindow
    - [ ] _booster_gasextend
    - [ ] _point_of_no_return
    - [ ] _booster_burgertankpole

- **Map 2/3:**
    - **Commentary blockers:**
        - [ ] Replace with versus only clip. [**Image**](https://i.imgur.com/LLQPt1t.jpg) 
        - [ ] NAV FIX. Replace with versus only clip. [**Image**](https://i.imgur.com/z7ecrCA.jpg) 
        - [ ] NAV FIX. Remove entirely. [**Image**](https://i.imgur.com/yZik5X1.jpg)
    - [ ] _commonhop_ducatelroof
    - [ ] _vent_roofa
    - [ ] _vent_roofb
        - Replace with 2 new clips. [**Image**](https://imgur.com/qnmgXnq) 
    - [ ] _nav_rubblewalla
    - [ ] _nav_rubblewallb
    - [ ] _nav_silo_witch1
    - [ ] _nav_silo_witch2
    - [ ] _nav_silo_witch3
    - [ ] _nav_silo_witch4
    - [ ] _nav_silo_witch5
    - [ ] _nav_silo_witch6
    - [ ] ~~_canefield_conewoof_m2only~~
    - [ ] ~~_canefield_coneroof_m2only~~
    - [ ] _instakill_elevatora
    - [ ] _instakill_elevatorb
    - [ ] _instakill_elevatorc
        - Trigger fix needed.

## The Parish:
- **Map 1:**
    - **Commentary blockers:**
    - [ ] _ledgehang_startfenceleft
    - [ ] _ledgehang_startfenceright
    - [ ] _nav_bienlamps
    - [ ] _nav_jukebox
    - [ ] _nav_outhouse
    - [ ] _cliprework_roofandwindows
    - [ ] _signhop_awning

- **Map 2:**
    - **Commentary blockers:**
        - [ ] Replace with versus only clips. [**Image**](https://i.imgur.com/gmu4XvF.jpg)
    - [ ] ~~_cliprework_parkarchway~~
    - [ ] _cliprework_anomalous
    - [ ] ~~_booster_escapegap~~
    - [ ] _booster_watchtower_extend
    - [ ] _booster_busdepot_extend
    - [ ] _nav_electricalbox

- **Map 3:**
    - **Commentary blockers:**
        - [ ] Replace with versus only clips. [**Image**](https://i.imgur.com/M0Ct4Ge.jpg) 
        - [ ] NAV FIX. Remove entirely. [**Image**](https://imgur.com/a/sfKCf8o)
    - [ ] _commonhop_overpass
    - [ ] _cliprework_perchroof
    - [ ] _nav_brokenhome_highcorner
    - [ ] _commonhop_rooftop
        - NAV FIX.
    - [ ] _nav_opencrypt
    - [ ] _sewer_holea
    - [ ] _sewer_holeb
    - [ ] _sewer_holec
    - [ ] _sewer_holed

- **Map 4:**
    - **Commentary blockers:**
    - [ ] _commonhop_fountain

- **Map 5:**
    - [x] _bunnyhop_girder
    - [x] _solidify_girderright
    - [x] _solidify_girderleft
    - [x] _solidify_stuckwarp1
    - [x] _solidify_stuckwarp2
    - [x] _solidify_stuckwarp3
    - [x] _solidify_stuckwarp4
    - [x] _solidify_alt_girderright
    - [x] _solidify_alt_girderleft
    - [x] _solidify_alt_stuckwarp1
    - [x] _solidify_alt_stuckwarp2
    - [x] _solidify_alt_stuckwarp3
    - [x] _solidify_alt_stuckwarp4
    - [ ] _booster_sign
    - [ ] _booster_acunit
    - [ ] _booster_rollupdoor
    - [ ] _bunnyhop_fence
        - Alternative fix? Ladder/Prop?

## The Passing
- **Map 1:**
    - **Commentary blockers:**
        - [ ] Remove entirely. [**Image**](https://i.imgur.com/NymRXIa.jpg) 
        - [ ] Replace with versus only clip. [**Image**](https://i.imgur.com/cETw6ZU.jpg)
        - [ ] Replace with versus only clips. [**Image**](https://imgur.com/a/28uEDLQ) 
    - [ ] _commonhop_awning
    - [ ] _cliprework_emptylargerooms
        - Clip only the right room, and remove props from left room.
    - [x] _fence_onea
    - [x] _fence_oneb
    - [x] _fence_two
    - [ ] _booster_clipextend_mid
    - [ ] _cliprework_endfence
    - [ ] _commonhop_windows
    - [ ] _cliprework_endwindows2
    - [ ] _cliprework_endwindows3
    - [ ] _commonhop_busb
        - Redundant.

- **Map 2:**
    - [ ] _cliphang_rooftop
    - [ ] _booster_awninglights
    - [ ] _booster_bluestripes
    - [ ] _booster_balcony2
    - [ ] _booster_dualwindows
    - [ ] ~~_booster_balcony6~~
    - [ ] _booster_balcony7

- **Map 3:**
    - [ ] _booster_signalboxes
    - [ ] _booster_tent
    - [ ] _booster_streetlamp
    - [ ] _booster_itwasatriumph
    - [ ] _booster_bridgeb
        - Redundant.
    - [ ] _booster_fencefinish
    - [ ] _booster_lighta
    - [ ] _booster_light_dual
    - [ ] _booster_for_lease
    - [ ] _clip_booster_elecwiresd
    - [ ] ~~_clip_booster_windows~~
    - [ ] _booster_lightb
    - [ ] _booster_signalboxes
    - [ ] _booster_elecwiresb
    - [ ] _booster_lightc
    - [ ] _booster_generator_side

## The Sacrifice
- **Map 1:**
    - [ ] _clipextend_arena_fence1
    - [ ] _cliprework_ventshafts
    - [ ] _commonhop_endwindows

- **Map 2:**
    - **Commentary blockers:**
        - [ ] Replace with versus only clip. [**Image**](https://i.imgur.com/D04AEHQ.jpg)
    - [ ] _booster_yawningman
    - [ ] _booster_littleroof
    - [ ] _nav_windowrecess
    - [ ] _booster_cementlips
    - [ ] _booster_fenceledge

- **Map 3:**
    - [ ] _booster_tent
    - [ ] _booster_streetlamp
    - [ ] _booster_spaaaaaace
    - [ ] _booster_bridge_TMP2
        - Redundant.
    - [ ] _booster_elecwiresbad
    - [ ] _booster_skylight_c7only
    - [ ] _booster_windows
    - [ ] _booster_generator_side
    - [ ] _booster_fireescape
    - [ ] _solidify_girdershorter
        - Redundant.

## No Mercy
- **Map 1:**
    - [ ] _cliprework_rooftop05
    - [ ] _cliprework_rooftop02
    - [ ] _cliprework_rooftop03
    - [ ] _commonhop_electricalbox
    - [ ] _cliprework_subwayupper
    - [ ] _cliprework_subwayledge
    - [ ] _truckjump_window
    - [ ] _booster_windows

- **Map 2:**
    - **Commentary blockers:**
        - [ ] Remove entirely. [**Image**](https://i.imgur.com/ZXc12Ar.jpg)
        - [ ] Replace with versus only clip. [**Image**](https://i.imgur.com/KaFu7pV.jpg)
        - [ ] Replace with versus only clip. [**Image**](https://i.imgur.com/XRe2gtb.jpg)
        - [ ] Replace with versus only clip. [**Image**](https://i.imgur.com/OriCGgE.jpg)
    - [x] _subwaymount_in
    - [x] _subwaymount_out
    - [ ] _nav_tankjukepipes
    - [ ] _booster_pipe

- **Map 3:**
    - [x] _commonhop_trimescape
    - [x] _window_ricky
    - [ ] _filecabinet_hole

- **Map 4:**
    - [ ] _nav_elevatorbutton

## Crash Course
- **Map 1:**
    - [x] _allmodes_griefrooma
    - [x] _allmodes_griefroomb
    - [ ] _booster_trafficlighta
    - [ ] _booster_trafficlightb
    - [ ] _booster_trafficlightc
    - [ ] _booster_trafficlightd
    - [ ] _booster_enginecar
    - [ ] _booster_brokenframe
    - [ ] _booster_acunit
    - [ ] _booster_rentsign
    - [ ] _cliprework_noladders
    - [ ] _commonhop_window

- **Map 2:**
    - [ ] _nav_jump_semitrailer
    - [ ] _nav_jump_cargowindow
    - [ ] _point_of_no_return
    - [ ] _booster_rollupdoor
    - [ ] _booster_rollupdoors
    - [ ] _booster_boxtop

## Death Toll
- **Map 2:**
    - [ ] _nav_cisetern_highpipe1
    - [ ] _nav_cisetern_highpipe2
    - [ ] _nav_cisetern_highpipe3
    - [ ] _nav_cistern_angpipe1
    - [ ] _nav_cistern_angpipe2
    - [ ] _nav_cistern_angpipe3
    - [ ] _nav_cistern_angpipe4
    - [ ] _nav_cistern_angpipe5
    - [ ] _commonhop_cisterntunnela
    - [ ] _commonhop_cisterntunnelb
    - [ ] _chargerassist_footlocker
    - [ ] _chargerassist_eventbutton
    - [x] _commonhop_pipe
    - [x] _cliprework_commonhop
    - [x] _bunnyhop_endwindow
    - [ ] _ledgehang_endsaferoof
    - [ ] _nav_electricalbox

- **Map 3:**
    - [ ] ~~_cliprework_watchtower~~
    - [x] _cliprework_smokertrolling
    - [ ] _cliprework_churchwindows
    - [ ] _chargerassist_brokenwall

- **Map 4:**
    - [x] _cliprework_eventskip1
    - [x] _cliprework_eventskip2
    - [x] _cliprework_eventskip3
    - [x] _cliprework_eventskip4
    - [ ] _cliprework_awning
    - [ ] _cliprework_balcony
    - [ ] _cliprework_windows
    - [ ] _cliprework_electricalbox

- **Map 5:**
    - **Commentary blockers:**

## Dead Air
- **Map 1:**
    - [x] _commonhop_greenhouse
    - [x] _cliprework_endpassage
    - [ ] _ladderqol_electricalbox
    - [ ] _oddhang_electricalbox

- **Map 2:**
    - [x] _finalstreet_trighurta
    - [x] _finalstreet_trighurtb
    - [x] _finalstreet_trighurtc

- **Map 3:**
    - [x] _bunnyhop_windows
    - [x] _booster_windows
    - [ ] ~~_nav_constructwin~~

- **Map 4:**
    - [ ] ~~_conveyorvent_upper~~
    - [ ] ~~_conveyorvent_lower~~

- **Map 5:**
    - [ ] _nav_firering_cheese

## Blood Harvest
- **Map 1:**
    - [x] _nav_quarrybeams

- **Map 2:**
    - [ ] _nav_eventlight1
    - [ ] _nav_eventlight2

- **Map 3:**
    - [ ] _nav_bridgecollapsea
    - [ ] _nav_bridgecollapseb
    - [ ] _bridge_dynamic_clip

- **Map 4:**
    - [x] _shortcut_warehouse
    - [x] _commonhop_traintruss
    - [ ] _cliprework_pullcharge
        - Redundant.

- **Map 5:**
    - [ ] ~~_booster_barnroof~~
    - [ ] ~~_cooponly_idle_warp~~
    - [ ] _point_of_no_return
    - [ ] _booster_haybarn
    - [ ] _clip_anomaly
    - [ ] _clip_anomaly_ugh

## Cold Stream
- **Map 3:**
    - [x] _shortcut_tanker
    - [x] _watercushion_trigonce
    - [x] _watercushion_trighurt
- **Map 4:**
    - [ ] _cliprework_endbooster

# SectionD
==[top](#Contents)==

### Campaign Mode Clipping Analysis

**Clips that are listed would be moved to be Versus only, unless stated otherwise. Be sure to read any notes/details. Anything checked off is already completed.**

## Updates
&gt; **10/3/2020** - Added onto c2m5, c4m1, c4m5, c6m3, c7m3, and c9m2.

&gt; **10/4/2020** - Added onto c3m4, c6m3, c7m3, and c12m5.

&gt; **10/7/2020** - Added onto c1m4, c2m2, c2m3, c2m4, c3m4, c4m1/4/5, c4m2/3.

&gt; **10/10/2020** - Added onto c5m1, c5m2, c5m3, c5m4, c5m5, c6m1, c6m2, c6m3, c7m1, c7m3, c8m1, c8m3, c9m1, c9m2, c10m2, c10m3, c10m4, c11m1, c11m3, c11m4, c11m5, c12m4, c12m5, c13m3, c13m4.

&gt; **10/13/2020** - Added info and images for most commentary blockers.

&gt; **10/28/2020** - Removed strikethrough on c3m4 clips. Removed note about nav fix.

&gt; **11/6/2020** - Added _bunnyhop_fence to c5m5.

&gt; **4/10/2021** - Added onto c1m2, c1m3, c1m4.

&gt; **4/11/2021** - Updated Dead Center, Dark Carnival, Hard Rain, Swamp Fever, The Parish.

&gt; **4/12/2021** - Updated ALL campaigns. Cleaned list up by removing a lot of stuff that felt pointless.

&gt; **4/13/2021** - Removed a few commentary blockers based on feedback.

## Dead Center
- **Map 1:**
    - **Commentary blockers:**
        - [ ] Replace with versus only clip. [**Image**](https://i.imgur.com/TMHwGhl.jpg)
        - [ ] Replace with versus only clips. [**Image**](https://imgur.com/a/qCxEK88) 
        - [ ] Replace with versus only clip. Probably redo this fix entirely. [**Image**](https://i.imgur.com/9elsiZc.jpg) 

- **Map 2:**
    - **VScript clips:**
        - [x] _booster_mallroof

- **Map 3:**
    - **Commentary blockers:**
        - [ ] Unsure what this is. Potentially remove entirely? [**Image**](https://i.imgur.com/c9oyveN.jpg) 

- **Map 4:**
    - **Commentary blockers:**
        - [ ] Nav fix! Test to be sure it doesn&#39;t bug out anything with the end cutscene. Remove entirely. [**Image**](https://i.imgur.com/2E1yWe6.jpg) 

## Dark Carnival:
- **Map 1:**
    - **Commentary blockers:**
        - [ ] Nav fix! Remove entirely. [**Image**](https://i.imgur.com/B0NB6iZ.jpg)
    - **VScript clips:**
        - [ ] _clipextend_poolwalla
        - [ ] _clipextend_poolwallb

- **Map 2:**
    - **Commentary blockers:**
        - [ ] Remove entirely. [**Image**](https://i.imgur.com/Aef0Fai.jpg)
        - [ ] Nav fix! Survivors can get full distance in versus by jumping against the hedge. Remove entirely. [**Image**](https://i.imgur.com/XZpfWdk.jpg)
    - **VScript clips:**
        - [x] _booster_uppertracka
        - [x] _booster_uppertrackb
        - [x] _clipextend_carouselboost
        - [ ] ~~_cliprework_beanbinninga~~
        - [ ] Add clip to prevent players going out of bounds. [**Image**](https://imgur.com/2lJuxwB)

- **Map 3:**
    - **Commentary blockers:**
        - [ ] Remove entirely. [**Image**](https://i.imgur.com/652i2Lj.jpg)
        - [ ] Remove entirely. [**Image**](https://i.imgur.com/JZeZXKr.jpg)
        - [ ] Replace with versus only clip. [**Image**](https://i.imgur.com/Jvnz85f.jpg)
        - [ ] Replace with versus only clip. [**Image**](https://i.imgur.com/sEx2ANw.jpg)
        - [ ] Replace with versus only clip. [**Image**](https://i.imgur.com/e7odLwZ.jpg)
    - **VScript clips:**
        - [ ] _stuckwarp_swanstairs 
        - [x] _chargerassist_container
        - [x] _shortcut_finally_done
        - [x] _cliprework_scaffnuke_skipa
        - [x] _cliprework_scaffnuke_skipb
        - [x] _cliprework_scaffnuke_skipc
        - [x] _cliprework_scaffnuke_skipd
        - [x] _shortcut_supportdropa
        - [x] _shortcut_supportdropb
        - [x] _booster_eventskip1
        - [x] _booster_eventskip2
        - [x] _shortcut_supports
        - [x] _shortcut_commonhopg
        - [x] _cliprework_roofa
        - [x] _cliprework_roofb
        - [x] _cliprework_sign
        - [ ] _shortcut_commonhopa
        - [ ] _shortcut_commonhopb
        - [ ] _shortcut_commonhopc
        - [ ] _shortcut_commonhopd
        - [ ] _shortcut_commonhope
        - [ ] _shortcut_commonhopf
        - [ ] ~~_onewayhole_blockclip~~
        - [ ] ~~_cliprework_culdesaca~~
        - [ ] ~~_cliprework_culdesacb~~
        - [ ] ~~_cliprework_culdesacc~~
        - [ ] ~~_cliprework_culdesacd~~
            - Nav fix!

- **Map 4:**
    - **Commentary blockers:**
        - [ ] Replace with a versus only clip. [**Image**](https://i.imgur.com/1Vauyfc.jpg) 
    - **VScript clips:**    
        - [ ] _nav_eventfenceback

- **Map 5:**
    - **VScript clips:**
        - [ ] _nav_duediligence
        - [x] _commentary_replace_01
        - [ ] _cliprework_concertroofio
        - [ ] _booster_lightleft
        - [ ] _booster_lightright
        - [ ] _cliprework_concerposter

## Swamp Fever
- **Map 1:**
    - **Commentary blockers:**
        - [ ] Remove entirely. [**Image**](https://i.imgur.com/6fOFuxZ.jpg)
        - [ ] Remove entirely. [**Image**](https://i.imgur.com/uXbU57I.jpg)
    - **VScript clips:**
        - [ ] _chargerassist_trainwheel
        - [x] _cliprework_jonesroof
        - [ ] _chargerassist_commonhop1
        - [ ] _chargerassist_commonhop2
        - [ ] _commonhop_coolingtank
        - [ ] _chargerassist_fenceladdy

- **Map 2:**
    - **Commentary blockers:**
        - [ ] Remove entirely. We added clipping to versus for this already. [**Image**](https://imgur.com/a/R4W2R4G) 

- **Map 3:**
    - **Commentary blockers:**
        - [ ] Replace with versus only clip. Could block entire roof for versus. [**Image**](https://i.imgur.com/eSGDsPR.jpg)
    - **VScript clips:**
        - [ ] _permstuck_cratetop

- **Map 4:**
    - **Commentary blockers:**
        - [ ] Replace with versus only clip [**Image**](https://i.imgur.com/oLsskjO.jpg)
    - **VScript clips:** 
        - [ ] _point_of_no_return
        - [ ] _commonhop_mansionroof
        - [ ] _booster_mansionroofa
        - [ ] _booster_mansionroofb
        - [ ] _booster_mansionroofc

## Hard Rain
- **Map 1/4/5:**
    - **Commentary blockers:**
        - [ ] Nav fix! Remove entirely. [**Image**](https://i.imgur.com/F3zFbx1.jpg)
        - [ ] Remove entirely. [**Image**](https://i.imgur.com/AKmjdK5.jpg)
    - **VScript clips:**
        - [ ] _booster_ginnyjon
        - [ ] _point_of_no_return
        - [ ] ~~_booster_burgertankpole~~

- **Map 2/3:**
    - **Commentary blockers:**
        - [ ] Replace with versus only clip. [**Image**](https://i.imgur.com/LLQPt1t.jpg) 
        - [ ] Nav fix! Redo the clipping so survivors can get up to the higher area. If we open this up we could add some sort of ladders for survivors to climb up. For versus mode probably keep this area blocked off still???  [**Image**](https://i.imgur.com/z7ecrCA.jpg) 
        - [ ] Nav fix! Remove entirely. [**Image**](https://i.imgur.com/yZik5X1.jpg)
    - **VScript clips:**
        - [ ] _commonhop_ducatelroof
        - [ ] _commonhop_roadclosed
            - Replace this with a less intrusive clip. Block getting out of bounds, but not hopping over the fence. [**Image**](https://i.imgur.com/j2qI5W3.jpg)
        - [ ] _vent_roofa
        - [ ] _vent_roofb
            - Replace with 2 new clips. [**Image**](https://imgur.com/qnmgXnq)
        - [ ] _nav_rubblewalla
        - [ ] _nav_rubblewallb
        - [ ] _nav_silo_witch1
        - [ ] _nav_silo_witch2
        - [ ] _nav_silo_witch3
        - [ ] _nav_silo_witch4
        - [ ] _nav_silo_witch5
        - [ ] _nav_silo_witch6
        - [ ] _shortcut_elevator_m2only
        - [ ] _instakill_elevatora
        - [ ] _instakill_elevatorb
        - [ ] _instakill_elevatorc
            - Need to fix elevator skip locking other survivors from progressing.

## The Parish:
- **Map 1:**
    - **Commentary blockers:**
        - Remove entirely. Redundant. [**Image**](https://i.imgur.com/aiHFQAx.jpg)
    - **VScript clips:**
        - [ ] _ledgehang_startfenceleft
        - [ ] _ledgehang_startfenceright
        - [ ] _nav_outhouse
        - [ ] _signhop_awning

- **Map 2:**
    - **Commentary blockers:**
        - [ ] Replace with versus only clips. [**Image**](https://i.imgur.com/xMTWjxR.jpg)
        - [ ] Replace with versus only clip. [**Image**](https://i.imgur.com/cXCg6mP.jpg)
        - [ ] In campaign mode make this clip disappear on the button press to stop the event. [**Image**](https://i.imgur.com/gACedIy.jpg)

- **Map 3:**
    - **Commentary blockers:**
        - [ ] Replace with versus only clips. [**Image**](https://i.imgur.com/M0Ct4Ge.jpg) 
        - [ ] Nav fix! Remove entirely. [**Image**](https://imgur.com/a/sfKCf8o)
    - **VScript clips:**
        - [ ] _stuckwarp_staircase
        - [ ] _commonhop_rooftop
            - Replace this with a clip covering whole roof. [**Image**](https://i.imgur.com/q5Sr41W.jpg)

- **Map 4:**
    - **Commentary blockers:**
        - [ ] Remove entirely. [**Image**](https://i.imgur.com/84gKlUJ.jpg)
        - [ ] Replace with versus only clip. In versus remove on button press to start event or x seconds after. [**Image**](https://i.imgur.com/c9aeAQG.jpg)
        - [ ] Remove entirely. [**Image**](https://i.imgur.com/3Ld87cZ.jpg)
    - **VScript clips:**
        - [ ] _commonhop_fountain

- **Map 5:**
    - **VScript clips:**
        - [x] _bunnyhop_girder
        - [x] _solidify_girderright
        - [x] _solidify_girderleft
        - [x] _solidify_stuckwarp1
        - [x] _solidify_stuckwarp2
        - [x] _solidify_stuckwarp3
        - [x] _solidify_stuckwarp4
        - [x] _solidify_alt_girderright
        - [x] _solidify_alt_girderleft
        - [x] _solidify_alt_stuckwarp1
        - [x] _solidify_alt_stuckwarp2
        - [x] _solidify_alt_stuckwarp3
        - [x] _solidify_alt_stuckwarp4
        - [ ] _bunnyhop_fence
            - Remove clip and add prop/ladder for survivors to get back inbounds.

## The Passing
- **Map 1:**
    - **Commentary blockers:**
        - [ ] Remove entirely. [**Image**](https://i.imgur.com/cETw6ZU.jpg)
        - [ ] Replace with versus only clips. Needs to be redone for versus. [**Image**](https://imgur.com/a/28uEDLQ) 
    - **VScript clips:**
        - [ ] _cliprework_bridgeroof
        - [ ] _ghostgrief_tarpledge
        - [ ] _cliprework_bridgewall
        - [ ] _commonhop_awning
            - Add clip here to block players getting out of bounds. [**Image**](https://i.imgur.com/xGKP4w1.jpg)
        - [ ] _cliprework_emptylargerooms
            - Change it so left room is accessible, and only block the right room. [**Image**](https://i.imgur.com/T2vbwc9.jpg)
        - [x] _fence_onea
        - [x] _fence_oneb
        - [x] _fence_two
        - [ ] _cliprework_endfence
        - [ ] _commonhop_busb

- **Map 2:**
    - **Commentary blockers:**
        - [ ] Replace with a clip that disappears on the button press to start the event. [**Image**](https://i.imgur.com/qZ2OJOf.jpg)
    - **VScript clips:**
        - [ ] _cliphang_rooftop

- **Map 3:**
    - **VScript clips:**
        - [ ] _booster_signalboxes
        - [ ] _booster_bridgeb

## The Sacrifice
- **Map 2:**
    - **Commentary blockers:**
        - [ ] Replace with versus only clip. Needs to be redone for versus. [**Image**](https://i.imgur.com/D04AEHQ.jpg)

- **Map 3:**
    - **VScript clips:**
        - [ ] _booster_bridge_TMP1
        - [ ] _booster_bridge_TMP2
        - [ ] _booster_fireescape
        - [ ] _solidify_girdershorter
        - [ ] _anti_finaleskip_TMP
            - Change this clip so it does not extend as far out. Extend it across to the other girder on the right. This will create a large clip that should block any easy skips, and simplify the clipping. Should get removed as soon as the bridge opens to survivors. [**Image**](https://i.imgur.com/lhyVKAm.jpg)

## No Mercy
- **Map 1:**
    - **Commentary blockers:**
        - [ ] Remove entirely. [**Image**](https://i.imgur.com/H6DwOaU.jpg)
    - **VScript clips:**
        - [ ] _clipextend_subwayfence

- **Map 2:**
    - **Commentary blockers:**
        - [ ] Remove entirely. [**Image**](https://i.imgur.com/BPDdw68.jpg)
        - [ ] Replace with versus only clip. [**Image**](https://i.imgur.com/ZXc12Ar.jpg)
        - [ ] Replace with versus only clip. [**Image**](https://i.imgur.com/KaFu7pV.jpg)
        - [ ] Remove entirely. [**Image**](https://i.imgur.com/XRe2gtb.jpg)
        - [ ] Replace with versus only clip. [**Image**](https://i.imgur.com/OriCGgE.jpg)
    - **VScript clips:**
        - [ ] _stuckwarp_underspawn
        - [ ] _stuckwarp_tunnelend
        - [x] _subwaymount_in
        - [x] _subwaymount_out
        - [ ] Add clip onto roof (all gamemodes). [**Image**](https://i.imgur.com/t2BVUsw.jpg)

- **Map 3:**
    - **VScript clips:**
        - [x] _commonhop_trimescape
        - [x] _window_ricky

- **Map 4:**
    - **VScript clips:**
        - [ ] _nav_elevatorbutton

## Crash Course
- **Map 1:**
    - **VScript clips:**
        - [ ] _cliprework_rooftop01
            - Change this clip so it extends further and covers the entire first rooftop. [**Image**](https://i.imgur.com/bXcYtnY.jpg)
        - [ ] _cliprework_rooftop02
        - [ ] _clipgap_alley
        - [x] _allmodes_griefrooma
        - [x] _allmodes_griefroomb
        - [ ] _booster_trafficlighta
        - [ ] _booster_trafficlightb

- **Map 2:**
    - **VScript clips:**
        - [ ] _nav_jump_semitrailer
        - [ ] _point_of_no_return

## Death Toll
- **Map 2:**
    - **VScript clips:**
        - [ ] ~~_commonhop_cisterntunnela~~
        - [ ] ~~_commonhop_cisterntunnelb~~
        - [ ] ~~_chargerassist_footlocker~~
        - [ ] ~~_chargerassist_eventbutton~~
        - [x] _commonhop_pipe
        - [x] _cliprework_commonhop
        - [x] _bunnyhop_endwindow
        - [ ] _ledgehang_endsaferoof

- **Map 3:**
    - **VScript clips:**
        - [x] _cliprework_smokertrolling
        - [ ] _cliprework_churchwindows
        - [ ] _chargerassist_brokenwall

- **Map 4:**
    - **VScript clips:**
        - [x] _cliprework_eventskip1
        - [x] _cliprework_eventskip2
        - [x] _cliprework_eventskip3
        - [x] _cliprework_eventskip4

- **Map 5:**
    - **Commentary blockers:**
        - [ ] Nav fix! Replace with versus only clip? [**Image**](https://i.imgur.com/MoE2BDL.jpg)
    - **VScript clips:**
        - [ ] _rockslide_survivorclipa
        - [ ] _rockslide_survivorclipb
        - [ ] _rockslide_survivorclipc
        - [ ] _rockslide_static_1a
        - [ ] _rockslide_static_1b
        - [ ] _rockslide_static_1c
        - [ ] _rockslide_static_2a
        - [ ] _rockslide_static_2b
        - [ ] _rockslide_static_2c


## Dead Air
- **Map 1:**
    - **VScript clips:**
        - [x] _commonhop_greenhouse
        - [x] _cliprework_endpassage

- **Map 2:**
    - **VScript clips:**
        - [x] _finalstreet_trighurta
        - [x] _finalstreet_trighurtb
        - [x] _finalstreet_trighurtc

- **Map 3:**
    - **VScript clips:**
        - [x] _bunnyhop_windows
        - [x] _booster_windows

## Blood Harvest
- **Map 1:**
    - **VScript clips:**
        - [x] _nav_quarrybeams

- **Map 2:**
    - **VScript clips:**
        - [ ] _nav_eventlight1
        - [ ] _nav_eventlight2

- **Map 3:**
    - **VScript clips:**
        - [ ] _nav_bridgecollapsea
        - [ ] _nav_bridgecollapseb

- **Map 4:**
    - **VScript clips:**
        - [x] _shortcut_warehouse
        - [x] _commonhop_traintruss
        - [ ] _cliprework_pullcharge

- **Map 5:**
    - **VScript clips:**
        - [ ] _cooponly_idle_warp
        - [ ] _point_of_no_return

## Cold Stream
- **Map 3:**
    - **VScript clips:**
        - [x] _shortcut_tanker
        - [x] _watercushion_trigonce
        - [x] _watercushion_trighurt

# SectionE
==[top](#Contents)==

### Valve's C++ Changelog

The Last Stand Community Update has been released!
Visit https://www.l4d.com/laststand/ for all of the details.

Summary of the more than 1000 changes across the entire game:

- Fixed an exploit that could lag or crash a server by spawning infinite pistols.
- Rate-limit commands to prevent client command DOS attacks against servers.
- Fixed the ability to bypass the damage filter on the gas station's rolling door by going idle.
- Fixed avoiding damage from the charger by toggling in/out of idle while being body slammed.
- Fixed clearing the boomer screenspace effect by taking a break.
- Fix griefing exploit where a survivor would fire the grenade launcher and then switch to spectator to skip the friendly-fire check
- Record the team of a vote caller at the time the vote is called, so if the caller disconnects the other players can still have their votes checked against the caller's team. Fixes team-based votes locking out new voters if the caller disconnects.
- Build a map load command on the server instead of directly executing the command that's received as part of the server reservation packet. Fixed potential server takeover exploit.
- Fixed SI ghosts playing jump landing sounds
- Prevent players from joining the survivor team as a character already occupied by a human player.
- Marked "voice_all_icons" (used for testing) as a cheat command. Clear the voice state whenever the value changes so voice bubbles don't stay visible when switching between cheat enabled/disabled games.
- Marked cl_survivor_light_* cvars as cheats.
- Made survivor_teammatefocus_* convars replicated, so they can still be used as a legitimate way to play but are forced to be consistent for all clients.
- Removed a three-second window where an infected player could force a faster transition from the observer state to the ghost state by pressing a key.
- Don't spam open/close door client commands while the door is in the process of opening or closing.

- Fixed spawn areas permanently excluded from spawn set when a survivor dies, idles, or changes character.
- Fixed mobs unable to spawn if survivors stand in specific areas during a finale.
- Always restore the default pain pills decay rate when the director resets.
- Fixed the L4D1 survivor gestures not playing on dedicated servers.
- Allow SI to destroy breakables in finale areas during survival and scavenge modes once the round begins.
- Fixed breakables sometimes failing to unblock the nav when they break.
- Don't stumble the charger if the charge attack starts while already in contact with the victim.
- Fixed L4D1 survivors not selecting their canonical preferred weapons when scavenging.
- Allow survivors to pick up ammo while fighting a tank or in close combat if they are less than 40% full.
- Bots will use pills only if health < 50
- Bots consider health to be critical at < 30 (was 40). This means real health must be < 5 before a bot will use first-aid over a full temp health buffer.
- Fixed a few cases where specials may choose to wait in an ambush position when the game mode says they should be assaulting the survivors
- If a chase path that's trying to lead the target fails, fall back to a non-leading path. Leading paths that run off a cliff aren't always handled properly and can cause the target to be treated as unreachable.
- Revised the logic for fitting both tank and witch spawn locations into the flow. Previously they would frequently collide and the witch would get culled; now they should always find some combination of spawn locations that fit the within the map constraints.
- Fixed the director's "arc value" not always handling campaigns shorter than five maps correctly.

- Allow competitive achievements (versus, scavenge) to also be earned in Versus Survival.
- Incapped survivors are counted as escaped if they're in the rescue vehicle.
- Enabled CS weapons for all players
- Viewmodels use the skin value of the world pickup model, same as gas cans.
- When a weapon is holstered, transfer the current skin to the addon model.
- Clear the viewmodel fire layer when performing a melee attack to fix the stuck helping hand bug.
- Fixed the mp5's melee shove canceling its reload animation.
- Turned on boomer gibs by default, except in low violence mode.
- Restored burn skins for infected
- Fixed witch kills getting recorded as common zombie kills in the stats.
- Increased "ammo_shotgun_max" from 56 to 72

- Removed "Single Player" option from the main menu carousel.
- Enabled the "Private Game" option in lobby permissions.
- Added a rematch vote to the end of versus survival matches.
- Fixed voice chat not working in lobbies.
- No vote cooldown in singleplayer modes
- Allow "Change all-talk" vote in versus survival mode.
- cl_downloadfilter defaults to "none"
- Fixed genericpanellist not drawing panels when they extended beyond both the top and bottom of the frame.
- Suppress warnings about func_orator not having a model

AND MORE
- Hundreds of fixes and tweaks to animations, models, dialog, map layouts and exploits.

Steam Input
- Added a Joystick style action that can receive console-style aim assist
- Fixed the “Turn Around” action
- Added a “Reset Camera” action for use with motion controls
- Rescaled mouse sensitivities so that the adjustment sliders in the configurator have more useful range
- Fix controller input on Orders/Response Quick Menu’s
- Fixed controllers not being able to skip to the end of the post-campaign stats scrawl

SCRIPTING AND MODDING

- CHANGES
- Run mapspawn_addon.nut for all active addons after the base version runs.
- Run scriptedmode_addon.nut and director_base_addon.nut for all active addons after the base version runs.
- Support for new population file overrides for the base game mode. So the load order is now "population.txt", "population_.txt", "population_.txt", which each script optionally overriding place definitions from the previous files.
- Any time the addon load order changes, both the director and the nav mesh immediately refresh their population data. Fixes campaigns using the wrong populations and errors from precaching the wrong models.
- Func_nav_attribute_region and point_nav_attribute_region will remove attributes if the spawn key "remove_attributes" is set to true.
- Allow scripts to force the witch bride spawn, regardless of the variant setting
- "InterceptChat" can return false to prevent sending the message to other clients.
- "DamageType" field of "ScriptAllowDamage" is now read/write, so it can be used to change the damage type.
- Fixed being unable to create subdirectories in /left4dead2/ems
- New game event "player_left_safe_area", called every time the first survivor leaves the start area regardless of map number, restarts, etc.
- Added the userid of the offending player to "triggered_car_alarm" game event.
- Fixed script funcs SetContext and SetContextNum not recognizing that a duration of zero means 'forever'. To avoid breaking existing scripts, the 'forever' parameter is now -1.
- Track convars set from script so they can be reverted when the session ends.
- New gender "police", can spawn & drop tonfas like the riot control commons, but doesn't have the protective gear.
- Added a new keyfield "weaponskin" to item and weapon spawners to set the skin of the spawned item or weapon. Supported by "weapon_item_spawn", "weapon_melee_spawn", "weapon_scavenge_item_spawn".
- Removed spurious parenthesis from "ToKVString" and "_tostring" script functions
- Director now calls into an optional script function "GetCustomScriptedStageProgress" during FINALE_CUSTOM_SCRIPTED stages. The function should return a value from 0-1 to indicate the completion percentage of the stage. The default time-based completion percentage is passed in as a parameter.
- Added weapon spawners and configurable spawner entries for CS weapons.


- NEW FUNCTIONS
CBaseEntity
GetMaxHealth
SetMaxHealth
GetModelName
SetModel( modelname )

CBaseAnimating
GetAttachmentBone, Get the named attachement's parent bone index
GetAttachmentOrigin, Get the attachment id's origin as vector
GetAttachmentAngles, Get the attachment id's angles as p,y,r vector
GetBoneOrigin, Get the bone id's origin vector
GetBoneAngles, Get the bone id's angles as a p,y,r vector
LookupActivity, Get the named activity index
LookupBone, Get the named bone index
LookupSequence, Looks up a sequence by sequence name or activity name
SetSequence, Set a sequence by id
ResetSequence, Reset a sequence by id. If the id is different than the current sequence, switch to the new sequence
GetSequence, Get the current sequence id
GetSequenceActivityName, Get the activity name for a sequence by id
GetSequenceName, Get a sequence name by id
GetSequenceDuration, Get a sequence duration by id
GetBodygroup, Get a bodygroup by id
GetBodygroupName, Get the bodygroup id's name
FindBodygroupByName, Find a bodygroup id by name
GetBodygroupPartName, Get name by group and part
SetBodygroup
GetModelScale
SetModelScale, (scale, change_duration) Changes a model's scale over time
SetPoseParameter, (id, value) Sets a pose parameter value

CBaseFlex
GetCurrentScene, Returns the instance of the oldest active scene entity (if any).
GetSceneByIndex, Returns the instance of the scene entity at the specified index.
PlayScene, Play the specified .vcd file.
LookupAttachment
IsSequenceFinished

CTerrorPlayer
DropItem, Make the player drop an item/weapon
SwitchToItem, Make the player switch to an item/weapon
SnapEyeAngles, Sets the view angles
GiveItemWithSkin( itemname, skin )

CTerrorWeapon
GetMaxClip1
GetMaxClip2
GetDefaultClip1
GetDefaultClip2
Clip1
Clip2
SetClip1
SetClip2
GiveDefaultAmmo
Reload

CDirector
GetGameModeBase
GetMapName
GetSurvivorSet

ResponseCriteria
GetValue, ( entity, criteriaName ) - returns a string
GetTable, ( entity, table ) - returns a table of all criteria
HasCriterion, ( entity, criteriaName ) - returns true if the criterion exists

CBaseTrigger
Disable
Enable
IsTouching, ( entity )

Global
DebugDrawBoxAngles, Draw a debug oriented box (cent, min, max, angles(p,y,r), vRgb, a, duration)
ClientPrint, Print a client message
PrecacheSound
EmitAmbientSoundOn, Play named ambient sound on an entity.
StopAmbientSoundOn, Stop named ambient sound on an entity.
GetSoundDuration, Returns float duration of the sound. Takes soundname and optional actormodelname.
SetFakeClientConVarValue, Sets a USERINFO client ConVar for a fakeclient
ScreenShake, Start a screenshake with the following parameters. vecCenter, flAmplitude, flFrequency, flDuration, flRadius, eCommand( SHAKE_START = 0, SHAKE_STOP = 1 ), bAirShake
ScreenFade, Start a screenfade with the following parameters. player, red, green, blue, alpha, flFadeTime, flFadeHold, flags
PrecacheModel
IsModelPrecached
IsSoundPrecached
IsDedicatedServer
GetListenServerHost
HasPlayerControlledZombies
"AllowFallenSurvivorItem", optionally reject items from spawning on the fallen survivor.
ShouldPlayBossMusic

- SCRIPT ENTITIES
"script_func_button" - spawn a func_button from script via extents.
"script_clip_vphysics" - structured the same as other script-based trigger entities.
"script_nav_attribute_region" - uses extents instead of brushes.

- RESPONSE RULES
- Added survivor criteria "InRescueVehicle", set to 1 when the vehicle has arrived and the survivor is inside.
- Added "NumberOfTeamAlive", "NumberOfTeamIncapacitated", and "NumberOfTeamDead" to the set of response rules global criteria.

- MISSION KEYS
- Added a mission key "allow_boss_mix" to the "versus_boss_spawning" block to bypass a restriction on having both a tank and a witch in the first and last maps of a campaign.
- Created variant keys to set a different character model
HunterVariant
SmokerVariant
BoomerVariant
BoometteVariant
SpitterVariant
JockeyVariant
ChargerVariant
WitchVariant

# SectionF
==[top](#Contents)==

### General Modding Changelog

======================================================================================================
===== GAME SOUNDS ====================================================================================
======================================================================================================
	(Lt. Rocky) - Added individualized audio files and game sounds for silenced SMG, chrome shotgun, Spas shotgun, M60 and cricket bat
	(Lt. Rocky) - Added individualized deploy audio for the MP5, Scout and SG552 and all melee weapons
	(Salad) - Waterfront sound script was modified to feature a full music set
	(Lt. Rocky) - Fixed "npc.Biker_IncapacitatedInitial01" playing the wrong sound (played "No1.wav" instead of "IncapacitatedInitial01.wav")
	(Lt. Rocky) - Fixed and restored broken sound "Player.Biker_No01"
	(Lt. Rocky) - Restored missing "Player.Biker_ArriveGeneric01" game sound for Francis
	(Lt. Rocky) - Restored missing "Player.Biker_ReviveCriticalFriend01" game sound for Francis
	(Lt. Rocky) - Restored missing "Player.Manager_Reloading01" game sound for Louis
	(Lt. Rocky) - Restored missing "Player.TeenGirl_Hurrah23" game sound for Zoey
	(Salad / Lt. Rocky) - Fixed an oversight where "Player.NamVet_ReactionPositive06" had a volume level of 0 (now 0.6)
	(Salad) - Channel of "PainPills.Use" was changed from "CHAN_BODY" to "CHAN_ITEM" to prevent interruption from footstep audio
	(Salad) - Volume of "AK47.FireIncendiary" was lowered from 1.0 to 0.7, to match volume level of "AK47.Fire"
	(Salad) - Volume of "Pistol.Fire" was raised from 0.65 to 0.75, to match volume level of "DualPistol.Fire"
	(Salad) - Volume of "Shotgun.Fire" was raised from 0.7 to 1.0 to match volume level of Shotgun.FireIncendiary & Shotgun_Chrome.Fire
	(Salad) - Pumpshotgun and Autoshotgun randomize between both loadshell sounds
	(Lt. Rocky) - Fixed bad syntax in soundlevel of "Achievement.Earned" (Set "SNDLVL_94dB" instead of "94")
	(Lt. Rocky) - Fixed bad syntax in soundlevel of "Minigun.SpinUp", "Minigun.Fire" & "Minigun.SpinDown" (Set "SNDLVL_94dB" instead of "94")
	(Doktor Haus) - All gunfire audio use a random pitch (97%-103%)
	(Lt. Rocky) - Added unused hordeslayer tracks for L4D1 campaigns
	(Lt. Rocky / Sergi338) - added unused horde tracks for L4D1 campaigns
	(Lt. Rocky) - Flashlight audio was split into two separate files for being switched on and off
	(Salad / Lt. Rocky) - Changed channel on ChargerZombie.Charge from CHAN_VOICE to CHAN_STATIC, to prevent the charger's warcry from being interrupted by pain audio
	(Salad / Xanaguy) - Added 4 lines for Francis from custom L4D1 maps (Dead Before Dawn, Night Terror, Last Drop) and created scenes, facial animations, soundscript entries & subtitles for each
	(Salad) - Added missing fall04 WAVs for biker, manager and teengirl (currently they are copies of fallshort01, fallshort02 and fallshort02, respectively)
	(Salad) - Biker ReactionStartled03 "Woah! Jesus..." - raised volume on "Jesus"
	(Salad) - Changed channel on "Inferno.StartSweeten" from CHAN_WEAPON to CHAN_STATIC so it would play alongside "Inferno.Start" when a Molotov or gas can explodes, instead of overriding it
	(Salad) - Raised volume on Mob Signal music cues in L4D1 campaigns to be closer to how they were in L4D1
	(Salad) - Altered Waterfront music set to try splitting the difference with intentionally music-free custom campaigns; Replaced intro music with checkpoint intro cue, lowered loop volume
	(Salad) - Fixed a bug where L4D1's version of the leftfordeath music would cut short when mode of spectation was changed


======================================================================================================
===== TALKER =========================================================================================
======================================================================================================
	(Xanaguy) - (See Changelog Talker)

======================================================================================================
===== WEAPONS & ITEMS ================================================================================
======================================================================================================
	(Splinks / Lt. Rocky / Doktor Haus / Salad) - Added new melee weapons: a shovel and pitchfork!
	(Lt. Rocky) - Added individualized UI icons for all weapons and items; script files are no longer required for making custom hud icons
	(Salad) - New UI icons for the pistols, representing the models added in L4D2
	(Arima / CTriggerHurt) - Higher quality view models for L4D1 weapons
	(Lt. Rocky) - Higher quality view models for Desert Rifle, Grenade Launcher and M60
	(Lt. Rocky) - All view model sequences transition in and out of idle state with improved animation blending
	(Lt. Rocky) - Added new brass eject particles for pistols, smg's, desert eagle, rifles, AK & M60
	(Lt. Rocky) - Fixed scripting error where the silenced smg used the wrong particle in 3rd person
	(Lt. Rocky) - Fixed a particle error where the silenced smg fell back to one of the regular smg's particles
	(Lt. Rocky) - Higher quality textures for L4D1 weapons and items
	(Lt. Rocky) - Added normal and exponent map for guitar
	(Lt. Rocky) - Restored missing flashlight wire on military sniper
	(Lt. Rocky / Salad / Sergi338) - Restored text on the side of the spas shotgun
	(Lt. Rocky) - Optimized world models by removing several unused and useless dmx bones and hitboxes
	(Lt. Rocky) - Weighted the magazines and pumps to move in all weapon world models
	(Lt. Rocky) - Flipped the scope on the hunting rifle's world model to face the correct direction
	(Lt. Rocky) - Added item pickup animations for Pistols, Dual Pistols and Desert Eagle
	(Lt. Rocky) - All weapon view models emit muzzle smoke from the correct position
	(Lt. Rocky) - Added jiggle bones to several view models & world models
			-Strap on the Silenced SMG
			-Sling chain on the SMG
			-Sling chain on the hunting rifle
			-Flashlight wires on the SCAR and military sniper
			-Stock and chain on the Spas shotgun
			-Sling chain on the M16, a la L4D1 beta
			-Sling chains on the grenade launcher
			-Forward sight on the grenade launcher 
			-Straps and zippers on the medkit
			-Starter cord on the chainsaw
			-Molotov's cloth strap (world model)
			-Pipebomb's fuse (world model)
				- All jigglebones on the world models use LoD's to deactivate after a certain range
	(Lt. Rocky) - Added walking cycles and vertical posing for the pistols, Desert Eagle and defib
	(Lt. Rocky) - Rebuilt the Fireaxe & Machete animations to no longer obscure the camera when playing at a higher Field of View
	(Lt. Rocky) - Moved origin positions of several view models farther from the camera, more centered and more consistant
			-Desert Eagle
			-Hunting Rifle
			-AK
			-Rifle
			-Desert Rifle
			-Military Sniper
			-SMG
			-Silenced SMG
			-M60
			-Spas shotgun
			-Fireaxe
			-Machete
	(Lt. Rocky) - Added 1st person arm support to Gnome & Cola carryables
	(Lt. Rocky) - Fixed the M16, AK47 and SCAR not playing audio of operating their bolts when deployed
	(Lt. Rocky) - Fixed an error where the M16 played the AK47's foley deploy audio
	(Lt. Rocky) - Fixed visual clipping with the Desert Eagle's reloading, where the magazine could be seeing going through the grip
	(Lt. Rocky) - Fixed an error where the world model of the Desert Eagle and single-wielded pistol would not eject shell cases
	(Lt. Rocky) - Fixed incorrect positioning of muzzle and flashlight attachments on the Desert Eagle's world & view models
	(Lt. Rocky / Salad) - Improved the Desert Eagle's view model mesh to display double-sided along the slide
	(Lt. Rocky) - Fixed the spas shotgun and military sniper's bolts going out-of-bounds during run animation
	(Lt. Rocky) - Fixed incorrect angle of shell eject attachment on M60 world model
	(Lt. Rocky) - The Desert Eagle uses the correct reload audio instead of the pistol's
	(Lt. Rocky) - Fixed incorrect positioning with the Military Sniper's bolt in the deploy and walk animations
	(Lt. Rocky) - Removed muzzle light from the Silenced SMG
	(Lt. Rocky) - Fixed incorrect positioning with the Spas shotgun's bolt in the walk animation
	(Lt. Rocky) - Fixed incorrect UV baking on parts of the Spas's inner layers, which would show a shell inside foregrip
	(Lt. Rocky) - Fixed the bolt of the SCAR going through the receiver during animation
	(Lt. Rocky) - Uzi SMG's bolt no longer moves when firing
	(Lt. Rocky) - Silenced SMG's bolt was rebuilt to move more correctly to the weapon's nature (opposite direction)
	(Lt. Rocky) - Removed unweighted extra shell seen inside the view model of the Auto-shotgun during reloading
	(Lt. Rocky) - Fixed unnatural wrist twisting on the hunting rifle's vertical posing
	(Lt. Rocky) - Fixed arm twitching in the hunting rifle's idle loop cycle
	(Lt. Rocky) - Slowed down the rate at which the Minigun visually heats up
	(Lt. Rocky) - Fixed a visual error with the chains on the chainsaw during attack loop animation
	(Lt. Rocky) - Melee animation on single pistol and desert eagle was adjusted with less frames and a more streamlined motion
	(Lt. Rocky) - The magazines no longer clip with the weapon when the SCAR and M16 are reloading
	(Lt. Rocky) - Fixed the hunting rifle's bolt not moving with the weapon on the walk animation
	(Lt. Rocky) - Fixed various UV inaccuracies on the M60's view and world models
	(Lt. Rocky) - Increased frames-per-second of M60's fire sequence from 30 to 40 for a smoother display of the ammo belt's animation
	(Lt. Rocky) - Fixed unnatural twisting on the left hand of the machete animations
	(Lt. Rocky) - Removed blur particle from the machete and frying pan's shove attack
	(Lt. Rocky) - Fixed z-fighting textures on SCAR's view model trigger guard
	(Lt. Rocky) - Added animation to the shell doors on the Automatic shotguns
			-Added double-sided faces to the inside of the mesh behind the shell door on the auto shotgun
	(Lt. Rocky) - Cleaned the ambient bake and UV of the AK47 base texture to correctly showcase the entire magazine
	(Lt. Rocky) - Added rotation dampening to the physics of the golfclub world model
	(Lt. Rocky / Salad / Doktor Haus) - Assigned new surfaceprop settings to various weapon world models, with new unique sounds
	(Lt. Rocky) - Fixed inconsistant camera angles on adrenaline animations
	(Lt. Rocky) - Pump shotguns, molotov, SG552 and Scout use more accurate collision models
	(Lt. Rocky) - Corrected a syntax error in electric_guitar.txt; "player_activity_idle" under "secondaryattacks" was written as "ACT_SHOOT_SECONDARY_GUITARq"; corrected to spell "ACT_SHOOT_SECONDARY_GUITAR"
	
	
======================================================================================================
===== COUNTERSTRIKE: SOURCE WEAPONS (MP5, SG552, SCOUT, AWP, Knife) ==================================
======================================================================================================

	(Kerry) - All Counter-Strike weapons are unlocked and can be used internationally*
	(Kerry) - Added cvar "director_cs_weapon_spawn_chance" (default 0.5) to set the chance of each CS weapon getting added to the spawn pool for each spawner. This is to reduce their likelihood in comparison to the standard weapons
	(Lt. Rocky) - The CSS weapons have been re-built right-handed; script files will no longer be required for customizing these weapons
	(Kerry) - Fixed the mp5's melee shove canceling its reload animation*
	(Lt. Rocky) - Scout's damage was increased from 90 to 105
	(Salad / Lt. Rocky) - Added incendiary gunfire audio for CSS weapons
	(Lt. Rocky) - Fixed a transition bug that would cause the CSS weapons to freeze after reloading
	(Lt. Rocky) - All CSS view models were rebuilt with improved finger orientation and new walk cycles
	(Salad) - Improved view model meshes with less visible gaps
	(Lt. Rocky) - MP5 UI icon was changed to include the stock
	(Lt. Rocky) - Restored smooth groups on the view model of the MP5
	(Lt. Rocky / Salad) - Improved smoothing on the view model of the AWP
	(Lt. Rocky) - Fixed inverted vertex normals on the lens of the AWP
	(Lt. Rocky) - Fixed the flashlight not following the AWP's movement
	(Lt. Rocky) - Added phong to the view model materials
	(Salad) - Knife uses frying pan animations for third person attacks
	(Salad) - Reverted the Scout's gunfire audio back to the original CSS track
	(Lt. Rocky) - The AWP properly emits a muzzle flash when firing
	(Lt. Rocky) - Fixed a visual error where the SG552 appeared briefly unusable after reloading
	(Lt. Rocky) - Re-enabled mipmaps on view model textures
	(Lt. Rocky) - Re-enabled shell eject particles on view models
	(Lt. Rocky) - Knife swings in diagonal arcs

======================================================================================================
===== SURVIVORS ======================================================================================
======================================================================================================
	(Lt. Rocky / Porki-Da-Corgi) - Francis can now make vampires explode with his mind
	(Kerry) - L4D1 survivors have the same weapon preferences from the first game*
	(Kerry) - Fixed a bug where survivors would not use gestures on dedicated servers*
	(Rayman / Lt. Rocky) - L4D1 survivors have attachments to holster their melee weapons
	(Salad / Lt. Rocky) - L4D1 view model arms given improved apdatation to L4D2 skeleton
	(Lt. Rocky) - Cleaned finger weights and reduced clavicle size on Coach's view model arms
	(Salad / Lt. Rocky) - Adjusted illum position on all survivor 1st person models to a point closer to the weapon view models
	(Lt. Rocky) - Added jigglebones to Rochelle's jewelry in 1st person
	(Salad) - L4D1 survivors were given the additional weapon bones added in L4D2
	(Salad) - Fixed an error where Bill's scene files left him with a long pause of silence after speaking
	(Lt. Rocky / Salad) - Fixed a scene error where Nick would sometimes interrupt Coach and Ellis from speaking when he began speaking
	(Lt. Rocky) - Adjusted the scene files of the L4D2 survivors to point at a Special Infected they've spotted or when they've found ammo*
	(Lt. Rocky) - Fixed a flex controller error where Louis wouldn't blink
	(Salad) - Restored Francis' missing stereo controllers for blinking
	(Salad) - Smoothened Francis' normal map along his finger seams
	(Salad / Lt. Rocky) Removed an erroneous patch on Zoey's normal map, on top of her hands
	(Splinks) - Higher quality survivor icons
	(Splinks) - Removed ambient mask from Nick's hands
	(Lt. Rocky) - Reduced ambient mask on Zoey's hands
	(Salad) - Added missing scenes & facial animations for two Nick lines from the Passing
	(Salad) - Added jigglebones to Rochelle's earrings***
	(Salad) - Adjusted Rochelle's medkit attachment farther away from her body

======================================================================================================
===== SURVIVOR ANIMATIONS ============================================================================
======================================================================================================
	(Salad / Lt. Rocky) - (See Changelog Survivor Animations)

======================================================================================================
===== INFECTED =======================================================================================
======================================================================================================
	(Kerry / Lt. Rocky / Rayman / Salad) - Added L4D1 Special Infected models to spawn in the L4D1 campaigns*
	(Bronwen) - Modified Infected shader to support gibs with a standard set of textures*
		-$DISABLEVARIATION turns off all the diffuse variation features, allowing a bespoke diffuse map to be used
		-The new diffuse map's alpha channel can be used as a specular mask.
		-$BUMPMAP enables bump mapping, but only if shaders are on high
		-The bump map's alpha channel is used as the exponent map if it is enabled
		-If the bump map is not enabled, $DEFAULTPHONGEXPONENT is used
		-$BLOODPHONGEXPONENT and $BLOODSPECBOOST are still used
		-The burn detail mask is also disabled when variation is disabled (otherwise we'd have crispy skin texture all over the clothing)
	(Lt. Rocky / Rayman / Salad / Porky-Da-Corgi / Sergi338) - Added new Common Infected models
		-L4D2 Parachustist
		-L4D1 Hazmat zombies
		-L4D1 Construction workers
		-L4D1 Fallen Survivors
		-L4D1 Mudmen
		-L4D1 Riot cops (not used in stock maps)
		-Various new L4D1 common outfits
	(Kerry / Lt. Rocky) - The police zombie will now drop nightsticks*
		-Added new cvar "sv_infected_police_tonfa_probability" to control nightstick likelihood on new police zombies*
	(Salad) - L4D2 Boomer uses a new view model from the original character model
	(Rayman / Lt. Rocky) - Updated population lists with L4D1 sets containing L4D1 models
	(Salad) - Fixed an animation bug where the Witch was damaging incapacitated survivors at an inconsistent rate, doing less damage than intended.
		- Fixed a broken blood particle on the witch's attack
	(Lt. Rocky) - Added burn shaders to all Special Infected
		(Rayman / Lt. Rocky) - Added texture family to switch Hunter's material when set on fire***
	(Lt. Rocky) - South-To-North melee attacks will now apply the correct vertical or diagonal wound models
	(Lt. Rocky) - The riot cop Infected will showcase wounds from melee and chainsaw attacks
	(Lt. Rocky) - Added audio to the Tank's ladder climbing animations
	(Lt. Rocky) - Added ShinyBlood to material of both Hunter's to add phong to their blood overlays
	(Lt. Rocky) - Boosted Charger's rimlight closer on par with fellow Special Infected
	
======================================================================================================
===== PROPS & MATERIALS ==============================================================================
======================================================================================================
	(Salad) - The hissing noise made by oxygen tanks when shot will attract common infected
	(Lt. Rocky) - The forklift vehicle is now breakable for better accuracy with Tank punches
	(Lt. Rocky) - Reanimated the helicopter in the finale of Dark Carnival to properly fly over the buildings added post-release
	(Lt. Rocky / Salad) - Improved smoothing on Dark Carnival helicopter
	(Lt. Rocky) - Added skingroups to Dark Carnival and No Mercy helicopters
	(Sergi338) - Changed the surfaceprop of multiple geometry textures from "dirt" to "foliage"
	(Lt. Rocky) - Fixed a mesh error where the first Level of Detail model on the Crash Course howitzer was missing half the model with incomplete tire meshes
	(Lt. Rocky) - Fixed several tree materials lacking tree sway parameters
		-"materials\models\props_foliage\branch_city"
		-"materials\models\props_foliage\branches_farm01"
		-"materials\models\props_foliage\cedar01"
		-"materials\models\props_foliage\cedar01_mip0"
		-"materials\models\props_foliage\oak_tree01"
		-"materials\models\props_foliage\tree_deciduous_01a_branches"
		-"materials\models\props_foliage\trees_city"
		-"materials\models\props_foliage\trees_farm01"
			- Several models shared the tree material above, which also made them sway in the wind. As such, these models were recompiled with a new material that has no tree sway
				-"props_wasteland\rock_cliff01.mdl"
				-"props_wasteland\rock_moss01.mdl"
				-"props_wasteland\rock_moss02.mdl"
				-"props_wasteland\rock_moss03.mdl"
				-"props_wasteland\rock_moss04.mdl"
				-"props_wasteland\rock_moss05.mdl"
				-"props\cs_militia\militiarock01.mdl"
				-"props\cs_militia\militiarock02.mdl"
				-"props\cs_militia\militiarock03.mdl"
				-"props\cs_militia\militiarock04.mdl"
				-"props\cs_militia\militiarock05.mdl"
	(Lt. Rocky) - The metal railing on the urban street tree prop and it's size variants were given a different material with no tree sway
			-The "medium" and "small" variants were assigned the materials with the correct tree sway strengths
	(Lt. Rocky) Fixed several prop rocks with inaccurate collision meshes
		-"lostcoast\props_wasteland\rock_cliff02a.mdl"
		-"lostcoast\props_wasteland\rock_coast02a.mdl"
		-"models\props_wasteland\rockcliff_cluster02c.mdl"

	(Lt. Rocky / NF) - Lynched Charger prop was recompiled with a separate material from the player model, to prevent crashes with mods that randomize the Charger's textures
	(Salad / Lt. Rocky) - Fixed an oversight where the flashlight beam texture lacked clamps, which resulted in artifacting around the beam's edge
	(Salad) - Several miscellaneous vmt's (mostly Crash Course assets) point to higher-res textures found in Left4Dead2_DLC3's archive.
	(Lt. Rocky) - Fixed an oversight where cargo_container01.vmt (a material for a model that is tinted in certain maps) was not using a version of it's texture that had an alpha map nor it's envmap mask, and added $blendbytint and an $envmap to it
	(Lt. Rocky) - Added tint mask to utility truck model
	(Lt. Rocky) - Restored HL2 envmap on cardboard_boxes001a material
	(Lt. Rocky) - More accurate collision mesh for the lift holding the Crash Course escape truck
	(Salad) - Fixed a glass material (glass/urban_glass_03) that was missing the glass surfaceprop
	(Salad) - Cleaned up heavy compression artifacts on the diffuse of models/props_doors/offdra
	(Salad) - Fixed an error where door prop metal_door_112_noskins_dm03_01.mdl had a different material in one of it's damaged states
	(Lt. Rocky) - Added phong & basemap envmap to materials/models/props_doors/freezerdoor01.vmt
	(Lt. Rocky) - Added $nocull & $allowalphatocoverage to materials\models\props_interiors\patio_chairwhite.vmt
	(Salad) - Fixed an oversight where "signs/sign_warning_12" had no alpha channel
	(Lt. Rocky) - Added allowphotocoverage for better material sorting on police cruiser lights

======================================================================================================
===== MISC ===========================================================================================
======================================================================================================
	
	(Rayman) - Fixed a bug where the survivors could fire their weapon before the end of the intro cinematic in No Mercy
	(Salad) - Updated credits roll to include Bill's voice actor (R.I.P, Jim French) as well as the L4D1 face models and additional voice actors
	(Lt. Rocky) Added the golf club to The Sacrifice, Dead Air & Dead Centre
	(Lt. Rocky) - Added fireaxe to Death Toll melee list; certain spawners were requesting it
		-Likewise with the Frying Pan in regards to Crash Course
		-Added tonfa to all L4D1 maps, to support the cop zombie's new ability to drop the weapon
	(Salad) - Fixed a bug where L4D2's HLMV lacked a texture for ENV demonstration
	(Lt. Rocky) - Fixed a bug where the particles fire_truck and city_burning_effect used the wrong spritesheet

======================================================================================================
===== SUBTITLES & CAPTIONS ===========================================================================
======================================================================================================
	(Salad / Xanaguy / Sergi338 / VladFRY)

	- All subtitle_* files (L4D2, L4D2_DLC1, L4D2_DLC2) were merged into one giant file per language
	- Added missing DLC subtitles for the following languages (Some copied from L4D1 files, others sourced from uncompiled L4D2 files): 
	 > Czech
	 > Korean
	 > Korean A (?)
	 > Romanian (DLC1 translation is only about half-finished, but DLC2 translation appears complete)
	 > Simplified Chinese
	 > Thai (Everything appears incomplete but I guess it's more than there used to be)
	 > Traditional Chinese
	 > Turkish

	- Fixed incorrect subtitle colors for Louis and Zoey in Crash Course dialogue and incorrect color for Nick in The Passing dialogue
	- Corrected jukebox song names ("Midnight Riding" -> "Midnight Ride", "Bad Man" -> "One Bad Man", "Re Your Brains" -> "Re: Your Brains")
	- Added jukebox captions for "Save Me Some Sugar" and "All I Want for Christmas (Is to Kick Your Ass)"
	- Corrected several miscellaneous typos and inconsistencies (English only because seriously I can't speak any of the other languages)
	- Added exclamation points to L4D2 special infected death captions (i.e. "[Jockey Death]" -> "[Jockey Death!]") for consistency with L4D1 death captions
	- Created subtitles for placeholder "05_military" radio voices

	- Altered a bunch of subtitles to be more accurate to VO:
	 > All GrabbedBySmoker subtitles	(i.e. biker_grabbedbysmoker01a changed from "no, No, NO, NOOOOOOO!!!!!!!!!" to "No, no!")
	 > biker_worldsmalltown0511/512		"I hate boat lawyers" -> "I hate lawyers"
	 > Francis L4D1DLC2 generator
	 > NamVet_FriendlyFireFrancis
	 > Coach taunts				(taunt01, taunt03, taunt08)
	 > Coach_World02			"Oh yeah. Our goal is right next to the bridge, ON THE OTHER MOTHER F'IN SIDE OF THE RIVER!" -> "...OF THE WATER!"
	 > Teengirl incapacitatedinjury		"[Pain]AHHHHH!" -> "[Terrified yell]", for consistency with the other L4D1 characters)
	 > NamVet C6DLC3Creatures		All caps, added missing exclamation point to warncharger03
	 > manager_closethedoor03		"Lock the door, man" -> "Lock the damn door!"
	 > manager_tankpound04			WAV is a duplicate of tankpound03, but the subtitle was different
	 > All ScreamWhilePounced		i.e. manager_screamwhilepounced02 "GET IT GET IT OFF GET IT OFF!" -> "GET IT! GET IT! GET IT OFF ME, GET IT OFF ME!"
	 > Gambler_WarnJockey			Changed to all caps for consistency
	 > Biker_DLC2Intro07			"Hey. Sunshine Beams. We just CRASHED. ..." -> "Hey, Mr. Positive! We just CRASHED. ..."
	 > Biker_DLC1_C6M1_InitialMeeting06	"Hey! Are you a racecar driver?" -> "Can't! Generator's out."
	 > Properly capitalized Special Infected names (i.e. "Stop freakin' out the damn Witch.")
	 > Properly capitalzed "Army"

	- Applied the above color fixes and created merged L4D2_DLC1 and L4D1 subtitle files for the following UNSUPPORTED languages:
	 > Brazilian
	 > Bulgarian
	 > Greek
	 > Ukrainian

	- [Xanaguy] Changed the color of Bill's sacrifice "movie lines" to red to increase visibility
	- [Xanaguy] Changed the names of "Soldier 1" and "Soldier 2" to "Papa Gator" and "Rescue 7"
	- Created subtitles for dialogue from two community campaigns - Dead Before Dawn (COMPLETE) and Redemption II (Map 5 only)


*Requires L4D2 Beta branch
**Temporary or placeholder
***Work in progress

Notes:
-All higher res L4D1 textures and higher res survivor images were compressed from the source psd's. No changes were made, they were simply compressed at the resolution of the source files
-The hunting rifle no longer stores and references it's animations from it's .ani file (v_huntingrifle.ani). It is a waste of memory for an ani file to be referenced only by a single mdl. The ani file was nevertheless still updated for the few mods that actually do rely on it (mostly older ones from early 2010's). The vanilla hunting rifle should not be commiting the .ani file to memory anymore.

# SectionG
==[top](#Contents)==

### Survivor Animations Changelog

By Salad
	Weapon world model animations by Lt. Rocky
	Thanks to Splinks for help converting raw motion capture files


=== February 9 - v9 ===========
	
	- [ALL] Blended move animations into stationary melee attack animations to prevent survivors from sliding around
	- [ALL] Fixed incorrect hand rotation on chainsaw backwards limp run
	- [ALL] Adjusted calm idle noise layer so that calm idles would have a bit of lower body movement
	- [L4D1 shared] Created new chainsaw limprun by altering NamVet rifle limprun
	- [L4D1 shared] Fixed janky O2 limp run
	- [Teenangst] Added fidgets
	- [Teenangst] Adjusted idle noise layers so knees wouldn't lock so often on standing idles
	- [Teenangst] Fixed skeleton on DLC1 intro idle
	- [Gambler/Mechanic] Added new chainsaw idle
	- [Gambler/Biker] Added an old unused Idle_Rescue (trapped in closet) animation
	- [Gambler/Producer] Switched to Teenangst pistol shoot animation as it is more appropriate for these characters' stances
	- [Biker] Touched up rifle idle poses to prevent neck clipping through vest collar
	- [Coach] Added unused unique fidgets from raw mocap
	- [Producer] Added grenade idle, pistol run, calmwalk, calmrun
	- [Producer] Fixed up calm idles on rifle and elites
	- [Mechanic] Added grenade idles


=== March 7 - v10.1 ===========

	- [Biker/Manager/Producer/Mechanic/Coach] Fixed misaligned weapon magazines
	- [Coach/Teenangst/L4D1 Shared] Changed melee (fire axe/bat/frying pan) walk zero moves to fix weird legs when going from walk to idle
	- [ALL] Changed guitar walk zero moves to fix weird legs when going from walk to idle
	- [ALL] (Lt. Rocky) Assault rifles, sniper rifles and auto shotguns now visually cycle when firing
	- [ALL] Adjusted timing on reloading sounds
	- [ALL] Improved shotgun & pump shotgun reload loops
	- [ALL] Changed rifle crouchwalk zero moves to prevent snapping when going from crouch walk to crouching idle
	- [ALL] Changed IK rule on adrenaline use anim to lock the right hand to the right thigh, instead of locking it to the left hand
	- [ALL] Improved pounded-against-wall-by-charger animation
	- [ALL except Teenangst] (Lt. Rocky) Assault rifle reload animation now features an animated charger / bolt, a less janky magazine, and a smoother fade-out
	- [ALL except Teenangst] (Lt. Rocky) Sniper rifle reload animation now features an animated bolt and bullets in the magazine
	- [ALL except Teenangst] (Lt. Rocky) Created new animation for auto shotgun reload ending
	- [ALL except Teenangst] (Lt. Rocky) Extended auto shotgun shoot animation to smooth out ending
	- [Producer] Added bandage particles to "new" healing animation
	- [Producer] Adjusted finger, hand and weapon placement on rifle and elites idles, elites run & walk anims
	- [Producer] Redid rifle standing, running, walking and calm aim matrices to improve posture and fix twisted neck
	- [Producer] Redid elites standing, calm, running and walking aim matrices to improve posture
	- [Producer] Improved loop on military sniper limpwalk
	- [Teenangst] SMGs now visually cycle when firing
	- [Teenangst] Reworked C6M3 (The Passing) outro animation to use a new pose, and to accomodate Teenangst skeleton
	- [Teenangst] Now features a complete unique military sniper animation set
	- [Teenangst] Created crouching variant of Heal Friend animation
	- [L4D1 Shared/Teenangst] Created unique injured animations for melee weapons
	- [L4D1 Shared/Teenangst] Changed fall-from-charge-knockback animation to use L4D1 idle falling animation
	- [Coach] Altered auto shotgun animations so the right hand would hold the auto shotguns' pistol grips properly
	- [Coach] Added auto shotgun crouchwalk

	- [Producer] New animations:
	 > Pistol: Crouch idle, crouch walk, walk, limp run
	 > Grenade: Throw
	 > Military sniper: Calm idle, injured idle [CUSTOM]
	 > SMG [CUSTOM]: Idle, run, calm idle, calm walk
	 > First Aid [CUSTOM]: Idle, run

	- [Mechanic] New animations:
	 > Heal Incap Standing (raw)
	 > Heal Friend (raw)
	 > Incap to Standing (raw)
	 > Pounced to Standing (raw)
	 > Hit by Tank (raW)


=== April 18 - v10.2 ===========

	- [Mechanic]
	 - Reworked shotgun injured idle and limp run to look less jank
	 - Created shotgun aim matrices specific to running and walking for improved aiming
	 - Trimmed a few frames from Heal Friend, as to try and better fit the 5-second heal timer
	 - New animations:
	  > Shotgun: Walk, calm run

	- [Producer]
	 - Remade all remaining unique aim matrices for improved postures
	 - Altered elites, rifle, military sniper injured idles to improve postures
	 - New animations:
	  > Pistol: Limp walk
	  > Grenade: Injured idle, walk, crouch walk, limp run, ready-to-throw moves

	- [Gambler]
	 - Remade pistol idle standing aim matrix

	- [Coach]
	 - Edited Heal_Incap_01 to better fit the 5-second incap revival timer
	 - Altered grenade walk for less over-exaggerated arm movement

	- [L4D1 Shared]
	 - Added bandage particles to alternate crouch heal self animation
	 - Changed shared run anims on axe and chainsaw for variety's sake
	 - New animations [CUSTOM]:
	  > Bat: Idle, run, walk
	  > Axe: Injured idle, limp walk, limp run
	  > Frying Pan: Injured idle, limp walk, limp run
	  > Guitar: Injured idle, limp walk, limp run
	  > Chainsaw: Injured idle, limp walk, limp run

	- [Teenangst]
	 - Adjusted gas can pour animation for teenangst skeleton
	 - Changed shared run anim on guitar for variety's sake
	 - New animations [CUSTOM]:
	  > Axe: (ALL IDLES AND WALK CYCLES)
	  > Guitar: (ALL IDLES AND WALK CYCLES)
	  > Frying Pan: (ALL IDLES AND WALK CYCLES)
	  > Bat: (ALL IDLES AND WALK CYCLES)
	  > Chainsaw: (ALL IDLES AND WALK CYCLES)


===  August 14 - v11 ===========

	- [All survivors]
	 - [Lt. Rocky] Added slide movement to elites reload
	 - Survivors should now grip their weapons properly during gesture animations
	 - Changed blending style on several gestures for (usually) less stiff movement on right arm
	 - Added pump movement to (unused) M3S90 shoot animation (for a pump shotgun with pistol grip)
	 - Added IK ranges to all reload animations to keep hands aligned with moving parts when using modded survivors with unique proportions
	 - Added IK to all intro animations to keep hands aligned with pistol when using modded survivors with unique proportions
	 - Implemented foley for survivors switching weapons/items
	 - Removed minigun idle noise -- made the wonky IK on the hands worse

	- [All survivors except Teenangst]
	 - [Lt. Rocky] Fixed wonky shoulders on auto shotgun reload
	 - Created altered aim matrix and changed a weightlist to reduce jank level when looking around during auto shotgun reload
	 - Added "over here" gesture to Namvet, Biker and Manager
	 - Somewhat dejankified "over here" for L4D2 survivors
	 - Changed blending on a coughing animation that assumed the survivor in question was in the Namvet rifle stance that would look wrong with most other stances

	- [L4D2 Shared]
	 - Remade frying pan aim matrix again
	 - Fixed incorrect weapon_bone placement on Bat south limp walk and crouch idle
	 - Replaced altered pointLeft anim with L4D1 version -- L4D2 version was even faster than "pointLeft_quick"

	- [Biker/Manager/Producer/Mechanic/Coach]
	 - Fixed misaligned magazines during jump animations

	- [Gambler]
	 - New animations:
	  > Gas can: Run, walk
	  > Aim matrices: Pistol limp run, elites limp walk, elites limp run, rifle limp walk, rifle limp run, rifle calm idle
	 - Fixed incorrect frame on northwest run anim
	 - Improved pistol limp walk animations - north move now looks and aims straighter, south has less extremely-arched back, less jittery and awkwardly-placed legs, and a stable left hand
	 - Replaced elites limp walk animations with altered improved pistol limp walks, and created a new aim matrix to match
	 - Fixed hitch on left hand in elites north limp run
	 - Improved posture in elites south limp run
	 - Slightly improved pistol south limp run
	 - Corrected loop timing on diagonal limp walk animations
	 - Corrected improper bolt movement on sniper reload

	- [Producer]
	 - Fixed IK detaching on rifle run (again)
	 - Changed IK on bat idle from right-to-left to left-to-right
	 - Created unique aim matrix for SMG idle
	 - Created Producer-specific gestures file (gestures_producer.mdl) with corrected scale and unique "over here" and "gogo" animations
	 - Removed unique bat idle and run anims -- The set wasn't complete, there were some cases where the melee weapon would clip through her head, and I just wasn't that big a fan of the anims to begin with

	- [Mechanic]
	 - New animations:
	  > Grenade: Run, walk
	  > Shotgun: Walk
	  > Pistol: Unholster (teenangst, altered), Reload (namvet, altered)
	  > Elites: Unholster (teenangst, altered)
	  > Aim matrices: Rifle calm idle, rifle crouchwalk, pump shotgun crouchwalk, shotgun crouchwalk, SMG crouch idle
	 - Altered auto shotgun animations so the right hand would hold the auto shotguns' pistol grips properly
	 - Altered SMG animations so the gun would aim straight
	 - Fixed incorrect weapon_bone placement on c6m1 intro
	 - Fidget_Roll_Shoulders now blends more smoothly
	 - Converted part of an unused idle into a fidget
	 - Corrected aim matrix assignment on military sniper calm idle

	- [Teenangst]
	 - Adjusted the following shared animations for teenangst skeleton:
	  > Shoved (Bat, frying pan, chainsaw)
	  > Grenade launcher reload
	  > Cola deposit
	  > Ammo pack deploy / crouched variant
	  > Death / incap death
	  > Defib revival
	  > First aid / ammo pack / cola melee sweep
	  > Defib melee sweep
	 - [Lt. Rocky] Added bolt movement and loaded magazines to reload animations

	- [Coach]
	 - Remade elites idle aim matrix and fixed improperly placed weapon_bone on elites idle anim
	 - Fixed improperly placed weapon_bone and reduced overblown arm movement on grenade limp run
	 - Pants fidget is less likely to occur

	- [Coach/Mechanic]
	 - New animations:
	  > SMG: Reload (namvet, altered)
	 - Adjusted pistol jump animations to reflect Coach & Mechanic single-handed pistol animations

	- [Mechanic/Gambler]
	 - Changed rifle crouchwalk zero moves to prevent snapping when going from crouchwalk to idle

	- [MESHES]
	 - Adjusted weights on coach left thumb
	 - Adjusted weights on namvet thumbs
	 - Various revisions to L4D1 first person arm meshes and weights


=== September 5 - v12 FINAL? ===========

	- [All survivors]
	 - Lowered fps on sniper scope idle noise to give the illusion of survivors steadying their aim while using the scope
	 - Reverted all right-to-left IK back to left-to-right -- caused some weird bugs that were far more noticable than an occasional axe clipping out of someone's hand
	 - Minor improvements to one-handed melee stagger animations - fingers and weapon bone are now properly posed, fixed some wonky frames
	 - Changed blending on chainsaw startup animation to prevent arms going wild when doing anything other than standing still
	 - Improved blend-out timing on a cough animation

	- [All survivors except Teenangst]
	 - New animations:
	  > Aim matrices: Sniper walk, sniper crouch walk
	 - Tweaked pump shotgun shoot animation so the left elbow would be less likely to lock

	- [Gambler]
	 - New animations:
	  > Aim matrices: Pistol run, pistol walk, pistol crouch walk, shotgun standing idle, shotgun run
	 - Improved unique auto shotgun idle, calm idle, walk, run, removed crouch idle and crouch walk
	 - Edited the following to look less stupid: elites crouch idle, elites injured idle, elites crouchwalk, pistol crouch idle, pistol walk, all relevant aim matrices
	 - Changed calm aim / head movement matrix to compensate for typical Gambler posture
	 - Corrected idlenoise fps on military sniper crouch idle
	 - Changed blending on a shove animation to include lower body movement
	 - Edited a cough animation so the character wouldn't put his arm through his head

	- [Mechanic]
	 - New animations:
	  > Gestures: Point left, point left quick (namvet, altered)
	  > Grenade: Crouchwalk
	  > Aim matrices: Elites injured idle, elites limpwalk, elites limprun, pistol walk, pistol run, pistol crouchwalk
	 - Edited the following to look less stupid: elites injured idle, gascan injured idle, elites crouchwalk, all elites aim matrices
	 - Corrected idlenoise fps on military sniper crouch idle
	 - Cleaned up incap collapse -- shouldn't slide quite so blatantly anymore
	 - Fixed up finger poses on shotgun & pump shotgun animations

	- [Coach]
	 - New animations:
	  > Aim matrices: Rifle running, rifle standing, pump shotgun standing idle, pump shotgun crouching idle, smg walk, smg run
	 - Improved SMG run animations by pulling the gun and left shoulder further forward to minimize clipping
	 - Fixed incorrect weapon/hand/finger posing on SMG walk
	 - Fixed incorrect aim matrices on first aid limpwalk & limprun
	 - Made pants fidget much less common

	- [Producer]
	 - Cleaned up unique overhere / gogo gestures
	 - Adjusted some animations to fix clipping with certain weapons as a result of the weapon scaling being removed
	 - Swapped gambler frying pan injured idle out for mechanic equivalent
	 - Adjusted IK timing on pump shotgun shoot animation

	- [Teenangst]
	 - Changed blending on a coughing animation to match its equivalent on the other survivors
	 - Fixed another cough animation that wasn't working properly
	 - Adjusted some animations to fix clipping with certain weapons as a result of the weapon scaling being removed
	 - Fixed some animations where the character's feet were floating off of the ground (i.e. pistol idle)
	 - Moved fidgets to the end of the gestures ANI to (hopefully) mitigate issues with mods swapping survivor animations
	 - Fixed an issue where the right elbow would bend the wrong way during some fidgets if a fidget played while standing idle with a pistol
	 - Fixed a few animations (adrenaline use, charger stuff) being scaled incorrectly
	 - Adjusted adrenaline use anim for Teenangst skeleton

	- [Biker_Light]
	 - Added idle noise to biker_light

	- [Biker/Manager]
	 - Eliminated extraneous "idle" sequence from gestures

	- [L4D1 Shared]
	 - New animations:
	  > Aim matrices: Bat run
	 - Fixed thumb clipping on pump shotgun animations

	- [L4D2 Shared]
	 - Replaced pointleft_quick gesture with Namvet original - There's very little difference except the L4D2 edit sometimes causes some characters (coach) to lock their knees and briefly float off the ground
	 - Changed activity names on two previously-unused shove animation variants so the game would use them (which ones play on which survivors varies; this is intentional)

	- [MESHES]
	 - Gambler: Copied knee & elbow helper data from Namvet to fix issues with certain poses (pump shotgun crouch idle)
	 - Teenangst & Producer: Adjusted melee attachment
	 - Producer: Adjusted primary weapon attachment
	 - Coach: Corrected attachments for scale


[everything below this line is a MESS i'm SORRY]

======================================================================================================
===== (mostly) ALL survivors =========================================================================
======================================================================================================

	- Restored additional head tracking/aim/look layer from L4D1 -- results in more responsive and dynamic animations for looking around (Modders will find the head_pitch/yaw sliders in HLMV now work)
	- Removed Coach melee swing sounds from fire axe running attack
	- Replaced rifle reload sounds on grenade launcher reload animation with proper grenade launcher sounds
	- Fixed overly-snappy fade out on grenade launcher reload animation
	- Added shotgun pump sound to pump shotgun shoot animations
	- Cleaned up adrenaline use animation (left fist reopens, right arm motion is more fluid)
	- Added sounds to adrenaline use animation
	- Added missing clip locked sounds to all reload animations
	- Limp walk & limp run for bat, axe, frying pan and chainsaw now loop properly, and now use limping animations for diagonal & strafe anims
	- Footstep effects on many movement cycles are now more closely aligned with their animations
	- Fixed a bug where a character's feet would sometimes clip into the ground when landing after a jump
	- Adjusted some shared strafe-running animations to avoid characters' legs clipping through each other
	- Fixed a bug where some characters would have their right arm overextend when picking up items if they were holding an axe, bat, katana or golf club
	- Fixed a pump shotgun reload animation erroneously using an auto shotgun reload sound
	- Smoothed transitions from idle-to-moving and moving-to-idle for several weapons
	- Added footstep sounds to (unused?) Land_Injured sequence
	- Added footstep sounds to shoved (stagger / stun / stumble) animations
	- All reload animations fade in and out a bit more smoothly thanks to added spline blending
	- Added sounds to incap collapse and death animations
	- Added sounds to weapon-switching animations
	- Fixed strange overly-low crouch poses that could be seen occasionally when a survivor was starting or stopping a crouch walk with a rifle (most noticable on ellis)
	- Improved blending on melee weapon attack animations
	- Altered frying pan idle animations to correct awkward postures (particularly on the neck) and to increase idle motion
	- Fixed improper weapon_bone position on one-handed melee calm idle
	- Trimmed the beginning of the chainsaw shove animation to more properly sync up with the actual shove
	- Altered chainsaw shove animation so the left hand will maintain its grip on the chainsaw handle
	- Locked feet on incap idles and increased leg movement on incap idlenoise layer to compensate
	- Changed weightlist on dozens of move anims to improve blending between upper and lower body
	- Fixed up loops on guitar idles
	- Cleaned up janky guitar attack animation
	- Edited defib revived animation so you don't strike a chainsaw pose when returning from the dead
	- Fixed incorrect hand rotation on chainsaw backwards limp run
	- Adjusted calm idle noise layer so that calm idles would have a bit of lower body movement
	- [Lt. Rocky] Weapons now visually cycle when firing
	- [Lt. Rocky] Pistol magazines move on reload (single pistols only)
	- Blended move animations into stationary melee attack animations to prevent survivors from sliding around
	- Added a crouching variant of the Heal Friend animation
	- Changed guitar walk zero moves to fix weird legs when going from walk to idle
	- Remade frying pan aim matrix
	- Fixed incorrect weapon_bone placement on Bat south limp walk and crouch idle
	- Added pump movement to unused M3S90 shoot animation
	- Added IK ranges to all reload animations to keep hands aligned with moving parts when using modded survivors with unique proportions
	- Added IK to all intro animations to keep hands aligned with pistol when using modded survivors with unique proportions
	- Reduced jank level when looking around during auto shotgun reload
	- Adjusted timing on reloading sounds
	- Improved shotgun & pump shotgun reload loops
	- Changed rifle crouchwalk zero moves to prevent snapping when going from crouch walk to crouching idle
	- Changed IK rule on adrenaline use anim to lock the right hand to the right thigh, instead of locking it to the left hand
	- Improved pounded-against-wall-by-charger animation
	- Changed blending on gestures to reduce stiffness


======================================================================================================
===== Coach ==========================================================================================
======================================================================================================

	- Replaced a slew of reused NamVet animations with unimplemented animations from the game's official animation sources:
	 > SMG: Run, walk, calm idle, calm walk, calm run, crouch walk, injured idle, limp walk, limp run
	 > Rifle: Calm idle, calm walk, calm run
	 > Shotgun: Calm idle, calm walk, calm run, walk, crouch walk [All edited to use pistol grip]
	 > Pump Shotgun: Run, Calm idle, calm walk, calm run, walk, crouch walk
	 > Pistol: Calm idle, calm walk, calm run, crouch walk, walk
	 > Elites: Run, walk, calm idle, calm walk, calm run, [crouch walk]
	 > Grenade: Run, walk, injured idle, limp walk, limp run
	 > Chainsaw: Crouch idle, calm idle, injured idle (SHARED across all L4D2 survivors)
	 > Sniper: Calm idle [CUSTOM]
	 > Military Sniper: Calm idle [CUSTOM]
	 > Heal Incap Standing
	 > Heal Self Standing (L4D1 - unused)
	 > Incap to Standing
	 > Fidgets

	- Fixed spazzy arm on pistol and shotgun run animations
	- Fixed wild finger posing and jittery leg on SMG crouch idle
	- Fixed broken pistol crouch aiming caused by an aim matrix that was missing a frame
	- Fixed misaligned left arm on pump shotgun shoot animation
	- Fixed momentarily misaligned left arm on shotgun & pump shotgun reload end animations
	- Adjusted elites idle animation to make the left gun point straighter
	- Fixed bad aiming on military sniper injured idle caused by incorrect aim matrix
	- Bat calm idle is no longer a copy of regular idle and now works as it does on all other L4D2 survivors
	- Fixed finicky IK on rifle move anims
	- Fixed misaligned weapon magazines
	- Altered auto shotgun animations so the right hand would hold the auto shotgun grips properly
	- Changed melee (fire axe/bat/frying pan) walk zero moves to fix weird legs when going from walk to idle
	- Remade elites idle aim matrix and fixed improperly placed weapon_bone on elites idle anim

======================================================================================================
===== Gambler ========================================================================================
======================================================================================================

	- Replaced some reused animations with unimplemented animations from the game's official animation sources:
	 > Shotgun: Idle, calm idle, run, walk
	 > Gas can: Idle, run, walk
	 > Incap collapse
	 > Idle_Rescue (L4D1 - unused)
	 > Heal Self Crouching
	 > Aim matrices: Pistol limp run, elites limp walk, elites limp run, rifle limp walk, rifle limp run, rifle calm idle

	- Corrected aim matrix assignments on several animations:
	 > Pistol Idle Crouching
	 > Elites Idle Crouching
	 > Rifle Idle Crouching
	 > Rifle LimpWalk
	 > Bat Idle Calm
	 > SMG Limpwalk
	 > SMG Limprun
	 > Sniper Limpwalk
	 > Sniper Limprun
	 > Shotgun Jump
	 > Shotgun Jump 02
	 > SMG Injured Idle

	- Replaced horrible pistol calm aim matrix with shared rifle calm aim matrix
	- Altered shared calm aim matrix to replace repeated look-up-left frame with a proper look-straight-up frame
	- Added missing IK to standing pistol idle
	- Cleaned up loop on rifle limprun
	- Fixed minor hitch in military sniper limprun loop
	- Fixed misaligned weapon bone on all rifle crouch animations
	- Fixed finicky IK on rifle move anims

[to sort through]
	- Fixed incorrect frame on northwest run anim
	- Improved pistol limp walk animations - north move now looks and aims straighter, south has less extremely-arched back, less jittery and awkwardly-placed legs, and a stable left hand
	- Replaced elites limp walk animations with altered improved pistol limp walks, and created a new aim matrix to match
	- Fixed hitch on left hand in elites north limp run
	- Improved posture in elites south limp run
	- Slightly improved pistol south limp run
	- Corrected loop timing on diagonal limp walk animations


======================================================================================================
===== Mechanic =======================================================================================
======================================================================================================

	- Replaced some reused NamVet animations with unimplemented animations from the game's official animation sources:
	 > Shotgun/Pump Shotgun (shared): Idle, calm idle, crouch idle, injured idle, walk, crouch walk, calm walk, calm run, limp walk, limp run (COMPLETE SET)
	 > Heal Incap Standing
	- Adjusted shotgun and pump shotgun firing animations to avoid clipping with abdomen on new idle
	- Fixed weapon clipping on bat calm idle caused by incorrect aim matrix
	- Fixed misaligned left arm on pump shotgun shoot animation
	- Fixed momentarily misaligned left arm on shotgun & pump shotgun reload end animations
	- Fixed misaligned weapon magazines
	- Changed left hand IK on pistol crouch idle to stick to the left knee instead of the right hand
	- Removed left hand IK from pistol calm idle (RIP Ellis Crotch Grab)
	- Changed aim matrix on frying pan standing idle for cleaner aiming
	- Altered auto shotgun animations so the right hand would hold the auto shotgun grips properly


======================================================================================================
===== Producer =======================================================================================
======================================================================================================

	- Replaced some reused animations with unimplemented animations from the game's official animation sources:
	 > Pistol: Idle, run, walk, calm idle, calm walk, calm run, crouch idle, crouch walk, limp walk, limp run (COMPLETE SET)
	 > Grenade: Idle, run, throw, injured idle, walk, crouch walk, limp run
	 > Shoot: Pistol (teenangst), rifle
	 > Incap collapse (teenangst)
	 > Incap idles (teenangst)
	 > Incap to Standing
	 > Heal Self Standing (L4D1 - unused)
	 > Military sniper: Calm idle, injured idle, injured zoomed idle [CUSTOM]
	 > SMG [CUSTOM]: Idle, run, calm idle, calm walk
	 > First Aid [CUSTOM]: Idle, run
	
	- Remade all unique aim matrices to improve postures
	- Corrected aim matrix assignments on several animations
	- Replaced generic noise on rifle and elites calm idles with unimplemented unique idle animations
	- Fixed weapon clipping on bat calm idle caused by incorrect aim matrix
	- Removed left hand IK from pistol injured idle
	- Fixed misaligned weapon magazines
	- Fixed finicky IK on rifle move anims
	- Adjusted finger, hand and weapon placement on rifle and elites idles, elites run & walk anims
	- Improved loop on military sniper limpwalk
	- Altered elites and rifle injured idles to improve postures


======================================================================================================
===== SHARED: L4D1 Males - Namvet / Biker / Manager ==================================================
======================================================================================================

	- Changed aim matrix assignments on several run/limprun/limpwalk animations and on shotgun jumps for improved aiming animations
	- Restored missing incap collapse animation
	- Melee weapon idle animations now look more like L4D1 idles
	- Bat idles now work (see above)
	- Created new animations for the military sniper by altering NamVet rifle animations, to better match the rest of the L4D1 survivors' animations
	- Created new injured gascan idle (to replace the duplicated standing idle) by merging gascan aim matrix with injured pistol aim matrix
	- Made hand/finger poses consistent across all gas can animations
	- Adjusted shotgun crouchwalking aim matrix to prevent right arm clipping into body when aiming to the right
	- Added a missing bone that is necessary for the grenade launcher reload animation
	- Added idle noise to DLC1 outro animations
	- Fixed janky O2 limp run
	- Created new chainsaw limprun by altering NamVet rifle limprun
	- Changed melee (fire axe/bat/frying pan) walk zero moves to fix weird legs when going from walk to idle
	- Added bandage particles to alternate crouch heal self animation


======================================================================================================
===== Biker ==========================================================================================
======================================================================================================

	- Rifle animations...
	 > Fixed weird legs when aiming
	 > Fixed broken sniper walk animation caused by overridden shared rifle animations
	 > Added missing IK
	 > Fixed misaligned magazine
	  -> Still seeing this on a custom model that uses these rifle animations? Add weapon_bone_clip to your definebones.
	 > Created walk, crouch idle and crouch walk animations to complete the animation set
	 > Touched up idle poses to prevent neck clipping through vest collar
	- Switched Idle_Rescue animation out for an old unused one for comedy
	- Fixed misaligned weapon magazines


======================================================================================================
===== Manager ========================================================================================
======================================================================================================

	- Rifle animations...
	 > Fixed weird legs when aiming
	 > Fixed weird-looking run anims on pistol, SMG, sniper caused by overridden shared rifle animations
	 > Added missing IK
	 > Fixed foot rotation on idle
	 > Fixed misaligned magazine
	  -> Still seeing this on a custom model that uses these rifle animations? Add weapon_bone_clip to your definebones.

	- Removed unique rifle animations
	- Fixed misaligned weapon magazines


======================================================================================================
===== Teenangst ======================================================================================
======================================================================================================

	- Restored missing frying pan injured idle
	- Fixed strange calm & injured idle poses caused by incorrect aim matrix
	- Removed alternate death pose that wouldn't sync up with defibrillator revive
	- Fixed bugged grenade launcher reload animation
	- Fixed C6M3 outro ending too early
	- Bat calm idle is no longer a copy of regular idle and now works as it does on all L4D2 survivors
	- Fixed rifle reload animation ending too early (Animation was modified to slow down bolt pull and add on to the ending)
	- Fixed out-of-sync bolt pull SFX on SMG reload animation and improved fade-out
	- Replaced a few unused sequences with some L4D2 campaign intro animations -- consider this a mapper's resource
	- Melee weapon idle animations now look more like L4D1 idles
	- Changed aim matrix assignments on several run/limprun/limpwalk animations for improved aiming animations
	- Added fidgets
	- Adjusted idle noise layers so knees wouldn't lock so often on standing idles
	- Weapons now visually cycle when firing
	- Created new animations for the military sniper by altering Teenangst rifle & shotgun animations, to better match the rest of the L4D1 survivors' animations
	- Created new animations for melee weapons by altering various Teenangst animations

# SectionH
==[top](#Contents)==

### Talker Changelog

- The L4D1 survivors will now say special incapicitated lines after leaping off the bridge (after the bridge leap line plays) regardless of whether or not they successfully restart the generator.

- Any L4D1 survivor who goes down after the Bridge Leap line will NOT constantly shout for help regardless if the generator has been restarted.

- All Survivors will now be able to shout unique "Help me!" lines whenever they are incapicitated. What lines they say depends on how much bleedout health they have. Additionally, "Help me!" lines will no longer be spammed whenever a survivor is downed. (Currently for the L4D2 survivors)

- Survivors are more likely say "Thanks <Name>" whenever they are either revived or has recieved an item from someone. They will also respond with a "You're Welcome, <name>" at a 30% chance (50% for generic and Hotel sets).

- Changes to conversational sequences in intros of L4D2 campaigns.

- Survivors should now be more likely to comment on certain info_remarkables whereas it was otherwise near-impossible.

- L4D2 survivors are less likely to use generic "through here!" lines whenever they approach certain info_remarkables.

- L4D2 survivors will also have specific Safehouse transitioning lines for certain maps. (Removed other instances of certain info_remarkables to prevent those lines from repeating)

- L4D2 survivors will now have specific "Near Finale" dialogue lines for each official campaign. 

- L4D2 survivors will rock out to the concert finale if their hard health is above 40.

- L4D2 survivors may also say something whenever another survivor teamkills someone.

- Survivors will use specific "I'm sorry" quotes (Blaming themselves) after they have attacked a teammate.

- Survivors will no longer say that they need to heal when they are pulled up from a ledge. (After that survivor has been downed once without healing)

- Certain survivors will now accurately spot applicable weapons as their archetype.

- Ellis will now share a story about Keith during The Passing's Chapter 2 starting saferoom and before the finale starts on Chapter 3.

- Threw out all grouped checks for optimization. 

- The finale conversation between both groups of survivors will now have a fair chance of playing (Whoever is the intro actor will have a priority over others, but the more uncommon of those will still play)

- Fixed Francis never having the first say in the outro of The Passing.

- Other outros for The Passing will now also have a fair chance of playing. All conditions set up for them will still have to be met.

- Whenever a Charger is harassing Nick, Zoey, on The Passing, may make a remark about it.

- Fixed L4D1 survivors not responding to Nick thanking them when running to the car.

- The L4D2 survivor who pushes the elevator button will now be able to comment before the finale starts.

- Survivors will no longer sound their lost calls if they are the only survivor alive.

- Ellis will have a delayed reaction to realizing that Jimmy Gibbs is no longer present at the mall.

- Whitaker will have an intro whenever a survivor enters the gunstore.

- L4D2 survivors will have specific NearFinale and NearCheckpoint lines for official maps.

- Nick and Ellis may occasionally make remarks on The Parish: Bridge and have Tank Specific lines. - Coach and Rochelle have a unique GoingToDie line for the Bridge chapter - Coach will have a very special line to say when he's B/W and reloading with the Tank Present. 

- All survivors will have a different way of starting the conversation with the Soldiers if the conversation goes on long enough.

- Ellis may point out that the soldiers are talking about them when Soldier 2 mentions "flashes on the west bank".

- L4D2 survivors will occasionally express that they are rocking out during the concert finale. Their hard health must be above 40.

- L4D2 survivors will also have tank specific lines during the concert finale.

- Ellis may question why the boat is taking so long during the finale of Swamp Fever.

- All The Passing Chapter 1 intros have a fair chance of playing.

- Reactions to Ellis' stories will depend on the chapter. Additional reactions if interrupted early by leaving the saferoom.

- Francis will FINALLY be able to say that he's found boat. Even if it is a car... (Note: Bill or Louis must be the one to get the first line in the intro.)

- Optimizations for multiple points of interests that provoke the same response. (Stepping out of the gasstation on Hard Rain chapter 3 is an example)

- L4D2 Survivors will no longer have any speech errors depending on who the Jockey rides: "That ain't right for a man to be ridden like that."

- Survivors reaction to someone dying will reflected by how many survivors remain alive. (On another note, survivors will no longer call out other survivors by name when they die)

- Definitive fix for Nick never saying any of his Witchville lines. (They work on the same "I hear a Witch" set up, but only if the survivors progress far enough into the map)

- Nick or Rochelle is guaranteed to tease ellis if they spot the wedding first (if Zoey is in the intro of The Passing and if Ellis is alive at the time)

1/20/2020

- Improved conversations for the L4D1 survivors, and fixed things not properly addressed when ported to L4D2.

- Ellis and Louis Should now have something to say when picking up a knife.

- Louis will now say that the Tank kill is for Bill when the Bill is no longer alive.

- Improvements for spotting the safehouse and entering the finale area for the L4D1 survivors

- Possibly Fixed L4D2 survivors never saying "I hear a..." Lines for SI other than the Hunter, Jockey, and witch

- Fixed L4D1 survivors never saying their special incapicitated lines on The Sacrifice: Port

- L4D1 Survivors will not say anything upon restarting the generator on the Sacrifice port. Nor will they say anything upon the generator being successfully restarted. (To clarify: This prevents their Pain related lines from sounding as they are meant to take damage upon restarting the generator. Their incapicitated lines do not count)

- L4D1 Survivors will now be able to Call out certain weapons by their archetype

- L4D1 survivors will now have appropriate lines to say when picking up the other weapons of the same archetype (Silenced SMG, AK Rifle, etc.)

- Nick will now use his C1 SurvivorMourning lines for both Chapter's 1 and 2 of Dead Center

- L4D2 survivor quiet "reloading" lines will now only play on Hard Rain Chapter 2 (Players must enter WitchVille)

- L4D2's "Hurry up" lines will be quieter in Hard Rain Chapter 2 (Players must enter WitchVille)

- Added an extremely rare intro for DeathToll that is a reference to a popular internet series.

- L4D1 survivors will now have reactions to the Witch Chasing them, the same goes for the moment she gets startled.

- L4D1 survivors will now react to picking up melee weapons, M60, and Chainsaw.

- All L4D2 survivors should now have friendly fire lines whenever the tank is present.

- L4D1 survivors now have proper "HELP" lines when incapicitated.

- Certain L4D2 survivors will have map specific reactions. Also improved early interruptions via leaving the checkpoint.

- L4D1 survivors will now comment on grabbing a gascan and starting a scavenge round.

- L4D2 survivors will have special ScavengeStart lines when starting a round on the Atrium map.

- ScavengeStart Lines should have a 30 second cooldown.

- Cleanup of duplicate rules that results in the same weapon pickuplines regardless of whether or not they're in the saferoom.

- Survivors should now say something when picking up adrenaline, defibrillators, and VomitJars.

- Every item picked up (Except for the M60 and Chainsaw) will have a 30% chance of firing a voiceline. This includes any CSS Weapons. (They will NEVER fire in the starting areas of each level for the sake of intros being uninterrupted. Certain L4D2 instances are exempt. And they will never sound when the survivors reach the end saferoom, no exceptions.)

- Adressed an issue where the map check for Crash course prevents its intro from playing.

- Louis will have a 2% chance of saying something whenever picking up any css weapon.


1/24/2020:

- Fixed certain survivors deathscreaming whenever someone else dies.

- Fixed Reloading instances so that tank instances are guaranteed to play whenever a tank is active.

- Fixed map specific tank kill lines never playing if you are speaking when you get the kill (Results in the generic tank kill line)

- Optimization and cleanup.

- Fixed survivors not complaining about the crows in The Sacrifice Chapter 2. (Problem originally created during Optimizations and cleanup)

- Fixed multiple The Sacrifice intros playing at once.

- TankKill lines should no longer sound generic Kill confirmation lines.

- All L4D1 Non-Tank Kill confirmation lines will have a 40% chance of playing

- Survivors should now be silent when restarting the generator on The Sacrifice.

- L4D1 survivors will now also remain silent when taking considerable damage AFTER they have jumped off the bridge. (This is to refrain from interfering with their special incapicitation lines.

- L4D1 survivors should now have proper "HELP" lines when incapicitated. (They will still remain silent on The Sacrifice after someone leaps off the bridge)

- Gave the soldier on Blood Harvest one extra possible line to say before anyone touches the radio.

- Soldier 1 will now nag survivors to enter the chopper on The Parish - Bridge (Requires provided scenes.image)

- Improvements to the gunshop scenario.

- After the gunshop, Rochelle will sound a new set of SI kill lines signifying her enjoyment of firearms. It will work for all SI except for the Tank, and there is no distance requirement. She will not say anything when killing an SI before this event. This will only be for Chapter 2 of Dead Center.

- Fixed errors when suggesting that Ellis uses his first aid.

- Corrected certain map requirements on transitions.

- Fixed Nick and Ellis saying Gunshop weapon pickup lines after pressing the gundoor button.

- All gun shop weapon pick up lines will not sound if Nick, Ellis, or Rochelle picks up a... Molotov, First Aid Kit, Ammo, Pipe Bomb, VomitJar, Pills, Adrenaline, or the Laser Sight upgrade.

- When in the gunshop, Rochelle will be indecesive about what gun she should take/use for the next five weapon pickups. 

- L4D1 Survivors will now be able to say their FinaleTriggered lines on Blood Harvest.

- Fixed Coach calling Nick by name before using the elevator on the Hotel map.

- L4D1 Survivors should now call to get to the farm house from a farther distance.

- Francis should now be able to more easily comment on the radio on Blood Harvest.

- Thanks to Rayman1103's finale scripts, L4D1's finales for No Mercy, Death Toll, Dead Air, and Blood Harvest will now properly time their vehicle intransit lines. (While I do plan to change what lines are said, there are a few things missing that I need in order for the complete version to work)

- Fixed an error in the Dead Center Chapter 4 intro not continuing.

- Perfected the elevator conversation's potential.

- Moved Coach's Jimmy Gibbs zombie line to a potential C1M4 Finale start line, Rochelle or Ellis will reply to that.

- Ellis will now have more things to say he gets the C1M4 Finale Start line. He will also have one extra line when filling the car with gas.

- Fixed an error regarding a certain Elevator Hello sequence not playing entirely.

- Improved interactions when survivors pick up the first weapon on the roof of The Vannah. Additionally, survivors will no longer be able to sound those lines if they haven't already when they remark on the first zombies.

- The survivor who picks up the first weapon at the roof of The Vannah will no longer be able to say their line if the item they picked up is... A first aid kit.

- The L4D2 survivor who gets the first SI kill at The Vannah will be the one who makes the reaction (The reaction will depend on if the first kill is by a firearm or melee weapon. Melee victims CANNOT be: Tank, Boomer, Smoker. And some lines have been moved around as a result of this change.)

- Nick's Hard Rain GoingToDie lines will no longer play on custom campaigns that uses Hard Rain's mission/campaign file.

- Nick's The Parish GoingToDie ("I am not going to die in this city") will now no longer check for "l4d2_5" and will instead sound on Chapters 2, 3, and 4 of that campaign.

- Nick's The Parish GoingToDie ("I have not... come this far... to die now...") will now only be played on The Parish's Bridge chapter.

- L4D2 survivors will no longer say their standard killconfirmation lines in The Vannah. Everyone but Rochelle will resume doing so in the next chapter.

- Coach will have a 1% chance of triggering a Gmod Idiot Box Easter Egg whenever he kills a Jockey on Dark Carnival Chapter 4.

- Fixed an error on the intro of Dark Carnival Chapter 3.

- Fixed L4D2 survivors identifying healing items and throwables as weapons.

- Fixed Ellis calling out survivors by name via friendly fire lines whenever fellow teammate attacks him at The Vannah.

- Ellis asking Nick if he remembers running on the Screaming Oak has been moved to a possible remark made in the middle of the Bayou on Swamp Fever Chapter 1.

- The survivor who is about to push the witch over the edge should no longer warn others about pushing the witch over the edge.

- Fixed the first set of survivor nags not playing (before picking up the radio on The Parish - Bridge, whilst not broken in vanilla, one slight change I've done earlier ended up breaking it.)

- L4D1 survivors will now say their Nice Shot lines to Bill should he kill an SI.

- There is a 30% chance for a special conversation to happen after killing the tank on Dead Center: Streets.

- After restarting the generator on The Sacrifice, the survivor who goes down as a result will no longer have their final line interrupted by their playerhelp calls when incapped, even if they are blank. (They will still keep the survivor silent should they fail to restart the generator).

- The remaining three L4D1 survivors (Francis, Louis, and Zoey.) Will no longer complain when letting go of the generator button on The Sacrifice when the generator is supposed to be restarted. (Originally meant to be played only in Crash Course)

- Fixed some errors in The Sacrifice's Chapter 3 intro not completly playing.

- The AC130 Pilot should now be able to warn the L4D1 survivors of the wave following the first tank's death.

- Fixed Zoey, Louis, and Francis not having any reaction to the witch initiating her aggro toward them.

- Each L4D1 survivor has a chance to say the first "Get to the bridge" line on The Sacrifice. A nag will initiate after and will stop once the Bridge button has been pressed.

- The L4D1 Survivor that presses the Bridge button on The Sacrifice will say the next line prior to the generator breaking.

- The AC130 Pilot should now be able to alert the survivors about the horde shortly after the first tank's death. (This is no longer a plane intransit instance, but more of a MegaMobWarning after the first tank dies.)

- The L4D1 Survivors have a 60 second cooldown for calling out a specific survivor getting pounced by a hunter (once sounded)

- Revised the timing of the AC130 Pilot's lines when triggering the finale so it's not instantaneous. He will always say "Hold em off for me while I fuel up." the moment the finale starts.

- L4d1 survivors should now use proper sorry lines after attacking a teammate.

- Fixed Ellis KillSteal instances.

- L4D2 survivors will now properly respond to startling the witch bride.

- Fixed StartDry point on Swamp Fever's Chapter 2. (This fix was done with a _commentary.txt change.)

- Fixed Rochelle never commenting on the bathtub with Ellis close by (This fix was done with a _commentary.txt change.)

- Three points of interest changes on Dead Center Chapter 2 (Requires the _commentary.txt file for that particular map)

- Improved conversations and points of interests on Swamp Fever.

- Optimizations for conversation.txt

- Fixed instances of suggestions to heal being spammed when Coach is injured.

- Improved Whitaker interactions during his cola errand. He will also comment when a survivor goes down before delivering his non-diet cola.

- Elevator Intros should now by fully compatible for any circumstance (Note: There is no intro if there is only one survivor remaining)

- Fixed SurvivorDied instances firing with the incorrect # of survivors alive (They will now react properly)

- Fixed SurvivorDied instances for certain two survivors being the only ones alive.

- Fixed survivors not saying anything when equipping lasersights. (Thank you, Rayman1103 for pointing out this typo.)

- Fixed Louis not calling out an MP5 as a Machinegun

- Survivors should no longer call out prop weapons (Gascan, firework crates, propane tanks and oxygen tanks) as weapons.

- L4D2 survivors will now have something to say for any scavenging instance when they need to secure 20 more gascans.

- YouAreWelcome responses will now use FromIs to ensure accuracy.

- Survivors will now thank the person who shares an item with them (Pain Pills, Adrenaline)

- Whoever rescues a survivor via rescue closet will now voice a line.

- Fixed Zoey never saying the SMG Pickup line when she picks up the unsilenced SMG.

(For Lt. Rocky)

- Moved both Rochelle's EntranceSign remarks to two chapter 1 points of interests.

- Readjusted some responses for certain points of interests in The Fairgrounds so it wouln't be as repetitive.

- Survivors are now guaranteed to trigger their special reloading and lookout lines while the concert is live, however, only one survivor is able to do so at a time within (at least) 20 seconds of each other. During this cooldown period, Reloading and lookout instances will only result in a blank response (health factor still applies).

2/6/2020:

- Fixed an issue where the survivors (nick mostly) would call out the saferoom twice on The Passing: Bedlam

- Cleanup of non-existant responses

- When startling the witch, survivors should no longer sound their witch chasing lines upon the moment they startle her.

- All L4D2 survivors will have a unique line when startling the witch bride.

- Fixed L4D1 survivors somehow never commenting on the train car containing the tank (After killing the tank)

2/7/2020:

- Cleaned up duplicate lines from Jockey related instances.

- "Filled in some missing blanks" on The Sacrifice (Voicelines of a different variant/tone)

- Fixed The Sacrifice related intros where "Any" should have been "self" instead

- L4D2 Survivors may react to certain things with "What?"

- Improved "I hear a witch" instances.

- Improved Ellis' and Rochelle's reaction when the bridge gets destroyed on The Parish Chapter 3.

- Fixed an issue where both Nick and Ellis were to say their leaving saferoom lines on The Parish Chapter 5 after the other has answered the radio.

- All survivors are now able to trip the offhighway point of interest from the same distance.

- Improved certain gravenags on The Parish Chapter 3.

2/8/2020 

- Ellis will no longer say anything when being the first on the freeway in The Parish Chapter 3.

- Got rid of non-existant contexts for c5m3onbridge

- Fixed an issue regarding c5m3bodies being impossible to activate.*

- Improved the interactions for C5M2People*

*(Survivors will make the conclusion in Chapter 3, Coach will never jump to conclusions in Chapter 2)

- Fixed Ellis calling out the safehouse twice on The Parish Chapter 2

- Thanks to .lmp files provided by Rayman, the L4D2 survivor who opens the Save4Less store doors will sound their "C1M2AlarmDoor" line. The L4D1 survivor who unhooks the Train in Blood Harvest Chapter 3 will also say their TrainUnhooked line.

- Fixed bridgedown instance on Blood Harvest Chapter 3.

- For testing purposes, all PlayerHelp (while incapped) cooldowns are now halfed

- Thanks to Rayman's watchful eye, Zoey will now be able to scream when getting pounced by a hunter.


2/10/2020

- L4D2 survivors will now have ReviveMeInterrupted instances. They will be Hurt<> sounds which will depend on the player's bleedout health. (They should be timed to play when the survivor hits the floor again)

- Fixed L4D1 SurvivorDied Instances, now, only one survivor is able to say something at a time. (Additionally, L4D1 survivors will no longer say "It's just you and me left" when it comes to The Passing's Port Finale.)

- L4D2 survivors will now have SurvivorBotNoteHumanAttention moments. Also improved L4D1 SurvivorBotNoteHumanAttention instances. (For non-battlefield instances, the response will fire when in the start area in each chapter.)

- L4D1 Survivors will say something upon pouring a gascan in the objective and securing the last can needed to finish the Scavenge Round.

- L4d1 survivors will now have a 50% chance of saying their reloading lines regardless if the survivor is on Team 2 or Team 4.

- L4d1 survivors will never say their generic "reloading" lines whenever a tank is present and active on the map.

- Added one extra applicable line to Whitaker.

- L4D1 survivors now have something to say when spotting Adrenaline, Defibrillators, Upgraded Ammo Packs.

- L4D1 Survivors will now have a 50% chance of saying something when picking up a laser sight.

- L4D1 survivors will now be excited when using the Chainsaw.

- Fixed an issue where Bill will say his generic NearFinale line on Blood Harvest

- Fixed an issue where Zoey will say her Generic NearFinale line on Dead Air


2/11/2020 

- Fixed an issue where Nick never calls out SMG's and sniper rifles.

- Fixed an issue where Louis will never issue the proper apologies after attacking a teammate.

- L4D1 survivors will now have something to say when starting the van on Dead Air Chapter 4.

- Fixed a broken criteria regarding Manager's (Louis) status (Is alive? Is dead?)*

*This will also fix any instances that requires that Louis be alive. (Not "Who")

- Zoey will use her hurry up lines instead if Louis is dead before reaching the safehouse on Dead Air Chapter 4.

- Fixed issue with Coach triggering C5M2People and C5M3Bodies which uses the same response.

- Fixed Louis using Bill's lines when spotting L4D2 items.

2/12/2020

- Survivors will no longer call out the Witch when she is startled

- Improved the contexts needed for teamkill lines to be sounded.

- Nick will no longer say "At least I made it" if he is not the only one alive (CloseTransition)

- Switched from "ConceptWitchStartAttack" to "IsFaultConcept + WitchHarassment" (No change of the lines)

2/13/2020

- All survivors will use their suggestions to use a first aid kit when the entire group has been out of combat for more than 20 seconds to prevent spamming. (They must also not be speaking)

- The contexts that are applied when calling for Virgil (Plantation) and reaching out to the two soldiers (Bridge) will now be identical. (Optimizations)

- L4D2 survivors will no longer call out survivors by name suggesting that they heal with a first aid at The Vannah.

- Fixed an issue where Ellis will never start the intro in Liberty Mall's Atrium

- Fixed an issue where Nick still has an odds factor when it comes to reloading while the tank is present.

- Moved two of Rochelle's Tank Reloading lines to being Dead Center - Chapter 2 exclusive

- The survivor who presses the button on the tower in The Parish - Chapter 2 will be the one to declare that the alarm has been disabled.

- The alarm related lines for the Gauntlet on The Parish - Chapter 2 will now rely on a single context. (Optimizations)

- L4D2 survivors will sound their gauntlet reloading lines (as long as a tank isn't active) on The Parish - Chapter 2 regardless if Nick is alive or dead.

- Ellis will now say his manhole story about Keith when reaching the Manhole on The Parish Chapter 3

- Fixed and improved C2M1DoneFalling.

- Moved C2M1Searchlights to the wrecked semi, so that survivors can now comment on it from the bridge. (New _commentary.txt, survivors on the main road will have to move in closer in order to spot it.)

- Renamed "c2m1searchlightsa" to "c2m1searchlights"

- If Nick finds Bill's corpse, then uses the "Look!" vocalizer to call out Zoey or Francis, a short conversation will initiate.

- Zoey will use her "Get to your car, Ellis." under the same concept as the generic set (Note: From has to be Mechanic)

- The Rayford Under the River tour sign is now a remark point for survivors after the intro concludes (Cannot leave the starting area).

- FriendlyFire responses should be "NoResponse" to prevent voicelines from being interrupted.

- Transitions should now be more accurate based on the speaker's intensity, and how many players are alive.

2/14/2020

- Concert Reloading and lookout lines during cooldown will be "NoResponse" instead of blanks to prevent any voiceline interruption

- WitchGettingAngry and Witch chasing lines will no longer play on The Passing - Chapter 1 and Hard Rain - Chapter 2 (Important tip for talker developers. NEVER use a group check that involves "!=" or else that group check will be broken by definition)

- The survivor who opens the alarmed doors or breaks the window in Liberty Mall will be the one to shout their "Turn off the alarm!" line. (The lines will have a half-a-second predelay.)

- The survivor who reaches the security switch first in Liberty Mall will be the one to declare that the alarm has been disabled.

- Got rid of a ton of duplicates in orator.txt

- All survivors will have a reaction to the Howitzer destroying the barricade. (This will happen even if the map is in survival mode)

- Bill will now say something for when the fire dies out on Crash Course - Chapter 1

- All L4D1 survivors will have a separate reaction when failing to restart the generator on Crash Course (letting go of the button)

- All Survivor Pains on The Sacrifice after someone jumps off the bridge will result in "NoResponse" instead of blanks to prevent voiceline interruptions.

2/15/2020

- Rochelle will now ask if anyone knows how to make a Hurricane and explain that it's a drink.

- The Sacrifice's Generator criteria are now converted to counters instead of setting a value (No real change)

- Nick should now reply to Rochelle when she asks if Nick is meeting some other friends. (The Vannah)

- Fixed an issue where Louis will never sound his Howitzer response.

- L4D2 survivors will no longer sound character specific (general) friendly fire lines whenever there's an active tank somewheres on the map.

- Fixed an issue where Francis will never sound a special MegaMob Warning on Crash Course - Chapter 1

- Francis will now issue a response to himself when he sees the sign stating "I hate Mondays."

- Overhauled C5M4's airstrike reactions*

*(The proper context is in counter form [uses less criterions overall], uses less concepts with one extra context requirement, less response tables used in orator.txt, survivors make the proper reactions if they witniss the airstrikes from either indoors or outdoors [Outdoor reactions do not add to the context's counter and will be guaranteed to play when fired])

*(When the survivor reacts, the airstrike counter should go up by one. This is to prevent the reactions under constant airstrikes from sounding too soon. The orator for the first two C5M4BombInt's, not including the intro, will now have a 40% chance of firing. Outdoors reactions are still guaranteed.)

- Ellis' manhole story will now be interrupted normally.

- Fixed Coach saying his "20More" lines when there are only 10 gascans left to get.

2/16/2020 

- Fixed faulty friendly fire timers for all survivors (Now, each survivor has their own 10 second cooldown between each of their ff lines.)

- Fixed Ellis not having a proper response to Rochelle's question when being revived.

- Rochelle and coach may have a conversation about fried okra in chapter 2

- Optimized the coaster run on Dark Carnival Chapter 3

- Fixed certin responses for the wedding.

- Removed any unnecessary criterions

- Applicable L4D2 survivors may have a C1 set of TankPound lines

- Survivors will no longer sound their generic "I hear a witch" lines for The Passing - Chapter 1 and Hard Rain - Chapter 2

- All C3M2ComingHomes are now TalkIdles

- Rochelle will no longer use generic weapon pickup lines for Chapter 1 and 2 of Dead Center. (Item pickups such as First aids and adrenaline shots, and special pickup instances such as the SMG outside the elevator and the gunstore pickups are unaffected)

- Optimized Hard Rain instances for orator.txt (Less response tables used)

- Tank reloading lines should now have a ten second cooldown.

- Restored one point of interest exclusive to Bill on Blood Harvest Chapter 5 (We're out of track)

- Restored two points of interest where Bill may get lost in the cornfield prior to entering the farmhouse.

- Restored the other point of interest linked to the sign signifying the outpost (Climbing on the traincar)

- Moved the outpost point to the center of the ledge so it's not so far to the left before dropping down into the cornfield. It should be easier to remark on it as a result. ("The honest-to-god military!")

- Moved the sixth point of interest to where it can be activated despite being in the cornfield ("Get to the farm house")

- Instances/Remarks where Bill is lost in the cornfield in Blood Harvest Chapter 5 will now use "DistanceToClosestSurvivor" instead of three distance checks for each individual survivor. (Warning: The "Real Zoey Unlock" sourcemod plugin is interfering with the Distance criterions [and possibly other criterions somehow] it is advised that you disable the plugin for now.)

2/17/2020

- Further optimizations to orator.txt (all instances which results in a lone, blank response will now only use a single response table.)

- Improved the gate scenario in Dark Carnival - Chapter 4, all survivors are now able to make the callout and response. Also, the first callout is timed so that it will play after the gate has been opened instead of being a TalkIdle (which can trigger before the gate is open)

- Improved the Coaster Start, now, all survivors should say something when the gates open.

- Moved concert contexts to orator.txt

- Coach will never rock out to the concert if he's disappointed at the discovery of the Midnight Riders using taped music for their concerts. (Restored "CoachMadAtRiders" functionality)

- Added two lines in relation to the concert map

- Restored Rochelle's witchville lines (Forgot to recorrect some data. Sorry)

- Disabled a separate set of Coach's "I hear a witch" for The Passing Chapter 1 and Hard Rain Chapter 2

- Fixed an issue where Zoey might use Bill's voice when picking up L4D2 items. (Thanks, "Raggae From Nontendo", for reporting!)

- Fixed Louis not saying his proper Nearcheckpoint line on Dead Air chapter 4.

- Fixed Francis not sounding his proper NearCheckpoint line on Blood Harvest Chapter 3

- Survivors will no longer suggest for others to heal with a first aid kit while incapicitated

2/18/2020

- Corrected a typo on the grenade type. (No voiceline change)

- L4D2 survivors will now use grenadecareful whenever a player uses throwables whenever a witch is around.

- All survivors' GrenadeCareful will never sound if a Tank is alive somewheres on the map.

- Threw out a useless TalkIdle from Virgil.txt

- All escape instances will now use a single context + proper concepts (FinalVehicleSpotted/GetToVehicle instead of TalkIdles)

- Escape lines will be proper for their applicable campaigns (No using duplicate lines for multiple campaigns).

- L4D1 survivors' finaletriggered instances will now use a single context. (_auto_Finale, RIP "SaidRadioTriggered")

- All "GetToVehicle" instances will be using two different timers so that the same survivor will no longer say their GetToVehicle lines twice in a row. (They may be at a slower rate, if you have a suggestion for the timers for each official map, let me know!)

- All "TimerGate" instances will now use "TimerLock" contexts instead (Got rid of TimerGate contexts for optimization, no difference)

- The survivors should no longer complain about the bridge breaking if someone has already jumped off prior (The Sacrifice).

- Almost all survivor timer related stuff will now be using timer contexts (_auto_TimerLockGambler, etc. All others have been removed for optimizations.)

- The Passing's outro will start 0.5 seconds once triggered. (This is to guarantee the outro being fully displayed, subtitles and audio.)

- Survivors will no longer have to avoid combat in order to sound their "Restart the generator" talkidles on Crash Course.

2/19/2020

- Restored L4D2 Survivors' The Passing Outros + other relevant lines.

- L4D1 Tank Kills during the finale + the mega mob warnings after the first tank on Dead Air + Triggering the finale on Dead Air will result in a print " " response, this will prevent any interruptions to the current speech since the result was originally blank anyways.

- Fixed L4D2 survivors calling out the saferoom twice on The Passing Chapter 2... Again. And Swamp Fever Chapter 1.

- Everyone except for Bill will have a finale specific Tank Kill line on Crash Course for its first tank only. Bill's response will be blank instead.

- All survivors will use the same "PlayerNiceShot" response. The Passing - Port will have their own separate sets, but uses the same response*

*(Further, all general subject related NiceShot responses will have a 10% chance of playing. The Passing - Port will remain at 70%)

- Bill will now have NiceShot responses.

- The L4D2 survivors will now have a 50% chance to use their reloading lines. (Concert and Tanks are exempt)

2/20/2020

- Bill will now have 3 more lines when killing a Tank with ease.

- All survivors will now use the same "YouAreWelcome" response when reviving a friend. The same conditions must be met for all characters using that response.

- The Loss easter egg is now available for both Coach/Ellis. The survivor who activates the remark will be the one who can do the easter egg. (Note: For Ellis, you simply need to use "Look!" whenever Louis is close enough. You do not need to look at him.)

2/21/2020

- Rochelle will question if Alligators are fed chicken at the end of the tour.

- Fixed Coach and Rochelle not using their quiet "HurryUp" lines when in Witchville.

- L4D2 survivors will have FinalVehicleSpotted/GetToVehicle lines for the Cold Stream campaign.

- Spaced out lines said during the run on the Screaming Oak.

- The AC130 pilot's megamob warnings for the second half of the finale will depend on the FinaleStage context instead of if the survivors managed to kill the first tank (more accurate, needs Rayman's fix).

- All WitchGettingAngry instances will use Print " " instead of the survivor's blank responses.

- Rochelle and Coach leaving the saferoom on c5m5_bridge will result in a print " " response.

- Various finale instances will completely disable SI warnings and callouts, and Megamob warnings, this is to prevent their lines from being sounded and breaking immersion with other story critical events.

- Nick must now be out of the start area in The Vannah to say his cop line. (It was getting in the way of the intro.)

- Coach will never ask Nick if he's played ball in The Vannah.

- Tank kills on The Veterans' Memorial Bridge will always result in the killer saying their line. (Can only happen once per character, except for Nick)

2/22/2020

- Other survivors will now no longer call out weapons and SI + Other things when the escape is ready.

- Fixed an issue where Rochelle saying her C3M4GateBlow line will not prompt the GetToVehicle lines for Swamp Fever.

- Fixed an issue where timing the first radio interaction will still allow Soldier 2 to say the one line that applies the BuzzardRun context.

2/23/2020

- Fixed an issue where the Chopper lines for Cold Stream would not play.*

- This will also ensure that once the FinalVehicleSpotted concept fires, all SI callouts and item spots/pickups, etc will be disabled.

- NearFinale concepts for The Parish and The Passing will result in a Print " " response instead of a blank.

- Coach may respond to Nick when asked about the smell in the pens.

- Ellis will now call out the saferoom in the tunnel of love properly.

- All carousel related instances will use the Alarm context instead.

- The talk idles for the carousel will no longer use the "_auto_SawTunnelOfLove" context. It will instead use "SaidSafeSpotAhead".

- Survivors will use generic "Look out!" lines when the spitter spits on Dead Center Chapter 1 and 2.

- 2/24/2020

- Moved one of Rochelle's C3M4NearFinale line to "c3m4radio" ("Do you think someone's still out there?") Ellis will reply if he is near. His NearFinale line has been replaced with a generic "Down here".

- Removed two lines from Dark Carnival's intro to prevent lines from repeating.

- Coach may have a reply if either Nick or Rochelle says to hurry up at the Dark Carnival slides.

- Using general finale contexts for the L4D1 finales. Threw out everything in finales_dlc2 that was not being used. (Greatly optimized)

2/25/2020

- Converted Ellis'/Rochelle's LeavingInitialCheckpoint lines on C6M1 into a conversation (Ellis must be the first one to leave)

- Reloading lines and ThrowGrenade lines are now blocked if the rescue vehicle has been spotted.

- Fixed the Historic Tour info_remarkable being out of place.

- Touched up on car alarm instances, they should now be fully functional on c5m3_cemetary along with any other map.*

(Continuous CarAlarm panic events on c5m3_cemetary will allow only one survivor to complain. This will work on a range system using "randomnum" If the "randomnum" is between one number and another, then that survivor will issue the complaint, etc. The range determination and its order depends on who is listed first in terror_player.txt at the very bottom of its document.)

- The ConceptPanicEvent instances as of this update will have an additional criterion ensuring that the PanicType IS "CarAlarm". More may be identified and be put to use.

- All survivors will issue a taunt if they successfully shutout the tank. (This will never happen during applicable, story critical moments such as finales to prevent interrupting those key story moments - also, survival mode.)

- Added another fault to the list of possible faults.

- Overhauled the gunstore scenario even further. Restored the original timings/moments.

- The remark which will prompt a response from whitaker will now ALSO use Print " " 

- Virgil on c3m4_plantation will no longer rely on the _auto_Button2 contexts for his pre-finale lines. Instead, they will rely on _auto_Finale. (No change)

- Even more optimizations to orator.txt

- Survivors will have a 30% chance to thank the specific survivor that game them the item whereever necessary.

2/26/2020

- Fixed an issue where Coach would use Rochelle's voice when receiving an item from zoey (outside of c6m3_port)

- Made some itemdonor responses and bybridge remarks exclusive to the intro actor on c6m3_port

- Filled in some additional blanks for The Passing.

- Fixed the "WorldC6M2_InSewerLadder1" point.

- Fixed the "WorldC6M2_JukeBox" point.

- Fixed the "WorldC1M1StairsSign" point.

- Fixed the "WorldC6M1_WeddingWarn1" point.

- Fixed the "info_carboat" point. (The Sacrifice - Chapter 1)

- Info_remarkable points that take place during the gauntlet to the saferoom will no longer have the "NotInCombat" criteria.

- C2M1Falling will have a duplicate set that will only work for The Passing - Chapter 2 (uses the same speakresponseconcept)

2/27/2020

- Fixed an issue where a random survivor would respond to virgil when the finale starts.

- Blocked generic megamob warnings from playing when the gravel event happens.

- Survivors will have the proper reactions to uncommon infected depending on the current map.

- Restored c2m4_evac points for Nick.

- All predelays on "ToTheRescue" lines have been removed, along with the context applied when sounding the lines via vocalizer.

- Disabled "ConceptPlayerTonguePullStart". There is another concept that works just as well.

- Moved two appropriate lines to c1m4escape in the wake of the latest accessory update.

- Corrected an issue regarding Ellis' c6m3_bybridge. + Filled in the remaining scenes for him.

- Readjusted the predelays for C1M4Escape lines to be in sync with the car beginning to move.*

*(Further readjusted)

- Readjusted the chance of c6m3_outro3 (with at least one extra criteria) so that the chancetofire will be at 20%.

2/28/2020

- All itemdonor response will ensure that the itemtype being donated is "healing" (Pain pills or adrenaline).

- Ellis will now have a fair chance of remarking on c5m4alley

2/29/2020 

- Fixed/Restored hostpital02_path03 (Thanks to Edison for reporting)

- Improved Dark Carnival Chapter 1 intro* 

*(The intro itself will consist on moaning about the traffic being blocked, further, when any survivor but Ellis leaves the safearea, he will request that he says goodbye to the stock car alone. Then say goodbye as long as he is in the safe area too. [May improve further so that Ellis must be completely alone in the safespot, can't find the criterias for that...] He cannot be the first to leave the safe area and must stay in until the interaction is done.)

3/1/2020

- Fixed Rochelle somehow not responding to Ellis on a very specific line during the elevator convo in the atrium (Thanks to Edison for reporting!)

- LedgeHangings will now apply a context as to not instantly use generic help calls when they start hanging from the ledge.

- Louis will now say something about the rifle range if he is currently holding any AR during the elevator ride to the 28th floor.*

*(Louis will now have one additional line for it, please get the accessory again to fix.)

- Bill will have an extra line for "I'll see peace back on Earth"**

**(Please get the accessory to fix that)

- The Beta Soldiers have made a return thanks to ion!***

***(If the Beta Soldiers are "selected" for the radio, then there will be no chopper nags from said soldiers.)

Improved the chapter intros to The Passing.****

****(Chapter 1, Talk contexts have been properly applied so that the toursign remark will happen AFTER the intro is done - and while the survivors are in the safezone. Improved the circumstances required in order for certain intro lines to be played.)

****(Chapter 2, Talk contexts have been properly applied. Improved Nick's response to coach's under-the-river tour intro so that Nick would think about assaulting francis if he is the intro actor. Cut out some unnecessary concepts. The intros will end if anyone leaves the saferoom. If Ellis is the first one out, he will be guaranteed to say a line.)

****(Chapter 3, Talk contexts have been properly applied. The intro will end if anyone leaves the saferoom.)

Improved the chapter intros to The Sacrifice.*****

*****(Chapter 1, Talk contexts have been applied. Talk:0:0 will apply when the first survivor leaves the safe area, this will not interrupt the current intros.)

*****(Chapter 2, Talk contexts have been applied. The intro will be cut short and Talk:0:0 will apply when the first survivor leaves the saferoom.)

*****(Chapter 3, Same as Chapter 2)

- Removed the through park info_remarkable at the start of The Passing Chapter 1

- Moved many revive lines from finales_dlc2 to their respective <survivor>.txt

- Reviving survivors should now be compatible between both survivor sets.

3/2/2020

- Ensured that Rochelle will respond to one of Coach's food remarks on C2M2.

- IntroC2M1 will now only play on Dark Carnival (For some reason, this concept gets fired on cold stream as well... Who would have known.)

- L4D1 ConceptBotMovingToBattleStation will never play if a finale is in progress.

3/3/2020 

- Overhauled the entirety of Cold Stream.* 

*(Too many to list. Check it out for yourself!)

- Blocked MegaMob callouts when NearFinale is activated on Blood Harvest for 60 seconds.

- Ellis' C6M2 (The Passing - Chapter 2) transition will now require that Zoey is the intro actor.

- Ellis, Nick, and Rochelle will no longer say that the smoker has them (simple choking sounds) if the map is Dead Center Chapter 1 or Dead Center Chapter 2

3/4/2020

- Virgil will now have an outro line when the escape scene activates on c3m4_plantation (Swamp Fever Chapter 4)

3/5/2020

- Overhauled No Mercy Chapter 5 to be completely compatible!

- Rochelle's pain while incapped will now use IncapicitatedInjury0X instead of HurtCritical (Thanks to Edison for reporting!)

- Fixed an issue where Louis answering the radio will bug out John Slater due to a misapplied context.

- Fixed Rochelle's pain scenes (Thanks, Edison for reporting!)

- Fixed an issue where Zoey being the one to touch the radio first will cause ECHO's Radio operator to continue nagging throughout the finale.

3/6/2020

- Louis will now protest saying that the L4D2 survivors are NOT vampires. 

- Fixed the rest of Rochelle's pain lines.

- Fixed one Confirmation response to John Slater not applying the context needed for him to stop nagging.

- Removed an unnecessary context from Francis answering the radio (second) on Blood Harvest Chapter 5

- Blocked Nick's Zoey specific Tattoo remark if she is mentioned by name in the saferoom intro. (The Passing Chapter 2)

- Corrected a misnamed concept criteria for the special wedding warns.

- The wedding warnings for Nick and Rochelle where they make fun of Zoey will now only activate if Ellis has shown noticable affection for her.

- Removed the chance factor for C2M1DoneFalling (Except for one) so that they will not activate long after the actual slide down the hill.

- Survivors will no longer read the gas sign on c4m2_sugarmill_a if someone's already called out the saferoom. ("There's gas in the saferoom")

- Blocked "I hear a witch" instances if a gauntlet event is currently active.

- If the L4D1 survivors call out the saferoom prior to entering the warehouse on Crash Course Chapter 1, then generic saferoom callouts will no longer play.

- Slightly optimized the seestation responses for Nick/Ellis/Rochelle

- Blocked certain remarks/lines if the survivors have already activated the elevator on c4m2_sugarmill_a

- Corrected an incorrect concept criterion for rochelle in The Parish's intro

- Gave Rochelle an extra line to reply to Nick on The Parish's intro: ("You mean that blurry line on the horizon...")

- Slight tweaks to c2m1searchlights

- Restored "WorldC1M1KnowBoomer" for Coach/Nick

- Ellis will have a unique SurvivorDied line at The Vannah (first death, before knowing each other's names)

- Restored WorldC1M2Abandoned

- Rochelle's BoomerReaction01 will now only play at The Vannah for the first time of getting biled. (After the bile has worn off)

3/10/2020

- Blocked generic megamob warnings when certain events are triggered.

3/14/2020 

- All survivors will have an equal chance of interrupting Ellis' story on certain maps (except for The Passing Chapter 3 Pre-Finale) certain survivors will still have specific responses for that map if they interrupt)

3/17/2020

- HulkShutOuts will now require that everyone is alive at the time of the Tank's death.

3/19/2020

- Corrected two entries for Rochelle on Cold Stream Chapter 3.

- The Parish will now have an outro for Papa Gator (and/or Rescue 7) and one survivor at random. (Ellis must be alive if he gets the line, Coach and Nick need to have everyone alive if they get the line, and Rochelle needs Ellis alive. Certain lines had to be cut from other instances.)

3/20/2020

- Restored some lines for the intro of Hard Rain chapter 5.

- Removed check for Nick being in the safe area for the second line of the intro.

3/21/2020

- Altered The Parish's outro a tad. Survivors will say something post bridge destruction if... The Beta soldiers are selected, or if Papa Gator gets the first line in the outro. (Note, everyone must still be alive and in the helicopter for this to happen)

3/23/2020

- Blocked various things from triggering on unrelated gamemodes

- Fixed survivors never using the safehouse specific remark on Crash Course Chapter 1

- Improved Iscrashcourse02_path06 for Francis

- Fixed context for survivors pouring the last gas can in scavenge.

- L4D1 survivors can spot melee weapons.

- L4D1 survivors can spot Bile Jars

- Blanks used for the L4D1 survivors to ask for a first aid kit will now use print " " as to not interrupt their current speech.

- Fixed Zoey never saying her SecondPistol pickup lines.

3/26/2020

- Fixed an inappropaiate intro for The Passing Chapter 2 playing if Zoey is NOT the intro actor ("Sweety... It's just a car.")

- Fixed a broken context applied when opening the second gate on The Passing Chapter 2

- Applied talk contexts to the intro of Dead Center to prevent first weapon pickups from interrupting the intro.

- Putting the cola in will no longer interrupt the survivors' current scene (will use print " "), further, any talking related criterias for those will no longer exist for that particular concept.

- There is a small chance for the movie intro for L4D2 to be used on Dead Center (With Ellis getting the first intro line, 5%)

- Guaranteed that Nick would say his special Tier 1 weapon line on C6M1_Riverbank in COOP (After store remark)

- Coach will no longer trigger "RelaxedSigh" and "ConceptPlayer.CoverMeC1RCoach2" at the same time on c1m1_hotel

3/27/2020

- Restored many lines for Crash Course

- Moved two info_remarkable points from Crash Course Chapter 2 to Crash Course Chapter 1 (Bulletin Board, Copy Papers)

- Fixed Magazine Rack point for Louis

- Applied talkbiker contexts for certain info_remarkable points for Francis on The Sacrifice Chapter 1

3/28/2020

- Removed two of Bill's generic Tank kill lines.

- Fixed Francis using his first swearing when he unpresses the generator during the crash course finale.

3/29/2020

- Got rid of the only line for Bill picking up the chainsaw (will now use the same pickups for the grenade launcher and M60)

- The talkidle nags for opening the plane door on Swamp Fever - Chapter 2 will now only activate on Swamp Fever Chapter 2

- PlayerReloadingC502Run lines will now only activate on The Parish Chapter 2

3/31/2020

- Fixed Rochelle using generic story interruptions when she cuts off Ellis when he tells his story to the L4D1 survivors.

- One info_remarkable point for Dead Air - Chapter 4 will no longer require the entire team to be out of combat for at least 10 seconds.

- L4D1 survivors should no longer use SurvivorBotNoteHumanAttention when they are currently speaking.

- Threw out some unnecessary lines for certain rules (forceweight 1)

- Improved the churchguy scenario further so that certain conversation paths will not end with the typical "Ding dong! DING DONG!" line.

4/1/2020

*NO, I DO NOT OBSERVE APRIL FOOLS DAY ANYMORE. EVERYTHING FOR TODAY WILL BE AS NORMAL*

- Fixed Rochelle having the wrong reply for the movie intro.

- Fixed one searchlight reply not having IssuerReallyClose for its criteria.

- Ellis' killsteals now uses IssuerReallyClose and must also use AlsoWarn for the non-boss Si

- Louis will now reply to either Ellis or Rochelle telling him to get ready for incoming tanks on The Passing - Port (His special tank callout will stay just in case they ever want to work again)

- The wedding warns will never happen if the witch is either not present, or is somehow already dead prior to reaching it.

- Default vocalizers will now use IsNotSpeaking to assure that the voicelines will not be spammed as much. Certain vocalizers will now also use IsNotVersus to prevent annoyance in that gamemode.

- Lumped in generic spotweapon lines for specific weapon callouts.

- Fixed intro for Hard Rain - Chapter 5 never playing.

- Fixed one of Whitaker's intro lines never playing.

- The gun store door will now open whenever Whitaker is finished with his intro after the survivor pressed the button. (It will no longer open 12 seconds after pressing the button regardless of intro)

- Fixed Bill using the wrong response when spotting hunters.

4/2/2020

- The survivor who pushes the gunstore button is no longer guaranteed to be the one to accept Whitaker's offer.

- Whitaker intros are guaranteed to be short when playing on Versus modes.

- Whitaker will not say anything prior to destroying the tanker in versus modes.

- The tanker will now be destroyed after Whitaker finishes the line after the cola has been delivered.

- Fixed remaining C1M2FirstOutsideResponses never playing.

- Added a new remarkable point where whitaker will urge the survivors to put the cola in the slot (He will never say it the moment the survivors start the animation. It will only be activated if the player has the colabottles equipped.)

- The info_remarkable point when walking out of the Save4Less Store will now require your activeweapon to be "ColaBottles" to activate it.

- The survivor that reacts to the tanker getting obliterated will be the one who delivers Whitaker's Cola.

- Fixed one ending to the Dead Center Chapter 1 intro somehow disabling many things until the elevator ride.

4/3/2020

- Fixed Conceptc5m4floatend so that the actual survivor will say something other than the orator entity itself.

- Removed an unnecessary application of context when Nick breaks the Toy Store's window in liberty mall.

- Fixed an issue where the activator of the panic event at Liberty Mall would not be the one to say the first alarm line.

- The responses issued when an airstrike happens on The Parish - Chapter 4 will use print " ".

- Removed an unnecessary application of context when Rochelle disables the alarm in Liberty Mall.

4/4/2020

- Rochelle will now remark about the tower when in the trailer.

- Changed NearFinale lines for Swamp Fever.

- Further tweaks to the ChurchGuy

4/8/2020 

- Optimizations to suggesting to other survivors to heal. (Will now use the same concept using "From" as a factor for specific quotes)

- Moved the c2m4_pens points to be slightly upwards so that the remark can actually be made.

- Coach's "HeardWitch" (3%) will no longer play on Dead Center Chapter 1 or Chapter 2

- L4D2 survivors will no longer say "KillThatLight" lines if the map is Dead Center Chapter 1 or Chapter 2

- Nick will now only break the bad news to Coach about the Midnight Riders if he's nearby and alive (10% chance)

4/9/2020

- Even MORE ChurchGuy tweaks.

- The signs remark for Nick inside the starting saferoom on Chapter 3 will now be guaranteed to play if he reaches the sign first (before someone remarks on the bodies)

- Bill will now no longer randomly shout for help when constricted by a smoker.

- Fixed an issue where Francis could still remark on the radio after it has been interacted with.

- Restored many WorldSigns lines and responses. (The Parish) The sign remark in The Parish - Chapter 2 starting saferoom will now serve as an intro to that chapter as a guaranteed remarkable point.

4/12/2020

- Improved the coaster scenario vastly.

- Ellis will now have a unique transition line for Dark Carnival Chapter 2.

- Dark Carnival - Chapter 3 will now have slightly tweaked intros.

- Fixed an issue where contexts aren't applied when leaving the starting area on The Sacrifice - Chapter 1.

- Slight addition to an intro on Dark Carnival - Chapter 5.

- Fixed an issue where Nick/Rochelle would never say their second line after picking up the SMG after the elevator at The Vannah. (Whacking things in the head was fun, but.../I'm not a fan of guns, but...)

- Added a new info_remarkable point at the Midnight Riders' banners.

- MAJOR improvements to Hard Rain.

- Fixed an issue where Coach will never say his idle line on Hard Rain Chapter 1.

- Fixed improper contexts being applied for c4m1_nogas

4/13/2020

- More additions to Hard Rain.

- Completely restored all lines that could be said when the Ferry crosses the river on Swamp Fever - Chapter 1


4/14/2020

- Cleaned up the C2M1Falling concept used for The Passing Chapter 2

- A couple more info_remarkable points will no longer require "NotInCombat" since they happen during a gauntlet to the saferoom on The Passing - Chapter 2

- Coach will now react to the Disco Pants and Haircuts store in Liberty Mall.

- Rochelle will no longer use generic "This way" when remarking on C1M3ThisWay.

- Further improvements to Whitaker's gunshop conversations.

- Improvements to Dead Center - Chapter 2 info_remarkables

- Responses to the Dark Carnival - Chapter 2 intro will no longer specify the map. (But you'll still need to be in the start area)

- Additional lines for Rochelle killing any SI post gunstore.

- Louis will now have dying quotes when he has less than 100 bleedout health.


4/16/2020

- Witchville (HeardWitch) lines will no longer sound if the safehouse has been spotted. (Hard Rain - Chapter 2)

- Coach responding to himself and other survivors responding to him will be based on proximity to the other survivors and random chance (The Parish - Chapter 2 remark intro).

- There is now a 1 second delay for EatPills lines.

- Louis and Zoey will now warn not to shoot the nearby alarmed cars.

- Fixed an issue where Nick never says the first line in Swamp Fever - Chapter 3.

- Overhauled the safehouse intro methods for every campaign to be identical (With the exception of a few special cases).

- Fixed certain Midnight Riders lines for the Dark Carnival Chapter 2 intro still specifying a map.

- Fixed Rochelle never responding to Coach if he gets the first line on Swamp Fever - Chapter 2 intro

- Rochelle will no longer say "Hunter on him" every time someone gets pounced.

4/17/2020 

- Added the Roadcrew uncommon SpecialType for modders who wish to make use of this.

- Added "SubjectIsA" for Witch for future use.

- Fixed an issue where the intro on Hard Rain - Chapter 3 would loop.

- Corrected the Talk context on the TalkIdle used to start the Hard Rain - Chapter 3 intro for some survivors not lasting until someone leaves the saferoom

- The actor that fires the PlayerAskReady concept will now have to not currently be speaking as to prevent spamming.

- If Zoey is the first player to leave the safe area on Dead Air - Chapter 1, she will say her "Through the greenhouse" line.

- The L4D1 survivors will now spot laser sights. (Uses the same response for spotting other L4D2 items)

- Fixed "SaidSpot" context to be "worldSaidSpot". (The cooldowns for automatically spotting weapons will now finally work!)

4/18/2020

- Added new elevator conversations that will play on Dead Center Chapter 1.

- Tweaked existing elevator conversations on Dead Center Chapter 1

- Added one more line to Nick's ConceptC1M2SafeRoomb3

- Added and tweaked potential intros to Dead Center - Chapter 1

- Additional lines for the main intro of Dead Center - Chapter 1

- The ConceptPlayerLockTheDoorCheckPoint for Hard Rain - Chapter 2 will now use "norepeat" for all L4D2 survivors

4/19/2020

- Added one potential line for Ellis to say for his "C5M3SeeGraveyard06"

- Ellis' remark for c5m3freeway has been converted into a remark for c5m3safezone

- Tweaks to C5M3GraveNags

- Rochelle will now have a "Pick up the radio" line when they hear the soldiers (Not to be confused with her "Oh, thank God, soldiers!" line)

- Additions for Ellis/Rochelle when Ellis lowers the bridge on The Parish - Chapter 5

4/20/2020

- Moved one of Coach's RockingOut lines to be his final line for the Dark Carnival - Chapter 5 intro ("These zombies better be ready to rock")

- Added one extra line in its place ^.

- Corrected Nick never saying "Sure, why not." when he asks about Whitaker's terms.

- Survivors will now say "Push the button" when the entire team is in the elevator. (Dead Center - Hotel)

- Ellis will now have a couple of extra lines should he pick up the SMG first in Dead Center - Chapter 1

- The fail safe for Whitaker to open the door will automatically activate after 45 seconds of pushing the button.

- The fail safe of Whitaker destroying the tanker will automatically happen 15 seconds after the survivor delivers the cola.

- Corrected a lack of response from Coach during one of the ElevatorHellos on Dead Center Chapter 1

- Zoey will now have something to say after a survivor calls out the truck finally getting down on Crash Course Chapter 2

- Corrected an intro in The Passing - Chapter 2 playing despite Zoey not being present in the Chapter 1 intro

- Fixed an incorrect context being applied when remarking the cane field on Hard Rain - Chapter 3

- Generic Tank Kill instances (L4D2 survivors) will no longer play during finales

- Fixed a problem where Zoey would only say one line for Crash Course's "GetToVehicle"

- Crash Course's Chapter 2 intro will now work on the TalkIdle system instead of relying on info_remarkables (Saves on a lot of unused contexts/info_remarkables)

- Fixed an issue where Coach does not complain that the Merry-Go-Round has started if he were the one to open the gate

- Fixed a transition for Ellis on Dark Carnival - Chapter 2

- Ellis will now have something different to say when he starts the Carousel on Dark Carnival - Chapter 2

- Ellis and Rochelle may now comment on the Entrance Sign in Dark Carnival - Chapter 2

4/21/2020

- Ellis' transition line on Dark Carnival - Chapter 2 has now been converted to the reaction to the Carousel starting up.

- Fixed an issue where Nick and Ellis starting the Carousel will not apply Specialwarns and Megamob warning contexts

- Improved Dialogue for Nick starting the Carousel on Dark Carnival - Chapter 2

- The Helicopter nags on The Parish - Chapter 5 will now target "orator_chopper" instead of "orator" (no noticeable change)

- Slight tweaks for C5M2People

- Fixed an issue where Ellis leaving the saferoom first on Dark Carnival - Chapter 5 will not apply Talk:0:0.

- Fixed an issue where Ellis throwing a molotov will still sound a line when the escape vehicle is ready

- Rochelle's first Okra point will now trigger when she is 200 units within range (instead of 500)

- Ellis' kiddieland remark will now apply the foodbreak context.

- Added an extra info_remarkable for c2m2_kettlecorn

- Added an extra info_remarkable for c2m2_cottoncandy

- Added two extra info_remarkables for c2m2_lilpeanut

- Fixed an incorrect context applied on c2m3_swanroom

- Fixed Rochelle never commenting on c2m4_upbarn

- Changed the location of one of c2m2_favoriteride

- *MAJOR* info_remarkable overhaul to optimize the talker
>	All info_remarkable points that have the same criteria to activate (and have the same contexts applied) will now have the same targetname and contextualsubject.
>	All rules that have those points but have the same criteria to activate have now been thrown out. It will now apply on that one rule/response for those points.

4/22/2020

- Nick will now tell Ellis to test the second gate on The Passing Chapter 2. (The instance of Nick giving Ellis a healing item will no longer happen)

- The info_remarkable on The Passing Chapter 2 for the second gate will no longer require NotInCombat

- Concept_c4m1_rainresponse will no longer require "SecondsSinceCombat2" since NotInCombat is already present

- The TalkIdle after finding the out of gas sign on Hard Rain Chapter 1 will set the NoGasGate to 2 when fired.

- Fixed an incorrect intro playing if Zoey is the intro actor on The Passing - Chapter 3

4/23/3030

- Corrected the name of a rule that's used if Rochelle leaves the safe area in Scavenge mode on Dead Center - Atrium

- Default Vocalizations + Friendly fires will no longer use story related and/or irrelevant lines. (Few exceptions)

- All survivors' AlertGiveItemCombat instances will now focus on intensity instead of actually being in combat

- Restored all relevant Vocalizer voicelines for the L4D2 survivors

4/24/2020

- The WeddingWarn info_remarkables will now use the same contextualsubject.

- Applied context to the orator whenever the survivor burns the barricade on Dead Air Chapter 3.

- airport04_08, airport03_02, and airport03_03 will now use their respective, yet idential, names to cut down on rules used.

- Survivor specific friendly fire responses will require that the player must not be OnThirdStrike

4/26/2020

- Commented out "TankDominated" rules as to prevent annoyance.

- Reworked Tank Kill instances. Healthy responses now require that your health be at 40 or above. Otherwise, health 39 and below will trigger NotHealthy variants. (When Healthy, Being near Ellis will have a 20% of Ellis claiming the tank kill instead of any other SI)

- Healthy Tank kill responses will use General KillConfirmation without anyone replying to it.

- Fixed an issue where Ellis killing the Tank on Dead Center - Chapter 2 would not prompt the conversation. (Random chance no longer applies for any survivor.)

4/28/2020

- Further tweaks to the Dead Center Chapter 1 intro, now, the actual lines used in the L4D2 intro video will be played in that particular sequence (variants of those lines will apply), instead of being different versions of it.

- Further tweaks to the elevator conversation on Dead Center Chapter 1

- Fixed an issue where Nick and Whitaker may take too long to respond to each other.

- Louis' remark on the minigun on No Mercy Chapter 5 will no longer activate if the finale has already started.

- CommentJockey responses will no longer use "Subject". It will instead use "From"

- Reworked CommentJockey for Nick.

- Reworked Tank Kill instances for the L4D1 survivors

- Fixed an issue where a different context was applied upon killing the tank in the finale of Crash Course

- Fixed an issue where the L4D1 survivors would still use their tank kill lines on the finale of The Sacrifice

- Removed unnecessary contexts applied when starting the generators on The Sacrifice

- Fixed an issue where Bill killing a tank on the finale of Crash Course would not apply any context

- Applied Talk contexts for the first SI kill on Dead Center - Chapter 1

- Generic PlayerTransitions will now contain only non-story related lines

- Restored lines for the L4D1 survivors when they want to throw something to the L4D2 survivors on The Passing (+ No more generic "look here" or "take this")

- Bill will now have instances of attracting a player to throw an item to them like Zoey and Francis

4/29/2020

- Fixed a typo for nick's MovieIntro on Dead Center (Thanks to VladFRY for reporting)

- Fixed Ellis someone not saying anything when using a defibrillator to bring back a dead teammate (Thanks to VladFRY for reporting.)

- Coach will now specifically say that he's throwing a molotov. (Thanks to VladFRY for suggesting.)

4/30/2020

- Fixed an improper context being applied if Coach calls out the rain on Hard Rain - Chapter 1

- Rochelle will now only tell Coach to "Be Nice" when he calls out the witch on Dead Center - Chapter 2

- Removed a line for Ellis originally meant to be played on The Passing - Chapter 3

- Corrected a wrong response/reply being issued on the Dead Center - Chapter 1 intro.

- Got rid of one instance of Francis' WitchGettingAngry with Louis being near due to inaccuracy. (And also because that line is meant for The Sacrifice)

- WitchGettingAngry responses will now only use one rule per survivor. (Removed WitchGettingAngry2)

5/1/2020

- Tweaked the elevator conversation so that Coach will not introduce himself twice. (Thanks, VladFRY for reporting!)
+ Further elevator conversation additions

5/2/2020

- The survivors will now call out the plane, THEN realize that the plane will crashland on Dead Air - Chapter 5

- Sometimes, Francis may appear excited after the plane crashes on Dead Air - Chapter 5. (Guaranteed if Francis makes the realization.)

- Corrected Contexts for TalkIdle (Nagging to fire the Howitzer on Crash Course - Chapter 1)

- Added more Crash Course lines for the L4D1 survivors + tweaks to the Crash Course campaign.

- The L4D1 survivors will now nag to start the generator the first time on Crash Course Chapter 2 (Activates only after spotting the truck on the lift.)

- Louis' Alley line for Francis will now activate in Crash Course - Chapter 1 instead of Crash Course - Chapter 2

- Destroying the barricade with the Howitzer will have only Francis or Zoey saying something in Coop/Versus. In survival, everyone will show excitement.

- The intro to Crash Course Chapter 1 should no longer be solely dependent on if Francis is present.

- Crash Course's intro will now have only intro lines for that specific campaign.

5/3/2020

- Reorganized the alarm related lines for The Parish - Chapter 2

- Rochelle will have one extra line she could say when remarking on the alarm sign, and might be the one to make the first line when the alarm goes off.

- Ellis will say something if any of the other L4D2 survivors turn off the alarm on c5m2_park

- Moved three of Ellis' First SMG pickup on Dead Center - Chapter 1 to be played when he is the first to enter Whitaker's gun store.

- Tweaked the Dead Center - Chapter 1 even further (Ellis will call out the building being on file after Rochelle tells Nick to knock it off., this is if it hasn't been noted already)

- Deleted unused talker files.

5/4/2020

- Fixed an issue where certain Ellis lines where he accepts Whitaker offer came with an inappropaiate 10 second delay

- C4EnterCover and C4Exitcover (For the L4D2 survivors) will use "NoResponse" instead of a blank.

- Added two of Francis' community lines to the elevator conversation on No Mercy - Chapter 4

- Corrected a criteria for a specific elevator conversation on No Mercy - Chapter 4

- Removed odds factor from the start of the elevator conversation for No Mercy - Chapter 4 (Louis' rifle range line will still have a 30% chance, now.)

- Fixed an issue where Zoey would use Louis' voice when using pouring a gascan

- Fixed an issue where Coach killing the tank does not trigger a kill line.

- Fixed an issue where killing the tank at exactly 40 HP does not trigger a generic tank kill line.

- Fixed Nick not warning others of SI properly on Dead Center Chapter 1

- Gave Bill something to say when remarking on the truck before the finale starts on Crash Course

- The AC130 pilot on Dead Air will tell survivors right away when the plane is full

- Coach will reply to Nick's first TankReloading line for the concert

5/5/2020

- Set up a range system for No Mercy's elevator convo and The Passing's outro. (This uses "randomnum" + forceweight x in an attempt to get variety in voicelines.)

- Extended the range system to be used for the FerryCrossing info_remarkable on Swamp Fever Chapter 1

- Corrected Nick not giving a proper response during the FerryCrossing moment on the topic of Whispering Oaks and the Screaming Oak.

- Tweaked one outro for Francis in The Passing using the same odds factor and weight.

5/6/2020

- Improved the conversation for Ellis and Nick reacting to the freeway getting bombed on The Parish - Chapter 3

- Rochelle will now comment directly about the outhouse in front of the Plantation. (This line will no longer be a NearFinale line)

- Got rid of duplicate IsNotSpeakingWeight0 criteria for blank info_remarkable responses.

- Moved one of Coach's Generic NearCheckpoint lines to be played on the proper chapter (Swamp Fever - Chapter 3)

- Extended the RNG Range system/method to be used when Coach remarks on the sign near the saferoom exit on The Parish - Chapter 2

- Applied Talk contexts to c7m1_harborblocked so that the other info_remarkable point nearby won't be activated by Francis.

5/7/2020

- Fixed Churchguy using the wrong concept for his ding dong lines.

- All survivors should now be able to manually and automatically spot all valid weapons in the vanilla game. (This includes the CSS weapons)

- Cleaned up a bunch of other "SpotWeapon" instances so that they are consistent across all survivors

5/8/2020

- Extended the RNG Range system to be used on The Passing's Chapter 1 intro

- Coach leaving the Starting Area on The Passing - Chapter 1 will use "NoResponse"

- Leaving the Starting area on The Passing - Chapter 1 will prompt a teammate to warn you not to continue without a first aid kit.

5/9/2020

- Got rid of map specific ConceptSurvivorLeavingInitialCheckpoint rules for The Sacrifice - Chapter's 2 & 3 (There are generic versions that functions identically.)

- Conceptc6m3_outro3 will now use IsNotIncapicitated.

5/10/2020

- Fixed an incorrect context applied when Nick uses his TalkIdle for the plane door.

- The TalkIdle for the plane door will no longer work if a Tank is present in the map. (But it will resume once that tank dies, thanks to Salad for suggesting.)

5/11/2020

- Removed irrelevant lines when picking up a chainsaw.

- Fixed an incorrect reply for Ellis during one of the Ferry Crossing conversations.

- Nick will now comment on the FeedGators point.

- Further tweaks to Swamp Fever - Chapter 1's intro and FerryCrossing.

- Removed many "SurvivalMode" related contexts, criterions and responses for Crash Course (Now updated for the func_orator entity(ies)) to consider the gamemode.

- Threw out unnecessary criteria for C7M3FinalSpeak<> for all L4D1 survivors.

- Corrected C7M3FinalSpeakNamvet for Zoey so that it follows the same patterns as the rest. (It should work now)

5/12/2020

- Removed one of Nick's lines from the IsWorldC1M1First remark.

5/13/2020

- ChurchGuy will now have a versus exclusive response. (To test)


5/14/2020

- Zoey's and Francis' "Get to the Farm House!" remark will no longer play after a survivor touches the radio for the first time. (Thanks to Niels_L for reporting.)

- Tweaked ConceptC7M2CrowsFlySpeak for all L4D1 survivors just in case. (Formatting)

- PanicEvent + CarAlarm for all survivors (for the second and third car shot in The Parish - Chapter 3) will now all use the same "25% chance to fire" criterion

- Generic PanicEvent + CarAlarm for the L4D2 survivors will no longer use story related voicelines.

5/15/2020

- Fixed several incorrect criterions used for the orator's gamemode criterion for the Crash Course campaign. (Thanks to Lt. Rocky for reporting!)

- Fixed an incorrect timing on one particular line of the Crash Course intro.

- The Plane Door and Ferry's TalkIdle nags will use _auto_TimerLock contexts. They will also occur at slower paces (Thanks to Rocky for suggesting)

- Readjusted timers for both the Ferry Nag and the Plane Door Nag (Thanks to Lt. Rocky for suggesting!)

5/18/2020

- Fixed an issue where a L4D2 survivor could remark on the Historic Tour sign just before the conversation on The Passing - Chapter 1 (Thanks, Lt. Rocky for reporting)

- Included a check for the damagetype to NOT be DMG_BLAST (explosive damage) for certain FriendlyFire rules (Thanks, Lt. Rocky for reporting)

5/19/2020

- Removed unnecessary context applications for the ends of saferoom/chapter 1 intros (Many campaigns).

- Removed L4D2 survivor rules for leaving the saferoom on The Passing - Chapters 2 and 3 (That does NOT prompt a genuine voiceline response - Generic variants already exist)

- Optimized C7M3WaveOver to preserve the same functionality and use less materials

- Got rid of the Talk context application when spotting the "rescue vehicle" on The Sacrifice.

- Saferoom intro rules that activate via TalkIdle that does not have the "NotInCombat" criteria will now have it to remain consistent with the other maps. (Same applies for not having IsInStartArea)

- Removed a rule for Ellis leaving the starting area on Dark Carnival - Chapter 1 (Generic variant exists)

- Got rid of unnecessary criteria for the intro responses for The Parish - Chapter 5

- Applied SaidLeavingSafeArea to leaving the saferoom on The Parish - Chapter 5 to avoid the generic variant being fired

- Fixed an issue where Rochelle never says her "Pick up the radio" line on The Parish - Chapter 5

5/20/2020

- Deleted lingering "NotSurvivalMode" criterias in certain rules

- Got rid of irrelevant speaks for ConceptCallForRescue (No LostCalls should be in there)

- Changed the two lines Bill will say when he restarts the Generator on Crash Course

- The remaining safehouse and chapter 1 intros should now follow their respective formats

- Corrected a line in a potential saferoom convo on The Passing Chapter 2

- Corrected an incorrect rule used for Nick's PlayerTransition for Hard Rain - Chapter 3

- Corrected an incorrect context application for WarnHeardSpitter (Both for the c1 and generic variants)

- L4D2 survivors will now have cola pickup rules for both picking up the cola bottle for the very first time (world) and subsequent pickups

- Moved Coach's FriendlyFire15 scene to his C1M1 variant. 

5/21/2020

- Added Criterias for GoingToDie complaints so that the survivor can't be in the saferoom to trigger it. 

- Added a missing criterion for SaidGoingToDieC5M5 (Not a world context)

- Corrected context applications to reviving a survivor (both regularly, and ledges), healing themself, and healing others.

- Applied a criteria for Coach's survivor specific ConceptReviveFriendDownFinal so that it will never trigger on Dead Center - Chapter 1

- Got rid of two redundant revive rules for every applicable survivor.

- Nick's ConceptPlayerHealingOther C1 variant will now happen on Dead Center - Chapter 2

- Got rid of context applications on ConceptReviveFriendDownFinal

- Corrected EllisCrying criterion so that Ellis will now properly say the next line for his revive.

5/23/2020

- Moved a duplicate rule (PlayerRemarkWorldC6M2_AfterGate1Coach) and converted it to be PlayerRemarkWorldC6M2_InSewer1GamblerCoach (an extra variant for when Nick is close by)

- Coach may have a different line for the second gate if Ellis interacts with the first gate on The Passing - Chapter 2

- Formatted many things for The Passing, The Sacrifice, Crash Course.

- Certain lines for C6M2_OpenGateX will have a predelay to time it with the gate being open enough to pass through

- Fixed an issue where L4D2 survivors doesn't declare that they are incapicitated on The Passing - Port on Survival and Scavenge

- L4D2 survivors will voice a weapon pickup line after calling out the store on The Passing Chapter 1, then picking up a T1 weapon.

- Applied megamob warnings to the remaining survivors when opening the First gate on The passing chapter 2

- Fixed a broken rule for Rochelle so that she can confirm that the team is walking through sewage on The Passing - Chapter 2

- Angel Wedding Warnings will now make sure that Ellis is 400 hammer units away (800 units is too far for whispered tones)

- Fixed a duplicate rule for InfoRemc7m1_pretank04 for Francis

5/24/2020

- Corrected context applications for picking up a T1 shortly after calling out the store on The Passing Chapter 1 so that no more than a single survivor will say their respective pickup line

- Bots will specifically call out laser sights when they are picked up. The first bot to call it will say the line. (Many factors apply so that it doesn't get repeated. Thanks to Lt. Rocky for suggesting)

5/25/2020

- Fixed an issue where Rochelle tells Ellis that the stock car is just a car when Francis was in the Chapter 1 intro.

- Fixed an issue where one of Whitaker's responses doesn't have him nagging after 10 seconds if Coach is "from"

- Corrected a context application for one of the c4m4_garagesale remarks for Rochelle.

- The NearFinale instances on The Sacrifice (Louis and Bill) will no longer use story related lines to avoid repeats

- Added the out of tunnel context for Nick's c2m3seechopper

- Fixed survivors never having a cooldown when deploying upgrade packs. (Credit to Lt. Rocky for accidentally pointing me to the problem)

- The L4D1 survivors will now have a chance to say something when picking up deployed and undeployed upgrade packs.


5/26/2020

- Nick will no longer comment on c2m3_coollight and will instead, reply to Ellis with that same line. ("Dang, look at Nick's jacket." - Thanks to Lt. Rocky for suggesting.)

- Corrected an issue where Zoey talking an adrenaline or defibrillator will result in her saying lines when picking up pain pills.

- Removed duplicate criteria for Francis deploying upgraded ammo.

- Fixed an issue where Rochelle always calls out the helicopter after the concert.

- Rochelle will no longer tell Ellis that blood farmers may be alive more than once after spotting the village.

5/27/2020

- John Slater will no longer call for the survivors to board his boat once the boat leaves.

- Deleted ChanceToFire70Percent from Francis' introFarm2

- Corrected the "IsNotSaidc2m2_carousel" and "IsNotSaidc2m4_evac" criterion for Nick

- The InC13M4Smoke context will no longer be a world context.

5/28/2020

- Fixed Rochelle not telling the group where they are on the Swamp Fever chapter 1 intro.

5/30/2020

- Moved the WorldSignStayInGroup remarkable to be in the trailer before running to the tower.

6/1/2020

- Moved Rochellle's DLC1_C6M2_Phase2InWater01 to being a response to Nick (was formally a remark)

- Fixed Francis' C7M1 pretank remark so that Louis must be nearby and alive (instead of bill again)

- Survivors will no longer remark on IsNotSaidc7m1_pretank if someone is already interacting with the door.

- Removed useless rules for picking up a gun just after the elevator doors open (Rules for picking up the unsuppressed SMG, it will never be used in vanilla)

- Removed unnecessary contextual applications when picking up the Silenced SMG on Dead Center - Chapter 1 (<Survivor>PickedUpItem - The context is applied to the world when it should be just for that survivor)

6/2/2020

- Moved one of Rochelle's line for spotting mud people to her first reaction on Swamp Fever - Chapter 2

- Picking up the Silenced SMG out of the elevator on Dead Center - Chapter 1 will now use ExtraWeight10 (Guarantees first pickup line)

- C11M5NearFinale response will no longer require NotInCombat

6/4/2020

- Removed unrelated story critical lines from the churchguy scenario.

6/5/2020

- Nick should no longer be in combat to sound witchville lines on Hard Rain - Chapter 2

- Fixed an issue where Nick is sounding his C1 HeardSpecial lines on every map (Charger only).

- PlayerWarnHeardZombie rules will now have extra requirements:

	1: Regular rules - Can't be alone, closest survivor must be 1200 units away, escape vehicle must not be ready. (Witch only: Instead of the rescue vehicle, it will instead require that the finale must not be started already)
	
	2: C1 rules - Can't be alone, closest survivor must be 1200 units away.

6/8/2020

- ChargerRunningWithPlayer lines for Rochelle and Ellis will occur when getting ridden by a Jockey on Dead Center - Chapter 1 only

- Filled in more missing story essential voicelines. 

- Added an info remarkable at the destroyed bridge on Dark Carnival - Chapter 1

- Removed Midnight Riders info_remarkable

- Fixed c4m4_porchlight and c4m4_playground

- Survivors who are downed will now sound any friendly fire lines.

- ConceptPlayerGroundPoundedByTank will now have cooldowns.

- IsFarm02_path08 will now have "Affirmative" responses instead of swearing.

6/9/2020

- Fixed an issue on Crash Course Chapter 2 where Louis killing the first tank of the finale doesn't sound anything.

- Tweaks to c2m4neargate (Removes lines from C2m5 intro)

6/12/2020

- Added and moved various lines in relation to Dark Carnival.

- Added one line to Ellis for Swamp Fever (Gator sign remarked by coach)

6/13/2020

- Removed ChanceToFire40Percent from Coach's remark of C4m1_inburgertank

- NearFinale for Hard Rain chapter 5 has been converted to a Remark for c4m5_burgertank (The NearFinale rules will instead fire print " ")

6/14/2020

- Witchville responses will use norepeat.

- Reorganized certain witchville lines to be replies instead.

- Removed a duplicate rule for Nick being near the checkpoint on Swamp Fever - Chapter 2

- Implemented the RNG range method for the following Remarks: c2m1_searchlights, c2m2_thistall, C3M2PlaneCrash

- Removed Talk Contextual applications from autoblank remark rules.

6/15/2020

- Fixed a couple revised intros to Swamp Fever.

- Removed unnecessary contextual criterions/applications and criterias related to Swamp Fever

- C3M1FerryLanded responses have been converted to TalkIdles (after the ferry has arrived to carry the survivors across)

- Removed an unnecessary concept for Crash Course (ConceptHowitzerBurnEnd02)

- ConceptHowitzerFired will now have all survivor celebrate the barricade getting destroyed in all gamemodes (Except Scavenge) - DLC2BridgeClear01 lines has been moved to HowitzerBurnEnd00

- ConceptCrashFinaleGenerator2OnSpk for Louis will use "Got it!" lines instead of "Sweet baby!"

- Ellis will ask Rochelle about stuff being "Worse than Zombies" on Dead Center Chapter 1

- Survivors will no longer respond to Coach's HeardWitch01 line.

- Fixed an issue where Rochelle getting the first Idle on Dark Carnival - Chapter 3 (Saferoom) will apply the worldTalk context for a limited time

- Fixed Rochelle's ConceptC13M4NoticedHelicopter using the wrong line

- Commented out GrenadeCareful responses for now until I can figure out how to make them less spammy.

6/16/2020

- Rochelle and Coach will no longer warn about car alarms due to their warnings using story critical scenes.

- The Car alarm context will last 300 seconds once activated

- Moved certain lines for spotting the safehouse on Hard Rain Chapter 4 to a remark on Hard Rain - Chapter 5

- IsWorldC3M1FerryCrossing will no longer require worldTalk. However, worldTalk will be active for the duration of the time the Ferry is returning across the bayou

- Removed a duplicate line used in both C6M2GateOpen concepts for Coach

- Rochelle will sound her proper NearCheckpoint line for Dead Center - Chapter 3, the remaining two lines have been moved to PlayerTransition for Dead Center - Chapter 3, also removed a story critical NearCheckpoint line from Rochelle's generic variants

- Fixed Nick's starting TalkIdle not applying proper contexts on Dark Carnival - Chapter 5

- Moved Nick's first c2m5 safehouse line to c2m4seechopper

6/17/2020

- Fixed incorrect contextual application when Nick remarks on either of the boats in Hard Rain - Chapter 1

- Removed all "EllisMapCXMX" criterions and replaced them with their generic map variants (They both are "map" criterions)

- Fixed a couple more info_remarkables

- Renamed c5m3wargrafitti to c5m3warzone and moved it to the top of the trailer that the survivors can jump on.

- Heavy rework to C5M3Sniper remarks + RNG range implemented for it

- Fixed the concept airport03_barriera never successfully being fired due to redundant criteria. (Also removed any contextual applications and replaced their respective "IsSubjectNear800" to "IssuerClose")

- Removed Contextual applications, ChanceToFire10Percent, and RecentGroupInCombat2 from all ConceptAirport03FirePathCleara variants

- ConceptAirport03FirePathClearX will no longer prompt all survivors to respond at the same time, it will only use Any.

- ConceptAirport03FirePathClearX will no longer apply contexts. 

6/18/2020

- Changed the criteria for a few WorldSigns remarkables.

6/19/2020

- Francis will have a small chance of calling the Jockey a "Little Vampire" (odds 20)

- Fixed an issue where survivors doesn't immediately say anything when opening the alarmed door on Dead Center - Chapter 3

- Survivors will no longer remark on the alarmed Windows and Door in Dead Center - Chapter 3 if the Alarm has already been activated

- Fixed the C1M3UpEscalator2 info_remarkable

- Optimized IsC1M3TurnOffAlarmX rules so that it will only use one of its kind, (Deleted rules for IsC1M3TurnOffAlarm2a, etc)

- The IsC1M3TurnOffAlarmX remarks will only trigger during the gauntlet event.

- Optimized C1M3CEDAGone

- Moved C1M3UpEscalator3 so that it will work for both escalator spawns

- Restored voicelines for Coach's IsC1M3ThisWay

- Restored voicelines for IsC1M3UpEscalatorX and IsC1M3DownTheEscalator

- Rochelle's special WarnHearHunter line will now only occur on Dead Center - Chapter 3 (Only if Coach remarks on IsC1M3FoodCourtOkay beforehand)

- Added the FaultName "Left4Dead" to be available for modders

6/20/2020 

- Implemented the RNG range method for Isc7m1_pretank

6/21/2020

- Louis should now tell Francis about the boat on The Sacrifice - Chapter 3 if he is close.

- Fixed Coach's response for C5M3SeeGraveyard03 (Remark by Nick)

6/24/2020

- Included Zoey's ArrivePlane0X lines for Dead Air's "GetToVehicle"

- Fixed an criterion required for Coach's Spitter warning on Dead Center.

- Certain SI reactions (Gooedbyspitter for example) will have their own exclusive C1 rules (will disable on "Know<>" contexts)

6/25/2020

- Easter Egg for Coach if he is in the helicopter but Nick isn't (Concert)

- GetToVehicle rules will now mostly use the same method (there will be special cases)

- Slight tweak to the Hard Rain intro.

- PlayerRevive and Ledge save will require that the escape vehicle isn't involved (arriving, arrived)

- Tweaked Coach's WorldC5M5 lines to fit more in context (Reviving a player during the final run, spotting the tank during the final run will trigger a special line without the need to go in ThirdStrike, etc)

- Fixed an issue where only Nick is required to be present to start the Hard Rain intro

- Concept_c4m1Intro03 will now require that everyone is alive. If starting the campaign in a mutation where this is not the case, the intro will simply end after Virgil's second line. (Just in case it can trigger in any mutations)

6/26/2020

- Tweaked BridgeLeap rules.

6/27/2020

- Fixed the Saidc1m4escape context not being a world context

- Optimized Whitaker rules for pressing the gunstore door

- Added concept C7M3BridgeReady for when all survivors are on the bridge and the button unlocks (Thanks, Rayman)

- Optimized a few rules/responses in terror_player_addons_dlc3

6/28/2020

- Fixed an issue with a couple GetToVehicle rules for The Sacrifice

- Safehouse intros activated by an info_remarkable should now use less unique criteria. (Also removed related unique criteria for those info_remarkables)

- Made all TalkIdles that sets up the saferoom's intro into a single rule that works with all maps. (This will delete many useless rules and ultimately optimize the talker)

- The Generic SurvivorLeavingCheckpoint (or leaving the starting area on the first chapter) will now apply Talk:0:0 to the world

- Threw out any SurvivorLeavingCheckpoint that is meant to be for a specific map, but is also blank and applies Talk:0:0 (Exemptions apply)

- Adjusted many rules' criteria and contextual applications in response to the previous changes

- Fixed an issue with The Parish's - Chapter 1 intro playing with the wrong method (instead of Ellis being the initiator via "JoinLast", it will instead use the map intended director input for "FireConceptToAny + introC5M1")

- introCXM1 concepts will no longer be bound to a map.

- Tweaked Smalltown04_Path01/02 remarks

6/29/2020 

- Removed "worldTalk" applications for C5M5_Button2 and C5M5Button2 (+ all other rules that follow that)

- Replaced worldTalk<>:1:5 with worldTalk:1:12 for killing the tank on Dead Center - Chapter 2

6/30/2020

- Readjusted Ellis' LostCalls to not use campaign and Misc scenes.

- Adjustments for Hard Rain - Chapter 1

7/1/2020

- Added the chapter 1 intros and remarks to the Last Stand campaign

- Gave IsNotSpeakingWeight0 and NotInConcat to the remarks in the Cold Stream campaign.

- Completed orator related rules for the panic event in The Last Stand - Chapter 1

7/2/2020

- Removed Specific FF lines that were just louder name calls.

- Restored Louis' and Zoey's "NiceShot" lines.

7/5/2020

- Restored L4D1 ReactionDisgustedXX lines for PlayerVomitInFace

- Restores Zoey's BoomerReactionXX lines for PlayerVomitInFace

7/11/2020

- Fixed incorrect world context being applied when starting the generator

- Replaced Ellis' line for c5m2people

- NearFinale for c1m4 will use print " " instead, restored use for the triggered c1m4jimmyidea

- Added one line for Nick when transitioning from Dead Center - Chapter 3

- Coomented out Beta Soldier rules for The Parish

7/12/2020

- Slight tweak to the Hard Rain Chapter 1 intro.

7/13/2020

- The Sacrifice's intro will now use the lcs method instead of TalkIdles. (Requires scene fix)

- All campaigns that use the lcs_intro method will now use Trigger1 for all survivors, meaning that certain survivors are no longer required to spawn in order for the intro to start in Chapter 1's.

7/14/2020

- Improved the Dead Center scenario to have a unique case when alone.

- TransitionCloseXX lines now strictly require that someone HAS to die. It is no longer bound by intensity.
(There are special cases depending on the survivor and map)

- The one who activates the Howitzer will now cheer the explosion.
(Everyone will still cheer in survival, though)

- Removed worldTalk contexts from the Hard Rain and The Parish intro rules.

- Removed worldTalk context application, worldTalk criterion, and the map criterion from the C5M1flyby rules

- The orator's c4_storm_start will now only use a single rule, removed the _auto_NotC4<>InCover criterion for the orator's rule

- Added worldTalk 1:4 to the talkidle for Coach and Nick for getting to the ferry on C3M1

- Tweaked campaign intros to be semi compatible with more starting instances (Number alive)

- Saferoom intros should no longer start if the survivor is the only one alive (Last Man On Earth/Lone Gunman for example)

- c1m4escape will trigger worldTalk:1:0

- c1m4escape is now more detailed. Whether or not they tell Ellis to floor it depends on if Ellis is alive AND he is not incapicitated

- c6m3_outro will apply worldTalk:1:0

- C3M4Outro will apply worldTalk:1:0

- C5M5Outro will apply worldTalk:1:0

- Fixed c2m1_carwreckage

- Fixed c4m3_flooded and c4m3_flooded2

- Fixed Nick's IsWorldC6M3_ByBridge remark.

- Fixed Nick's PourStarted when he's the only one alive.

- Fixed an issue where survivors wouldn't call out the shovel when spotting it.

- Nick will now grunt when killing an SI with a melee weapon.

- Many other various fixes.

7/15/2020

- Moved one of Rochelle's lines to be an entrance sign remark.

- Improved banter about Ellis' height on Dark Carnival - Chapter 2

7/18/2020

- Fixed incorrect contextual application when a player shoots a Scavenge Gascan.

- L4D1 survivors leaving the safe area to start the scavenge round will now apply the appropriate context indefinitely. (This will also reset when the round ends)

- Applied Talk<> contexts when attacked by SI (For remaining instances)

- Responses to being ridden by a jockey will now be more dynamic (Can recognize the jockey during Dead Center - Chapter 2 if called out prior)

7/19/2020

- Survivors will no longer (automatically) warn that they heard any Si when they're in safe spots/checkpoints.

- Got rid of two rules for Nick and Ellis calling out the alarmed car on The Parish - Waterfront (The info_remarkable does not exist)

- Survivors will no longer call out generic megamob warnings when in the saferoom.

- Generic Megamob warnings will no longer happen in Scavenge and when the escape vehicle has been spotted

- The map specific MegaMob Warning for Dead Air - Chapter 5 (Finale triggered + First half) will no longer happen in survival mode.

- Removed contextual application that indicates the finale has started on The Parish

- C6M3 Niceshot rules will now require that the person must be at most 1500 units away from the issuer.

- Got rid of all "ScenarioJoinLast" related rules (Also deleted the criterion for JoinLast)

- Removed worldTalk contexts from FinalVehicleSpotted for the L4D1 survivors

- Fixed incorrect context applied when shooting a gascan

7/20/2020

- Fixed an issue where John Slater would still nag the survivors to get in the boat even after the boat has already taken off.

- Blocked L4D1 survivors' automatic lost calls for the following events:
1: The survivors have answered the radio for the first time on No Mercy, Death Toll, and Blood Harvest
2: THe Churchguy hears a survivor outside of the saferoom
3: The AC-130 Pilot calls out to them for the first time
4: The survivors remark on the truck in Crash Course - Chapter 2 or they begin to activate the generator (Orator applies the context)
5: The survivor is activating the first generator on The Sacrifice.

- Survivors will no longer say that they are activating the generator if they are the only one alive.

- IsAllInSafeSpot will now use "NumberOutsideSafeSpot" (0) instead of "NumberInsideSafeSpot" (4)

- Fixed cooldown for deploying the explosive ammo pack.

- The context used for picking up an item will now use a single, non-world context

- The context used for saying friendly fire lines will now use a single, non-world context

- The contexts used for Witch Attacks will now use a single, non-world context

- The context for attempting to heal a player with a first aid will now use a single, non-world context.

- ConceptAlertGiveItemStopFirstAidA and ConceptBashWithItem will now use print " "

7/21/2020

- All generic "KilledZombie" instances will now require that the killer is not currently speaking and that the escape vehicle has not arrived yet.

- Moved L4D1 blank responses from terror_player to their respective talker scripts.

- The contexts used for the L4D1 survivors moving to a battle station marked nav will now use a single, world context (this means that only one bot at a time will say their battle station lines)

- Conceptc5m3OnBridge will use print " " for Rochelle and Ellis

- Fixed L4D1 PanicEvent rules so that the subject is NOT themselves.

- THe survivor who shoots the alarm car is guaranteed to swear.

- Slight tweaks to shooting the alarmed cars in the Parish - Chapter 3

7/22/2020

- The context used to remark Isairport01_burning is now a world context.

- The context used to remark Isfarm01_camping is now a world context.

- Fixed Francis never responding to the plan in Crash Course - Chapter 2.

- Removed one reused story critical line from Coach and Ellis when being near the finale (Generic)*

- Removed one Generic Hurrah from Rochelle when being near the finale (Generic)*

(In short, all four L4D2 survivors will just shout "Almost there!" when first entering the finale area in Generic instances)*

- All NearFinale rules should no longer fire in Survival and Scavenge

- The L4D1 response for someone calling out the safehouse will now use IssuerClose

- Removed all map specific SafeRoomStart rules for Crash Course - Chapter 2, Crash Course - Chapter 2 specific NearFinale rules have been created in its place (NoResponse)

- Restored Automatic "PlayerAlsoWarn" rules for the Hunter, Smoker, and Boomer (Rules will share the same contextual circumstances)

- Restored manual vocalization rules for calling out the Spitter, Charger, and Jockey (Rules will share the same contextual circumstances)

- The special conversation where Ellis claims credit for a kill he didn't do will now happen only when he automatically calls out SI via AlsoWarn

7/23/2020

- Blocked the Tank specific conversation when killing a tank on Dead Center - Streets in survival mode (Also ensured the conversation will not repeat in the event of multiple tanks)

- The map specific tank callouts for The Passing - Port will now be blocked if the map is in survival mode.

- Fixed Bill never calling out the Boomer, Hunter, and Smoker

- Blocked all remark rules for Scavenge and Survival

- Blocked all PlayerNearCheckpoint rules for Scavenge and Survival

- Blocked the Churchguy triggers for Scavenge (For the actual door/panic event, this is for Rayman to handle)

- Bill's ConceptFarm02_path01a will use IssuerReallyClose instead of IsSubjectNear200

7/25/2020

- Fixed survivor bots saying their "MovingToBattleStation" Rules when they're currently speaking.

- Fixed an issue where survivors reacting to their first SI encounters happening when they are being attacked by said SI.


7/26/2020

- Ellis will now respond to Coach when he notes "Report Unusual..." on The Parish - Chapter 1

- Added two extra scenes for Bill getting shot by Francis.

- Added one more remark for c14m2_lighthouse

- The PlayerNearFinale rule for c14m2_lighthouse will now issue a print " " response. (Uninterrupting blank)

7/28/2020

- Improved The Last Stand Chapter 1 intros.

- The Rules used to enable Ellis to share his story about Keith will now use a Generic variant that works for all maps.

- Adjusted many contexts applied for both the story enabling rule and the rules where Ellis shares his story

- Added an additional context applied when starting the elevator in The Passing - Chapter 3: (worldTalk:0:0)

- If Ellis leaves the saferoom first while he is telling a story, someone will immediately interrupt him.

- Ellis will no longer be able to tell a story if someone leaves the saferoom.

- The context applied when calling for help when incapicitated will now use a single, non-world context.

- Removed useless criteria from Ellis' story rules that say that the gamemode cannot be Scavenge or Survival (Already has a criteria that specifies Coop)'

7/29/2020

- Completed callout of the plane flying by and the reaction when its engine gives out.

7/31/2020

- Fixed conversations for Whitaker continuing if the store's alarmed doors open at certain points in the convo.

8/1/2020

- Fixed survivors making a first reaction to SI on Dead Center - Chapter 2 if they are incapped.

8/4/2020

- Fixed an issue where Nick invokes his default rule for ConceptPlayerLockTheDoorCheckPoint

- Removed a line from one of ELlis' rules when responding to Rochelle about the gunstore

- Fixed an issue where the Survivors still invoke a talkidle when the Ferry event finishes.

- Fixed an issue where Ellis says he's grabbing an axe when he really grabs a guitar.

- Added a new info remarkable entity to Dark Carnival - Chapter 2, replaces a duplicate c2m2_burgers point.

- Eliminated useless rules for remarking to shut down the coaster c2m3_coasteroff (It will now use the same contextualname for all three info_remarkables)

8/11/2020

- Applied a world context for calling for rescue from a rescue closet.

- Whitaker will now fire a hunting rifle when he gets interrupted by a zombie.

8/15/2020

- Adjusted Canadian SI lines to 10%.

8/16/2020

- Fixed an issue where Nick would give the wrong answer when asked how many players are alive in Swamp Fever - Chapter 4

- Fixed an issue where the PlayerIncapped lines (L4D1 survivors - The Sacrifice: Chapter 3) would fire if the player that gets incapped is currently on the bridge. (After someone jumps off)

- Isc4m1_InBurgerTank proximity is now 200 units

- The "GetToVehicle" rule for being out of the boat in Swamp Fever - Chapter 4 will now require the player's movement speed be above 200 hammer units per second

- Virgil's pre-finale nags now increased to 7 seconds.

8/17/2020

- IsC3M2Start has now been converted to a map specific "SurvivorLeavingInitialCheckpoint" for Swamp Fever - Chapter 2

- Readjusted when the "world_auto_Finale:2:0" context gets applied.

8/18/2020

- Spotting the tanks in The Passing - Chapter 3 in Versus mode will now use generic callouts.

- Halved the distance required for Zoey and Francis to suggest using the van on Dead Air - Chapter 4

- Fixed an issue where Survivors say their unique Tank Kill rule on The Parish - Chapter 5 in survival mode.

8/26/2020

- Adjusted many rules. (Added "Is<>Alive" if rule had "Is<>NearXXX")

8/27/2020

- Added MiniFinaleGetReady lines to Zoey and Francis when warning about a megamob.

- Disabled c2m3seechopper on versus modes.

8/28/3030

- Added c4m4_truckwreck to c4m4_milltown_b

- Doubled distance for c5m3crashedheli

- Changed the map specific PlayerNearFinale response (again) for c3m4_plantation

- Ellis can now commant on c2m4_moustachio

8/31/2020

- Fixed ConceptPlayerPourFinished on C6M3 not applying the worldTalk context.

- The ConceptPlayerPourFinished rules specifically for c6m3 will now require that at least one L4D1 survivors are alive.

9/1/2020

- The WorldC1M2Abandoned remark will now require that the activator's intensity be 0.

- GooedBySpitter will now be blocked if the survivor is incapicitated

9/2/2020

- Manually calling out an SI via custom vocalizers will now never apply contexts.

- Automatically calling out a Tank or a Witch will not reset the general timer for warning SI (I hear a...)

- Players can now call out ammo manually via custom vocalizers.

9/3/2020

- Removed a rule where Ellis calls out the tank on the finale of Swamp Fever.

- The rule that fires when the first car alarm goes off on The Parish - Chapter 3 will cancel out any megamob warnings.

- The remaining talker rules that fire a blank scene in relation to The Sacrifice - Chapter 3 will now fire print " "

- Removed Falling-To-Death screams when Louis, Zoey, and Francis sacrifice themselves when they get incapped.

- Nick's World420 line is now used as an info_remarkable point. This one will only be used if no tanks are present and the finale has currently started.

- Ellis can now comment on IsWorldC502Smell (50% chance on approach)

- Rochelle can now comment on Isc5m2park

9/4/2020

- Orators can no longer nag to get to the escape vehicle (Virgil, Soldiers,etc.) after the vehicle has already left. (This is mostly for Versus since the response keeps firing)

- The two soldiers on c5m5_bridge will no longer take turns nagging the survivors to get to the helicopter. (No more alternate nags)

9/5/2020

- Tweaked escape instances to be more elaborate (No Noticable changes) 
	1: Added FinalVehicleArrived to ensure that players use GetToVehicle rules accurately.
	2: Tweaked contexts to reflect escape scenarios.
	
- Disabled PlayerTransitions for c1m1_hotel (L4D2 cast only)

- Removed specific criteria and contextual applications when francis starts the c6m3 outro (Replaced with generic context and criteria.)

- Also removed specific criteria and contextual applications when survivors speak the first line of the c6m3 outro (removed entirely)

- Removed distance criteria for remark: WorldC1M2Abandoned

ToDo:

L4D2 Survivors: L4D1 interactions (Post-Vanilla)


Notes: 
This changelog describes all changes in chronological order, certain things may have been rolled back during time of development.

# SectionI
==[top](#Contents)==

### RocketDude Changelog

Left 4 Dead 2 RocketDude Changelog by ReneTM & Community Update Team https://steamcommunity.com/groups/l4d2cut

14.06.2020
------------------------------------------------------------------------------------------------------------------------------

- adjusted director options for common and special infected spawns
- medkits dont get removed anymore
- added logic to check if a rocket hit a ceiling/floor or a wall (ground/floor="cloor" :3)
- added adjusted multipliers for cloor and wall rockets
- added gravity resistent rockets
- adjusted blast power in general
- players will now take 1 dmg for every valid rocketjump/blast in their face
- TF2 blast values almost match the avg reachable height with a single rocketjump now

15.06.2020
------------------------------------------------------------------------------------------------------------------------------

- increased survivor max health to 250
- bots dont do friendly fire anymore
- disabled ledge hang
- set default melee to baseball_bat
- reduced SI-Spawns
    before: ( MaxSpecials: 16 ChargerLimit = 4, HunterLimit = 4, JockeyLimit = 4, SmokerLimit = 4, BoomerLimit = 4, SpitterLimit = 4)
    now:    ( MaxSpecials: 12 ChargerLimit = 2, HunterLimit = 2, JockeyLimit = 2, SmokerLimit = 2, BoomerLimit = 2, SpitterLimit = 2)

21.06.2020
------------------------------------------------------------------------------------------------------------------------------

- fixed tank having 250 hp
- fixed boomer having 250 hp
- removed that all trigger_hurts get removed
- adjusted
    - MobSpawnMinTime = from 16 to 32
    - MobSpawnMaxTime = from 32 to 64
- adjusted MaxSpecials from 12 to 10

27.06.2020
------------------------------------------------------------------------------------------------------------------------------

- added mushroom spawns for Dead Center 1-4 for testing
- fixed activator bug

05.07.2020
------------------------------------------------------------------------------------------------------------------------------

- fix perma horde
- fix FPS-Loss when infected spawn
- decide if bots should be able to bump around cars
- grenadelauncher applies DMG on multiple ticks
- playtesting & playtesting

12.07.2020
------------------------------------------------------------------------------------------------------------------------------

- added bullettime

12.07.2020
------------------------------------------------------------------------------------------------------------------------------

- set cm_NoSurvivorBots to 0 for testing

13.07.2020
------------------------------------------------------------------------------------------------------------------------------

- fixed double execution of RocketJump code
- added bullet time for killing infected ( max every 10 seconds with a probability of 20% only )
- improved probability function for bullet time

14.07.2020
------------------------------------------------------------------------------------------------------------------------------

- fixed survivors max health not getting set for following chapter after the first
- fixed survivors ledge hang not getting disabled after following chapter after the first
- adjusted tanks health to the totally overpowered grenadelauncher (thats the only SI health change tho)

17.07.2020
------------------------------------------------------------------------------------------------------------------------------

- adjusted rocket_launcher_projectile start offset
- fixed double velocity bug
- added mushroom positions for c14m1_junkyard and c14m2_lighthouse
- once a player collects a mushroom he will able to use auto bunny hop
- cleaned up code a bit ( still needs to be polished for later revisiting )

18.07.2020
------------------------------------------------------------------------------------------------------------------------------

- added rollDice function for easy probability calc.
- lowered probability of bullet time from 20% to 15%
- fixed bug for bunny hopping player
	(activator is trigger itself because wo do touchtest. So we need the nearest player )

18.07.2020
------------------------------------------------------------------------------------------------------------------------------

- reduced bullet chance to 7% which is still very acceptable
- fixed tank's hp being 0 on multiplayer
- on c14 maps the player will have no melee by default for now cuz bat is unavailable

19.07.2020
------------------------------------------------------------------------------------------------------------------------------

- survivors spawn now with a random sharp melee which is defenetly available on the map.
	- in the future, replace with GetAvalableMelees() which hooks mission.txt to improve performance

19.07.2020
------------------------------------------------------------------------------------------------------------------------------

- added replacement method to get an available Default Weapon
- taking a mushroom will apply an adrenaline effect for 7 seconds

19.07.2020
------------------------------------------------------------------------------------------------------------------------------

- grenade launchers that get dropped by a place holder bot now get removed
- fixed player getting marked as 'bunny' even when he touches the mushroom while being full hp
- fixed player respawning with a shotgun
- fixed first aid kids not spawning
- changed director item spawning from ItemsToRemove to ItemsToPreserve because its less ;D

20.07.2020
------------------------------------------------------------------------------------------------------------------------------

- reorganized scripts
- fixed medkit spawns when rocketDude gets started on non-valve map

22.07.2020
------------------------------------------------------------------------------------------------------------------------------

- added new rarity colors to the mushrooms
	(gold...lets call it yellow +75, pink +50, blue +25 and white +10)
- mushroom models will now have the same rendercolor or a similar one to the glow
- simplified function to avoid grenade-launcher-drop

23.07.2020
------------------------------------------------------------------------------------------------------------------------------

- fixed weapon_gascans & weapon_cola_bottles get removed
- added event to listen if 'single' survivors enter the saveroom
- when survivors enter the saferoom or leave with a rescue vehicle 
	there will be a chat output for how long he spend on the ground instaed
	of launching himself through the map( player_step would be cooler tho)

23.07.2020
------------------------------------------------------------------------------------------------------------------------------

- added "tiny" mushrooms to most of the maps...some are just too tiny.. ;D
- fixed "random sharp melee" giving
- added "ScreenFade" to visualize a "bloody" effect additionally to the adrenaline effect
- on arriving at the saferoom / leaving with rescue vehicle will output Time() of the survivor needed + the % of midair time

24.07.2020
------------------------------------------------------------------------------------------------------------------------------

- updated logic of RD_melee_getter.nut

29.07.2020
------------------------------------------------------------------------------------------------------------------------------

- excluded bots from autohop check
- excluded bots from on ground check
- removed try and catch in event function 'player_death' for getting attacker and victim
- fixed time spent in midair message & calculation
- limited decimal places to of 'timespendmidair' and 'timeneededformap' to 2
- removed custom event res. files which are left overs of my attempt to use unhooked player_footstep event
- disabled DebugDrawBox of mushroom trigger visualisation at spawn

04.08.2020
------------------------------------------------------------------------------------------------------------------------------

- anv fixes get killed on multiple events now
- fall damage crack of landing has been disabled
- spawning mushrooms will access the mushroom data with "mapname".tolower() now

10.08.2020
------------------------------------------------------------------------------------------------------------------------------

- fixed players being able to use "last chance" more than once
- fixed heart beating loop not being stopped after using a mushroom
- fixed witches not being highlighted in last_chance_mode
- updated "Player x is a bunny now" message color
- added message when last_chance is used and the player is trying to get revived with an SI kill again
- re-organized rd_last_chance.nut

13.08.2020
------------------------------------------------------------------------------------------------------------------------------

- added dead instance check which checks for dead infected every second ( needed for "last chance" - glows )
- when all survivors are incap they will enter known "last chance mode" for 10 seconds.
	special infected will get highlighted with a glow and the survivor will enter black and white mode.
	when any of them gets killed the killer gets revived.
- added check "isPlayerCapped(player)"
- set hasdifficulty back to 1
- player now got 50/50 probability to get a sharp melee or a magnum at start

25.09.2020
------------------------------------------------------------------------------------------------------------------------------

- set "sv_infected_ceda_vomitjar_probability" to 0 to have no infinite vomit jars
- added AllowFallenSurvivorItem(item) to avoid infinite molotows or pipebombs ( fallen survivor can still spawn )
- set "sv_infected_riot_control_tonfa_probability" to 0 to avoid even more stuff flying around
- set "sv_vote_creation_timer" to 8 and "sv_vote_plr_map_limit" to 128 to allow the playing quick restart votes when he fails the "run"
	( modes/rocketDude.txt & script/vscripts/rocketdude/rd_director.nut )
- added cvar-changes to cvar listener
- added rd_map_specifics.nut to add easy mutation related map changes
    - c1m1 - removed trigger lower trigger_hurts
    - c8m1 - re-executed elevator fix
- added throwable listener to avoid infinite item spam
- changed cm_CommonLimit from 45 to 44 ( major change ;D )

29.09.2020
------------------------------------------------------------------------------------------------------------------------------

- removed PlayerUnderWater()
- added Speedrunner stats ( local use only )
- improved script performance ( simplified grenadeListeners noticable on Netgraph)
- fixed script enabling glows for projectiles on multiple ticks
- removed obselete code precaching an early dev model

12.10.2020
------------------------------------------------------------------------------------------------------------------------------

- fixed players ending up with no viewmodel and no avatar by rejoining a game where any survivor already left the saferoom
- added support for custom playground maps ( a guide will be provided by ReneTM )
- fixed players not instantly dying by jumping into c14m1 saferoom water area
- fixed players not instantly dying by jumping into c14m2 finale water
- lowered slowmotion probability from 10% to 5% as requested by many players
- fixed RocketDude decals sometimes not showing up.
- fixed new best times not saving
- added start and finish textures

18.10.2020
------------------------------------------------------------------------------------------------------------------------------

- common limit, spawnrange and mob sizes have been set to their default values to decrease server and client workload
- speedrunners may like the added chatcommands !disableslomo and !enableslomo. All players need to type them to change the state
- min time between slow-motion effect has been increased from 16 to 32 seconds

08.11.2020
------------------------------------------------------------------------------------------------------------------------------

Changes:

- tanks health increased from 7,14,28,56K to 8,16,32,64K (easy,normal,hard,impossible)
- throwables are now allowed ( no infinity there inspite of "sv_infinite_ammo 1") removed obsolete removeThrowables()
- health mushrooms will not give the bunny hop ability anymore
- when survivors leave the saferoom area their time will be set to 00:00
- slow motion is disabled by default. It will occur when survivors use mushrooms too often.
- added chat command !countdown to be used exclusively in starting areas for a synchronized start.
- increased witch hp to 2048,4096,8192,16384 hp

Fixes:

- fixed double execution of spawning level specific entities ( fixes c8m4_interior elevator issue )
- fixed mushrooms not being usable when a player reaches them less than 10 seconds after server start
- fixed dublicate c7m2_barge mushroom
- added cvar listener
- fixed fall damage and ledge hang sometimes getting disabled too late
- added auto start finale for cold stream and parish ( fix for survivors dying after entering rescue vehicle )
- fixed CTD on c4m3_sugarmill_b when a chapter restart happens
- fixed double execution of getSurvivorsInRange() in grenadeExplodeEvent()

Optimizations:

- merged multiple rocket and multiple tankrock listeners
- "last chance mode" will not fire anymore when jumping into deathly water
	( no 10 second countdown in this case anymore )
- improved performance of auto bhop method

Mushrooms:

- added health only mushrooms ( 16s to restore )
- added new random throwable mushroom ( 16s to restore )
- added new explosive mushroom ( 8s to restore )
- added new bunnyhop mushroom ( 1s to restore )
- added mushroom specific glow ranges & rotations
- added 175 mushrooms ( 474 in total now )

28.11.2020
------------------------------------------------------------------------------------------------------------------------------

- fixed sacrifice being unplayable alone
- fixed players being able to reset their time while leaving the saferoom as a dead survivor (free cam mode) (spooky huh)
- fixed weapons in c2m1_streets gunstore not converting to grenade launchers
- fixed "last chance mode" highlighting survivors also instead of only infected
- added visual indicator for mushroom pickups
- removed bullet time effect entirely
- added !info to print mutation info to the console

- improved speedrun chatcommands (restricted for local usage)
	!stats            -> prints all current besttimes to the console
	!speedrunmode     -> toggle between normal and speedrunmode
	!r                -> restart from the saferoom

06.12.2020
------------------------------------------------------------------------------------------------------------------------------

- fixed one script getting included with scriptname.extension (changes on compile)
- fixed c5m2_park explosive mushroom being inside of a health mushroom 
- fixed bus stations explosive mushroom rotations

04.02.2021
------------------------------------------------------------------------------------------------------------------------------

- reworked data structure for mushroom positions
- improved script performance
- revisited all mushrooms for visibility
- attached rotation entities to bhop mushrooms
- increased survivor_crawl_speed from 28 to 45
- fixed rocket launcher not being able to destroy the c1m3_mall event glass
- added hud to display current times for each survivor
- added chat command !hud to vote change the hud state
- reworked timer system
- fixed timer for survivors in saferoom already counting on spawn (yeah it was gettin reset by leaving the saferoom anyways)
- fixed !r causing an error on non valve maps
- added more options for map sided mushrooms (angles / rotating yus/nah)

07.02.2021
------------------------------------------------------------------------------------------------------------------------------

- added missing entries in list of chat commands
- added apendix hud notification for mutation information
- fixed players being able to use !r on finales

Usable locally in speedrunmode:

- added chatcommand !saveangles to save players view direction for speedrunning

13.02.2021
------------------------------------------------------------------------------------------------------------------------------

- Damage dealt to SI is scaled by max health value ("Why do i need 5 melee hits for a charger?")
- fixed "m_iMaxHealth" getting set to 200 for every spawned player instance

# SectionJ
==[top](#Contents)==

### MAP FIX CHANGELOG :: VSCRIPT, LUMP FILES & MORE

Left 4 Dead 2 maps have been updated with bug and exploit fixes in addition to quality of life enhancements.
Survivor and Infected clips have been extensively re-worked to patch all out of bounds exploits.

Versus map fixes are aggressive (but fair) and Coop is extremely lax.

Credits and documentation resources can be found later in this changelog or in thread:

	Dev Thread: Map fixes for Valve
	https://steamcommunity.com/app/550/discussions/1/1651043320659915818/

Community (non-Valve) maps remain 100% un-changed, but do have access to new entity creation functions for patching.

------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------

IF YOU DON'T WANT TO READ 8000+ LINES...

You can visually render all the VScript map changes by following these steps:

	1. Right-click L4D2 in Steam Library > Properties > "SET LAUNCH OPTIONS..."

	2. Enter "-dev" (without the quotes) into the textbox

	3. Load any map via console, like "map c8m1_apartment versus"

	4. In console type "script ShowUpdate()"

	5. In console type "sb_all_bot_game 1" to prevent server shutdown

Using "versus" the above will render everything, but note that "coop" won't have new Infected ladders and will also
have far less shortcut/exploit fixes -- "survival" has a small amount of exclusive clips for specific maps.

MrFailzz made a Coop/speedrunner-focused changelog with navmesh changes here:

	https://hackmd.io/@MrFailzz/rJ5S7EZHw

If you only play Coop, please read MrFailzz' changelog instead!

------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------

FREQUENTLY ASKED QUESTIONS

Q	Is Coop exploit X patched?

A	Most likely yes if it allowed you to go out of bounds. Otherwise no, so most shortcuts are still possible.

Q	Is Versus exploit X patched?

A	Most likely yes... extreme diligence was placed on unearthing every method of Infected attaacking from
	underneath the map, or Survivors reaching unattackable space.

Q	Why was X fixed?

A	Fixes are only spawned in for the modes they're relevant. Relevancy was determined through playtesting by
	both casual and competitive Versus players and speedrunners. In rare cases old exploits were restored
	like deleting Dark Carnival 3's swan room shelf blocker, because navmesh edits fixed the problem better.

Q	Will the VScript fixes break any addons?

A	The update will be incompatible with these addons:

		Survivor Ragdolls (Global)	https://steamcommunity.com/sharedfiles/filedetails/?id=1932686022
		Survivor Shoving Script		https://steamcommunity.com/sharedfiles/filedetails/?id=1975951464

	But I've already notified the authors they'll have to update to using mapspawn_addon.nut instead of
	mapspawn.nut. Preserved entities have also been changed, so round-persistence needs to run on "worldspawn"
	instead of say an "info_target".

Q	Can the new VScript exploit fixes be opted out of?

A	Yes, just create an empty mapspawn.nut file. This is intended to give server admins a grace period for
	reconciling redundancies within their Stripper:Source configs which will now have a lot of overlap.

Q	Can I offer map change suggestions?

A	Soon you'll be able to Subscribe to the Community Update Team's Workshop item at

		https://steamcommunity.com/sharedfiles/filedetails/?id=1959405608

	to prototype potential new exploit/bug and QoL additions to the game -- this isn't new content, just fixes,
	and Kerry Davis himself is a contributor!

Q	Haven't community configs already fixed all exploits?

A	Lots of fixes are converted from ZoneMod and other Stripper:Source community configs, but not all.
	This update includes a general clipping rework to patch even hypothetical future exploits, and
	recently-emerging exploits like crouching through displacements of which existing configs do not
	comprehensively cover. Also, solutions which work for competitive configs rarely translate well into
	vanilla -- Dark Carnival 2's hedge LOS blockers and Parish 3's fence covers are great examples which
	transitioned from ZoneMod to vanilla seamlessly, but the Midnight Riders bus did not.

Q	Was any campaign singled out for favoritism?

A	No, even Crash Course has a lot of great new ladders and a couple of unique attacks, in addition to
	completely overhauled breakwall textures which were originally missing.

Q	Was the setpause/unpause DoS spam fixed?

A	Yes, and the reason it took a while is because of doors -- when rate limiting was turned on, spamming
	doors would trip the command counter and L4D2 doesn't allow reversing the direction of a door in motion
	but open/close commands were still being spammed... requiring doors to be fixed.

Q	How do you edit pre-existing maps?

A	You can modify them from decompiled sources such as the ones at

		https://github.com/spumer/left_4_dead_2__decompiled_maps

	or by using in-game editors. SourceMod with Stripper:Source installed is what most are familiar with,
	but this update uses new VScript files anv_mapfixes.nut and anv_versus.nut for that instead.

Q	How do the new VScript files work together?

A	L4D2 now uses mapspawn.nut. Every time any map loads anv_mapfixes.nut is run in worldspawn scope to
	maintain round-persistence and avoid Mutation Game Event conflicts. Director.GetMapName() checks if it's
	a Valve map then Director.GetGameModeBase() spawns in mode-specific fixes. If it's not a Valve map, it
	does nothing. When HasPlayerControlledZombies() is true, anv_versus.nut is also run to spawn in
	Versus-specific entities, like ladders, and deletes only specific func_playerinfected_clip as needed
	to minimize the introduction of exploits that need further fixing.

------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------

VSCRIPT ENTITY CONTRIBUTIIONS

Tsuey:

	Framework and functions, pre-QA Infected ladders, Clipping rework, exploit and logic fixes

Jacob:

	R&D, Versus balance tweaks and extensive QA work and polish, LOS fix brushes, Tank warp fixes

With further entity contributions from NF, ReneTM, JAiZ, CircleSquared, and Tabbernaut

And script contributions from Rayman1103 and Daroot Leafstorm

Special thanks to Sir and Wicket for the sourced ZoneMod 1.9.8 ladders

New Propper models in active use:

"models/props/effects/tankwall_128_2_128.mdl" -- Syberian Husky
"models/props/effects/tankwall_48_1_48.mdl" -- Syberian Husky
"models/props_update/plywood_128.mdl" -- Jacob
"models/props_update/c1m2_wrongway_rooftop1.mdl" -- Jacob
"models/props_update/c1m2_wrongway_rooftop2.mdl" -- Jacob
"models/props_update/c1m2_wrongway_wall.mdl" -- Jacob
"models/props_update/c2m2_fairgroundwall.mdl" -- Jacob
"models/props_update/c2m4_barn_overhang.mdl" -- NF
"models/props_update/c2m5_infectedroom.mdl" -- Syberian Husky
"models/props_update/c2m5_infectedroom_doorway.mdl" -- Jacob
"models/props_update/c3m3_nodrawfence.mdl" -- Syberian Husky
"models/props_update/c5m2_billboard_nodraw.mdl" -- Syberian Husky
"models/props_update/c8m1_rooftop_1.mdl" -- Syberian Husky
"models/props_update/c8m1_rooftop_2.mdl" -- Syberian Husky
"models/props_update/c8m1_rooftop_3.mdl" -- Syberian Husky
"models/props_update/c8m1_rooftop_4.mdl" -- Jacob
"models/props_update/c8m2_generatorroom.mdl" -- NF
"models/props_update/c8m4_skylight_rooftop.mdl" -- Jacob
"models/props_update/c9m1_nodraw_window.mdl" -- Jacob
"models/props_update/c10m4_hellcade_nodraw.mdl" -- Tsuey
"models/props_update/c11m1_greenhouse_nodraw.mdl" -- Tsuey
"models/props_update/c11m1_greenhouse_plywood.mdl" -- NF
"models/props_update/c11m3_nodraw_cinderwall.mdl" -- Jacob
"models/props_update/c11m3_wrongway_curb.mdl" -- Jacob
"models/props_update/c11m3_wrongway_fence.mdl" -- Jacob

Thanks to all playtesters and everyone on the L4D2 Community Update Team!

------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------

Functions called by mapspawn.nut have extended L4D2 VScript with a powerful suite of one-line tools for entity handling.

+ BSP recompiles are no longer necessary when problems can be solved by cloning existing brushes.

+ Maps now patched with "anv_mapfixes.nut" instead of _commentary.txt files -- speedy code goes in, speedy fix comes out.

+ New global variables powered by "mapspawn.nut":

	g_MapName		Identical to "Director.GetMapName().tolower()"
	g_MutaMode		Identical to "Director.GetGameMode()"
	g_BaseMode		Identical to "Director.GetGameModeBase()"
	g_Chapter		Stores each "friendly name" (only for Valve campaigns)
	g_UpdateName		Prefixes "anv_mapfixes" to new entities
	g_UpdateRanOnce		Run code only once outside of "mapspawn.nut"

+ Added new feature-full entity maker and edit functions in "anv_functions.nut":

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

+ Valve maps only: Survivor and Infected given new activator filters with names consistent across all maps!

+ VS Survival includes everything from Versus except new hittabes on c2m5, c3m3, and c10m5 are deleted.

+ Launch Option -dev for verbose entity dumps or render: "script_execute z_developer_showupdate" >> "script ShowUpdate()"

------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------

Versus-related Kerry C++ changes:

+ Fixed chargers bumping off survivors if they started charging from too close.
+ Fixed a longstanding bug that affected boss spawn rates on several maps.

------------------------------------------------------------------------------------------------------------------------

Versus global CVAR changes:

+ Infected ghost timers are now always 20 seconds. (Previously ranged from 20-30)
+ Jockey leap recharge after incapping a survivor reduced from 30 to 25 seconds.
+ Jockey ride damage reworked from 4 every 1 second, to 2 every 0.5 seconds. (Same damage per second)
+ Reduced duration of bile jar effect on player controlled infected from 20 to 15 seconds.
+ Reduced fire damage vs tank from 80 damage / second to 66 damage / second.
+ Tank initial frustration "grace period" increased from 10 to 15 seconds.
+ Removed tank spawn variation between teams.

------------------------------------------------------------------------------------------------------------------------

Versus map Tank/Witch spawns:

+ Set tank chance to 100% on Hard Rain 4.
+ Added a chance for tank to spawn on No Mercy 4.
+ Added a chance for witches to spawn on No Mercy and Death Toll finales.

------------------------------------------------------------------------------------------------------------------------

Versus "anv_tankwarps.nut" exposed spawns warped to safety (excludes Taaannnk!! Mutation):

+ c1m2_streets

	Move tank spawn at ceda truck drop to the top of the stairs (~44% boss flow)

+ c2m2_fairgrounds

	Move tank spawn inside carousel fence to behind the carousel (~80% boss flow)

+ c2m3_coaster

	Move tank spawn in the swan room to the next room forward (~25% boss flow)
	Move tank spawn after the coaster one way drop to the button area (76-79% boss flow)
	Additional warp for the coaster one way drop area (80-83% boss flow)

+ c5m5_bridge

	Move all bridge tank spawns a bit further down the bridge to discourage rushing

+ c12m4_barn

	Move tank spawn from hillside before event area to top of trains (~60% boss flow)

+ c13m4_cutthroatcreek

	Move tank spawns back a bit to discourage rushing

------------------------------------------------------------------------------------------------------------------------

File "anv_maptrigs.nut" exploit/bug fixes:

+ c1m1_hotel (Versus):

	Prevent the earliest press-forward balcony window shortcut with a particle deterrent.

+ c2m4_barns (Versus):

	Prevent various common hops straight to barns roof with a large clip.

+ c2m5_concert (All Modes):

	Prevent interior stadium trigger from deleting players by re-creating it.

+ c12m4_barn (All Modes):

	Prevent skipping bridge horde by forcing it even if fence is jumped.

+ c13m3_memorialbridge (Versus/Coop):

	Prevent using water (or ladder) as a cushion to shortcut jump off bridge.

------------------------------------------------------------------------------------------------------------------------

Map-specific VScript files:

+ c8m4_elevatorfix.nut

	Re-enables jumping in elevator. Injects a lot of I/O to juggle clips and teleport triggers that
	prevent Survivors from falling through elevator, warping through skybox, and other hazards.

+ c11m5_versus_planecrash.nut

	Injects logic_relay "planecrash_trigger" to spawn ladders, LOS fixes and collision for plane debris.
	Triggers push Infected away and navblockers ensure Commons can path through it all.

+ anv_standards.nut

	Comment tutorial for "map tutorial_standards_vs versus" on vanilla Versus entity rework standards.

------------------------------------------------------------------------------------------------------------------------

Combined entity overview (Various Modes):

+ 820 infected ladders
+ Added access to several new areas for infected
+ 141 spots you can permanently fall into
+ 40 displacement areas you can crouch through to unattackably leave map
+ 64 edges/steps smoothened to improve player (and AI) movement
+ 70 navmesh-related exploits
+ 260 general improvements to Valve's clipping
+ Insta-kill triggers in the places you'd expect, i.e. c10m4 Death Charge
+ 20 shortcuts (yes like half of these are Coaster)
+ 10 stuck-warps (i.e. Tanks)... some await future solutions like c1m1
+ 50 non-shortcut common hops to unattackably leave map
+ 30 bad or unusable Infected ladders corrected
+ 200 LOS fixes for when you should be able to spawn but can't
+ 7 safe room griefing exploits to camp door / avoid auto-open
+ Tank rock / Charger props blocking chokes will be deleted after 60 secs

Statistics:

10 files
11,173 lines of code/comments
3,606 new entities
110 func_playerinfected_clip deleted

------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------

LUMP FILE FIXES

Lump file patching https://developer.valvesoftware.com/wiki/Patching_levels_with_lump_files was used instead
of VScript for more laborious fixes like adding more Versus breakwall textures. Most are outlined here.

General:

	+ Lots and lots of adjustments to floating items/weapons.

	+ Lots and lots of Survival-only clipping (some ported to VScript where relevant, i.e. events/finales).

	+ Several Scavenge-only fixes for accessing start/end safe rooms or cans going inaccessibly out of bounds.

	+ All func_illusionary breakwalls were converted to func_brush so second Versus round sees them, too.

c1m2_streets:

	+ All Whitaker stuff

	+ Breakwall textures at event area

c1m3_mall:

	+ Extra func_orator deleted (which was also solid in front of alarm button)

c1m4_atrium:

	+ Can no longer incap a teammate in the safe room and start elevator to avoid finale start.

c2m2_fairgrounds:

	+ Un-solidified func_orator at start

	+ Breakwall textures at event area and clip kill I/O added

c2m3_coaster:

	+ Breakwall texture for one-way drop wall

	+ One-way drop wall can now be destroyed by any Infected

c2m5_concert:

	+ Integrated _commentary.txt logic into lump file to prevent Survivor bots going to wrong chopper.

	+ Integrated _commentary.txt logic into lump file to eliminate one-second early escape window.

	+ Both Versus teams will now have the chopper arrive on the same side.

c4m1_milltown_a:

	+ Resolved issue where two separate doors open as if they were one.

c5m2_park:

	+ Starting safe room will stop offering a selection between identical guns.

c5m3_cemetery:

	+ End safe room ammo pile will no longer hover into the air for second Versus round.

c5m4_quarter:

	+ Breakwall textures at event area

	+ Breakwalls are always destructible (Ghosts being unable to enter is intentional for balance)

c5m5_bridge:

	+ Added a new func_orator "papa_gator"

	+ Infected ladders on the bridge now exist for second Versus round.

c6m1_riverbank:

	+ Deleted footlockers from Scavenge and Survival to resolve edict limit crash.

c6m3_port:

	+ Finale will now start even if a teammate is incapped inside the elevator.

c7m1_docks:

	+ Breakwall textures on all windows in final room

c8m2_subway:

	+ Breakwall textures on two breakable windows in generator room with I/O to delete light beams

c8m5_rooftop:

	+ Resolved the point_template that kept spawning in 100's of duplicate exploit fix brushes.

	+ Scavenge gascans will now respawn if lost by falling.

	+ Spitter acid balls will no longer linger on the bottom of the map.

c9m1_alleys:

	+ Breakwall textures at event area

c9m2_lots:

	+ Breakwall textures added to outsides of all garage doors

	+ Breakwall textures added and I/O fixed on two wooden doors

c10m3_ranchhouse:

	+ Scavenge players can no longer start the church event by pressing the invisible safe door.

c10m4_mainstreet:

	+ Breakwall textures at event area storefront

c11m4_terminal:

	+ Breakwall texture added to classroom wall (Kerry himself was aggravated he couldn't find it)

c11m5_runway:

	+ Infected ladders are moved out of view when the C130 takeoff outro starts.

------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------

VSCRIPT FIXES

This work is dedicated to two lost brothers and all those tragically lost in these horrific times of COVID-19.

Somehow we'll survive together.

Keep in mind:

	1. It's recommended to use "script ShowUpdate()" instead of reading this changelog

	2. Where "All" refers to all modes and "PvP" refers to any mode with Human-controlled Infected

	3. Provided "setpos_exact" values can be pasted into console in-game to teleport straight to the fix

	4. All clips are initially enabled except those which explicitly state "initially disabled"

	5. Every new entity is logged below, even though sometimes several are for the same fix

------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------

DEAD CENTER - HOTEL || c1m1_hotel

All:

	Clip "_cliphang_window" blocks Survivors @ setpos_exact 2335 6420 2804

	Clip "_cliphang_ledge" blocks Survivors @ setpos_exact 1222 6232 2912

	Clip "_barricadefire_bypass" blocks Survivors @ setpos_exact 1326 5624 2528

PvP:

	TRIG:	Anti-shortcut "_shortcut_balcrail_trigonce" deletes trighurt at lower floor.

	INFO:	Fire particle "_shortcut_balcrail_particle" acts as visual deterrent.

	Insta-kill "_shortcut_balcrail_trighurt" Everyone @ setpos_exact 1641 6432 2576

	Clip "_shortcut_balcrail_survivorclip" blocks Survivors @ setpos_exact 1646 6560 2481

	LOGIC:	Anti-doorbreak trighurt will be deleted 4 seconds after elevator starts.

	Insta-kill "_elevator_exploit_bean" Ghost @ setpos_exact 2169 5713 2352

	QOL:	The 2nd fire door is open immediately for Versus-only QoL.

------------------------------------------------------------------------------------------------------------------------

DEAD CENTER - STREETS || c1m2_streets

All:

	Clip "_mindthegap_lolvalve" blocks Infected @ setpos_exact -2472 137 64

	Clip "_stuckwarpassist_walltovoid" blocks Infected @ setpos_exact -5056 1500 1344

	Clip "_booster_mallroof" blocks Survivors @ setpos_exact -9218 -4415 1024

	Clip "_nav_cedaramp_in" blocks Infected + AI @ setpos_exact -4268 2566 75

	Clip "_nav_cedaramp_out" blocks Infected + AI @ setpos_exact -4322 2567 102

	Clip "_colastore_clipgap" blocks Survivors @ setpos_exact -6792 -3215 616

	Clip "_colastore_clipawn" blocks Survivors @ setpos_exact -7017 -1699 599

	Clip "_ladderqol_railing" blocks Infected @ setpos_exact -2614 2319 300

	Clip "_save4lesscurb_smoother1" blocks Everyone @ setpos_exact -6515 -2681 384

	Clip "_save4lesscurb_smoother2" blocks Everyone @ setpos_exact -6515 -2302 384

	Clip "_save4lesscurb_smoother3" blocks Everyone @ setpos_exact -6899 -1601 384

	Clip "_ladderqol_smootherl" blocks Everyone @ setpos_exact -6059 -2238 430

	Clip "_ladderqol_smootherm" blocks Everyone @ setpos_exact -6060 -2586 427

	Clip "_ladderqol_smootherr" blocks Everyone @ setpos_exact -6056 -2960 412

	Clip "_whitakercurb_smoother1" blocks Everyone @ setpos_exact -5525 -2349 448

	Clip "_whitakercurb_smoother2" blocks Everyone @ setpos_exact -5525 -1719 448

	Clip "_booster_bridgestairsa" blocks Survivors @ setpos_exact -5572 932 768

	Clip "_booster_bridgestairsb" blocks Survivors @ setpos_exact -5512 1016 832

	Clip "_booster_building" blocks Survivors @ setpos_exact -5064 1408 1344

PvP:

	Deleted func_playerinfected_clip @ setpos_exact 2047 2287 703

	Deleted func_playerinfected_clip @ setpos_exact 2047 1791 703

	Deleted func_playerinfected_clip @ setpos_exact -3409 1791 511

	Deleted func_playerinfected_clip @ setpos_exact -3889 2287 511

	Deleted func_playerinfected_clip @ setpos_exact -3905 2015 511

	Deleted func_playerinfected_clip @ setpos_exact -1049 1023 447

	Deleted func_playerinfected_clip @ setpos_exact -1537 -1 383

	Tank/Charger chokepoint atomizer created @ setpos_exact -7475 -4582 384

	Brush "_losfix_backstreet_van" created @ setpos_exact -2182 687 9

	Brush "_losfix_endstreet_bus" created @ setpos_exact -8352 -2283 395

	Brush "_losfix_endstreet_fence" created @ setpos_exact -7071 -3944 389

	Brush "_losfix_endstreet_gen1" created @ setpos_exact -7143 -4150 393

	Brush "_losfix_endstreet_gen2" created @ setpos_exact -8699 -4013 393

	Brush "_losfix_endstreet_van" created @ setpos_exact -7893 -2305 394

	Brush "_losfix_sidestreet_van1" created @ setpos_exact -1209 3992 131

	Brush "_losfix_sidestreet_van2" created @ setpos_exact -1180 4061 132

	Brush "_losfix_sidestreet_van3" created @ setpos_exact -1162 4126 138

	Brush "_losfix_skybridge_bus" created @ setpos_exact -5310 -609 460

	Brush "_losfix_stairs_gen1" created @ setpos_exact -4974 1669 392

	Brush "_losfix_stairs_gen2" created @ setpos_exact -4994 1651 392

	Brush "_losfix_starting_truck" created @ setpos_exact 1165 2493 571.5

	Brush "_losfix_tanker1" created @ setpos_exact -6939 -1040 444

	Brush "_losfix_tanker2" created @ setpos_exact -6894 -964 444

	Brush "_losfix_tanker3" created @ setpos_exact -6844 -888 444

	Brush "_losfix_tanker4" created @ setpos_exact -6797 -820 444

	Brush "_losfix_tanker5" created @ setpos_exact -6753 -801 444

	Brush "_losfix_tanker6" created @ setpos_exact -6753 -736 444

	Brush "_losfix_tanker7" created @ setpos_exact -6675 -619 444

	Brush "_losfix_tanker8" created @ setpos_exact -6631 -579 444

	Brush "_losfix_tanker9" created @ setpos_exact -6623 -505 426

	Clip "_clipgap_deadendfence" blocks Infected @ setpos_exact -1168 5160 383

	Clip "_ladder_copvines_clip" blocks Infected @ setpos_exact -284 3211 719

	Clip "_ladder_endbillboard_clipB" blocks Infected @ setpos_exact -7470 -150 696

	Clip "_ladder_endbillboard_clipT" blocks Infected @ setpos_exact -7471 -150 714

	Clip "_ladder_saferoomperch_clip" blocks Everyone @ setpos_exact -8190 -4353 384

	Clip "_ladder_tankhedge_jumpclip" blocks Infected @ setpos_exact 2644 3327 640

	Clip "_ladderqol_railingtop" blocks Infected @ setpos_exact -2614 2318 348

	Clip "_ladderqol_railleftbot" blocks Infected @ setpos_exact -1154 2322 320

	Clip "_ladderqol_raillefttop" blocks Infected @ setpos_exact -1154 2321 368

	Clip "_skybridgebus_clip" blocks Infected @ setpos_exact -5164 -485 595

	Clip "_sneaky_hunter" blocks Infected @ setpos_exact -9207 -4402 1024

	Clip "_yeswaychoke_clip" blocks Infected @ setpos_exact -3636 1800 523

	Clip "_yeswaycorner_clip" blocks Infected @ setpos_exact 3703 2048 704

	Clip "_yeswayturnpike_clipa" blocks Infected @ setpos_exact -384 512 704

	Clip "_yeswayturnpike_clipb" blocks Infected @ setpos_exact -876 48 456

	LADDER: _ladder_acbuildfront_cloned_acbuildside

	LADDER: _ladder_copfenceright_cloned_copfenceleft

	LADDER: _ladder_copvines_cloned_startvines

	LADDER: _ladder_dumpsterfront_cloned_dumpsterback

	LADDER: _ladder_dynamictanker_cloned_roundthehedge

	LADDER: _ladder_endbillboardB_cloned_save4lessleft

	LADDER: _ladder_endbillboardT_cloned_save4lessright

	LADDER: _ladder_endfence_cloned_carthedge

	LADDER: _ladder_endfenceconcrete_cloned_endvanconcrete

	LADDER: _ladder_fencedinplatform_cloned_longfencefarleft

	LADDER: _ladder_hedgesreturn_cloned_skystairsback

	LADDER: _ladder_longfencefarright_cloned_longfencefarleft

	LADDER: _ladder_oneway_cloned_stairsbus

	LADDER: _ladder_overpassleft_cloned_overpassright

	LADDER: _ladder_postdropcut_cloned_turnpikemid

	LADDER: _ladder_saferoomperch_cloned_save4less

	LADDER: _ladder_saferoomperchoob_cloned_save4less

	LADDER: _ladder_skybridgebus_cloned_endbusright

	LADDER: _ladder_skybridgechance_cloned_yellowbrickcones

	LADDER: _ladder_skybridgedodge_cloned_yellowbrickcones

	LADDER: _ladder_skybridgestains_cloned_endslopeleft

	LADDER: _ladder_skystairsfront_cloned_skystairsback

	LADDER: _ladder_slopeleftvine_cloned_save4lessright

	LADDER: _ladder_stairvines_cloned_dumpstervines

	LADDER: _ladder_startareavines_cloned_dumpsterright

	LADDER: _ladder_startfencefar_cloned_startfenceback

	LADDER: _ladder_startfencefront_cloned_startfenceback

	LADDER: _ladder_starthedgesfront_cloned_starthedgesback

	LADDER: _ladder_tankerfrontleft_cloned_tankerfenceleft

	LADDER: _ladder_tankerfrontmid_cloned_tankerfencemid

	LADDER: _ladder_tankerfrontright_cloned_tankerfenceright

	LADDER: _ladder_tankhedge_cloned_stairsbus

	LADDER: _ladder_tentbus_cloned_stairsbus

	LADDER: _ladder_truckandtent_cloned_carthedge

	LADDER: _ladder_turnpikeleft_cloned_turnpikemid

	LADDER: _ladder_turnpikeright_cloned_turnpikemid

	LADDER: _ladder_whitakerback_cloned_tinyendladder

	LADDER: _ladder_whitakergunshop_cloned_eventicemachine

	LADDER: _ladder_whitakerquick_cloned_hedgeparklot

	LADDER: _ladder_yeswaychokefence_cloned_yellowbrickcones

	LADDER: _ladder_yeswaychokeroof_cloned_tankerfencemid

	LADDER: _ladder_yeswaycornerinner_cloned_roundthehedge

	LADDER: _ladder_yeswaycornerouter_cloned_save4lessright

	LADDER: _ladder_yeswayturnpikesign_cloned_turnpikemid

	Static prop "_propladder_blocka" W/ "models/props_fortifications/concrete_block001_128_reference.mdl" @ setpos_exact -2296 2341 288

	Static prop "_propladder_blockb" W/ "models/props_fortifications/concrete_block001_128_reference.mdl" @ setpos_exact -2426 2341 287

	Static prop "_propladder_blockc" W/ "models/props_fortifications/concrete_block001_128_reference.mdl" @ setpos_exact -2816 2340 288

	Static prop "_propladder_blockd" W/ "models/props_fortifications/concrete_block001_128_reference.mdl" @ setpos_exact -2946 2339 289

	Static prop "_propladder_blocke" W/ "models/props_fortifications/concrete_block001_128_reference.mdl" @ setpos_exact -3076 2339 295

	Static prop "_propladder_blockf" W/ "models/props_fortifications/concrete_block001_128_reference.mdl" @ setpos_exact -3203 2339 302

	Static prop "_endbillboard_crashedvan" W/ "models/props_vehicles/van_interior.mdl" @ setpos_exact -7350 0 400

	Static prop "_endbillboard_streetlight" W/ "models/props_urban/streetlight001.mdl" @ setpos_exact -7434 -95 370

	Static prop "_endbillboard_wrongway" W/ "models/props_misc/wrongway_sign01_optimized.mdl" @ setpos_exact -7622 -143 824

	Static prop "_losblocker_skybridgebus" W/ "models/props_vehicles/bus01_2.mdl" @ setpos_exact -5180 -508 447

	Static prop "_propladder_endplywood1" W/ "models/props_highway/plywood_01.mdl" @ setpos_exact -7018.5 -3914 471.5

	Static prop "_propladder_endplywood2" W/ "models/props_highway/plywood_01.mdl" @ setpos_exact -7069.5 -3818 522.5

	Static prop "_propladder_endvan" W/ "models/props_vehicles/van.mdl" @ setpos_exact -7003 -3900 383

	Static prop "_propladder_endvanglass" W/ "models/props_vehicles/van_glass.mdl" @ setpos_exact -7003 -3900 383

	Static prop "_propladder_whitakergunshop_plywood" W/ "models/props_highway/plywood_03.mdl" @ setpos_exact -4798 -1600 623

	Static prop "_yesdraw_disproof_hunt1" W/ "models/props_update/c8m1_rooftop_1.mdl" @ setpos_exact -6032 1264 1344

	Static prop "_yesdraw_disproof_hunt2" W/ "models/props_update/c8m1_rooftop_1.mdl" @ setpos_exact -6032 1744 1344

	Static prop "_yesdraw_disproof_hunt3" W/ "models/props_update/c8m1_rooftop_3.mdl" @ setpos_exact -5280 1264 1344

	Static prop "_yesdraw_disproof_hunt4" W/ "models/props_update/c8m1_rooftop_3.mdl" @ setpos_exact -5280 1744 1344

	Static prop "_yesdraw_skybroof_hunt1" W/ "models/props_update/c8m1_rooftop_1.mdl" @ setpos_exact -4368 3312 1728

	Static prop "_yesdraw_skybroof_hunt2" W/ "models/props_update/c8m1_rooftop_3.mdl" @ setpos_exact -3616 3312 1728

	Static prop "_yeswaychoke_fence1" W/ "models/props_urban/fence_cover001_128.mdl" @ setpos_exact -3870 1887 512

	Static prop "_yeswaychoke_fence2" W/ "models/props_urban/fence_cover001_64.mdl" @ setpos_exact -3870 1983 512

	Static prop "_yeswaychoke_roof1" W/ "models/props_update/c1m2_wrongway_rooftop1.mdl" @ setpos_exact -3900 2044 532

	Static prop "_yeswaychoke_roof2" W/ "models/props_update/c1m2_wrongway_rooftop2.mdl" @ setpos_exact -3652 2052 532

	Static prop "_yeswaychoke_wrongwaya" W/ "models/props_misc/wrongway_sign01_optimized.mdl" @ setpos_exact -3538 2042 574

	Static prop "_yeswaychoke_wrongwayb" W/ "models/props_misc/wrongway_sign01_optimized.mdl" @ setpos_exact -3648 2042 574

	Static prop "_yeswaychoke_wrongwayc" W/ "models/props_misc/wrongway_sign01_optimized.mdl" @ setpos_exact -3758 2042 574

	Static prop "_yeswaycorner_wall" W/ "models/props_update/c1m2_wrongway_wall.mdl" @ setpos_exact 3072 2048 608

	Static prop "_yeswaycorner_wrongway" W/ "models/props_misc/wrongway_sign01_optimized.mdl" @ setpos_exact 3703 2048 768

	Static prop "_yeswayturnpike_hedgea" W/ "models/props_foliage/urban_hedge_256_128_high.mdl" @ setpos_exact -599 1037 502

	Static prop "_yeswayturnpike_hedgeb" W/ "models/props_foliage/urban_hedge_256_128_high.mdl" @ setpos_exact -860 1037 426

	Static prop "_yeswayturnpike_wrongwaya" W/ "models/props_misc/wrongway_sign01_optimized.mdl" @ setpos_exact -816 32 496

	Static prop "_yeswayturnpike_wrongwayb" W/ "models/props_misc/wrongway_sign01_optimized.mdl" @ setpos_exact -1200 32 496

	Ladder found @ "-5168 162.0004 448" and shifted w/ offset @ "0 -4 0"

	Ladder found @ "-7200 -126 506" and shifted w/ offset @ "0 0 -1000"

	Ladder found @ "-7440 -126 510" and shifted w/ offset @ "0 0 -1000"

	Ladder found @ "-7968 -126 510" and shifted w/ offset @ "0 0 -1000"

	Ladder found @ "-8224 -126 510" and shifted w/ offset @ "0 0 -1000"

	LOGIC:	LOS tanker fixes will be deleted upon its destruction.

	FIX/ANTI-GRIEF:	Removed trigger which disables common infected spawns in Save 4 Less area for Versus only.

	Deleted ([123] trigger_once) @ setpos_exact -5128 -992 548

Survival:

	Clip "_tanker_blowfish" blocks Survivors @ setpos_exact -6740 -758 681

------------------------------------------------------------------------------------------------------------------------

DEAD CENTER - MALL || c1m3_mall

All:

	Decal "decals/vent01" painted @ setpos_exact 1279 -2411 280

	Clip "_commonhop_maproom" blocks Survivors @ setpos_exact 3673 -2517 424

	Clip "_cliprework_skylighta" blocks Survivors @ setpos_exact 6464 -2591 559

	Clip "_cliprework_skylightb" blocks Survivors @ setpos_exact 4173 -2627 793

	Clip "_cliprework_skylightc" blocks Survivors @ setpos_exact 2274 -672 793

	Clip "_cliprework_skylightd" blocks Survivors @ setpos_exact 1465 -3418 794

PvP:

	Deleted ([323] func_breakable) @ setpos_exact -1016.5 -4510.5 561

	Deleted ([322] func_breakable) @ setpos_exact -1155.47 -4510.5 561

	Deleted ([320] func_breakable) @ setpos_exact -1400.5 -4510.5 561

	Deleted ([280] func_breakable) @ setpos_exact 2558.5 -408.5 561

	Deleted ([237] func_breakable) @ setpos_exact 3964.5 -2910.5 561

	Deleted ([252] func_breakable) @ setpos_exact 4099.47 -2337.5 561

	Deleted ([238] func_breakable) @ setpos_exact 4103.5 -2910.5 561

	Deleted ([250] func_breakable) @ setpos_exact 4344.5 -2337.5 561

	Deleted ([240] func_breakable) @ setpos_exact 4348.54 -2910.5 561

	Deleted ([249] func_breakable) @ setpos_exact 4483.47 -2337.5 561

	Deleted ([340] func_breakable) @ setpos_exact 4487.5 -2910.5 561

	Brush "_losfix_end_gen" created @ setpos_exact -1940 -4434 544

	Clip "_ladderqol_lastroom_left" blocks Infected @ setpos_exact -1280 -4503 509

	Clip "_ladderqol_lastroom_right" blocks Infected @ setpos_exact -1280 -3945 509

	Clip "_ladderqol_maproom_left" blocks Infected @ setpos_exact 4224 -2903 509

	Clip "_ladderqol_maproom_right" blocks Infected @ setpos_exact 4224 -2345 509

	Clip "_ladderqol_oneway_left" blocks Infected @ setpos_exact 1993 -672 509

	Clip "_ladderqol_oneway_right" blocks Infected @ setpos_exact 2551 -672 509

	Clip "_skylighta_blocker1" blocks Infected @ setpos_exact 6463 -2592 586

	Clip "_skylighta_blocker2" blocks Infected @ setpos_exact 6463 -2592 586

	Clip "_skylighta_blocker3" blocks Infected @ setpos_exact 6463 -2592 586

	Clip "_skylighta_blocker4" blocks Infected @ setpos_exact 6463 -2592 586

	LADDER: _ladder_kappels_cloned_headroomvent

	LADDER: _ladder_lastroomSE_cloned_lastroomNE

	LADDER: _ladder_lastroomSW_cloned_lastroomNW

	LADDER: _ladder_maproomNE_cloned_onewayNW

	LADDER: _ladder_maproomNW_cloned_onewaySW

	LADDER: _ladder_maproomSE_cloned_onewayNE

	LADDER: _ladder_maproomSW_cloned_onewaySE

	LADDER: _ladder_scaffold_cloned_sodavent

	LADDER: _ladder_toystoreceiling_cloned_ventexcessheight

	Static prop "_cosmetic_breakwall1" W/ "models/props_interiors/breakwall_interior_noboards.mdl" @ setpos_exact 238.1 -2505.6 344

	Static prop "_cosmetic_breakwall2" W/ "models/props_interiors/breakwall_interior_noboards.mdl" @ setpos_exact 236.9 -2504.9 348

	Static prop "_ladder_toyvent1" W/ "models/props_exteriors/guardshack_break07.mdl" @ setpos_exact 1271 -2310 431

	Static prop "_ladder_toyvent2" W/ "models/props_exteriors/guardshack_break07.mdl" @ setpos_exact 1279 -2304 518

	Static prop "_ladder_toyvent3" W/ "models/props_exteriors/guardshack_break02.mdl" @ setpos_exact 1158 -2421 554

	Static prop "_ladder_toyvent4" W/ "models/props_vents/vent_cluster006.mdl" @ setpos_exact 1412 -2172 560.35

	Static prop "_ladder_toyvent5" W/ "models/props_vents/vent_cluster006.mdl" @ setpos_exact 1043 -2538 561

	trigger_playermovement "_duckqol_justforkidz" with Option Duck @ setpos_exact 1191.3 -2026 521

------------------------------------------------------------------------------------------------------------------------

DEAD CENTER - ATRIUM || c1m4_atrium

All:

	Clip "_booster_storefrontleft" blocks Survivors @ setpos_exact -4256 -4464 196

	Clip "_booster_storefrontright" blocks Survivors @ setpos_exact -3344 -3280 196

	Clip "_booster_pillarclip" blocks Survivors @ setpos_exact -3434 -3533 472

	Clip "_booster_cedaplastic" blocks Survivors @ setpos_exact -2787 -4193 302

	Clip "_booster_thicklongledge" blocks Survivors @ setpos_exact -2368 -4224 1080

	Clip "_booster_nodrawcorner" blocks Survivors @ setpos_exact -5770 -3926 1024

	Clip "_booster_libertymall" blocks Survivors @ setpos_exact -2386 -3840 824

	Clip "_booster_fallbanner" blocks Survivors @ setpos_exact -2929 -3889.5 991

	Clip "_booster_bridgeroof" blocks Survivors @ setpos_exact -3339 -3857 864

	Clip "_booster_hardhatsa" blocks Survivors @ setpos_exact -3070 -4206 536

	Clip "_booster_hardhatsb" blocks Survivors @ setpos_exact -3370 -4206 536

	Clip "_booster_highbalcony" blocks Survivors @ setpos_exact -4695 -4336 792

	Clip "_booster_glassbalcony" blocks Survivors @ setpos_exact -3688 -4334 791

	Clip "_nav_ladyshoes" blocks Survivors @ setpos_exact -4971 -4461 432

PvP:

	LADDER: _ladder_plywoodback_cloned_plywoodfront

	LADDER: _ladder_columnfarcorner_cloned_columngibbs

	LADDER: _ladder_columnbooth_cloned_columngibbs

	LADDER: _ladder_columnplywood_cloned_columnbusystairs

	LADDER: _ladder_columnstairsright_cloned_columnbusystairs

	LADDER: _ladder_columnstairsleft_cloned_columnbusystairs

	LADDER: _ladder_columnfallbanner_cloned_columnbusystairs

------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------

DARK CARNIVAL - HIGHWAY || c2m1_highway

All:

	Clip "_permstuck_tanktreea" blocks Everyone @ setpos_exact 4096 5123 -938

	Clip "_permstuck_tanktreeb" blocks Everyone @ setpos_exact 4067 4930 -913

	Clip "_permstuck_tanktreec" blocks Everyone @ setpos_exact 3911 3914 -941

	Clip "_cargocontainer_oob_01" blocks Infected @ setpos_exact 3616 2512 -632

	Clip "_cargocontainer_oob_02" blocks Infected @ setpos_exact 3616 1328 -1744

	Clip "_cargocontainer_oob_03" blocks Infected @ setpos_exact 3136 2595 -1243

	Clip "_cargocontainer_dispcrouch" blocks Infected @ setpos_exact 3203 1572 -1822

	Clip "_dispcrouch_rocka" blocks Everyone @ setpos_exact 1280 2115 -1615

	Clip "_dispcrouch_rockb" blocks Everyone @ setpos_exact 1046 2025 -1615

	Clip "_dispcrouch_rockc" blocks Everyone @ setpos_exact 820 2010 -1611

	Clip "_dispcrouch_rockd" blocks Everyone @ setpos_exact 686 2100 -1585

	Clip "_dispcrouch_rocke" blocks Everyone @ setpos_exact 618 2260 -1464

	Clip "_dispcrouch_swampa" blocks Everyone @ setpos_exact 2523 1855 -1805

	Clip "_dispcrouch_swampb" blocks Everyone @ setpos_exact 2595 1654 -1807

	Clip "_cliprework_fence" blocks Survivors @ setpos_exact -193 -1932 -900

	Clip "_commonhop_barrier" blocks Survivors @ setpos_exact 365 -1098 -950

	Clip "_commonhop_tree" blocks Survivors @ setpos_exact -46 -1242 -900

	Clip "_shoppingcart_roof" blocks Survivors @ setpos_exact -517 -2678 -940

	Clip "_shoppingcart_tarpa" blocks Survivors @ setpos_exact -1718 -2783 -967

	Clip "_shoppingcart_tarpb" blocks Survivors @ setpos_exact -1800 -2319 -967

	Clip "_shoppingcart_tarpc" blocks Survivors @ setpos_exact -1838 -1583 -952

	Clip "_booster_clipgap" blocks Survivors @ setpos_exact 3632 5712 -880

	Clip "_shortcut_start_trucka" blocks Survivors @ setpos_exact 4493 7285 -756

	Clip "_shortcut_start_truckb" blocks Survivors @ setpos_exact 4388 7285 -756

	Clip "_shortcut_start_busblu" blocks Survivors @ setpos_exact 4379 7676 -756

	Clip "_shortcut_start_shruba" blocks Survivors @ setpos_exact 4779 7377 -756

	Clip "_shortcut_start_shrubb" blocks Survivors @ setpos_exact 4669 7457 -756

	Clip "_shortcut_start_shrubc" blocks Survivors @ setpos_exact 4626 7363 -756

	Clip "_shortcut_start_shrubd" blocks Survivors @ setpos_exact 4736 7283 -756

	Clip "_booster_motelsign" blocks Survivors @ setpos_exact 2932 4894 -507

	Clip "_permstuck_startfence" blocks Everyone @ setpos_exact 11140 7179 -566

	Clip "_longbush_booster" blocks Survivors @ setpos_exact 4092 3921 -369

	Clip "_longbush_undermapa" blocks Infected @ setpos_exact 4625 4099 -805

	Clip "_longbush_undermapb" blocks Infected @ setpos_exact 4142 2981 -983

	Clip "_clipextend_poolwalla" blocks Survivors @ setpos_exact 2561 3843 -640

	Clip "_clipextend_poolwallb" blocks Survivors @ setpos_exact 3067 4200 -640

	Clip "_permstuck_endfence" blocks Everyone @ setpos_exact 547 -635 -1087

	Clip "_clipextend_umbrella1" blocks Survivors @ setpos_exact 2683 4055 -773

	Clip "_clipextend_umbrella2" blocks Survivors @ setpos_exact 2483 3989 -773

	Clip "_clipextend_umbrella3" blocks Survivors @ setpos_exact 2243 4047 -773

PvP:

	Clip "_overpass_trucknuke" blocks Survivors @ setpos_exact 3467 7102 -704

	Clip "_tank_busleft" blocks Survivors @ setpos_exact 1731 6723 -574

	Clip "_tank_busright" blocks Survivors @ setpos_exact 1688 7008 -344

	Clip "_tank_fence" blocks Survivors @ setpos_exact 2588 7168 -412

	Deleted ([347] env_player_blocker) @ setpos_exact 1388 5660 -649

	Deleted ([346] env_player_blocker) @ setpos_exact 2972 3724 -649

	Brush "_losfix_bush" created @ setpos_exact 8224 8378 -536

	Brush "_losfix_end_fence" created @ setpos_exact -522 -2416 -1083

	Brush "_losfix_highway_bus1" created @ setpos_exact 7035 7874 -641

	Brush "_losfix_highway_bus2" created @ setpos_exact 6951 7806 -645

	Brush "_losfix_motel_balcony1" created @ setpos_exact 2959 3416 -806

	Brush "_losfix_motel_balcony2" created @ setpos_exact 2865 3129 -806

	Brush "_losfix_motel_fence" created @ setpos_exact 3058 4818 -972

	Brush "_losfix_motel_van" created @ setpos_exact 1545 4113 -966

	Brush "_losfix_overpass_truck" created @ setpos_exact 3571 7076 -693

	Brush "_losfix_start_bus" created @ setpos_exact 9213 7957 -514

	Brush "_losfix_start_van" created @ setpos_exact 7957 7769 -581

	Brush "_losfix_underpass_truck" created @ setpos_exact 3471 7845 -994

	Brush "_losfix_van_jump" created @ setpos_exact 6981.6 7662.8 -656.3

	Clip "_ladder_motelfrontleft_clipleft" blocks Everyone @ setpos_exact 2766 3708 -968

	Clip "_ladder_motelfrontleft_clipright" blocks Everyone @ setpos_exact 2753 3724 -968

	Clip "_ladder_motelfrontright_clipleft" blocks Everyone @ setpos_exact 1372 4691 -968

	Clip "_ladder_motelfrontright_clipright" blocks Everyone @ setpos_exact 1366 4690 -968

	Clip "_motelskyboxroof_clipinfected" blocks Infected @ setpos_exact 2972 3724 -649

	Clip "_saferoof_trollblock" blocks Survivors @ setpos_exact -904 -2534 -940

	Clip "_whispsign_infectedqol" blocks Infected @ setpos_exact 9526 8374 -169

	LADDER: _ladder_barrelsemi_cloned_caralarmshort

	LADDER: _ladder_endbusback_cloned_caralarmshort

	LADDER: _ladder_endbusfront_cloned_caralarmshort

	LADDER: _ladder_endsafebackl_cloned_fixdontdelete

	LADDER: _ladder_endsafebackr_cloned_fixdontdelete

	LADDER: _ladder_endsaferoofa_cloned_fixdontdelete

	LADDER: _ladder_endsaferoofb_cloned_fixdontdelete

	LADDER: _ladder_highwaysign_cloned_whispsign

	LADDER: _ladder_hilltoptruck_cloned_fixdontdelete

	LADDER: _ladder_motelfrontleftB_cloned_motelalarmright

	LADDER: _ladder_motelfrontleftT_cloned_motelalarmright

	LADDER: _ladder_motelfrontrightB_cloned_motelalarmright

	LADDER: _ladder_motelfrontrightT_cloned_motelalarmright

	LADDER: _ladder_motelroofleft_cloned_onewaycliff

	LADDER: _ladder_motelroofright_cloned_onewaycliff

	LADDER: _ladder_motelroofright_cloned_onewaycliff

	LADDER: _ladder_motelroofright_cloned_onewaycliff

	LADDER: _ladder_qolbus_cloned_caralarmshort

	LADDER: _ladder_sheriffbus_cloned_caralarmshort

	LADDER: _ladder_shortcutsemiback_cloned_caralarmshort

	LADDER: _ladder_shortcutsemifront_cloned_caralarmshort

	LADDER: _ladder_shrubberybus_cloned_caralarmshort

	LADDER: _ladder_slopetruck_cloned_caralarmshort

	LADDER: _ladder_startbus_cloned_caralarmshort

	LADDER: _ladder_tankfence_cloned_caralarm

	LADDER: _ladder_tankfightsemi_cloned_caralarmshort

	LADDER: _ladder_whispsignextender_cloned_motelpoolfence

	Static prop "_losblocker_fence" W/ "models/props_urban/fence_cover001_256.mdl" @ setpos_exact 3060 4819 -967

	Static prop "_losblocker_fencea" W/ "models/props_urban/fence_cover001_256.mdl" @ setpos_exact -128 -1332 -1078.75

	Static prop "_losblocker_fenceb" W/ "models/props_urban/fence_cover001_256.mdl" @ setpos_exact 48 -1160 -1078.75

	Static prop "_propladder_barrel" W/ "models/props_urban/highway_barrel001.mdl" @ setpos_exact 3084 5126 -947.96

	Static prop "_propladder_barrier" W/ "models/props_fortifications/concrete_barrier001_128_reference.mdl" @ setpos_exact 3079 5152 -948.75

	Static prop "_ladder_motelfrontleftB_pipe" W/ "models/props_rooftop/Gutter_Pipe_256.mdl" @ setpos_exact 2769 3714 -788

	Static prop "_ladder_motelfrontleftT_pipe" W/ "models/props_rooftop/Gutter_Pipe_128.mdl" @ setpos_exact 2769 3714 -660

	Static prop "_ladder_motelfrontrightB_pipe" W/ "models/props_rooftop/Gutter_Pipe_256.mdl" @ setpos_exact 1378 4688 -788

	Static prop "_ladder_motelfrontrightT_pipe" W/ "models/props_rooftop/Gutter_Pipe_128.mdl" @ setpos_exact 1378 4688 -660

	Static prop "_ladder_motelroofleft_pipe" W/ "models/props_mill/PipeSet08d_512_001a.mdl" @ setpos_exact 792 3695 -904

	Static prop "_ladder_motelroofright_pipe" W/ "models/props_mill/PipeSet08d_512_001a.mdl" @ setpos_exact 792 5308 -904

	Static prop "_ladder_motelroofright_pipe" W/ "models/props_mill/PipeSet08d_512_001a.mdl" @ setpos_exact 792 5308 -904

	Static prop "_losblocker_motelleft" W/ "models/props_rooftop/acvent01.mdl" @ setpos_exact 2706 3541 -665

	Static prop "_losblocker_motelright" W/ "models/props_rooftop/acvent01.mdl" @ setpos_exact 1205 5394 -668

	Static prop "_motelskyboxroof_wrongwaya" W/ "models/props_misc/wrongway_sign01_optimized.mdl" @ setpos_exact 918 3383 -565

	Static prop "_motelskyboxroof_wrongwayb" W/ "models/props_misc/wrongway_sign01_optimized.mdl" @ setpos_exact 1318 3383 -555

	Static prop "_motelskyboxroof_wrongwayc" W/ "models/props_misc/wrongway_sign01_optimized.mdl" @ setpos_exact 1718 3383 -555

	Static prop "_motelskyboxroof_wrongwayd" W/ "models/props_misc/wrongway_sign01_optimized.mdl" @ setpos_exact 2118 3383 -555

	Static prop "_motelskyboxroof_wrongwaye" W/ "models/props_misc/wrongway_sign01_optimized.mdl" @ setpos_exact 2518 3383 -555

	Static prop "_motelskyboxroof_wrongwayf" W/ "models/props_misc/wrongway_sign01_optimized.mdl" @ setpos_exact 2850 3383 -565

	Ladder found @ "-196 -1725 -1018.049" and normal changed to "-1 0 0"

	Trigger "_trigpushl_whispsign" pushes Infected w/ speed 50 @ setpos_exact 9536 8453 -193

	Trigger "_trigpushr_whispsign" pushes Infected w/ speed 50 @ setpos_exact 9525 8453 -193

Coop:

	KILL:	Shrubwall shortcut unpatched for Coop (popular request).

Survival:

	Clip "_survival_midnightride" blocks Survivors @ setpos_exact 2618 6269 -679

	Clip "_survival_midnightsign" blocks Survivors @ setpos_exact 2338 6131 -415

	Clip "_survival_boostshrub" blocks Survivors @ setpos_exact 3079 6479 -343

	Clip "_survival_fence_extend" blocks Survivors @ setpos_exact 2042 3837 -640

Scavenge:

	Clip "_scavenge_fence_painthop" blocks Survivors @ setpos_exact 2042 3837 -640

------------------------------------------------------------------------------------------------------------------------

DARK CARNIVAL - FAIRGROUND || c2m2_fairgrounds

All:

	Clip "_bunnyhop_roundtable" blocks Survivors @ setpos_exact 2360 -244 266

	Clip "_booster_unattackable" blocks Survivors @ setpos_exact 4000 -2304 268

	Clip "_forklift_roof" blocks Survivors @ setpos_exact 1750 -1660 193

	Clip "_commonhop_whitefence" blocks Survivors @ setpos_exact -3903 -1141 -15

	Clip "_commonhop_carouselroofs" blocks Survivors @ setpos_exact -990 -5501 192

	Clip "_booster_uppertrackb" blocks Survivors @ setpos_exact -1536 -2368 448

	Clip "_booster_uppertracka" blocks Survivors @ setpos_exact -2721 -825 337

	Clip "_void_filler" blocks Everyone @ setpos_exact -1792 -7311 250

	Clip "_charger_smoother" blocks Everyone @ setpos_exact -3119 -896 152

	Clip "_cliprework_unattackable" blocks Survivors @ setpos_exact -504 -1535 128

	Clip "_cliprework_beanbinninga" blocks Survivors @ setpos_exact -888 -1535 128

	Clip "_cliprework_beanbinningb" blocks Survivors @ setpos_exact -702 -2549 128

	Clip "_cliprework_unattackablea" blocks Survivors @ setpos_exact -3405 -6489 204

	Clip "_cliprework_unattackableb" blocks Survivors @ setpos_exact -3510 -6336 204

	Clip "_cliprework_unattackablec" blocks Survivors @ setpos_exact -3664 -6076 204

	Clip "_cliprework_unattackabled" blocks Survivors @ setpos_exact -4012 -5793 204

	Clip "_cliprework_unattackablee" blocks Survivors @ setpos_exact -4352 -5473 272

	Clip "_cliprework_wrongwaya" blocks Survivors @ setpos_exact -481 -5505 192

	Clip "_cliprework_wrongwayb" blocks Survivors @ setpos_exact -258 -6303 192

	Clip "_cliprework_wrongwayc" blocks Survivors @ setpos_exact -1471 -7166 192

	Clip "_nav_exitsign" blocks Survivors @ setpos_exact 1048 -1269 128

	Clip "_cliprework_blockergap" blocks Survivors @ setpos_exact -4235 -3968 384

	Clip "_clipextend_carouselboost" blocks Survivors @ setpos_exact -1446 -5248 192

	Clip "_unattackable_traintunnel" blocks Survivors @ setpos_exact -604 -1536 428

	Clip "_dispcollision_fairgrounds" blocks All and Physics @ setpos_exact -1903 -142 -128

PvP:

	LOGIC:	Anti-boost ToL clips will be deleted by existing trigger after carousel switch.

	Clip "_tol_clip_brush_a" blocks Survivors @ setpos_exact -3530 -5162 192

	Clip "_tol_clip_brush_b" blocks Survivors @ setpos_exact -3439 -5178 192

	Deleted func_playerinfected_clip @ setpos_exact 1719 2561 147

	Deleted func_playerinfected_clip @ setpos_exact 1719 2287 147

	Deleted func_playerinfected_clip @ setpos_exact 1759 2011 127

	Deleted func_playerinfected_clip @ setpos_exact 1535 2011 127

	Deleted func_playerinfected_clip @ setpos_exact -4113 -6401 271

	Deleted func_playerinfected_clip @ setpos_exact -4097 1535 -1

	Tank/Charger chokepoint atomizer created @ setpos_exact -3777 -1164 -118

	Tank/Charger chokepoint atomizer created @ setpos_exact -3777 -1164 -128

	Tank/Charger chokepoint atomizer created @ setpos_exact 2752 -1529 0

	Brush "_losfix_end_gen" created @ setpos_exact -3546 -5845 -55

	Brush "_losfix_slide_gen" created @ setpos_exact -2363 -3306 -121

	Brush "_losfix_start_gen" created @ setpos_exact 2812 946.508 7

	Brush "_losfix_trailer" created @ setpos_exact -2717 -2863 -122

	Brush "_losfix_warehouse_gen" created @ setpos_exact 2859 -1715 8

	Brush "_tolentrance_base_losblock" created @ setpos_exact -3924 -5493 144

	Brush "_tolentrance_main_losblock" created @ setpos_exact -3924 -5493 144

	Clip "_ladder_garagebench_clipl" blocks Everyone @ setpos_exact 4103 -2102 4

	Clip "_ladder_garagebench_clipr" blocks Everyone @ setpos_exact 4103 -2142 4

	Clip "_ladder_startrestrooms_clip" blocks Everyone @ setpos_exact 3061 1279 0

	Clip "_meticulous_funcinfclip01" blocks Infected @ setpos_exact -4349 -5498 272

	Clip "_meticulous_funcinfclip02" blocks Infected @ setpos_exact -4296 -6392 272

	Clip "_onewayfence_blocker" blocks Survivors @ setpos_exact -2240 -3841 2

	Clip "_propladder_acvent_qolclip" blocks Infected @ setpos_exact -1155 -6870 80

	Clip "_tolentrance_base_collision" blocks Everyone @ setpos_exact -3924 -5493 144

	Clip "_tolentrance_main_collision" blocks Everyone @ setpos_exact -3924 -5493 144

	Clip "_yeswayfairback_funcinfclip" blocks Infected @ setpos_exact -2272 1824 384

	LADDER: _ladder_appleshedge_cloned_endelecboxback

	LADDER: _ladder_brickbackend_cloned_whiteawnings

	LADDER: _ladder_brickbannerB_cloned_icemachine

	LADDER: _ladder_brickbannerT_cloned_icemachine

	LADDER: _ladder_bricksmokerB_cloned_bilehopcorner

	LADDER: _ladder_bricksmokerT_cloned_bilehopcorner

	LADDER: _ladder_carouselelecbox_cloned_tallsignfence

	LADDER: _ladder_carouselpermstuck_cloned_trucknukenose

	LADDER: _ladder_carouseltiptop_cloned_trucknuketop

	LADDER: _ladder_endawningsT_cloned_endawningsB

	LADDER: _ladder_endbrickback_cloned_endbrickfront

	LADDER: _ladder_endelecboxfront_cloned_endelecboxback

	LADDER: _ladder_endhedgefront_cloned_endhedgeback

	LADDER: _ladder_garagebench_cloned_icemachine

	LADDER: _ladder_genconcreteback_cloned_genconcretefront

	LADDER: _ladder_generatorfence_cloned_galleryfence

	LADDER: _ladder_hedgecamera_cloned_chompyskypipe

	LADDER: _ladder_lilpeanutB_cloned_dumpsteralley

	LADDER: _ladder_lilpeanutT_cloned_dumpsteralley

	LADDER: _ladder_midareafence_cloned_scavfencefront

	LADDER: _ladder_parkourtracks1B_cloned_icemachine

	LADDER: _ladder_parkourtracks1T_cloned_trucknuketop

	LADDER: _ladder_parkourtracks2B_cloned_icemachine

	LADDER: _ladder_parkourtracks2T_cloned_trucknuketop

	LADDER: _ladder_picketback_cloned_galleryfence

	LADDER: _ladder_picketfront_cloned_galleryfence

	LADDER: _ladder_redchickentent_cloned_gonutsleft

	LADDER: _ladder_ridesroof_cloned_bilejarcut

	LADDER: _ladder_ridesroofbanner_cloned_containerpile

	LADDER: _ladder_ridesroofright_cloned_telepoletrains

	LADDER: _ladder_signgonuts_cloned_hedgebins

	LADDER: _ladder_slidefencefront_cloned_slidefenceback

	LADDER: _ladder_snoconestent_cloned_carouseluproom

	LADDER: _ladder_startfenceback_cloned_cargocontainerback

	LADDER: _ladder_startfencefront_cloned_cargocontainerfront

	LADDER: _ladder_starthedgeback_cloned_cargocontainerback

	LADDER: _ladder_startrestrooms_cloned_icemachine

	LADDER: _ladder_tankfallback_cloned_galleryfence

	LADDER: _ladder_tankhedge_cloned_endelecboxback

	LADDER: _ladder_tentcornerB_cloned_tentcornerback

	LADDER: _ladder_tenthedgejump_cloned_tentcornerback

	LADDER: _ladder_tolentrance_cloned_uppertrackway

	LADDER: _ladder_tolentrancetop_cloned_carouselfence

	LADDER: _ladder_warehouseexitleft_cloned_scavfencefront

	LADDER: _ladder_yeswayfairleft_cloned_scavfenceback

	LADDER: _ladder_yeswayfairright_cloned_scavfenceback

	Static prop "_losblocker_hedgea" W/ "models/props_foliage/urban_hedge_128_64_high.mdl" @ setpos_exact 2046 977 78

	Static prop "_losblocker_hedgeb" W/ "models/props_foliage/urban_hedge_128_64_high.mdl" @ setpos_exact 2258 930 78

	Static prop "_losblocker_hedgec" W/ "models/props_foliage/urban_hedge_128_64_high.mdl" @ setpos_exact 2258 731 78

	Static prop "_losblocker_hedged" W/ "models/props_foliage/urban_hedge_128_64_high.mdl" @ setpos_exact 2258 638 78

	Static prop "_losblocker_hedgee" W/ "models/props_foliage/urban_hedge_128_64_high.mdl" @ setpos_exact 2258 410 78

	Static prop "_losblocker_hedgef" W/ "models/props_foliage/urban_hedge_128_64_high.mdl" @ setpos_exact 2258 295 78

	Static prop "_losblocker_hedgeg" W/ "models/props_foliage/urban_hedge_128_64_high.mdl" @ setpos_exact 2258 92 78

	Static prop "_losblocker_hedgeh" W/ "models/props_foliage/urban_hedge_128_64_high.mdl" @ setpos_exact 2046 47 78

	Static prop "_losblocker_hedgei" W/ "models/props_foliage/urban_hedge_128_64_high.mdl" @ setpos_exact 1844 92 78

	Static prop "_losblocker_hedgej" W/ "models/props_foliage/urban_hedge_128_64_high.mdl" @ setpos_exact 1844 295 78

	Static prop "_losblocker_hedgek" W/ "models/props_foliage/urban_hedge_128_64_high.mdl" @ setpos_exact 1844 410 78

	Static prop "_losblocker_hedgel" W/ "models/props_foliage/urban_hedge_128_64_high.mdl" @ setpos_exact 1844 638 78

	Static prop "_losblocker_hedgem" W/ "models/props_foliage/urban_hedge_128_64_high.mdl" @ setpos_exact 1844 731 78

	Static prop "_losblocker_hedgen" W/ "models/props_foliage/urban_hedge_128_64_high.mdl" @ setpos_exact 1844 930 78

	Static prop "_propladder_acvent" W/ "models/props_rooftop/acvent02.mdl" @ setpos_exact -1156 -6874 32.92

	Static prop "_ladder_garagebench_pipe" W/ "models/props_rooftop/Gutter_Pipe_128.mdl" @ setpos_exact 4096 -2122 159

	Static prop "_ladder_hedgecamera_pipe" W/ "models/props_rooftop/Gutter_Pipe_256.mdl" @ setpos_exact 4384 -360 196

	Static prop "_ladder_parkourtracks1B_pipe" W/ "models/props_rooftop/Gutter_Pipe_128.mdl" @ setpos_exact -2291 670 0

	Static prop "_ladder_ridesroof_pipe" W/ "models/props_rooftop/Gutter_Pipe_256.mdl" @ setpos_exact 0 445 201

	Static prop "_ladder_ridesroofright_pipe" W/ "models/props_rooftop/Gutter_Pipe_256.mdl" @ setpos_exact 859 272 242

	Static prop "_ladder_tolentrance_pipe" W/ "models/props_rooftop/Gutter_Pipe_256.mdl" @ setpos_exact -4008 -5648 144

	Static prop "_losblocker_ridesroof" W/ "models/props_rooftop/acvent03.mdl" @ setpos_exact 923 406 222

	Static prop "_losblocker_startfence" W/ "models/props_urban/fence_cover001_256.mdl" @ setpos_exact 1788 2145 1

	Static prop "_propladder_ridesroof" W/ "models/props_urban/chimney001.mdl" @ setpos_exact 288 300 315

	Static prop "_startroof_wrongwaya" W/ "models/props_misc/wrongway_sign01_optimized.mdl" @ setpos_exact 1539 2888 200

	Static prop "_startroof_wrongwayb" W/ "models/props_misc/wrongway_sign01_optimized.mdl" @ setpos_exact 1539 2678 200

	Static prop "_startroof_wrongwayc" W/ "models/props_misc/wrongway_sign01_optimized.mdl" @ setpos_exact 1539 2490 60

	Static prop "_startroof_wrongwayd" W/ "models/props_misc/wrongway_sign01_optimized.mdl" @ setpos_exact 1539 2160 60

	Static prop "_yeswayfairback_wall" W/ "models/props_update/c2m2_fairgroundwall.mdl" @ setpos_exact -2304 1536 -32

	Physics prop "_hittable_2009forklift" W/ "models/props/cs_assault/forklift.mdl" @ setpos_exact -3666 -1321 -111

	trigger_auto_crouch "_duckqol_carouselroof" created @ setpos_exact -2240 -5259 303

	Navmesh modified w/ CHECKPOINT @ setpos_exact 1737 2712 4

	Navmesh modified w/ CHECKPOINT @ setpos_exact -4337 -5511 -64

------------------------------------------------------------------------------------------------------------------------

DARK CARNIVAL - COASTER || c2m3_coaster

All:

	Clip "_shortcut_supports" blocks Survivors @ setpos_exact -3904 2062 96

	Clip "_smokerinfamya" blocks Infected @ setpos_exact -4450 2525 309

	Clip "_smokerinfamyb" blocks Infected @ setpos_exact -4450 3005 309

	Clip "_smokerinfamyc" blocks Infected @ setpos_exact -5119 2734 309

	Clip "_shortcut_commonhopa" blocks Survivors @ setpos_exact -3720 1144 96

	Clip "_shortcut_commonhopb" blocks Survivors @ setpos_exact -3720 1352 72

	Clip "_shortcut_commonhopc" blocks Survivors @ setpos_exact -3720 1768 77

	Clip "_stuckwarp_gatearm" blocks Everyone @ setpos_exact -3799 1100 82

	Clip "_cliprework_scaffnuke_skipa" blocks Survivors @ setpos_exact -3044 3000 177

	Clip "_cliprework_scaffnuke_skipb" blocks Survivors @ setpos_exact -2788 2760 177

	Clip "_cliprework_scaffnuke_skipc" blocks Survivors @ setpos_exact -3044 3000 177

	Clip "_cliprework_scaffnuke_skipd" blocks Survivors @ setpos_exact -2788 2760 177

	Clip "_cliprework_tunnelb" blocks Survivors @ setpos_exact -3418 3460 652

	Clip "_cliprework_roofa" blocks Survivors @ setpos_exact -3596 1560 640

	Clip "_cliprework_tunnela" blocks Survivors @ setpos_exact -3902 3021 655

	Clip "_cliprework_roofb" blocks Survivors @ setpos_exact -3970 1558 640

	Clip "_cliprework_sign" blocks Survivors @ setpos_exact -3902 2321 431

	Clip "_nav_extinguisher" blocks Survivors @ setpos_exact -325 4116 244

	Clip "_commonhop_curvedrail" blocks Survivors @ setpos_exact -3498 2060 250

	Clip "_cliprework_fourvents" blocks Survivors @ setpos_exact 239 3676 272

	Clip "_chargerassist_container" blocks Survivors @ setpos_exact -718 590 128

	Clip "_cliprework_semipermstuck" blocks Everyone @ setpos_exact -3254 2792 0

	Clip "_cliprework_culdesaca" blocks Survivors @ setpos_exact -3917 2979 152

	Clip "_cliprework_culdesacb" blocks Survivors @ setpos_exact -3659 3066 152

	Clip "_cliprework_culdesacc" blocks Survivors @ setpos_exact -3351 3058 152

	Clip "_cliprework_culdesacd" blocks Survivors @ setpos_exact -3493 3256 368

	Clip "_shortcut_commonhopd" blocks Survivors @ setpos_exact -3512 1352 77

	Clip "_shortcut_commonhope" blocks Survivors @ setpos_exact -3512 1768 77

	Clip "_shortcut_commonhopf" blocks Survivors @ setpos_exact -3720 1976 57

	Clip "_shortcut_commonhopg" blocks Survivors @ setpos_exact -3848 1976 57

	Clip "_shortcut_supportdropa" blocks Survivors @ setpos_exact -3260 2854 576

	Clip "_shortcut_supportdropb" blocks Survivors @ setpos_exact -3300 2810 576

	Clip "_cliprework_shrubgap" blocks Survivors @ setpos_exact -3072 128 152

	Clip "_shortcut_finally_done" blocks Survivors @ setpos_exact -2894 2609 253

	Clip "_onewaybreakwall_elecbox" blocks Everyone @ setpos_exact -64 3524 100

	Clip "_endbridge_shiftsmoother1" blocks Everyone @ setpos_exact -4183 2320 272

	Clip "_endbridge_shiftsmoother2" blocks Everyone @ setpos_exact -4729 2277 164

	Clip "_permstuck_irredeemable" blocks Infected @ setpos_exact -2064 -174 0

	Clip "_permstuck_swanroom_rest" blocks Everyone @ setpos_exact 510 4084 -7

	Clip "_semiperm_coastergate" blocks Survivors @ setpos_exact -2784 1688 0

	Clip "_recompilepls_pillar1" blocks Survivors @ setpos_exact -3760 2360 0

	Clip "_recompilepls_pillar2" blocks Survivors @ setpos_exact -3760 2280 0

	Clip "_recompilepls_pillar3" blocks Survivors @ setpos_exact -4032 2280 0

	Clip "_recompilepls_pillar4" blocks Survivors @ setpos_exact -4032 2360 0

	Clip "_recompilepls_pillar5" blocks Survivors @ setpos_exact -4176 2360 0

	Clip "_recompilepls_pillar6" blocks Survivors @ setpos_exact -4176 2280 0

	Clip "_cliprework_permstuck" blocks Survivors @ setpos_exact -3266 3057 413

	Clip "_booster_eventskip1" blocks Survivors @ setpos_exact -3106 3081 960

	Clip "_booster_eventskip2" blocks Survivors @ setpos_exact -3106 3081 960

	Clip "_stuckwarp_swanstairs" blocks Everyone @ setpos_exact 298 4192 43

	Brush "_permstuck_swanroom_dead" created @ setpos_exact 510 4084 -7

	trigger_auto_crouch "_duckqol_swanhole" created @ setpos_exact 1348 4096 32

	Clip "_onewayhole_blockclip" blocks Everyone @ setpos_exact 336 3777 180

	Static prop "_onewayhole_blockpipe" W/ "models/props_pipes/pipeset08d_128_001a.mdl" @ setpos_exact 336 3777 180

PvP:

	Clip "_shortcut_longjump" blocks Survivors @ setpos_exact -4240 2616 171

	Brush "_coastertower_chimney_losblock" created @ setpos_exact -2751 1031 620

	Brush "_losfix_truck" created @ setpos_exact -1575 1984 8

	Clip "_coastertower_chimney_collision" blocks Everyone @ setpos_exact -2751 1031 620

	Clip "_ladder_buttonlegT_clip" blocks Infected @ setpos_exact -3548 1785 148

	Clip "_ladder_coastertower_clip" blocks Everyone @ setpos_exact -2784 1327 174

	Clip "_ladder_swanroomcpanel_clipB" blocks Infected @ setpos_exact 479 4838 126

	Clip "_ladder_swanroomcpanel_clipT" blocks Infected @ setpos_exact 475 4838 126

	Clip "_ladderqol_coasterinclinequad" blocks Infected @ setpos_exact -2784 375 593

	Clip "_onewaybreakwall_elecbox" blocks Everyone @ setpos_exact -64 3524 100

	Clip "_propladder_airconda_qol" blocks Infected @ setpos_exact -1938 739 195

	Clip "_startwindow_cheese" blocks Survivors @ setpos_exact 2783 1920 105

	Clip "_trailerfence_clip" blocks Infected @ setpos_exact -1150 2887 -3

	LADDER: _ladder_buttonlegT_cloned_buttonlegB

	LADDER: _ladder_coastertowerB_cloned_finalleg

	LADDER: _ladder_coastertowerT_cloned_shrubberytilt

	LADDER: _ladder_deadendcontainer_cloned_trailerfenceback

	LADDER: _ladder_elecboxbags_cloned_dumpsterduo

	LADDER: _ladder_fencedroproof_cloned_dumpsterduo

	LADDER: _ladder_gunstruck_cloned_signalvines

	LADDER: _ladder_swanroomcpanel_cloned_unusedconcrete

	LADDER: _ladder_swanroomelecbox_cloned_swanroomsource

	LADDER: _ladder_swanroomshelf_cloned_coasterfencetilt

	LADDER: _ladder_trailerfencefront_cloned_trailerfenceback

	Static prop "_losblocker_fencea" W/ "models/props_urban/fence_cover001_128.mdl" @ setpos_exact -2698 2029 -0.675446

	Static prop "_losblocker_fenceb" W/ "models/props_urban/fence_cover001_128.mdl" @ setpos_exact -2682 2155 -0.675446

	Static prop "_propladder_airconda" W/ "models/props_rooftop/acvent04.mdl" @ setpos_exact -1938 683 160

	Static prop "_propladder_aircondb" W/ "models/props_rooftop/acunit01.mdl" @ setpos_exact -1825 490 231

	Static prop "_trailerfence_wrongway" W/ "models/props_misc/wrongway_sign01_optimized.mdl" @ setpos_exact -1093 2848 100

	Physics prop "_hittable_bumpera_m4translated" W/ "models/props_fairgrounds/bumpercar.mdl" @ setpos_exact -5048 1361 4

	Physics prop "_hittable_bumperb_m4translated" W/ "models/props_fairgrounds/bumpercar.mdl" @ setpos_exact -5123 1374 31

	trigger_playermovement "_duckqol_swanroomcpanel" with Option Duck @ setpos_exact 483 4854 136

	trigger_playermovement "_duckqol_coastergate" with Option Duck @ setpos_exact -2756 1690 139

	Ladder found @ "-1278 2672 160" and shifted w/ offset @ "13 0 0"

	Ladder found @ "-3518 1780 102" and shifted w/ offset @ "0 2.1 0"

	Ladder found @ "-4164 2274 128" and shifted w/ offset @ "0 -2 0"

	Ladder found @ "-484 506 160" and shifted w/ offset @ "0 -3 0"

	Navmesh modified w/ CHECKPOINT @ setpos_exact 3852 2037 -64

------------------------------------------------------------------------------------------------------------------------

DARK CARNIVAL - BARNS || c2m4_barns

All:

	Clip "_outhouse_saferoof" blocks Survivors @ setpos_exact 2608 3920 -88

	Clip "_booster_barnbeam1" blocks Survivors @ setpos_exact -2022 -129 32

	Clip "_booster_barnbeam2" blocks Survivors @ setpos_exact -2022 -321 32

	Clip "_booster_barnbeam3" blocks Survivors @ setpos_exact -1318 63 32

	Clip "_booster_barnbeam4" blocks Survivors @ setpos_exact -1318 -129 32

	Clip "_booster_barnbeam5" blocks Survivors @ setpos_exact -1318 -321 32

	Clip "_booster_barnbeam6" blocks Survivors @ setpos_exact -614 63 32

	Clip "_booster_barnbeam7" blocks Survivors @ setpos_exact -614 -129 32

	Clip "_booster_barnbeam8" blocks Survivors @ setpos_exact -614 -321 32

	Clip "_nav_eventfenceback" blocks Survivors @ setpos_exact -2266 807 -12

	Clip "_booster_clipextend" blocks Survivors @ setpos_exact 646 1995 356

	Clip "_cliprework_finalfence" blocks Survivors @ setpos_exact -120 2446 320

	Clip "_booster_lightpole1" blocks Survivors @ setpos_exact 280 2077 387

	Clip "_booster_lightpole2" blocks Survivors @ setpos_exact 1 1508 387

	Clip "_booster_lightpole3" blocks Survivors @ setpos_exact -226 846 387

	Clip "_booster_lightpole4" blocks Survivors @ setpos_exact -483 1508 387

	Clip "_booster_lightpole5" blocks Survivors @ setpos_exact -985 1508 387

	Clip "_booster_lightpole6" blocks Survivors @ setpos_exact -1765 1508 387

	Clip "_booster_lightpole7" blocks Survivors @ setpos_exact -2162 901 387

	Clip "_booster_lightpole8" blocks Survivors @ setpos_exact -1198 902 387

	Clip "_booster_dualtents" blocks Survivors @ setpos_exact -2993 1146 417

	Clip "_booster_awning" blocks Survivors @ setpos_exact -3119 528 5

	Clip "_booster_elecroof" blocks Survivors @ setpos_exact 426 2316 57

	Clip "_ladder_askewhedgeshared_base" blocks Everyone @ setpos_exact 609 1233 -192

	Safe room Commons SPAWN_IN_FRONT_OF_SURVIVORS fix created @ setpos_exact -596 2312 -256

	Safe room Commons SPAWN_IN_FRONT_OF_SURVIVORS fix created @ setpos_exact -508 2503 -256

PvP:

	Clip "_commonhop_generator1" blocks Survivors @ setpos_exact -1716 273 -81

	Clip "_commonhop_generator2" blocks Everyone @ setpos_exact -1660 275 -192

	TRIG:	Anti-shortcut "_barnsroof_trigonce" deletes clip at barns exit.

	Clip "_barnsroof_commonhop" blocks Survivors @ setpos_exact -1312 256 180

	Deleted func_playerinfected_clip @ setpos_exact 1967 3455 -257

	Tank/Charger chokepoint atomizer created @ setpos_exact -960 -404 -184

	Brush "_losfix_barn_gen" created @ setpos_exact -1742 346 -185

	Brush "_losfix_drop_trailer" created @ setpos_exact -2423 4 -185

	Brush "_losfix_start_trailer1a" created @ setpos_exact 2347 3295 -185

	Brush "_losfix_start_trailer1b" created @ setpos_exact 2244 3333 -185

	Brush "_losfix_start_trailer2" created @ setpos_exact 2814 2614 -185

	Clip "_eventfence_wrongway" blocks Infected @ setpos_exact -200 2652 352

	Clip "_eventrooftop_smoother1" blocks Infected @ setpos_exact -3305 1312 195

	Clip "_eventrooftop_smoother2" blocks Infected @ setpos_exact -3305 1312 195

	Clip "_ladder_askewhedgeshared_clip" blocks Infected + AI @ setpos_exact 593 1177 -63

	Clip "_ladder_barnoverhang_clip" blocks Survivors @ setpos_exact -731 56 -86

	Clip "_ladder_barnsarearight_clip" blocks Everyone @ setpos_exact 263 2288 -192

	Clip "_ladder_startroof_clip" blocks Everyone @ setpos_exact 3362.5 3216 -187

	LADDER: _ladder_askewhedgebotr1_cloned_askewhedgebotl

	LADDER: _ladder_askewhedgebotr2_cloned_askewhedgebotl

	LADDER: _ladder_askewhedgetopl1_cloned_askewhedgetopr

	LADDER: _ladder_askewhedgetopl2_cloned_askewhedgetopr

	LADDER: _ladder_barnsarearight_cloned_barnsarealeft

	LADDER: _ladder_barnoverhang_cloned_starttrailer

	LADDER: _ladder_bumperhedgeleft_cloned_meatburgerhedge

	LADDER: _ladder_bumperhedgeright_cloned_meatburgerhedge

	LADDER: _ladder_cornerfence_cloned_fencebackalley

	LADDER: _ladder_eventcedabanner1_cloned_askewhedgetopr

	LADDER: _ladder_eventcedabanner2_cloned_askewhedgetopr

	LADDER: _ladder_eventcedabanner3_cloned_askewhedgetopr

	LADDER: _ladder_eventendfencefront_cloned_endfenceback

	LADDER: _ladder_eventwallfence_cloned_peachpitwall

	LADDER: _ladder_finalrun1_cloned_hotdogstand

	LADDER: _ladder_finalrun2_cloned_bumpsidemid

	LADDER: _ladder_lightapplesfront_cloned_lightapplesback

	LADDER: _ladder_lightticketsbackB_cloned_lightapplesback

	LADDER: _ladder_lightticketsbackT_cloned_lightapplesback

	LADDER: _ladder_lightticketsfrontB_cloned_lightapplesback

	LADDER: _ladder_lightticketsfrontT_cloned_lightapplesback

	LADDER: _ladder_redtentmid_cloned_redtentstart

	LADDER: _ladder_startfoodcart_cloned_colddrinkfence

	LADDER: _ladder_starthedge_cloned_startfence

	LADDER: _ladder_startroof_cloned_elecbox

	Static prop "_barn_overhang_floor" W/ "models/props_update/c2m4_barn_overhang.mdl" @ setpos_exact -608 162 28

	Static prop "_barn_overhang_ladder" W/ "models/props_c17/metalladder001.mdl" @ setpos_exact -731 57 32

	Static prop "_barn_overhang_laddercover" W/ "models/props_highway/plywood_01.mdl" @ setpos_exact -707 53.9 -97

	Static prop "_barn_overhang_haybaila" W/ "models/props_unique/haybails_single.mdl" @ setpos_exact -499 111 31

	Static prop "_barn_overhang_haybailb" W/ "models/props_unique/haybails_single.mdl" @ setpos_exact -528 111 75

	Static prop "_barn_overhang_haybailc" W/ "models/props_unique/haybails_single.mdl" @ setpos_exact -556 111 31

	Static prop "_barn_overhang_haybaild" W/ "models/props_unique/haybails_single.mdl" @ setpos_exact -690 215 75

	Static prop "_barn_overhang_haybaile" W/ "models/props_unique/haybails_single.mdl" @ setpos_exact -661 215 31

	Static prop "_barn_overhang_haybailf" W/ "models/props_unique/haybails_single.mdl" @ setpos_exact -718 215 31

	Static prop "_cosmetic_barn_ladder" W/ "models/props_c17/metalladder001.mdl" @ setpos_exact -665 -55 -189.2

	Static prop "_cosmetic_fencea" W/ "models/props_urban/fence_cover001_256.mdl" @ setpos_exact 896 2824 -192

	Static prop "_cosmetic_fenceb" W/ "models/props_urban/fence_cover001_256.mdl" @ setpos_exact 384 2818.3 -192

	Static prop "_endfence_wrongwaya" W/ "models/props_misc/wrongway_sign01_optimized.mdl" @ setpos_exact -276 2636 -195

	Static prop "_endfence_wrongwayb" W/ "models/props_misc/wrongway_sign01_optimized.mdl" @ setpos_exact -132 2636 -195

	Static prop "_propladder_garbagecan" W/ "models/props_urban/garbage_can002.mdl" @ setpos_exact -2284 1028 -191

	Static prop "_ladder_startroof_pipe" W/ "models/props_rooftop/Gutter_Pipe_256.mdl" @ setpos_exact 3362 3216 -4.1

	Static prop "_ladderpatch_awningfence1" W/ "models/props_fortifications/police_barrier001_128_reference.mdl" @ setpos_exact -635 2035 -192

	Static prop "_ladderpatch_awningfence2" W/ "models/props_fortifications/police_barrier001_128_reference.mdl" @ setpos_exact -728 1969 -244

	Static prop "_startfoodcart_wrongwaya" W/ "models/props_misc/wrongway_sign01_optimized.mdl" @ setpos_exact 2125 3970 -130

	Static prop "_startfoodcart_wrongwayb" W/ "models/props_misc/wrongway_sign01_optimized.mdl" @ setpos_exact 2325 3970 -130

	Static prop "_startfoodcart_wrongwayc" W/ "models/props_misc/wrongway_sign01_optimized.mdl" @ setpos_exact 1966 3938 -130

	Physics prop "_barn_middleroom_hittable" W/ "models/props_unique/haybails_single.mdl" @ setpos_exact -1103 191 -147.42

	Physics prop "_hittable_bumpera" W/ "models/props_fairgrounds/bumpercar.mdl" @ setpos_exact 3329 3280 -186

	Physics prop "_hittable_bumperb" W/ "models/props_fairgrounds/bumpercar.mdl" @ setpos_exact 3254 3293 -159

	Ladder found @ "-666 2044 -192" and shifted w/ offset @ "11 -29 0"

	Ladder found @ "1907 894 -64" and shifted w/ offset @ "-40 -5 0"

Coop:

	KILL:	Safe roof exploit unpatched for Coop (popular request).

Survival:

	Clip "_eventskip_fencehang" blocks Survivors @ setpos_exact 398 1990 -48

	Clip "_nav_eventfencea" blocks Survivors @ setpos_exact -2751 749 -21

	Clip "_nav_eventfenceb" blocks Survivors @ setpos_exact -2499 749 -21

	Clip "_ladder_askewhedgeshared_clip" blocks Infected + AI @ setpos_exact 593 1177 -63

	LADDER: _ladder_askewhedgebotr1_cloned_askewhedgebotl

	LADDER: _ladder_askewhedgebotr2_cloned_askewhedgebotl

	LADDER: _ladder_askewhedgetopl1_cloned_askewhedgetopr

	LADDER: _ladder_askewhedgetopl2_cloned_askewhedgetopr

------------------------------------------------------------------------------------------------------------------------

DARK CARNIVAL - CONCERT || c2m5_concert

All:

	Clip "_nav_lightingtrussa" blocks Survivors @ setpos_exact -1275 2261 368

	Clip "_nav_lightingtrussd" blocks Survivors @ setpos_exact -2060 2261 368

	Clip "_nav_lightingtrussf" blocks Survivors @ setpos_exact -2549 2261 368

	Clip "_nav_lightingtrussh" blocks Survivors @ setpos_exact -3065 2261 368

	Clip "_nav_lightingtrussi" blocks Survivors @ setpos_exact -3318 2261 368

	Clip "_nav_lightingtrussg" blocks Survivors @ setpos_exact -2822.5 2261 367.7

	Clip "_nav_lightingtrusse" blocks Survivors @ setpos_exact -2296 2261 368

	Clip "_nav_lightingtrussb" blocks Survivors @ setpos_exact -1544 2261 368

	Clip "_nav_lightingtrussc" blocks Survivors @ setpos_exact -1800 2261 368

	Clip "_permstuck_fence" blocks Survivors @ setpos_exact -1110 2274 -112

	Clip "_cliprework_lastwindow" blocks Survivors @ setpos_exact -3853 2279 280

	Clip "_nav_duediligence" blocks Survivors @ setpos_exact -997 3049 -128

	Clip "_cliprework_concertlights" blocks Survivors @ setpos_exact -2305 3277 140

	Clip "_cliprework_concertposter" blocks Survivors @ setpos_exact -2304 3687 204

	Clip "_cliprework_concertroofio" blocks Survivors @ setpos_exact -2302 3197 352

	Clip "_smoother_windows" blocks Infected + AI @ setpos_exact -609 2387 329

	Clip "_missing_staircase_clip" blocks Everyone @ setpos_exact -922 1933 173

	Clip "_booster_lightleft" blocks Survivors @ setpos_exact -2472 3148 278

	Clip "_booster_lightright" blocks Survivors @ setpos_exact -2152 3148 278

	Clip "_commentary_replace_01" blocks Survivors @ setpos_exact -1248 3316 80

	Clip "_backstairs_left" blocks Survivors @ setpos_exact -4086 2688 264

	Clip "_backstairs_right" blocks Survivors @ setpos_exact -951 2073 264

PvP:

	Static prop "_helistuck_caseunique" W/ "models/props_fairgrounds/bass_case.mdl" @ setpos_exact -3466 2899 -106

	Static prop "_helistuck_casecaster" W/ "models/props_fairgrounds/anvil_case_casters_64.mdl" @ setpos_exact -3488 2870 -128

	TRIG:	Player-deleting trigger_multiple replaced with trigger_hurt.

	Deleted ([402] trigger_multiple) @ setpos_exact -3920 3152 -192

	Deleted func_playerinfected_clip @ setpos_exact -1561 1863 119

	Deleted func_playerinfected_clip @ setpos_exact -1561 1743 16

	Deleted func_playerinfected_clip @ setpos_exact -2817 2199 -353

	Deleted func_playerinfected_clip @ setpos_exact -2817 2455 -353

	Deleted func_playerinfected_clip @ setpos_exact -3361 3711 -81

	Tank/Charger chokepoint atomizer created @ setpos_exact -3527 3008 -256

	Tank stuck spawn y+ axis warp created @ setpos_exact -2304 2455 -96

	Tank stuck spawn x+ axis warp created @ setpos_exact -1400 1920 288

	Tank stuck spawn x- axis warp created @ setpos_exact -3209 1920 288

	Brush "_losfix_lightpanel" created @ setpos_exact -2299 2124 130

	Brush "_losfix_plywood1" created @ setpos_exact -2846 2934 -255

	Brush "_losfix_plywood2" created @ setpos_exact -1303 3098 -253

	Brush "_losfix_scaffolding1a" created @ setpos_exact -1988 2489 -83

	Brush "_losfix_scaffolding1b" created @ setpos_exact -1804 2489 -83

	Brush "_losfix_scaffolding1c" created @ setpos_exact -1903 2524 -83

	Brush "_losfix_scaffolding2a" created @ setpos_exact -2668 2489 -83

	Brush "_losfix_scaffolding2b" created @ setpos_exact -2852 2489 -83

	Brush "_losfix_scaffolding2c" created @ setpos_exact -2767 2524 -83

	Brush "_losfix_start_trailer1" created @ setpos_exact -3740 3292 -248

	Brush "_losfix_start_trailer2" created @ setpos_exact -4097 3304 -248

	Clip "_axiswarp_anvilcase_clip" blocks Infected @ setpos_exact -2304 2456 -224

	Clip "_axiswarp_sodapop1_clip" blocks Infected @ setpos_exact -1399 1920 104

	Clip "_axiswarp_sodapop2_clip" blocks Infected @ setpos_exact -3210 1920 104

	Clip "_missing_staircase_clip" blocks Everyone @ setpos_exact -922 1933 173

	Clip "_smoother_windows" blocks Infected + AI @ setpos_exact -609 2387 329

	LADDER: _ladder_fencedperch_cloned_scaffoldsingle

	LADDER: _ladder_fireworksL_cloned_scaffoldsinglefork

	LADDER: _ladder_fireworksR_cloned_scaffoldsinglefork

	LADDER: _ladder_leftchopperwindowl_cloned_leftchopperwindowr

	LADDER: _ladder_startfenceback_cloned_fencecoverfront

	LADDER: _ladder_startfencefront_cloned_fencecoverback

	Static prop "_missing_staircase" W/ "models/props_interiors/stair_metal_02.mdl" @ setpos_exact -840 1792 136

	Static prop "_yesdraw_infecteddoorway" W/ "models/props_update/c2m5_infectedroom_doorway.mdl" @ setpos_exact -3200 3972 0

	Static prop "_yesdraw_infectedroom" W/ "models/props_update/c2m5_infectedroom.mdl" @ setpos_exact -3200 3727 0

	Physics prop "_hittable_dumpleft" W/ "models/props_junk/dumpster_2.mdl" @ setpos_exact -1551 3682 -255

	Physics prop "_hittable_dumpright" W/ "models/props_junk/dumpster_2.mdl" @ setpos_exact -3296 3682 -255

	KILL:	Left and right defibrillators deleted for Versus. See: https://www.l4d.com/blog/post.php?id=3935

	Deleted ([50] weapon_defibrillator_spawn) @ setpos_exact -2667.81 2358.75 80.4599

	Deleted ([54] weapon_defibrillator_spawn) @ setpos_exact -1812.16 2326.31 80.4599

	KILL:	Extra pills which are meant to be killed OnVersus but still spawn on 2nd round deleted for Versus.

	Deleted func_playerinfected_clip @ setpos_exact -3209.08 1863 119

	Deleted func_playerinfected_clip @ setpos_exact -3209.08 1743 16

------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------

SWAMP FEVER - PLANK COUNTRY || c3m1_plankcountry

All:

	Clip "_hedge_behindtrains" blocks Survivors @ setpos_exact -11078 8237 320

	Clip "_commonhop_crossing" blocks Survivors @ setpos_exact -1025 4859 332

	Clip "_clipgap_fence" blocks Survivors @ setpos_exact -11084 7220 428

	Clip "_permstuck_coolingtank" blocks Everyone @ setpos_exact -10754 8610 216

	Clip "_cliprework_jonesroof" blocks Survivors @ setpos_exact -8304 7216 628

	Clip "_commonhop_coolingtank" blocks Survivors @ setpos_exact -6806 7572 144

	Clip "_booster_treetop" blocks Survivors @ setpos_exact -5696 7348 247

	Clip "_chargerassist_trainwheel" blocks Survivors @ setpos_exact -12379 8416 259

	Clip "_chargerassist_fenceladdy" blocks Survivors @ setpos_exact -6248 5650 72

	Clip "_cliprework_garage" blocks Survivors @ setpos_exact -11106 10498 488

	Clip "_cliprework_house" blocks Survivors @ setpos_exact -11343 7758 320

	Clip "_fallenlog_shrub_survivor" blocks Survivors @ setpos_exact 560 9614 83

	Clip "_fallenlog_shrub_infected" blocks Infected + AI @ setpos_exact 560 9614 83

	Clip "_chargerassist_commonhop1" blocks Survivors @ setpos_exact -7093 6280 160

	Clip "_chargerassist_commonhop2" blocks Survivors @ setpos_exact -7093 6452 160

	Clip "_booster_powerpole" blocks Survivors @ setpos_exact -7630 6718 444

	Static prop "_keepcalmgator" W/ "models/props_fairgrounds/alligator.mdl" @ setpos_exact -5274 7386 -19

PvP:

	Deleted func_playerinfected_clip @ setpos_exact -1537 9823 -33

	Deleted func_playerinfected_clip @ setpos_exact -2769 655 239

	Deleted func_playerinfected_clip @ setpos_exact -3681 655 -33

	Tank stuck spawn x+ axis warp created @ setpos_exact -13026 9199 191

	Brush "_losfix_start_fence1" created @ setpos_exact -10968 9586 164

	Brush "_losfix_start_fence2" created @ setpos_exact -11264 9665 164

	Brush "_losfix_start_gen1" created @ setpos_exact -11817 9724 175

	Brush "_losfix_start_gen2" created @ setpos_exact -11801 9723 175

	Brush "_losfix_start_semi" created @ setpos_exact -11314 9748 181

	Brush "_losfix_start_train1" created @ setpos_exact -11574 11024 210

	Brush "_losfix_start_train2a" created @ setpos_exact -12154 10858 210

	Brush "_losfix_start_train2b" created @ setpos_exact -12075 10905 210

	Brush "_losfix_start_train3a" created @ setpos_exact -12658 10287 210

	Brush "_losfix_start_train3b" created @ setpos_exact -12609 10351 210

	Brush "_losfix_start_train3c" created @ setpos_exact -12566 10432 210

	Brush "_losfix_start_train3d" created @ setpos_exact -12476 10590 210

	Brush "_losfix_start_train3e" created @ setpos_exact -12519 10509 210

	Brush "_losfix_start_train4a" created @ setpos_exact -12725 10059 210

	Brush "_losfix_start_train4b" created @ setpos_exact -12815 9792 210

	Brush "_losfix_start_train4c" created @ setpos_exact -12766 9929 210

	Brush "_losfix_start_train5a" created @ setpos_exact -12844 9464 210

	Brush "_losfix_start_train5b" created @ setpos_exact -12795 9327 210

	Brush "_losfix_start_train5c" created @ setpos_exact -12754 9197 210

	Clip "_ladder_earlsgatorvillage_clip" blocks Everyone @ setpos_exact -7462 7696 32

	Clip "_meticulous_funcinfclip01" blocks Infected @ setpos_exact -484 9840 90

	Clip "_meticulous_funcinfclip02" blocks Infected @ setpos_exact -2668 416 256

	Clip "_meticulous_funcinfclip03" blocks Infected @ setpos_exact -3516 543 61

	Clip "_meticulous_funcinfclip04" blocks Infected @ setpos_exact -1846 433 61

	Clip "_starttrains_badredclip" blocks Infected @ setpos_exact -12728 9028 216

	LADDER: _ladder_bridgetunnelleft_cloned_shacklegback

	LADDER: _ladder_bridgetunnelright_cloned_shacklegfront

	LADDER: _ladder_earlsgatorvillage_cloned_goodbuyautoparts

	LADDER: _ladder_endtrainsB_cloned_boardwalkleg

	LADDER: _ladder_endtrainsT_cloned_boardwalkleg

	LADDER: _ladder_endtrainsback_cloned_boardwalkleg

	LADDER: _ladder_gaschainlinkin_cloned_gaschainlinkout

	LADDER: _ladder_jonescar_cloned_goodbuyautoparts

	LADDER: _ladder_jonesvines_cloned_railroadgate

	LADDER: _ladder_rightafterchains_cloned_railroadgate

	LADDER: _ladder_startsemirear_cloned_boardwalkhole

	LADDER: _ladder_startsemitire_cloned_boardwalkhole

	LADDER: _ladder_starttrainfront1_cloned_boardwalkhole

	LADDER: _ladder_starttrainfront2_cloned_boardwalkhole

	LADDER: _ladder_starttrainvalve_cloned_starttrainyellow

	Navblocker "_nav_startshrubwall1" blocks Everyone w/ Apply @ setpos_exact -12524 10074 161

	Navblocker "_nav_startshrubwall2" blocks Everyone w/ Apply @ setpos_exact -12588 9075 168

	Navblocker "_nav_oldtree1" blocks Everyone w/ Apply @ setpos_exact -3447 8260 0

	Navblocker "_nav_oldtree2" blocks Everyone w/ Apply @ setpos_exact -4225 8490 0

	Static prop "_cosmetic_shruba" W/ "models/props_foliage/swamp_shrubwall_512_deep.mdl" @ setpos_exact -2695 280 250

	Static prop "_cosmetic_shrubb" W/ "models/props_foliage/swamp_shrubwall_512_deep.mdl" @ setpos_exact -3153 295 250

	Static prop "_cosmetic_shrubc" W/ "models/props_foliage/swamp_shrubwall_512_deep.mdl" @ setpos_exact -2242 295 250

	Static prop "_propladder_plank" W/ "models/props_swamp/plank001b_192.mdl" @ setpos_exact -6791 7712 200

	Static prop "_losblocker_oldtree1" W/ "models/props_foliage/old_tree01.mdl" @ setpos_exact -3447 8298 -12

	Static prop "_losblocker_oldtree2" W/ "models/props_foliage/old_tree01.mdl" @ setpos_exact -4212 8550 -12

	Static prop "_endsaferoom_wrongwaya" W/ "models/props_misc/wrongway_sign01_optimized.mdl" @ setpos_exact -3415 430 320

	Static prop "_endsaferoom_wrongwayb" W/ "models/props_misc/wrongway_sign01_optimized.mdl" @ setpos_exact -3510 535 485

	Static prop "_solidify_startshrubwall1" W/ "models/props_foliage/swamp_shrubwall_block_128_deep.mdl" @ setpos_exact -12543.6 10072.5 181.932

	Static prop "_solidify_startshrubwall2" W/ "models/props_foliage/swamp_shrubwall_block_128_deep.mdl" @ setpos_exact -12550.2 9119.21 148.872

	Static prop "_start_fencea" W/ "models/props_urban/fence_cover001_256.mdl" @ setpos_exact -11265 9665 167.25

	Static prop "_start_fenceb" W/ "models/props_urban/fence_cover001_64.mdl" @ setpos_exact -10968 9586.1 167.25

	Deleted func_playerinfected_clip @ setpos_exact -2577 655 -33

Survival:

	Clip "_survivalcrit_bayouboost" blocks Survivors @ setpos_exact -4358 6079 -21

	Clip "_survival_brushextenda" blocks Survivors @ setpos_exact -7967 7806 308

	Clip "_survival_brushextendb" blocks Survivors @ setpos_exact -8832 7232 336

	Clip "_survival_brushextendc" blocks Survivors @ setpos_exact -9471 7496 384

	Clip "_nav_pubsign" blocks Survivors @ setpos_exact -7264 7167 202

	Clip "_nav_trailertree" blocks Survivors @ setpos_exact -7742 7721 287

------------------------------------------------------------------------------------------------------------------------

SWAMP FEVER - SWAMP || c3m2_swamp

All:

	Clip "_boat_smoother" blocks Everyone @ setpos_exact -7863 5391 -8

PvP:

	Clip "_brokenhouse_hedgegap" blocks Survivors @ setpos_exact 3915 2029 145

	LOGIC:	Anti-skip plane clips will be deleted when door is blown.

	Clip "_cabin_door_button_a" blocks Survivors @ setpos_exact -1932 3700 196

	Clip "_cabin_door_button_b" blocks Survivors @ setpos_exact -1888 3079 226

	Clip "_cabin_door_button_c" blocks Survivors @ setpos_exact -1622 2298 162

	Brush "_losfix_end_gen1" created @ setpos_exact 8011 2779 128

	Brush "_losfix_end_gen2" created @ setpos_exact 8007 2793 128

	Clip "_propladder_crate_qol" blocks Infected @ setpos_exact 8055 100 166

	LADDER: _ladder_brokenhomeleft_cloned_airplanewingmini

	LADDER: _ladder_brokenhomeright_cloned_airplanewingmini

	LADDER: _ladder_corrugatedhome_cloned_airplaneleft

	LADDER: _ladder_crashedplanetail_cloned_crashedplaneright

	LADDER: _ladder_endbarricadeleft1_cloned_airplaneleft

	LADDER: _ladder_endbarricadeleft2_cloned_airplaneleft

	LADDER: _ladder_endbarricaderight1_cloned_airplaneleft

	LADDER: _ladder_endbarricaderight2_cloned_airplaneleft

	LADDER: _ladder_endfence_cloned_airplaneleft

	LADDER: _ladder_finalhome_cloned_airplaneleft

	Static prop "_propladder_endcratea" W/ "models/props_crates/static_crate_40.mdl" @ setpos_exact 8045 79 118.63

	Static prop "_propladder_endcrateb" W/ "models/props_crates/static_crate_40.mdl" @ setpos_exact 8083 102 118.63

	Static prop "_ladder_corrugatedhome_panel" W/ "models/props_highway/corrugated_panel_damaged_01.mdl" @ setpos_exact 1855 3334 82

	Physics prop "_hittable_fallentree" W/ "models/props_foliage/swamp_fallentree01_bare.mdl" @ setpos_exact 3225 1879 1

	Static prop "_propladder_endsaferoof1" W/ "models/props_crates/static_crate_40.mdl" @ setpos_exact 7777 -603 126

	Static prop "_propladder_endsaferoof2" W/ "models/props_crates/static_crate_40.mdl" @ setpos_exact 7775 -646 126

	Static prop "_propladder_endsaferoof3" W/ "models/props_crates/static_crate_40.mdl" @ setpos_exact 7775 -646 166

	Static prop "_solidify_endtreegiant" W/ "models/props_foliage/urban_tree_giant01.mdl" @ setpos_exact 7849 -791 126.481

------------------------------------------------------------------------------------------------------------------------

SWAMP FEVER - SHANTY TOWN || c3m3_shantytown

All:

	Clip "_endhaybails_collision" blocks Infected + AI @ setpos_exact 5126 -3967 378

	Clip "_permstuck_fridge" blocks Everyone @ setpos_exact -3791 -2972 136

	Clip "_trailerhouse_smoother1" blocks Everyone @ setpos_exact -3294 -324 -8

	Clip "_trailerhouse_smoother2" blocks Everyone @ setpos_exact -3298 -549 -8

	Clip "_skyboxshield_endsafehouse" blocks Infected @ setpos_exact 5067 -3777 552

	Static prop "_permstuck_cratebot" W/ "models/props_crates/static_crate_40.mdl" @ setpos_exact -3749.85 -183.67 -3.164

	Static prop "_permstuck_cratetop" W/ "models/props_crates/static_crate_40.mdl" @ setpos_exact -3749.85 -182.67 36.837

PvP:

	Clip "_shortcut_window" blocks Survivors @ setpos_exact -4120 -2232 38

	Clip "_shortcut_barricadetarp" blocks Survivors @ setpos_exact -4786 1014 298

	Deleted func_playerinfected_clip @ setpos_exact -5121 1567 -353

	Brush "_losfix_endhaybailsa" created @ setpos_exact 5125 -3966.5 350

	Brush "_losfix_endhaybailsb" created @ setpos_exact 5125 -3966.5 402

	Brush "_losfix_opening_gen" created @ setpos_exact -4385 -2721 131

	Brush "_losfix_opening_trailer" created @ setpos_exact -3332 417 -1

	Brush "_losfix_start_truck1" created @ setpos_exact -5171 1649 139

	Brush "_losfix_start_truck2" created @ setpos_exact -5214 1602 139

	Clip "_endhaybails_collisiona" blocks Infected @ setpos_exact 5126 -3967 378

	Clip "_endhaybails_collisionb" blocks Infected @ setpos_exact 5126 -3967 426

	Clip "_ladder_afterplankfront_clip" blocks Infected @ setpos_exact 381 -4026 79

	Clip "_ladder_endsafehousetall_clip" blocks Everyone @ setpos_exact 4754 -3718 209

	Clip "_ladder_longtiltedlog_clipbot" blocks Infected @ setpos_exact -4037 -867 -21

	Clip "_ladder_longtiltedlog_cliptop" blocks Infected @ setpos_exact -4103 -835 268

	Clip "_ladder_plankhomeroof_clipleft" blocks Everyone @ setpos_exact 59 -4103 109

	Clip "_ladder_plankhomeroof_clipright" blocks Everyone @ setpos_exact 33 -4099 109

	Clip "_ladder_startsafehouse_solidify" blocks Infected @ setpos_exact -5948 1913 244

	LADDER: _ladder_afterplankfront_cloned_afterplankback

	LADDER: _ladder_boatpanel_cloned_metalfence

	LADDER: _ladder_bridgehouseB_cloned_logfencefirst

	LADDER: _ladder_bridgehouseT_cloned_firebarrelhouse

	LADDER: _ladder_bugnethome_cloned_metalfence

	LADDER: _ladder_endsafehousetall_cloned_buglampoon

	LADDER: _ladder_eventstartlowground_cloned_startshantyshop

	LADDER: _ladder_eventmidlowground_cloned_gunshackback

	LADDER: _ladder_eventendlowground_cloned_gunshackback

	LADDER: _ladder_gonefishing_cloned_tallstartarea

	LADDER: _ladder_logfencenext_cloned_logfencefirst

	LADDER: _ladder_longtiltedlog_cloned_privateproperty

	LADDER: _ladder_mehsurvival_cloned_startouthouse

	LADDER: _ladder_outhouseroof_cloned_metalfence

	LADDER: _ladder_plankhomeroof_cloned_afterplankback

	LADDER: _ladder_safehouselow_cloned_highgenerator

	LADDER: _ladder_shortcuttrailerfront_cloned_shortcuttrailerback

	LADDER: _ladder_smalltrailerlogs_cloned_startsmalltrailer

	LADDER: _ladder_startbehindrooftop_cloned_startshantyshop

	LADDER: _ladder_startnodrawfence_cloned_shantyshop

	LADDER: _ladder_startpicketqol_cloned_startpicketroof

	LADDER: _ladder_startsafehouse_cloned_highgenerator

	LADDER: _ladder_tarptrailerwood_cloned_startouthouse

	Static prop "_permstuck_cratebot" W/ "models/props_crates/static_crate_40.mdl" @ setpos_exact -3749.85 -183.67 -3.164

	Static prop "_permstuck_cratetop" W/ "models/props_crates/static_crate_40.mdl" @ setpos_exact -3749.85 -182.67 36.837

	Static prop "_yesdraw_nodrawfence" W/ "models/props_update/c3m3_nodrawfence.mdl" @ setpos_exact -5212 1765 213.5

	Static prop "_ladder_mehsurvival_boat" W/ "models/props_canal/boat001a.mdl" @ setpos_exact -3438 -612 42

	Physics prop "_hittable_fallentree" W/ "models/props_foliage/swamp_fallentree01_bare.mdl" @ setpos_exact -3935 -1120 -11

	Ladder found @ "-4304 -194 88.5" and shifted w/ offset @ "0 -3 0"

------------------------------------------------------------------------------------------------------------------------

SWAMP FEVER - PLANTATION || c3m4_plantation

All:

	Clip "_permstuck_housetarp" blocks Everyone @ setpos_exact -1753 -996 16

	Clip "_commonhop_mansionroof" blocks Survivors @ setpos_exact 1856 -596 640

	Clip "_stuckwarp_understairs" blocks Everyone @ setpos_exact 2816 119 162

	Clip "_booster_mansionroofa" blocks Survivors @ setpos_exact 1660 527 640

	Clip "_booster_mansionroofb" blocks Survivors @ setpos_exact 1660 399 640

	Clip "_booster_mansionroofc" blocks Survivors @ setpos_exact 1660 -47 640

	Clip "_booster_scaffoldpins" blocks Survivors @ setpos_exact 527 177 243

	Clip "_booster_treeleft" blocks Survivors @ setpos_exact 735 1518 373

	Clip "_booster_treeright" blocks Survivors @ setpos_exact 2558 1526 373

	Clip "_nav_tinytree1" blocks Survivors @ setpos_exact 1485 997 311

	Clip "_nav_tinytree2" blocks Survivors @ setpos_exact 1835 937 311

	Clip "_nav_tinytree3" blocks Survivors @ setpos_exact 1825 1227 311

	Clip "_nav_tinytree4" blocks Survivors @ setpos_exact 1555 1227 311

	Clip "_nav_tinytree5" blocks Survivors @ setpos_exact 1429 1887 311

	Clip "_nav_tinytree6" blocks Survivors @ setpos_exact 1839 1817 311

	Brush "_defibtrick_undermap_dead" created @ setpos_exact 688 122 248

	LOGIC:	Point-of-no-return clip will be Enabled when finale is started.

	Clip "_point_of_no_return" blocks Survivors initially disabled @ setpos_exact 2064 -412 396

PvP:

	Brush "_brickhome_chimney1_losblock" created @ setpos_exact -1779 -3712 454

	Brush "_brickhome_chimney2_losblock" created @ setpos_exact -1298 -3712 454

	Brush "_losfix_start_truck1" created @ setpos_exact -1733 -2751 10

	Brush "_losfix_start_truck2" created @ setpos_exact -1785 -2695 10

	Clip "_brickhome_chimney1_collision" blocks Everyone @ setpos_exact -1779 -3712 454

	Clip "_brickhome_chimney2_collision" blocks Everyone @ setpos_exact -1298 -3712 454

	Clip "_ladder_houselow_clipl" blocks Everyone @ setpos_exact -2054 -1026 1

	Clip "_ladder_houselow_clipr" blocks Everyone @ setpos_exact -2012 -1032 1

	LADDER: _ladder_backwhitefence_cloned_brickhomeB

	LADDER: _ladder_brickhomeT_cloned_brickhomeB

	LADDER: _ladder_brickhomeside_cloned_brickhomeB

	LADDER: _ladder_campscaffold_cloned_brickhomeB

	LADDER: _ladder_dumpsterscaffold_cloned_brickhomeB

	LADDER: _ladder_enclosedhedges_cloned_brickhomeB

	LADDER: _ladder_escapepillar_cloned_escapeback

	LADDER: _ladder_househigh_cloned_cornerwhite

	LADDER: _ladder_houselow_cloned_treeright

	LADDER: _ladder_logpileup_cloned_brickhomeB

	LADDER: _ladder_mansionchoose_cloned_brickhomeB

	LADDER: _ladder_moundhole_cloned_minigunleft

	LADDER: _ladder_parkourattic_cloned_shortesthedge

	LADDER: _ladder_shelfpileleft_cloned_minigunleft

	LADDER: _ladder_shelfpileright_cloned_minigunright

Survival:

	Clip "_nav_shelvings" blocks Survivors @ setpos_exact 2127 -504 345

	FIX:	Point-of-no-return clip Enabled instantly to block Survivalists from boosting out.

------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------

HARD RAIN - MILLTOWN || c4m1_milltown_a

All:

	Decal "decals/rollermine_crater" painted @ setpos_exact -5671 6579 225

	Clip "_woodwindow" blocks Survivors @ setpos_exact 4144 -1423 391

	Clip "_permstuck_shruba" blocks Infected @ setpos_exact 3668 -1664 132

	Clip "_permstuck_shrubb" blocks Infected @ setpos_exact 3408 -1760 144

	Clip "_commonhop_safehouse" blocks Survivors @ setpos_exact 3984 -1863 464

	Clip "_booster_burgertankpole" blocks Survivors @ setpos_exact -5800 7496 603

	Clip "_booster_burgertankspin" blocks Survivors @ setpos_exact -5800 7496 915

	Clip "_booster_ginnytop" blocks Survivors @ setpos_exact -5425 6789 385

	Clip "_booster_ginnyjon" blocks Survivors @ setpos_exact -5425 6789 385

	Clip "_booster_gasextend" blocks Survivors @ setpos_exact -4624 7952 284

	Clip "_booster_blueframe" blocks Survivors @ setpos_exact -4641 7618 479

	Clip "_booster_roofwedge" blocks Survivors @ setpos_exact -5711 6528 416

	Clip "_booster_wrongwayup" blocks Survivors @ setpos_exact -4082 7142 608

	Clip "_booster_powerline" blocks Survivors @ setpos_exact -5297 7349 531

	Clip "_booster_clipextend" blocks Survivors @ setpos_exact -6561 6589 912

	Clip "_burgertank_windowsmoother1" blocks Everyone @ setpos_exact -5663 7268 135

	Clip "_burgertank_windowsmoother2" blocks Everyone @ setpos_exact -5798 7505 135

	Clip "_burgertank_windowsmoother3" blocks Everyone @ setpos_exact -6022 7777 135

	trigger_auto_crouch "_duckqol_greenposts1" created @ setpos_exact -2021 5568 98

	trigger_auto_crouch "_duckqol_greenposts2" created @ setpos_exact 1069 6976 224

	trigger_auto_crouch "_duckqol_playground" created @ setpos_exact -1442 6968 119

PvP:

	Clip "_treehouse_whitefence" blocks Survivors @ setpos_exact 1767 2219 267

	Brush "_losfix_ambulance1" created @ setpos_exact 711 4748 102

	Brush "_losfix_ambulance2" created @ setpos_exact 803 4690 102

	Brush "_losfix_burger_gen" created @ setpos_exact -5448 6765 107

	Brush "_losfix_dumpster" created @ setpos_exact 3550 343 128

	Brush "_losfix_gen1" created @ setpos_exact 241 5987 107

	Brush "_losfix_gen2" created @ setpos_exact 3448 -1345 113

	Brush "_losfix_semia" created @ setpos_exact -4771 7156 113

	Brush "_losfix_semib" created @ setpos_exact -4790 7180 113

	Brush "_losfix_trailer1" created @ setpos_exact -3370 7548 106

	Brush "_losfix_trailer2" created @ setpos_exact -3428 7594 106

	Brush "_losfix_trailer3" created @ setpos_exact -3510 7618 106

	Brush "_losfix_truck" created @ setpos_exact 3217 -1376 114

	Brush "_losfix_truck_jump" created @ setpos_exact 2949 2885 108

	Clip "_ladder_dumpsterhouse_clip" blocks Everyone @ setpos_exact 1638 4032 217

	Clip "_ladder_safehousetall_clip" blocks Infected @ setpos_exact 3725 -1537 101

	Clip "_ladder_sweetrelief_clip" blocks Everyone @ setpos_exact -5746 6595 96

	Clip "_ladder_yellowhousetree_topdenial" blocks Infected @ setpos_exact 2244 3123 378

	Clip "_safehousehedge_blocker" blocks Infected @ setpos_exact 4401 -2207 438

	LADDER: _ladder_autosalvagefront_cloned_playgroundroof

	LADDER: _ladder_classyjimboblue_cloned_garagesalehouse

	LADDER: _ladder_cornerhomeplants_cloned_garagesalehome

	LADDER: _ladder_cornerhometankfight_cloned_treehousefence

	LADDER: _ladder_cullingsub_cloned_cullingbuddy

	LADDER: _ladder_dumpsterhouse_cloned_alarmtrailer

	LADDER: _ladder_finalhouse_cloned_yellowhouse

	LADDER: _ladder_gaselecbox_cloned_autosalvageback

	LADDER: _ladder_grocerypillar_cloned_garagesalehouse

	LADDER: _ladder_mobilepickup_cloned_alarmtrailer

	LADDER: _ladder_safehousefenceback_cloned_cullingbuddy

	LADDER: _ladder_safehousetall_cloned_tallbuildingleft

	LADDER: _ladder_sweetrelief_cloned_autosalvageback

	LADDER: _ladder_tallbuildingright_cloned_tallbuildingleft

	LADDER: _ladder_trailerqol_cloned_alarmtrailer

	LADDER: _ladder_vinehouseqol_cloned_alarmtrailer

	LADDER: _ladder_woodhouseqol_cloned_alarmtrailer

	LADDER: _ladder_yellowhousetree_cloned_playgroundgutter

	Static prop "_ladder_finalhouse_pipe" W/ "models/props_downtown/gutter_downspout_straight_160_02.mdl" @ setpos_exact 3910 71 248

	Static prop "_ladder_grocerypillar_bust" W/ "models/props_interiors/concretepillar01_dm_base.mdl" @ setpos_exact -5680 6576 160.2

	Static prop "_ladder_grocerypillar_prop" W/ "models/props_interiors/concretepillar01.mdl" @ setpos_exact -5680 6128 163.8

	Static prop "_ladder_safehouse_pipe" W/ "models/props_pipes/PipeSet02d_512_001a.mdl" @ setpos_exact 3726 -1560 160

Survival:

	Clip "_survivalbig_skyboxcap" blocks Survivors @ setpos_exact -5802 7499 1248

------------------------------------------------------------------------------------------------------------------------

HARD RAIN - SUGAR MILL || c4m2_sugarmill_a

All:

	Clip "_commonhop_roadclosed" blocks Survivors @ setpos_exact 3231 -3009 257

	Clip "_vent_roofa" blocks Survivors @ setpos_exact 3699 -3727 476

	Clip "_vent_roofb" blocks Survivors @ setpos_exact 3127 -3635 502

	Clip "_permstuck_silos" blocks Everyone @ setpos_exact 2696 -6088 435

	Clip "_canefield_coneroof_m2only" blocks Survivors @ setpos_exact 72 -11887 573

	Clip "_canefield_conewoof_m2only" blocks Survivors @ setpos_exact -45 -10241 319

	Clip "_commonhop_dualstacks" blocks Survivors @ setpos_exact 264 -4866 498

	Clip "_permstuck_longfencea" blocks Survivors @ setpos_exact 3996 -4978 506

	Clip "_permstuck_longfenceb" blocks Survivors @ setpos_exact 4072 -5214 506

	Clip "_permstuck_longfencec" blocks Survivors @ setpos_exact 4042 -5462 506

	Clip "_permstuck_longfenced" blocks Survivors @ setpos_exact 4010 -5718 506

	Clip "_permstuck_longfencee" blocks Survivors @ setpos_exact 4010 -5978 506

	Clip "_permstuck_longfencef" blocks Survivors @ setpos_exact 3962 -6216 506

	Clip "_permstuck_quadtank" blocks Everyone @ setpos_exact 1638 -5280 292

	Clip "_shortcut_elevator_m2only" blocks Survivors @ setpos_exact -1477 -9605 114

	Clip "_commonhop_ducatelroof" blocks Survivors @ setpos_exact 3808 -3324 407

	Clip "_permstuck_cornerbush" blocks Everyone @ setpos_exact 3117 -1842 110

	Clip "_cliprework_clipextenda" blocks Survivors @ setpos_exact 1306 -6648 735

	Clip "_cliprework_clipextendb" blocks Survivors @ setpos_exact -703 -8512 1232

	Clip "_cliprework_millsilos" blocks Survivors @ setpos_exact 2782 -4349 937

	Clip "_cliprework_millwheel" blocks Survivors @ setpos_exact 1761 -5826 660

	Clip "_cliprework_plywoodlip" blocks Survivors @ setpos_exact -1743 -9483 624

	Clip "_cliprework_gasstation" blocks Survivors @ setpos_exact -899 -13512 432

	Clip "_nav_silo_witch1" blocks Survivors @ setpos_exact 2793 -5911 284

	Clip "_nav_silo_witch2" blocks Survivors @ setpos_exact 2695 -5854 284

	Clip "_nav_silo_witch3" blocks Survivors @ setpos_exact 2596 -5911 284

	Clip "_nav_silo_witch4" blocks Survivors @ setpos_exact 2596 -5513 284

	Clip "_nav_silo_witch5" blocks Survivors @ setpos_exact 2698 -5570 284

	Clip "_nav_silo_witch6" blocks Survivors @ setpos_exact 2796 -5513 284

	Clip "_nav_rubblewalla" blocks Survivors @ setpos_exact -1152 -8556 712

	Clip "_nav_rubblewallb" blocks Survivors @ setpos_exact -1152 -9457 712

	Clip "_cliprework_thimbleroof" blocks Survivors @ setpos_exact 288 -7936 281

	Clip "_clipextend_thimblestack" blocks Survivors @ setpos_exact 394 -7429 440

	Clip "_clipextend_generator" blocks Survivors @ setpos_exact -769 -7654 687

	Clip "_clipextend_treecluster" blocks Survivors @ setpos_exact 114 -6111 576

	Clip "_rubble_smoother1" blocks Everyone @ setpos_exact 2239 -5093 121

	Clip "_rubble_smoother2" blocks Everyone @ setpos_exact 2176 -4926 98

	Clip "_rubble_smoother3" blocks Everyone @ setpos_exact 2055 -4931 97

	Clip "_rubble_smoother4" blocks Everyone @ setpos_exact 1966 -5174 99

	KILL:	Insta-kill triggers to prevent elevator skip deleted on inner-button press.

	Insta-kill "_instakill_elevatora" Survivor @ setpos_exact -1204 -9549 394

	Insta-kill "_instakill_elevatorb" Survivor @ setpos_exact -2044 -9549 394

	Clip "_ladderqol_millladder" blocks Everyone @ setpos_exact 1392 -5564 228

	Ladder found @ "1454 -5565.5 292.25" and shifted w/ offset @ "0 2 0"

PvP:

	Clip "_truck_fence1" blocks Survivors @ setpos_exact 4292 -2990 1641.5

	Clip "_truck_fence2" blocks Survivors @ setpos_exact 4388 -2865 1642

	Brush "_losfix_gas_truck" created @ setpos_exact -572 -13262.9 133

	Brush "_losfix_gen" created @ setpos_exact -1390 -13156 125

	Brush "_losfix_trailer1" created @ setpos_exact 1219 -4171 120

	Brush "_losfix_trailer2" created @ setpos_exact 1149 -4253 116

	Brush "_losfix_trailer3" created @ setpos_exact 1074 -4342 116

	Brush "_losfix_truck" created @ setpos_exact 4106 -2935 115

	Clip "_ladder_parkourouthouse_clip" blocks Infected @ setpos_exact 1017 -4471 200

	LADDER: _ladder_ducatelelecbox_cloned_ducateldumpsters

	LADDER: _ladder_ducatelroofl_cloned_brokenlocker

	LADDER: _ladder_ducatelroofr_cloned_brokenlocker

	LADDER: _ladder_grindergirder_cloned_bricksemitrailer

	LADDER: _ladder_jaggedchainlinkback1_cloned_stacksfenceback

	LADDER: _ladder_jaggedchainlinkback2_cloned_stacksfenceback

	LADDER: _ladder_jaggedchainlinkfront_cloned_stacksfenceback

	LADDER: _ladder_parkourouthouse_cloned_rubbleshortpipe

	LADDER: _ladder_parkoursiloleft_cloned_marshtrailer

	LADDER: _ladder_parkoursiloright_cloned_marshtrailer

	LADDER: _ladder_pipeyardsemi_cloned_millgrinder

	LADDER: _ladder_saferoofpipe_cloned_bricksemitrailer

	LADDER: _ladder_siloplatform_cloned_grinderwheel

	LADDER: _ladder_silosemirearleft_cloned_millgrinder

	LADDER: _ladder_silosemirearright_cloned_millgrinder

	LADDER: _ladder_stacksfencefront_cloned_stacksfenceback

	LADDER: _ladder_talleventpillar1_cloned_talleventpipe

	LADDER: _ladder_talleventpillar2_cloned_talleventpipe

	LADDER: _ladder_tallspoolsroofleft_cloned_bigwindowspipe

	LADDER: _ladder_tallspoolsroofright_cloned_bigwindowspipe

	LADDER: _ladder_tallvinereturn_cloned_brokenlocker

	LADDER: _ladder_tankescape_cloned_bricksemitrailer

	LADDER: _ladder_tankreturn_cloned_bricksemitrailer

	LADDER: _ladder_thimblesemi_cloned_millgrinder

	LADDER: _ladder_truckfencereturn_cloned_stacksfenceback

	Static prop "_ladder_saferoofpipe_pipe" W/ "models/props_mill/PipeSet08d_512_001a.mdl" @ setpos_exact 3466 -1891 158

	Ladder found @ "1143.5 -5515.5 226" and shifted w/ offset @ "0 5 0"

Survival:

	Clip "_survival_construct" blocks Survivors @ setpos_exact -702 -8439 624

	Clip "_survival_extendpipe" blocks Survivors @ setpos_exact -703 -8229 511

	Clip "_nav_semitrailer" blocks Survivors @ setpos_exact 70 -8187 261

	Clip "_nav_jumptotree" blocks Survivors @ setpos_exact -1250 -7925 331

------------------------------------------------------------------------------------------------------------------------

HARD RAIN - MILL ESCAPE || c4m3_sugarmill_b

All:

	Clip "_commonhop_roadclosed" blocks Survivors @ setpos_exact 3231 -3009 257

	Clip "_vent_roofa" blocks Survivors @ setpos_exact 3699 -3727 476

	Clip "_vent_roofb" blocks Survivors @ setpos_exact 3127 -3635 502

	Clip "_permstuck_silos" blocks Everyone @ setpos_exact 2696 -6088 435

	Clip "_commonhop_dualstacks" blocks Survivors @ setpos_exact 264 -4866 498

	Clip "_permstuck_longfencea" blocks Survivors @ setpos_exact 3996 -4978 506

	Clip "_permstuck_longfenceb" blocks Survivors @ setpos_exact 4072 -5214 506

	Clip "_permstuck_longfencec" blocks Survivors @ setpos_exact 4042 -5462 506

	Clip "_permstuck_longfenced" blocks Survivors @ setpos_exact 4010 -5718 506

	Clip "_permstuck_longfencee" blocks Survivors @ setpos_exact 4010 -5978 506

	Clip "_permstuck_longfencef" blocks Survivors @ setpos_exact 3962 -6216 506

	Clip "_permstuck_quadtank" blocks Everyone @ setpos_exact 1638 -5280 292

	Clip "_commonhop_ducatelroof" blocks Survivors @ setpos_exact 3808 -3324 407

	Clip "_nav_cornerledge_m3only" blocks Survivors @ setpos_exact -357 -8509 624

	Clip "_permstuck_cornerbush" blocks Everyone @ setpos_exact 3117 -1842 110

	Clip "_cliprework_clipextenda" blocks Survivors @ setpos_exact 1306 -6648 735

	Clip "_cliprework_clipextendb" blocks Survivors @ setpos_exact -703 -8512 1232

	Clip "_cliprework_millsilos" blocks Survivors @ setpos_exact 2782 -4349 937

	Clip "_cliprework_millwheel" blocks Survivors @ setpos_exact 1761 -5826 660

	Clip "_cliprework_plywoodlip" blocks Survivors @ setpos_exact -1743 -9483 624

	Clip "_cliprework_gasstation" blocks Survivors @ setpos_exact -899 -13512 432

	Clip "_nav_silo_witch1" blocks Survivors @ setpos_exact 2793 -5911 284

	Clip "_nav_silo_witch2" blocks Survivors @ setpos_exact 2695 -5854 284

	Clip "_nav_silo_witch3" blocks Survivors @ setpos_exact 2596 -5911 284

	Clip "_nav_silo_witch4" blocks Survivors @ setpos_exact 2596 -5513 284

	Clip "_nav_silo_witch5" blocks Survivors @ setpos_exact 2698 -5570 284

	Clip "_nav_silo_witch6" blocks Survivors @ setpos_exact 2796 -5513 284

	Clip "_nav_rubblewalla" blocks Survivors @ setpos_exact -1152 -8556 712

	Clip "_nav_rubblewallb" blocks Survivors @ setpos_exact -1152 -9457 712

	Clip "_cliprework_thimbleroof" blocks Survivors @ setpos_exact 288 -7936 281

	Clip "_clipextend_thimblestack" blocks Survivors @ setpos_exact 394 -7429 440

	Clip "_clipextend_generator" blocks Survivors @ setpos_exact -769 -7654 687

	Clip "_clipextend_treecluster" blocks Survivors @ setpos_exact 114 -6111 576

	Clip "_rubble_smoother1" blocks Everyone @ setpos_exact 2239 -5093 121

	Clip "_rubble_smoother2" blocks Everyone @ setpos_exact 2176 -4926 98

	Clip "_rubble_smoother3" blocks Everyone @ setpos_exact 2055 -4931 97

	Clip "_rubble_smoother4" blocks Everyone @ setpos_exact 1966 -5174 99

	Clip "_ladderqol_millladder" blocks Everyone @ setpos_exact 1392 -5564 228

	Ladder found @ "1454 -5565.5 292.25" and shifted w/ offset @ "0 2 0"

PvP:

	Clip "_truck_fence1" blocks Survivors @ setpos_exact 4292 -2990 1641.5

	Clip "_truck_fence2" blocks Survivors @ setpos_exact 4388 -2865 1642

	Brush "_losfix_gas_truck" created @ setpos_exact -572 -13262.9 133

	Brush "_losfix_gen" created @ setpos_exact -1390 -13156 125

	Brush "_losfix_trailer1" created @ setpos_exact 1219 -4171 120

	Brush "_losfix_trailer2" created @ setpos_exact 1149 -4253 116

	Brush "_losfix_trailer3" created @ setpos_exact 1074 -4342 116

	Brush "_losfix_truck" created @ setpos_exact 4106 -2935 115

	LADDER: _ladder_ducatelelecbox_cloned_ducateldumpsters

	LADDER: _ladder_ducatelroofl_cloned_brokenlocker

	LADDER: _ladder_ducatelroofr_cloned_brokenlocker

	LADDER: _ladder_grindergirder_cloned_bricksemitrailer

	LADDER: _ladder_jaggedchainlinkback1_cloned_stacksfenceback

	LADDER: _ladder_jaggedchainlinkback2_cloned_stacksfenceback

	LADDER: _ladder_jaggedchainlinkfront_cloned_stacksfenceback

	LADDER: _ladder_parkourouthouse_cloned_rubbleshortpipe

	LADDER: _ladder_parkoursiloleft_cloned_marshtrailer

	LADDER: _ladder_parkoursiloright_cloned_marshtrailer

	LADDER: _ladder_pipeyardsemi_cloned_millgrinder

	LADDER: _ladder_saferoofpipe_cloned_bricksemitrailer

	LADDER: _ladder_siloplatform_cloned_grinderwheel

	LADDER: _ladder_silosemirearleft_cloned_millgrinder

	LADDER: _ladder_silosemirearright_cloned_millgrinder

	LADDER: _ladder_stacksfencefront_cloned_stacksfenceback

	LADDER: _ladder_talleventpillar1_cloned_talleventpipe

	LADDER: _ladder_talleventpillar2_cloned_talleventpipe

	LADDER: _ladder_tallspoolsroofleft_cloned_bigwindowspipe

	LADDER: _ladder_tallspoolsroofright_cloned_bigwindowspipe

	LADDER: _ladder_tallvinereturn_cloned_brokenlocker

	LADDER: _ladder_tankescape_cloned_bricksemitrailer

	LADDER: _ladder_tankreturn_cloned_bricksemitrailer

	LADDER: _ladder_thimblesemi_cloned_millgrinder

	LADDER: _ladder_truckfencereturn_cloned_stacksfenceback

	Static prop "_ladder_saferoofpipe_pipe" W/ "models/props_mill/PipeSet08d_512_001a.mdl" @ setpos_exact 3466 -1891 158

	Ladder found @ "1143.5 -5515.5 226" and shifted w/ offset @ "0 5 0"

------------------------------------------------------------------------------------------------------------------------

HARD RAIN - RETURN TO TOWN || c4m4_milltown_b

All:

	Clip "_woodwindow" blocks Survivors @ setpos_exact 4144 -1423 391

	Clip "_permstuck_shruba" blocks Infected @ setpos_exact 3668 -1664 132

	Clip "_permstuck_shrubb" blocks Infected @ setpos_exact 3408 -1760 144

	Clip "_commonhop_safehouse" blocks Survivors @ setpos_exact 3984 -1863 464

	trigger_auto_crouch "_duckqol_greenposts1" created @ setpos_exact -2021 5568 98

	trigger_auto_crouch "_duckqol_greenposts2" created @ setpos_exact 1069 6976 224

	trigger_auto_crouch "_duckqol_playground" created @ setpos_exact -1442 6968 119

	Clip "_permstuck_highuptree" blocks Everyone @ setpos_exact -3312 7326 315

PvP:

	Clip "_treehouse_whitefence" blocks Survivors @ setpos_exact 1767 2219 267

	Brush "_losfix_ambulance1" created @ setpos_exact 711 4748 102

	Brush "_losfix_ambulance2" created @ setpos_exact 803 4690 102

	Brush "_losfix_dumpster" created @ setpos_exact 3550 343 128

	Brush "_losfix_gen1" created @ setpos_exact 241 5987 107

	Brush "_losfix_gen2" created @ setpos_exact 3448 -1345 113

	Brush "_losfix_truck" created @ setpos_exact 3217 -1376 114

	Brush "_losfix_truck_jump" created @ setpos_exact 2949 2885 108

	Clip "_ladder_dumpsterhouse_clip" blocks Everyone @ setpos_exact 1638 4032 217

	Clip "_ladder_yellowhousetree_topdenial" blocks Infected @ setpos_exact 2244 3123 378

	Clip "_ladder_safehousetall_clip" blocks Infected @ setpos_exact 3725 -1537 101

	Clip "_safehousehedge_blocker" blocks Infected @ setpos_exact 4401 -2207 438

	LADDER: _ladder_cornerhomeplants_cloned_garagesalehome

	LADDER: _ladder_cornerhometankfight_cloned_treehousefence

	LADDER: _ladder_dumpsterhouse_cloned_alarmtrailer

	LADDER: _ladder_finalhouse_cloned_yellowhouse

	LADDER: _ladder_mobilepickup_cloned_alarmtrailer

	LADDER: _ladder_safehousefenceback_cloned_cullingbuddy

	LADDER: _ladder_safehousetall_cloned_tallbuildingleft

	LADDER: _ladder_tallbuildingright_cloned_tallbuildingleft

	LADDER: _ladder_trailerqol_cloned_alarmtrailer

	LADDER: _ladder_vinehouseqol_cloned_alarmtrailer

	LADDER: _ladder_woodhouseqol_cloned_alarmtrailer

	LADDER: _ladder_yellowhousetree_cloned_playgroundgutter

	Static prop "_ladder_finalhouse_pipe" W/ "models/props_downtown/gutter_downspout_straight_160_02.mdl" @ setpos_exact 3910 71 248

	Static prop "_ladder_safehouse_pipe" W/ "models/props_pipes/PipeSet02d_512_001a.mdl" @ setpos_exact 3726 -1560 160

------------------------------------------------------------------------------------------------------------------------

HARD RAIN - TOWN ESCAPE || c4m5_milltown_escape

All:

	Decal "decals/rollermine_crater" painted @ setpos_exact -5671 6579 225

	Clip "_booster_burgertankpole" blocks Survivors @ setpos_exact -5800 7496 603

	Clip "_booster_burgertankspin" blocks Survivors @ setpos_exact -5800 7496 915

	Clip "_permstuck_highuptree" blocks Everyone @ setpos_exact -3312 7326 315

	Clip "_booster_ginnytop" blocks Survivors @ setpos_exact -5425 6789 385

	Clip "_booster_ginnyjon" blocks Survivors @ setpos_exact -5425 6789 385

	Clip "_booster_gasextend" blocks Survivors @ setpos_exact -4624 7952 284

	Clip "_booster_blueframe" blocks Survivors @ setpos_exact -4641 7618 479

	Clip "_booster_roofwedge" blocks Survivors @ setpos_exact -5711 6528 416

	Clip "_booster_wrongwayup" blocks Survivors @ setpos_exact -4082 7142 608

	Clip "_booster_powerline" blocks Survivors @ setpos_exact -5297 7349 531

	Clip "_booster_clipextend" blocks Survivors @ setpos_exact -6561 6589 912

	Clip "_burgertank_windowsmoother1" blocks Everyone @ setpos_exact -5663 7268 135

	Clip "_burgertank_windowsmoother2" blocks Everyone @ setpos_exact -5798 7505 135

	Clip "_burgertank_windowsmoother3" blocks Everyone @ setpos_exact -6022 7777 135

	Clip "_dockm5only_smoother" blocks Everyone @ setpos_exact -7039 7701 91

	LOGIC:	Point-of-no-return clip will be Enabled when finale is started.

	Clip "_point_of_no_return" blocks Survivors initially disabled @ setpos_exact -4077 7139 125

PvP:

	Brush "_losfix_burger_gen" created @ setpos_exact -5448 6765 107

	Brush "_losfix_dock_truck" created @ setpos_exact -6538 7550 105

	Brush "_losfix_semia" created @ setpos_exact -4771 7156 113

	Brush "_losfix_semib" created @ setpos_exact -4790 7180 113

	Clip "_burgertank_windowsmoother1" blocks Everyone @ setpos_exact -5663 7268 135

	Clip "_burgertank_windowsmoother2" blocks Everyone @ setpos_exact -5798 7505 135

	Clip "_burgertank_windowsmoother3" blocks Everyone @ setpos_exact -6022 7777 135

	Clip "_dockm5only_smoother" blocks Everyone @ setpos_exact -7039 7701 91

	Clip "_ladder_sweetrelief_clip" blocks Everyone @ setpos_exact -5746 6595 96

	LADDER: _ladder_autosalvagefront_cloned_playgroundroof

	LADDER: _ladder_classyjimboblue_cloned_garagesalehouse

	LADDER: _ladder_cullingsub_cloned_cullingbuddy

	LADDER: _ladder_gaselecbox_cloned_autosalvageback

	LADDER: _ladder_grocerypillar_cloned_garagesalehouse

	LADDER: _ladder_sweetrelief_cloned_autosalvageback

	Static prop "_ladder_grocerypillar_bust" W/ "models/props_interiors/concretepillar01_dm_base.mdl" @ setpos_exact -5680 6576 160.2

	Static prop "_ladder_grocerypillar_prop" W/ "models/props_interiors/concretepillar01.mdl" @ setpos_exact -5680 6128 163.8

------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------

THE PARISH - WATERFRONT || c5m1_waterfront

All:

	Clip "_vuln_balconya" blocks Survivors @ setpos_exact -720 -128 -140

	Clip "_vuln_balconyb" blocks Survivors @ setpos_exact -1136 -512 196

	Clip "_vuln_balconyc" blocks Survivors @ setpos_exact -737 -2048 -208

	Clip "_vuln_balconyd" blocks Survivors @ setpos_exact -687 -2304 -176

	Clip "_skybox_shielda" blocks Infected @ setpos_exact -272 -2055 50

	Clip "_skybox_shieldd" blocks Infected @ setpos_exact -3948 257 130

	Clip "_skybox_shieldb" blocks Infected @ setpos_exact -1543.5 -1855.5 249.6

	Clip "_skybox_shieldc" blocks Infected @ setpos_exact -2971 -1264 125

	Clip "_signhop_awning" blocks Survivors @ setpos_exact -3088 -250 -70.5

	Clip "_cliprework_roofandwindows" blocks Survivors @ setpos_exact -3279 -819 -140.6

	Clip "_nav_jukebox" blocks Survivors @ setpos_exact -1492 -1685 -287

	Clip "_nav_outhouse" blocks Survivors @ setpos_exact -970.4 -2352 -221.7

	Clip "_nav_bienlamps" blocks Survivors @ setpos_exact -664 -835 -184

	Clip "_rampstep_smoother" blocks Everyone @ setpos_exact 776 44 -374

	Clip "_nav_electricalbox" blocks Survivors @ setpos_exact -1392 -252 -374

	Clip "_cliprework_balconya" blocks Survivors @ setpos_exact -2700 -2346 -157

	Clip "_cliprework_balconyb" blocks Survivors @ setpos_exact -2937 -2098 -216

	Clip "_cliprework_huntergap" blocks Infected @ setpos_exact -40 1408 80

	Clip "_permstuck_dropbehindfence" blocks Everyone @ setpos_exact -982 -2793 144

	Clip "_cliprework_unattackable" blocks Survivors @ setpos_exact -2446 299 -376

	Clip "_ledgehang_startfenceleft" blocks Survivors @ setpos_exact 589 -142 -251

	Clip "_ledgehang_startfenceright" blocks Survivors @ setpos_exact 599 45 -232

PvP:

	Clip "_clipgap_fence" blocks Survivors @ setpos_exact -1740 -1284 -134

	Brush "_losfix_bus" created @ setpos_exact -868 -1515 -363

	Brush "_losfix_van" created @ setpos_exact -918 -1852 -365

	Clip "_ladder_endbluehouse_clipleft" blocks Everyone @ setpos_exact -3751 -4 -376

	Clip "_ladder_endbluehouse_clipwall" blocks Everyone @ setpos_exact -3807 208 -376

	Clip "_ladder_endgutterm2mirr_clip" blocks Everyone @ setpos_exact -3196 -1079 -376

	LADDER: _ladder_backpropladder_cloned_waterfrontfence

	LADDER: _ladder_bienville_cloned_brickgutter

	LADDER: _ladder_boothwindow_cloned_whitetablepath

	LADDER: _ladder_endbluehouse_cloned_waterfrontbrick

	LADDER: _ladder_endgutterm2mirr_cloned_telephonegutter

	LADDER: _ladder_kitchenelecbox_cloned_telephonegutter

	LADDER: _ladder_kitchenwindow_cloned_telephonegutter

	LADDER: _ladder_startroofqol_cloned_whitetablepath

	LADDER: _ladder_startwtflongright_cloned_startwtflongleft

	LADDER: _ladder_tankwaterfront_cloned_telephonegutter

	LADDER: _ladder_yellowbarriersroof_cloned_alleygutter

	Static prop "_losblocker_boxes" W/ "models/props/cs_militia/boxes_garage_lower.mdl" @ setpos_exact -26 -1108 -375.742

	Static prop "_propladder_planka" W/ "models/props_highway/plywood_01.mdl" @ setpos_exact -167 -48 -195.766

	Static prop "_propladder_plankb" W/ "models/props_swamp/plank001b_192.mdl" @ setpos_exact -2176 -2538 -320

	Static prop "_ladder_endgutterm2mirr_pipe" W/ "models/props_downtown/gutter_downspout_straight01.mdl" @ setpos_exact -3216 -1056 -89

	Static prop "_ladder_startroofqol_pipe" W/ "models/props_downtown/gutter_downspout_straight01.mdl" @ setpos_exact 580 -308 -222

	Ladder found @ "-2592 -1030 -208" and shifted w/ offset @ "12 -3 0"

	Navmesh modified w/ CHECKPOINT @ setpos_exact -3764 -1224 -344

	PROP:	Trashbin near "_ladder_endbluehouse" moved to improve accessibility.

	Deleted ([425] prop_physics) @ setpos_exact -3785 22 -375.624

	Physics prop "_replacement_trashbin" W/ "models/props_street/trashbin01.mdl" @ setpos_exact -3781 118 -376

------------------------------------------------------------------------------------------------------------------------

THE PARISH - PARK || c5m2_park

All:

	Clip "_ladderqol_event" blocks Infected @ setpos_exact -8446 -5214 -86

	Clip "_skybox_shieldb" blocks Infected @ setpos_exact -2971 -1264 125

	Clip "_skybox_shielda" blocks Infected @ setpos_exact -4014 -1296 68.8

	Clip "_booster_busdepot_extend" blocks Survivors @ setpos_exact -8078 -6407 160

	Clip "_booster_escapegap" blocks Survivors @ setpos_exact -9436 -5212 184

	Clip "_booster_watchtower_extend" blocks Survivors @ setpos_exact -8161 -5821 529

	Clip "_cliprework_parkarchway" blocks Survivors @ setpos_exact -8125 -2207 180

	Clip "_cliprework_anomalous" blocks Survivors @ setpos_exact -9237 -3866 58

	Clip "_ghostgrief_and_stuckwarp" blocks Everyone @ setpos_exact -10562 -4034 -5

	Clip "_nav_electricalbox" blocks Survivors @ setpos_exact -6222 -7610 -153

	Clip "_ladderqol_purpleclip1" blocks Infected @ setpos_exact -9340 -5876 -132

	Clip "_ladderqol_purpleclip2" blocks Infected @ setpos_exact -8096 -5539 -129

	Clip "_ladderqol_purpleclip3" blocks Infected @ setpos_exact -7456 -5539 -129

	Clip "_permstuck_longbarricade" blocks Everyone @ setpos_exact -6390 -8479 -247

	Clip "_cliprework_missingno" blocks Survivors @ setpos_exact -10092 -5520 48

PvP:

	Tank/Charger chokepoint atomizer created @ setpos_exact -9216 -3264 -248

	Brush "_losfix_bus" created @ setpos_exact -7268 -7479 -244

	Brush "_losfix_fence" created @ setpos_exact -6583 -5678 -252

	Brush "_losfix_gen" created @ setpos_exact -9918 -4878.21 -249

	Brush "_losfix_van" created @ setpos_exact -3360 -1422 -371

	Clip "_ladder_billboard_clip" blocks Infected @ setpos_exact -9158 -6944 154

	Clip "_ladder_deadendbalconies_clip" blocks Infected @ setpos_exact -8576 -4001 -208

	Clip "_ladder_endlightpole_clippole" blocks Everyone @ setpos_exact -8812 -7872 -249

	Clip "_ladder_endlightpole_cliptop" blocks Infected @ setpos_exact -8812 -7871 197

	Clip "_ladder_startorangedrain_clip" blocks Infected @ setpos_exact -3189 -1433 -376

	Clip "_ladderqol_endgutterm1mirr_clip" blocks Everyone @ setpos_exact -3196 -1079 -376

	LADDER: _ladder_archright_cloned_archleft

	LADDER: _ladder_billboardleft_cloned_watchtower

	LADDER: _ladder_billboardright_cloned_watchtower

	LADDER: _ladder_busroofright_cloned_busroofleft

	LADDER: _ladder_deadendbalconies_cloned_busstationphones

	LADDER: _ladder_endbarricadeback_cloned_cedafenceback

	LADDER: _ladder_endbarricadefront_cloned_cedafencefront

	LADDER: _ladder_endlightpoleB_cloned_startdrainladder

	LADDER: _ladder_endlightpoleT_cloned_startdrainladder

	LADDER: _ladder_endroofsignage_cloned_startgutter

	LADDER: _ladder_eventelecbox_cloned_startdrainladder

	LADDER: _ladder_farcorner_cloned_horsehedge

	LADDER: _ladder_finalrunelecbox_cloned_eventgutter

	LADDER: _ladder_gazebo1_cloned_archleft

	LADDER: _ladder_gazebowall_cloned_archleft

	LADDER: _ladder_generatortent_cloned_archleft

	LADDER: _ladder_guardtowerhigh_cloned_cedatrailerfence

	LADDER: _ladder_guardtowerlow_cloned_restrictedbarricade

	LADDER: _ladder_hmmwvawning_cloned_startcopcarfence

	LADDER: _ladder_longempty_cloned_archleft

	LADDER: _ladder_mehacvent_cloned_hedgemazecorner

	LADDER: _ladder_overpasshigh_cloned_cedatrailerfence

	LADDER: _ladder_overpasslow_cloned_watchtowerbags

	LADDER: _ladder_restroomsplatforml_cloned_startcopcarfence

	LADDER: _ladder_restroomsplatformr_cloned_startleftfence

	LADDER: _ladder_startorangedrain_cloned_whitedumpster

	LADDER: _ladder_telephonepoleB_cloned_restrictedbarricade

	LADDER: _ladder_telephonepoleT_cloned_restrictedbarricade

	Static prop "_losblocker_fence" W/ "models/props_urban/fence_cover001_256.mdl" @ setpos_exact -6583 -5743 -247.75

	Static prop "_propladder_planka" W/ "models/props_highway/plywood_02.mdl" @ setpos_exact -4216 -1082 -130

	Static prop "_propladder_plankb" W/ "models/props_swamp/plank001b_192.mdl" @ setpos_exact -3105 -1504 -320

	Static prop "_propladder_plankc" W/ "models/props_highway/plywood_01.mdl" @ setpos_exact -6731 -6212 -80

	Static prop "_propladder_venta" W/ "models/props_rooftop/hotel_rooftop_equip002.mdl" @ setpos_exact -6724 -6753 7.918

	Static prop "_propladder_ventb" W/ "models/props_rooftop/hotel_rooftop_equip002.mdl" @ setpos_exact -6370 -6752 80

	Static prop "_propladder_ventlarge" W/ "models/props_rooftop/vent_large1.mdl" @ setpos_exact -7932.47 -7509.08 88.05

	Static prop "_solidify_awning" W/ "models/props_street/awning_department_store.mdl" @ setpos_exact -6403.3 -5024 -102.145

	Static prop "_guardtower_wrongway" W/ "models/props_misc/wrongway_sign01_optimized.mdl" @ setpos_exact -10091 -5792 110

	Static prop "_overpass_wrongwaya" W/ "models/props_misc/wrongway_sign01_optimized.mdl" @ setpos_exact -10162 -2304 80

	Static prop "_overpass_wrongwayb" W/ "models/props_misc/wrongway_sign01_optimized.mdl" @ setpos_exact -9900 -2304 225

	Static prop "_overpass_wrongwayc" W/ "models/props_misc/wrongway_sign01_optimized.mdl" @ setpos_exact -9700 -2304 225

	Static prop "_solidify_flatawningend1" W/ "models/props_street/awning_short.mdl" @ setpos_exact -7785 -8320 -108.921

	Static prop "_solidify_flatawningend2" W/ "models/props_street/awning_short.mdl" @ setpos_exact -8537 -8320 -108.921

	Static prop "_solidify_flatawningmid" W/ "models/props_street/awning_short.mdl" @ setpos_exact -9216 -3712 -78.4492

	Static prop "_yesdraw_billboard_nodraw" W/ "models/props_update/c5m2_billboard_nodraw.mdl" @ setpos_exact -9152 -6938 92

	Ladder found @ "-9260 -5130 -152" and shifted w/ offset @ "0 14 0"

Survival:

	Clip "_nav_eventsign" blocks Survivors @ setpos_exact -8552 -6310 756

	Ladder found @ "-9260 -5130 -152" and shifted w/ offset @ "0 14 0"

Scavenge:

	Clip "_safedoor_antighost" blocks Infected @ setpos_exact -3775 -1368 -344

------------------------------------------------------------------------------------------------------------------------

THE PARISH - CEMETERY || c5m3_cemetery

All:

	Clip "_commonhop_rooftop" blocks Survivors @ setpos_exact 3080 1407 222

	Clip "_sewer_holed" blocks Survivors @ setpos_exact 5212 -112 -116

	Clip "_sewer_holec" blocks Survivors @ setpos_exact 5968 -452 -116

	Clip "_sewer_holeb" blocks Survivors @ setpos_exact 6532 224 -116

	Clip "_sewer_holea" blocks Survivors @ setpos_exact 5848 964 -116

	Clip "_bunnyhop_underfence" blocks Survivors @ setpos_exact 5948 -2330 688

	Clip "_commonhop_overpass" blocks Survivors @ setpos_exact 4896 7744 320

	Clip "_manhole_fencea" blocks Survivors @ setpos_exact 4489 1194 321

	Clip "_manhole_fenceb" blocks Survivors @ setpos_exact 4445 504 320

	Clip "_manhole_fencec" blocks Survivors @ setpos_exact 4437 268 320

	Clip "_manhole_fenced" blocks Survivors @ setpos_exact 4399 33 326

	Clip "_manhole_fencee" blocks Survivors @ setpos_exact 4182 -127 328

	Clip "_ladderqol_overpass" blocks Infected @ setpos_exact 5851 8704 192

	Clip "_stuckwarp_wrongwaya" blocks Infected @ setpos_exact 6275 9035 242

	Clip "_stuckwarp_wrongwayb" blocks Infected @ setpos_exact 6336 8960 242

	Clip "_permstuck_jetstrike" blocks Everyone @ setpos_exact 6233 -2190 453

	Clip "_permstuck_cemetery" blocks Everyone @ setpos_exact 7453 -6553 95

	Clip "_commonhop_endfence" blocks Survivors @ setpos_exact 9152 -9004 380

	Clip "_stuckwarp_staircase" blocks Everyone @ setpos_exact 3504 2668 182

	Clip "_permstuck_dualfence" blocks Survivors @ setpos_exact 3421 733 3.1

	Clip "_cliprework_pinkhouse" blocks Survivors @ setpos_exact 3434 4094 360

	Clip "_cliprework_perchroof" blocks Survivors @ setpos_exact 4856 3040 164

	Clip "_nav_brokenhome_highcorner" blocks Survivors @ setpos_exact 2052 2534 160

	Clip "_nav_opencrypt" blocks Survivors @ setpos_exact 9604 -6659 344

	Clip "_nav_cornertree" blocks Survivors @ setpos_exact 10459 -4981 409

PvP:

	Clip "_shortcut_vanjump" blocks Survivors @ setpos_exact 4425 5257 28

	Clip "_nav_brokenhome_shortcuta" blocks Survivors @ setpos_exact 2301 958 31

	Clip "_nav_brokenhome_shortcutb" blocks Survivors @ setpos_exact 2302 1290 31

	Brush "_losfix_bridgesemi" created @ setpos_exact 6218 -2306 446

	Brush "_losfix_busdrop" created @ setpos_exact 4304 5208 11

	Brush "_losfix_lot_truck1" created @ setpos_exact 5755 -1088 16

	Brush "_losfix_lot_truck2" created @ setpos_exact 5647 -1434 16

	Brush "_losfix_lot_van1" created @ setpos_exact 6195 261 6

	Brush "_losfix_lot_van2" created @ setpos_exact 5692 484 17

	Brush "_losfix_lot_van3" created @ setpos_exact 6206 -831 7

	Brush "_losfix_mainst_trailer" created @ setpos_exact 4444 3019 10

	Brush "_losfix_mainst_van" created @ setpos_exact 4123 3902 6

	Brush "_losfix_sewer_van" created @ setpos_exact 3924 802 10

	Clip "_barricade_stepcollision1" blocks Infected @ setpos_exact 2656 835 50

	Clip "_barricade_stepcollision2" blocks Infected @ setpos_exact 2973 822 0

	Clip "_burntbuild_collision01" blocks Infected @ setpos_exact 2208 642 242

	Clip "_burntbuild_collision02" blocks Infected @ setpos_exact 2026 642 242

	Clip "_burntbuild_collision03" blocks Infected @ setpos_exact 2210 1042 200

	Clip "_burntbuild_collision04" blocks Infected @ setpos_exact 2123 1046 170

	Clip "_burntbuild_collision05" blocks Infected @ setpos_exact 2028 1042 206

	Clip "_burntbuild_collision06" blocks Infected @ setpos_exact 2210 1258 205

	Clip "_burntbuild_collision07" blocks Infected @ setpos_exact 2116 1254 157

	Clip "_burntbuild_collision08" blocks Infected @ setpos_exact 2028 1258 207

	Clip "_burntbuild_collision09" blocks Infected @ setpos_exact 2250 2021 163

	Clip "_burntbuild_collision10" blocks Infected @ setpos_exact 2337 2084 198

	Clip "_burntbuild_collision11" blocks Infected @ setpos_exact 2244 2083 141

	Clip "_burntbuild_collision12" blocks Infected @ setpos_exact 2155 2084 215

	Clip "_burntbuild_collision13" blocks Infected @ setpos_exact 2243 2710 152

	Clip "_burntbuild_collision14" blocks Infected @ setpos_exact 2337 2799 259

	Clip "_burntbuild_collision15" blocks Infected @ setpos_exact 2243 2796 225

	Clip "_burntbuild_collision16" blocks Infected @ setpos_exact 2155 2799 292

	Clip "_ladder_onewayshedback_clip" blocks Everyone @ setpos_exact 7000 -4026 117

	LADDER: _ladder_1stdumpster1_cloned_stuckfencefront

	LADDER: _ladder_1stdumpster2_cloned_stuckfencefront

	LADDER: _ladder_1stdumpster3_cloned_stuckfenceback

	LADDER: _ladder_2nddumpster1_cloned_stuckfenceback

	LADDER: _ladder_2nddumpster2_cloned_stuckfenceback

	LADDER: _ladder_atticgutterB_cloned_largetrailer

	LADDER: _ladder_atticgutterT_cloned_largetrailer

	LADDER: _ladder_burntbuildleft_cloned_blownwallleft

	LADDER: _ladder_collosaldumpster_cloned_manholeblownwall

	LADDER: _ladder_concreteupper_cloned_startfence

	LADDER: _ladder_dumpsterfence_cloned_startfence

	LADDER: _ladder_elecbox_cloned_largetrailer

	LADDER: _ladder_endfenceback_cloned_lastcrypt

	LADDER: _ladder_endfencefront_cloned_lastcrypt

	LADDER: _ladder_fencecornerleft_cloned_fencebackeastr

	LADDER: _ladder_fencecornerright_cloned_fencebacksouthl

	LADDER: _ladder_firebarrelroofB_cloned_vandropelecbox

	LADDER: _ladder_firebarrelroofT_cloned_vandropelecbox

	LADDER: _ladder_firefence_cloned_mobilehome

	LADDER: _ladder_holefenceback_cloned_firstcrypt

	LADDER: _ladder_holefencefront_cloned_firstcrypt

	LADDER: _ladder_manholechaintran_cloned_manholeblue

	LADDER: _ladder_onewayshedback_cloned_firstcrypt

	LADDER: _ladder_overpassfence_cloned_flamingofence

	LADDER: _ladder_overpassjumpqol_cloned_startfence

	LADDER: _ladder_pinkhouseB_cloned_manholeblownwall

	LADDER: _ladder_pinkhouseT_cloned_manholeblownwall

	LADDER: _ladder_sewerhole1_cloned_flamingofence

	LADDER: _ladder_sewerhole2_cloned_flamingofence

	LADDER: _ladder_sewerhole3_cloned_flamingofence

	LADDER: _ladder_sewerhole4_cloned_flamingofence

	LADDER: _ladder_sewerhole5_cloned_flamingofence

	LADDER: _ladder_sewerhole6_cloned_flamingofence

	LADDER: _ladder_sewerhole7_cloned_flamingofence

	LADDER: _ladder_tankconcretewallB_cloned_semionewaytall

	LADDER: _ladder_tankconcretewallT_cloned_semionewaytall

	LADDER: _ladder_tankfenceback_cloned_firstcrypt

	LADDER: _ladder_tankfencefront_cloned_firstcrypt

	LADDER: _ladder_thelastgutter_cloned_manholeblownwall

	Static prop "_losblocker_fencea" W/ "models/props_urban/fence_cover001_128.mdl" @ setpos_exact 4349.7 7071 0

	Static prop "_losblocker_fenceb" W/ "models/props_urban/fence_cover001_256.mdl" @ setpos_exact 4349.7 6623 0

	Static prop "_losblocker_fencec" W/ "models/props_urban/fence_cover001_128.mdl" @ setpos_exact 4349.7 6306 0

	Static prop "_losblocker_fenced" W/ "models/props_urban/fence_cover001_128.mdl" @ setpos_exact 4285 6242.3 20

	Static prop "_losblocker_fencee" W/ "models/props_urban/fence_cover001_256.mdl" @ setpos_exact 3070 6242.3 20

	Static prop "_losblocker_fencef" W/ "models/props_urban/fence_cover001_128.mdl" @ setpos_exact 2900.26 1884.1 9.25

	Static prop "_losblocker_fenceg" W/ "models/props_urban/fence_cover001_128.mdl" @ setpos_exact 3502 1867 9.2501

	Static prop "_losblocker_hedge" W/ "models/props_foliage/urban_hedge_256_128_high.mdl" @ setpos_exact 3750 6532 -1.73642

	Static prop "_propladder_fencea" W/ "models/props_fortifications/barricade_gate001_64_reference.mdl" @ setpos_exact 4116 6347 26.916

	Static prop "_propladder_fenceb" W/ "models/props_fortifications/barricade_gate001_64_reference.mdl" @ setpos_exact 3121 6347 26.916

	Static prop "_propladder_fencec" W/ "models/props_fortifications/barricade_gate001_64_reference.mdl" @ setpos_exact 4026.17 -194.24 -0.284

	Static prop "_propladder_fenced" W/ "models/props_fortifications/barricade_gate001_64_reference.mdl" @ setpos_exact 4074.17 -194.24 -0.284

	Static prop "_propladder_oildruma" W/ "models/props_urban/oil_drum001.mdl" @ setpos_exact 6828 -3836 108.162

	Static prop "_propladder_oildrumb" W/ "models/props_urban/oil_drum001.mdl" @ setpos_exact 6789 -3845 108.162

	Static prop "_propladder_oildrumc" W/ "models/props_urban/oil_drum001.mdl" @ setpos_exact 6805.38 -3841.81 156.607

	Static prop "_collosaldumpster_wrongwaya" W/ "models/props_misc/wrongway_sign01_optimized.mdl" @ setpos_exact 3471 2320 320

	Static prop "_collosaldumpster_wrongwayb" W/ "models/props_misc/wrongway_sign01_optimized.mdl" @ setpos_exact 3471 2140 320

	Static prop "_solidify_tankconcretewall_chimney" W/ "models/props_urban/chimney007.mdl" @ setpos_exact 3500.87 5616.91 353.166

------------------------------------------------------------------------------------------------------------------------

THE PARISH - QUARTER || c5m4_quarter

All:

	Clip "_vuln_balconya" blocks Survivors @ setpos_exact -3542 4573 395

	Clip "_vuln_balconyb" blocks Survivors @ setpos_exact -3360 4688 384

	Clip "_vuln_balconyd" blocks Survivors @ setpos_exact -2814 2912 615

	Clip "_vuln_balconye" blocks Survivors @ setpos_exact -2401 2912 553

	Clip "_vuln_balconyf" blocks Survivors @ setpos_exact -1839 2896 632

	Clip "_vuln_balconyc" blocks Survivors @ setpos_exact -3326 2531 535

	Clip "_commonhop_bench" blocks Survivors @ setpos_exact -2684 2447 545

	Clip "_clip_anomaly" blocks Infected @ setpos_exact -1918 661 503

	Clip "_clipgap_fence" blocks Survivors @ setpos_exact -2216 3200 309

	Clip "_booster_float" blocks Survivors @ setpos_exact -986.4 -395 385

	Clip "_clipextend_afterfloata" blocks Survivors @ setpos_exact -2592 665 312.5

	Clip "_clipextend_garage" blocks Survivors @ setpos_exact -1264 2992 420

	Clip "_clipextend_1ststreet" blocks Survivors @ setpos_exact -368 2887 576

	Clip "_commonhop_electricalbox" blocks Survivors @ setpos_exact -80 1535 400

	Clip "_clipextend_afterfloatb" blocks Survivors @ setpos_exact -2700 222 432

	Clip "_clipextend_2ndstreeta" blocks Survivors @ setpos_exact -2848 -840 384

	Clip "_vuln_balconyg" blocks Survivors @ setpos_exact -2440 -1040 416

	Clip "_clipextend_2ndstreetb" blocks Survivors @ setpos_exact -519 -870 420

	Clip "_clipextend_finalarea" blocks Survivors @ setpos_exact 81 -1075 416

	Clip "_clipextend_endfences" blocks Survivors @ setpos_exact 1700 -2016 430

	Clip "_clipgaps_finalrun" blocks Survivors @ setpos_exact 364 -2743 416

	Clip "_clipgaps_defibtrick" blocks Survivors @ setpos_exact -977 -2658 380

	Clip "_commonhop_fountain" blocks Survivors @ setpos_exact -3360 4288 234

	Clip "_cliprework_rollupdoor" blocks Survivors @ setpos_exact -1670 1687 324

	Clip "_cliprework_unattackable" blocks Survivors @ setpos_exact -3828 2709 448

	Clip "_void_cliprework" blocks Survivors @ setpos_exact -224 -1425 456

	Clip "_void_filler" blocks Infected @ setpos_exact -224 -1425 677

	FIX:	Total of 13 out of 13 traffic cones need to be made non-solid -- finally we can!

	Un-solidified prop_physics @ setpos_exact -3680.91 2871.53 64.0625

	Un-solidified prop_physics @ setpos_exact -3663.75 2911.72 64.2188

	Un-solidified prop_physics @ setpos_exact -3556.59 2572.31 64.375

	Un-solidified prop_physics @ setpos_exact -1311.44 1487.44 68.5

	Un-solidified prop_physics @ setpos_exact -1047.66 1879.06 66.875

	Un-solidified prop_physics @ setpos_exact -279.063 2693.5 64.9688

	Un-solidified prop_physics @ setpos_exact -367.406 2731.13 65.2813

	Un-solidified prop_physics @ setpos_exact -2801.31 -810.75 64.5313

	Un-solidified prop_physics @ setpos_exact -2710.78 -897.688 64.875

	Un-solidified prop_physics @ setpos_exact -735.906 -872.031 65.2813

	Un-solidified prop_physics @ setpos_exact 154.5 -1279.22 61.8438

	Un-solidified prop_physics @ setpos_exact 392.25 -2515.03 63.0313

	Un-solidified prop_physics @ setpos_exact 171.719 -2529.75 63.875

	Un-solidified ALL props with model: "models/props_fortifications/orange_cone001_reference.mdl"

PvP:

	Clip "_commonhop_signalbox" blocks Survivors @ setpos_exact -1645 1946 591

	Clip "_commonhop_rollupdoor" blocks Survivors @ setpos_exact -1652 1745 573

	Clip "_commonhop_fountain" blocks Survivors @ setpos_exact -2881 3746 399

	Clip "_clipgap_leftfence" blocks Survivors @ setpos_exact -2976 3452 184

	LOGIC:	TMP shortcut fence clip will be deleted when a Survivor exits final building.

	Clip "_shortcut_fence_TMP" blocks Survivors @ setpos_exact -1836 -1212 208

	Brush "_losfix_bus1" created @ setpos_exact -87 2569 76

	Brush "_losfix_bus2" created @ setpos_exact -228 2780 74

	Brush "_losfix_bus3" created @ setpos_exact -176 2703 74

	Brush "_losfix_memefence" created @ setpos_exact -2512 2443 64

	Brush "_losfix_van" created @ setpos_exact -2513 2807 72

	Clip "_ladder_busjazzclub_balconystep" blocks Infected @ setpos_exact -324 2590 218

	Clip "_ladder_billiards_clip" blocks Survivors @ setpos_exact -848 1999.1 316

	Clip "_ladder_billiardsqol_clip" blocks Everyone @ setpos_exact -832 1999.1 218

	Clip "_ladder_endtriplewindow_clip" blocks Infected @ setpos_exact -2 -2304 298

	Clip "_ladder_fountainvinesB_clip" blocks Everyone @ setpos_exact -3200 4158 64

	Clip "_ladder_garagerooftops_clipbot" blocks Infected @ setpos_exact -1346 2958 64

	Clip "_ladder_garagerooftops_cliptop" blocks Infected @ setpos_exact -1346 2974 64

	LADDER: _ladder_balconygutter_cloned_eventacvent

	LADDER: _ladder_billiards_cloned_billiardsdrop

	LADDER: _ladder_busjazzclub_cloned_startwhitefence

	LADDER: _ladder_endsemifront_cloned_endsemiback

	LADDER: _ladder_endtriplewindow_cloned_firstgutterladder

	LADDER: _ladder_floatfarcorner_cloned_floatreartall

	LADDER: _ladder_floatfronttall_cloned_floatreartall

	LADDER: _ladder_fountainvinesB_cloned_firstgutterladder

	LADDER: _ladder_fountainvinesT_cloned_startrightpicket

	LADDER: _ladder_garagerooftops_cloned_startwhitefence

	LADDER: _ladder_laststreetextend_cloned_floatpointyfence

	LADDER: _ladder_poolhallinleft_cloned_poolhalloutright

	LADDER: _ladder_poolhallinright_cloned_poolhalloutleft

	LADDER: _ladder_postfloatlowroof_cloned_eventscaffoldright

	LADDER: _ladder_prefloatalley_cloned_unusedwrongway

	LADDER: _ladder_unusedareain_cloned_onewayvanfence

------------------------------------------------------------------------------------------------------------------------

THE PARISH - BRIDGE || c5m5_bridge

All:

	Clip "_antiboost_finaleskip" blocks Survivors @ setpos_exact -12017 6306 779

	Clip "_permstuck_semiwheels" blocks Everyone @ setpos_exact 5929 6072 475

	Clip "_bunnyhop_girder" blocks Survivors @ setpos_exact -5528 6568 860

	Clip "_solidify_girderleft" blocks Survivors @ setpos_exact 4544 6600 750

	Clip "_solidify_girderright" blocks Survivors @ setpos_exact 4544 6050 750

	Clip "_endfence_curvejump" blocks Survivors @ setpos_exact 9552 6640 556

	Clip "_endfence_commonhop" blocks Survivors @ setpos_exact 9480 6320 705

	Clip "_bunnyhop_fence" blocks Survivors @ setpos_exact -11827 6526 611

	Clip "_solidify_bridgepier01" blocks Everyone @ setpos_exact -11786 6325 200

	Clip "_solidify_bridgepier03" blocks Everyone @ setpos_exact -9226 6325 200

	Clip "_solidify_bridgepier02" blocks Everyone @ setpos_exact -11274 6325 200

	Clip "_solidify_bridgepier04" blocks Everyone @ setpos_exact -8586 6325 200

	Clip "_solidify_bridgepier05" blocks Everyone @ setpos_exact -7434 6325 200

	Clip "_solidify_bridgepier06" blocks Everyone @ setpos_exact -6154 6325 200

	Clip "_solidify_bridgepier07" blocks Everyone @ setpos_exact -4618 6325 200

	Clip "_solidify_bridgepier08" blocks Everyone @ setpos_exact -3082 6325 200

	Clip "_solidify_bridgepier09" blocks Everyone @ setpos_exact -1546 6325 200

	Clip "_solidify_bridgepier10" blocks Everyone @ setpos_exact -10 6325 200

	Clip "_solidify_bridgepier11" blocks Everyone @ setpos_exact 1526 6325 200

	Clip "_solidify_bridgepier12" blocks Everyone @ setpos_exact 3062 6325 200

	Clip "_solidify_bridgepier13" blocks Everyone @ setpos_exact 3990 6326 200

	Clip "_solidify_bridgepier14" blocks Everyone @ setpos_exact 4599 6326 200

	Clip "_solidify_bridgepier15" blocks Everyone @ setpos_exact 6662 6326 200

	Clip "_solidify_bridgepier16" blocks Everyone @ setpos_exact 7270 6326 200

	Clip "_solidify_bridgepier17" blocks Everyone @ setpos_exact 8694 6326 200

	Clip "_booster_lighta" blocks Survivors @ setpos_exact 8755 5850 978.9

	Clip "_booster_fence" blocks Survivors @ setpos_exact 8422 5899 831

	Clip "_booster_generatora" blocks Survivors @ setpos_exact 8362 5702 753

	Clip "_booster_lightb" blocks Survivors @ setpos_exact 9352 5101 977.9

	Clip "_booster_lightc" blocks Survivors @ setpos_exact 9670 4237 977.9

	Clip "_booster_lightd" blocks Survivors @ setpos_exact 9856 3385 962.9

	Clip "_booster_sign" blocks Survivors @ setpos_exact 9418 3972 798.3

	Clip "_booster_acunit" blocks Survivors @ setpos_exact 8352 1700 474.9

	Clip "_booster_rollupdoor" blocks Survivors @ setpos_exact 8331 1888 346.3

	Clip "_booster_generatorb" blocks Survivors @ setpos_exact 8526 3995 485.8

	Clip "_booster_generatorc" blocks Survivors @ setpos_exact 8245 3460 485.8

	Clip "_booster_tree" blocks Survivors @ setpos_exact 7975 2389 434

	Clip "_cliprework_jeepbean" blocks Survivors @ setpos_exact 8967 6328 790

	Clip "_solidify_stuckwarp1" blocks Survivors @ setpos_exact 4152 6617 729

	Clip "_solidify_stuckwarp2" blocks Survivors @ setpos_exact 4152 6034 729

	Clip "_solidify_stuckwarp3" blocks Survivors @ setpos_exact 4502 6034 729

	Clip "_solidify_stuckwarp4" blocks Survivors @ setpos_exact 4502 6617 729

	Clip "_endrubble_smoother" blocks Everyone @ setpos_exact 8209 6208 456

	Clip "_ramp_smoother" blocks Everyone @ setpos_exact 8041 4102 180

	Clip "_clipextend_endchopper" blocks Survivors @ setpos_exact 7383 3797 1199

	Clip "_solidify_alt_girderleft" blocks Survivors @ setpos_exact 7187 6600 750

	Clip "_solidify_alt_girderright" blocks Survivors @ setpos_exact 7187 6050 750

	Clip "_solidify_alt_stuckwarp1" blocks Survivors @ setpos_exact 6795 6617 729

	Clip "_solidify_alt_stuckwarp2" blocks Survivors @ setpos_exact 6795 6034 729

	Clip "_solidify_alt_stuckwarp3" blocks Survivors @ setpos_exact 7145 6034 729

	Clip "_solidify_alt_stuckwarp4" blocks Survivors @ setpos_exact 7145 6617 729

PvP:

	LADDER: _ladder_endcedatrailer_cloned_endchainlink

	LADDER: _ladder_endlosfence_cloned_backnodraw

	LADDER: _ladder_finalsidehouse_cloned_finalrungs

	LADDER: _ladder_forconsistencysake_cloned_firstscaffrightback

	LADDER: _ladder_slantedbridgeup_cloned_farendfence

	Static prop "_solidify_finalsidehouse_acunit" W/ "models/props_rooftop/acunit01.mdl" @ setpos_exact 10092.1 4520.26 491

	Static prop "_solidify_finalsidehouse_acvent" W/ "models/props_rooftop/acvent03.mdl" @ setpos_exact 10185.5 4360.08 594

	Ladder found @ "9271.145 4057.18 273.355" and normal changed to "-1 0 0"

Survival:

	Clip "_survivalbig_skyboxcap" blocks Survivors @ setpos_exact 8074 3332 1536

	Clip "_booster_helipada" blocks Survivors @ setpos_exact 7481 2202 175

	Clip "_booster_helipadb" blocks Survivors @ setpos_exact 5856 4019 176

	Clip "_booster_helipadc" blocks Survivors @ setpos_exact 7479 5276 176

------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------

THE PASSING - RIVERBANK || c6m1_riverbank

All:

	Clip "_ghostgrief_tarpledge" blocks Survivors @ setpos_exact 1148 4257 96

	Clip "_permstuck_tarptree" blocks Everyone @ setpos_exact 1166 3794 191

	Clip "_commonhop_windowsill" blocks Survivors @ setpos_exact 539 2861 237

	Clip "_commonhop_awning" blocks Survivors @ setpos_exact 3824 2666 236

	Clip "_curvejump_pixelperfect" blocks Survivors @ setpos_exact 4784 3785 83

	Clip "_permstuck_fence" blocks Survivors @ setpos_exact -1391 1293 247

	Clip "_fence_onea" blocks Survivors @ setpos_exact 96 1425 496

	Clip "_fence_oneb" blocks Survivors @ setpos_exact -356 1088 496

	Clip "_fence_two" blocks Survivors @ setpos_exact 69 592 544

	Clip "_commonhop_endfence" blocks Survivors @ setpos_exact -3874 1647 716

	Clip "_commonhop_busa" blocks Survivors @ setpos_exact -3653 2324 705

	Clip "_commonhop_busb" blocks Survivors @ setpos_exact -3432 1527 926

	Clip "_sneaky_hunter" blocks Infected @ setpos_exact 5296 2488 1008

	Clip "_clipgap_fence" blocks Survivors @ setpos_exact 584 2366 456

	Clip "_commonhop_windows" blocks Survivors @ setpos_exact 1402 2659 393.1

	Clip "_cliprework_emptylargerooms" blocks Survivors @ setpos_exact 1072 1883 512

	Clip "_dispcrouch_concretea" blocks Everyone @ setpos_exact 4035 1016 137

	Clip "_dispcrouch_concreteb" blocks Everyone @ setpos_exact 4212 901 137

	Clip "_booster_clipextend_mid" blocks Survivors @ setpos_exact -1963 373 1264

	Clip "_booster_clipextend_end" blocks Survivors @ setpos_exact 1856 -175 1920

	Clip "_booster_gazebo" blocks Survivors @ setpos_exact -1647 -365 999

	Clip "_cliprework_startroof" blocks Survivors @ setpos_exact 709 4088 344

	Clip "_cliprework_bridgeroof" blocks Survivors @ setpos_exact 927 4579 302

	Clip "_cliprework_bridgewall" blocks Survivors @ setpos_exact 927 4579 302

	Clip "_cliprework_endfence" blocks Survivors @ setpos_exact -2317 560 821

	Clip "_cliprework_endroof" blocks Survivors @ setpos_exact -3913 1061 1056

	Clip "_cliprework_endwindows1" blocks Survivors @ setpos_exact -3844 -270 1035

	Clip "_cliprework_endwindows2" blocks Survivors @ setpos_exact -3911 561 863

	Clip "_cliprework_endwindows3" blocks Survivors @ setpos_exact -3880 1082 895

	Clip "_dispcrouch_caralarm" blocks Everyone @ setpos_exact 1415 980 357

	Static prop "_cosmetic_hifunreal" W/ "models/props_vehicles/racecar_damaged_glass.mdl" @ setpos_exact 928 4016 90

	Static prop "_cosmetic_left_desk1" W/ "models/props_interiors/desk_metal.mdl" @ setpos_exact 910 1652 527

	Static prop "_cosmetic_left_desk2" W/ "models/props_interiors/desk_metal.mdl" @ setpos_exact 855 1634 527

	Static prop "_cosmetic_left_plywood" W/ "models/props_highway/plywood_02.mdl" @ setpos_exact 930 1615 605

	Clip "_cosmetic_left_collision" blocks Infected + AI @ setpos_exact 890 1637 542

	Static prop "_cosmetic_right_cab1" W/ "models/props/cs_office/file_cabinet1.mdl" @ setpos_exact 1455 1636 512

	Static prop "_cosmetic_right_cab2" W/ "models/props/cs_office/file_cabinet3.mdl" @ setpos_exact 1420 1634 512

	Static prop "_cosmetic_right_cab3" W/ "models/props/cs_office/file_cabinet3.mdl" @ setpos_exact 1395 1634 512

	Static prop "_cosmetic_right_plywood" W/ "models/props_highway/plywood_02.mdl" @ setpos_exact 1450 1615 621

	Clip "_cosmetic_right_collision" blocks Infected + AI @ setpos_exact 1400 1637 542

PvP:

	Brush "_losfix_bus" created @ setpos_exact -3624 101 713

	Brush "_losfix_van" created @ setpos_exact 3897 1356 148

	Clip "_endsaferoof_wrongway_clip" blocks Infected @ setpos_exact -4128 350 1337

	Clip "_semiperm_endsaferoof" blocks Infected @ setpos_exact -4344 482 1192

	Clip "_ladder_startalternativeB_clipleft" blocks Everyone @ setpos_exact 701 4025 96

	Clip "_ladder_startalternativeB_clipright" blocks Everyone @ setpos_exact 701 4071 96

	Clip "_ladder_upperbalconynear_clip" blocks Everyone @ setpos_exact 3968 1822 199

	Clip "_infected_mapescape" blocks Infected @ setpos_exact -1997 1497 192

	LADDER: _ladder_brideentryleft_cloned_brideentryright

	LADDER: _ladder_elecbox_cloned_bluebin

	LADDER: _ladder_elecboxsafehouse_cloned_bluebin

	LADDER: _ladder_endfencefront_cloned_endfenceback

	LADDER: _ladder_endsafehouse_cloned_windowtallright

	LADDER: _ladder_endshorthouse_cloned_windowshortleft

	LADDER: _ladder_endtallbrickleft_cloned_bluebin

	LADDER: _ladder_endtallbrickright_cloned_bluebin

	LADDER: _ladder_endtransitfence_cloned_dispcrouchfence

	LADDER: _ladder_startalternativeB_cloned_windowtallright

	LADDER: _ladder_startalternativeT_cloned_starttallangled

	LADDER: _ladder_startpermstuck_cloned_endleftfence

	LADDER: _ladder_tankfenceback_cloned_startfence

	LADDER: _ladder_tankfencefront_cloned_dispcrouchfence

	LADDER: _ladder_upperbalconynear_cloned_upperbalconyfar

	LADDER: _ladder_witchentryfrontleft_cloned_witchentryback

	LADDER: _ladder_witchentryfrontright_cloned_witchentryback

	LADDER: _ladder_witchfarbackL_cloned_witchentryback

	LADDER: _ladder_witchfarbackM_cloned_witchentryback

	LADDER: _ladder_witchfarbackR_cloned_witchentryback

	LADDER: _ladder_witchtentsleft_cloned_witchhedgeleft

	LADDER: _ladder_witchtentsright_cloned_witchhedgeleft

	Static prop "_solidify_endacvent" W/ "models/props_rooftop/acvent04.mdl" @ setpos_exact -3920 1027 1056.8

	Static prop "_solidify_endchimney" W/ "models/props_urban/chimney007.mdl" @ setpos_exact -4027.48 830.86 1056

	Static prop "_tankfence_wrongway" W/ "models/props_misc/wrongway_sign01_optimized.mdl" @ setpos_exact -2025 1527 259

Survival:

	Clip "_survival_tree_01" blocks Survivors @ setpos_exact 1506 -942 817

	Clip "_survival_tree_02" blocks Survivors @ setpos_exact 1621 -367 817

	Clip "_survival_tree_03" blocks Survivors @ setpos_exact 1659 234 817

	Clip "_survival_tree_04" blocks Survivors @ setpos_exact 317 -966 830

	Clip "_survival_tree_05" blocks Survivors @ setpos_exact -75 -980 870

	Clip "_survival_tree_06" blocks Survivors @ setpos_exact -170 -352 800

	Clip "_survival_tree_07" blocks Survivors @ setpos_exact 30 302 830

	Clip "_survival_tree_08" blocks Survivors @ setpos_exact -455 244 830

	Clip "_survival_tree_09" blocks Survivors @ setpos_exact -634 -154 830

	Clip "_survival_tree_10" blocks Survivors @ setpos_exact -644 -578 870

	Clip "_survival_tree_11" blocks Survivors @ setpos_exact -956 233 830

	Clip "_survival_tree_12" blocks Survivors @ setpos_exact -1019 -143 870

	Clip "_survival_tree_13" blocks Survivors @ setpos_exact -1026 -569 870

	Clip "_survival_tree_14" blocks Survivors @ setpos_exact -1476 -1023 870

	Clip "_survival_tree_15" blocks Survivors @ setpos_exact -1476 249 870

	Clip "_survival_tree_16" blocks Survivors @ setpos_exact -1976 -1025 870

	Clip "_survival_tree_17" blocks Survivors @ setpos_exact -1982 260 870

	Clip "_survival_tree_18" blocks Survivors @ setpos_exact -2490 -900 870

	Clip "_survival_tree_19" blocks Survivors @ setpos_exact -2504 185 880

	Clip "_survival_tree_20" blocks Survivors @ setpos_exact -3266 195 870

	Clip "_survival_tree_21" blocks Survivors @ setpos_exact -3271 -890 870

	Clip "_survival_tree_22" blocks Survivors @ setpos_exact 800 -64 747

	Clip "_survival_tree_23" blocks Survivors @ setpos_exact -1502 -606 850

	Clip "_survival_tree_tent" blocks Survivors @ setpos_exact -2633 222 963

------------------------------------------------------------------------------------------------------------------------

THE PASSING - UNDERGROUND || c6m2_bedlam

All:

	Clip "_permstuck_startfence" blocks Survivors @ setpos_exact 2384 -1280 0

	Clip "_cliphang_rooftop" blocks Survivors @ setpos_exact 224 2406 336

	Clip "_cliprework_roofvent" blocks Survivors @ setpos_exact 1471 2017 352

	Clip "_booster_bluestripes" blocks Survivors @ setpos_exact 1574 4577 32

	Clip "_booster_dualwindows" blocks Survivors @ setpos_exact 1953 561 178

	Clip "_booster_balcony1" blocks Survivors @ setpos_exact 537 46 209

	Clip "_booster_balcony2" blocks Survivors @ setpos_exact 1960 86 242

	Clip "_booster_balcony3" blocks Survivors @ setpos_exact 1285 -151 384

	Clip "_booster_balcony4" blocks Survivors @ setpos_exact 1497 798 317

	Clip "_booster_balcony5" blocks Survivors @ setpos_exact 1077 1293 420

	Clip "_booster_balcony6" blocks Survivors @ setpos_exact 342 1303 241

	Clip "_booster_balcony7" blocks Survivors @ setpos_exact 413 4566 157

	Clip "_booster_bigescape" blocks Survivors @ setpos_exact 903 2723 187

	Clip "_frontloader_smoother" blocks Everyone @ setpos_exact 836 1612 -148

	Clip "_ghostgrief_noio_gate1" blocks Everyone @ setpos_exact 2547 5704 -950

	Clip "_ghostgrief_noio_gate2" blocks Everyone @ setpos_exact 5187 5445 -950

	Clip "_booster_electricalbox" blocks Survivors @ setpos_exact 917 3163 -4

	Clip "_booster_acunit" blocks Survivors @ setpos_exact 743 3135 111

	Clip "_dispsteps_smoother1" blocks Everyone @ setpos_exact 2553 -936 -186

	Clip "_dispsteps_smoother2" blocks Everyone @ setpos_exact 2201 -936 -58

	Clip "_plankescape_smoother" blocks Everyone @ setpos_exact 190 2976 120

	Clip "_permstuck_orangefence" blocks Everyone @ setpos_exact 2188 1856 -64

	Clip "_booster_awningnlights" blocks Survivors @ setpos_exact 1264 3705 8

	Clip "_nav_bagselecbox" blocks Survivors @ setpos_exact 636 2243 -70

	trigger_auto_crouch "_duckqol_poolhallwin" created @ setpos_exact 1480 986.4 38.5

	trigger_auto_crouch "_duckqol_missingpipe" created @ setpos_exact 1824 1528 -164

	Static prop "_permstuck_gasmeter" W/ "models/props_urban/gas_meter.mdl" @ setpos_exact 2202 1859.8 -70.5

PvP:

	Brush "_losfix_crates" created @ setpos_exact 1820 4757 -115

	Brush "_losfix_strangebalcony" created @ setpos_exact 1552 1854 344

	Brush "_losfix_van1" created @ setpos_exact 535 4275 -153

	Brush "_losfix_van2" created @ setpos_exact 1592 4299 -153

	LADDER: _ladder_barplankqolB_cloned_barelecbox

	LADDER: _ladder_barplankqolT_cloned_barelecbox

	LADDER: _ladder_crawfishelecbox_cloned_sucktheheads

	LADDER: _ladder_forkliftvines_cloned_startfenceback

	LADDER: _ladder_frontloaderright_cloned_frontloaderleft

	LADDER: _ladder_pipesfencefront_cloned_pipesfenceback

	LADDER: _ladder_poolhalldropleft_cloned_poolhalldropright

	LADDER: _ladder_stanleydoor_cloned_sewerdropleft

	LADDER: _ladder_startfenceback_cloned_startfence

	LADDER: _ladder_startfencefront_cloned_startfenceback

	Static prop "_solidify_ventlarge" W/ "models/props_rooftop/vent_large1.mdl" @ setpos_exact 1312.21 1963.61 334.677

Coop:

	LADDER: _ladder_frontloaderright_cloned_frontloaderleft

Survival:

	LADDER: _ladder_frontloaderright_cloned_frontloaderleft

------------------------------------------------------------------------------------------------------------------------

THE PASSING - PORT || c6m3_port

All:

	Clip "_solidify_girder" blocks Survivors @ setpos_exact 200 -1280 145

	Clip "_booster_bridgea" blocks Survivors @ setpos_exact 0 -638 216

	Clip "_booster_bridgeb" blocks Survivors @ setpos_exact 0 -1200 216

	Clip "_booster_tent" blocks Survivors @ setpos_exact 1196 -847 294

	Clip "_booster_streetlamp" blocks Survivors @ setpos_exact 1493 -368 308

	Clip "_booster_generator_side" blocks Survivors @ setpos_exact 1848 928 98

	Clip "_booster_generator_main" blocks Survivors @ setpos_exact -484 -580 326

	Clip "_booster_signalboxes" blocks Survivors @ setpos_exact -570 -859 104

	Clip "_booster_trimandbox" blocks Survivors @ setpos_exact -859 1591 473

	Clip "_booster_fencefinish" blocks Survivors @ setpos_exact -243 -631 137

	Clip "_booster_telepole1" blocks Survivors @ setpos_exact -232 1481 640

	Clip "_booster_telepole2" blocks Survivors @ setpos_exact 252 1092 640

	Clip "_booster_telepole3" blocks Survivors @ setpos_exact -1423 1481 640

	Clip "_booster_telepole4" blocks Survivors @ setpos_exact -2461 1234 640

	Clip "_booster_telepole5" blocks Survivors @ setpos_exact 258 153 480

	Clip "_booster_telepole6" blocks Survivors @ setpos_exact -625 87 480

	Clip "_booster_telepole7" blocks Survivors @ setpos_exact 1562 170 345

	Clip "_booster_badcorner" blocks Survivors @ setpos_exact -2342 -258 329

	Clip "_booster_acunit" blocks Survivors @ setpos_exact -1568 -639 424

	Clip "_booster_electricalbox" blocks Survivors @ setpos_exact -251 -932 101

	Clip "_booster_elecwiresa" blocks Survivors @ setpos_exact -1537 -256 300

	Clip "_booster_elecwiresb" blocks Survivors @ setpos_exact 255 -255 178

	Clip "_booster_elecwiresc" blocks Survivors @ setpos_exact 262 -772 356

	Clip "_booster_elecwiresd" blocks Survivors @ setpos_exact -234 1078 392

	Clip "_booster_for_lease" blocks Survivors @ setpos_exact -1917 1555 384

	Clip "_booster_genroom_shelf" blocks Survivors @ setpos_exact -738 -801 233

	Clip "_booster_light_dual" blocks Survivors @ setpos_exact -2208 1532 325

	Clip "_booster_lighta" blocks Survivors @ setpos_exact -1540 23 187

	Clip "_booster_lightb" blocks Survivors @ setpos_exact -647 -568 186

	Clip "_booster_lightc" blocks Survivors @ setpos_exact 593 -234 169

	Clip "_booster_itwasatriumph" blocks Survivors @ setpos_exact 899 -426 53

	Clip "_bridge_curbsmoother1" blocks Everyone @ setpos_exact -1 -1014 -8

	Clip "_bridge_curbsmoother2" blocks Everyone @ setpos_exact 1 -1014 -8

	Brush "_losblock_plywoodc6only" created @ setpos_exact 193 -1124 16

	Clip "_booster_windows" blocks Survivors @ setpos_exact -1032 568 352

	Clip "_window_smoother_c6only" blocks Infected @ setpos_exact -1023 568 352

	Clip "_booster_coolingtanks" blocks Survivors @ setpos_exact -1473 958 402

	FIX:	Total of 2 out of 2 traffic cones need to be made non-solid -- c7m3 already OK.

	Un-solidified prop_physics @ setpos_exact 1793.94 327.969 -95.5938

	Un-solidified prop_physics @ setpos_exact 1759.16 448.781 -95.5938

	Un-solidified ALL props with model: "models/props_fortifications/orange_cone001_reference.mdl"

PvP:

	Brush "_losfix_gen1" created @ setpos_exact -476 -577 11

	Brush "_losfix_gen2" created @ setpos_exact -1152 920 168

	Brush "_losfix_van1" created @ setpos_exact -318 5 5

	Brush "_losfix_van2" created @ setpos_exact 379 703 168

	Clip "_ladder_c7mirrconcretecar_clipleft" blocks Everyone @ setpos_exact 251 493 30

	Clip "_ladder_c7mirrconcretecar_clipright" blocks Everyone @ setpos_exact 252 452 30

	Clip "_ladder_c7mirrstonewallcar_clipleft" blocks Everyone @ setpos_exact 1214 -143 -105

	Clip "_ladder_c7mirrstonewallcar_clipright" blocks Everyone @ setpos_exact 1158 -133 -105

	LADDER: _ladder_backleftc6only_cloned_generatorvines

	LADDER: _ladder_backmidc6only_cloned_generatorvines

	LADDER: _ladder_backrightc6only_cloned_starttinyvan

	LADDER: _ladder_c7mirracventfront_cloned_acventback

	LADDER: _ladder_c7mirrbarricaderoof_cloned_elevatorvines

	LADDER: _ladder_c7mirrbrickstep_cloned_startshortest

	LADDER: _ladder_c7mirrbridgeright_cloned_stonewallstairs

	LADDER: _ladder_c7mirrconcretecar_cloned_acventback

	LADDER: _ladder_c7mirrconcretestep_cloned_startshortest

	LADDER: _ladder_c7mirrelecboxfence_cloned_elevatorvines

	LADDER: _ladder_c7mirrfireescapeback_cloned_burgerbillboard

	LADDER: _ladder_c7mirrpoolhalldoorway_cloned_picketbridgefar

	LADDER: _ladder_c7mirrprivateparking_cloned_stonewallstairs

	LADDER: _ladder_c7mirrstonewallcar_cloned_stonewallstairs

	LADDER: _ladder_c7mirrstonewalltree_cloned_softdrinks

	LADDER: _ladder_c7mirrtentlinkfar_cloned_acventback

	LADDER: _ladder_c7mirrtentlinknear_cloned_acventback

	LADDER: _ladder_c7mirrvinestohedge_cloned_burgerbillboard

	LADDER: _ladder_c7mirrwhitetable_cloned_picketbridge

	LADDER: _ladder_c7mirrwindowdoor_cloned_burgerbillboard

	LADDER: _ladder_starthighc6only_cloned_generatorvines

	LADDER: _ladder_startlowc6only_cloned_generatorvines

	Static prop "_ladder_c7mirrbarricaderoof" W/ "models/props_downtown/gutter_downspout_straight02.mdl" @ setpos_exact -224 1001 412

	Static prop "_ladder_c7mirrelecboxfence" W/ "models/props_downtown/gutter_downspout_straight02.mdl" @ setpos_exact -256 -998 304

	Static prop "_ladder_c7mirrfireescapeback" W/ "models/props_downtown/gutter_downspout_straight02.mdl" @ setpos_exact 463 -768 347

	Static prop "_ladder_c7mirrpoolhalldoorway" W/ "models/props_downtown/gutter_downspout_straight02.mdl" @ setpos_exact 928 -294 370

	Static prop "_ladder_c7mirrwindowdoor" W/ "models/props_downtown/gutter_downspout_straight02.mdl" @ setpos_exact 654 -256 347

	Navmesh modified w/ CHECKPOINT @ setpos_exact -2227 -362 -256

------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------

THE SACRIFICE - DOCKS || c7m1_docks

All:

	Clip "_bunnyhop_boat" blocks Survivors @ setpos_exact 11970 -820 -157

	Clip "_ghostgrief_dockledge" blocks Everyone @ setpos_exact 10228 -340 -107

	Clip "_clipgap_intersection" blocks Survivors @ setpos_exact 6612 2234 294

	Clip "_booster_lonerpipe" blocks Survivors @ setpos_exact 9236 750 550

	Clip "_clipextend_arena_tree" blocks Survivors @ setpos_exact 9054 49 740

	Clip "_clipextend_arena_fence1" blocks Survivors @ setpos_exact 9418 371 496

	Clip "_clipextend_arena_fence2" blocks Survivors @ setpos_exact 8077 -311 496

	Clip "_cliprework_ventshafts" blocks Survivors @ setpos_exact 3870 1647 336

	Clip "_commonhop_endwindows" blocks Survivors @ setpos_exact 2563 2560 336

	Clip "_clipextend_rubblecar" blocks Survivors @ setpos_exact 11026 -1196 90

PvP:

	Clip "_ladder_tankwinleft_clip" blocks Infected @ setpos_exact 7335 944 224

	Clip "_ladder_tankwinright_clip" blocks Infected @ setpos_exact 7591 944 224

	LADDER: _ladder_brickyardleft1_cloned_brickyard2nd

	LADDER: _ladder_brickyardleft2_cloned_brickyard3rd

	LADDER: _ladder_brickyardleft3_cloned_brickyard1st

	LADDER: _ladder_brickyardright1_cloned_brickyard3rd

	LADDER: _ladder_brickyardright2_cloned_brickyard3rd

	LADDER: _ladder_midfencefar_cloned_midstreetnear

	LADDER: _ladder_midfencenear_cloned_midstreetfar

	LADDER: _ladder_parkourvent_cloned_roofshortest

	LADDER: _ladder_tankwinleft_cloned_brickoffice

	LADDER: _ladder_tankwinright_cloned_brickoffice

Coop:

	LOGIC:	Coop-only boxcar Tank door clip and navblocker modified to fix forced-suicide trick.

------------------------------------------------------------------------------------------------------------------------

THE SACRIFICE - BARGE || c7m2_barge

All:

	Clip "_cliprework_startbricks" blocks Survivors @ setpos_exact 9800 1728 321

	Clip "_permstuck_flatnosecargo" blocks Everyone @ setpos_exact 5793 2568 130

	Clip "_curvejump_fenceledge" blocks Survivors @ setpos_exact -1984 0 160

	Clip "_stuckwarp_railwayoverpass" blocks Everyone @ setpos_exact 2726 2775 374

	Clip "_nav_windowrecess" blocks Survivors @ setpos_exact -1944 1412 192

	Clip "_ghostgrief_acunit" blocks Survivors @ setpos_exact -10240 383 386

	Clip "_ghostgrief_coalbarge" blocks Survivors @ setpos_exact -8700 170 -78

	Clip "_ghostgrief_unitfromdeath" blocks Survivors @ setpos_exact -7399 -1199 -128

	Clip "_booster_littleroof" blocks Survivors @ setpos_exact -1795 1471 320

	Clip "_booster_yawningman" blocks Survivors @ setpos_exact -1294 1513 331

	Clip "_booster_dualstacks" blocks Survivors @ setpos_exact -3080 671 576

	Clip "_booster_cementlips" blocks Survivors @ setpos_exact -2882 1688 132

	Clip "_booster_fenceledge" blocks Survivors @ setpos_exact -3767 1835 128

	Clip "_booster_gravelacun" blocks Survivors @ setpos_exact -6495 1144 333

	Clip "_booster_solidify_windows" blocks Survivors @ setpos_exact 11032 606 336

PvP:

	LADDER: _ladder_bluecontback_cloned_bluecontfront

	LADDER: _ladder_comicboatsleftL_cloned_toolhouse

	LADDER: _ladder_comicboatsleftR_cloned_toolhouse

	LADDER: _ladder_comicboatsright_cloned_toolhouse

	LADDER: _ladder_comicpylonleft_cloned_toolhouse

	LADDER: _ladder_comicpylonright_cloned_toolhouse

	LADDER: _ladder_comicwitchboat_cloned_toolhouse

	LADDER: _ladder_endbarricadeleft_cloned_vanishbarricade

	LADDER: _ladder_endbarricaderight_cloned_nomanssemi

	LADDER: _ladder_overpassgapleft_cloned_fourcontainers

	LADDER: _ladder_overpassgapright_cloned_fourcontainers

	LADDER: _ladder_permstuckend_cloned_toolhouse

	LADDER: _ladder_pondareafence_cloned_startflatnosefence

	LADDER: _ladder_shedwindow_cloned_barrelshort

	LADDER: _ladder_silofenceclone1_cloned_silofencesource

	LADDER: _ladder_spectroleumtanker_cloned_spectroleumfence

	LADDER: _ladder_startroombrick_cloned_startareasemi

	LADDER: _ladder_tankpolesfenceleft_cloned_tankpolesfenceright

	LADDER: _ladder_tankpoleswallL_cloned_tankpolesfenceright

	LADDER: _ladder_tankpoleswallR_cloned_tankpolesfenceright

Scavenge:

	Clip "_scavenge_jump_woodbrush" blocks Survivors @ setpos_exact -9100 392 262

------------------------------------------------------------------------------------------------------------------------

THE SACRIFICE - PORT || c7m3_port

All:

	Clip "_solidify_girdershorter" blocks Survivors @ setpos_exact 200 -1280 145

	Clip "_booster_bridge_TMP1" blocks Survivors @ setpos_exact 0 -638 216

	Clip "_booster_bridge_TMP2" blocks Survivors @ setpos_exact 0 -1200 216

	Brush "_losblock_plywoodc7only" created @ setpos_exact 193 -1124 16

	Clip "_booster_windows" blocks Survivors @ setpos_exact -1032 568 352

	Clip "_booster_skylight_c7only" blocks Survivors @ setpos_exact -768 930 325

	Clip "_booster_coolingtanks" blocks Survivors @ setpos_exact -1473 958 402

	LOGIC:	TMP shortcut booster clips will be deleted on trigger_finale FinaleEscapeStarted.
		Not a gamebreaker if absent and only for Sacrifice 3 to avoid players bumping their head.

	Clip "_anti_finaleskip_TMP" blocks Survivors @ setpos_exact 230 -849 216

	LOGIC:	TMP finale skip clip will be deleted after bridge is almost fully raised.
		Allows sacrificer to use stairs. Incompatible with Passing 3 because of Louis.

	Clip "_booster_tankwindows" blocks Survivors @ setpos_exact -1280 -1016 216

	Clip "_cliprework_semitrailer" blocks Survivors @ setpos_exact 1727 2883 285

	Clip "_cliprework_startroofa" blocks Survivors @ setpos_exact 1370 2379 544

	Clip "_cliprework_startroofb" blocks Survivors @ setpos_exact 675 2011 408

	Clip "_cliprework_startroofc" blocks Survivors @ setpos_exact 517 2972 640

	Clip "_cliprework_startroofd" blocks Survivors @ setpos_exact 983 3418 540

	Clip "_cliprework_colossaldumpster" blocks Survivors @ setpos_exact 1583 962 64

	Clip "_booster_tent" blocks Survivors @ setpos_exact 1196 -847 294

	Clip "_booster_streetlamp" blocks Survivors @ setpos_exact 1493 -368 308

	Clip "_booster_generator_side" blocks Survivors @ setpos_exact 1848 735 98

	Clip "_booster_generator_main" blocks Survivors @ setpos_exact -434 -580 326

	Clip "_booster_telepole1" blocks Survivors @ setpos_exact -232 1481 640

	Clip "_booster_telepole2" blocks Survivors @ setpos_exact 252 1122 640

	Clip "_booster_telepole3" blocks Survivors @ setpos_exact 258 153 480

	Clip "_booster_telepole4" blocks Survivors @ setpos_exact -625 87 480

	Clip "_booster_telepole5" blocks Survivors @ setpos_exact 1562 170 345

	Clip "_booster_elecwiresbad" blocks Survivors @ setpos_exact -234 1078 392

	Clip "_booster_genroom_shelf" blocks Survivors @ setpos_exact -739 -800 233

	Clip "_booster_spaaaaaace" blocks Survivors @ setpos_exact 899 -426 53

	Clip "_booster_fireescape" blocks Survivors @ setpos_exact 359 -788 160

	Clip "_bridgerail_thinledge" blocks Survivors @ setpos_exact 288 -1275 414

	Clip "_bridge_curbsmoother1" blocks Everyone @ setpos_exact -1 -1014 -8

	Clip "_bridge_curbsmoother2" blocks Everyone @ setpos_exact 1 -1014 -8

PvP:

	Brush "_losfix_dynamic_car" created @ setpos_exact 89 -1532 176

	Brush "_losfix_dynamic_van" created @ setpos_exact -86 -1551 176

	Brush "_losfix_gen1" created @ setpos_exact -460 -572 11

	Brush "_losfix_gen2" created @ setpos_exact -1151 921 168

	LADDER: _ladder_fencec6mirr_cloned_concbarrfront

	LADDER: _ladder_pillarc6mirr_cloned_dumpsterhedge

	MOVER:	LOS dynamic car and van parented to move with bridge.

------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------

NO MERCY - APARTMENTS || c8m1_apartment

All:

	Clip "_fallrevive_griefroom" blocks Survivors @ setpos_exact 632 984 292

	Clip "_truckjump_window" blocks Survivors @ setpos_exact 1728 3976 268

	Clip "_cliprework_rooftop03" blocks Survivors @ setpos_exact 2047 2792.5 495.5

	Clip "_commonhop_electricalbox" blocks Survivors @ setpos_exact 2526 2418 209

	Clip "_cliprework_rooftop02" blocks Survivors @ setpos_exact 2004 1996 640

	Clip "_cliprework_rooftop04" blocks Survivors @ setpos_exact 2766 943 800

	Clip "_cliprework_rooftop01" blocks Survivors @ setpos_exact 1943 480 800

	Clip "_clipextend_van" blocks Survivors @ setpos_exact 2786 2528 404.7

	Clip "_cliprework_unattackable" blocks Survivors @ setpos_exact 127 2648.5 16

	Clip "_booster_corner" blocks Survivors @ setpos_exact 512 5296.1 272

	Clip "_booster_windows" blocks Survivors @ setpos_exact 2040 4672 268

	Clip "_booster_rubble" blocks Survivors @ setpos_exact 2952 5236 374.2

	Clip "_clipextend_crushescape" blocks Survivors @ setpos_exact 2459 767 853

	Clip "_cliprework_rooftop05" blocks Survivors @ setpos_exact 1793 1595 640

	Clip "_clipextend_unattackable" blocks Survivors @ setpos_exact 2483 5327 528

	Clip "_clipextend_policefence" blocks Survivors @ setpos_exact 1173 2032 656

	Clip "_clipextend_subwayfence" blocks Survivors @ setpos_exact 3266 4137 552

	Clip "_nav_electricalboxa" blocks Survivors @ setpos_exact 2476 1819 125

	Clip "_nav_electricalboxb" blocks Survivors @ setpos_exact 2016 2188 127

	Clip "_cliprework_subwayupper" blocks Survivors @ setpos_exact 2921 4194 156

	Clip "_cliprework_subwayledge" blocks Survivors @ setpos_exact 3014 4017 156

	Clip "_cliprework_subwayfence" blocks Survivors @ setpos_exact 3268 4141 552

	Clip "_subwins_smoother" blocks Everyone @ setpos_exact 2968 4103 48

	Insta-kill "_instakill_griefroom" Survivor @ setpos_exact 1152 936 8

	FIX:	Fans will now rotate. Server-side entities used to have Client-side Animation spawnflag.

PvP:

	Deleted func_playerinfected_clip @ setpos_exact 2294 821 317.821

	Deleted func_playerinfected_clip @ setpos_exact -1 2655 351

	Deleted func_playerinfected_clip @ setpos_exact 1535 3999 775

	Deleted func_playerinfected_clip @ setpos_exact 1023 5055 527

	Deleted func_playerinfected_clip @ setpos_exact 2551 511 799

	Deleted func_playerinfected_clip @ setpos_exact -1 2143 463

	Deleted func_playerinfected_clip @ setpos_exact 2815 2751 831

	Deleted func_playerinfected_clip @ setpos_exact -1 3451 465

	Deleted func_playerinfected_clip @ setpos_exact -1 5087 271

	Brush "_losfix_boxes" created @ setpos_exact 2956 3995.77 -224

	Brush "_losfix_car" created @ setpos_exact 1163 2944 23

	Brush "_losfix_debris1" created @ setpos_exact 2404 706 90

	Brush "_losfix_debris2" created @ setpos_exact 2493 706 90

	Brush "_losfix_debris3" created @ setpos_exact 2487 727 130

	Brush "_losfix_debris4" created @ setpos_exact 2487 747 141

	Brush "_losfix_truck" created @ setpos_exact 2232 4268 12

	Brush "_losfix_van1" created @ setpos_exact 2588 3542 21

	Brush "_losfix_van2" created @ setpos_exact 2546 3494 21

	Clip "_ladder_startroof_clip" blocks Infected @ setpos_exact 2292 1340 319

	Clip "_meticulous_funcinfclip01" blocks Infected @ setpos_exact 2293 850 322

	Clip "_meticulous_funcinfclip02" blocks Infected @ setpos_exact 3175 3371 832

	Clip "_meticulous_funcinfclip03" blocks Infected @ setpos_exact 153 2988 352

	Clip "_meticulous_funcinfclip04" blocks Infected @ setpos_exact -5 4298 466

	Clip "_meticulous_funcinfclip05" blocks Infected @ setpos_exact 153 2176 352

	Clip "_yesdraw_dairy_clipa" blocks Infected @ setpos_exact 1737 5767 528

	Clip "_yesdraw_dairy_clipb" blocks Infected @ setpos_exact 2031 5390 528

	Clip "_yesdraw_farcorner_clip" blocks Infected @ setpos_exact 216 5303 528

	Clip "_yesdraw_start_clipa" blocks Infected @ setpos_exact 3052 959 800

	Clip "_yesdraw_start_clipb" blocks Infected @ setpos_exact 2710 508 1370

	LADDER: _ladder_alleywindow_cloned_tankerwindow

	LADDER: _ladder_commvignette_cloned_trashorange

	LADDER: _ladder_crushedescape_cloned_tankerwindow

	LADDER: _ladder_dairybrickleft_cloned_thinwhiteledge

	LADDER: _ladder_dairybrickright_cloned_thinwhiteledge

	LADDER: _ladder_fencebayB_cloned_garagewindow

	LADDER: _ladder_fencebayT_cloned_garagewindow

	LADDER: _ladder_fencefrontL_cloned_fencebackL

	LADDER: _ladder_fencefrontM_cloned_fencebackM

	LADDER: _ladder_fencefrontR_cloned_fencebackR

	LADDER: _ladder_flatnose_cloned_chaintilt

	LADDER: _ladder_ominouswin_cloned_helloworld

	LADDER: _ladder_parkourstartB_cloned_tallpipecopcar

	LADDER: _ladder_parkourstartT_cloned_thinwhiteledge

	LADDER: _ladder_simondairy_cloned_helloworld

	LADDER: _ladder_startroof_cloned_trashblack

	LADDER: _ladder_subwaybricks_cloned_tankerwindow

	LADDER: _ladder_subwayrubble_cloned_woodyjr

	Static prop "_losblocker_fencea" W/ "models/props_urban/fence_cover001_256.mdl" @ setpos_exact 896 3971 17

	Static prop "_losblocker_fenceb" W/ "models/props_urban/fence_cover001_256.mdl" @ setpos_exact 1408 3971 17

	Static prop "_commvignette_wrongwaya" W/ "models/props_misc/wrongway_sign01_optimized.mdl" @ setpos_exact 445 2790 416

	Static prop "_commvignette_wrongwayb" W/ "models/props_misc/wrongway_sign01_optimized.mdl" @ setpos_exact 445 3190 416

	Static prop "_ladder_commvignette_pipe" W/ "models/props_rooftop/Gutter_Pipe_256.mdl" @ setpos_exact 628 3296 330

	Static prop "_ladder_ominouswin_pipeB" W/ "models/props_rooftop/Gutter_Pipe_256.mdl" @ setpos_exact 1824 5248 272

	Static prop "_ladder_ominouswin_pipeT" W/ "models/props_rooftop/Gutter_Pipe_256.mdl" @ setpos_exact 1824 5248 528

	Static prop "_ladder_simondairy_pipeB" W/ "models/props_rooftop/Gutter_Pipe_256.mdl" @ setpos_exact 1129 5056 272

	Static prop "_ladder_simondairy_pipeT" W/ "models/props_rooftop/Gutter_Pipe_256.mdl" @ setpos_exact 1129 5056 528

	Static prop "_losblocker_simondairy" W/ "models/props_rooftop/rooftopcluser06a.mdl" @ setpos_exact 1392 5397 630

	Static prop "_solidify_dairyclust" W/ "models/props_rooftop/rooftopcluser06a.mdl" @ setpos_exact 1632 4672 869.405

	Static prop "_solidify_dairyvent1" W/ "models/props_rooftop/acvent01.mdl" @ setpos_exact 1633 4676 776.299

	Static prop "_solidify_dairyvent2" W/ "models/props_rooftop/acvent01.mdl" @ setpos_exact 1633 4548 776.299

	Static prop "_solidify_dairyvent3" W/ "models/props_rooftop/acvent01.mdl" @ setpos_exact 1904 4145 776.299

	Static prop "_solidify_dairyvent4" W/ "models/props_rooftop/acvent02.mdl" @ setpos_exact 1665 4124 776

	Static prop "_window_ceda_body" W/ "models/DeadBodies/CEDA/ceda_truck_a.mdl" @ setpos_exact 2382 1414 257

	Static prop "_yesdraw_dairy_wrongwaya" W/ "models/props_misc/wrongway_sign01_optimized.mdl" @ setpos_exact 1309 5535 585

	Static prop "_yesdraw_dairy_wrongwayb" W/ "models/props_misc/wrongway_sign01_optimized.mdl" @ setpos_exact 1709 5535 585

	Static prop "_yesdraw_farcorner_wall" W/ "models/props_update/c8m1_rooftop_4.mdl" @ setpos_exact 384 4272 529.3

	Static prop "_yesdraw_farcorner_wrongway" W/ "models/props_misc/wrongway_sign01_optimized.mdl" @ setpos_exact 384 5303 320

	Static prop "_yesdraw_fireroof_hunt1" W/ "models/props_update/c8m1_rooftop_3.mdl" @ setpos_exact 544 1264 1232

	Static prop "_yesdraw_fireroof_hunt2" W/ "models/props_update/c8m1_rooftop_3.mdl" @ setpos_exact 544 1536 1232.1

	Static prop "_yesdraw_fireroof_hunt3" W/ "models/props_update/c8m1_rooftop_3.mdl" @ setpos_exact 544 1808 1232

	Static prop "_yesdraw_roof_starta" W/ "models/props_update/c8m1_rooftop_3.mdl" @ setpos_exact 2792 1192 799.9999

	Static prop "_yesdraw_roof_startb" W/ "models/props_update/c8m1_rooftop_3.mdl" @ setpos_exact 2792 744 799.9999

	Static prop "_yesdraw_roof_startc" W/ "models/props_update/c8m1_rooftop_3.mdl" @ setpos_exact 3272 1192 799.9999

	Static prop "_yesdraw_roof_startd" W/ "models/props_update/c8m1_rooftop_3.mdl" @ setpos_exact 3272 744 799.9999

	Static prop "_yesdraw_rooftop_1" W/ "models/props_update/c8m1_rooftop_1.mdl" @ setpos_exact 1776 4528 776

	Static prop "_yesdraw_rooftop_2" W/ "models/props_update/c8m1_rooftop_2.mdl" @ setpos_exact 1536 5536 528

	Static prop "_yesdraw_rooftop_3" W/ "models/props_update/c8m1_rooftop_3.mdl" @ setpos_exact 496 2400 616

	Static prop "_yesdraw_rooftop_3_wrongwaya" W/ "models/props_misc/wrongway_sign01_optimized.mdl" @ setpos_exact 445 2495 678

	Static prop "_yesdraw_rooftop_3_wrongwayb" W/ "models/props_misc/wrongway_sign01_optimized.mdl" @ setpos_exact 445 2305 678

	Static prop "_yesdraw_start_wrongwaya" W/ "models/props_misc/wrongway_sign01_optimized.mdl" @ setpos_exact 2752 1232 854

	Static prop "_yesdraw_start_wrongwayb" W/ "models/props_misc/wrongway_sign01_optimized.mdl" @ setpos_exact 2752 982 854

	Deleted func_playerinfected_clip @ setpos_exact 2294 1311 317.821

------------------------------------------------------------------------------------------------------------------------

NO MERCY - SUBWAY || c8m2_subway

All:

	Clip "_permstuck_piperoom" blocks Everyone @ setpos_exact 7474 2355 -216

	Clip "_tankwarp_pillar" blocks Everyone @ setpos_exact 7565 4164 -95

	Clip "_busstop_fence" blocks Survivors @ setpos_exact 8600 5556 788

	Clip "_dispcrouch_cavea" blocks Everyone @ setpos_exact 4354 3430 -174.7

	Clip "_dispcrouch_caveb" blocks Everyone @ setpos_exact 4497 3316 -174.7

	Clip "_booster_windowandfence" blocks Survivors @ setpos_exact 8416 3888 344

	Clip "_booster_pipe" blocks Survivors @ setpos_exact 7351 3792 144

	Clip "_booster_beama" blocks Survivors @ setpos_exact 7176 3138 424

	Clip "_booster_beamb" blocks Survivors @ setpos_exact 7380 3138 424

	Clip "_booster_beamc" blocks Survivors @ setpos_exact 7568 3138 424

	Clip "_booster_beamd" blocks Survivors @ setpos_exact 7754 3138 424

	Clip "_booster_beame" blocks Survivors @ setpos_exact 7943 3138 424

	Clip "_booster_boxrow" blocks Survivors @ setpos_exact 7827 3816 381

	Clip "_subwaymount_in" blocks Survivors @ setpos_exact 6337 3137 -154

	Clip "_subwaymount_out" blocks Survivors @ setpos_exact 6769 2895 -154

	Clip "_stuckwarp_underspawn" blocks Everyone @ setpos_exact 3111 2775 -70

	Clip "_stuckwarp_tunnelend" blocks Everyone @ setpos_exact 4182 2831 -70

	Clip "_tankwarp_solidify" blocks Infected + AI @ setpos_exact 5977 4742 -335

	Clip "_unattackable_building" blocks Survivors @ setpos_exact 9311 4256 704

	Clip "_unattackable_backalley1" blocks Survivors @ setpos_exact 6780 4279 632

	Clip "_unattackable_backalley2" blocks Survivors @ setpos_exact 8319 3520 660

	Clip "_unattackable_backalley3" blocks Survivors @ setpos_exact 10298 3765 16

	Clip "_unattackable_backalley4" blocks Survivors @ setpos_exact 10871 4221 688

	Clip "_unattackable_pawnshop1" blocks Survivors @ setpos_exact 11272 5336 16

	Clip "_unattackable_pawnshop2" blocks Survivors @ setpos_exact 10112 5744 512

	Clip "_clipextend_ledgehang" blocks Survivors @ setpos_exact 9394 5648 416

	Clip "_unattackable_tanker1" blocks Survivors @ setpos_exact 6750 5141 512

	Clip "_unattackable_tanker2" blocks Survivors @ setpos_exact 7700 5622 536

	Clip "_ladderqol_orangebags" blocks Infected + AI @ setpos_exact 10660 5215 16

	Clip "_genroomrail_smoother1" blocks Everyone @ setpos_exact 7285 3633 248

	Clip "_genroomrail_smoother2" blocks Everyone @ setpos_exact 7285 2878 248

	Clip "_nav_tankjukepipes" blocks Survivors @ setpos_exact 8276 3656 140

	FIX:	Generator Room has 13 hanging lights and 9 need to be made non-solid.

	Un-solidified prop_dynamic @ setpos_exact 7915.86 3237.02 486

	Un-solidified prop_dynamic @ setpos_exact 7726.86 3238.02 486

	Un-solidified prop_dynamic @ setpos_exact 7538.86 3238.02 486

	Un-solidified prop_dynamic @ setpos_exact 7301.75 3237.04 486

	Un-solidified prop_dynamic @ setpos_exact 7300.86 2906.02 486

	Un-solidified prop_dynamic @ setpos_exact 7539.75 3601.04 486

	Un-solidified prop_dynamic @ setpos_exact 7727.75 3601.04 486

	Un-solidified prop_dynamic @ setpos_exact 7915.88 3601.01 486

	Un-solidified prop_dynamic @ setpos_exact 7859.87 3739.32 230.068

	Un-solidified prop_dynamic @ setpos_exact 7917 2905 486

	Un-solidified prop_dynamic @ setpos_exact 7728 2906 486

	Un-solidified prop_dynamic @ setpos_exact 7540 2906 486

	Un-solidified prop_dynamic @ setpos_exact 7302 3601 486

	Un-solidified ALL props with model: "models/props/de_nuke/IndustrialLight01.mdl"

PvP:

	Clip "_nav_backlightleft" blocks Survivors @ setpos_exact 5249 4124 -265

	Clip "_nav_backlightright" blocks Survivors @ setpos_exact 5243 4210 -265

	Deleted func_playerinfected_clip @ setpos_exact 10511 3839 687

	Brush "_losfix_copcar" created @ setpos_exact 9996 5815 16

	Brush "_losfix_semi1" created @ setpos_exact 9043 4927 26

	Brush "_losfix_semi2" created @ setpos_exact 9073 4913 18

	Clip "_generator_qolstep1" blocks Infected @ setpos_exact 8021 2880 16

	Clip "_generator_qolstep2" blocks Infected @ setpos_exact 8021 3168 16

	Clip "_ladder_deadendrubble_clip" blocks Everyone @ setpos_exact 2149 3922 -242

	Clip "_ladder_generatorwindow_clipa" blocks Infected @ setpos_exact 7944 2512 425

	Clip "_ladder_generatorwindow_clipb" blocks Infected @ setpos_exact 7568 2512 425

	Clip "_ladder_generatorwindow_clipc" blocks Infected @ setpos_exact 7734 2462 425

	Clip "_ladder_tanksubqol_clip" blocks Everyone @ setpos_exact 6290 3284 -336

	Clip "_ladder_tanksubway_clip" blocks Infected @ setpos_exact 6999 2919 -188

	Clip "_ladder_tanksubwreck_clip" blocks Everyone @ setpos_exact 4306 4053 -231

	LADDER: _ladder_deadendrubble_cloned_endfenceshortest

	LADDER: _ladder_endpawnbrick_cloned_trashbagdrop

	LADDER: _ladder_endpolicefence_cloned_oneunitbroke

	LADDER: _ladder_endquickroof_cloned_oneunitbroke

	LADDER: _ladder_eventminigunnew_cloned_eventminigun

	LADDER: _ladder_eventwindowleftB_cloned_endfenceshortest

	LADDER: _ladder_eventwindowleftT_cloned_eventwindowright

	LADDER: _ladder_genwinglassleft_cloned_firebarrelfence

	LADDER: _ladder_genwinglassright_cloned_firebarrelfence

	LADDER: _ladder_innertanker_cloned_nodrawfence

	LADDER: _ladder_newrocketboom_cloned_trashbagdrop

	LADDER: _ladder_permstuckpawnfence_cloned_endfenceshortest

	LADDER: _ladder_permstuckpawnrear_cloned_eventminigun

	LADDER: _ladder_postsubrubble_cloned_firebarrelfence

	LADDER: _ladder_quickstepqol_cloned_wrongwayfence

	LADDER: _ladder_subwaynontrashside_cloned_endalleyfence

	LADDER: _ladder_tanksubqol_cloned_copcarsbrick

	LADDER: _ladder_tanksubway_cloned_copcarsbrick

	LADDER: _ladder_tanksubwreck_cloned_endfenceshortest

	LADDER: _ladder_tankwarprubble_cloned_warehousewindow

	LADDER: _ladder_windowdropleft_cloned_trashbagdrop

	LADDER: _ladder_windowdropright_cloned_trashbagdrop

	Static prop "_yesdraw_generatorroom" W/ "models/props_update/c8m2_generatorroom.mdl" @ setpos_exact 7748 2448.1 513

	Static prop "_yesdraw_planka" W/ "models/props_swamp/plank001b_192.mdl" @ setpos_exact 7283 2638 424

	Static prop "_yesdraw_plankb" W/ "models/props_swamp/plank001b_192.mdl" @ setpos_exact 7477 2638 444

	Static prop "_yesdraw_plankc" W/ "models/props_swamp/plank001b_192.mdl" @ setpos_exact 8040 2638 435

	Static prop "_yesdraw_tallroof_hunt1" W/ "models/props_update/c8m1_rooftop_3.mdl" @ setpos_exact 8961 4364 1215.9

	Static prop "_yesdraw_tallroof_hunt2" W/ "models/props_update/c8m1_rooftop_3.mdl" @ setpos_exact 8548 4364 1215.99

	Static prop "_yesdraw_wrongwaya" W/ "models/props_misc/wrongway_sign01_optimized.mdl" @ setpos_exact 7540 2556 410

	Static prop "_yesdraw_wrongwayb" W/ "models/props_misc/wrongway_sign01_optimized.mdl" @ setpos_exact 7971 2556 410

	Static prop "_yesdraw_wrongwayc" W/ "models/props_misc/wrongway_sign01_optimized.mdl" @ setpos_exact 7756 2440 410

	Ladder found @ "8657 5483.5 92" and shifted w/ offset @ "0 -1 0"

	FIX:	Generator Room has 13 hanging lights and 9 need to be made non-solid.

	Un-solidified prop_dynamic @ setpos_exact 7915.86 3237.02 486

	Un-solidified prop_dynamic @ setpos_exact 7726.86 3238.02 486

	Un-solidified prop_dynamic @ setpos_exact 7538.86 3238.02 486

	Un-solidified prop_dynamic @ setpos_exact 7301.75 3237.04 486

	Un-solidified prop_dynamic @ setpos_exact 7300.86 2906.02 486

	Un-solidified prop_dynamic @ setpos_exact 7539.75 3601.04 486

	Un-solidified prop_dynamic @ setpos_exact 7727.75 3601.04 486

	Un-solidified prop_dynamic @ setpos_exact 7915.88 3601.01 486

	Un-solidified prop_dynamic @ setpos_exact 7859.87 3739.32 230.068

	Un-solidified prop_dynamic @ setpos_exact 7917 2905 486

	Un-solidified prop_dynamic @ setpos_exact 7728 2906 486

	Un-solidified prop_dynamic @ setpos_exact 7540 2906 486

	Un-solidified prop_dynamic @ setpos_exact 7302 3601 486

	Un-solidified ALL props with model: "models/props/de_nuke/IndustrialLight01.mdl"

Survival:

	Clip "_survival_vendors" blocks Survivors @ setpos_exact 7406 3769 381.4

------------------------------------------------------------------------------------------------------------------------

NO MERCY - SEWER || c8m3_sewers

All:

	Clip "_commonhop_trashbags" blocks Survivors @ setpos_exact 10693 5279 17

	Clip "_clipextend_roofandfence" blocks Survivors @ setpos_exact 10525 6365 24

	Clip "_filecabinet_hole" blocks Survivors @ setpos_exact 10928 8208 292

	Clip "_window_ricky" blocks Survivors @ setpos_exact 13680 11132 208

	Clip "_commonhop_trimescape" blocks Survivors @ setpos_exact 14240 11137 208

	Clip "_permstuck_semitrailer" blocks Infected @ setpos_exact 13349 11144 24

	Clip "_booster_escapeladder" blocks Survivors @ setpos_exact 14680 13819 255

	Clip "_nav_garagewindow1" blocks Everyone @ setpos_exact 12044 5900 19

	Clip "_nav_garagewindow2" blocks Everyone @ setpos_exact 11928 5948 19

	Clip "_unattackable_wrongway1" blocks Survivors @ setpos_exact 11030 4601 560

	Clip "_unattackable_wrongway2" blocks Survivors @ setpos_exact 12264 4532 468

	Clip "_unattackable_wrongway3" blocks Survivors @ setpos_exact 13003 5742 568

	Clip "_unattackable_hospital1" blocks Survivors @ setpos_exact 12473 12235 457

	Clip "_unattackable_hospital2" blocks Survivors @ setpos_exact 12473 11475 457

	Clip "_unattackable_hospital3" blocks Survivors @ setpos_exact 13890 10833 464

	Clip "_unattackable_hospital4" blocks Survivors @ setpos_exact 14791 11454 608

	Clip "_clipextend_alley" blocks Survivors @ setpos_exact 12774 8347 432

	Clip "_clipextend_warehouse1" blocks Survivors @ setpos_exact 10742 7529 843

	Clip "_clipextend_warehouse2" blocks Survivors @ setpos_exact 11795 7941 800

	trigger_auto_crouch "_duckqol_warehousevent" created @ setpos_exact 12712 8148 304

	Clip "_gasstationroof_TMP" blocks Survivors @ setpos_exact 12186 6694 324

	Clip "_ladderqol_scissorlift" blocks Everyone initially disabled @ setpos_exact 12687 7171 16

	LOGIC:	TMP Gas Station roof clip will be deleted when it explodes.

	MOVER:	Clip "_ladderqol_scissorlift" simulated to move up with Scissor Lift.

PvP:

	LOGIC:	TMP shortcut booster clips will be deleted when Scissor Lift is started.
		Caution: Do not delete this logic otherwise the clips are gamebreakers.

	Clip "_shortcut_booster_TMP1" blocks Survivors @ setpos_exact 10897 6764 176

	Clip "_shortcut_booster_TMP2" blocks Survivors @ setpos_exact 11032 7048 252

	Deleted ([1395] func_brush) @ setpos_exact 10528 6170.91 62.5938

	Deleted ([1394] func_brush) @ setpos_exact 10528 6558.31 62.5938

	Deleted ([1426] func_brush) @ setpos_exact 14794 11567.2 625.313

	Deleted func_playerinfected_clip @ setpos_exact 14778 11135 607

	Deleted func_playerinfected_clip @ setpos_exact 13319 10275 745

	Deleted func_playerinfected_clip @ setpos_exact 10503 5935 7

	Deleted func_playerinfected_clip @ setpos_exact 12695 6679 799

	Tank/Charger chokepoint atomizer created @ setpos_exact 12695 8149 16

	Tank/Charger chokepoint atomizer created @ setpos_exact 14272 11613 -20

	Tank/Charger chokepoint atomizer created @ setpos_exact 14272 11613 -30

	Tank/Charger chokepoint atomizer created @ setpos_exact 14272 11613 -10

	Brush "_losfix_copcar" created @ setpos_exact 10222 5963 16

	Brush "_losfix_gasstation_los" created @ setpos_exact 12659 6089 312

	Brush "_losfix_pipes" created @ setpos_exact 13490 7744.5 -249

	Brush "_losfix_semi" created @ setpos_exact 11906 6664 30

	Brush "_losfix_sewage_tank1a" created @ setpos_exact 13472 8306 -251

	Brush "_losfix_sewage_tank1b" created @ setpos_exact 13472 7893 -251

	Brush "_losfix_sewage_tank2a" created @ setpos_exact 13042 7891 -251

	Brush "_losfix_sewage_tank2b" created @ setpos_exact 13042 8120 -251

	Brush "_losfix_sewage_tank2c" created @ setpos_exact 13040 8300 -251

	Clip "_burgerfence_blocker1" blocks Infected @ setpos_exact 10137 6395 8

	Clip "_burgerfence_blocker2" blocks Infected @ setpos_exact 10137 6395 8

	Clip "_burgerfence_blocker3" blocks Infected @ setpos_exact 10137 6395 8

	Clip "_ladder_burgerfenceshared_clip" blocks Infected @ setpos_exact 10521 6386 8

	Clip "_ladder_scissormini_clipleft" blocks Everyone @ setpos_exact 12044 7545 323

	Clip "_ladder_scissormini_clipright" blocks Everyone @ setpos_exact 12094 7545 323

	Clip "_ladder_warehousealley_clip" blocks Everyone @ setpos_exact 12789 8317 48

	Clip "_losfix_gasstation_coll" blocks Infected @ setpos_exact 12659 6089 312

	Clip "_meticulous_funcinfclip01" blocks Infected @ setpos_exact 15184 11445 608

	Clip "_meticulous_funcinfclip02" blocks Infected @ setpos_exact 14964 11156 736

	Clip "_meticulous_funcinfclip03" blocks Infected @ setpos_exact 13584 10754 746

	Clip "_waterworks_blocker" blocks Infected @ setpos_exact 13008 7408 800

	Clip "_waterworks_collision" blocks Infected @ setpos_exact 12761 7407 857

	LADDER: _ladder_brickapartment_cloned_unusedmercyback

	LADDER: _ladder_gasstationfence_cloned_warehousepipe

	LADDER: _ladder_overturnedsemiB_cloned_nodrawfence

	LADDER: _ladder_overturnedsemiT_cloned_sewerdropB

	LADDER: _ladder_sewerup1_cloned_uppershafts

	LADDER: _ladder_sewerup2_cloned_uppershafts

	LADDER: _ladder_startpawnrear_cloned_warehousepipe

	LADDER: _ladder_warehousealley_cloned_endminialley

	LADDER: _ladder_warehouseexittall_cloned_unusedmercyback

	LADDER: _ladder_warehousemiddleB_cloned_endminialley

	LADDER: _ladder_warehousemiddleT_cloned_burgerentrance

	LADDER: _ladder_warehouserightboxes_cloned_mercyside

	LADDER: _ladder_warehousewindow_cloned_endminialley

	Static prop "_burgerfence_wrongwaya" W/ "models/props_misc/wrongway_sign01_optimized.mdl" @ setpos_exact 10357 7000 65

	Static prop "_burgerfence_wrongwayb" W/ "models/props_misc/wrongway_sign01_optimized.mdl" @ setpos_exact 10057 7000 65

	Static prop "_burgerfence_wrongwayc" W/ "models/props_misc/wrongway_sign01_optimized.mdl" @ setpos_exact 9757 7000 65

	Static prop "_ladder_scissormini_pipeB" W/ "models/props_mill/pipeset08d_64_001a.mdl" @ setpos_exact 12070 7541 351

	Static prop "_ladder_scissormini_pipeT" W/ "models/props_mill/pipeset08d_64_001a.mdl" @ setpos_exact 12070 7541 405

	Static prop "_permstuck_dumpsterspool" W/ "models/props_industrial/wire_spool_02.mdl" @ setpos_exact 10419 6513 45

	Static prop "_propladder_gasstation" W/ "models/props_rooftop/acvent02.mdl" @ setpos_exact 12766 6626 320

	Static prop "_waterworks_wrongwaya" W/ "models/props_misc/wrongway_sign01_optimized.mdl" @ setpos_exact 13004 6822 855

	Static prop "_waterworks_wrongwayb" W/ "models/props_misc/wrongway_sign01_optimized.mdl" @ setpos_exact 13004 7122 855

	Static prop "_waterworks_wrongwayc" W/ "models/props_misc/wrongway_sign01_optimized.mdl" @ setpos_exact 13004 7422 855

	Static prop "_waterworks_wrongwayd" W/ "models/props_misc/wrongway_sign01_optimized.mdl" @ setpos_exact 13004 7722 855

	Static prop "_waterworks_wrongwaye" W/ "models/props_misc/wrongway_sign01_optimized.mdl" @ setpos_exact 12914 7765 855

	VIS:	Infected ladder "_scissormini" parented to its pipe to force render.

	LADDER: _ladder_scissormini_cloned_sewerdropB

	LOGIC:	Gas Station explosion will spawn a new Infected ladder.

	LADDER: _ladder_gasdynamictop_cloned_burgerbackm

	LADDER: _ladder_gasdynamicbot_cloned_burgerbackm

Survival:

	LOGIC:	Gas Station explosion will alternatively start Survival timer.

------------------------------------------------------------------------------------------------------------------------

NO MERCY - HOSPITAL || c8m4_interior

All:

	Clip "_permstuck_cabinetchair" blocks Everyone @ setpos_exact 11935 13061 312

	Clip "_witch_windows" blocks Survivors @ setpos_exact 12909 12360 320

	Clip "_booster_skylights" blocks Survivors @ setpos_exact 12550 12112 448

	Clip "_nav_elevatorbutton" blocks Survivors @ setpos_exact 13491 15103 493

	Clip "_counterweight_edging" blocks Survivors @ setpos_exact 13144 15243 5526

	FIX:	Lower and upper elevator doors will no longer break if SI spawn inside them.

	FIX:	Upper generator prop made immovable until Survivors reach top of elevator.

PvP:

	Deleted ([894] prop_physics) @ setpos_exact 13248 14320 553.625

	Deleted ([1102] prop_physics) @ setpos_exact 13056 14416 553.625

	Brush "_losfix_icucurtain1_los" created @ setpos_exact 11936 14463 424

	Brush "_losfix_icucurtain2_los" created @ setpos_exact 11936 14575 424

	Brush "_losfix_icucurtain3_los" created @ setpos_exact 11936 14687 424

	Brush "_losfix_icucurtain4_los" created @ setpos_exact 11936 14799 424

	Brush "_losfix_icucurtain5_los" created @ setpos_exact 11936 14911 424

	Clip "_losfix_icucurtain1_coll" blocks Everyone @ setpos_exact 11936 14463 424

	Clip "_losfix_icucurtain2_coll" blocks Everyone @ setpos_exact 11936 14575 424

	Clip "_losfix_icucurtain3_coll" blocks Everyone @ setpos_exact 11936 14687 424

	Clip "_losfix_icucurtain4_coll" blocks Everyone @ setpos_exact 11936 14799 424

	Clip "_losfix_icucurtain5_coll" blocks Everyone @ setpos_exact 11936 14911 424

	Clip "_yesdrawskylight_clipwaya" blocks Infected @ setpos_exact 11912 12204 448

	Clip "_yesdrawskylight_clipwayb" blocks Infected @ setpos_exact 12416 11904 448

	Clip "_yesdrawskylight_clipwayc" blocks Infected @ setpos_exact 12920 12204 448

	LADDER: _ladder_skylighthanglight_cloned_shortestvent

	LADDER: _ladder_ventceiling02left_cloned_sinkvent

	LADDER: _ladder_ventceiling03right_cloned_sinkvent

	Static prop "_ventceiling02_static" W/ "models/props_vents/VentBreakable01_DM01_Frame.mdl" @ setpos_exact 13248 14320 554

	Static prop "_yesdrawskylight_acvent1" W/ "models/props_rooftop/acvent03.mdl" @ setpos_exact 12343 12237 448

	Static prop "_yesdrawskylight_acvent2" W/ "models/props_rooftop/acvent03.mdl" @ setpos_exact 12343 12365 448

	Static prop "_yesdrawskylight_hanginglight1" W/ "models/props/cs_office/Light_shop.mdl" @ setpos_exact 12348.2 12200.3 373

	Static prop "_yesdrawskylight_hanginglight2" W/ "models/props/cs_office/Light_shop.mdl" @ setpos_exact 12380 12758 373

	Static prop "_yesdrawskylight_hanginglight3" W/ "models/props/cs_office/Light_shop.mdl" @ setpos_exact 12380 12911 373

	Static prop "_yesdrawskylight_roof" W/ "models/props_update/c8m4_skylight_rooftop.mdl" @ setpos_exact 12416 12216 447

	Static prop "_yesdrawskylight_wrongway1" W/ "models/props_misc/wrongway_sign01_optimized.mdl" @ setpos_exact 11903.5 12326.2 511.365

	Static prop "_yesdrawskylight_wrongway2" W/ "models/props_misc/wrongway_sign01_optimized.mdl" @ setpos_exact 11903.5 12070.2 511.365

	Static prop "_yesdrawskylight_wrongway3" W/ "models/props_misc/wrongway_sign01_optimized.mdl" @ setpos_exact 12117.5 11902.2 511.365

	Static prop "_yesdrawskylight_wrongway4" W/ "models/props_misc/wrongway_sign01_optimized.mdl" @ setpos_exact 12415.5 11902.2 511.365

	Static prop "_yesdrawskylight_wrongway5" W/ "models/props_misc/wrongway_sign01_optimized.mdl" @ setpos_exact 12713.5 11902.2 511.365

	Static prop "_yesdrawskylight_wrongway6" W/ "models/props_misc/wrongway_sign01_optimized.mdl" @ setpos_exact 12927.5 12070.2 511.365

	Static prop "_yesdrawskylight_wrongway7" W/ "models/props_misc/wrongway_sign01_optimized.mdl" @ setpos_exact 12927.5 12326.2 511.365

	Static prop "_ventceiling03_static" W/ "models/props_vents/VentBreakable01.mdl" @ setpos_exact 13090 14416 520

	QOL:	The breakable railings in the cafeteria have had their health reduced for Versus-only QoL.

	Logic modified for elevator fall-through fix
	Clip "_elevator_tabbernaut" blocks Survivors @ setpos_exact 13541 15357 5543

	Clip "_elevator_infectdump" blocks Infected initially disabled @ setpos_exact 13541 15357 5619

------------------------------------------------------------------------------------------------------------------------

NO MERCY - ROOFTOP || c8m5_rooftop

All:

	Decal "decals/decalstain002a" painted @ setpos_exact 6480 8794 6161

	Decal "decals/prodconcrete05" painted @ setpos_exact 7281 8960 6191

	Decal "decals/debris_concrete001a" painted @ setpos_exact 7283 8926 6088

	Decal "decals/prodconcrete04" painted @ setpos_exact 5942 9424 5983

	Decal "decals/infstains" painted @ setpos_exact 6188 7616 5967

	Clip "_charger_smoother_01" blocks Everyone @ setpos_exact 7932 8496 5780

	Clip "_charger_smoother_02" blocks Everyone @ setpos_exact 7804 8058 5780

	Clip "_charger_smoother_03" blocks Everyone @ setpos_exact 7804 8974 5780

	Clip "_charger_smoother_04" blocks Everyone @ setpos_exact 7877 8795 5780

	Clip "_charger_smoother_05" blocks Everyone @ setpos_exact 7273 9436 5780

	Clip "_charger_smoother_06" blocks Everyone @ setpos_exact 7273 7780 5780

	Clip "_charger_smoother_07" blocks Everyone @ setpos_exact 5421 7780 5780

	Clip "_charger_smoother_08" blocks Everyone @ setpos_exact 4996 8496 5780

	Clip "_charger_smoother_09" blocks Everyone @ setpos_exact 5124 8962 5780

	Clip "_charger_smoother_10" blocks Everyone @ setpos_exact 5124 8042 5780

	Clip "_charger_smoother_11" blocks Everyone @ setpos_exact 5049 8798 5780

	Clip "_charger_smoother_12" blocks Everyone @ setpos_exact 5066 8188 5780

	Clip "_charger_smoother_13" blocks Everyone @ setpos_exact 5418 9228 5780

	Clip "_charger_smoother_14" blocks Everyone @ setpos_exact 6112 9644 5652

	Clip "_charger_smoother_15" blocks Everyone @ setpos_exact 6988 9462 5652

	Clip "_charger_smoother_16" blocks Everyone @ setpos_exact 5556 9386 5652

	Clip "_charger_smoother_17" blocks Everyone @ setpos_exact 5666 9572 5652

	Clip "_charger_smoother_18" blocks Everyone @ setpos_exact 6897 9557 5652

	Clip "_charger_smoother_19" blocks Everyone @ setpos_exact 6988 7570 5652

	Clip "_charger_smoother_20" blocks Everyone @ setpos_exact 6875 7434 5652

	Clip "_charger_smoother_21" blocks Everyone @ setpos_exact 6114 7364 5652

	Clip "_charger_smoother_22" blocks Everyone @ setpos_exact 5649 7449 5652

	Clip "_charger_smoother_23" blocks Everyone @ setpos_exact 5556 7630 5652

	Clip "_charger_smoother_24" blocks Everyone @ setpos_exact 5816 7780 5780

	Clip "_charger_smoother_25" blocks Everyone @ setpos_exact 5816 9228 5780

	Clip "_charger_smoother_26" blocks Everyone @ setpos_exact 7861 8193 5780

	Clip "_railing_rampright" blocks Everyone @ setpos_exact 5473 8478 6000

	Clip "_railing_rampleft" blocks Everyone @ setpos_exact 5567 8478 6000

PvP:

	Brush "_losfix_pipes1" created @ setpos_exact 5830 8147 6055.36

	Brush "_losfix_pipes2" created @ setpos_exact 5982 8852 6055.36

	Clip "_ladder_helipadcosmetic_clip" blocks Everyone @ setpos_exact 7288 8968 6206

	Clip "_ladder_missingpiece_clipl" blocks Everyone @ setpos_exact 6460 7911 5772

	Clip "_ladder_missingpiece_clipr" blocks Everyone @ setpos_exact 6462 7951 5772

	LADDER: _ladder_deathchargenew_cloned_deathcharge

	LADDER: _ladder_deathjockeynew_cloned_deathjockey

	LADDER: _ladder_helipadclimbable_cloned_satelliteyellow

	LADDER: _ladder_helipadcosmetic_cloned_deathcharge

	LADDER: _ladder_missingpiece_cloned_northgutter

	LADDER: _ladder_saferoomlulz_cloned_rooftopmain

	LADDER: _ladder_startstairwell_cloned_deathjockey

	LADDER: _ladder_transformer1_cloned_deathcharge

	LADDER: _ladder_transformer2_cloned_deathcharge

	LADDER: _ladder_transformer3_cloned_deathjockey

	LADDER: _ladder_transformer4_cloned_deathcharge

	LADDER: _ladder_transformer5_cloned_deathjockey

	LADDER: _ladder_uponewayside_cloned_longshaft

	Static prop "_ladder_missingpiece_pipe" W/ "models/props_rooftop/Gutter_Pipe_256.mdl" @ setpos_exact 6464 7933 5952

	Static prop "_ladder_startstairwell_pipe" W/ "models/props_pipes/PipeSet02d_512_001a.mdl" @ setpos_exact 5421 8586 5587.8

	Static prop "_ladder_transformer5_patch" W/ "models/props_pipes/PipeSet32d_256_001a.mdl" @ setpos_exact 6340 8757 5784

	Static prop "_ladder_uponewayside_pipe" W/ "models/props_pipes/pipeset02d_512_001a.mdl" @ setpos_exact 7553 9100 5950

Coop:

	LADDER: _ladder_saferoomlulz_cloned_rooftopmain

Scavenge:

	SCAV:	Deleted named safe door to no longer disconnect tongues when in CHECKPOINT.

	SCAV:	Spawned physics clip to prevent can falling through displacement.

	Clip "_dispcollision_rooftop" blocks All and Physics @ setpos_exact 6825 9535 5612

------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------

CRASH COURSE - THE ALLEYS || c9m1_alleys

All:

	Clip "_allmodes_griefrooma" blocks Survivors @ setpos_exact 156 -6648 -22

	Clip "_allmodes_griefroomb" blocks Survivors @ setpos_exact 28 -6652 -22

	Clip "_cliprework_rooftop01" blocks Survivors @ setpos_exact -5434 -9392 336

	Clip "_cliprework_rooftop02" blocks Survivors @ setpos_exact -4864 -9722 352

	Clip "_commonhop_window" blocks Survivors @ setpos_exact -4480 -10632 144

	Clip "_clipgap_alley" blocks Survivors @ setpos_exact -4295 -8320 256

	Clip "_curvejump_van" blocks Survivors @ setpos_exact -3311 -4407 -345

	Clip "_cliprework_mirrorwarehouse" blocks Everyone @ setpos_exact -5412 -10506 64

	Clip "_permstuck_treea" blocks Everyone @ setpos_exact -3520 -4949 -242

	Clip "_permstuck_treeb" blocks Everyone @ setpos_exact -2656 -4782 -300

	Clip "_permstuck_treec" blocks Everyone @ setpos_exact -865 -6583 -17

	Clip "_permstuck_treed" blocks Everyone @ setpos_exact -577 -7055 -23

	Clip "_curvejump_railing" blocks Survivors @ setpos_exact -1714 -1650 64

	Clip "_cliprework_noladders" blocks Survivors @ setpos_exact -7976 -10924 208

	Clip "_solidify_acunit" blocks Everyone @ setpos_exact -708 -1224 23

	Clip "_commonhop_van" blocks Survivors @ setpos_exact -2312 -9675 155

	Clip "_booster_trafficlighta" blocks Survivors @ setpos_exact -1420 -7002 230

	Clip "_booster_trafficlightb" blocks Survivors @ setpos_exact -1364 -6902 367

	Clip "_booster_trafficlightc" blocks Survivors @ setpos_exact -1094 -6917 309

	Clip "_booster_trafficlightd" blocks Survivors @ setpos_exact -1242 -6515 309

	Clip "_booster_acunit" blocks Survivors @ setpos_exact -1631 -6152 304

	Clip "_booster_brokenframe" blocks Survivors @ setpos_exact -1965 -6409 414

	Clip "_booster_rentsign" blocks Survivors @ setpos_exact -1648 -5552 291

	Clip "_booster_enginecar" blocks Survivors @ setpos_exact -1982 -7055 465

	Clip "_booster_telepole1" blocks Survivors @ setpos_exact -1111 -6480 694

	Clip "_booster_telepole2" blocks Survivors @ setpos_exact 50 -5432 464

	Clip "_clipgap_survivoronly" blocks Survivors @ setpos_exact 1428 -4936 -144

	LOGIC:	Bile anti-skip made 2 breakwalls indestructible until howitzer fires.

PvP:

	Tank/Charger chokepoint atomizer created @ setpos_exact -6392 -10719 64

	Tank/Charger chokepoint atomizer created @ setpos_exact -10312 -9907 0

	Brush "_losfix_ambulance" created @ setpos_exact -1431 -4449 71

	Brush "_losfix_boxcar" created @ setpos_exact -7360 -10074 2

	Brush "_losfix_shelf1" created @ setpos_exact -5331 -10944 69

	Brush "_losfix_shelf2" created @ setpos_exact 561 -2002 -171

	Clip "_ladder_aftertanker_clipleft" blocks Everyone @ setpos_exact -2248 -5372 -224

	Clip "_ladder_aftertanker_clipright" blocks Everyone @ setpos_exact -2292 -5372 -224

	Clip "_ladder_dualwindowshared_clip" blocks Infected + AI @ setpos_exact -7960 -10924 191

	Clip "_solidify_acunit" blocks Everyone @ setpos_exact -708 -1224 23

	LADDER: _ladder_aftertankerB_cloned_flatnosetruck

	LADDER: _ladder_aftertankerT_cloned_flatnosetruck

	LADDER: _ladder_armybarricadeleftfront_cloned_armybarricadeleftback

	LADDER: _ladder_deliveryfence_cloned_extrabarricade

	LADDER: _ladder_dualwindowleft_cloned_startacunit

	LADDER: _ladder_dualwindowright_cloned_startacunit

	LADDER: _ladder_eventsemitrailer_cloned_semitrailerleft

	LADDER: _ladder_firebarrelleft_cloned_firebarrelright

	LADDER: _ladder_gooddeliveryvan_cloned_fencedinstart

	LADDER: _ladder_parkourpipeB_cloned_stainedfence

	LADDER: _ladder_parkourpipeT_cloned_endbackfence

	LADDER: _ladder_parkourtruck_cloned_truckpassage

	LADDER: _ladder_semifenceleft_cloned_endbackfence

	LADDER: _ladder_semifenceright_cloned_endbackfence

	LADDER: _ladder_semitrailerright_cloned_semitrailerleft

	LADDER: _ladder_shortvanqol_cloned_shortwarehouse

	LADDER: _ladder_wreckedboxcar_cloned_bridgesemitrailer

	LADDER: _ladder_yesdrawwindow_cloned_boxwreckback

	Static prop "_yesdrawwindow_surface" W/ "models/props_update/c9m1_nodraw_window.mdl" @ setpos_exact -4350.5 -10816 192

	Ladder found @ "-5432 -11009 224" and shifted w/ offset @ "-450 0 0"

	Ladder found @ "-7056 -11023 140" and shifted w/ offset @ "360 0 0"

	Navmesh modified w/ CHECKPOINT @ setpos_exact 337 -1550 -176

	PROP:	Dumpster near "_ladder_yesdrawwindow" moved to improve accessibility.

	Deleted ([344] prop_physics) @ setpos_exact -4433.78 -10580.1 1.875

	Physics prop "_replacement_dumpster" W/ "models/props_junk/dumpster.mdl" @ setpos_exact -4392 -10597 5

	LOGIC:	Lowered health of 4 breakwalls from 8.3 scratches to 5 scratches.

	KILL:	Deleted 5 func_brush wooden planks and 5 func_brush entry blockers.

	Deleted func_playerinfected_clip @ setpos_exact -7665 -9729 7

	Deleted func_playerinfected_clip @ setpos_exact -6385 -10577 63

	Deleted func_playerinfected_clip @ setpos_exact -4097 -8961 -1

	Deleted func_playerinfected_clip @ setpos_exact -3761 -6081 15

	Deleted func_playerinfected_clip @ setpos_exact 871 -6561 -145

------------------------------------------------------------------------------------------------------------------------

CRASH COURSE - THE TRUCK DEPOT FINALE || c9m2_lots

All:

	Clip "_commonhop_windowsa" blocks Survivors @ setpos_exact 6850 7040 268

	Clip "_commonhop_windowsb" blocks Survivors @ setpos_exact 7328 6850 268

	Clip "_permstuck_treea" blocks Everyone @ setpos_exact 973 -1632 -231

	Clip "_permstuck_treeb" blocks Everyone @ setpos_exact 5050.6 2458.2 -106.6

	Clip "_permstuck_treec" blocks Everyone @ setpos_exact 3516 616 -198.6

	Clip "_permstuck_treed" blocks Everyone @ setpos_exact 3845 1192 -141

	Clip "_permstuck_treee" blocks Everyone @ setpos_exact 2257 2997 -70.4

	Clip "_permstuck_treef" blocks Everyone @ setpos_exact 2054 4320 25.8

	Clip "_permstuck_treeg" blocks Everyone @ setpos_exact 6724 7421 62.2

	Clip "_cliprework_rooftop" blocks Survivors @ setpos_exact 4118 886 288

	Clip "_cliprework_unattackable" blocks Survivors @ setpos_exact 6246 1852 29

	Clip "_cliprework_tracka" blocks Survivors @ setpos_exact 5437 -52 206.3

	Clip "_cliprework_trackb" blocks Survivors @ setpos_exact 5437.3 5128 385

	Clip "_clipgap_fence" blocks Survivors @ setpos_exact 5791 8132 65.8

	Clip "_booster_rollupdoors" blocks Survivors @ setpos_exact 6541 5853 250

	Clip "_booster_rollupdoor" blocks Survivors @ setpos_exact 7040 6836 280

	Clip "_booster_liftframes" blocks Survivors @ setpos_exact 7844 6657 371.3

	Clip "_booster_boxtop" blocks Survivors @ setpos_exact 8479 5823 304.9

	Clip "_booster_elecbox" blocks Survivors @ setpos_exact 7548 5412 434

	Clip "_booster_ventpipe" blocks Survivors @ setpos_exact 7535 6160 495

	Clip "_nav_jump_semitrailer" blocks Survivors @ setpos_exact 5756 1062 -32

	Clip "_nav_jump_cargowindow" blocks Survivors @ setpos_exact 2044 3030 49

	Clip "_booster_armoredtop" blocks Survivors @ setpos_exact 7838 6366 449

	trigger_playermovement "_duckqol_finalevent" with Option Duck @ setpos_exact 7568 7392 447

	LOGIC:	Finale switch will re-Lock when all Survivors aren't inside trigger.

	LOGIC:	Point-of-no-return clip will be Enabled when finale switch is full.

	Clip "_point_of_no_return" blocks Survivors initially disabled @ setpos_exact 5750 7177 368

PvP:

	Brush "_losfix_gen1a" created @ setpos_exact 6853 5881 50

	Brush "_losfix_gen1b" created @ setpos_exact 6837 5885 50

	Brush "_losfix_gen2a" created @ setpos_exact 7498 6786 55

	Brush "_losfix_gen2b" created @ setpos_exact 7484 6779 55

	Brush "_losfix_semi1a" created @ setpos_exact 4519 -91 -206

	Brush "_losfix_semi1b" created @ setpos_exact 4477 -121 -206

	Brush "_losfix_semi2" created @ setpos_exact 3560 4539 10

	LADDER: _ladder_armybusfront_cloned_finalebus

	LADDER: _ladder_backfenceright_cloned_backfenceleft

	LADDER: _ladder_bluecontainerplus_cloned_bluecontainer

	LADDER: _ladder_buggycullfix_cloned_bluecontainer

	LADDER: _ladder_containeryardsemi_cloned_metalsupplysemi

	LADDER: _ladder_crashedbus_cloned_finalebus

	LADDER: _ladder_finaleshelffront_cloned_finaleshelfback

	LADDER: _ladder_permstuck_cloned_finalecornerfence

	LADDER: _ladder_startareasemi_cloned_metalsupplysemi

	LADDER: _ladder_startfenceright_cloned_startfenceleft

	LADDER: _ladder_startroofbrick_cloned_startroofpipe

	LADDER: _ladder_warehousesemi_cloned_metalsupplysemi

	LADDER: _ladder_whitecontainer_cloned_bluecontainer

	Static prop "_solidify_startacvent1" W/ "models/props_rooftop/acvent01.mdl" @ setpos_exact -99.0076 -574.692 310.902

	Static prop "_solidify_startacvent2" W/ "models/props_rooftop/acvent01.mdl" @ setpos_exact -99.2042 -750.692 310.934

	KILL:	Deleted 7 func_brush wooden planks and 7 func_brush entry blockers.

	Deleted func_playerinfected_clip @ setpos_exact 2575 -1105 -217

	Deleted func_playerinfected_clip @ setpos_exact 4367 511 -217

	Deleted func_playerinfected_clip @ setpos_exact 6143 959 -145

	Deleted func_playerinfected_clip @ setpos_exact 4335 1583 -65

	Deleted func_playerinfected_clip @ setpos_exact 2559 2495 -113

	Deleted func_playerinfected_clip @ setpos_exact 2959 4751 47

	Deleted func_playerinfected_clip @ setpos_exact 4607 5631 95

------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------

DEATH TOLL - THE TURNPIKE || c10m1_caves

All:

	Clip "_dispcrouch_hardone" blocks Everyone @ setpos_exact -11790 -12821 -65

	Clip "_booster_funnel" blocks Survivors @ setpos_exact -12976 -12262 100

	Clip "_curvejump_rocky" blocks Survivors @ setpos_exact -13152 -11044 60.6

	Clip "_cliprework_hillside01" blocks Survivors @ setpos_exact -11849.1 -10286.1 504.3

	Clip "_cliprework_hillside02" blocks Survivors @ setpos_exact -10597.5 -10811 848.5

	Clip "_unattackable_tunnelsolidify" blocks Survivors @ setpos_exact -12367 -9747 496

	Clip "_dispcrouch_popular" blocks Everyone @ setpos_exact -10569 -11466 -510

	Clip "_dispcrouch_unknown" blocks Everyone @ setpos_exact -10812 -11821 -507

	Clip "_dispcrouch_endarea" blocks Everyone @ setpos_exact -11880 -6636 -24

	Clip "_cliprework_dispcrouch_1a" blocks Survivors @ setpos_exact -13714 -12191 142

	Clip "_cliprework_dispcrouch_1b" blocks Everyone @ setpos_exact -13714 -12191 142

	Clip "_cliprework_dispcrouch_2a" blocks Survivors @ setpos_exact -14360 -11744 142

	Clip "_cliprework_dispcrouch_2b" blocks Everyone @ setpos_exact -14360 -11744 142

	Clip "_cliprework_dispcrouch_endarea1" blocks Everyone @ setpos_exact -11066 -5132 -84

	Clip "_cliprework_dispcrouch_endarea2" blocks Everyone @ setpos_exact -10896 -5942 5

	Clip "_permstuck_endrocktree" blocks Infected @ setpos_exact -10228 -5209 388

	Clip "_permstuck_endrockcorner" blocks Everyone @ setpos_exact -11277 -6770 193

	Clip "_dispcrouch_endrocktinytop" blocks Everyone @ setpos_exact -11216 -6525 62

	Clip "_dispcrouch_endrockparkour" blocks Everyone @ setpos_exact -12284 -6439 147

	Static prop "_crashcourse_armoredvan_glass" W/ "models/props_vehicles/deliveryvan_armored_glass.mdl" @ setpos_exact -11274 -15292 -150.2

	Static prop "_crashcourse_armoredvan" W/ "models/props_vehicles/deliveryvan_armored.mdl" @ setpos_exact -11274 -15292 -150.2

PvP:

	Deleted func_playerinfected_clip @ setpos_exact -12961 -9825 319

	Deleted func_playerinfected_clip @ setpos_exact -12017 -10977 -513

	Deleted func_playerinfected_clip @ setpos_exact -11929 -11177 -513

	Brush "_losfix_semi" created @ setpos_exact -12260 -11102 -49

	Brush "_losfix_van1" created @ setpos_exact -12318 -8360 -56

	Brush "_losfix_van2" created @ setpos_exact -12990 -6644 -56

	Clip "_ladder_bridgetunnel_backboard" blocks Everyone @ setpos_exact -12348 -9814 272

	Clip "_ladder_bridgetunnel_clip" blocks Everyone @ setpos_exact -12617 -9856 -50

	Clip "_meticulous_funcinfclip01" blocks Infected @ setpos_exact -12353 -9664 496

	Clip "_meticulous_funcinfclip02" blocks Infected @ setpos_exact -11980 -9735 496

	Clip "_meticulous_funcinfclip03" blocks Infected @ setpos_exact -12031 -9735 496

	Clip "_meticulous_funcinfclip04" blocks Infected @ setpos_exact -12975 -9745 496

	Clip "_yesdrawcliff_clip1" blocks Infected @ setpos_exact -11472 -10279 496

	Clip "_yesdrawcliff_clip2" blocks Infected @ setpos_exact -10881 -10752 496

	LADDER: _ladder_bridgetunnelB1_cloned_endfencedumpster

	LADDER: _ladder_bridgetunnelB2_cloned_endfencesafehouse

	LADDER: _ladder_bridgetunnelT_cloned_firsttunnelhole

	LADDER: _ladder_trafficlightB_cloned_secondtunnelhole

	LADDER: _ladder_trafficlightT_cloned_secondtunnelhole

	Static prop "_bridgetunnel_wrongway" W/ "models/props_misc/wrongway_sign01_optimized.mdl" @ setpos_exact -11988 -9752 544

	Static prop "_yesdrawcliff_rocks1" W/ "models/props_wasteland/rock_cliff01.mdl" @ setpos_exact -11723 -9966 520

	Static prop "_yesdrawcliff_rocks2" W/ "models/props_wasteland/rock_cliff01.mdl" @ setpos_exact -11429 -10350 520

	trigger_playermovement "_duckqol_trafficlight" with Option Duck @ setpos_exact -12158 -9866 60

------------------------------------------------------------------------------------------------------------------------

DEATH TOLL - THE DRAINS || c10m2_drainage

All:

	Clip "_commonhop_cisterntunnela" blocks Survivors @ setpos_exact -9477 -7279 -308

	Clip "_commonhop_cisterntunnelb" blocks Survivors @ setpos_exact -9872 -6886 -308

	Clip "_commonhop_bagstoroof" blocks Survivors @ setpos_exact -7118 -6111 351

	Clip "_bunnyhop_endwindow" blocks Survivors @ setpos_exact -7998 -6007 -48

	Clip "_commonhop_pipe" blocks Survivors @ setpos_exact -8044 -7280 -408

	Clip "_unattackable_pipea" blocks Survivors @ setpos_exact -7790 -8110 -388

	Clip "_unattackable_pipeb" blocks Survivors @ setpos_exact -8339 -9043 -388

	Clip "_unattackable_pipec" blocks Survivors @ setpos_exact -9144 -9043 -388

	Clip "_cliprework_commonhop" blocks Survivors @ setpos_exact -6452 -6008 136

	Clip "_nav_electricalbox" blocks Survivors @ setpos_exact -10806 -8537 -347

	Clip "_unattackable_debrisfall" blocks Survivors @ setpos_exact -9870 -8168 -180

	Clip "_cliprework_cisternroof" blocks Survivors @ setpos_exact -9860 -7288 -98

	Clip "_cliprework_endrooftop1" blocks Survivors @ setpos_exact -6448 -6730 620

	Clip "_cliprework_endrooftop2" blocks Survivors @ setpos_exact -7500 -5634 256

	Clip "_nav_cistern_anomaly" blocks Survivors @ setpos_exact -9859 -7064 -221

	Clip "_nav_cistern_highpipe1" blocks Survivors @ setpos_exact -9935 -6961 -191

	Clip "_nav_cistern_highpipe2" blocks Survivors @ setpos_exact -9812 -6957 -169

	Clip "_nav_cistern_highpipe3" blocks Survivors @ setpos_exact -9533 -7217 -169

	Clip "_nav_cistern_tunnelexit" blocks Survivors @ setpos_exact -9872 -7669 -219

	Clip "_nav_cistern_angpipe1" blocks Survivors @ setpos_exact -9988 -7555 -229

	Clip "_nav_cistern_angpipe2" blocks Survivors @ setpos_exact -10155 -7450 -229

	Clip "_nav_cistern_angpipe3" blocks Survivors @ setpos_exact -10166 -7137 -229

	Clip "_nav_cistern_angpipe4" blocks Survivors @ setpos_exact -9723 -6991 -229

	Clip "_nav_cistern_angpipe5" blocks Survivors @ setpos_exact -9727 -7542 -229

	Clip "_ledgehang_endsaferoof" blocks Survivors @ setpos_exact -8361 -5553 131

	Clip "_smoother_pipes1" blocks Everyone @ setpos_exact -8712 -7404 -609

	Clip "_smoother_pipes2" blocks Everyone @ setpos_exact -8712 -7159 -615

	Clip "_smoother_pipes3" blocks Everyone @ setpos_exact -8307 -7154.5 -541

	Clip "_chargerassist_eventbutton" blocks Survivors @ setpos_exact -8706 -7744 -308

	Clip "_chargerassist_footlocker" blocks Survivors @ setpos_exact -8992 -8554 -308

	Clip "_grating_smoothera" blocks Everyone @ setpos_exact -8642 -7855 -528.613

	Clip "_grating_smootherb" blocks Everyone @ setpos_exact -8642 -7855 -528.613

PvP:

	Clip "_shortcut_commonhop" blocks Survivors @ setpos_exact -8050 -8422 -487

	Brush "_losfix_bridge_base1" created @ setpos_exact -8693 -8517 -498

	Brush "_losfix_bridge_base2" created @ setpos_exact -8404 -8517 -541

	Brush "_losfix_bridge_base3" created @ setpos_exact -8115 -8517 -498

	Brush "_losfix_bridge_base4" created @ setpos_exact -8693 -8568 -400

	Brush "_losfix_bridge_base5" created @ setpos_exact -8117 -8568 -400

	Brush "_losfix_dynamic_bridge1" created @ setpos_exact -8566 -8525 -289

	Brush "_losfix_dynamic_bridge2" created @ setpos_exact -8243 -8525 -289

	Brush "_losfix_dynamic_bridge_floor1" created @ setpos_exact -8538 -8566 -196

	Brush "_losfix_dynamic_bridge_floor2" created @ setpos_exact -8270 -8566 -196

	Brush "_losfix_van" created @ setpos_exact -7071 -5218 -30

	Clip "_ladder_quickstairwell_clip" blocks Infected @ setpos_exact -6394 -7264.7 89

	Clip "_ladder_starttriplebig_clip" blocks Everyone @ setpos_exact -11632 -8168 -231

	LADDER: _ladder_endtrainbox_cloned_endchainlink

	LADDER: _ladder_quickstairwell_cloned_wrongturn

	LADDER: _ladder_starttriplebig_cloned_startcoolingtanks

	LADDER: _ladder_warewinright_cloned_wrongturn

	MOVER:	LOS dynamic fixes parented to move with bridge.

	PROP:	Barrels at end of sewers moved to reduce stuck-warp obligation.

------------------------------------------------------------------------------------------------------------------------

DEATH TOLL - THE CHURCH || c10m3_ranchhouse

All:

	Clip "_commonhop_saferoom" blocks Survivors @ setpos_exact -8080 -5684 421

	Clip "_commonhop_traintoroof" blocks Survivors @ setpos_exact -12000 -8094 286

	Clip "_commonhop_stationroof" blocks Survivors @ setpos_exact -12632 -6040 500

	Clip "_dispcrouch_flatcartunnel" blocks Everyone @ setpos_exact -12534 -3574 -36

	Clip "_holdoutsafe_cabinmountain" blocks Survivors @ setpos_exact -7518 -2770 307

	Clip "_cliprework_watchtower" blocks Survivors @ setpos_exact -10438 -6325 542

	Clip "_cliprework_rockcliff01" blocks Survivors @ setpos_exact -6272 -2688 848

	Clip "_cliprework_roadblock" blocks Survivors @ setpos_exact -4585 -944 496

	Clip "_cliprework_churchlonga" blocks Survivors @ setpos_exact -4533 -503 496

	Clip "_cliprework_rockcliff02" blocks Survivors @ setpos_exact -7043 -3005 848

	Clip "_cliprework_churchlongb" blocks Survivors @ setpos_exact -2232 -467 290

	Clip "_clipextend_trainstationa" blocks Survivors @ setpos_exact -12811 -7486 344

	Clip "_clipextend_trainstationb" blocks Survivors @ setpos_exact -13001 -5725.4 344

	Clip "_dipscrouch_multicliff" blocks Everyone @ setpos_exact -13282 -3756 240

	Clip "_cliprework_church01" blocks Survivors @ setpos_exact -3070 25 576

	Clip "_cliprework_church02" blocks Survivors @ setpos_exact -2710 1072 576

	Clip "_cliprework_church03" blocks Survivors @ setpos_exact -3798 930 576

	Clip "_cliprework_church04" blocks Survivors @ setpos_exact -4538 578 576

	Clip "_cliprework_church05" blocks Survivors @ setpos_exact -4962 712 576

	Clip "_cliprework_church06" blocks Survivors @ setpos_exact -5528 137 576

	Clip "_cliprework_church07" blocks Survivors @ setpos_exact -3390 -135 576

	Clip "_cliprework_church08" blocks Survivors @ setpos_exact -5492 667 576

	Clip "_cliprework_church09" blocks Survivors @ setpos_exact -3612 -319 576

	Clip "_cliprework_church10" blocks Survivors @ setpos_exact -2256 506 576

	Clip "_cliprework_church11" blocks Survivors @ setpos_exact -2928 448 736

	Clip "_cliprework_church12" blocks Survivors @ setpos_exact -2558 220 736

	Clip "_cliprework_corner1" blocks Survivors @ setpos_exact -13282 -3756 240

	Clip "_cliprework_corner2" blocks Survivors @ setpos_exact -12651 -3566 400

	Clip "_tankpunch_booster" blocks Survivors @ setpos_exact -8838 -4633 124

	Clip "_permstuck_triplerock" blocks Everyone @ setpos_exact -9539 -4313 16

	Clip "_cliprework_vulnerable" blocks Survivors @ setpos_exact -8709 -3352 269

	Clip "_cliprework_smokertrolling" blocks Survivors @ setpos_exact -11857 -5323 85

	Clip "_cliprework_churchwindows" blocks Survivors @ setpos_exact -2372 192 194

	Clip "_clipextend_padlockgate" blocks Survivors @ setpos_exact -8594 -5033 344

	Clip "_permstuck_openedrockcliff" blocks Infected @ setpos_exact -9247 -3950 412

	Clip "_permstuck_fatcliffladder1" blocks Infected @ setpos_exact -8302 -3322 383

	Clip "_permstuck_fatcliffladder2" blocks Infected @ setpos_exact -8224 -3527 378

	Clip "_chargerassist_brokenwall" blocks Survivors @ setpos_exact -2480 1104 221

	Clip "_booster_watertowerclip" blocks Survivors @ setpos_exact -6472 -871 1024

PvP:

	Deleted func_playerinfected_clip @ setpos_exact -9857 -7984.99 511

	Deleted func_playerinfected_clip @ setpos_exact -8961 -7473 639

	Brush "_losfix_ambulance1" created @ setpos_exact -5924 -1034 -39

	Brush "_losfix_ambulance2" created @ setpos_exact -5965 -1134 -38

	Brush "_losfix_bus1" created @ setpos_exact -9815 -3582 -43

	Brush "_losfix_bus2" created @ setpos_exact -9782 -3864 -43

	Brush "_losfix_bus3" created @ setpos_exact -9857 -3507 -43

	Brush "_losfix_van" created @ setpos_exact -9414 -2952 -42

	Brush "_losfix_watertank" created @ setpos_exact -10456 -6456 -58

	Clip "_solidify_permstuck01" blocks Infected @ setpos_exact -6606 -722 -58

	Clip "_solidify_permstuck02" blocks Infected @ setpos_exact -6243 -697 -48

	Clip "_solidify_permstuck03" blocks Infected @ setpos_exact -6067 -585 -31

	Clip "_solidify_permstuck04" blocks Infected @ setpos_exact -6001 -266 -30

	Clip "_solidify_permstuck05" blocks Infected @ setpos_exact -5620.3 -301.3 -50.5

	Clip "_solidify_permstuck06" blocks Infected @ setpos_exact -9674 -1131 -10

	Clip "_solidify_permstuck07" blocks Infected @ setpos_exact -8918 -860 -42

	Clip "_solidify_permstuck08" blocks Infected @ setpos_exact -8570 -994 -66

	Clip "_meticulous_funcinfclip01" blocks Infected @ setpos_exact -9348 -7694 584

	LADDER: _ladder_brokenwallL_cloned_graveshort

	LADDER: _ladder_brokenwallM_cloned_graveshort

	LADDER: _ladder_brokenwallR_cloned_graveshort

	LADDER: _ladder_churchcampperimeter_cloned_churchtallninety

	LADDER: _ladder_churchfarperimeter_cloned_churchsandbags

	LADDER: _ladder_concretebags_cloned_acunitcorner

	LADDER: _ladder_mountaincrawl_cloned_fatcliffladder

	LADDER: _ladder_ramptohersch_cloned_lightsignalfence

	LADDER: _ladder_shedelectricbox_cloned_hellcade

	LADDER: _ladder_stationfencebackL_cloned_stationfencebackR

	LADDER: _ladder_stationfencebackM_cloned_stationfencebackR

	LADDER: _ladder_stationfencefrontL_cloned_stationfencefrontR

	LADDER: _ladder_trainsignalleftB_cloned_sandtowerbest

	LADDER: _ladder_trainsignalleftT_cloned_sandtowerbest

	LADDER: _ladder_trainsignalrightB_cloned_sandtowerbest

	LADDER: _ladder_trainsignalrightT_cloned_sandtowerbest

	Static prop "_losblocker_rock" W/ "models/props/cs_militia/militiarock03.mdl" @ setpos_exact -5921 -453 19

	Static prop "_solidify_tree01" W/ "models/props_foliage/trees_cluster01.mdl" @ setpos_exact -6608 -712 -84

	Static prop "_solidify_tree02" W/ "models/props_foliage/trees_cluster01.mdl" @ setpos_exact -6240 -704 -36

	Static prop "_solidify_tree03" W/ "models/props_foliage/trees_cluster01.mdl" @ setpos_exact -6064 -584 -84

	Static prop "_solidify_tree04" W/ "models/props_foliage/trees_cluster01.mdl" @ setpos_exact -6000 -272 -84

	Static prop "_solidify_tree05" W/ "models/props_foliage/trees_cluster01.mdl" @ setpos_exact -5622 -298 -84

	Static prop "_solidify_tree06" W/ "models/props_foliage/trees_cluster01.mdl" @ setpos_exact -9678.08 -1120 11.46

	Static prop "_solidify_tree07" W/ "models/props_foliage/trees_cluster01.mdl" @ setpos_exact -8914.98 -852.481 -26.4875

	Static prop "_solidify_tree08" W/ "models/props_foliage/trees_cluster01.mdl" @ setpos_exact -8568 -984 -52

	Static prop "_solidify_tree09" W/ "models/props_foliage/trees_cluster02.mdl" @ setpos_exact -7168 -880 -91.8731

	Static prop "_solidify_tree10" W/ "models/props_foliage/trees_cluster02.mdl" @ setpos_exact -9664 -1400 -36.5395

------------------------------------------------------------------------------------------------------------------------

DEATH TOLL - THE TOWN || c10m4_mainstreet

All:

	Clip "_commonhop_bankwindow" blocks Survivors @ setpos_exact -672 -4351 176

	Clip "_cliprework_church" blocks Survivors @ setpos_exact -3010 30 720.9

	Clip "_cliprework_buses" blocks Survivors @ setpos_exact -1437 -461 1124

	Clip "_cliprework_houses01" blocks Survivors @ setpos_exact 744 -324 512

	Clip "_cliprework_houses02" blocks Survivors @ setpos_exact 854 -272 512

	Clip "_cliprework_houses03" blocks Survivors @ setpos_exact 1400 -158 512

	Clip "_cliprework_houses04" blocks Survivors @ setpos_exact 1993 -254 512

	Clip "_cliprework_houses05" blocks Survivors @ setpos_exact 2883 -465 602

	Clip "_dispcrouch_spawn" blocks Everyone @ setpos_exact -4294 -1729 -2

	Clip "_cliprework_unattackable" blocks Survivors @ setpos_exact -1608 -2368 884

	Clip "_cliprework_electricalbox" blocks Survivors @ setpos_exact 2667 -1769 164

	Clip "_cliprework_windows" blocks Survivors @ setpos_exact 2688 -2136 372

	Clip "_cliprework_balcony" blocks Survivors @ setpos_exact 2822 -1694 336

	Clip "_cliprework_awning" blocks Survivors @ setpos_exact 2885 -1580 297

	Clip "_cliprework_eventskip1" blocks Survivors @ setpos_exact 852 -2433 140

	Clip "_cliprework_eventskip2" blocks Survivors @ setpos_exact 661 -2569 140

	Clip "_cliprework_eventskip3" blocks Survivors @ setpos_exact 372 -2717 140

	Clip "_cliprework_eventskip4" blocks Survivors @ setpos_exact 242 -2757 140

	Insta-kill "_instakill_deathcharger" Survivor @ setpos_exact -2449 122 -43

	Safe room Commons SPAWN_IN_FRONT_OF_SURVIVORS fix created @ setpos_exact 288 -5284 93

PvP:

	Clip "_cliprework_trucknuke" blocks Survivors @ setpos_exact 693 -1867 105

	Deleted ([67] func_breakable) @ setpos_exact -1335 -4910 244

	Deleted func_playerinfected_clip @ setpos_exact 1359 -3625 479

	Deleted func_playerinfected_clip @ setpos_exact 1479 -457 295

	Deleted func_playerinfected_clip @ setpos_exact -5057 -2625 71

	Deleted func_playerinfected_clip @ setpos_exact -2731 -3241 455

	Deleted func_playerinfected_clip @ setpos_exact -2145 -553 233

	Deleted func_playerinfected_clip @ setpos_exact -113 -721 201

	Deleted func_playerinfected_clip @ setpos_exact 495 -737 217

	Deleted func_playerinfected_clip @ setpos_exact 943 -625 279

	Deleted func_playerinfected_clip @ setpos_exact 2903 -673 271

	Deleted func_playerinfected_clip @ setpos_exact 2023 -697 331

	Deleted func_playerinfected_clip @ setpos_exact 2903 -673 271

	Deleted func_playerinfected_clip @ setpos_exact -5121 -1841 -161

	Deleted func_playerinfected_clip @ setpos_exact 1615 -4769 335

	Tank/Charger chokepoint atomizer created @ setpos_exact -572 -2019 -48

	Brush "_losfix_bus1" created @ setpos_exact -1264 -4031 -54

	Brush "_losfix_bus2" created @ setpos_exact -1292 -3874 -54

	Brush "_losfix_truck" created @ setpos_exact -3636 -1019 -53

	Brush "_losfix_van1" created @ setpos_exact -3340 -1677 -47

	Brush "_losfix_van2" created @ setpos_exact -762 -2268 -48

	Clip "_fineantique_surf_collision" blocks Infected @ setpos_exact 1968 -4608 320

	Clip "_hellcade_clipa" blocks Infected @ setpos_exact -5360 -504 -64

	Clip "_hellcade_clipb" blocks Infected @ setpos_exact -5605 -1001 -64

	Clip "_hellcade_clipc" blocks Infected @ setpos_exact -5360 -1857 -64

	Clip "_hellcade_permstuck" blocks Infected @ setpos_exact -5115 -1028 -49

	Clip "_ladder_eventskybridge_clip" blocks Infected @ setpos_exact -1314 -4766 296

	Clip "_ladder_starthilltop_clip" blocks Infected @ setpos_exact -4608 -1906 520

	Clip "_losblocker_deliveryclip" blocks Survivors @ setpos_exact 583 -2463 -52

	Clip "_meticulous_funcinfclip01" blocks Infected @ setpos_exact -3906 -3153 384

	Clip "_meticulous_funcinfclip02" blocks Infected @ setpos_exact -4935 -2560 675

	Clip "_meticulous_funcinfclip03" blocks Infected @ setpos_exact 2038 -3044 560

	Clip "_yesdrawhellcade_collision" blocks Infected @ setpos_exact -5254.8 -691.5 17

	LADDER: _ladder_churchleftm3mirr_cloned_churchrearwrong

	LADDER: _ladder_eventfinalalley_cloned_endgraffiti

	LADDER: _ladder_eventpipewires_cloned_endchainlink

	LADDER: _ladder_eventskybridge_cloned_churchwalltallest

	LADDER: _ladder_fineantiques_cloned_enddumpstertall

	LADDER: _ladder_house5sideup_cloned_churchwallmedium

	LADDER: _ladder_house6semifront_cloned_house6semiback

	LADDER: _ladder_house6telepole_cloned_eventbarricadepipe

	LADDER: _ladder_house7Bthin_cloned_balconytrimmed

	LADDER: _ladder_house7Mthick_cloned_quadwindows

	LADDER: _ladder_house7Tthick_cloned_quadwindows

	LADDER: _ladder_house8Bthin_cloned_balconytrimmed

	LADDER: _ladder_house8Tthick_cloned_policebarricade

	LADDER: _ladder_naturalstains_cloned_awningpipe

	LADDER: _ladder_semitrucknose_cloned_startgenerator

	LADDER: _ladder_stainedboard_cloned_surplusfluff

	LADDER: _ladder_starthilltopB_cloned_awningpipe

	LADDER: _ladder_starthilltopM_cloned_awningpipe

	LADDER: _ladder_starthilltopT_cloned_awningpipe

	LADDER: _ladder_theatreleft_cloned_theatreright

	LADDER: _ladder_yesdrawhellbackL_cloned_copbarrfront

	LADDER: _ladder_yesdrawhellbackR_cloned_copbarrfront

	LADDER: _ladder_yesdrawhellfrontL_cloned_copbarrback

	LADDER: _ladder_yesdrawhellfrontR_cloned_copbarrback

	Navblocker "_losblocker_deliverynavblock" blocks Everyone w/ Apply @ setpos_exact 562 -2425 -48

	Static prop "_losblocker_deliveryvan" W/ "models/props_vehicles/deliveryvan.mdl" @ setpos_exact 600 -2429 -47

	Static prop "_losblocker_deliveryvanglass" W/ "models/props_vehicles/deliveryvan_glass.mdl" @ setpos_exact 600 -2429 -47

	Static prop "_losblocker_sheetrock" W/ "models/props_interiors/sheetrock_leaning.mdl" @ setpos_exact -368 -2142 -48

	Static prop "_fineantique_surf1" W/ "models/props_update/c8m1_rooftop_3.mdl" @ setpos_exact 2064 -4608 320.3

	Static prop "_fineantique_surf2" W/ "models/props_update/c8m1_rooftop_3.mdl" @ setpos_exact 1872 -4608 320.2

	Static prop "_hellcade_m3mirr01" W/ "models/props_c17/concrete_barrier001a.mdl" @ setpos_exact -5136 -1224.06 -77.94

	Static prop "_hellcade_m3mirr02" W/ "models/props_c17/concrete_barrier001a.mdl" @ setpos_exact -5136 -744.06 -74

	Static prop "_hellcade_m3mirr03" W/ "models/props_foliage/cedar01.mdl" @ setpos_exact -5247.66 -1365 -91.57

	Static prop "_hellcade_m3mirr04" W/ "models/props_foliage/cedar01.mdl" @ setpos_exact -5485.07 -1318.82 -96

	Static prop "_hellcade_m3mirr05" W/ "models/props_street/concertinawire128.mdl" @ setpos_exact -5112 -901.06 -35.94

	Static prop "_hellcade_m3mirr06" W/ "models/props_street/concertinawire128.mdl" @ setpos_exact -5114 -1026.06 -35.94

	Static prop "_hellcade_m3mirr07" W/ "models/props_street/concertinawire128.mdl" @ setpos_exact -5115 -1157.66 7.55

	Static prop "_hellcade_m3mirr08" W/ "models/props_street/concertinawire128.mdl" @ setpos_exact -5116 -1158.06 -35.94

	Static prop "_hellcade_m3mirr09" W/ "models/props_street/concertinawire128.mdl" @ setpos_exact -5117 -1032.66 7.55

	Static prop "_hellcade_m3mirr10" W/ "models/props_street/concertinawire128.mdl" @ setpos_exact -5119 -900.66 7.55

	Static prop "_hellcade_m3mirr11" W/ "models/props_street/stopsign01.mdl" @ setpos_exact -5108 -1080.06 -73

	Static prop "_hellcade_m3mirr12" W/ "models/props_street/stopsign01.mdl" @ setpos_exact -5267.23 -719.82 -69.49

	Static prop "_hellcade_m3mirr13" W/ "models/props_street/stopsign01.mdl" @ setpos_exact -5280.22 -667.42 -68.13

	Static prop "_hellcade_wrongwaya" W/ "models/props_misc/wrongway_sign01_optimized.mdl" @ setpos_exact -5605 -1257 0

	Static prop "_hellcade_wrongwayb" W/ "models/props_misc/wrongway_sign01_optimized.mdl" @ setpos_exact -5605 -1001 0

	Static prop "_hellcade_wrongwayc" W/ "models/props_misc/wrongway_sign01_optimized.mdl" @ setpos_exact -5605 -745 0

	Static prop "_ladder_churchleftm3mirr_pipe" W/ "models/props_rooftop/Gutter_Pipe_256.mdl" @ setpos_exact -3276 -7 321

	Static prop "_solidify_stainedawning" W/ "models/props_street/awning_department_store.mdl" @ setpos_exact 2036 -2528 385

	Static prop "_stainedroof_wrongway1" W/ "models/props_misc/wrongway_sign01_optimized.mdl" @ setpos_exact 1728 -2920 541

	Static prop "_stainedroof_wrongway2" W/ "models/props_misc/wrongway_sign01_optimized.mdl" @ setpos_exact 2028 -2920 541

	Static prop "_stainedroof_wrongway3" W/ "models/props_misc/wrongway_sign01_optimized.mdl" @ setpos_exact 2328 -2920 541

	Static prop "_yesdrawhellcade_surface" W/ "models/props_update/c10m4_hellcade_nodraw.mdl" @ setpos_exact -5093.8 -1038 0

	Ladder found @ "1698.6658 -3959.1636 -13.5" and shifted w/ offset @ "0 -3 0"

	Ladder found @ "1712.9192 -3843.1353 -12.5" and shifted w/ offset @ "0 3 0"

	Physics prop "_hittable_hellcar" W/ "models/props_vehicles/cara_95sedan.mdl" @ setpos_exact -5351 -993.06 -63.59

	Static prop "_hittable_hellcarglass" W/ "models/props_vehicles/cara_95sedan_glass.mdl" @ setpos_exact -5351 -993.06 -63.59

Survival:

	Clip "_booster_eatsign" blocks Survivors @ setpos_exact -1649 -3723 293

------------------------------------------------------------------------------------------------------------------------

DEATH TOLL - BOAT HOUSE FINALE || c10m5_houseboat

All:

	Clip "_cliprework_startarea02" blocks Survivors @ setpos_exact 2738 3824 412

	Clip "_cliprework_startarea01" blocks Survivors @ setpos_exact 1311.5 3785 596

	Clip "_cliprework_startarea03" blocks Survivors @ setpos_exact 4250 3811 792

	Clip "_permstuck_cornertree" blocks Infected @ setpos_exact 4414.32 1858 17

	Clip "_solidify_railposta" blocks Everyone @ setpos_exact 3924 -4516 -24

	Clip "_solidify_railpostb" blocks Everyone @ setpos_exact 4020 -4516 -24

	Clip "_solidify_railpostc" blocks Everyone @ setpos_exact 4116 -4228 -24

	Clip "_solidify_railpostd" blocks Everyone @ setpos_exact 4116 -4132 -24

	Clip "_solidify_railposte" blocks Everyone @ setpos_exact 4116 -4036 -24

	Clip "_solidify_railpostf" blocks Everyone @ setpos_exact 4020 -3940 -24

	Clip "_commonhop_backyard1" blocks Survivors @ setpos_exact 2689 2237 347

	Clip "_commonhop_backyard2" blocks Survivors @ setpos_exact 2179 2456 360

	Clip "_commonhop_backyard3" blocks Survivors @ setpos_exact 1505 2509 360

	Clip "_commonhop_backyard4" blocks Survivors @ setpos_exact 2175 2582 219

	Clip "_nav_rockcliff_complete" blocks Survivors @ setpos_exact 6430 -4504 222

	Clip "_permstuck_rockclipwedge" blocks Survivors @ setpos_exact 1386 -4758 -161

	Static prop "_laststand_truck" W/ "models/props_vehicles/pickup_truck_2004.mdl" & color "67 108 112" @ setpos_exact 1261.08 1237.97 -207.962

	Static prop "_laststand_truckglass" W/ "models/props_vehicles/pickup_truck_2004_glass.mdl" & color "67 108 112" @ setpos_exact 1261.08 1237.97 -207.962

	Static prop "_laststand_ammocan1" W/ "models/props/de_prodigy/ammo_can_02.mdl" @ setpos_exact 1345.13 1232.73 -158.673

	Static prop "_laststand_ammocan2" W/ "models/props/de_prodigy/ammo_can_02.mdl" @ setpos_exact 1337.56 1234.67 -164.912

	Static prop "_laststand_oldmanmurray" W/ "models/props_crates/static_crate_40.mdl" @ setpos_exact 1310 1260.02 -166.166

	Static prop "_laststand_ammocan3" W/ "models/props/de_prodigy/ammo_can_02.mdl" @ setpos_exact 1305.72 1280.81 -142.713

	Static prop "_laststand_lantern" W/ "models/props_unique/spawn_apartment/lantern.mdl" @ setpos_exact 1340 1251 -163.04

	LOGIC:	Rockslide and point-of-no-return entities will spawn when finale is started.

	Static prop "_rockslide_permtree" W/ "models/props_foliage/trees_cluster01.mdl" @ setpos_exact 4220 -314 -221.9

	Static prop "_rockslide_static_1a" W/ "models/props/cs_militia/militiarock01.mdl" @ setpos_exact 4759 169 -96.8125

	Static prop "_rockslide_static_1b" W/ "models/props/cs_militia/militiarock01.mdl" & color "222 222 222" @ setpos_exact 4378.5313 -104.9063 -86.4063

	Static prop "_rockslide_static_1c" W/ "models/props/cs_militia/militiarock01.mdl" & color "177 177 177" @ setpos_exact 4480.125 -2.7188 -149.9375

	Static prop "_rockslide_static_2a" W/ "models/props/cs_militia/militiarock02.mdl" @ setpos_exact 4606.125 98.625 -81.7813

	Static prop "_rockslide_static_2b" W/ "models/props/cs_militia/militiarock02.mdl" & color "222 222 222" @ setpos_exact 4494.4688 -23.4688 -136.5

	Static prop "_rockslide_static_2c" W/ "models/props/cs_militia/militiarock02.mdl" & color "177 177 177" @ setpos_exact 4450.1875 -119.8125 -83.0938

	Clip "_rockslide_survivorclipa" blocks Survivors @ setpos_exact 4455 -54 -224

	Clip "_rockslide_survivorclipb" blocks Survivors @ setpos_exact 4187 -415 -153

	Clip "_rockslide_survivorclipc" blocks Everyone @ setpos_exact 4226 -192 -132

	Insta-kill "_rockslide_trighurta" Infected @ setpos_exact 4417 -83 -221

	Insta-kill "_rockslide_trighurtb" Infected @ setpos_exact 4667 157 -221

PvP:

	Clip "_indoor_roof" blocks Survivors @ setpos_exact 2244 4076 100

	Brush "_losfix_van" created @ setpos_exact 3736 753 -181

	Clip "_ladder_middlehouse_clip" blocks Everyone @ setpos_exact 3488 -3063 -84

	Clip "_rock_infected_clipqol" blocks Infected @ setpos_exact 3340 -5010 -324

	Clip "_rock_survivor_clipright" blocks Survivors @ setpos_exact 3255 -4984 -253

	Clip "_rock_survivor_clipleft" blocks Survivors @ setpos_exact 3255 -4984 -253

	Clip "_rock_survivor_clipwedge" blocks Survivors @ setpos_exact 3255 -4984 -253

	Clip "_solidify_permstuck1" blocks Infected @ setpos_exact 2100 253 -112

	Clip "_solidify_permstuck2" blocks Infected @ setpos_exact 3141 387 -168

	Clip "_solidify_permstuck3" blocks Infected @ setpos_exact 5463 220 222

	Clip "_solidify_permstuck4" blocks Infected @ setpos_exact 6736 -2753 207

	Clip "_solidify_permstuck5" blocks Infected @ setpos_exact 2914 -1462 213

	Clip "_solidify_railposta" blocks Everyone @ setpos_exact 3924 -4516 -24

	Clip "_solidify_railpostb" blocks Everyone @ setpos_exact 4020 -4516 -24

	Clip "_solidify_railpostc" blocks Everyone @ setpos_exact 4116 -4228 -24

	Clip "_solidify_railpostd" blocks Everyone @ setpos_exact 4116 -4132 -24

	Clip "_solidify_railposte" blocks Everyone @ setpos_exact 4116 -4036 -24

	Clip "_solidify_railpostf" blocks Everyone @ setpos_exact 4020 -3940 -24

	LADDER: _ladder_firebarrelarea_cloned_eventperimloner

	LADDER: _ladder_middlehouse_cloned_docksinwater

	LADDER: _ladder_tankfightcorner_cloned_eventperimloner

	Navblocker "_rock_navblock_outabounds" blocks Everyone w/ Apply @ setpos_exact 2951 -5211 -295

	Navblocker "_rock_navblock_underneath" blocks Everyone w/ Apply @ setpos_exact 3198 -4848 -295

	Static prop "_losblocker_tallladder" W/ "models/props/cs_militia/militiarock01.mdl" @ setpos_exact 5639 -419 292

	Static prop "_propladder_back" W/ "models/props/cs_militia/militiarock02.mdl" @ setpos_exact 5205 -2 -118

	Static prop "_propladder_front" W/ "models/props/cs_militia/militiarock03.mdl" @ setpos_exact 4521 370 -250

	Static prop "_rock_nav" 191 191 191 & solid_yes w/ "models/props_foliage/rock_coast02f.mdl" @ setpos_exact 3050 -5000 -438

	Static prop "_rock_rene" 191 191 191 & solid_yes w/ "models/props_foliage/rock_coast02f.mdl" @ setpos_exact 3250 -4977 -242

	Static prop "_solidify_tree01" W/ "models/props_foliage/trees_cluster02.mdl" @ setpos_exact 6115.44 -1254.23 254.159

	Static prop "_solidify_tree02" W/ "models/props_foliage/trees_cluster01.mdl" @ setpos_exact 5840.49 -1231.82 262.096

	Static prop "_solidify_tree03" W/ "models/props_foliage/trees_cluster02.mdl" @ setpos_exact 5674.99 -173.235 286.403

	Static prop "_solidify_tree04" W/ "models/props_foliage/trees_cluster01.mdl" @ setpos_exact 5482.81 241.228 132.695

	Static prop "_solidify_tree05" W/ "models/props_foliage/trees_cluster02.mdl" @ setpos_exact 5140.97 482.588 161.3

	Static prop "_solidify_tree06" W/ "models/props_foliage/trees_cluster01.mdl" @ setpos_exact 4947.63 841.389 177.102

	Static prop "_solidify_tree07" W/ "models/props_foliage/trees_cluster02.mdl" @ setpos_exact 4596 -847.291 46.5099

	Static prop "_solidify_tree08" W/ "models/props_foliage/trees_cluster01.mdl" @ setpos_exact 4472.11 -1332.35 92.7903

	Static prop "_solidify_tree09" W/ "models/props_foliage/trees_cluster02.mdl" @ setpos_exact 3330.26 -1363.53 109.319

	Static prop "_solidify_tree10" W/ "models/props_foliage/trees_cluster01.mdl" @ setpos_exact 2913.72 -1441.18 125.267

	Static prop "_solidify_tree11" W/ "models/props_foliage/trees_cluster02.mdl" @ setpos_exact 2806.21 -1397.96 136.034

	Static prop "_solidify_tree12" W/ "models/props_foliage/trees_cluster02.mdl" @ setpos_exact 6591.85 -1674.72 249.755

	Static prop "_solidify_tree13" W/ "models/props_foliage/trees_cluster01.mdl" @ setpos_exact 6860.31 -1957.59 260.658

	Static prop "_solidify_tree14" W/ "models/props_foliage/trees_cluster02.mdl" @ setpos_exact 6936.06 -2695.45 140.336

	Static prop "_solidify_tree15" W/ "models/props_foliage/trees_cluster01.mdl" @ setpos_exact 6743.79 -2761.88 140.372

	Static prop "_solidify_tree16" W/ "models/props_foliage/old_tree01.mdl" @ setpos_exact 6754.94 -3134.69 175.772

	Static prop "_solidify_tree17" W/ "models/props_foliage/trees_cluster02.mdl" @ setpos_exact 6691.45 -3321.24 167.145

	Static prop "_solidify_tree18" W/ "models/props_foliage/old_tree01.mdl" @ setpos_exact 3392 -87.0611 -192

	Static prop "_solidify_tree19" W/ "models/props_foliage/trees_cluster02.mdl" @ setpos_exact 3343.3 304.445 -195.784

	Static prop "_solidify_tree20" W/ "models/props_foliage/trees_cluster01.mdl" @ setpos_exact 3135.65 343.649 -172.46

	Static prop "_solidify_tree21" W/ "models/props_foliage/trees_cluster02.mdl" @ setpos_exact 3004 -49.16 -159.143

	Static prop "_solidify_tree22" W/ "models/props_foliage/old_tree01.mdl" @ setpos_exact 2800 176.84 -175

	Static prop "_solidify_tree23" W/ "models/props_foliage/trees_cluster02.mdl" @ setpos_exact 2600 166.84 -176

	Static prop "_solidify_tree24" W/ "models/props_foliage/trees_cluster02.mdl" @ setpos_exact 2472.84 354 -191

	Static prop "_solidify_tree25" W/ "models/props_foliage/trees_cluster01.mdl" @ setpos_exact 2103.88 254.77 -193.143

	Static prop "_solidify_tree26" W/ "models/props_foliage/trees_cluster02.mdl" @ setpos_exact 2236.99 768.711 -202.778

	Static prop "_solidify_tree27" W/ "models/props_foliage/old_tree01.mdl" @ setpos_exact 2157.68 1276.4 -199.196

	Static prop "_solidify_tree28" W/ "models/props_foliage/trees_cluster02.mdl" @ setpos_exact 5416.34 565.308 209.588

	Physics prop "_hittable_log" W/ "models/props_foliage/tree_trunk_fallen.mdl" @ setpos_exact 5405 -2480 -103

	Navmesh modified w/ OBSCURED @ setpos_exact 5298 328 153

	Navmesh modified w/ OBSCURED @ setpos_exact 5020 664 190

Survival:

	Clip "_survival_docksrocks" blocks Survivors @ setpos_exact 2201 -4720 -174

------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------

DEAD AIR - THE GREENHOUSE || c11m1_greenhouse

All:

	Clip "_commonhop_greenhouse" blocks Survivors @ setpos_exact 5226 -752 1023

	Clip "_oddhang_electricalbox" blocks Survivors @ setpos_exact 3338 1147 466

	Clip "_ladderqol_electricalbox" blocks Infected @ setpos_exact 3340 1151 536

	Clip "_cliprework_stunfall" blocks Survivors @ setpos_exact 2464 784 409

	Clip "_stunfall_jeep" blocks Survivors @ setpos_exact 4669 1491 8

	Clip "_cliprework_nopedocks01" blocks Survivors @ setpos_exact 4221.4 -1175 16

	Clip "_tankpunch_escapeladder" blocks Survivors @ setpos_exact 3412 -932 259

	Clip "_cliprework_nopedocks02" blocks Survivors @ setpos_exact 2312 -1141 16

	Clip "_cliprework_unattackable" blocks Survivors @ setpos_exact 7188.6 -601.2 16

	Clip "_stunfall_lamp" blocks Survivors @ setpos_exact 5549 1313 8

	Clip "_outtabounds_ledge" blocks Survivors @ setpos_exact 2700 649 640

	Clip "_cliprework_endpassage" blocks Survivors @ setpos_exact 4858 2552 274

	Insta-kill "_instakill_thankyoufailzz" Survivor @ setpos_exact 5148 -1121 165

PvP:

	Deleted func_playerinfected_clip @ setpos_exact 5223 -1073 841

	Deleted func_playerinfected_clip @ setpos_exact 5247 -1073 1007

	Deleted func_playerinfected_clip @ setpos_exact 2663 1383 1087

	Deleted func_playerinfected_clip @ setpos_exact 3431 -1097 1199

	Deleted func_playerinfected_clip @ setpos_exact 3991 -73 1487

	Deleted func_playerinfected_clip @ setpos_exact 2559 2655 727

	Deleted func_playerinfected_clip @ setpos_exact 5247 -297 919

	Brush "_losfix_semi1" created @ setpos_exact 3456 2233 43

	Brush "_losfix_semi2" created @ setpos_exact 3999 2268 23

	Brush "_losfix_semi3" created @ setpos_exact 3977 2264 23

	Brush "_losfix_van" created @ setpos_exact 3729 2932 15

	Clip "_bustedwatertower_clip" blocks Infected @ setpos_exact 3872 -909 1464

	Clip "_greenhouse_gutterleft" blocks Infected + AI @ setpos_exact 5707 -993 984

	Clip "_greenhouse_gutterright" blocks Infected + AI @ setpos_exact 5707 -271 984

	Clip "_greenhouse_randomgapa" blocks Infected @ setpos_exact 4874 -752 923

	Clip "_greenhouse_randomgapb" blocks Infected @ setpos_exact 5823 -633 1088

	Clip "_greenhouse_saferoof_survivor" blocks Survivors @ setpos_exact 6530 -541 1004

	Clip "_greenhouse_saferoof_infected" blocks Infected @ setpos_exact 6530 -541 1004

	Clip "_greenhouse_saferoof_infecgap" blocks Infected @ setpos_exact 6296 -208 943

	Clip "_meticulous_funcinfclip01" blocks Infected + AI @ setpos_exact 5758 -1069 848

	Clip "_meticulous_funcinfclip02" blocks Infected + AI @ setpos_exact 6658 -893 916

	Clip "_meticulous_funcinfclip03" blocks Infected + AI @ setpos_exact 6658 -199 916

	Clip "_meticulous_funcinfclip04" blocks Infected + AI @ setpos_exact 7011 -509 908

	Clip "_meticulous_funcinfclip05" blocks Infected + AI @ setpos_exact 6291 -978 848

	Clip "_yesdraw_longjump_clip" blocks Infected @ setpos_exact 3010 3568 1292

	Clip "_yesdraw_longjump_stuck" blocks Infected @ setpos_exact 2584 2864 728

	LADDER: _ladder_endcarpetwin_cloned_onewayupper

	LADDER: _ladder_endupperwalkway_cloned_longnosegrille

	LADDER: _ladder_greenhousebox_cloned_firstbuildfront

	LADDER: _ladder_greenhouseroof_cloned_betweenacunits

	LADDER: _ladder_startplankdoor_cloned_endchainlink

	Static prop "_bustedwatertower_wrongwaya" W/ "models/props_misc/wrongway_sign01_optimized.mdl" @ setpos_exact 4069 -758 1264

	Static prop "_bustedwatertower_wrongwayb" W/ "models/props_misc/wrongway_sign01_optimized.mdl" @ setpos_exact 3664 -758 1264

	Static prop "_yesdraw_longjump_roofa" W/ "models/props_update/c8m1_rooftop_1.mdl" @ setpos_exact 3088 3312 856

	Static prop "_yesdraw_longjump_roofb" W/ "models/props_update/c8m1_rooftop_1.mdl" @ setpos_exact 2832 3312 855.9

	Static prop "_yesdraw_longjump_wrongwaya" W/ "models/props_misc/wrongway_sign01_optimized.mdl" @ setpos_exact 3090 3065 918

	Static prop "_yesdraw_longjump_wrongwayb" W/ "models/props_misc/wrongway_sign01_optimized.mdl" @ setpos_exact 2805 3065 918

	Static prop "_yesdrawgreenhouse_panels" W/ "models/props_update/c11m1_greenhouse_nodraw.mdl" @ setpos_exact 6118.9 -632 943

	Static prop "_yesdrawgreenhouse_plywood" W/ "models/props_update/c11m1_greenhouse_plywood.mdl" @ setpos_exact 5524 -717 968

------------------------------------------------------------------------------------------------------------------------

DEAD AIR - THE CRANE || c11m2_offices

All:

	Clip "_fallrevive_nopejumpa" blocks Survivors @ setpos_exact 6142 2312 9

	Clip "_fallrevive_nopejumpb" blocks Survivors @ setpos_exact 8648 2672 16

	Clip "_permstuck_officechairs" blocks Everyone @ setpos_exact 8865 4003 252

	Clip "_nav_craneledge" blocks Survivors @ setpos_exact 6117 3856 646

	Insta-kill "_instakill_semitrailer" Survivor @ setpos_exact 6854 2779 173

	Static prop "_omg_valve_wrongwayc" W/ "models/props_vehicles/van.mdl" @ setpos_exact 8815 2888 10

	Static prop "_omg_valve_wrongwayg" W/ "models/props_vehicles/van_glass.mdl" @ setpos_exact 8815 2888 10

	LOGIC:	Anti-shortcut trighurts will be deleted when a Survivor exits final office stairwell.

	Insta-kill "_finalstreet_trighurta" Survivor @ setpos_exact 9071 3888 196

	Insta-kill "_finalstreet_trighurtb" Survivor @ setpos_exact 8261 4759 196

	Insta-kill "_finalstreet_trighurtc" Survivor @ setpos_exact 9101 4969 196

PvP:

	Deleted func_playerinfected_clip @ setpos_exact 9087 5551 535

	Deleted func_playerinfected_clip @ setpos_exact 8271 3147 1055

	Brush "_losfix_copcar" created @ setpos_exact 9613 4999 16

	Brush "_losfix_crane1" created @ setpos_exact 5692 3913 784

	Brush "_losfix_crane2" created @ setpos_exact 5823 3913 746

	Brush "_losfix_crane3" created @ setpos_exact 6032 3914 746

	Brush "_losfix_crane4" created @ setpos_exact 5886 3828 756

	Brush "_losfix_crane5" created @ setpos_exact 5810 3914 1213

	Brush "_losfix_crane6" created @ setpos_exact 5820 3914 1194

	Brush "_losfix_semi" created @ setpos_exact 7412 5366 27

	Brush "_losfix_van" created @ setpos_exact 8754 5174.01 16

	Clip "_meticulous_funcinfclip01" blocks Infected @ setpos_exact 6197 4672 1056

	Clip "_meticulous_funcinfclip02" blocks Infected @ setpos_exact 9668 6033 536

	Clip "_meticulous_funcinfclip03" blocks Infected @ setpos_exact 8904 3512 1056

	LADDER: _ladder_endchaingate_cloned_endtallstraight

	LADDER: _ladder_endcornerleft_cloned_farendmiddle

	LADDER: _ladder_endcornerright_cloned_farendmiddle

	LADDER: _ladder_endcornertop_cloned_undercranedump

	LADDER: _ladder_officefoyerB_cloned_firebarrelfence

	LADDER: _ladder_officefoyerT_cloned_undercranepipe

	LADDER: _ladder_poleconnection_cloned_semiexploit

	Static prop "_officefoyer_wrongwaya" W/ "models/props_misc/wrongway_sign01_optimized.mdl" @ setpos_exact 8544 3284 1122

	Static prop "_officefoyer_wrongwayb" W/ "models/props_misc/wrongway_sign01_optimized.mdl" @ setpos_exact 8544 3761 1122

	Static prop "_solidify_officefoyer_pole" W/ "models/props_trainstation/pole_384connection001a.mdl" @ setpos_exact 8511.9 3565.75 1248.34

	Ladder found @ "8596 5497.5 92.3941" and shifted w/ offset @ "0 4 0"

	Ladder found @ "8260 5497.5 92.3941" and shifted w/ offset @ "0 4 0"

Survival:

	Clip "_survival_electricgod" blocks Survivors @ setpos_exact 8328 3196 783

------------------------------------------------------------------------------------------------------------------------

DEAD AIR - THE CONSTRUCTION SITE || c11m3_garage

All:

	Clip "_dispcrouch_rubblepipes" blocks Everyone @ setpos_exact -6060 758 -125

	Clip "_clipgap_roof" blocks Survivors @ setpos_exact -2226 5494 825

	Clip "_permstuck_processortanks" blocks Everyone @ setpos_exact -3000 2129 103

	Clip "_booster_windows" blocks Survivors @ setpos_exact -3082 3152 160

	Clip "_bunnyhop_windows" blocks Survivors @ setpos_exact -2954 1393 160

	Clip "_cliprework_construction01" blocks Survivors @ setpos_exact -6885 -2488 712

	Clip "_cliprework_construction02" blocks Survivors @ setpos_exact -7518 -2488 712

	Clip "_cliprework_construction03" blocks Survivors @ setpos_exact -5645 -884 1118

	Clip "_cliprework_construction04" blocks Survivors @ setpos_exact -5384 -1528 1000

	Clip "_cliprework_startarea02" blocks Survivors @ setpos_exact -5008 -2351 712

	Clip "_cliprework_startarea01" blocks Survivors @ setpos_exact -4232 -3186 548

	Clip "_nav_constructwin" blocks Survivors @ setpos_exact -5776 -1304 216

	Clip "_permstuck_watertank" blocks Everyone @ setpos_exact -4044 2880 16

	Static prop "_nav_constructwin_propper" W/ "models/props_update/plywood_128.mdl" @ setpos_exact -5776 -1302 280

	FIX:	Tanks prevented from being able to punch barricade gascans to delete them.

PvP:

	Deleted func_playerinfected_clip @ setpos_exact -7489 -2145 31

	Deleted func_playerinfected_clip @ setpos_exact -8161 -3729 535

	Deleted func_playerinfected_clip @ setpos_exact -7617 -1057 703

	Deleted func_playerinfected_clip @ setpos_exact -6761 1111 619

	Deleted func_playerinfected_clip @ setpos_exact -4245 -3665 547

	Deleted func_playerinfected_clip @ setpos_exact -5144 1903 15

	Tank/Charger chokepoint atomizer created @ setpos_exact -3451 2517 32

	Tank/Charger chokepoint atomizer created @ setpos_exact -3573 2854 32

	Brush "_losfix_copcar" created @ setpos_exact -3430 875 15

	Brush "_losfix_end_van" created @ setpos_exact -3221 4198 23

	Brush "_losfix_van" created @ setpos_exact -4577 664 16

	Brush "_losfix_watertank1" created @ setpos_exact -4854 3494 22

	Brush "_losfix_watertank2" created @ setpos_exact -3733 2330 38

	Brush "_losfix_watertank3" created @ setpos_exact -3947 2566 38

	Brush "_losfix_watertank4" created @ setpos_exact -3994 2929 25

	Clip "_constructsite_fireescape_booster" blocks Survivors @ setpos_exact -5434 -1145 792

	Clip "_constructsite_scaffold_clip" blocks Infected @ setpos_exact -7551 -1707 180

	Clip "_constructsite_wwblocker" blocks Infected @ setpos_exact -7203 -723 736

	Clip "_ladder_constructionfireescapea_qolclip" blocks Infected @ setpos_exact -5478 -1153 727

	Clip "_ladder_fireescapehelper_qolclip" blocks Infected @ setpos_exact -5456 -1312 512

	Clip "_ladderqol_lessworthlessthanbefore" blocks Infected @ setpos_exact -2901 2420 168

	Clip "_meticulous_funcinfclip01" blocks Infected @ setpos_exact -7753 -2058 16

	Clip "_meticulous_funcinfclip02" blocks Infected @ setpos_exact -7711 -1040 308

	Clip "_meticulous_funcinfclip03" blocks Infected @ setpos_exact -7976 -1504 180

	Clip "_meticulous_funcinfclip04" blocks Infected @ setpos_exact -6583 -3412 584

	Clip "_meticulous_funcinfclip05" blocks Infected @ setpos_exact -5602 -2703 976

	Clip "_meticulous_funcinfclip06" blocks Infected @ setpos_exact -6217 1232 380

	Clip "_meticulous_funcinfclip07" blocks Infected @ setpos_exact -5655 1952 8

	Clip "_meticulous_funcinfclip08" blocks Infected @ setpos_exact -3664 -3207 548

	Clip "_meticulous_funcinfclip09" blocks Infected @ setpos_exact -3934 -3627 548

	Clip "_yeswayfence1st_clip" blocks Everyone @ setpos_exact -5135 3067 16

	Clip "_yeswayfence2nd_clip" blocks Everyone @ setpos_exact -4447 4199 16

	Clip "_yeswayfence_funcinfclip1" blocks Infected @ setpos_exact -5521 3273 8

	Clip "_yeswayfence_funcinfclip2" blocks Infected @ setpos_exact -4632 4593 8

	Clip "_yeswayfence_funcinfclip3" blocks Infected @ setpos_exact -3736 4867 8

	LADDER: _ladder_airportleft_cloned_airportright

	LADDER: _ladder_airportmidB_cloned_airportright

	LADDER: _ladder_airportmidT_cloned_onewayfence

	LADDER: _ladder_constructnewarea_cloned_alleyelecbox

	LADDER: _ladder_constructnewpipe_cloned_prevunused

	LADDER: _ladder_constructpillarB_cloned_alleyfirstpipe

	LADDER: _ladder_constructpillarT_cloned_whitepillar

	LADDER: _ladder_constructionfireescapea_cloned_tricountytop

	LADDER: _ladder_constructionfireescapeb_cloned_skybridgetiny

	LADDER: _ladder_fireescapehelpera_cloned_skybridgetiny

	LADDER: _ladder_fireescapehelperb_cloned_skybridgetiny

	LADDER: _ladder_tallibeamright_cloned_tallibeamleft

	LADDER: _ladder_yellowgirder_cloned_skybridgemini

	LADDER: _ladder_yesdrawtripleL_cloned_skybridgetiny

	LADDER: _ladder_yesdrawtripleR_cloned_firewindow

	LADDER: _ladder_yeswayfenceback1_cloned_1stfenceback

	LADDER: _ladder_yeswayfenceback2_cloned_1stfenceback

	LADDER: _ladder_yeswayfenceback3_cloned_1stfenceback

	LADDER: _ladder_yeswayfenceback4_cloned_2ndfenceback

	LADDER: _ladder_yeswayfenceback5_cloned_2ndfenceback

	LADDER: _ladder_yeswayfenceback6_cloned_2ndfenceback

	LADDER: _ladder_yeswayfencefront1_cloned_1stfenceback

	LADDER: _ladder_yeswayfencefront2_cloned_1stfenceback

	LADDER: _ladder_yeswayfencefront3_cloned_1stfenceback

	LADDER: _ladder_yeswayfencefront4_cloned_1stfenceback

	LADDER: _ladder_yeswayfencefront5_cloned_2ndfenceback

	LADDER: _ladder_yeswayfencefront6_cloned_2ndfenceback

	LADDER: _ladder_yeswayfencefront7_cloned_2ndfenceback

	LADDER: _ladder_yeswayfencefront8_cloned_2ndfenceback

	Static prop "_constructsite_fireescapetop" W/ "models/props_urban/fire_escape_upper.mdl" @ setpos_exact -5392 -1067 792

	Static prop "_constructsite_fireescapebot" W/ "models/props_urban/fire_escape_lower.mdl" @ setpos_exact -5392 -1067 664

	Static prop "_constructsite_propladdera" W/ "models/props_pipes/concrete_pipe001a.mdl" @ setpos_exact -7629 -1214 222

	Static prop "_constructsite_propladderb" W/ "models/props_pipes/concrete_pipe001a.mdl" @ setpos_exact -7531 -1212 236

	Static prop "_constructsite_propladderc" W/ "models/props_urban/metal_plate001.mdl" @ setpos_exact -7573 -1199 291

	Static prop "_constructsite_scaffold" W/ "models/props_equipment/scaffolding.mdl" @ setpos_exact -7551 -1710 80

	Static prop "_constructsite_wrongwaya" W/ "models/props_misc/wrongway_sign01_optimized.mdl" @ setpos_exact -7967 -1760 232

	Static prop "_constructsite_wrongwayb" W/ "models/props_misc/wrongway_sign01_optimized.mdl" @ setpos_exact -7967 -1505 232

	Static prop "_constructsite_wrongwayc" W/ "models/props_misc/wrongway_sign01_optimized.mdl" @ setpos_exact -7967 -1250 232

	Static prop "_constructsite_wrongwayd" W/ "models/props_misc/wrongway_sign01_optimized.mdl" @ setpos_exact -7051 -745 789

	Static prop "_constructsite_wrongwaye" W/ "models/props_misc/wrongway_sign01_optimized.mdl" @ setpos_exact -7325 -745 789

	Static prop "_constructsite_wrongwayf" W/ "models/props_misc/wrongway_sign01_optimized.mdl" @ setpos_exact -7490 -2346 590

	Static prop "_constructsite_wrongwayg" W/ "models/props_misc/wrongway_sign01_optimized.mdl" @ setpos_exact -7340 -2475 590

	Static prop "_fadedistfix_airport_acunitleft" W/ "models/props_rooftop/acvent01.mdl" @ setpos_exact -1344.2 4559.64 384.299

	Static prop "_fadedistfix_airport_acunitright" W/ "models/props_rooftop/acvent01.mdl" @ setpos_exact -1344.2 4015.64 384.299

	Static prop "_yesdrawtriple_surface" W/ "models/props_update/c11m3_nodraw_cinderwall.mdl" @ setpos_exact -2948 1392 224

	Static prop "_yeswayfence_curb" W/ "models/props_update/c11m3_wrongway_curb.mdl" @ setpos_exact -4512 3264 0

	Static prop "_yeswayfence_van" W/ "models/props_vehicles/van.mdl" @ setpos_exact -5221 3669 16

	Static prop "_yeswayfence_vanglass" W/ "models/props_vehicles/van_glass.mdl" @ setpos_exact -5221 3669 16

	Static prop "_yeswayfence_wall" W/ "models/props_update/c11m3_wrongway_fence.mdl" @ setpos_exact -4448 3072 96

	Static prop "_yeswayfence_wrongway1" W/ "models/props_misc/wrongway_sign01_optimized.mdl" @ setpos_exact -5521 2393 72

	Static prop "_yeswayfence_wrongway2" W/ "models/props_misc/wrongway_sign01_optimized.mdl" @ setpos_exact -5521 2833 72

	Static prop "_yeswayfence_wrongway3" W/ "models/props_misc/wrongway_sign01_optimized.mdl" @ setpos_exact -5521 3273 72

	Static prop "_yeswayfence_wrongway4" W/ "models/props_misc/wrongway_sign01_optimized.mdl" @ setpos_exact -5521 3713 72

	Static prop "_yeswayfence_wrongway5" W/ "models/props_misc/wrongway_sign01_optimized.mdl" @ setpos_exact -5521 4153 72

	Static prop "_yeswayfence_wrongway6" W/ "models/props_misc/wrongway_sign01_optimized.mdl" @ setpos_exact -5072 4593 72

	Static prop "_yeswayfence_wrongway7" W/ "models/props_misc/wrongway_sign01_optimized.mdl" @ setpos_exact -4632 4593 72

	Static prop "_yeswayfence_wrongway8" W/ "models/props_misc/wrongway_sign01_optimized.mdl" @ setpos_exact -4192 4593 72

	Physics prop "_losblocker_closetcrate" W/ "models/props_junk/wood_crate002a.mdl" @ setpos_exact -559 3577 335

	Ladder found @ "-1539.5 1472 192.315" and shifted w/ offset @ "-1 0 0"

	Ladder found @ "-3352 2426 110" and shifted w/ offset @ "0 -1 0"

------------------------------------------------------------------------------------------------------------------------

DEAD AIR - THE TERMINAL || c11m4_terminal

All:

	Clip "_conveyorvent_upper" blocks Survivors @ setpos_exact 632 928 368

	Clip "_conveyorvent_lower" blocks Survivors @ setpos_exact 712 928 160

	Clip "_permstuck_ladderqol" blocks Infected @ setpos_exact 580 3565 524

	Clip "_booster_atlaswon" blocks Survivors @ setpos_exact 1978.4 1555.4 448

	Clip "_booster_drophole" blocks Survivors @ setpos_exact -15 5336 512

	Clip "_booster_barbyoutcrop" blocks Survivors @ setpos_exact 302 4460 488

	Clip "_booster_skylight" blocks Survivors @ setpos_exact -39 4459 763

	Clip "_booster_vent" blocks Survivors @ setpos_exact 386 4112 241

	Clip "_booster_bannerb" blocks Survivors @ setpos_exact -200 4163 600

	Clip "_booster_bannera" blocks Survivors @ setpos_exact -200 4674 472

	Clip "_booster_pipea" blocks Survivors @ setpos_exact 302 5096 519

	Clip "_booster_pipeb" blocks Survivors @ setpos_exact 302 3801 519

	Clip "_chairbodypile_smoother" blocks Everyone @ setpos_exact 500 5301 295

	Clip "_hallwayguard_right" blocks Everyone @ setpos_exact 693 5566.3 296

	Clip "_hallwayguard_left" blocks Everyone @ setpos_exact 667.5 5679.3 296

	Static prop "_cosmetic_wallpaper" W/ "models/props_unique/zombiebreakwallexteriorairport01_main.mdl" @ setpos_exact 2507.95 3263.99 216

	Static prop "_cosmetic_wallblock" W/ "models/props_unique/zombiebreakwallhospitalexterior01_main.mdl" @ setpos_exact 2507.99 3263.99 252

	LIGHTS:	Metal detector spotlight was never moved for L4D2's port -- but it's fixed now!

PvP:

	Safe room Commons SPAWN_IN_FRONT_OF_SURVIVORS fix created @ setpos_exact 2552 4080 152

	Clip "_altpath_escalator" blocks Survivors @ setpos_exact 2289 1737 51

	Brush "_losfix_chairs1" created @ setpos_exact 2976 2257 162

	Brush "_losfix_chairs2" created @ setpos_exact 3022 3230 161

	Brush "_losfix_chairs3" created @ setpos_exact 2967 3931 162

	Brush "_losfix_chairs_long1" created @ setpos_exact 2969 3383 162

	Brush "_losfix_chairs_long2" created @ setpos_exact 2968 3760 162

	Brush "_losfix_chairs_long3" created @ setpos_exact 2970 4924 162

	Brush "_losfix_chairs_long4" created @ setpos_exact 2971 5097 162

	Brush "_losfix_chairs_long5" created @ setpos_exact 2970 5457 162

	Clip "_collision_terminaltruss1" blocks Infected @ setpos_exact -202 4742 670

	Clip "_collision_terminaltruss2" blocks Infected @ setpos_exact 128 4230 582

	Clip "_collision_terminaltruss3" blocks Infected @ setpos_exact -400 4230 630

	Clip "_ladder_baggageclaim_rampclip" blocks Infected @ setpos_exact 640 4417 305

	Clip "_ladderqol_vaneventarea_left" blocks Infected @ setpos_exact 306 5104 264

	Clip "_ladderqol_vaneventarea_right" blocks Infected @ setpos_exact 306 3811 264

	Clip "_losblocker_finalrun_clip" blocks Survivors @ setpos_exact 3032 3925 320

	LADDER: _ladder_baggageclaim_cloned_farluggageback

	LADDER: _ladder_exploitventB_cloned_basheddoors

	LADDER: _ladder_exploitventT_cloned_givebloodrubble

	LADDER: _ladder_farluggagefront_cloned_farluggageback

	LADDER: _ladder_midluggagefront_cloned_midluggageback

	LADDER: _ladder_midventfront_cloned_midventback

	Navblocker "_losblocker_finalrun_navblock" blocks Everyone w/ Apply @ setpos_exact 3050 3925 153

	Static prop "_losblocker_finalrun_screen" W/ "models/props_unique/airportdeparturescreen01.mdl" @ setpos_exact 2983 3925 151.25

	trigger_auto_crouch "_duckqol_missingvent" created @ setpos_exact 716 928 160

	trigger_playermovement "_duckqol_vanfence" with Option Duck @ setpos_exact -285 3524 191

	Navmesh modified w/ CHECKPOINT @ setpos_exact 3175 4562 152

Coop:

	Safe room Commons SPAWN_IN_FRONT_OF_SURVIVORS fix created @ setpos_exact 2552 4080 152

------------------------------------------------------------------------------------------------------------------------

DEAD AIR - RUNWAY FINALE || c11m5_runway

All:

	Clip "_lowthinwing_collision" blocks Everyone @ setpos_exact -6057 9725 -12

	Clip "_nav_skybridge" blocks Survivors @ setpos_exact -6035 8761 32

	Clip "_nav_firering_cheese" blocks Survivors @ setpos_exact -3408 9155 -192

	Clip "_planecrash_concreteramp" blocks Infected @ setpos_exact -4127 11223 -128

	Static prop "_terry" W/ "models/deadbodies/dead_male_civilian_body.mdl" @ setpos_exact -4154 9350 -140

PvP:

	Brush "_losfix_lowthinwing" created @ setpos_exact -6057 9725 -12

	Brush "_losfix_truck1" created @ setpos_exact -5039 8665 -180

	Brush "_losfix_truck2" created @ setpos_exact -4968 8695 -181

	Brush "_losfix_truck3" created @ setpos_exact -5093 8635 -180

	Clip "_boardingramp_wallclip" blocks Infected @ setpos_exact -5824 10391.5 220

	Clip "_collapsedbuilding_clip1" blocks Infected @ setpos_exact -6506 7723 -123

	Clip "_collapsedbuilding_clip2" blocks Infected @ setpos_exact -6495 7469 403

	Clip "_lowthinwing_collision" blocks Everyone @ setpos_exact -6057 9725 -12

	Clip "_planecrash_concreteramp" blocks Infected @ setpos_exact -4127 11223 -128

	LADDER: _ladder_boardingtables_cloned_cargocontainerfront

	LADDER: _ladder_catertruckleft1_cloned_escapeplaneright

	LADDER: _ladder_catertruckleft2_cloned_escapeplaneright

	LADDER: _ladder_catertruckright1_cloned_escapeplaneright

	LADDER: _ladder_catertruckright2_cloned_escapeplaneright

	LADDER: _ladder_collapsedbuilding_cloned_escapeplaneleft

	LADDER: _ladder_collapsedbuildingdoor_cloned_cargocontainerfront

	LADDER: _ladder_skybridgeleft_cloned_skybridgemid

	LADDER: _ladder_wreckedengine_cloned_escapeplaneleft

	LADDER: _ladder_wreckedfuselage_cloned_cargoslanted

	LADDER: _ladder_wreckedrear_cloned_escapeplaneleft

	Static prop "_losblocker_fireline_tractor" W/ "models/props_vehicles/airport_baggage_tractor.mdl" @ setpos_exact -2980.23 10393 -141

	PROP:	Baggage cart under the plane wing moved closer to the ring of fire to give infected better spawn points

	Deleted ([260] prop_physics) @ setpos_exact -3704.09 8863.66 -166.781

	Physics prop "_replacement_baggagecart" W/ "models/props_vehicles/airport_baggage_cart2.mdl" @ setpos_exact -3791 9604 -191

	FILE:	RunScriptFile'd "c11m5_versus_planecrash.nut" for ladders and LOS fixes.

	Navblocker "_debris_navblock_1" blocks Infected w/ Apply @ setpos_exact -4085 11291 -88

	Navblocker "_debris_navblock_2" blocks Infected w/ Apply @ setpos_exact -3735 10741 -88

	Navblocker "_debris_navblock_3" blocks Infected w/ Apply @ setpos_exact -3575 10531 -88

	Navblocker "_debris_navblock_4" blocks Infected w/ Apply @ setpos_exact -3435 10361 -88

	Navblocker "_debris_navblock_5" blocks Infected w/ Apply @ setpos_exact -3435 10271 -88

	Navblocker "_debris_navblock_6" blocks Infected w/ Apply @ setpos_exact -3085 10771 -88

	Navblocker "_debris_navblock_7" blocks Infected w/ Apply @ setpos_exact -2795 10681 -88

	Navblocker "_debris_navblock_8" blocks Infected w/ Apply @ setpos_exact -2795 10471 -88

	Trigger "_debris_trigpush_1" pushes Infected w/ speed 610 @ setpos_exact -4085 11291 -88

	Trigger "_debris_trigpush_2" pushes Infected w/ speed 610 @ setpos_exact -3735 10741 -88

	Trigger "_debris_trigpush_3" pushes Infected w/ speed 610 @ setpos_exact -3575 10531 -88

	Trigger "_debris_trigpush_4" pushes Infected w/ speed 610 @ setpos_exact -3435 10361 -88

	Trigger "_debris_trigpush_5" pushes Infected w/ speed 610 @ setpos_exact -3435 10271 -88

	Trigger "_debris_trigpush_6" pushes Infected w/ speed 610 @ setpos_exact -3085 10771 -88

	Trigger "_debris_trigpush_7" pushes Infected w/ speed 610 @ setpos_exact -2795 10681 -88

	Trigger "_debris_trigpush_8" pushes Infected w/ speed 610 @ setpos_exact -2795 10471 -88

	LADDER: _ladder_debriscabinleft_cloned_escapeplaneright

	LADDER: _ladder_debriscabinright_cloned_escapeplaneright

	LADDER: _ladder_debriscabinfront_cloned_escapeplaneleft

	LADDER: _ladder_debriswing_cloned_cargocontainerright

	Brush "_losfix_debris_1a" created @ setpos_exact -3020 11040 35

	Brush "_losfix_debris_1b" created @ setpos_exact -2870 11028 33

	Brush "_losfix_debris_1c" created @ setpos_exact -2720 10988 26

	Brush "_losfix_debris_1d" created @ setpos_exact -2699 10948 16

	Brush "_losfix_debris_1e" created @ setpos_exact -2678 10913 7

	Brush "_losfix_debris_1f" created @ setpos_exact -2670 10878 7

	Clip "_losfix_debris_1clipa" blocks Infected @ setpos_exact -2854 10895 -17

	Clip "_losfix_debris_1clipb" blocks Infected @ setpos_exact -2867 11010 3

	Clip "_losfix_debris_1clipc" blocks Infected @ setpos_exact -2706 10945 3

	Clip "_losfix_debris_1clipd" blocks Infected @ setpos_exact -2672 10881 3

	Clip "_losfix_debris_1clipe" blocks Infected @ setpos_exact -2670 10894 3

	Brush "_losfix_debris_2a" created @ setpos_exact -2733 10965 99

	Brush "_losfix_debris_2b" created @ setpos_exact -2725 10957 103

	Brush "_losfix_debris_2c" created @ setpos_exact -2717 10931 100

	Brush "_losfix_debris_2d" created @ setpos_exact -2707 10905 118

	Brush "_losfix_debris_2e" created @ setpos_exact -2697 10880 118

	Brush "_losfix_debris_2f" created @ setpos_exact -2687 10855 118

	Brush "_losfix_debris_2g" created @ setpos_exact -2677 10830 118

	Brush "_losfix_debris_2h" created @ setpos_exact -2667 10805 118

	Clip "_losfix_debris_2clip" blocks Infected @ setpos_exact -2698 10884 69

	Brush "_losfix_debris_3a" created @ setpos_exact -3220 11085 42

	Brush "_losfix_debris_3b" created @ setpos_exact -3300 11125 42

	Clip "_losfix_debris_3clip" blocks Infected @ setpos_exact -3217 11068 48

	Brush "_losfix_debris_4a" created @ setpos_exact -2910 10743 -26

	Brush "_losfix_debris_4b" created @ setpos_exact -2936 10743 -20

	Brush "_losfix_debris_4c" created @ setpos_exact -2898 10693 -33

	Brush "_losfix_debris_4d" created @ setpos_exact -2886 10679 -48

	Brush "_losfix_debris_4e" created @ setpos_exact -2876 10665 -55

	Brush "_losfix_debris_4f" created @ setpos_exact -2866 10655 -65

	Brush "_losfix_debris_4g" created @ setpos_exact -2866 10639 -73

	Brush "_losfix_debris_4h" created @ setpos_exact -2866 10627 -83

	Clip "_losfix_debris_4clip" blocks Infected @ setpos_exact -2910 10714 -61

	Brush "_losfix_debris_5a" created @ setpos_exact -3490 10660 -53

	Brush "_losfix_debris_5b" created @ setpos_exact -3520 10660 -43

	Brush "_losfix_debris_5c" created @ setpos_exact -3540 10690 -43

	Brush "_losfix_debris_5d" created @ setpos_exact -3590 10720 -43

	Brush "_losfix_debris_5e" created @ setpos_exact -3640 10785 -43

	Brush "_losfix_debris_5f" created @ setpos_exact -3740 10850 -43

	Brush "_losfix_debris_5g" created @ setpos_exact -3840 10950 -43

	Brush "_losfix_debris_5h" created @ setpos_exact -3920 11050 -28

	Brush "_losfix_debris_5i" created @ setpos_exact -4030 11050 -43

	Brush "_losfix_debris_5j" created @ setpos_exact -3755 10640 0

	Brush "_losfix_debris_5k" created @ setpos_exact -3765 10660 0

	Brush "_losfix_debris_5l" created @ setpos_exact -3775 10680 0

	Brush "_losfix_debris_5m" created @ setpos_exact -3787 10700 0

	Brush "_losfix_debris_5n" created @ setpos_exact -3799 10710 0

	Clip "_losfix_debris_5clipa" blocks Infected @ setpos_exact -3618 10750 -70

	Clip "_losfix_debris_5clipb" blocks Infected @ setpos_exact -3716 10867 -178

	Clip "_losfix_debris_5clipc" blocks Infected @ setpos_exact -3893 10838 -110

	Clip "_losfix_debris_5clipd" blocks Infected @ setpos_exact -3995 11241 -42

	Clip "_losfix_debris_5clipe" blocks Infected @ setpos_exact -4108 11488 -102

	Brush "_losfix_debris_6a" created @ setpos_exact -3750 10790 86

	Brush "_losfix_debris_6b" created @ setpos_exact -3770 10805 -4

	Brush "_losfix_debris_6c" created @ setpos_exact -3790 10850 84

	Brush "_losfix_debris_6d" created @ setpos_exact -3750 10820 48

	Brush "_losfix_debris_6e" created @ setpos_exact -3565 10690 53

	Brush "_losfix_debris_6f" created @ setpos_exact -3965 10935 41

	Clip "_losfix_debris_6clipa" blocks Infected @ setpos_exact -3744 10808 50

	Clip "_losfix_debris_6clipb" blocks Infected @ setpos_exact -3654 10898 50

	Clip "_losfix_debris_7clipa" blocks Infected @ setpos_exact -4340 11609 -169

	Clip "_losfix_debris_7clipb" blocks Infected @ setpos_exact -4179 11609 -148

	Clip "_losfix_debris_7clipc" blocks Infected @ setpos_exact -3977 11658 -191

	Clip "_losfix_debris_7clipd" blocks Infected @ setpos_exact -4090 11838 -210

------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------

BLOOD HARVEST - THE WOODS || c12m1_hilltop

All:

	Clip "_curvejump_fence" blocks Survivors @ setpos_exact -10342 -8897 517

	Clip "_cliprework_unattackable" blocks Survivors @ setpos_exact -8080 -8448 880.6

	Clip "_permstuck_treeandrock" blocks Everyone @ setpos_exact -11270 -9471 447

	Clip "_nav_quarrybeams" blocks Survivors @ setpos_exact -7808 -9481 512

	Clip "_tankpunch_deflector" blocks Survivors @ setpos_exact -11503 -10981 375

	Clip "_dispcrouch_smoker" blocks Everyone @ setpos_exact -10650 -15068 -46

	Insta-kill "_instakill_longperimeter1" Survivor @ setpos_exact -11827 -13824 -84

	Insta-kill "_instakill_longperimeter2" Survivor @ setpos_exact -12855 -10361 -84

	Insta-kill "_instakill_fallrevivefence" Survivor @ setpos_exact -8883 -8543 87

	Insta-kill "_instakill_fallrevivenoper" Survivor @ setpos_exact -9496 -7665 -96

PvP:

	Deleted func_playerinfected_clip @ setpos_exact -10432 -9227 1097.5

	Deleted func_playerinfected_clip @ setpos_exact -11072 -9227 1097.5

	Deleted func_playerinfected_clip @ setpos_exact -7564 -14656 688

	Deleted func_playerinfected_clip @ setpos_exact -9672 -12712 672

	Deleted func_playerinfected_clip @ setpos_exact -9962.5 -13558.1 1270.84

	Deleted func_playerinfected_clip @ setpos_exact -9672 -13833.4 1270.84

	Deleted func_playerinfected_clip @ setpos_exact -10304 -13006 1144.44

	Deleted func_playerinfected_clip @ setpos_exact -8528 -8352 1098.19

	Deleted func_playerinfected_clip @ setpos_exact -6448 -7283 1342

	Deleted func_playerinfected_clip @ setpos_exact -5592 -7267 1130

	Deleted func_playerinfected_clip @ setpos_exact -8544 -7816 688

	Clip "_ladder_rockcliffback_clip" blocks Infected @ setpos_exact -10172 -10751 813

	Clip "_ladderqol_rockcliff" blocks Infected @ setpos_exact -10235 -12716 528

	Clip "_meticulous_funcinfclip00" blocks Infected @ setpos_exact -7624 -14554 257

	Clip "_meticulous_funcinfclip01" blocks Infected @ setpos_exact -7806 -7614 1536

	Clip "_meticulous_funcinfclip02" blocks Infected @ setpos_exact -9771 -13110 257

	Clip "_meticulous_funcinfclip03" blocks Infected @ setpos_exact -9849 -12580 257

	Clip "_meticulous_funcinfclip04" blocks Infected @ setpos_exact -10788 -8902 557

	Clip "_meticulous_funcinfclip05" blocks Infected @ setpos_exact -11103 -9082 557

	Clip "_meticulous_funcinfclip06" blocks Infected @ setpos_exact -9996 -8345 738

	Clip "_meticulous_funcinfclip07" blocks Infected @ setpos_exact -6728 -7101 820

	Clip "_meticulous_funcinfclip08" blocks Infected @ setpos_exact -5988 -6941 820

	Clip "_meticulous_funcinfclip09" blocks Infected @ setpos_exact -5988 -6941 -65

	Clip "_meticulous_stuckspot" blocks Infected @ setpos_exact -9801 -13140 120

	Clip "_meticulous_slidespot" blocks Infected @ setpos_exact -10932 -8918 432

	LADDER: _ladder_1stcliffback_cloned_startwide

	LADDER: _ladder_1stclifffront_cloned_prebridgewide

	LADDER: _ladder_2ndcliffback_cloned_endfencewide

	LADDER: _ladder_2ndclifffront_cloned_postbridgewide

	LADDER: _ladder_2ndclifftank_cloned_elecboxchairs

	LADDER: _ladder_endelecbox_cloned_elecboxchairs

	LADDER: _ladder_endfenceback_cloned_farunused

	LADDER: _ladder_endfencefront_cloned_freighttripipe

	LADDER: _ladder_rockcliffback_cloned_unusedladder

	LADDER: _ladder_skybridgeleftB_cloned_trackstoshed

	LADDER: _ladder_skybridgeleftT_cloned_trackstoshed

	LADDER: _ladder_skybridgerightB_cloned_trackstoshed

	LADDER: _ladder_skybridgerightT_cloned_trackstoshed

	Ladder found @ "-10213 -12939 834.173" and shifted w/ offset @ "22 0 0"

	Deleted func_playerinfected_clip @ setpos_exact -9556 -13664 688

------------------------------------------------------------------------------------------------------------------------

BLOOD HARVEST - THE TUNNEL || c12m2_traintunnel

All:

	Clip "_cliprework_outdoors01" blocks Survivors @ setpos_exact -7720 -8476 616

	Clip "_cliprework_outdoors03" blocks Survivors @ setpos_exact -7720 -8476 616

	Clip "_cliprework_outdoors02" blocks Survivors @ setpos_exact -7720 -8476 616

	Clip "_cliprework_outdoors04" blocks Survivors @ setpos_exact -7720 -8476 616

	Clip "_nav_eventlight1" blocks Survivors @ setpos_exact -8021 -7500 191

	Clip "_nav_eventlight2" blocks Survivors @ setpos_exact -6613 -7752 247

	Clip "_stuckwarp_rocketdude" blocks Everyone @ setpos_exact -5430 -8170 217

	Clip "_rubble_smoother" blocks Everyone @ setpos_exact -1777 -9480 -25

	trigger_auto_crouch "_duckqol_ventduct" created @ setpos_exact -8728 -7494 92

PvP:

	Deleted func_playerinfected_clip @ setpos_exact -7808 -7360 1711.28

	Tank/Charger chokepoint atomizer created @ setpos_exact -8604 -7271 -64

	Tank/Charger chokepoint atomizer created @ setpos_exact -8604 -7531 -64

	Clip "_charger_smoother_01" blocks Everyone @ setpos_exact -8733 -8038 176

	Clip "_charger_smoother_02" blocks Everyone @ setpos_exact -7500 -8038 176

	Clip "_ladder_indoorventduct_clip" blocks Everyone @ setpos_exact -8170 -6300 -64

	Clip "_ladder_parkourvent_clip" blocks Infected @ setpos_exact -8723 -7415 163

	Clip "_meticulous_funcinfclip01" blocks Infected @ setpos_exact -7806 -7614 1536

	LADDER: _ladder_boxcarbm1mirr_cloned_firstwindow

	LADDER: _ladder_boxcarcm1mirr_cloned_firstwindow

	LADDER: _ladder_eventdoorback_cloned_triplepipes

	LADDER: _ladder_eventdoorfront_cloned_triplepipes

	LADDER: _ladder_indoorboxcar_cloned_warehousecorner

	LADDER: _ladder_indoorventduct_cloned_unusedcliff

	LADDER: _ladder_parkourvent_cloned_insideboxcar

	LADDER: _ladder_skybridgeleftB_cloned_trackstoshed

	LADDER: _ladder_skybridgeleftT_cloned_trackstoshed

	LADDER: _ladder_skybridgem1mirr_cloned_restoredbluebox

	LADDER: _ladder_skybridgerightB_cloned_trackstoshed

	LADDER: _ladder_skybridgerightT_cloned_trackstoshed

	LADDER: _ladder_starthugevent_cloned_traintracktall

	LADDER: _ladder_tankbeamescape_cloned_insideboxcar

	LADDER: _ladder_warehouseboxes_cloned_warehousecorner

	Ladder found @ "-4322 -8715 32" and shifted w/ offset @ "71 0 21"

	Ladder found @ "-5991 -8719 32" and shifted w/ offset @ "247 0 21"

	Static prop "_easter_dorykcir" W/ "models/weapons/melee/w_crowbar.mdl" @ setpos_exact -8690 -7340 201

	Static prop "_easter_yofffej" W/ "models/props_junk/gnome.mdl" @ setpos_exact -8695 -7340 211

	QOL:	Deleted blockers to allow ghost infected to pass through the event door for Versus-only QoL.

	Deleted ([466] func_brush) @ setpos_exact -8600 -7540 -8.125

	Deleted ([467] func_brush) @ setpos_exact -8600 -7524 -8.125

Survival:

	Clip "_nav_wareshelf" blocks Survivors @ setpos_exact -8740 -6996 170

	Navblocker "_survival_navblock_stairs" blocks Everyone w/ Apply @ setpos_exact -6688 -7700 -80

------------------------------------------------------------------------------------------------------------------------

BLOOD HARVEST - THE BRIDGE || c12m3_bridge

All:

	Clip "_dispcrouch_preslope" blocks Everyone @ setpos_exact 3090 -10118 -23

	Clip "_dispcrouch_trains" blocks Everyone @ setpos_exact 4120 -14380 88

	Clip "_dispcrouch_eventlever" blocks Everyone @ setpos_exact 8302 -13946 21

	Clip "_dispcrouch_recompilefail" blocks Everyone @ setpos_exact 5930 -14086 -70

	Clip "_permstuck_eventlever" blocks Everyone @ setpos_exact 8150 -13811 57

	Clip "_nav_bridgecollapsea" blocks Survivors @ setpos_exact 5854 -12656 -41.3

	Clip "_nav_bridgecollapseb" blocks Survivors @ setpos_exact 6000 -12656 -41.3

	Clip "_stuckwarp_endtunnel" blocks Everyone @ setpos_exact 968 -12932 20

	Clip "_permstuck_terribadcliff" blocks Everyone @ setpos_exact 7317 -11487 451

	MOVER:	Clip "_bridge_dynamic_clip" simulated to move when bridge collapses.

	Clip "_bridge_dynamic_clip" blocks Survivors @ setpos_exact 5932 -13314 272

PvP:

	Safe room Commons SPAWN_IN_FRONT_OF_SURVIVORS fix created @ setpos_exact 7136 -11876 394

	Deleted func_playerinfected_clip @ setpos_exact 1536 -10864 383.75

	Deleted func_playerinfected_clip @ setpos_exact 5760 -12928 600

	Clip "_ladder_generatorhouse_clip" blocks Everyone @ setpos_exact 6531 -13083 -58

	Clip "_ladder_newtankperch_clip" blocks Infected @ setpos_exact 3465 -10222 158

	Clip "_ladder_pinkstairwell_clip" blocks Survivors @ setpos_exact 1740 -12296 260

	Clip "_ladder_rightquickcliff_clip" blocks Infected @ setpos_exact 2032 -10510 232

	Clip "_ladder_rightquickcliff_rock" blocks Infected @ setpos_exact 2101 -10514 17

	Clip "_ladder_startventshaft_clipleft" blocks Everyone @ setpos_exact -1030 -10911 -32

	Clip "_ladder_startventshaft_clipright" blocks Everyone @ setpos_exact -1005 -10903 -32

	Clip "_meticulous_funcinfclip01" blocks Infected @ setpos_exact -688 -10708 321

	Clip "_meticulous_funcinfclip02" blocks Infected @ setpos_exact 262 -11524 321

	Clip "_meticulous_funcinfclip03" blocks Infected @ setpos_exact 1323 -12178 321

	Clip "_meticulous_funcinfclip04" blocks Infected @ setpos_exact 1616 -12255 321

	Clip "_meticulous_funcinfclip05" blocks Infected @ setpos_exact 262 -11524 321

	Clip "_meticulous_funcinfclip06" blocks Infected @ setpos_exact 2560 -12100 321

	Clip "_meticulous_funcinfclip07" blocks Infected @ setpos_exact 3276 -11409 321

	Clip "_meticulous_funcinfclip08" blocks Infected @ setpos_exact 3821 -10047 321

	Clip "_meticulous_funcinfclip09" blocks Infected @ setpos_exact 1980 -9420 321

	Clip "_meticulous_funcinfclip10" blocks Infected @ setpos_exact -132 -9696 321

	Clip "_meticulous_funcinfclip11" blocks Infected @ setpos_exact 2361 -13935 321

	Clip "_meticulous_funcinfclip12" blocks Infected @ setpos_exact 5344 -14507 321

	Clip "_meticulous_funcinfclip13" blocks Infected @ setpos_exact 9070 -14172 321

	Clip "_meticulous_funcinfclip14" blocks Infected @ setpos_exact 9216 -13284 321

	Clip "_meticulous_funcinfclip15" blocks Infected @ setpos_exact 8456 -12150 321

	Clip "_meticulous_funcinfclip16" blocks Infected @ setpos_exact 8153 -11970 321

	Clip "_meticulous_funcinfclip17" blocks Infected @ setpos_exact 7954 -11343 321

	Clip "_meticulous_funcinfclip18" blocks Infected @ setpos_exact 7660 -11343 321

	Clip "_meticulous_funcinfclip19" blocks Infected @ setpos_exact 6359 -11309 321

	Clip "_meticulous_funcinfclip20" blocks Infected @ setpos_exact 4998 -11810 321

	Clip "_meticulous_funcinfclip21" blocks Infected @ setpos_exact 3060 -12382 321

	Clip "_tunneltophill_wrongway_clip" blocks Infected @ setpos_exact 3320 -12528 658

	LADDER: _ladder_backtrains_cloned_midmound

	LADDER: _ladder_barnhousefront_cloned_treetrunkcliff

	LADDER: _ladder_generatorhouse_cloned_doublerbottom

	LADDER: _ladder_leftcliffmini_cloned_startcliff

	LADDER: _ladder_lobsterrock_cloned_startcliff

	LADDER: _ladder_newtankperchB_cloned_midmound

	LADDER: _ladder_newtankperchT_cloned_midmound

	LADDER: _ladder_peskyrooftopB_cloned_midmound

	LADDER: _ladder_peskyrooftopT_cloned_midmound

	LADDER: _ladder_rightquickcliff_cloned_trainshedpipe

	LADDER: _ladder_startventshaft_cloned_treetrunkcliff

	LADDER: _ladder_tunnelexittop1_cloned_midmound

	LADDER: _ladder_tunnelexittop2_cloned_midmound

	LADDER: _ladder_tunnelexittop3_cloned_midmound

	LADDER: _ladder_tunnelexittop4_cloned_midmound

	LADDER: _ladder_tunnelexittop5_cloned_midmound

	Static prop "_cosmetic_starthillside_treea" W/ "models/props_foliage/cedar_large01.mdl" @ setpos_exact 3643 -9364 245

	Static prop "_cosmetic_starthillside_treeb" W/ "models/props_foliage/cedar_large01.mdl" @ setpos_exact 1166 -12035 527

	Static prop "_cosmetic_starthillside_treec" W/ "models/props_foliage/cedar_large01.mdl" @ setpos_exact 1048 -11800 504

	Static prop "_cosmetic_starthillside_rock" W/ "models/props_wasteland/rock_moss04.mdl" @ setpos_exact 3760 -10536 264

	Static prop "_losblocker_finalfence" W/ "models/props_wasteland/rock_moss04.mdl" @ setpos_exact 5510 -12032 444

	Static prop "_peskyrooftop_wrongwaya" W/ "models/props_misc/wrongway_sign01_optimized.mdl" @ setpos_exact 1882 -12238 540

	Static prop "_peskyrooftop_wrongwayb" W/ "models/props_misc/wrongway_sign01_optimized.mdl" @ setpos_exact 1648 -12238 540

	Static prop "_peskyrooftop_leftside_wrongway" W/ "models/props_misc/wrongway_sign01_optimized.mdl" @ setpos_exact 2320 -11900 520

	Static prop "_peskyrooftop_rightside_wrongwaya" W/ "models/props_misc/wrongway_sign01_optimized.mdl" @ setpos_exact 1116 -11423 565

	Static prop "_peskyrooftop_rightside_wrongwayb" W/ "models/props_misc/wrongway_sign01_optimized.mdl" @ setpos_exact 1116 -11660 565

	Static prop "_redbrushclip_wrongwaya1" W/ "models/props_misc/wrongway_sign01_optimized.mdl" @ setpos_exact 5412 -12008 545

	Static prop "_redbrushclip_wrongwaya2" W/ "models/props_misc/wrongway_sign01_optimized.mdl" @ setpos_exact 5412 -12008 545

	Static prop "_redbrushclip_wrongwayb1" W/ "models/props_misc/wrongway_sign01_optimized.mdl" @ setpos_exact 5412 -12295 455

	Static prop "_redbrushclip_wrongwayb2" W/ "models/props_misc/wrongway_sign01_optimized.mdl" @ setpos_exact 5412 -12295 455

	Static prop "_tunneltopcliff_wrongwaya" W/ "models/props_misc/wrongway_sign01_optimized.mdl" @ setpos_exact 3330 -12400 825

	Static prop "_tunneltopcliff_wrongwayb" W/ "models/props_misc/wrongway_sign01_optimized.mdl" @ setpos_exact 3330 -12590 730

	Static prop "_tunneltopcliff_wrongwayc" W/ "models/props_misc/wrongway_sign01_optimized.mdl" @ setpos_exact 3390 -12400 820

	Static prop "_tunneltopcliff_wrongwayd" W/ "models/props_misc/wrongway_sign01_optimized.mdl" @ setpos_exact 3390 -12590 730

Coop:

	Safe room Commons SPAWN_IN_FRONT_OF_SURVIVORS fix created @ setpos_exact 7136 -11876 394

Survival:

	Clip "_booster_sandtower" blocks Survivors @ setpos_exact 4911 -13119 568

	Clip "_missing_tree_1" blocks Survivors @ setpos_exact 2678 -13830 418

	Clip "_missing_tree_2" blocks Survivors @ setpos_exact 3066 -14082 418

	Clip "_missing_tree_3" blocks Survivors @ setpos_exact 4214 -12710 418

	Clip "_missing_tree_4" blocks Survivors @ setpos_exact 3730 -14198 418

------------------------------------------------------------------------------------------------------------------------

BLOOD HARVEST - THE TRAIN STATION || c12m4_barn

All:

	Clip "_shortcut_warehouse" blocks Survivors @ setpos_exact 10272 -7848 152

	Clip "_commonhop_traintruss" blocks Survivors @ setpos_exact 10879 -7463 116

	Clip "_dispcrouch_traintracka" blocks Everyone @ setpos_exact 10250 -10145 -78

	Clip "_dispcrouch_traintrackb" blocks Everyone @ setpos_exact 10120 -10600 -78

	Clip "_curvejump_bridgeend" blocks Survivors @ setpos_exact 10230 -486 154

	Clip "_dispcrouch_trainwall_one" blocks Everyone @ setpos_exact 10203 -6505 -58

	Clip "_dispcrouch_trainwall_two" blocks Everyone @ setpos_exact 10177 -6376 -58

	Clip "_dispcrouch_trainwall_three" blocks Everyone @ setpos_exact 9813 -4120 0

	Clip "_permstuck_clifftree" blocks Everyone @ setpos_exact 10193 -6483 137

	Clip "_permstuck_theonetheonly" blocks Everyone @ setpos_exact 11327 -8674 -64

	Clip "_cliprework_pullcharge" blocks Survivors @ setpos_exact 9272 -11114 646

	Clip "_permstuck_forgottena" blocks Everyone @ setpos_exact 9477 -11134 602

	Clip "_permstuck_forgottenb" blocks Everyone @ setpos_exact 9268 -10468 565

	Clip "_permstuck_forgottenc" blocks Everyone @ setpos_exact 9236 -9823 415

	Clip "_permstuck_forgottend" blocks Everyone @ setpos_exact 10118 -9681 527

	Clip "_permstuck_forgottene" blocks Everyone @ setpos_exact 9742 -9561 499

	Clip "_permstuck_forgottenf" blocks Everyone @ setpos_exact 9740 -9194 435

	Clip "_permstuck_forgotteng" blocks Everyone @ setpos_exact 10077 -9388 447

	Clip "_permstuck_forgottenh" blocks Everyone @ setpos_exact 10103 -8810 320

	Clip "_permstuck_thanksagain" blocks Everyone @ setpos_exact 11403 -4579 -402

	Clip "_event_window" blocks Infected + AI @ setpos_exact 10876 -4166 88

	Safe room Commons SPAWN_IN_FRONT_OF_SURVIVORS fix created @ setpos_exact 10454 -1032 -64

	Static prop "_solidify_survivorchimney" W/ "models/props/cs_militia/fireplacechimney01.mdl" @ setpos_exact 10862.2 -6085.53 120.492

PvP:

	Clip "_commonhop_roadsidefence" blocks Survivors @ setpos_exact 10647 -7547 84

	Clip "_clipextend_traintruss" blocks Survivors @ setpos_exact 10444 -7516 232

	TRIG:	New trigger will enforce onslaught even if fence is jumped.

	Clip "_eventskip_commonhopa" blocks Survivors @ setpos_exact 10548 -4639 66

	Clip "_eventskip_commonhopb" blocks Survivors @ setpos_exact 10125 -4780 113

	Brush "_losfix_semia" created @ setpos_exact 11440 -7078 -56

	Brush "_losfix_semib" created @ setpos_exact 11440 -7048 -56

	Clip "_ladder_barnhousedoor_clip" blocks Everyone @ setpos_exact 8994 -9312 471

	Clip "_ladder_finalrooftop_permstuck" blocks Everyone @ setpos_exact 10827 -4563 -62

	Clip "_ladder_siloleft_clip1" blocks Infected @ setpos_exact 8556 -7849 1035

	Clip "_ladder_siloleft_clip2" blocks Infected @ setpos_exact 8541 -7849 1052

	Clip "_ladder_siloright_clip1" blocks Infected @ setpos_exact 8909 -7849 1035

	Clip "_ladder_siloright_clip2" blocks Infected @ setpos_exact 8894 -7849 1052

	Clip "_ladder_siloshared_clip" blocks Infected @ setpos_exact 8608 -7937 1001

	Clip "_ladder_upperplanks_clipleft" blocks Everyone @ setpos_exact 10743 -9075 -11

	Clip "_ladder_upperplanks_clipright" blocks Everyone @ setpos_exact 10678 -9067 -11

	LADDER: _ladder_atlanticdiesel_cloned_trussfenceback

	LADDER: _ladder_atlanticroofback_cloned_atlanticpipe

	LADDER: _ladder_atlanticroofleftB_cloned_bridgetower

	LADDER: _ladder_atlanticroofleftT_cloned_bridgetower

	LADDER: _ladder_barnhousedoor_cloned_atlanticpipe

	LADDER: _ladder_crashedback_cloned_trussfencefront

	LADDER: _ladder_crashedfront_cloned_trussfenceback

	LADDER: _ladder_elevatedhome_cloned_trussfencefront

	LADDER: _ladder_finalrooftopB_cloned_bridgetower

	LADDER: _ladder_finalrooftopT_cloned_bridgetower

	LADDER: _ladder_rocklobboxcar_cloned_trussfencefront

	LADDER: _ladder_shortfenceL_cloned_trussfencefront

	LADDER: _ladder_shortfenceR_cloned_backbarnshortfence

	LADDER: _ladder_siloleft_cloned_atlanticpipe

	LADDER: _ladder_siloleft_cloned_atlanticpipe

	LADDER: _ladder_siloright_cloned_atlanticpipe

	LADDER: _ladder_siloright_cloned_atlanticpipe

	LADDER: _ladder_upperplanks_cloned_bridgetower

	LADDER: _ladder_wreckedboxcar_cloned_trussfencefront

	Static prop "_ladder_atlanticroofback_pipe" W/ "models/props_mill/PipeSet08d_256_001a.mdl" @ setpos_exact 11590 -8002 77

	Static prop "_ladder_atlanticroofleft_pipe" W/ "models/props_rooftop/Gutter_Pipe_256.mdl" @ setpos_exact 10632 -7672 168

	Static prop "_ladder_finalrooftop_pipe" W/ "models/props_mill/PipeSet08d_256_001a.mdl" @ setpos_exact 10842 -4603 84

	Static prop "_solidify_finalchimney1" W/ "models/props/cs_militia/fireplacechimney01.mdl" @ setpos_exact 11020 -4586 329

	Static prop "_solidify_finalchimney2" W/ "models/props/cs_militia/fireplacechimney01.mdl" @ setpos_exact 11020 -4073 329

Coop:

	TRIG_UNDO:	Delete anv_maptrigs.nut blockers which prevent train car commonhop skip for Coop-only.

	TRIG:	New trigger will enforce onslaught even if fence is jumped.

	Clip "_eventskip_commonhopa" blocks Survivors @ setpos_exact 10548 -4639 66

	Clip "_eventskip_commonhopb" blocks Survivors @ setpos_exact 10125 -4780 113

------------------------------------------------------------------------------------------------------------------------

BLOOD HARVEST - FARMHOUSE FINALE || c12m5_cornfield

All:

	Clip "_dispcrouch_spawn_right" blocks Everyone @ setpos_exact 11102 150 -115

	Clip "_dispcrouch_spawn_left" blocks Everyone @ setpos_exact 10210 1423 -29

	Clip "_permstuck_tree_a" blocks Everyone @ setpos_exact 10675 528 -7

	Clip "_permstuck_tree_b" blocks Everyone @ setpos_exact 10794 1843 -27

	Clip "_permstuck_tree_c" blocks Everyone @ setpos_exact 10456 3463 4

	Clip "_permstuck_tree_d" blocks Everyone @ setpos_exact 11064 4373 -10

	Clip "_permstuck_tree_e" blocks Everyone @ setpos_exact 7710 1651 270

	Clip "_permstuck_tree_f" blocks Everyone @ setpos_exact 6852 -750 252

	Clip "_permstuck_tree_g" blocks Everyone @ setpos_exact 6448 3092 260

	Clip "_permstuck_tree_h" blocks Everyone @ setpos_exact 5624 3236 260

	Clip "_clip_anomaly" blocks Survivors @ setpos_exact 5504 3304 1136

	Clip "_wrongway_clipa" blocks Everyone @ setpos_exact 6044 3997 196

	Clip "_wrongway_clipb" blocks Everyone @ setpos_exact 6706 4072 196

	Clip "_booster_barnroof" blocks Survivors @ setpos_exact 6986 -154 548

	Clip "_booster_haybarn" blocks Survivors @ setpos_exact 8459 424 539.5

	Clip "_booster_estateroof" blocks Survivors @ setpos_exact 6837 1124 598

	Clip "_booster_dualsilos" blocks Survivors @ setpos_exact 7362 2650 861

	Clip "_clip_anomaly_ugh" blocks Survivors @ setpos_exact 6216 3331 1101

	Clip "_undermap_exploit" blocks Survivors @ setpos_exact 4473 3860 451

	Clip "_cooponly_idle_warp" blocks Survivors @ setpos_exact 8849 3493 760

	Clip "_nav_and_stuckwarp" blocks Everyone @ setpos_exact 6485 1090 308

	LOGIC:	Point-of-no-return clip will be Enabled when finale is started.

	Clip "_point_of_no_return" blocks Survivors initially disabled @ setpos_exact 9017 3511 202

PvP:

	Deleted func_playerinfected_clip @ setpos_exact 8191 -161.002 -97.0133

	Deleted func_playerinfected_clip @ setpos_exact 7320 1220 568.063

	Brush "_losfix_gen" created @ setpos_exact 7027 793 207

	Brush "_losfix_tractor" created @ setpos_exact 8713 1804 212

	Clip "_fence_collision" blocks Infected @ setpos_exact 8520 3627 579

	Clip "_fence_stuckspot" blocks Infected @ setpos_exact 8624 3811 579

	Clip "_meticulous_funcinfclip01" blocks Infected @ setpos_exact 9765 3742 651

	Clip "_meticulous_funcinfclip02" blocks Infected @ setpos_exact 7745 4147 651

	Clip "_meticulous_funcinfclip03" blocks Infected @ setpos_exact 7745 4147 651

	Clip "_meticulous_funcinfclip04" blocks Infected @ setpos_exact 6554 4147 651

	Clip "_meticulous_funcinfclip05" blocks Infected @ setpos_exact 6554 4147 651

	Clip "_meticulous_funcinfclip06" blocks Infected @ setpos_exact 6554 4147 651

	Clip "_meticulous_funcinfclip07" blocks Infected @ setpos_exact 9329 4402 651

	Clip "_meticulous_funcinfclip08" blocks Infected @ setpos_exact 9329 4402 651

	Clip "_meticulous_funcinfclip09" blocks Infected @ setpos_exact 8936 4147 651

	Clip "_meticulous_funcinfclip10" blocks Infected @ setpos_exact 8936 4147 651

	Clip "_meticulous_funcinfclip11" blocks Infected @ setpos_exact 11776 2527 1074

	Clip "_ladder_barnhouseback_clipleft" blocks Everyone @ setpos_exact 6963 -574 200

	Clip "_ladder_barnhouseback_clipright" blocks Everyone @ setpos_exact 7024 -574 200

	Clip "_ladder_onewaydrop_collision" blocks Infected @ setpos_exact 9200 3714 393

	Clip "_ladder_onewayfence_qolclip" blocks Infected @ setpos_exact 9018 4530 399

	Clip "_ladder_siloleft_clip1" blocks Infected @ setpos_exact 7309 2735 970

	Clip "_ladder_siloleft_clip2" blocks Infected @ setpos_exact 7294 2735 984

	Clip "_ladder_siloright_clip1" blocks Infected @ setpos_exact 7662 2735 970

	Clip "_ladder_siloright_clip2" blocks Infected @ setpos_exact 7647 2735 984

	Clip "_ladder_siloshared_clip" blocks Infected @ setpos_exact 7361 2647 933

	Clip "_meticulous_permstuck" blocks Infected @ setpos_exact 8470 4808 663

	Clip "_onewaydrophill_clip" blocks Infected @ setpos_exact 9613 3664 584

	Clip "_pouncersonly_clip" blocks Infected @ setpos_exact 11382 4549 270

	Clip "_wrongway_clipa" blocks Everyone @ setpos_exact 6044 3997 196

	Clip "_wrongway_clipb" blocks Everyone @ setpos_exact 6706 4072 196

	LADDER: _ladder_barnhouseback_cloned_haybalebarn

	LADDER: _ladder_barnhouseicing_cloned_barnhousefront

	LADDER: _ladder_barricadeback_cloned_oneway

	LADDER: _ladder_barricadefront_cloned_oneway

	LADDER: _ladder_boxcardeadend_cloned_housegenerator

	LADDER: _ladder_boxcarstartline_cloned_housegenerator

	LADDER: _ladder_onewaydrop_cloned_hayhaildiesel

	LADDER: _ladder_onewayfence_cloned_housegenerator

	LADDER: _ladder_permstuck_cloned_toolshed

	LADDER: _ladder_siloleft_cloned_haybalebarn

	LADDER: _ladder_siloleft_cloned_haybalebarn

	LADDER: _ladder_siloright_cloned_haybalebarn

	LADDER: _ladder_siloright_cloned_haybalebarn

	LADDER: _ladder_tallchimneybot_cloned_haybalebarn

	LADDER: _ladder_tallchimneytop_cloned_haybalebarn

	Navblocker "_losblocker_rockleft_navblock" blocks Everyone w/ Apply @ setpos_exact 10335 1520 -64

	Static prop "_cosmetic_barric_cliffside" W/ "models/props_wasteland/rock_cliff01.mdl" @ setpos_exact 4646 4080 602

	Static prop "_cosmetic_hillside_rocka" W/ "models/props_wasteland/rock_moss04.mdl" @ setpos_exact 8760 4766 571

	Static prop "_cosmetic_hillside_rockb" W/ "models/props_wasteland/rock_moss04.mdl" @ setpos_exact 8878 4781 566

	Static prop "_cosmetic_hillside_rockc" W/ "models/props_wasteland/rock_moss04.mdl" @ setpos_exact 9000 4800 571

	Static prop "_cosmetic_hillside_tree" W/ "models/props_foliage/cedar_medium01.mdl" @ setpos_exact 9299 4928 536

	Static prop "_losblocker_barric_cliffside" W/ "models/props_wasteland/rock_moss04.mdl" @ setpos_exact 4879 2680 460

	Static prop "_losblocker_hillside_rock" W/ "models/props_wasteland/rock_moss04.mdl" @ setpos_exact 9200 4792 550

	Static prop "_losblocker_rockleft" W/ "models/props_wasteland/rock_moss04.mdl" @ setpos_exact 10344 1529.7 -14

	Static prop "_losblocker_freeatlasta" W/ "models/props_wasteland/rock_moss04.mdl" @ setpos_exact 7026 3507 421

	Static prop "_losblocker_freeatlastb" W/ "models/props_wasteland/rock_moss04.mdl" @ setpos_exact 6900 3507 410

	Static prop "_losblocker_hardlyimpossible" W/ "models/props_wasteland/rock_moss04.mdl" @ setpos_exact 6344 3782 270

	Static prop "_losblocker_treefloater" W/ "models/props_wasteland/rock_moss04.mdl" @ setpos_exact 5732 3800 227

	Static prop "_pouncersonly_wrongwaya" W/ "models/props_misc/wrongway_sign01_optimized.mdl" @ setpos_exact 11153 4780 259

	Static prop "_pouncersonly_wrongwayb" W/ "models/props_misc/wrongway_sign01_optimized.mdl" @ setpos_exact 11153 4630 259

	Static prop "_pouncersonly_wrongwayc" W/ "models/props_misc/wrongway_sign01_optimized.mdl" @ setpos_exact 11361 4164 310

	Static prop "_solidify_treesripbro" W/ "models/props_foliage/trees_cluster02.mdl" @ setpos_exact 5777.93 3757.84 265.545

	Static prop "_wrongway_propa" W/ "models/props_placeable/wrong_way.mdl" @ setpos_exact 4930 3935 540

	Static prop "_wrongway_propb" W/ "models/props_placeable/wrong_way.mdl" @ setpos_exact 5980 3935 280

	Static prop "_wrongway_propc" W/ "models/props_placeable/wrong_way.mdl" @ setpos_exact 6750 4020 465

	KILL:	Replaced "fenceSmash_clip_brush" with Survivor-only version.

	LOGIC:	Barricade ladders will be deleted 17 seconds into "relay_outro_start".

	EASTER_EGG:	Chair deleted, replaced with bumper car, SetModel to chair, clipped, parented and OnHitByTank I/O'd.

	Deleted ([333] prop_physics) @ setpos_exact 6929.47 1058.91 238.375

	Physics prop "_replacement_chair" W/ "models/props_fairgrounds/bumpercar.mdl" & mass 1.3 @ setpos_exact 6929.47 1058.91 238.375

	Clip "_replacement_chair_clip" blocks Everyone @ setpos_exact 6922 1059 238

------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------

COLD STREAM - ALPINE CREEK || c13m1_alpinecreek

All:

	Clip "_dispcrouch_watchtower" blocks Everyone @ setpos_exact -3025 2861 186

	Clip "_sneaky_hunter" blocks Infected @ setpos_exact -1169 1555 482

	Clip "_permstuck_cornercabin" blocks Everyone @ setpos_exact 1465 3478 540

	Clip "_dispcrouch_spawn" blocks Everyone @ setpos_exact -3244 54 151

PvP:

	LADDER: _ladder_crossoverbackB_cloned_mrlogsuperwide

	LADDER: _ladder_crossoverbackT_cloned_mrlogsuperwide

	LADDER: _ladder_crossoverfrontB_cloned_mrlogsuperwide

	LADDER: _ladder_crossoverfrontT_cloned_mrlogsuperwide

	LADDER: _ladder_crossoverupway_cloned_bunkerdoor

------------------------------------------------------------------------------------------------------------------------

COLD STREAM - SOUTH PINE STREAM || c13m2_southpinestream

All:

	Clip "_idkground" blocks Everyone @ setpos_exact 5345 1744 290

	Clip "_dispcrouch_upandaway" blocks Everyone @ setpos_exact 5924 1261 485

	Clip "_permstuck_chopperrocks" blocks Everyone @ setpos_exact 2150 1224 195

	Clip "_permstuck_longhedge_a" blocks Everyone @ setpos_exact 2003 2644 480

	Clip "_permstuck_longhedge_b" blocks Everyone @ setpos_exact 1226 3072 420

	Clip "_permstuck_longhedge_c" blocks Everyone @ setpos_exact 1100 3444 506

	Clip "_permstuck_longhedge_d" blocks Everyone @ setpos_exact 1072 3879 464

	Clip "_permstuck_longhedge_e" blocks Everyone @ setpos_exact 1100 4480 324

	Clip "_permstuck_tree_a" blocks Everyone @ setpos_exact 6747 2745 762

	Clip "_permstuck_tree_b" blocks Everyone @ setpos_exact 1573 1991 441

	Clip "_permstuck_tree_c" blocks Everyone @ setpos_exact 147 3367 301

	Clip "_permstuck_tree_d" blocks Everyone @ setpos_exact 392 4679 277

	Clip "_permstuck_tree_e" blocks Everyone @ setpos_exact -1459 4319 330

	Clip "_permstuck_tree_f" blocks Everyone @ setpos_exact 723 6019 375

	Clip "_surfsup" blocks Survivors @ setpos_exact -1485 5630 404

	Clip "_dispcrouch_barrelstent" blocks Everyone @ setpos_exact 979 5656 272

	Clip "_permstuck_tree_g" blocks Everyone @ setpos_exact 908 6871 697

	Clip "_permstuck_tree_h" blocks Everyone @ setpos_exact 984 6655 798

	Clip "_permstuck_tree_i" blocks Everyone @ setpos_exact 1151 6258 932

	Clip "_permstuck_tree_j" blocks Everyone @ setpos_exact 1153 5929 981

	Clip "_stuckwarp_yellowbarrels" blocks Everyone @ setpos_exact 4861 2732 608

	Safe room Commons SPAWN_IN_FRONT_OF_SURVIVORS fix created @ setpos_exact 78 8574 -405

PvP:

	Clip "_shortcut_easybigskip1" blocks Survivors @ setpos_exact 506 4983 253

	Clip "_shortcut_easybigskip2" blocks Survivors @ setpos_exact 503 4713 253

	Clip "_shortcut_easybigskip3" blocks Survivors @ setpos_exact 483 4553 253

	Brush "_losfix_gastruck1" created @ setpos_exact 4992 2301 617

	Brush "_losfix_gastruck2" created @ setpos_exact 4082 2256 524

	LADDER: _ladder_eventphysfence_cloned_endfencefront

	LADDER: _ladder_posttanksecret_cloned_cliffstraightwide

	LADDER: _ladder_pretankleft_cloned_cliffstraightwide

	LADDER: _ladder_pretankright_cloned_cliffstraightwide

------------------------------------------------------------------------------------------------------------------------

COLD STREAM - MEMORIAL BRIDGE || c13m3_memorialbridge

All:

	Clip "_permstuck_treea" blocks Everyone @ setpos_exact -3603 -6160 897

	Clip "_permstuck_treeb" blocks Everyone @ setpos_exact -3343 -5975 854

	Clip "_permstuck_treed" blocks Everyone @ setpos_exact -3310 -3600 405

	Clip "_permstuck_treec" blocks Everyone @ setpos_exact -3305 -4815 442

	Clip "_permstuck_jaynjer" blocks Everyone @ setpos_exact -4495 -4584 719

	Clip "_hangcancel_perimeter" blocks Survivors @ setpos_exact 13 -3620 896

	Clip "_sneaky_hunter" blocks Infected @ setpos_exact 5666 -5383 272

	Clip "_permstuck_shrubtreea" blocks Everyone @ setpos_exact -5080 -5712 970

	Clip "_permstuck_shrubtreeb" blocks Everyone @ setpos_exact -5034 -5307 970

	Clip "_permstuck_shrubtreec" blocks Everyone @ setpos_exact -4964 -4637 949

	Clip "_cliprework_shrubwalla" blocks Survivors @ setpos_exact -4360 -6081 815

	Clip "_cliprework_shrubwallb" blocks Survivors @ setpos_exact -4540 -5175 815

	Clip "_cliprework_shrubwallc" blocks Survivors @ setpos_exact -4540 -4507 815

	Clip "_cliprework_shrubwalld" blocks Survivors @ setpos_exact -4498 -4375 815

	Clip "_cliprework_shrubwalle" blocks Survivors @ setpos_exact -4093 -3646 815

	Clip "_clipextend_bridgeleft1" blocks Survivors @ setpos_exact -2128 -3706 1538

	Clip "_clipextend_bridgeleft2" blocks Survivors @ setpos_exact 380 -3706 1538

	Clip "_clipextend_bridgeright1" blocks Survivors @ setpos_exact -2128 -4480 1538

	Clip "_clipextend_bridgeright2" blocks Survivors @ setpos_exact -1334 -4480 1538

	Clip "_clipextend_bridgeright3" blocks Survivors @ setpos_exact -600 -4480 1538

	Clip "_cliprework_enddumpsters" blocks Survivors @ setpos_exact 5964 -3954 494

	Clip "_bridge_collision" blocks All and Physics @ setpos_exact 1004 -4091 586

	LOGIC:	Anti-shortcut tanker clip will be deleted upon its destruction.

	Clip "_shortcut_tanker" blocks Survivors @ setpos_exact 1092 -3999 1328

PvP:

	TRIG:	Anti-shortcut "_watercushion_trigonce" deletes trighurt at stair descent.

	Insta-kill "_watercushion_trighurt" Survivor @ setpos_exact 2441 -4194 270

	Brush "_losfix_bus" created @ setpos_exact 1782 -4004 1335

	Brush "_losfix_gastruck" created @ setpos_exact -2933 -3970 1340

	LADDER: _ladder_endbrick_cloned_shortbase

	LADDER: _ladder_shrubwall1_cloned_shortbase

	LADDER: _ladder_shrubwall2_cloned_shortbase

	LADDER: _ladder_sosemerge_cloned_shortbase

	LADDER: _ladder_supertallstart_cloned_samespot

	Static prop "_losblocker_acvent" W/ "models/props_rooftop/acvent04.mdl" @ setpos_exact 6027 -6087 542

	Static prop "_propladder_bricka" W/ "models/props_industrial/brickpallets.mdl" @ setpos_exact 5797.57 -6183.4 412.857

	Static prop "_propladder_brickb" W/ "models/props_industrial/brickpallets.mdl" @ setpos_exact 5733 -6184 412.857

	Static prop "_propladder_brickc" W/ "models/props_industrial/brickpallets.mdl" @ setpos_exact 5797.48 -6183.82 476.857

	Static prop "_propladder_brickd" W/ "models/props_industrial/brickpallets.mdl" @ setpos_exact 5796.57 -6248.4 445.857

	Static prop "_propladder_bricke" W/ "models/props_industrial/brickpallets.mdl" @ setpos_exact 5797.48 -6248.82 412.857

	Static prop "_propladder_brickf" W/ "models/props_industrial/brickpallets.mdl" @ setpos_exact 5732.91 -6249.42 412.857

	Static prop "_propladder_brickg" W/ "models/props_industrial/brickpallets.mdl" @ setpos_exact 5754 -6439 396.857

	Ladder found @ "-410.09 -4121.79 1386" and shifted w/ offset @ "15 15 10"

Coop:

	Ladder found @ "-410.09 -4121.79 1386" and shifted w/ offset @ "15 15 10"

	TRIG:	Anti-shortcut "_watercushion_trigonce" deletes trighurt at stair descent.

	Insta-kill "_watercushion_trighurt" Survivor @ setpos_exact 2441 -4194 270

------------------------------------------------------------------------------------------------------------------------

COLD STREAM - CUT-THROAT CREEK || c13m4_cutthroatcreek

All:

	Clip "_permstuck_treetunnel" blocks Everyone @ setpos_exact -492.1 -186.3 -385

	Clip "_dispcrouch_toomany" blocks Everyone @ setpos_exact -3028 -6154 413

	Clip "_eventskip_rooftop" blocks Survivors @ setpos_exact -3891 -8135 723

	Clip "_eventskip_fence1" blocks Survivors @ setpos_exact -4268 -8520 504

	Clip "_eventskip_fence2" blocks Survivors @ setpos_exact -3409 -7764 500

	Clip "_cliprework_startbooster" blocks Survivors @ setpos_exact -4930 -5987 1188

	Clip "_cliprework_endbooster" blocks Survivors @ setpos_exact -1175 1405 57

	Clip "_dispcrouch_onewaydrop" blocks Everyone @ setpos_exact -3893 -5852 -128

	Clip "_cliprework_dispcrouch00" blocks Infected + AI @ setpos_exact -4030 -5257 132

	Clip "_cliprework_dispcrouch01" blocks Survivors @ setpos_exact -4030 -5357 -32

	Clip "_cliprework_dispcrouch02" blocks Survivors @ setpos_exact -4020 -4815 -32

	Clip "_cliprework_dispcrouch03" blocks Survivors @ setpos_exact -4180 -1920 -32

	Clip "_cliprework_dispcrouch04" blocks Survivors @ setpos_exact -3971 -1527 -32

	Clip "_cliprework_dispcrouch05" blocks Survivors @ setpos_exact -3551 -1552 -32

	Clip "_cliprework_dispcrouch06" blocks Survivors @ setpos_exact -3126 -1398 -32

	Clip "_cliprework_dispcrouch07" blocks Survivors @ setpos_exact -2619 -1469 -31

	Clip "_cliprework_dispcrouch08" blocks Infected @ setpos_exact -2314 -2346 130

	Clip "_cliprework_dispcrouch09" blocks Infected @ setpos_exact -2172 -2422 130

	Clip "_cliprework_dispcrouch10" blocks Infected @ setpos_exact -1839 -2492 130

	Clip "_cliprework_dispcrouch11" blocks Infected @ setpos_exact -1238 -2465 130

	Clip "_cliprework_dispcrouch12" blocks Infected @ setpos_exact 415 -921 77

	Clip "_dispcrouch_waterfall" blocks Everyone @ setpos_exact -2184 -1700 -288

	Clip "_permstuck_umheymatt" blocks Everyone @ setpos_exact 13 5280 -117

PvP:

	Clip "_commonhop_endshortcut" blocks Survivors @ setpos_exact -693 4555 35

	Deleted ([431] prop_physics) @ setpos_exact -521.5 -1260.25 -399.531

	Clip "_ladder_startstreamL_clip" blocks Infected @ setpos_exact -4028 -5137 345

	Clip "_ladder_littlecliff_qola" blocks Infected @ setpos_exact -3685 -1397 312

	Clip "_ladder_littlecliff_qolb" blocks Infected @ setpos_exact -3706 -1352 366

	Brush "_losfix_gen1" created @ setpos_exact -821 5675.32 -110

	Brush "_losfix_gen2" created @ setpos_exact -838 4598 -110

	LADDER: _ladder_cornerlowroofl_cloned_endbackarea

	LADDER: _ladder_cornerlowroofr_cloned_endbackarea

	LADDER: _ladder_enddumpsterL_cloned_endstackback

	LADDER: _ladder_enddumpsterR_cloned_endstackback

	LADDER: _ladder_endstackfront_cloned_endstackback

	LADDER: _ladder_fourthstream_cloned_secondstream

	LADDER: _ladder_littlecliff_cloned_waterfall

	LADDER: _ladder_thirdstream_cloned_secondstream

	LADDER: _ladder_stairsfence_cloned_backfence

	LADDER: _ladder_startstreamL_cloned_startstreamR

	Navblocker "_losblocker_startshrubnavblock" blocks Everyone w/ Apply @ setpos_exact -3400 -7300 360

	Static prop "_losblocker_startshrubwall" W/ "models/props_foliage/swamp_shrubwall_block_256_deep.mdl" @ setpos_exact -3388 -7294 335

	Static prop "_solidify_startcluster1" W/ "models/props_foliage/urban_trees_cluster01.mdl" @ setpos_exact -3130 -6492 366.443

	Static prop "_solidify_startcluster2" W/ "models/props_foliage/urban_trees_cluster01.mdl" @ setpos_exact -3168 -5984 317.023

	Physics prop "_hittable_replacement" W/ "models/props_foliage/tree_trunk_fallen.mdl" & mass 1.5 @ setpos_exact -714 -863 -385

	Ladder found @ "-1 5304 -43.124" and shifted w/ offset @ "50 0 0"

	Ladder found @ "-202.0005 -1483.2271 -224" and shifted w/ offset @ "0 0 10"

	Ladder found @ "145 4845.5 202" and shifted w/ offset @ "-15 0 0"

	Ladder found @ "159 4845.5 159" and shifted w/ offset @ "-15 0 0"

	Ladder found @ "178 4845.5 109.5" and shifted w/ offset @ "-17 0 0"

	Ladder found @ "195 4845.5 -18.624" and shifted w/ offset @ "-17 0 0"

------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------

LAST STAND - THE JUNKYARD || c14m1_junkyard

All:

	CVAR:	Set "director_convert_pills" to 0 to prevent excess defib conversion.

------------------------------------------------------------------------------------------------------------------------

LAST STAND - LIGHTHOUSE FINALE || c14m2_lighthouse

All:

	CVAR:	Set "director_convert_pills" to 0 to prevent excess defib conversion.

------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------

DEVELOPER - c5m1_waterfront_sndscape

All:

	FIX:	Total of 4 out of 5 traffic cones need to be made non-solid -- yes, for memes.

	Un-solidified prop_physics @ setpos_exact -1152.16 -1600.13 -365.063

	Un-solidified prop_physics @ setpos_exact -3353.81 -1935.78 -379.5

	Un-solidified prop_physics @ setpos_exact -3452.91 -1903.28 -379.531

	Un-solidified prop_physics @ setpos_exact -3531.81 -1952.03 -379.625

	Un-solidified prop_physics @ setpos_exact -3679.75 -1983.78 -365.031

	Un-solidified ALL props with model: "models/props_fortifications/orange_cone001_reference.mdl"

	hJuHajBMM3jCGuje2vmVl0TcSD3n8Uc0

------------------------------------------------------------------------------------------------------------------------

DEVELOPER - credits

Nothing!

------------------------------------------------------------------------------------------------------------------------

DEVELOPER - curling_stadium

Nothing!

------------------------------------------------------------------------------------------------------------------------

DEVELOPER - tutorial_standards

Nothing!

------------------------------------------------------------------------------------------------------------------------

DEVELOPER - tutorial_standards_vs

PvP:

	Deleted func_playerinfected_clip @ setpos_exact -65 -417 527

	Deleted func_playerinfected_clip @ setpos_exact -641 -865 527

	Deleted func_playerinfected_clip @ setpos_exact -897 15 399

	Deleted func_playerinfected_clip @ setpos_exact -881 191 399

	LADDER: _ladder_acvent_cloned_smallest

	Static prop "_acvent_wrongway1" W/ "models/props_misc/wrongway_sign01_optimized.mdl" @ setpos_exact -791 15 439

	Static prop "_acvent_wrongway2" W/ "models/props_misc/wrongway_sign01_optimized.mdl" @ setpos_exact -610 15 439

	LADDER: _ladder_fencefront1_cloned_fenceback1

	LADDER: _ladder_fencefront2_cloned_fenceback2

	LADDER: _ladder_fencefront3_cloned_fenceback3

	LADDER: _ladder_fencefront4_cloned_fenceback4

	Clip "_permstuck_treecluster" blocks Everyone @ setpos_exact -1170 724 200

	LADDER: _ladder_elevleft_cloned_elevright

	Static prop "_ladder_elevleft_pipe" W/ "models/props_rooftop/Gutter_Pipe_256.mdl" @ setpos_exact -64 -465 400

	Clip "_elevleft_clipleft" blocks Everyone @ setpos_exact -66 -441 128

	Clip "_elevleft_clipright" blocks Everyone @ setpos_exact -66 -495 128

	LADDER: _ladder_eventfront_cloned_eventback

------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------

Disclaimer:

	Fixes still pending. Just because it's not fixed yet doesn't mean it won't be.

	By popular community request any fix will be re-evaluated at any time.

	Only 100% comprehensive for VScript fixes -- fixes made with lump files are recalled as much as possible.

------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------