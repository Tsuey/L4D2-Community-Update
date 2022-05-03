
$animblocksize 32

$modelname infected/anim_smoker.mdl
$include "QCIs/smoker_bones.qci"
$include "QCIs/smoker_hitbox.qci"
$include "QCIs/smoker_ruleshierarchy.qci"
$pushd "DMX/animation"
$scale 1.175
$cmdlist IK_to_BBox ikrule lfoot touch "" ikrule rfoot touch ""
//$lockbonelengths

//====================================================
//
//	IDLES
//
//====================================================

		$sequence Idle_Upper_KNIFE "Smoker_Idle_Standing" fixuploop -15 15 loop fadein .5 fadeout .5 addlayer Smoker_AimMatrix_Idle_Standing cmdlist IK_to_BBox activity ACT_IDLE -1
		$sequence Idle_Upper_KNIFE_2 "Smoker_Idle_Standing_2" fixuploop -15 15 loop fadein .5 fadeout .5 addlayer Smoker_AimMatrix_Idle_Standing cmdlist IK_to_BBox 
		$sequence Crouch_Idle_Upper_KNIFE "Smoker_Idle_Crouching" fixuploop -15 15 loop fadein .75 fadeout .5 addlayer Smoker_AimMatrix_Idle_Standing cmdlist IK_to_BBox activity ACT_CROUCHIDLE -1

//====================================================
//
//	MOVEMENT
//
//====================================================
	//-----------------
	//	Run
	//-----------------

		$animation a_RunS		smoker_RunS		fps 29.00 frame 0 35 startloop  4 fixuploop -5 5  LX LY loop alignto Idle_Upper_KNIFE rotateto -180 cmdlist IK_to_BBox 
		$animation a_RunSE	smoker_RunSE	fps 29.00 frame 0 35 startloop  4 fixuploop -5 5  LX LY loop alignto Idle_Upper_KNIFE rotateto -135 cmdlist IK_to_BBox 
		$animation a_RunE		smoker_RunE		fps 29.47 frame 0 39 startloop 14 fixuploop -4 4 LX LY loop alignto Idle_Upper_KNIFE rotateto -90 cmdlist IK_to_BBox 
		$animation a_RunNE	smoker_RunNE	fps 29.47 frame 0 39 startloop 14 fixuploop -4 4 LX LY loop alignto Idle_Upper_KNIFE rotateto -45 cmdlist IK_to_BBox 
		$animation a_RunN		smoker_RunN 	fps 29.47 frame 0 39 startloop 14 fixuploop -4 4 LX LY loop alignto Idle_Upper_KNIFE rotateto 0 cmdlist IK_to_BBox 
		$animation a_RunNW	smoker_RunNW	fps 29.47 frame 0 39 startloop 14 fixuploop -4 4 LX LY loop alignto Idle_Upper_KNIFE rotateto 45 cmdlist IK_to_BBox 
		$animation a_RunW		smoker_RunW		fps 29.47 frame 0 39 startloop 14 fixuploop -4 4 LX LY loop alignto Idle_Upper_KNIFE rotateto 90 cmdlist IK_to_BBox 
		$animation a_RunSW	smoker_RunSW	fps 29.00 frame 0 35 startloop  4 fixuploop -5 5  LX LY loop alignto Idle_Upper_KNIFE rotateto 135 cmdlist IK_to_BBox 
		$animation a_RunZero "smoker_Idle_Standing" frame 0 0 numframes 60 loop cmdlist IK_to_BBox 

		$sequence Run_Upper_KNIFE {
			a_RunNW a_RunN a_RunNE 
			a_RunW a_RunZero a_RunE 
			a_RunSW a_RunS a_RunSE 
			blendwidth 3 blend move_y -1 1 blend move_x 1 -1 loop
			addlayer Smoker_AimMatrix_Idle_Standing
			fadein .2 fadeout .5  
			ACT_RUN -1
			{ event AE_FOOTSTEP_RIGHT 6 }
			{ event AE_FOOTSTEP_LEFT 17 }
			{ event AE_FOOTSTEP_RIGHT 25 }
			{ event AE_FOOTSTEP_LEFT 36 }
		}

	
	//-----------------
	//	Walk
	//-----------------


	//=======================================================
	//
	//	S Move Macro without IK (for anims with unique South)
	//
	//=======================================================

		$definemacro MoveNoIKMacro sequencename move NorthFilename N_fps N_loopstart N_lastframe SouthFilename S_fps S_loopstart S_lastframe NW_fps NW_loopstart NW_lastframe SW_fps SW_loopstart SW_lastframe fixloop ZeroMove Z_firstframe Z_lastframe Z_numframes align BN_loopstart BN_weight SouthBlend BS_loopstart BS_lastframe BS_weight aimlayer activity event1 event2 Rfoot Lfoot Rfoot2 Lfoot2 fadein fadeout \\
		$animation $sequencename$_SBlend $SouthBlend$ frame 0 $BS_lastframe$ fixuploop -$fixloop$ $fixloop$ LX LY \\
		$animation a_$sequencename$N		$NorthFilename$		 fps $N_fps$  startloop $N_loopstart$  frame 0 $N_lastframe$  fixuploop -$fixloop$ $fixloop$ LX LY loop alignto Idle_Upper_KNIFE rotateto    0 cmdlist IK_to_BBox \\
		$popd \\
		$pushd "dmx/animation" \\
		$animation a_$sequencename$S		$SouthFilename$		 fps $S_fps$  startloop $S_loopstart$  frame 0 $S_lastframe$  fixuploop -$fixloop$ $fixloop$ LX LY loop alignto Idle_Upper_KNIFE rotateto -180 weightlist $BS_weight$ worldspaceblendloop $sequencename$_SBlend 0 weightlist FULLBODY cmdlist IK_to_BBox \\
		$animation a_$sequencename$SE		NamVet_$move$SE_Rifle	 fps $SW_fps$ startloop $SW_loopstart$ frame 0 $SW_lastframe$ fixuploop -$fixloop$ $fixloop$ LX LY loop alignto Idle_Upper_KNIFE rotateto -135 weightlist $BS_weight$ worldspaceblendloop $sequencename$_SBlend 0 weightlist FULLBODY cmdlist IK_to_BBox \\
		$animation a_$sequencename$E		NamVet_$move$E_Rifle	 fps $NW_fps$ startloop $NW_loopstart$ frame 0 $NW_lastframe$ fixuploop -$fixloop$ $fixloop$ LX LY loop alignto Idle_Upper_KNIFE rotateto  -90 weightlist $BN_weight$ worldspaceblendloop a_$sequencename$N 0 weightlist FULLBODY cmdlist IK_to_BBox \\
		$animation a_$sequencename$NE		NamVet_$move$NE_Rifle	 fps $NW_fps$ startloop $NW_loopstart$ frame 0 $NW_lastframe$ fixuploop -$fixloop$ $fixloop$ LX LY loop alignto Idle_Upper_KNIFE rotateto  -45 weightlist $BN_weight$ worldspaceblendloop a_$sequencename$N 0 weightlist FULLBODY cmdlist IK_to_BBox \\
		$animation a_$sequencename$NW		NamVet_$move$NW_Rifle	 fps $NW_fps$ startloop $NW_loopstart$ frame 0 $NW_lastframe$ fixuploop -$fixloop$ $fixloop$ LX LY loop alignto Idle_Upper_KNIFE rotateto   45 weightlist $BN_weight$ worldspaceblendloop a_$sequencename$N 0 weightlist FULLBODY cmdlist IK_to_BBox \\
		$animation a_$sequencename$W		NamVet_$move$W_Rifle	 fps $NW_fps$ startloop $NW_loopstart$ frame 0 $NW_lastframe$ fixuploop -$fixloop$ $fixloop$ LX LY loop alignto Idle_Upper_KNIFE rotateto   90 weightlist $BN_weight$ worldspaceblendloop a_$sequencename$N 0 weightlist FULLBODY cmdlist IK_to_BBox \\
		$animation a_$sequencename$SW		NamVet_$move$SW_Rifle	 fps $SW_fps$ startloop $SW_loopstart$ frame 0 $SW_lastframe$ fixuploop -$fixloop$ $fixloop$ LX LY loop alignto Idle_Upper_KNIFE rotateto  135 weightlist $BS_weight$ worldspaceblendloop $sequencename$_SBlend 0 weightlist FULLBODY cmdlist IK_to_BBox \\
		$popd \\
		$pushd "dmx/animation" \\
		$animation a_$sequencename$Zero	$ZeroMove$   		 frame $Z_firstframe$ $Z_lastframe$ numframes $Z_numframes$ loop alignto $align$ weightlist AllUpperBody worldspaceblend a_$sequencename$N weightlist FULLBODY cmdlist IK_to_BBox \\
		$sequence $sequencename$ { \\
			a_$sequencename$NW  	a_$sequencename$N		a_$sequencename$NE \\
			a_$sequencename$W   	a_$sequencename$Zero	a_$sequencename$E \\
			a_$sequencename$SW  	a_$sequencename$S		a_$sequencename$SE \\
			blendwidth 3 blend move_y -1 1 blend move_x 1 -1 loop \\
			addlayer $aimlayer$ \\
			fadein $fadein$ fadeout $fadeout$ \\
			ACT_$activity$ -1 \\
			{ event AE_FOOTSTEP_RIGHT $Rfoot$ } \\
			{ event AE_FOOTSTEP_LEFT $Lfoot$ } \\
			{ event AE_FOOTSTEP_RIGHT $Rfoot2$ } \\
			{ event AE_FOOTSTEP_LEFT $Lfoot2$ } \\
		} \\

	//$MoveMacro	 (sequence name) 	(motion) 		(North Filename) 		(N fps,start,last) (South Filename) 	(S fps,start,last) (NW fps,start,last) (SW fps,start,last) (fixloop) (Zero Move) 			(Z range, numframes, align) 		(N Blend start, weight) 	(South Blend, start, end) 	(S Blend weight)		(aim matrix) 				(ACT) 		(events) (R, L foot)	(Fade in/out)

	$MoveNoIKMacro	Walk_Upper_KNIFE		Walk			smoker_WalkN 		30 	8 	51	NamVet_WalkS_Rifle		30 	9   56	30 	19 	58	30 	9   56	 5	    smoker_Idle_Standing		0 0  80	Idle_Upper_KNIFE		0	SPINEBLEND	smoker_WalkN		0  51		SPINEBLEND		Smoker_AimMatrix_Idle_Standing	WALK			7002 4002	5 20 31 46	.5 .5


	//-----------------------
	//	Crouch_Walk
	//-----------------------

	$MoveNoIKMacro	Crouch_Walk_Upper_KNIFE		CrouchWalk		smoker_CrouchWalkN 	30	15 	62	NamVet_CrouchWalkS_Rifle	24.96	20   49	27.4	23 	55	24.96	20   49	 5	    Smoker_Idle_Crouching		0 0  75	Idle_Upper_KNIFE		0	SPINEBLEND	smoker_CrouchWalkN	0 62		SPINEBLEND		Smoker_AimMatrix_Idle_Standing	RUN_CROUCH		7002 4002	4 16 35 48	.75 .5

//====================================================
//
//		AIM MATRICES
//
//====================================================

	//---------------
	//	Aim Macro
	//---------------

		$definemacro AimMacro filename \\
		$animation	a_$filename$_neutral		$filename$ frame 4 4 \\
		$animation	a_$filename$_down_right		$filename$ frame 0 0 subtract a_$filename$_neutral 0 \\
		$animation	a_$filename$_down_center	$filename$ frame 1 1 subtract a_$filename$_neutral 0 \\
		$animation	a_$filename$_down_left		$filename$ frame 2 2 subtract a_$filename$_neutral 0 \\
		$animation	a_$filename$_mid_right		$filename$ frame 3 3 subtract a_$filename$_neutral 0 \\
		$animation	a_$filename$_mid_center		$filename$ frame 4 4 noanimation \\
		$animation	a_$filename$_mid_left		$filename$ frame 5 5 subtract a_$filename$_neutral 0 \\
		$animation	a_$filename$_up_right		$filename$ frame 6 6 subtract a_$filename$_neutral 0 \\
		$animation	a_$filename$_up_center		$filename$ frame 7 7 subtract a_$filename$_neutral 0 \\
		$animation	a_$filename$_up_left		$filename$ frame 8 8 subtract a_$filename$_neutral 0 \\
		$animation	a_$filename$_straight_up	$filename$ frame 9 9 subtract a_$filename$_neutral 0 \\
		$sequence $filename$ { \\
			a_$filename$_straight_up a_$filename$_straight_up a_$filename$_straight_up \\
			a_$filename$_up_right a_$filename$_up_center a_$filename$_up_left \\
			a_$filename$_mid_right a_$filename$_mid_center a_$filename$_mid_left \\
			a_$filename$_down_right a_$filename$_down_center a_$filename$_down_left \\
			weightlist ALLUPPERBODY \\
			blendref a_$filename$_neutral \\
			blendcenter a_$filename$_mid_center \\
			blendwidth 3 blend body_yaw -90 90 blend body_pitch -90 45 \\
			delta \\
			iklock rfoot 1 0 iklock lfoot 1 0 \\
			hidden \\
			} \\

	//---------------
	//	Aims
	//---------------

	//	$AimMacro (smd file name)

		$AimMacro Smoker_AimMatrix_Idle_Standing
		$AimMacro Smoker_AimMatrix_Melee

//====================================================
//
//		ATTACKS
//
//====================================================

	//-----------------
	//	Melee Attack
	//-----------------

		$definemacro MeleeMacro num start end b1 b2 b3 b4 hit \\
		$sequence Melee_$num$_Delta 	"Smoker_Melee" 	frame $start$ $end$ weightlist MELEE_DELTA alignto Idle_Upper_KNIFE subtract Idle_Upper_KNIFE 0 iklock lfoot 1 0 iklock rfoot 1 0 delta x y hidden \\
		$sequence Melee_$num$_Layer	"Smoker_Melee"	frame $start$ $end$ weightlist MELEE_NORM addlayer Melee_$num$_Delta x y hidden \\
		$sequence Melee_$num$		"Smoker_Melee" 	fps 33 weightlist NONE numframes $b4$ blendlayer Melee_$num$_Layer $b1$ $b2$ $b3$ $b4$ spline blendlayer Smoker_AimMatrix_Melee $b1$ $b2$ $b3$ $b4$ spline activity ACT_TERROR_ATTACK 1  { \\
			{ event AE_ATTACK_HIT $hit$ } \\
		} \\

		//MeleeMacro 	(melee) (start, end)  (blend frames) 
		$MeleeMacro 	01 		148  185 	0 8 22 37		12
		$MeleeMacro 	02 		476  515 	0 8 24 39		13
		$MeleeMacro 	03 		503  543 	0 8 25 40		9
		//$MeleeMacro 	01a 		156  185 	0 2 14 29
		//$MeleeMacro 	02a 		484  515 	0 2 16 31
		//$MeleeMacro 	03a 		509  543 	0 2 12 34

		$sequence Run_Shoot_KNIFE		"Smoker_Melee" 	fps 33 frame 148  185 weightlist NONE blendlayer Melee_01_Layer 0 8 22 37 spline blendlayer Smoker_AimMatrix_Melee 0 8 22 37 spline
		$sequence Walk_Shoot_KNIFE		"Smoker_Melee" 	fps 33 frame 148  185 weightlist NONE blendlayer Melee_01_Layer 0 8 22 37 spline blendlayer Smoker_AimMatrix_Melee 0 8 22 37 spline
		$sequence Idle_Shoot_KNIFE		"Smoker_Melee" 	fps 33 frame 148  185 weightlist NONE blendlayer Melee_01_Layer 0 8 22 37 spline blendlayer Smoker_AimMatrix_Melee 0 8 22 37 spline
		$sequence Crouch_Idle_Shoot_KNIFE	"Smoker_Melee" 	fps 33 frame 148  185 weightlist NONE blendlayer Melee_01_Layer 0 8 22 37 spline blendlayer Smoker_AimMatrix_Melee 0 8 22 37 spline
		$sequence Crouch_Walk_Shoot_KNIFE	"Smoker_Melee" 	fps 33 frame 148  185 weightlist NONE blendlayer Melee_01_Layer 0 8 22 37 spline blendlayer Smoker_AimMatrix_Melee 0 8 22 37 spline

	//-----------------
	//	Cough Attack
	//-----------------

		$sequence smoker_cough "Smoker_Cough" 
		$animation a_cough "Smoker_Cough" subtract Smoker_Cough 0 
		$sequence Cough_Attack "a_cough" x y alignto Idle_Upper_KNIFE iklock lfoot 1 0 iklock rfoot 1 0 delta activity ACT_SECONDARYATTACK -1 {
			{ event AE_ATTACK_HIT 10 }
			{ event AE_ATTACK_END 70 }
		}
		
	//---------------
	// Tongue Attack
	//---------------
		
		$sequence tongue_attack_antic "smoker_tongue_attack.smd" {
			frames 0 60
			activity ACT_TERROR_SMOKER_PREPARE_TONGUE_LAUNCH 1
		}
		$sequence tongue_attack_grab_survivor "smoker_tongue_attack.smd" {
			frames 55 103
			//fps 23
						
			//need anim event to trigger tongue
			activity ACT_TERROR_SMOKER_SENDING_OUT_TONGUE 1
		}
		
			$sequence tongue_attack_grab_survivor_idle "smoker_tongue_attack.smd" {
			frames 103 104
						
			//need anim event to trigger tongue
			activity ACT_TERROR_SMOKER_SENDING_OUT_TONGUE_IDLE 1
		}
	
		$sequence tongue_attack_drag_survivor "smoker_tongue_attack.smd" {
			frames 103 104
			activity ACT_TERROR_SMOKER_REELING_IN_TONGUE 1
		}
		
		$sequence tongue_attack_drag_survivor_idle "smoker_tongue_attack.smd" {
			frames 104 195
			loop
			activity ACT_TERROR_SMOKER_REELING_IN_TONGUE_IDLE 1
		}
		/*not USED!!
			$sequence tongue_attack_incap_survivor "smoker_tongue_attack.smd" {
			frames 156 167
			//should probably use anim event instead
			//{ event AE_ATTACK_HIT 5 }
			activity ACT_TERROR_SMOKER_CRITICAL_ATTACK 1
		}
		*/
		$sequence tongue_attack_incap_survivor_idle "smoker_tongue_attack.smd" {
			frames 200 510
			loop
			{ event AE_CL_PLAYSOUND 5 "SmokerZombie.TongueChoke" }
			{ event AE_CL_PLAYSOUND 19 "PlayerZombie.AttackHit"  }
			{ event AE_CL_PLAYSOUND 35 "PlayerZombie.AttackHit" }
			{ event AE_CL_PLAYSOUND 50 "PlayerZombie.AttackHit" }
			{ event AE_CL_PLAYSOUND 70 "PlayerZombie.AttackHit" }
			{ event AE_CL_PLAYSOUND 83 "PlayerZombie.AttackHit" }
			{ event AE_CL_PLAYSOUND 98 "PlayerZombie.AttackHit" }
			{ event AE_CL_PLAYSOUND 117 "PlayerZombie.AttackHit" }
			{ event AE_CL_PLAYSOUND 137 "PlayerZombie.AttackHit" }
			{ event AE_CL_PLAYSOUND 150 "SmokerZombie.TongueChoke" }
			{ event AE_CL_PLAYSOUND 155 "PlayerZombie.AttackHit" }
			{ event AE_CL_PLAYSOUND 173 "PlayerZombie.AttackHit" }
			{ event AE_CL_PLAYSOUND 188 "PlayerZombie.AttackHit" }
			{ event AE_CL_PLAYSOUND 207 "PlayerZombie.AttackHit" }
			{ event AE_CL_PLAYSOUND 222 "PlayerZombie.AttackHit" }
			{ event AE_CL_PLAYSOUND 235 "PlayerZombie.AttackHit" }
			{ event AE_CL_PLAYSOUND 250 "PlayerZombie.AttackHit" }
			{ event AE_CL_PLAYSOUND 263 "PlayerZombie.AttackHit" }
			{ event AE_CL_PLAYSOUND 278 "PlayerZombie.AttackHit" }
			{ event AE_CL_PLAYSOUND 296 "PlayerZombie.AttackHit" }
			fixuploop -3 3
			//should probably use anim event instead
			//{ event AE_ATTACK_HIT 92 }
			activity ACT_TERROR_SMOKER_CRITICAL_ATTACK_IDLE 1
		}
		
			$sequence tongue_attack_to_idle "smoker_tongue_attack.smd" {
			frames 490 500
			activity ACT_TERROR_SMOKER_END_TONGUE_ATTACK 1
		}


//====================================================
//
//		OTHER
//
//====================================================

	//---------------
	//	Jump
	//---------------

		$sequence Jump "Smoker_Jump" z fadein .1 fadeout .3 alignto Idle_Upper_KNIFE addlayer Smoker_AimMatrix_Idle_Standing activity ACT_JUMP -1 { event AE_FOOTSTEP_RIGHT 0 } { event AE_FOOTSTEP_LEFT 0 }

	//---------------
	//	Climbing
	//---------------

		$animation a_Ladder_Ascend "Smoker_ClimbUp" frame 0 32 LZ align Idle_Upper_KNIFE x y z 0 0 fixuploop -5 5 loop ikrule lhand touch "" ikrule rhand touch ""
		$animation a_Ladder_Descend "Smoker_ClimbDown" frame 0 35 LZ align Idle_Upper_KNIFE x y z 0 0 fixuploop -5 5 loop ikrule lhand touch "" ikrule rhand touch ""

		$animation	a_Ladder_Dismount_1	Smoker_Ladder_Dismount frame 10 10 origin 0 -7 23 ikrule lhand touch "" ikrule rhand touch ""  
		$animation	a_Ladder_Dismount_2	Smoker_Ladder_Dismount frame 30 30 origin 0 -7 40 ikrule lhand touch "" ikrule rhand touch ""    
		$animation	a_Ladder_Dismount_3	Smoker_Ladder_Dismount frame 45 45 origin 0 -13 60 ikrule lhand touch "" ikrule rhand touch ""    
		$animation	a_Ladder_Dismount_4	Smoker_Ladder_Dismount frame 70 70 alignto Idle_Upper_KNIFE origin 0 0 80 ikrule lhand touch "" ikrule rhand touch ""  

		//Layer to allow ladder idle noise added. (See below) - Cuba
		$sequence Ladder_Ascend {
			a_Ladder_Ascend a_Ladder_Dismount_1 a_Ladder_Dismount_2 a_Ladder_Dismount_3 a_Ladder_Dismount_4
			blendwidth 5x1 blend dismount 0 1
			addlayer Flinch_chest
			activity ACT_CLIMB_UP -1
			} 
		$sequence Ladder_Descend {
			a_Ladder_Descend a_Ladder_Dismount_1 a_Ladder_Dismount_2 a_Ladder_Dismount_3 a_Ladder_Dismount_4
			blendwidth 5x1 blend dismount 0 1
			addlayer Flinch_chest
			activity ACT_CLIMB_DOWN -1
			} 

	//---------------
	//	Shoved
	//---------------

		//Missing footstep action events added to all stumbles. - Cuba
		$sequence Shoved_Backward "Smoker_Shoved_Backward" frame 7 96 fadein .1 fadeout .5 alignto Idle_Upper_KNIFE activity ACT_TERROR_SHOVED_BACKWARD 1  {
				walkframe 15 lx ly
				walkframe 55 lx ly
				walkalignto 89 Idle_Upper_KNIFE lx ly
				{ event AE_FOOTSTEP_RIGHT 10 } { event AE_FOOTSTEP_RIGHT 25 } { event AE_FOOTSTEP_RIGHT 40 } { event AE_FOOTSTEP_RIGHT 59 }
				{ event AE_FOOTSTEP_LEFT 6 } { event AE_FOOTSTEP_LEFT 18 }  { event AE_FOOTSTEP_LEFT 31 }  { event AE_FOOTSTEP_LEFT 49 }
			}
		$sequence Shoved_Forward "Smoker_Shoved_Forward" frame 7 84 fadein .1 fadeout .5 alignto Idle_Upper_KNIFE activity ACT_TERROR_SHOVED_FORWARD 1   {
				walkframe 30 lx ly
				walkframe 60 lx ly
				walkalignto 77 Idle_Upper_KNIFE lx ly
				{ event AE_FOOTSTEP_RIGHT 17 } { event AE_FOOTSTEP_RIGHT 37 } { event AE_FOOTSTEP_RIGHT 58 } { event AE_FOOTSTEP_RIGHT 77 } 
				{ event AE_FOOTSTEP_LEFT 8 } { event AE_FOOTSTEP_LEFT 27 }  { event AE_FOOTSTEP_LEFT 48 }  { event AE_FOOTSTEP_LEFT 69 }
			}
		$sequence Shoved_Leftward "Smoker_Shoved_Leftward" frame 3 107 fadein .1 fadeout .5 alignto Idle_Upper_KNIFE activity ACT_TERROR_SHOVED_LEFTWARD 1   {
				walkframe 31 lx ly
				walkframe 42 lx ly
				walkframe 56 lx ly
				walkalignto 104 Idle_Upper_KNIFE lx ly
				{ event AE_FOOTSTEP_RIGHT 14 } { event AE_FOOTSTEP_RIGHT 30 } { event AE_FOOTSTEP_RIGHT 51 } { event AE_FOOTSTEP_RIGHT 71 }
				{ event AE_FOOTSTEP_LEFT 20 } { event AE_FOOTSTEP_LEFT 40 }  { event AE_FOOTSTEP_LEFT 61 } 
			}
		$sequence Shoved_Rightward "Smoker_Shoved_Rightward" frame 4 106 fadein .1 fadeout .5 alignto Idle_Upper_KNIFE activity ACT_TERROR_SHOVED_RIGHTWARD 1   {
				walkframe 50 lx ly
				walkframe 68 lx ly
				walkalignto 102 Idle_Upper_KNIFE lx ly
				{ event AE_FOOTSTEP_RIGHT 24 } { event AE_FOOTSTEP_RIGHT 44 } { event AE_FOOTSTEP_RIGHT 65 } { event AE_FOOTSTEP_RIGHT 93 }
				{ event AE_FOOTSTEP_LEFT 17 } { event AE_FOOTSTEP_LEFT 35 }  { event AE_FOOTSTEP_LEFT 54 }  { event AE_FOOTSTEP_LEFT 80 }
			}

	//---------------
	//	Flinches
	//---------------

		//------------------------------------------------------------
		//	Flinches adopted from boomer's generic flitches. - Cuba
		//------------------------------------------------------------
		//Locational flinches are not present in L4D2, however the generic ones are. 
		//If we take them from the boomer we can give the hunter and smoker back some of the feedback present in L4D1.
		
		$weightlist INJUREDIDLENOISE  "Valvebiped.Bip01_L_Thigh" 0.0 "Valvebiped.Bip01_R_Thigh" 0.0 "Valvebiped.bip01_Pelvis" .6 "ValveBiped.Bip01_Spine1" .4 "ValveBiped.Bip01_L_Clavicle"  0  "ValveBiped.Bip01_R_Clavicle" 0
		$weightlist PELVIS75ARMS0  "Valvebiped.Bip01_L_Thigh" 0.0 "Valvebiped.Bip01_R_Thigh" 0.0 "Valvebiped.bip01_Pelvis" .75 "ValveBiped.Bip01_L_Clavicle"  0  "ValveBiped.Bip01_R_Clavicle" 0
		
		//Keep original sequence names to avoid issues with $declaresequence.
		$sequence Flinch_left "NamVet_Flinch01.smd" frame 6 27 fixuploop -6 7 subtract Flinch_left 0 delta weightlist PELVIS100ARMS0 iklock lfoot 1 0 iklock rfoot 1 0 activity ACT_TERROR_FLINCH 1 
		$sequence Flinch_right "NamVet_Flinch01.smd" frame 6 27 fixuploop -6 7 subtract Flinch_right 0 delta weightlist INJUREDIDLENOISE iklock lfoot 1 0 iklock rfoot 1 0 activity ACT_TERROR_FLINCH 1 
		$sequence Flinch_stomach "NamVet_Flinch01.smd" frame 6 27 fixuploop -6 7 subtract Flinch_stomach 0 delta weightlist PELVIS75ARMS0 iklock lfoot 1 0 iklock rfoot 1 0 activity ACT_TERROR_FLINCH 1
		
		//------------------
		//Ladder Idle - Cuba
		//------------------
		//All standing locational flinches will never play in game, this allows us to use the sequnce for other purposes.
		//Repurposing one of the defunct flitches we can create a layer to add idle noise to climbing ladders like survivors. Currently SI are 100% static when idle on a ladder.		
		//Sequence name will have to stay the same to avoid $declaresequence issues.
		//This being such a small addition I fully understand if its deemed unnecessary, However these sequences are just taking up space and I figure it might be work putting them to use.

		$sequence Flinch_chest "Smoker_Idle_Standing" fps 40 fixuploop -15 15 loop weightlist IDLENOISE subtract Flinch_chest 0 iklock lfoot 1 0 iklock rfoot 1 0 iklock lhand 1 0 iklock rhand 1 0 delta realtime
		
		//End edits
		
		$sequence Flinch_head "Smoker_Flinch_head" subtract Flinch_head 25 delta weightlist ALLUPPERBODY iklock lfoot 1 0 iklock rfoot 1 0 activity ACT_FLINCH_HEAD 1
		$sequence Flinch_back "Smoker_Flinch_center" subtract Flinch_back 25 delta weightlist ALLUPPERBODY iklock lfoot 1 0 iklock rfoot 1 0 activity ACT_FLINCH_CHEST_BACK 1
		$sequence Flinch_leftleg "Smoker_Flinch_left_leg" subtract Flinch_leftleg 25 delta weightlist FULLBODY activity ACT_FLINCH_LEFTLEG 1 
		$sequence Flinch_rightleg "Smoker_Flinch_right_leg" subtract Flinch_rightleg 25 delta weightlist FULLBODY activity ACT_FLINCH_RIGHTLEG 1 

//====================================================
//
//	Death Poses
//
//====================================================

	$sequence deathpose_front "CT_Stand_Death_Front" fps 1 frame 0 6 activity ACT_DIE_FRONTSIDE -1 { event AE_CL_DISABLE_BODY_GROUP 1 "mulletTongue" }
	$sequence deathpose_back  "CT_Stand_Death_Back"  fps 1 frame 0 6 activity ACT_DIE_BACKSIDE  -1 { event AE_CL_DISABLE_BODY_GROUP 1 "mulletTongue" }
	$sequence deathpose_right "CT_Stand_Death_Right" fps 1 frame 0 6 activity ACT_DIE_RIGHTSIDE -1 { event AE_CL_DISABLE_BODY_GROUP 1 "mulletTongue" }
	$sequence deathpose_left  "CT_Stand_Death_Left"  fps 1 frame 0 6 activity ACT_DIE_LEFTSIDE  -1 { event AE_CL_DISABLE_BODY_GROUP 1 "mulletTongue" }

	$sequence deathpose_crouch_front "CT_Crouch_Death_Front" fps 1 frame 0 6 activity ACT_DIE_CROUCH_FRONTSIDE -1 { event AE_CL_DISABLE_BODY_GROUP 1 "mulletTongue" }
	$sequence deathpose_crouch_back  "CT_Crouch_Death_Back"  fps 1 frame 0 6 activity ACT_DIE_CROUCH_BACKSIDE  -1 { event AE_CL_DISABLE_BODY_GROUP 1 "mulletTongue" }
	$sequence deathpose_crouch_right "CT_Crouch_Death_Right" fps 1 frame 0 6 activity ACT_DIE_CROUCH_RIGHTSIDE -1 { event AE_CL_DISABLE_BODY_GROUP 1 "mulletTongue" }
	$sequence deathpose_crouch_left  "CT_Crouch_Death_Left"  fps 1 frame 0 6 activity ACT_DIE_CROUCH_LEFTSIDE  -1 { event AE_CL_DISABLE_BODY_GROUP 1 "mulletTongue" }
$popd