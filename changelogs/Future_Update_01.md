# How to use this changelog

This changelog comprehensively summarizes all differences from the live game to the current Github state.

![Guide](https://raw.githubusercontent.com/Tsuey/L4D2-Community-Update/master/changelogs/Guide.png)

--------------------------------
--------------------------------

# Assets

### Weapons:

&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/904696e7ce500dc47a02b654876eb2c96a858866) Gave the CS:S knife its old slash pattern back. `[knife.txt]`<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/4dc3fd75c9f98fe1f0355f0f9dd6836a4b479682) [*](https://github.com/Tsuey/L4D2-Community-Update/commit/226a5c5478272808e8fa80d31d5c857bfb6abf83) Improved collision and usability of the Forklift hittable for Versus Tanks.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/ac8832a53fd42bbf7b52f760cf1d2ef74a652848) Reduced the env map intensity on pipebomb, hunting rifle, and worn variants. `[v_models/*.vmt & 1 vtf]`<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/9b1c09b05677d9363ffc1e17b6afb9679509b2d7) Updated the Silenced SMG's worn skin with corrected ambient occlusion. `[v_models/weapons/smg/smg_a_worn*]`<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/12e024f8723a3b4d56d05cae8293bbfe6ce68c37) Moved the illumination position on the AK47's world model to a higher elevation. `[w_models/weapons/w_rifle_ak47.mdl]`<br/>

### Items:

&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/21c4eae3b3ddb92388c9550d7f55f3f6be299f65) Fixed an animation queue error on idle-use for `"v_models/v_adrenaline.mdl"` viewmodel; also tweaked the look poses for a smoother transition.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/4843a658accc7d92319d7c2aea77580571f67586) Fixed a UV error for the vomitjar `"w_eq_bile_flask.mdl"` world model.<br/>

### Effects:

&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/144c0da1f6b4fc36c387d9fa6463ff0e059590a8) Added a sway shader to the Blood Harvest corn props. `[corn01_dry.vmt]`<br/>

### Props:

&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/ca6a7c1bd0e47f94d7acb45b712b067b847d1c49) Added new itempile `"w_models"` for use with the footlockers and remove old overrides to dramatically free up edicts. `[Passing 1 & 2]`<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/45de40a76f3a8fc87090fea8dd332da6ee7aed83) `"props/cs_militia/refrigerator01.mdl"` reduced the env map intensity for less shine.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/2bd873f67ad5d65af1d05af47306245a199fa50b) `"props_interiors/desk_metal.mdl"` adjusted with a more accurate concave mesh to allow items placed under it to be picked up.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/247d8d7198bc046554a6b8762f7b11e73ee252e9) `"props_urban/fence002_128_breakable.mdl"` fixed propdata error that prevented it from shedding broken models when destroyed.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/114e27cadaefb3531d096f32a4a2659c924c3976) `"props_interiors/boothfastfood01.mdl"` optimized to have a less expensive and more accurate collision model.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/f60c4a5e328b6d5628d94657f27701367e0a4bd6) `"props_waterfront/bridge_deck*"` fixed 2 model's inverted normals for a couple beams.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/8f11b8c46b122186715298b9b3e028492ec0b32d) `"props_unique/caboose01_model_exterior.mdl"` fixed flipped UV's that resulted in flipped numbers and some other stretching on doors.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/1ff2324492abec7548b5b3a4be4404313b7ae496) `"props_vehicles/ceda_trailer.vtf"` optimized by removing useless and forgotten alpha mask.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/b68feb240315e78a3b749679a8ea574b463d3b61) `"props_vehicles/ceda_trailer_closed.mdl"` closed open gaps, fixed shading, UV issues, added LOD and lights.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/05128fc3b70b06192fd65df8788938b1372d2535) `"props_vehicles/churchbus01_*"` reduced env map intensity to make less shiny and fixed text inaccuracies.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/a60d3281d48c5f6fc5597446baaa1fbf31c47f59) `"props_vehicles/church_bus01.mdl"` closed very big gaps on the front and added LOD.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/1878ef88532677b63f593131e8538b238ff56a83) `"props_mall/mall_display_*"` improved 2 model's cheap collision to allow shelf use for item pickups and friends of Fred.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/f4ce06e5d423dcbc3438387b957a6942ccd1a843) `"props_fairgrounds/sound_board_corner.mdl"` fixed incorrect collision model rotation and lowered polycount on bottom wheels.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/c01e2169a0e70d586d8220efb88dd2c01b409aff) `"props_unique/jukebox01.mdl"` collision model was not properly aligned to the model, it was at least 32 units above it.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/5414200ed1ccb0492bc0bef99d9e7a5324075dd2) `"props_urban/diving_board001.mdl"` handle collision was too cheap and didn't allow bullets through the big gap. `[Dark Carnival 1]`<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/0b54ed36838a70572feb117cfc96b7e93e39d90a) [*](https://github.com/Tsuey/L4D2-Community-Update/commit/f09079d7fe58ed73d4b916ef8eab41dae7040444) `"props_interiors/shelving*"` restored 2 model's unused texture variant by separating it into 2 textures.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/c2d502e9f6fc4e5314a3664b2f589d29aa8c8b37) `"props_equipment/construction_lift.mdl"` fixed UV issues on both main and LOD models.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/3d37f41e733a4d4d344e51d48ddc2aa110970372) `"props_furniture/cupboard1.mdl"` fixed UV issue on right handle where it was mapped to the wrong area, thus making it look like wood.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/b01984c2c4c863d94703ab61163033cfb3a6c811) [*](https://github.com/Tsuey/L4D2-Community-Update/commit/3834e4850252f563847bed1ac1ea286ef2e85b94) `"props_street/building_trim_piece02_64.mdl"` added a collision mesh; assigned it the "stone" surfaceprop.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/e230d76ace0c2f45bd3d112c66fa823c8454353b) `"props_exteriors/GuardShack*"` restored gibs to show as always intended; wouldn't spawn because of a propdata error. `[Crash Course 1]`<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/fe1d73d12ee6373d489efdb5b8121488a638b0eb) `"destruction_tanker/destruction_tanker.vmt"` prevent front part of destroyed Tanker from being tinted with the truck with $allowdiffusemodulation 0.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/535bebc873a767b2230aef289d0e586a65b446f1) `"c1m1_environment/rooftop_3.mdl"` corrected a very small inaccuracy so c1m1's skybox model would match a c1m2 building.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/10ddebb86498b370e19588d1e07eed759e5caabe) `"destruction_tanker/c1m2_cables_*"` corrected inverted normals on Tanker destruction sequence cables.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/729d98176b157320ae43b7cb040e83985711ab87) `"props_unique/hospitalcurtain01.mdl"` fixed very inaccurate collision.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/359a91125102c171f2d5f60026512393dba5f8ca) `"props_urban/hotel_stair_rail00*"` improved 3 model's collision so bullets and projectiles can go through the gaps.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/d4bdefa538bb29f192f511321bac5c5df5b2a906) `"props_vehicles/boat_ski.mdl"` fixed UV issues with the front of the boat and many more in its LOD model.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/029a11c160391b15daee4e841d22ff76d1edf9a1) `"police_car_ref"`, `"semi_truck_ref"`, and `"taxi_cab_ref.vtf"` lowered specular intensity and remade map for consistency.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/69e8d2e59d61d2f464d63af13723a1b2d3cf72b8) [*](https://github.com/Tsuey/L4D2-Community-Update/commit/7006367e582bea1aeb4a0212f122252fcacc87a0) `"semi_trailer.vmt" & vtf` added a tint mask to allow custom campaigns to paint it without issues.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/3216072b6047c70a8485675aa4fb4085111a89a9) `7 "props_vehicles"` glass props and van interior textures had diffuse modulation support removed to avoid accidental painting along with the actual vehicles. `[Map Fixes General]`<br/>

### Special Infected:

&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/bd7847dfa72ab5542cb6576261e2eded48f945d9) Added render coloring support to the Hunter, Smoker, Boomer and Charger models. `[infected/*.vmt]`<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/eff889d1814e3db223291e99a43eb153fa1c399b) Added render coloring support to burned Hunters and Smoker tongue. `[infected/*.vmt]`<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/256db2e542b49735322f679c5f9d43f831ea1134) Adjusted L4D1 Hunter's model animations to better fit model. `[v_models]`<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/439f1ce55ba3810bb998b198b365232ae1e9ad39) Sacrifice Tank used the wrong normal map, leading to shading issues mostly on his legs. `[hulk_traincar_01.vmt]`<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/acdd3d5473e64bebcafc67671b1becd531431b43) [*](https://github.com/Tsuey/L4D2-Community-Update/commit/3cc291558e87eeb16e3117ed95cf7eb631229996) Added missing footstep action events to shoved sequences for Hunter, Smoker and Boomer. `[ani & mdl]`<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/acdd3d5473e64bebcafc67671b1becd531431b43) [*](https://github.com/Tsuey/L4D2-Community-Update/commit/13fb84a819af117e6552c3791ccba69053659de0)[*](https://github.com/Tsuey/L4D2-Community-Update/commit/bb03d040a3dbbb8d119b9119bb302a3350d501b7) Ladder idle animations for Hunter, Smoker and Boomer. `[ani & mdl]`<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/acdd3d5473e64bebcafc67671b1becd531431b43) Replaced broken locational flinches with generic ones for Hunter and Smoker. `[ani & mdl]`<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/acdd3d5473e64bebcafc67671b1becd531431b43) Removed locational crouch flinches from Hunter and replaced them with non-locational, better looking ones. `[ani & mdl]`<br/>

### Accessibility:

&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/3e4ba0817605dae7dc55a0f62c61c6ab98c7be2b) [*](https://github.com/Tsuey/L4D2-Community-Update/commit/a1a9d40044ff7427f511f0ba2568e8b1da9ccd6f) Fixed Audio and Keyboard / Mouse menus in the Options flyout having broken navigation keys when trying to use the arrow keys or a controller. `[keyboardmouse & video.res]`<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/400c97ed40803004485dee9a03f95af19df21a0c) "Tank Claw" hint had incorrect binding "+attack2". `[instructor_lessons.txt]`<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/400c97ed40803004485dee9a03f95af19df21a0c) "Tank Rock" hint had incorrect binding "+attack". `[instructor_lessons.txt]`<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/400c97ed40803004485dee9a03f95af19df21a0c) "Jockey Leap" hint had the incorrect ability_use of "ability_spit", and now uses the correct "ability_leap". `[instructor_lessons.txt]`<br/>

# Navmesh General

&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/32daf1fa36cbc4b44742e480543466b57e9dd4d6) [*](https://github.com/Tsuey/L4D2-Community-Update/commit/3474db1fa0544ab2eca0f3537346c43a59ff863d)[*](https://github.com/Tsuey/L4D2-Community-Update/commit/6202c444e4fbe805803d40059b62b70af2afcc05) Various nav fixes for -9999 flow areas.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/ca1ccd389a17d2381aebc581bd06911142bf5ff8) [*](https://github.com/Tsuey/L4D2-Community-Update/commit/a36af7e04c4151905b7a3d62db9ed1ddcf2ebf2e)[*](https://github.com/Tsuey/L4D2-Community-Update/commit/f1c685f88740b2efb833c9b793f1edca6e9601cc) Lots of bad connections fixed for better bot navigation.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/59d23d1b4be5daf487fbcfcaad1da4c559c4d541) [*](https://github.com/Tsuey/L4D2-Community-Update/commit/c16ecdc60ad8ba196ce6ebbd233cb17697165e23)[*](https://github.com/Tsuey/L4D2-Community-Update/commit/8ac40eb533cd7d774938ab9eb6240a1b4ce53ab9) Survivor bots can save you in more places.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/dc747df90b852f77494c546f16a1a8a2dea9b538) [*](https://github.com/Tsuey/L4D2-Community-Update/commit/f94320612ccbc8083cdeb37a3ac878ad91276153)[*](https://github.com/Tsuey/L4D2-Community-Update/commit/de7010043611cda949dec23b9ee3c66ded2a56a0) File size optimization through merging and ID compression.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/824fa8d339784746bc1e65b34b65a440bce400af) Lump edits to account for changed weapon density values.<br/>

# Map Fixes

### General:

> **Developer Note:** When it comes to shortcuts in non-competitive modes, Valve sides with letting players have reasonable fun. Patching via <ins>Commentary</ins> files has been deprecated, which previously added all blockers to all modes.

&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/a030ffa08aa465cc4d3886b7e8caa29ab8e66c2f) Replaced most of `make_atomizer` I/O logic with VScript to increase reliability in tracking hittable griefs.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/3216072b6047c70a8485675aa4fb4085111a89a9) `7 "props_vehicles"` glass props and van interior textures had diffuse modulation support removed to avoid accidental painting along with the actual vehicles.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/pull/131) [*](https://github.com/Tsuey/L4D2-Community-Update/commit/23b34a9c4d3d6e0cea327f2255b0ff21a89ec9c9)[*](https://github.com/Tsuey/L4D2-Community-Update/commit/3b562de785bd118ff328bf069c209086991ad85b)[*](https://github.com/Tsuey/L4D2-Community-Update/commit/8796036509a5086345e31662707b8ce195b10fc8)[*](https://github.com/Tsuey/L4D2-Community-Update/commit/40e419c1c48ee04d652bdb5b9221b3252225229e) <ins>Commentary</ins>: Convert [original _commentary.txt](https://github.com/Tsuey/L4D2-Community-Update/commit/38811e5b20b72f86bf56df4567d96e6d77a3a69d) mapfix clips and props [to VScript](https://github.com/Tsuey/L4D2-Community-Update/commit/5cf03ceca59c9174268e3f7eb3dba776a09e205e) so those files are [now reserved](https://github.com/Tsuey/L4D2-Community-Update/commit/44a95623460c5bbb880c2b54f42f8a6feee02719) for dialogue info_remarkables and Commentary Mode; changes are only specified for cases where there is an observable difference or are somehow unique. `[Pull Request]`<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/ff0090ce6a6b886b767e70ef6e3dc8b46fae79ce) [*](https://github.com/Tsuey/L4D2-Community-Update/commit/d17c14dec506c157e4dbe82aacff0bb1a34d030a)[*](https://github.com/Tsuey/L4D2-Community-Update/commit/5f84fcb0d51296bc1b17351a9baa4fbde170ae1f)[*](https://github.com/Tsuey/L4D2-Community-Update/commit/57d1b2f5353c6811f83942d91e7689748c5cfac1)[*](https://github.com/Tsuey/L4D2-Community-Update/commit/37c8b3b26e44077f661aea86bb04b647a3eb982f) <ins>Commentary</ins>: Fixed extremely minor regressions on various maps (flipped signs / wrong blocktype / edgebugs) that occurred when converting and improving clips.<br/>

### Dead Center

#### Map 1:

&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/fae86cb8f5abf0f090d05ab8086454f3f776383c) Don't spawn Versus-specific changes for modes such as Scavenge.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/5cf03ceca59c9174268e3f7eb3dba776a09e205e) [*](https://github.com/Tsuey/L4D2-Community-Update/commit/640e1c07ae5ac9d6a465a35a57b109d64bab93e5)[*](https://github.com/Tsuey/L4D2-Community-Update/commit/5d8ea68b88b880cc1eb093f1b81eeb20036ffce0) <ins>Commentary</ins>: Restored old Coop shortcuts by unblocking suite balcony, long ledge and window drops.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/474cd5c039356baca6c9b1ed7c5e8bf550819090) <ins>Versus</ins>: Move Ghost SI exploit kill trigger down a lot to solve a rare issue.<br/>

#### Map 2:

&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/ca1ccd389a17d2381aebc581bd06911142bf5ff8) Added navblocker under destroyed Tanker truck.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/44a95623460c5bbb880c2b54f42f8a6feee02719) <ins>Commentary</ins>: Removed a redundant point_nav_attribute_region that set NOTHREAT by the one-way drop as it's already saved into the nav.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/32daf1fa36cbc4b44742e480543466b57e9dd4d6) <ins>Navmesh</ins>: Survivor bots can now rescue you atop the hedges.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/32daf1fa36cbc4b44742e480543466b57e9dd4d6) <ins>Navmesh</ins>: Fixed end saferoom areas for `"warp_all_survivors_to_checkpoint"` to work properly.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/ca1ccd389a17d2381aebc581bd06911142bf5ff8) <ins>Navmesh</ins>: Minor SI stuck fixes and some optimizations.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/8a5e1ff03f06bf0aaed68dc693ed66b1b4d77611) <ins>Taaannnk!!</ins>: Delete all func SI clip.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/8a5e1ff03f06bf0aaed68dc693ed66b1b4d77611) <ins>VS Survival</ins>: Delete all func SI clip.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/df956ee43031bc8d7ec936e5e024c0bcb9c5d9e2) <ins>Versus</ins>: Improve clip that blocks a boost onto mall roof and outside of map.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/b6e41ed07771e2fbef404814efd17603df07bd15) <ins>Versus</ins>: Restored 4 Infected ladders behind the Tanker fence for modded server use.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/b6e41ed07771e2fbef404814efd17603df07bd15) [*](https://github.com/Tsuey/L4D2-Community-Update/commit/e5fa745620edc175d7beafef41c1d0fc52b40f8b) <ins>Versus</ins>: Polished 3 glitchy TLS Infected ladders.<br/>

#### Map 3:

&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/474cd5c039356baca6c9b1ed7c5e8bf550819090) Blocked a permstuck spot at vending machine alternative path.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/474cd5c039356baca6c9b1ed7c5e8bf550819090) <ins>QoL</ins>: Auto-crouch trigger for starting gate at shoplift scanners.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/32daf1fa36cbc4b44742e480543466b57e9dd4d6) <ins>Navmesh</ins>: Added "c1streets" place name to the CEDA evacuation center area.<br/>

#### Map 4:

&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/474cd5c039356baca6c9b1ed7c5e8bf550819090) <ins>QoL</ins>: Clips for kiosks to assist jumping and booth auto-crouch.<br/>

### Dark Carnival

#### Map 1:

&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/5414200ed1ccb0492bc0bef99d9e7a5324075dd2) `"props_urban/diving_board001.mdl"` handle collision was too cheap and didn't allow bullets through the big gap.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/474cd5c039356baca6c9b1ed7c5e8bf550819090) <ins>Versus</ins>: Add navblocker at fence/car to prevent Tank spawn flow exploit.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/e5fa745620edc175d7beafef41c1d0fc52b40f8b) <ins>Versus</ins>: Polished 7 glitchy TLS Infected ladders and removed some redundant duplicates.<br/>

#### Map 2:

&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/44a95623460c5bbb880c2b54f42f8a6feee02719) <ins>Commentary</ins>: Removed clip that creates a permstuck spot by the trailers outside the warehouse; didn't block anything in particular.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/8a5e1ff03f06bf0aaed68dc693ed66b1b4d77611) <ins>Taaannnk!!</ins>: Delete all func SI clip.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/5cf03ceca59c9174268e3f7eb3dba776a09e205e) <ins>Versus</ins>: Added navblockers that prevent Survivors from getting full distance points jumping from light to hedge at carousel; unblocked once trigger at benches is passed.<br/>

#### Map 3:

&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/5cf03ceca59c9174268e3f7eb3dba776a09e205e) <ins>Commentary</ins>: Restored old Coop shortcuts by unblocking various Coaster supports, railings and the bush.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/54b54f91e1192c6e4256d32dfcc4d0184d64fc7f) <ins>Commentary</ins>: Don't spawn the shortcut clips over the fences for modes such as Scavenge.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/befce94f3d414d16b10282937319ce2f1f4882f3) <ins>Commentary</ins>: Raised railing and support clips to skybox just before the tunnel.<br/>

#### Map 4:

&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/5cf03ceca59c9174268e3f7eb3dba776a09e205e) <ins>Commentary</ins>: Extended a clip to prevent Survivors from being hit out of bounds at benches near strongman game.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/5cf03ceca59c9174268e3f7eb3dba776a09e205e) <ins>Commentary</ins>: Restored old Coop and Survival shortcut by removing blocker above generator light at barn entrance.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/ef8160b38cd3c1f5e5fafc92aeb4cc7ff7a66087) <ins>Survival</ins>: Moved clip above fence blockade to Survival-only instead of all modes.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/474cd5c039356baca6c9b1ed7c5e8bf550819090) <ins>Versus</ins>: Food cart ladder replaced with better clone and smoothed with new clip.<br/>

#### Map 5:

&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/474cd5c039356baca6c9b1ed7c5e8bf550819090) Prevent bass and anvil cases from disappearing.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/e5fa745620edc175d7beafef41c1d0fc52b40f8b) <ins>Versus</ins>: Polished 2 glitchy TLS Infected ladders just outside saferoom.<br/>

### Swamp Fever

#### Map 1:

&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/474cd5c039356baca6c9b1ed7c5e8bf550819090) Patched janky ladder near the ferry event.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/474cd5c039356baca6c9b1ed7c5e8bf550819090) Swamp gator has been given a proper name... and some bite.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/df956ee43031bc8d7ec936e5e024c0bcb9c5d9e2) Improve two clips that block hedges and gap over fence in start area to get outside of map.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/8a5e1ff03f06bf0aaed68dc693ed66b1b4d77611) <ins>Taaannnk!!</ins>: Delete all func SI clip, a TLS clip, added tree axiswarp.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/8a5e1ff03f06bf0aaed68dc693ed66b1b4d77611) <ins>VS Survival</ins>: Delete all func SI clip, a TLS clip, added tree axiswarp.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/e5fa745620edc175d7beafef41c1d0fc52b40f8b) <ins>Versus</ins>: Polished 3 glitchy TLS Infected ladders in the start area.<br/>

#### Map 2:

&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/feed7b1523cbd47600a670b122258c3c6ff5530b) Improved TLS triggers by adding more when forcing plane horde even if the plane door is skipped.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/e5fa745620edc175d7beafef41c1d0fc52b40f8b) Blocked a permstuck spot behind some rocks at the start near the parachutist.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/f6096efb6f8817654805cb187b93d1defbe78215) [*](https://github.com/Tsuey/L4D2-Community-Update/commit/eb2d3a83bf80df1faf8b294e38e10688655caddb) <ins>Commentary</ins>: Improved TLS clip behavior when forcing plane horde even if the plane door is skipped.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/e5fa745620edc175d7beafef41c1d0fc52b40f8b) <ins>Versus</ins>: Polished 4 glitchy TLS Infected ladders on the end barricade.<br/>

#### Map 3:

&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/f1c685f88740b2efb833c9b793f1edca6e9601cc) Fixed bridge lever prop remaining glowing after being lowered.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/f1c685f88740b2efb833c9b793f1edca6e9601cc) Set bridge lowering speed to 24 from 5 (in order to match the audio).<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/f1c685f88740b2efb833c9b793f1edca6e9601cc) Slightly adjusted a ladder to prevent getting stuck while climbing.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/f1c685f88740b2efb833c9b793f1edca6e9601cc) Item density adjustments.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/23b34a9c4d3d6e0cea327f2255b0ff21a89ec9c9) <ins>Commentary</ins>: Restored old Coop and Survival shortcut by removing blocker that prevented jump onto roof from fire barrel.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/f1c685f88740b2efb833c9b793f1edca6e9601cc) <ins>Navmesh</ins>: Typical fixes.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/f1c685f88740b2efb833c9b793f1edca6e9601cc) <ins>Navmesh</ins>: Bots won't fall to water all the time from walkways and shacks.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/f1c685f88740b2efb833c9b793f1edca6e9601cc) <ins>Navmesh</ins>: A lot of bad connections fixed (like just going through the roof for example).<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/f1c685f88740b2efb833c9b793f1edca6e9601cc) <ins>Navmesh</ins>: Added a ladder to an area where SI have almost no way to get to you.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/f1c685f88740b2efb833c9b793f1edca6e9601cc) <ins>Navmesh</ins>: Should be a lot less stuckage on prop_wall_breakables. `[c3m3_breakablewalls.nut]`<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/e5fa745620edc175d7beafef41c1d0fc52b40f8b) <ins>Versus</ins>: Improve SI clipping of first ladder outside saferoom to allow drop through a large gap.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/e5fa745620edc175d7beafef41c1d0fc52b40f8b) <ins>Versus</ins>: Moved a TLS Infected ladder out of the Survivor's way at the start and polished another at a trailer.<br/>

#### Map 4:

&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/5cf03ceca59c9174268e3f7eb3dba776a09e205e) [*](https://github.com/Tsuey/L4D2-Community-Update/commit/d17c14dec506c157e4dbe82aacff0bb1a34d030a) <ins>Commentary</ins>: Restored old Coop shortcut by unblocking top of fence near hedge at the start of town.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/59d23d1b4be5daf487fbcfcaad1da4c559c4d541) <ins>Navmesh</ins>: Typical stuff.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/59d23d1b4be5daf487fbcfcaad1da4c559c4d541) <ins>Navmesh</ins>: Some bad connections fixed.<br/>

### Hard Rain

#### Map 1:

&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/474cd5c039356baca6c9b1ed7c5e8bf550819090) Prevent Survivor bots from picking up items inside map 4's saferoom.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/44a95623460c5bbb880c2b54f42f8a6feee02719) <ins>Commentary</ins>: Removed a lazy washer box off a table in the Burger Tank since its godspot has been fixed in nav.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/e5fa745620edc175d7beafef41c1d0fc52b40f8b) <ins>Versus</ins>: Moved up 2 TLS Infected ladders that were too low and added QoL clip.<br/>

#### Map 2:

&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/70fa2b79b2c16994e9c782f994e3eb04328407e3) Fixed multiple item spawns from falling into the ground.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/70fa2b79b2c16994e9c782f994e3eb04328407e3) Fixed unreachable pipe_bomb and adrenaline spawn.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/70fa2b79b2c16994e9c782f994e3eb04328407e3) Moved two upgrade spawns over to a new shelf prop so they spawn when transitioning from map 1.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/32daf1fa36cbc4b44742e480543466b57e9dd4d6) Added invisible prop at the mill to make it easier for SI bots to navigate.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/42732e4bdaaf95fcfc27b0284ae4c5e36d9b388f) Added debris flag to 2 broken windows in order to prevent getting stuck on them.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/5cf03ceca59c9174268e3f7eb3dba776a09e205e) <ins>Commentary</ins>: Drastically improved upper floor mill factory clips so you no longer bump your head when jumping in some places; clips removed for Coop which also restores a boost shortcut.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/5cf03ceca59c9174268e3f7eb3dba776a09e205e) <ins>Commentary</ins>: Restored old Coop shortcut by removing broken wall clips that blocked a jump up to a pipe to get into the factory early.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/de7010043611cda949dec23b9ee3c66ded2a56a0) <ins>Navmesh</ins>: Fixed player SI being able to spawn in starting saferoom before Survivors left.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/de7010043611cda949dec23b9ee3c66ded2a56a0) <ins>Navmesh</ins>: Visible set fixes and misc optimizations.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/e5fa745620edc175d7beafef41c1d0fc52b40f8b) <ins>Versus</ins>: Polished 6 glitchy TLS Infected ladders at the silos, semi trailers, and gas station roof.<br/>

#### Map 3:

&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/32daf1fa36cbc4b44742e480543466b57e9dd4d6) Added invisible prop at the mill to make it easier for SI bots to navigate.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/ca1ccd389a17d2381aebc581bd06911142bf5ff8) Fixes for various items falling on ground, stuck or unreachable, etc.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/ca1ccd389a17d2381aebc581bd06911142bf5ff8) Fixed prop_physics entities being broken on map start; this will allow oxygen and propane tanks to spawn.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/5cf03ceca59c9174268e3f7eb3dba776a09e205e) <ins>Commentary</ins>: Drastically improved upper floor mill factory clips so you no longer bump your head when jumping in some places; clips removed for Coop which also restores a boost shortcut.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/ca1ccd389a17d2381aebc581bd06911142bf5ff8) <ins>Navmesh</ins>: Typical nav fixes.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/ca1ccd389a17d2381aebc581bd06911142bf5ff8) <ins>Navmesh</ins>: Changed default population from "defaultsugarmill" to "defaultsugarmill_rain".<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/e5fa745620edc175d7beafef41c1d0fc52b40f8b) <ins>Versus</ins>: Polished 6 glitchy TLS Infected ladders at the silos, semi trailers, and gas station roof.<br/>

#### Map 4:

&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/dc747df90b852f77494c546f16a1a8a2dea9b538) <ins>Navmesh</ins>: Changed default population from "defaultmilltown" to "defaultmilltown_rain".<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/e5fa745620edc175d7beafef41c1d0fc52b40f8b) <ins>Versus</ins>: Moved up a TLS Infected ladder that was too low and added QoL clip.<br/>

#### Map 5:

&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/6202c444e4fbe805803d40059b62b70af2afcc05) Fixed pistol not spawning in saferoom.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/6202c444e4fbe805803d40059b62b70af2afcc05) Slightly moved an item spawn so it doesn't fall underground.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/44a95623460c5bbb880c2b54f42f8a6feee02719) <ins>Commentary</ins>: Removed a lazy washer box off a table in the Burger Tank since its godspot has been fixed in nav.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/44a95623460c5bbb880c2b54f42f8a6feee02719) <ins>Commentary</ins>: Removed godspot clip just off the pier behind the dock since it has been fixed in nav.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/dc747df90b852f77494c546f16a1a8a2dea9b538) <ins>Navmesh</ins>: Changed default population from "defaultmilltown" to "defaultmilltown_rain".<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/e5fa745620edc175d7beafef41c1d0fc52b40f8b) <ins>Versus</ins>: Moved up a TLS Infected ladder that was too low.<br/>

### The Parish

#### Map 1:

&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/474cd5c039356baca6c9b1ed7c5e8bf550819090) <ins>Versus</ins>: Improved a clip that blocks getting stuck in skybox.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/e5fa745620edc175d7beafef41c1d0fc52b40f8b) <ins>Versus</ins>: Rotated a TLS Infected ladder in end area to be up against a building facade.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/5cf03ceca59c9174268e3f7eb3dba776a09e205e) <ins>Versus</ins>: Added new Infected ladder behind fence next to the end saferoom to better fix a permstuck.<br/>

#### Map 2:

&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/474cd5c039356baca6c9b1ed7c5e8bf550819090) Eliminate a permstuck spot that a previous ladder patch created.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/5cf03ceca59c9174268e3f7eb3dba776a09e205e) <ins>Commentary</ins>: Restored old Coop ability for Survivors to stand on the fences in the alley and on the tent by the event.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/71fa9f9526e3df9ca7a2b83da6c0c0d10692035a) [*](https://github.com/Tsuey/L4D2-Community-Update/commit/deb238b007af1d812f4620992bbbf98a946c2c00) <ins>Commentary</ins>: Unblock shortcut over fence at tower event when the button to open the doors is pressed.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/8a5e1ff03f06bf0aaed68dc693ed66b1b4d77611) <ins>Taaannnk!!</ins>: Clip for Tank stuck spot on start roof.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/474cd5c039356baca6c9b1ed7c5e8bf550819090) <ins>Versus</ins>: Solidify a prop_static chimney so it blocks LOS.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/e5fa745620edc175d7beafef41c1d0fc52b40f8b) <ins>Versus</ins>: Polished 4 glitchy TLS Infected ladders and clipping around the overpass and event area.<br/>

#### Map 3:

&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/5cf03ceca59c9174268e3f7eb3dba776a09e205e) <ins>Commentary</ins>: Restored old Coop shortcut to commonhop over the barricade before the sewer.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/8a5e1ff03f06bf0aaed68dc693ed66b1b4d77611) <ins>Versus</ins>: New ladder in far corner of manhole drop area to fix permstuck.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/e5fa745620edc175d7beafef41c1d0fc52b40f8b) <ins>Versus</ins>: Rotated 2 TLS Infected ladders to be up against a fence instead of a wall and polished 4 others at a dumpster and barricade.<br/>

#### Map 4:

&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/474cd5c039356baca6c9b1ed7c5e8bf550819090) Fixed "mins" for a commonhop clip at an electrical box.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/5cf03ceca59c9174268e3f7eb3dba776a09e205e) <ins>Commentary</ins>: Restored old Coop shortcut to jump over right-side fence to skip first interior.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/8a5e1ff03f06bf0aaed68dc693ed66b1b4d77611) <ins>Taaannnk!!</ins>: Delete all func SI clip.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/8a5e1ff03f06bf0aaed68dc693ed66b1b4d77611) <ins>VS Survival</ins>: Delete all func SI clip.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/e5fa745620edc175d7beafef41c1d0fc52b40f8b) <ins>Versus</ins>: Moved a TLS Infected ladder to a more useful lower wrecked semi trailer in end area and polished another at a bus.<br/>

#### Map 5:

&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/e5fa745620edc175d7beafef41c1d0fc52b40f8b) <ins>Versus</ins>: Polished 3 glitchy TLS Infected ladders in the end area.<br/>

### The Passing

#### Map 1:

&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/2ca919b8e027ee5673938c0103db09a413543387) Added new itempile `"w_models"` for use with the footlockers and remove old overrides to dramatically free up edicts.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/f3ca33702fd3ba826beca04dee0313fda4658e10) Removed 26 unused info_survivor_position entities.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/8a5e1ff03f06bf0aaed68dc693ed66b1b4d77611) <ins>Taaannnk!!</ins>: Clip for Tank stuck spot behind start fence.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/e5fa745620edc175d7beafef41c1d0fc52b40f8b) <ins>Versus</ins>: Polished 2 glitchy TLS Infected ladders at the car alarm area.<br/>

#### Map 2:

&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/2ca919b8e027ee5673938c0103db09a413543387) Added new itempile `"w_models"` for use with the footlockers and remove old overrides to dramatically free up edicts.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/7338b3d0f4d6d41a39d4898baf07d21b7076f514) [*](https://github.com/Tsuey/L4D2-Community-Update/commit/6bd019587e678b64086c933134a4c2ada77828ca) Fixed collision issue with clips on the stairs by the saferoom that caused noticeable teleporting when not on a local server.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/5cf03ceca59c9174268e3f7eb3dba776a09e205e) <ins>Commentary</ins>: Restored old Coop alternative path through gap in fence; clip is deleted when the event is started.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/e5fa745620edc175d7beafef41c1d0fc52b40f8b) <ins>Versus</ins>: Rotated a TLS Infected ladder at plank crossing to be up against fence instead of wall and added QoL clip for trash bags.<br/>

#### Map 3:

&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/9c2187038634d67635597aafb6ca9c5f3bfb0a65) Added func_orator entity.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/9c2187038634d67635597aafb6ca9c5f3bfb0a65) Changed outro relay to make orator speak "c6m3_outro" instead of Francis. `[See Talker C6M3]`<br/>

### The Sacrifice

#### Map 1:

&emsp;Nothing.

#### Map 2:

&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/8a5e1ff03f06bf0aaed68dc693ed66b1b4d77611) <ins>Versus</ins>: Delete func clip that blocks SI access into end closet.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/e5fa745620edc175d7beafef41c1d0fc52b40f8b) <ins>Versus</ins>: Polished 8 glitchy TLS Infected ladders in the latter half of the map.<br/>

#### Map 3:

&emsp;Nothing.

### No Mercy

#### Map 1:

&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/474cd5c039356baca6c9b1ed7c5e8bf550819090) Lift anti-grief kill trigger off the ground to prevent an incap glitch.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/ca1ccd389a17d2381aebc581bd06911142bf5ff8) Made a specific lamp start asleep in order to restore flashing alarm clock.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/5cf03ceca59c9174268e3f7eb3dba776a09e205e) <ins>Commentary</ins>: Restored old Coop ability to boost up on top of a bus stop roof as a start for more parkour jumps.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/5cf03ceca59c9174268e3f7eb3dba776a09e205e) <ins>Commentary</ins>: Conversion from player to physics blocker resolved commonly reported instance of "pushy" collision when standing on a ledge.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/8ac40eb533cd7d774938ab9eb6240a1b4ce53ab9) <ins>Navmesh</ins>: Added some empty attributes on top of railings.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/8ac40eb533cd7d774938ab9eb6240a1b4ce53ab9) <ins>Navmesh</ins>: Added no_mobs attribute on some escape stairs that are on the buildings.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/8ac40eb533cd7d774938ab9eb6240a1b4ce53ab9) <ins>Navmesh</ins>: Improved some jump up connections on cars.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/8a5e1ff03f06bf0aaed68dc693ed66b1b4d77611) <ins>Taaannnk!!</ins>: Delete 1 func SI clip and add 2 anti-stuck clips.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/474cd5c039356baca6c9b1ed7c5e8bf550819090) <ins>Versus</ins>: Add clip to patch a ladder shortcut at the start.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/e5fa745620edc175d7beafef41c1d0fc52b40f8b) <ins>Versus</ins>: Polished a glitchy TLS Infected ladder at the flatnose truck.<br/>

#### Map 2:

&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/8a5e1ff03f06bf0aaed68dc693ed66b1b4d77611) <ins>Taaannnk!!</ins>: Add anti-stuck 6 clips for rubble and end area.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/8a5e1ff03f06bf0aaed68dc693ed66b1b4d77611) <ins>VS Survival</ins>: Added visual vending machine step to get back in-bounds.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/82d6685775b1ad32118a26c6dbee6e247e20b1a5) <ins>Versus</ins>: Fixed clips that block Survivors from unattackable areas outside of map.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/e5fa745620edc175d7beafef41c1d0fc52b40f8b) <ins>Versus</ins>: Polished 6 glitchy TLS Infected ladders around subway cars, rubble, and a tanker.<br/>

#### Map 3:

&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/8a5e1ff03f06bf0aaed68dc693ed66b1b4d77611) Mitigator axiswarp for getting stuck in scissor lift.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/8a5e1ff03f06bf0aaed68dc693ed66b1b4d77611) <ins>QoL</ins>: Fred?!<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/a36af7e04c4151905b7a3d62db9ed1ddcf2ebf2e) <ins>Navmesh</ins>: When warehouse door opens flow numbers won't drastically change.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/a36af7e04c4151905b7a3d62db9ed1ddcf2ebf2e) <ins>Navmesh</ins>: Boss spawning variation in Versus when one team opens the warehouse door should be fixed hopefully without any side effects.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/a36af7e04c4151905b7a3d62db9ed1ddcf2ebf2e) <ins>Navmesh</ins>: Some random minor stuff.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/8a5e1ff03f06bf0aaed68dc693ed66b1b4d77611) <ins>Taaannnk!!</ins>: Delete 3 func SI clips and add anti-stuck clip on start rooftops.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/8a5e1ff03f06bf0aaed68dc693ed66b1b4d77611) <ins>Versus</ins>: Thicken SI warehouse clip Tanks could potentially spawn behind.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/e5fa745620edc175d7beafef41c1d0fc52b40f8b) <ins>Versus</ins>: Moved up a TLS Infected ladder that was too low on scissor lift roof and polished another at nearby overturned semi.<br/>

#### Map 4:

&emsp;Nothing.

#### Map 5:

&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/4846d0090277f0a8bc30a331c0a06d865b7d8991) Added a func_brush which fixes Survivors floating into the sky when getting hit by a Spitter's projectile.<br/>

### Crash Course

#### Map 1:

&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/474cd5c039356baca6c9b1ed7c5e8bf550819090) Block rare permstuck spot between the boxwreck and traffic light.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/e230d76ace0c2f45bd3d112c66fa823c8454353b) `"props_exteriors/GuardShack*"` restored gibs to show as always intended; wouldn't spawn because of a propdata error.<br/>

#### Map 2:

&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/474cd5c039356baca6c9b1ed7c5e8bf550819090) <ins>QoL</ins>: Clip to prevent gascans from falling between finale buses.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/8a5e1ff03f06bf0aaed68dc693ed66b1b4d77611) <ins>Taaannnk!!</ins>: Clip for Tank stuck spot far behind start area.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/8a5e1ff03f06bf0aaed68dc693ed66b1b4d77611) <ins>VS Survival</ins>: Delete 1 fence model to direct SI players in-bounds.<br/>

### Death Toll

#### Map 1:

&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/8a5e1ff03f06bf0aaed68dc693ed66b1b4d77611) Bandaid nav clip fix for stuck SI bot spawns behind tunnel's 2nd barricade.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/8a5e1ff03f06bf0aaed68dc693ed66b1b4d77611) <ins>Taaannnk!!</ins>: Delete 8 func SI clips and add clip to fix a permstuck deletions caused.<br/>

#### Map 2:

&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/8a5e1ff03f06bf0aaed68dc693ed66b1b4d77611) <ins>Taaannnk!!</ins>: Delete all func SI clip.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/8a5e1ff03f06bf0aaed68dc693ed66b1b4d77611) <ins>VS Survival</ins>: Delete all func SI clip, 1 fence model, and add 3 ladders to assist in-bounds.<br/>

#### Map 3:

&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/8a5e1ff03f06bf0aaed68dc693ed66b1b4d77611) <ins>Taaannnk!!</ins>: Delete 2 func SI clip and add 2 anti-stuck clips.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/df956ee43031bc8d7ec936e5e024c0bcb9c5d9e2) <ins>Versus</ins>: Fixed an SI permstuck spot on the barricade by the church.<br/>

#### Map 4:

&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/8a5e1ff03f06bf0aaed68dc693ed66b1b4d77611) <ins>Taaannnk!!</ins>: Add 2 anti-stuck clips from VS Survival and 1 along house row.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/8a5e1ff03f06bf0aaed68dc693ed66b1b4d77611) <ins>VS Survival</ins>: Add 2 anti-stuck clips for behind event barricade and far corner.<br/>

#### Map 5:

&emsp;Nothing.

### Dead Air

#### Map 1:

&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/8a5e1ff03f06bf0aaed68dc693ed66b1b4d77611) <ins>Taaannnk!!</ins>: Delete 1 func SI clip for fence in end area.<br/>

#### Map 2:

&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/8a5e1ff03f06bf0aaed68dc693ed66b1b4d77611) <ins>Taaannnk!!</ins>: Delete 2 func SI clip for final street and add anti-stuck fence clip.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/8a5e1ff03f06bf0aaed68dc693ed66b1b4d77611) <ins>VS Survival</ins>: Delete 1 func SI clip for final street left barricade.<br/>

#### Map 3:

&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/8a5e1ff03f06bf0aaed68dc693ed66b1b4d77611) <ins>Taaannnk!!</ins>: Clip for Tank stuck spots immediately behind start fence.<br/>

#### Map 4:

&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/8a5e1ff03f06bf0aaed68dc693ed66b1b4d77611) Rubble axiswarp with QoL and OoB clips to reduce stuck bot and player Tank spawns.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/474cd5c039356baca6c9b1ed7c5e8bf550819090) <ins>Versus</ins>: Fix SI permstuck spot inside the end rubble.<br/>

#### Map 5:

&emsp;Nothing.

### Blood Harvest

#### Map 1:

&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/8a5e1ff03f06bf0aaed68dc693ed66b1b4d77611) <ins>Taaannnk!!</ins>: Add 2 anti-stuck clips to extend 2 wrongway func SI clips.<br/>

#### Map 2:

&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/32daf1fa36cbc4b44742e480543466b57e9dd4d6) [*](https://github.com/Tsuey/L4D2-Community-Update/commit/f12522bbd3501783ab260dfaab89de1cf1c1fee9) Added missing breakwall texture to wall in starting warehouse and removed prop shadow.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/8a5e1ff03f06bf0aaed68dc693ed66b1b4d77611) <ins>Taaannnk!!</ins>: Clip for Tank stuck spot at end of tunnel.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/474cd5c039356baca6c9b1ed7c5e8bf550819090) <ins>Versus</ins>: Fix prop from slightly hovering above vent.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/8a5e1ff03f06bf0aaed68dc693ed66b1b4d77611) <ins>Versus</ins>: SI permstuck beyond the end of tunnel just before end safe room.<br/>

#### Map 3:

&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/8a5e1ff03f06bf0aaed68dc693ed66b1b4d77611) Permstuck in tree near shed (for SI / RocketDude).<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/8a5e1ff03f06bf0aaed68dc693ed66b1b4d77611) <ins>Taaannnk!!</ins>: Delete 1 func SI clip for wrongway at end of train tunnel.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/8a5e1ff03f06bf0aaed68dc693ed66b1b4d77611) <ins>VS Survival</ins>: Delete 1 func SI clip for wrongway at end of train tunnel.<br/>

#### Map 4:

&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/e5710b35a74a7b5099de18a2badb9af7688eced9) Made a Tier 1 near a Tier 2 spawn properly.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/e5710b35a74a7b5099de18a2badb9af7688eced9) Moved unreachable items to allow them to be picked up.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/8a5e1ff03f06bf0aaed68dc693ed66b1b4d77611) <ins>Taaannnk!!</ins>: Clip for Tank stuck spot behind start safe room.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/474cd5c039356baca6c9b1ed7c5e8bf550819090) <ins>Versus</ins>: Patched fence Infected ladder next to lawnmower room.<br/>

#### Map 5:

&emsp;Nothing.

### Cold Stream

#### Map 1:

&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/5cf03ceca59c9174268e3f7eb3dba776a09e205e) [*](https://github.com/Tsuey/L4D2-Community-Update/commit/37c8b3b26e44077f661aea86bb04b647a3eb982f) <ins>Commentary</ins>: Dramatically improved radio tower clip; unblocked for Coop and kept for Versus.<br/>

#### Map 2:

&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/474cd5c039356baca6c9b1ed7c5e8bf550819090) Fix permstuck next to military truck leading to barricade.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/8a5e1ff03f06bf0aaed68dc693ed66b1b4d77611) Fix a regression with easy event skip clip and a permstuck clip nearby.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/cf3fb0903fc48b28cec500c4b7877ddf39a6dafe) Added a ladder on a truck to make it easier for SI and Survivor bots to follow players up there.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/cd9d52b9c191a87936801e9cdb0c1b70bd7f4858) Fixed an item spawn so adrenaline will no longer fall underground.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/cd9d52b9c191a87936801e9cdb0c1b70bd7f4858) Added a nav attribute region for some stairs, in order for Commons to run up the stairs properly instead of trying to climb them.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/f94320612ccbc8083cdeb37a3ac878ad91276153) <ins>Navmesh</ins>: Optimized a lot of areas.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/f94320612ccbc8083cdeb37a3ac878ad91276153) <ins>Navmesh</ins>: Adjusted a lot of jump up connections.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/f94320612ccbc8083cdeb37a3ac878ad91276153) <ins>Navmesh</ins>: Added empty attributes on several places on the hills.<br/>

#### Map 3:

&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/474cd5c039356baca6c9b1ed7c5e8bf550819090) Enlargened a permstuck clip to fully fix it.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/bd633f9af566c49ccac0377bade476628770adf8) Split the large trigger_hurt into 3 smaller script_trigger_hurt entities.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/c16ecdc60ad8ba196ce6ebbd233cb17697165e23) <ins>Navmesh</ins>: Typical fixes.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/c16ecdc60ad8ba196ce6ebbd233cb17697165e23) <ins>Navmesh</ins>: Survivors can follow almost anywhere now.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/c16ecdc60ad8ba196ce6ebbd233cb17697165e23) <ins>Navmesh</ins>: Added the player_start attribute to the beginning saferoom nav areas.<br/>

#### Map 4:

&emsp;Nothing.

### The Last Stand

#### Map 1:

&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/9ede2401e558b44abefe782d50d3e95e1f92f54b) Added precaches for secret room props.<br/>

#### Map 2:

&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/474cd5c039356baca6c9b1ed7c5e8bf550819090) <ins>Versus</ins>: Fix displacement crouch to get under finale map.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/df956ee43031bc8d7ec936e5e024c0bcb9c5d9e2) <ins>Versus</ins>: Fixed an SI permstuck spot between a fence and tree cluster at the cliff overlooking the beach.<br/>

# Mutations

### RocketDude:

&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/85d72bd2d759db35da813dab832e379b5732a0fc) Updated "rocketdude.nut" from `"anv_mapfixes"` to `"community_update"` namespace.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/88780a8e931af860720452dc22a485b95bd0cea1) Added "rd_map_specifics.nut" to update `"c8m4_elevatorfix"` call to community namespace.<br/>

### Tank Run:

&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/26bc4e36fe657a23b89f6f611edde121bfcff9b8) The first map of a Campaign will now spawn two Tier 1 weapons near the start area if no other Tier 1's are nearby.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/26bc4e36fe657a23b89f6f611edde121bfcff9b8) Made it so Survivors are auto-revived instantly when incapacitated or hanging from a ledge.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/26bc4e36fe657a23b89f6f611edde121bfcff9b8) Car alarms will now spawn a Tank if triggered.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/26bc4e36fe657a23b89f6f611edde121bfcff9b8) Disabled water slowdown for all maps.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/26bc4e36fe657a23b89f6f611edde121bfcff9b8) Set Survivor revive health to 50.<br/>

### Death's Door (community5.nut):

&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/26bc4e36fe657a23b89f6f611edde121bfcff9b8) Enabled B&W state when under 25% health.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/26bc4e36fe657a23b89f6f611edde121bfcff9b8) Fixed heartbeat sound when taking over bot.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/e22276cb4251e750a307d001067110e6130b4feb) Fixed Fallen Survivors being able to drop medkits.<br/>

### Hard Eight (mutation4.nut):

&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/2dfb002ddfc6d6b90d6a21d899608c25b15b3093) Prepend cm_ to every DominatorLimit.<br/>

### Chainsaw Massacre (mutation7.nut):

&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/444d667ad7b5a9861f25e5edfede649e75a983a2) Removed starting pistol from Chainsaw Massacre.<br/>

### VS Survival (mutation15.nut):

&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/8a5e1ff03f06bf0aaed68dc693ed66b1b4d77611) Thickened 24 clips across 10 maps to dramatically reduce stuck Tank spawns.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/26bc4e36fe657a23b89f6f611edde121bfcff9b8) Made it auto-trigger any outputs on the entity used to start Survival if the pre-round timer expires.<br/>

### Hunting Party (mutation16.nut):

&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/2dfb002ddfc6d6b90d6a21d899608c25b15b3093) Prepend cm_ to every DominatorLimit.<br/>

### Taaannnk!! (mutation19.nut):

&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/8a5e1ff03f06bf0aaed68dc693ed66b1b4d77611) Thickened 24 clips across 10 maps to dramatically reduce stuck Tank spawns.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/26bc4e36fe657a23b89f6f611edde121bfcff9b8) Players no longer need to wait for incapped Survivors in order to progress at areas like elevators.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/0cf288008145f667909154daae8187b2ec186902) Fixed Director variable typo from "BehindSurvivorsSpawnDistance" to "SpawnBehindSurvivorsDistance".<br/>

### L4D1 Coop & Survival:

&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/26bc4e36fe657a23b89f6f611edde121bfcff9b8) Set `"z_tank_autoshotgun_dmg_scale"` to 1.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/26bc4e36fe657a23b89f6f611edde121bfcff9b8) Disabled water slowdown.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/0f29cbf65dcc174a1fc142f3d2b62ae5e70426e6) Defibrillators now convert to pain pills instead of medkits; previously, when converted to medkits the game kept trying to spawn more defibs which led to an oversaturation of medkits.<br/>

# Talker

&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/cb021fd1dc5ae20bb0062964c2d2002aa940ae4e) Anything for the survivors that uses "then " will now use "then self" instead.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/cb021fd1dc5ae20bb0062964c2d2002aa940ae4e) Swapped Francis' ArriveBoat02 and ArriveBoat03 placements.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/cb021fd1dc5ae20bb0062964c2d2002aa940ae4e) Fixed two of Coach's rules using "IsTalkCoach" twice.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/cb021fd1dc5ae20bb0062964c2d2002aa940ae4e) Many tweaks to rules referring to leaving the starting area.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/cb021fd1dc5ae20bb0062964c2d2002aa940ae4e) Fixed RemarkC13M1DownHereMechanic rule having the wrong name (thanks Haruko).<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/cb021fd1dc5ae20bb0062964c2d2002aa940ae4e) Swapped Louis' ArriveChopper line placements.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/cb021fd1dc5ae20bb0062964c2d2002aa940ae4e) Deleted C6M3_ElevatorCancel rules for the L4D2 survivors (they had no real functionality).<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/cb021fd1dc5ae20bb0062964c2d2002aa940ae4e) Added IsNotAlone to the C1M1Elevator lines for Coach, Gambler, Mechanic and Producer.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/cb021fd1dc5ae20bb0062964c2d2002aa940ae4e) Added NoOneInSafeSpot to the "outside" vehicle nags.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/cb021fd1dc5ae20bb0062964c2d2002aa940ae4e) Split the vehicle nags for C6M3 for Coach, Gambler and Producer.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/cb021fd1dc5ae20bb0062964c2d2002aa940ae4e) Added NotAloneOutsideSafeSpot to C5M5RunToHeliRareCoach.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/cb021fd1dc5ae20bb0062964c2d2002aa940ae4e) Added the FinalVehicleArrived concept for Dark Carnival and Swamp Fever.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/c8fe9e183af665e951c6510fffe8072ac4384abd) Added missing IntroEnd concept for Coach, Gambler, Producer and TeenGirl.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/e15a2c765b1b805ce876cc5cb50b968c024682b3) Updated criteria definitions for IsIncappedStarted and IsIncappedBleeding.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/e15a2c765b1b805ce876cc5cb50b968c024682b3) Removed IsNotAlone from C1M1Elevator remarks.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/e15a2c765b1b805ce876cc5cb50b968c024682b3) Added missing IsNotAlone to the c1m1_enter_elevator concept for Gambler, Mechanic and Producer.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/5b3efa8647208078fe890978d955e841a11b4d3d) Rules for picking up donated items having the wrong donor designated (thanks Haruko).<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/cb33704106a77ae74336435f24deea8a3d34f5af) Donor rules for specific donors (thanks Haruko).<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/ee96f6e5f7119bb906485f1b4f60a195cbdab449) Fixed Donor rule in case of biker (thanks Rise).<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/f77006a043f03c01fbb589a435b1e687ec150c99) Added MadAtRiders variant for Coach's ReloadingTank line.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/f91ebab04ea389b54083236de0e988b4d388aba5) Added IsClosestSurvivorNear1200 to the PlayerWarnHeardHunterC1M3Producer Rule.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/9286e1b0074b305205f67b1a1470d065c1a669cc) Fixed one of Francis' final intro lines not triggering the IntroEnd concept.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/9286e1b0074b305205f67b1a1470d065c1a669cc) Asking for a health kit will now require from instead of the subject; will also use IssuerClose; it will more accurately pinpoint the first target.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/9286e1b0074b305205f67b1a1470d065c1a669cc) Along with the second change, there will be generic variants of the rules thereof for B&W only; in the case of the specific responses, they will not trigger when B&W.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/9286e1b0074b305205f67b1a1470d065c1a669cc) Fixed Rochelle using gunshop pickup lines in cases of carried props (gas cans, propane tanks, etc.).<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/11ecbe6d0812c2844afed26634fde72ca1c47ccc) Added "itemtype" "!=carried_prop" criteria.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/07efc68dcb1b47f92b227407baabcfb5810bc96e) Renamed rule/response L4D1SurvivorFrancisHealthHereBiker to L4D1SurvivorHealthHereBiker, and L4D1SurvivorFrancisHealthHereTeenGirl to L4D1SurvivorHealthHereTeenGirl.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/09cca88024b13f34bbe5946e8b171a0a6dda7630) Added new L4D1 survivor rule for asking for health.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/09cca88024b13f34bbe5946e8b171a0a6dda7630) Refined health criteria thereof to be identical across the board.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/3309f4c074b2603461f9b64607e94016807be234) Health criteria consistency for the blank response when they're the target of being asked.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/3309f4c074b2603461f9b64607e94016807be234) Subject criteria weight inconsistency corrected.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/7123c3e5877db80652825e3b74ab902b3d959727) Using "Look!" to ask for a first aid kit will require that the subject not be "None"; or else you will be using the default look rules.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/7123c3e5877db80652825e3b74ab902b3d959727) In vanilla, you need to be looking at a L4D1 survivor; this is to prevent "Look!" from not triggering anything.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/62535c27c696ec440b21c69c3f5ab108034e1c5b) Changed a criteria to the first aid look rules for the L4D1 survivors, the other was meant to be used for remarks; this should be more accurate now.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/e6dcb0d3a29b65e394533f6fa9fd3a6a01ca6915) Coach will now be able to remark on the Candy machine after the carousel provided he hasn't remarked on one prior.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/20f73f1987e3ed3da0d672d5dd480a8eaceaad83) Nick will no longer call out other Survivors by name when attacked on C1M2 (inconsistent with his Look! name calls).<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/f46fb86f2c3e7d748ddb2ae08d87d7d710cf991f) Fixed Ellis' Spitter C1M1 reaction so he can now fire his second line.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/948cdbe288abc6816d68945773f2ff31ae05a30a) Removed a duplicate scene (GoingToDie23) for Coach.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/948cdbe288abc6816d68945773f2ff31ae05a30a) Added a once unused scene (GoingToDieLight16) for Louis.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/ef1e69b54abf6b3e310b5883ba1b11423161347d) Blocked The Passing outro lines from manual vocalization; they can be heard clearly from far away.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/5cc89a4f8a815b723c67a3f9d825dbf3bd89d1e2) Coach, Nick, and Rochelle will not start the C1M4 elevator convo if Ellis is dead or didn't spawn; Ellis is ignored for this since he would need to be alive to hit the button.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/049dd9b68204fd479e4f4e73bf586e1b00d20ef3) For C6M3 outro an orator entity will be the first to "speak"; originally was Francis but now everyone has a fair chance. `[See Passing 3]`<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/8d6fece3d2f2c93a75a1ae778f549e1c45da56a4) FinalVehicleSpotted condition now requires that the player not be incapacitated; this concept fires to all Survivors, so someone is going to say it regardless.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/70399279c5826aa90f33c547d31d4665487c3000) Francis will now use the groovy line for M60 just like he's spotting a chainsaw.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/8f0b77f13cc73aa4d3acea04e19bc2d2f89a6924) L4D1 Survivor spot GL now available.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/1f8ee15fc99b9b225b6adb4644516da5615d4b84) Added Ellis scene (DLC1_C6M2_BridgeCollapse04.vcd) when Nick blames him.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/7c44082bb031053c560e830be0048c358ffecf0b) PlayerPickup disabled entirely for Survival and Scavenge.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/c322d9bfad8ca2184ad922b824fb27c8e2bebabb) Removed the 80% chance criteria to the second response to picking up an SMG after the elevator opens on C1M1; this was in place for Nick on the last update.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/c4043143b06cb6f68ca5ec599538875f1ec70dc9) Prevent PlayerNearFinale from firing if the finale has already started (just in case maps have wonky nav attribute placements).<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/e158f956e634b2167063eead0264c1b1b294f533) Default inputs will no longer demand that the session is in a specific gamemode; instead, they require that the Survivor not be speaking any other scene (only applies to the default inputs for L4D1 and L4D2 concepts and extra concepts like PlayerYellRun will not be affected by this).<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/c8180fec1f90e4294a9f956a9f21ac1b0c8c4e67) Callouts for Uncommon Infected on certain maps will only happen once and will give a unique response; after that, generic callouts will be used with norepeat enforced and reset once per chapter.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/c8180fec1f90e4294a9f956a9f21ac1b0c8c4e67) Jimmy Gibbs Jr. callouts will only happen once per map.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/c8180fec1f90e4294a9f956a9f21ac1b0c8c4e67) Nick and Ellis getting annoyed with calling out MudMen will only happen once per map (after at least 3 rule executions).<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/aec0e35f58a1d7104264a8ed90520c9818e66c98) Removed duplicate PlayerHelp Rule for Coach should the Witch be in aggro state.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/aec0e35f58a1d7104264a8ed90520c9818e66c98) [*](https://github.com/Tsuey/L4D2-Community-Update/commit/bc291097ec1f6fb3c8e9c0d122e1a8fca8892aa0) Commented out new rules that await engine criteria; nothing was changed and this is for reference only.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/e1013bf9738b884c333ae1a816ac335d5cff0ae3) First time map-specific Uncommon Infected callouts will happen once, as usual, but subsequent instances will use generic variants; they see it for the first time, then get adjusted to it, like Dead Center SI.<br/>

# Miscellaneous

### ShowUpdate() script:

&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/474cd5c039356baca6c9b1ed7c5e8bf550819090) <ins>Note</ins>: Requires DebugDrawClear(); will always conflict with other scripts that use it.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/474cd5c039356baca6c9b1ed7c5e8bf550819090) Countless fixes and enhancements.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/474cd5c039356baca6c9b1ed7c5e8bf550819090) Added arguments and filters for added control.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/474cd5c039356baca6c9b1ed7c5e8bf550819090) Rotated ladder DebugDrawText now displays properly.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/474cd5c039356baca6c9b1ed7c5e8bf550819090) Added trigger_teleport and trigger_look to potential highlights.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/474cd5c039356baca6c9b1ed7c5e8bf550819090) Full support for commentary, lump and other mod blockers regardless of prefix.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/474cd5c039356baca6c9b1ed7c5e8bf550819090) No more "Accessed null instance" error if array entities are deleted.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/f8da67c06d9c4b2e64cdb54fdb6f9d23a859591f) [*](https://github.com/Tsuey/L4D2-Community-Update/commit/2b2fa78089d33c057a365309fb39fc395c8a28ef) Updated SetFilter function and console tutorial.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/702c240f365e23c200a95b5d91c7fd89fde9f585) Remove references to commentary files.<br/>

### CommunityUpdate() interface:

&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/e89eee07d69509ed97e387473c598bbaa95037b0) Replaced `"anv_mapfixes"` (anniversary) namespace with `"community_update"` and updated scripts to respect it.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/e89eee07d69509ed97e387473c598bbaa95037b0) Allow users to cancel update and to execute their own code from `"community/usercustom"` and `"community/usercustom/MAPNAME"` scripts.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/e89eee07d69509ed97e387473c598bbaa95037b0) <ins>Method</ins>: `CancelUpdate()` - disallow any map/round future specific changes to be applied.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/e89eee07d69509ed97e387473c598bbaa95037b0) <ins>Method</ins>: `PrefixName( name )` - prefixes a string with `"community_update_"` ("g_UpdateName" variable).<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/e89eee07d69509ed97e387473c598bbaa95037b0) <ins>Method</ins>: `CheckToWarpTank( hndlTank, coords )` - moved from tankwarps into "CommunityUpdate()".<br/>

### Github Organizational:

&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/3de182728f8de818466980d11888032f7672c48f) [*](https://github.com/Tsuey/L4D2-Community-Update/commit/d8c8f09a17a029537a9a51428f0635556035c579)[*](https://github.com/Tsuey/L4D2-Community-Update/commit/d36ac822a42346aaff33a689eb65e21e2317c455)[*](https://github.com/Tsuey/L4D2-Community-Update/commit/22aec27a191e20fdfe8e9dde77d360a2fefcc517)[*](https://github.com/Tsuey/L4D2-Community-Update/commit/bee6c794ff850c4ea601d2dad7fbd45c33dba95b)[*](https://github.com/Tsuey/L4D2-Community-Update/commit/f330d35aec9b60639e62cf6c9a276a9b8d722e4f)[*](https://github.com/Tsuey/L4D2-Community-Update/commit/b6482e688aa4b0db1fccf9182462e884b8123bbb)[*](https://github.com/Tsuey/L4D2-Community-Update/commit/18b5e08aee6598351962d57472bea52694a0efbd)[*](https://github.com/Tsuey/L4D2-Community-Update/commit/8da99d1da0ccd66d1cac0390e6601a9b1bf91a5d) Split fixes into map-specific scripts and removed empty cases.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/ca4fc6eed7c1b6e552daa4b2b17472d1f710a900) [*](https://github.com/Tsuey/L4D2-Community-Update/commit/e89eee07d69509ed97e387473c598bbaa95037b0) Split tankwarps into map-specific scripts.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/651b2584144786f34289051902c026808e823e05) Removed redundant check for VS Survival.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/21edd190a6b2979a451f4830c059ab35043ca76e) [*](https://github.com/Tsuey/L4D2-Community-Update/commit/cae1f94ce3609a35432947af825f42454f27571c) Added map spawn fix functionality.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/5c5241974398047ced5de1147f0885c39d4da077) [*](https://github.com/Tsuey/L4D2-Community-Update/commit/6cee4d3f1c42fbc3cae3ff100a32843d3dc6521a)[*](https://github.com/Tsuey/L4D2-Community-Update/commit/7ae51c4fa8b7780d8ff7846e0828eeeda9b64452) Moved `"scripts"` folder into `"root"` to keep actual VPK content separate from other repository files.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/bf92b09cedfcd5a88817efaaa2d29d2c06feb921) Moved community files and references into dedicated `"community"` folder.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/9aa7aa823891270f3ef4c485fc21c3e5c139ff8c) Added `"scriptedmode.nut"` and `"director_base.nut"` for future reference.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/83a211c873ad5c307af058bdc8ef999e2269e21d) [*](https://github.com/Tsuey/L4D2-Community-Update/commit/ff5cbb54244db4c7141dd55299956400b8e3fee8)[*](https://github.com/Tsuey/L4D2-Community-Update/commit/e5fa745620edc175d7beafef41c1d0fc52b40f8b) Replaced "g_UpdateName" value from `"anv_mapfixes"` to `"community_update"`.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/da92dcdff92876071c09c38ae3a4291094bb9607) [*](https://github.com/Tsuey/L4D2-Community-Update/commit/57868b057baf8fbc09d39c52b755f3120bce2f07) Changed unsafe EntFire calls to DoEntFire.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/e89eee07d69509ed97e387473c598bbaa95037b0) [*](https://github.com/Tsuey/L4D2-Community-Update/commit/de2c7774bdc8d608ca57ddccbc742c95d7e1f4b8)[*](https://github.com/Tsuey/L4D2-Community-Update/commit/6dcc291c48395f5647ddcdf4a3a3687282ba09a0)[*](https://github.com/Tsuey/L4D2-Community-Update/commit/68e74eb4cd7fc6c464a8f59a3508e8021c650cd1) Added "PrecacheModel" calls where they were missing.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/6e46f4be88ee6ca1252061776c2d14ccaf4df426) Updated readme/credits and added some of the team's tools for community reference.<br/>
&emsp;[+](https://github.com/Tsuey/L4D2-Community-Update/commit/1a9f188113de3ac86b580e40958ba640160112a0) Added PowerShell 5.1 utility scripts to mount a game mod folder that mirrors repo changes.<br/>