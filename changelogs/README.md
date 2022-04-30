# Changelog Standards

Current up to and including: `Commits on Apr 29, 2022`

### Links:

The [start of all commit history](https://github.com/Tsuey/L4D2-Community-Update/commits/master?after=b418718db8a95de3b0260c13a9244de58c5097d8+279&branch=master) on Sep 24, 2020.

Everything up to and including [this Oct 29, 2020 Versus update commit](https://github.com/Tsuey/L4D2-Community-Update/commit/be0cf3b251627fe018916c3670cc60eeee81db31) is already live.

Commits stop and start again with [this Jul 1, 2021 commit that split map scripts](https://github.com/Tsuey/L4D2-Community-Update/commit/3de182728f8de818466980d11888032f7672c48f).

### Template:

	&emsp;[+](URL_HERE) NOTE_ENDING_WITH_PERIOD<br/>

	Mark all `"models"` and wildcards `[folder/file*]` with in-line code braces. Escape character not needed if code braced.

### Rules:

Commits are always preferred over Pull Requests since the commits are always guaranteed and give the quickest glimpse of changed lines. We could optionally link to exact lines. Uncommonly, change notes are only mentioned in the Pull Request -- but that's okay because they're all in this changelog.

For the few commits that were reverted, only the last-most commit that made the change is linked (like we ignore the [BOM incident](https://github.com/Tsuey/L4D2-Community-Update/commit/2257108296a7408415172c727f9f16f395b2ecf3) since it was re-uploaded later) or on two cases where a change was completely removed. Examples of the latter: the top change note was removed because it was reverted later on (instead of removing unreachables we make them reachable):

&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/26bc4e36fe657a23b89f6f611edde121bfcff9b8) `[Sep 18, 2021]` Medkits are no longer converted into pills.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/a310f379c5003c0efc9337443016d2c651804695) `[Sep 19, 2021]` Reverted change to allow pills to replace medkits again.<br/>

&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/32daf1fa36cbc4b44742e480543466b57e9dd4d6) `[Sep 18, 2021]` Removed unreachable pill spawn.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/e5710b35a74a7b5099de18a2badb9af7688eced9) `[Oct 3, 2021]` Restored previously removed pain pill spawn.<br/>

All commits related to Valve's required source files were ignored as all were moved to private repo.

In one case where the edits are profoundly boring ([Thickened 24 clips across 10 maps](https://github.com/Tsuey/L4D2-Community-Update/commit/8a5e1ff03f06bf0aaed68dc693ed66b1b4d77611)), don't separate those by map -- it's an easy decision to only link those commits one time as a group.

All commits that add the "unchanged" (original) files or deal with any of the 3 `README.md` or past changelog revisions are not linked here. We'll also ignore commits that exclusively resolve [minor typos](https://github.com/Tsuey/L4D2-Community-Update/commit/3cfc426967faee39918b625b277518cfb6e378d6) or clean up [whitespace issues](https://github.com/Tsuey/L4D2-Community-Update/commit/629046f33875fc9c20f3516e9b2f57e5b5590cc9) since they add nothing to the discussion.

For assets, the use of brackets `[]` **after the period** is extra info used to clue modders in which Workshop addons may be impacted. If changes are limited to only one prop, then the entire `"*.mdl"` path is specified (phy/vtx/vvd are assumed) -- for paths, `/` is enforced instead of `\`. Lastly, use a wildcard with escape character in form of `"\*"` to specify when the model has more than one distinct suffix (like different variations of the model or skins). Enforce each change note to be only one sentence through use of semicolons.

Ignore targetnames of clips and ladders as those are only informative internally, as they communicate purpose poorly to the public. Similarly, even if a fix may be for all <ins>PvP</ins> modes, we just specify <ins>Versus</ins> for this changelog -- making this distinction within this changelog would only add to public confusion. Fix spawns for all modes if one isn't specified. Survivor's "black and white" state is always referred to as "B&W".

If Mutation filenames aren't obvious, then specify the *.nut in parenthesis ([Valve Wiki reference](https://developer.valvesoftware.com/w/index.php?title=L4D2_Gamemodes.txt_File&oldid=216435)).

For prop fixes, if they're like the "GuardShack" and its use is unique or specific to a map, add the map name (like `[Crash Course 1]`) after the period and duplicate the change note under map fixes. A couple fixes are counted twice in this manner.

For now: on a per-header basis, changes are listed in the same order they were committed. This order can be changed, such as to pool all <ins>Versus</ins> changes back-to-back.

--------------------------------
--------------------------------

# Contributors

Note: Commit links in changelog show who pushed what.

Github revival for team use:

[Our Growing L4D2 Community Update Team](https://steamcommunity.com/groups/l4d2cut)

The Last Stand Update:

[Full Credits](https://steamcommunity.com/groups/l4d2cut/discussions/0/5386857950356246480/)

[Main Site #1](https://www.l4d.com/laststand/)

[Main Site #2](https://store.steampowered.com/news/app/550/view/2801759323340305752)

[C++ Changelog](https://store.steampowered.com/oldnews/75849)

Legacy framework, Versus content, and map fixes:

	Tsuey, Jacob, and Rayman1103

Tool authors:

	Nescius, Xanaguy, and shqke

RocketDude:

https://github.com/ReneTM/rocketdude

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

Thank you everyone!