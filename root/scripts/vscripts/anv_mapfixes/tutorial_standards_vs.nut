g_Chapter = "DEVELOPER - tutorial_standards_vs";

devchap( "ALL MODES" );

if ( HasPlayerControlledZombies() )
{
    //	NOTE: See "mapspawn.nut" for links to more information, such as the
    //	development team's Github, Steam Workshop, guides, etc.

    // Every map has been modified with care. Tutorial Standards VS offers a brief
    // opportunity to explain the standards applied to every map to improve Versus.
    // When this map is loaded, use "ShowUpdate()" to visualize these changes.

    // Firstly, some func_playerinfected_clips only serve to inconvenience Hunters.
    // These clips are uniquely identified using their "Radius" NetProp as a checksum
    // of their vecMins and vecMaxs.

    // If a rooftop is clipped in this way, it generally meant Valve determined
    // the attack to be too overpowered for all SI; but forgot that Hunters are
    // entitled to a bit extra freedom. A lot of maps Kill these clips and add new
    // ladders to open them up for all SI, but for this map we're taking a hint
    // that it's imbalanced and opening these to Hunter/Jockey only. Deleting clips
    // to allow players to touch the SKYBOX is generally discouraged, so both these
    // deletions have full freedom of movement around them. Note that Hunters can
    // pounce off SKYBOX but not these func_playerinfected_clip, thus in cases they
    // are allowed such access the SKYBOX should be shielded with make_clip().

    kill_funcinfclip( 334.621 );	// Delete clip on low roof immediately out of safe room
    kill_funcinfclip( 408.18 );	// Delete useless clip over a fence most SI can't even touch

    // Both the below clips belong to the same rooftop. Even though not necessarily
    // the case with Tutorial Standards because it's small, some maps benefit from
    // opening up rooftops with existing props to act as LOS blockers -- sometimes
    // these are non-solid and require a make_prop() to solidify them, but here we're
    // lucky and the AC vent is already solid.

    kill_funcinfclip( 320.18 );	// Delete 1st clip above backyard's lower roof
    kill_funcinfclip( 328.248 );	// Delete 2nd clip above backyard's lower roof

    // Now we can add a new ladder to allow all SI players onto this roof. It's always
    // best to clone an existing ladder that's already facing in the desired direction,
    // but in this case the one nearby is too tall and would stick through the ceiling
    // so we're using an alternative that has the exact height but requires rotation.
    // The below code specifies the "m_vecSpecifiedSurroundingMaxs" (or VSSM) of the
    // clone target, then the offset Origin and Angles from the original's location,
    // followed by its new Normal (aka Forward Vector).

    make_ladder( "_ladder_acvent_cloned_smallest", "-342 -336 328", "-1114 549 0", "0 90 0", "0 1 0" );

    // This new ladder allows all SI to touch the SKYBOX, so add wrongway signs to give
    // some explanation for the new void they're able to see and touch.

    make_prop( "dynamic", "_acvent_wrongway1", "models/props_misc/wrongway_sign01_optimized.mdl", "-791 15 439", "0 90 0", "shadow_no", "solid_no", "255 255 255", 217, 17 );
    make_prop( "dynamic", "_acvent_wrongway2", "models/props_misc/wrongway_sign01_optimized.mdl", "-610 15 439", "0 90 0", "shadow_no", "solid_no", "255 255 255", 217, 17 );

    // This backyard still has problems. There's 4 ladders on the outside of the fence
    // but no ladders for players to actually get out there to spawn or attack from.
    // Given that all 4 ladders are next to each other, it's only necessary to flip 1
    // then the same data can be used for each where only the VSSM needs changing.
    // Note that 4 ladders is only for demonstration purposes where normally in these
    // cases just 1 new ladder is OK -- too many ladders is equally bad as too few.

    make_ladder( "_ladder_fencefront1_cloned_fenceback1", "-1050 588 208", "-2068 795 0", "0 180 0", "1 0 0" );
    make_ladder( "_ladder_fencefront2_cloned_fenceback2", "-1050 460 208", "-2068 795 0", "0 180 0", "1 0 0" );
    make_ladder( "_ladder_fencefront3_cloned_fenceback3", "-1050 332 208", "-2068 795 0", "0 180 0", "1 0 0" );
    make_ladder( "_ladder_fencefront4_cloned_fenceback4", "-1050 204 208", "-2068 795 0", "0 180 0", "1 0 0" );

    // Finally this backyard has a tree cluster back here SI players can permanently
    // get stuck in. This adds a clip, completing the area. The higher rooftop back
    // here is ignored because it's part of a large contiguous rooftop split by SKYBOX.
    // While the higher rooftop could be salvaged because the SKYBOX isn't that bad,
    // there's rooftops of competitive height nearby and the benefit is small as it's
    // outside the finale event area.

    make_clip( "_permstuck_treecluster", "Everyone", 1, "-17 -17 -17", "17 17 0", "-1170 724 200" );

    // Now let's add a new ladder that's purely Quality-of-Life (QoL). At the top
    // of the elevator there's only a ladder on the right side and not the left.
    // The one on the right has already established the precedent for using pipe
    // models to justify the climb to Survivors. It's also in the Survivor's critical
    // path and is given clips on both sides known as "ladder guides". QoL ladders
    // get SI players to the attacks they want to make quicker.

    make_ladder( "_ladder_elevleft_cloned_elevright", "-342 -464 264", "-413 -932 0", "0 180 0", "-1 0 0" );
    make_prop( "dynamic", "_ladder_elevleft_pipe", "models/props_rooftop/Gutter_Pipe_256.mdl", "-64 -465 400", "0 -90 0", "shadow_no" );
    make_clip( "_elevleft_clipleft", "Everyone", 1, "-10 -2 0", "10 2 272", "-66 -441 128", "0 45 0" );
    make_clip( "_elevleft_clipright", "Everyone", 1, "-10 -2 0", "10 2 272", "-66 -495 128", "0 -45 0" );

    // Last but not least, there's an exploit where Survivors are able to bash the
    // subway car door to get inside early. DoEntFire() is used to modify the unnamed
    // prop_dynamic to require a minimum of 4 damage to injure it at all -- it starts
    // at 200 health and each bash does 3 damage. This map has no melee weapon spawns.

    DoEntFire( "!self", "AddOutput", "minhealthdmg 4", 0.0, null, Entities.FindByClassnameNearest( "prop_dynamic", Vector( -22, -784, 178 ), 1 ) );

    // Here's a bonus ladder to give SI players access to an inaccessible event area.

    make_ladder( "_ladder_eventfront_cloned_eventback", "274 -352 192", "531 -712 0", "0 180 0", "-1 0 0" );

    // We're still missing a decent ladder up the opening above the medical cabinet
    // and radio -- use "script_execute z_developer_scouteditor" to add it for us!

    // setpos_exact -329 -521 128; setang_exact -4 -129 0
}