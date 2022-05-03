
$animblocksize 32

$modelname infected/anim_hunter.mdl
$include "QCIs/hunter_bones.qci"
$include "QCIs/hunter_hitbox.qci"
$include "QCIs/hunter_ruleshierarchy.qci"
$pushd "dmx/animation"
//$lockbonelengths
$cmdlist IK_to_BBox ikrule lfoot touch "" ikrule rfoot touch ""

$cmdlist lockFeet_footsteps {
	ikrule lfoot footstep height 20 floor 0
	ikrule rfoot footstep height 20 floor 0 
}

//====================================================
//
//	IDLES
//
//====================================================

		$sequence Idle_Upper_KNIFE "Hunter_Idle_Standing_01" {
			addlayer Hunter_AimMatrix_Idle_Standing 
			origin 0 -5 -1 
			cmdlist IK_to_BBox
		}
		
		$sequence Idle_Standing_01 "Hunter_Idle_Standing_01" {
			origin 0 -5 -1 
			fadein .5 fadeout .5 
			loops 
			fixuploop -15 15 
			matchblend Idle_Upper_KNIFE 0 0 -15 15 
			addlayer Hunter_AimMatrix_Idle_Standing 
			cmdlist IK_to_BBox 
			activity ACT_IDLE 1
		}		
		
		$sequence Idle_Standing_02 "Hunter_Idle_Standing_02" {
			origin 0 -5 -1 
			fadein .5 fadeout .5 
			loops 
			fixuploop -15 15 
			matchblend Idle_Upper_KNIFE 0 0 -15 15 
			addlayer Hunter_AimMatrix_Idle_Standing 
			cmdlist IK_to_BBox 
			activity ACT_IDLE 1
		}
					
		$sequence Idle_Standing_03 "Hunter_Idle_Standing_03" {
			origin 0 -5 -1 
			fadein .5 fadeout .5 
			loops 
			fixuploop -15 15 
			matchblend Idle_Upper_KNIFE 0 0 -15 15 
			addlayer Hunter_AimMatrix_Idle_Standing 
			cmdlist IK_to_BBox 
			activity ACT_IDLE 1
		}
			
		$sequence idle_crouch_pose "Hunter_Idle_Crouching_01.smd" 
	
		$sequence layer_crouchIdleNoise "Hunter_Idle_Crouching.smd" {
			loops 
			fixuploop -15 5 
			subtract layer_crouchIdleNoise 0 
			delta 
			hidden 
			realtime 
			iklock rfoot 1 0 iklock lfoot 1 0
			iklock rhand 1 0 iklock lhand 1 0
		}
		
		$sequence Idle_Crouching_01 "Hunter_Idle_Crouching_01.smd" numframes 60 {
			addlayer layer_crouchIdleNoise 
			origin 0 -15 0
			activity ACT_CROUCHIDLE 1
		}

/*
		$animation a_idle_ceiling_neutral "Hunter_idle_ceiling.smd" frame 1 1 
		$animation a_idle_ceiling_aim_fwd	"Hunter_idle_ceiling.smd" frame 1 1 subtract a_idle_ceiling_neutral 0
		$animation a_idle_ceiling_aim_right "Hunter_idle_ceiling.smd" frame 0 0 subtract a_idle_ceiling_neutral 0
		$animation a_idle_ceiling_aim_left "Hunter_idle_ceiling.smd" frame 2 2 subtract a_idle_ceiling_neutral 0
		$animation a_idle_ceiling_aim_down "Hunter_idle_ceiling.smd" frame 3 3 subtract a_idle_ceiling_neutral 0
		
		$sequence layer_idle_ceiling_aim { 
			a_idle_ceiling_aim_right a_idle_ceiling_aim_fwd a_idle_ceiling_aim_left
			a_idle_ceiling_aim_right a_idle_ceiling_aim_fwd a_idle_ceiling_aim_left
			a_idle_ceiling_aim_right a_idle_ceiling_aim_fwd a_idle_ceiling_aim_left
			a_idle_ceiling_aim_down a_idle_ceiling_aim_down a_idle_ceiling_aim_down
			blendref a_idle_ceiling_neutral
			blendcenter a_idle_ceiling_aim_fwd
			blendWidth 3 blend body_yaw -90 90 blend body_pitch -90 90 
			delta 
			iklock rfoot 1 0 iklock lfoot 1 0 
			hidden 
		}
			
		$sequence Idle_Ceiling "Hunter_Idle_Ceiling.smd" {
			frames 1 1 
			align Idle_Standing_01 x y z 0 0 
			addlayer layer_idle_ceiling_aim 
			activity ACT_TERROR_HUNTER_IDLE_CEILING 1
		}
			
		$sequence Idle_Wall "Hunter_Lunge_OntoWall_01.smd" {
			frame 37 37 
			numframes 30 
			align Idle_Upper_KNIFE x y z 0 0 
			activity ACT_TERROR_HUNTER_IDLE_WALL 1
		}
*/	
		
		
//=================================================================================================================================================================================================================
//
//	MOVEMENT
//
//==================================================================================================================================================================================================================


	//----------------------
	//
	//	RUN
	//
	//----------------------


		$animation a_RunS Hunter_RunS frame 0 30 {
			startloop 4 
			fixuploop -5 5 
			LX LY 
			loop 
			alignto Idle_Upper_KNIFE 
			rotateto -180 
			cmdlist IK_to_BBox 
			origin 0 0 -1
		}
	
		$animation a_RunN Hunter_RunN startloop 10 fixuploop -7 7 LX LY loop alignto Idle_Upper_KNIFE rotateto 0 cmdlist IK_to_BBox origin 0 0 -1
		
		
		
		$popd
		$pushd "dmx/animation"
		
		$animation a_RunSE common_male_runSE frame 0 28 startloop 4 fixuploop 0 10 LX LY loop alignto Idle_Upper_KNIFE rotateto -135 cmdlist IK_to_BBox origin 0 0 -1
		$animation a_RunE common_male_runE frame 0 31 startloop 3 fixuploop 0 4 LX LY loop alignto Idle_Upper_KNIFE rotateto -90 cmdlist IK_to_BBox origin 0 0 -1
		$animation a_RunNE common_male_runNE frame 0 31 startloop 3 fixuploop 0 4 LX LY loop alignto Idle_Upper_KNIFE rotateto -45 cmdlist IK_to_BBox origin 0 0 -1
		$animation a_RunNW common_male_runNW  frame 0 31 startloop 3 fixuploop 0 4 LX LY loop alignto Idle_Upper_KNIFE rotateto 45 cmdlist IK_to_BBox origin 0 0 -1
		$animation a_RunW common_male_runW  frame 0 31 startloop 3 fixuploop 0 4 LX LY loop alignto Idle_Upper_KNIFE rotateto 90 cmdlist IK_to_BBox origin 0 0 -1
		$animation a_RunSW common_male_runSW frame 0 28 startloop 4 fixuploop 0 10 LX LY loop alignto Idle_Upper_KNIFE rotateto 135 cmdlist IK_to_BBox origin 0 0 -1
		
		$popd
		$pushd "dmx/animation"
		
		$animation a_RunZero "Hunter_Idle_Standing_01" frame 0 0 numframes 60 {
			loop 
			alignto Idle_Upper_KNIFE 
			cmdlist IK_to_BBox 
			origin 0 0 -1
		}
		
		$sequence Run_Upper_KNIFE {
			a_RunNW a_RunN a_RunNE 
			a_RunW a_RunZero a_RunE 
			a_RunSW a_RunS a_RunSE 
			blendwidth 3 blend move_y -1 1 blend move_x 1 -1 
			loop
			addlayer Hunter_AimMatrix_Idle_Standing
			fadein .2 fadeout .5 
			ACT_RUN -1
			{ event AE_FOOTSTEP_RIGHT 6 }
			{ event AE_FOOTSTEP_LEFT 13 }
			{ event AE_FOOTSTEP_RIGHT 21 }
			{ event AE_FOOTSTEP_LEFT 29 }
		}
		
		

//==============================================================================================================================================================================
//
//	S Move MACRO without IK (for anims with unique South)
//
//==============================================================================================================================================================================

		$definemacro SMoveNoIKMacro 		sequencename 		move 		NorthFilename 		N_fps N_loopstart 	N_lastframe 	SouthFilename 	S_fps 		S_loopstart 		S_lastframe 		NW_fps NW_loopstart 		NW_lastframe 		SW_fps 		SW_loopstart 		SW_lastframe 		fixloop 	ZeroMove 		Z_firstframe Z_lastframe Z_numframes align BN_loopstart BN_weight SouthBlend BS_loopstart BS_lastframe BS_weight aimlayer activity event1 event2 Rfoot Lfoot Rfoot2 Lfoot2 fadein fadeout \\
		$animation a_$sequencename$N		$NorthFilename$		 fps $N_fps$  startloop $N_loopstart$  frame 0 $N_lastframe$  fixuploop -$fixloop$ $fixloop$ LX LY loop alignto Idle_Standing_01 rotateto    0 cmdlist IK_to_BBox origin 0 0 -1 \\
		$animation a_$sequencename$S		$SouthFilename$		 fps $S_fps$  startloop $S_loopstart$  frame 0 $S_lastframe$  fixuploop -$fixloop$ $fixloop$ LX LY loop alignto Idle_Standing_01 rotateto -180 cmdlist IK_to_BBox origin 0 0 -1 \\
		$popd \\
		$pushd "DMX/animation" \\
		$animation a_$sequencename$SE		NamVet_$move$SE_Rifle	 fps $SW_fps$ startloop $SW_loopstart$ frame 0 $SW_lastframe$ fixuploop -$fixloop$ $fixloop$ LX LY loop alignto Idle_Standing_01 rotateto -135 weightlist $BS_weight$ worldspaceblendloop a_$sequencename$S 0 weightlist FULLBODY cmdlist IK_to_BBox origin 0 0 -1 \\
		$animation a_$sequencename$E		NamVet_$move$E_Rifle	 fps $NW_fps$ startloop $NW_loopstart$ frame 0 $NW_lastframe$ fixuploop -$fixloop$ $fixloop$ LX LY loop alignto Idle_Standing_01 rotateto  -90 weightlist $BN_weight$ worldspaceblendloop a_$sequencename$N 0 weightlist FULLBODY cmdlist IK_to_BBox origin 0 0 -1 \\
		$animation a_$sequencename$NE		NamVet_$move$NE_Rifle	 fps $NW_fps$ startloop $NW_loopstart$ frame 0 $NW_lastframe$ fixuploop -$fixloop$ $fixloop$ LX LY loop alignto Idle_Standing_01 rotateto  -45 weightlist $BN_weight$ worldspaceblendloop a_$sequencename$N 0 weightlist FULLBODY cmdlist IK_to_BBox origin 0 0 -1 \\
		$animation a_$sequencename$NW		NamVet_$move$NW_Rifle	 fps $NW_fps$ startloop $NW_loopstart$ frame 0 $NW_lastframe$ fixuploop -$fixloop$ $fixloop$ LX LY loop alignto Idle_Standing_01 rotateto   45 weightlist $BN_weight$ worldspaceblendloop a_$sequencename$N 0 weightlist FULLBODY cmdlist IK_to_BBox origin 0 0 -1 \\
		$animation a_$sequencename$W		NamVet_$move$W_Rifle	 fps $NW_fps$ startloop $NW_loopstart$ frame 0 $NW_lastframe$ fixuploop -$fixloop$ $fixloop$ LX LY loop alignto Idle_Standing_01 rotateto   90 weightlist $BN_weight$ worldspaceblendloop a_$sequencename$N 0 weightlist FULLBODY cmdlist IK_to_BBox origin 0 0 -1 \\
		$animation a_$sequencename$SW		NamVet_$move$SW_Rifle	 fps $SW_fps$ startloop $SW_loopstart$ frame 0 $SW_lastframe$ fixuploop -$fixloop$ $fixloop$ LX LY loop alignto Idle_Standing_01 rotateto  135 weightlist $BS_weight$ worldspaceblendloop a_$sequencename$S 0 weightlist FULLBODY cmdlist IK_to_BBox origin 0 0 -1 \\
		$popd \\
		$pushd "dmx/animation" \\
		$animation a_$sequencename$Zero	$ZeroMove$   		 frame $Z_firstframe$ $Z_lastframe$ numframes $Z_numframes$ loop alignto $align$ cmdlist IK_to_BBox origin 0 0 -1 \\
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

//   $MoveMacro	 		(sequence name) 			(move) 		(North Filename) 		(N fps, start,last) (South Filename) 	(S fps,start,last) (NW fps,start,last) (SW fps,start,last) (fixloop) 			(Zero Move) 					(Z range, numframes, align) 		(N Blend start, weight) 	(South Blend, 						start, end) 	(S Blend weight)						(aim matrix) 								(ACT) 			(events) 		(R, L foot)		(Fade in/out)
	$SMoveNoIKMacro		Walk_Upper_Knife			 Walk				Hunter_WalkN 			 26.75   22 	  56		 Hunter_WalkS		43.45	   0    72	   30 	  19 	  58		  30 	   9    56	 		5	     Hunter_Idle_Standing_01		    0 				0  			80				Idle_Upper_KNIFE	0				SPINEBLEND	Hunter_WalkN		41    51			SPINEBLEND				Hunter_AimMatrix_Idle_Standing			 WALK				7002 4002		 9 22 36 51				.5 .5



//==========================================================================================================================================================
//
// Crouch walks
//
//==========================================================================================================================================================


		$animation a_Crouch_Walk_Upper_KNIFEN		"Hunter_CrouchWalkN_02.smd"		 fps 50 {
			fixuploop -5 5 
			LX LY 
			loop 
			alignto Idle_Crouching_01 
			rotateto 0 
			cmdlist IK_to_BBox  
		}
		
		$animation a_Crouch_Walk_Upper_KNIFES		Hunter_CrouchWalkS		 fps 50 {
			startloop 10  
			frame 0 60  
			fixuploop -5 5 
			LX LY 
			loop 
			alignto Idle_Crouching_01 
			rotateto -180 
			cmdlist IK_to_BBox  
		}
		
		$animation a_Crouch_Walk_Upper_KNIFEW		Hunter_CrouchWalkW	 fps 50 {
			fixuploop -5 5 
			LX LY 
			loop 
			alignto Idle_Crouching_01 
			rotateto   90 
			cmdlist IK_to_BBox
		}
		
		$animation a_Crouch_Walk_Upper_KNIFEE		Hunter_CrouchWalkE	 fps 50 {
			fixuploop -5 5 
			LX LY 
			loop 
			alignto Idle_Crouching_01 
			rotateto  -90 
			cmdlist IK_to_BBox 
		}
		
		$animation a_Crouch_Walk_Upper_KNIFESE		Hunter_CrouchWalkSE	 fps 50 {
			fixuploop -5 5 
			LX LY 
			loop 
			alignto Idle_Crouching_01 
			rotateto -135 
			cmdlist IK_to_BBox 
		}
		
		$animation a_Crouch_Walk_Upper_KNIFENE		Hunter_CrouchWalkNE	 fps 50 {
			fixuploop -5 5 
			LX LY 
			loop 
			alignto Idle_Crouching_01 
			rotateto -45 
			cmdlist IK_to_BBox
		}
		
		$animation a_Crouch_Walk_Upper_KNIFENW		Hunter_CrouchWalkNW	 fps 50 {
			fixuploop -5 5 
			LX LY 
			loop 
			alignto Idle_Crouching_01 
			rotateto 45 
			cmdlist IK_to_BBox
		}
		
		$animation a_Crouch_Walk_Upper_KNIFESW		Hunter_CrouchWalkSW	 fps 50 {
			fixuploop -5 5 
			LX LY 
			loop 
			alignto Idle_Crouching_01 
			rotateto 135 
			cmdlist IK_to_BBox 
		}
		
		$animation a_Crouch_Walk_Upper_KNIFEZero	"Hunter_Idle_Crouching_01.smd"   frame 0 0 {
			numframes 75 
			loop 
			alignto Idle_Crouching_01 
			cmdlist IK_to_BBox 
		}
		
		$sequence Crouch_Walk_Upper_KNIFE { 
			a_Crouch_Walk_Upper_KNIFENW 	a_Crouch_Walk_Upper_KNIFEN		a_Crouch_Walk_Upper_KNIFENE 
			a_Crouch_Walk_Upper_KNIFEW   	a_Crouch_Walk_Upper_KNIFEZero	a_Crouch_Walk_Upper_KNIFEE 
			a_Crouch_Walk_Upper_KNIFESW  	a_Crouch_Walk_Upper_KNIFES		a_Crouch_Walk_Upper_KNIFESE 
			blendwidth 3 blend move_y -1 1 blend move_x 1 -1 loop 
			addlayer Hunter_AimMatrix_CrouchWalking 
			activity ACT_RUN_CROUCH -1 
		} 

		$sequence crouchWalkN_raw "hunter_crouchWalkN.smd" lx ly loop alignto Idle_Standing_01 rotateto 0

//=============================================================================================================================================================
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



		$AimMacro Hunter_AimMatrix_Idle_Standing
		$AimMacro Hunter_AimMatrix_Melee

	//---------------
	//	CrouchWalk Aim Macro
	//---------------

		$definemacro CrouchAimMacro filename \\
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
			iklock rhand 1 0 iklock lhand 1 0 \\
			hidden \\
			} \\

	//---------------
	//	Aims
	//---------------

	//	$AimMacro (smd file name)

		$CrouchAimMacro Hunter_AimMatrix_Idle_Crouching
		$CrouchAimMacro Hunter_AimMatrix_CrouchWalking


//====================================================
//
//		ATTACKS
//
//====================================================

	//---------------
	//	Attack
	//---------------

		$sequence Melee "Hunter_Melee"
		$definemacro MeleeMacro num start end b1 b2 b3 b4 hit \\
		$sequence Melee_$num$_Delta 	"Hunter_Melee" 	frame $start$ $end$ weightlist MELEE_DELTA alignto Idle_Upper_KNIFE subtract Idle_Upper_KNIFE 0 iklock lfoot 1 0 iklock rfoot 1 0 delta x y hidden \\
		$sequence Melee_$num$_Layer	"Hunter_Melee"	frame $start$ $end$ weightlist MELEE_NORM addlayer Melee_$num$_Delta x y hidden \\
		$sequence Melee_$num$		"Hunter_Melee" 	fps 35 weightlist NONE numframes $b4$ blendlayer Melee_$num$_Layer $b1$ $b2$ $b3$ $b4$ spline blendlayer Hunter_AimMatrix_Melee $b1$ $b2$ $b3$ $b4$ spline activity ACT_TERROR_ATTACK 1  { \\
			{ event AE_ATTACK_HIT $hit$ } \\
		} \\

		//MeleeMacro 	(melee) (start, end)  (blend frames) (hit)
		$MeleeMacro 	01 		5  51 	0 9 32 46		19
		$MeleeMacro 	02 		35 80 	0 9 32 45		20
		$MeleeMacro 	03 		65 107 	0 9 28 42		19
		$MeleeMacro 	04 		90 128 	0 9 28 38		19

	$popd
	$pushd "dmx/animation"
		$sequence hunter_pummel		"hunter_pummel" 	fps 30 numframes 52 weightlist NONE blendlayer hunter_pummel_Layer 0 9 40 52 spline blendlayer Hunter_AimMatrix_Melee 0 9 40 52 spline activity ACT_TERROR_ATTACK_PUMMEL 1  { 
			{ event AE_ATTACK_HIT 22 }
		}
		$sequence hunter_pummel_Delta 	"Hunter_pummel" 	weightlist MELEE_DELTA alignto Idle_Upper_KNIFE subtract Idle_Upper_KNIFE 0 iklock lfoot 1 0 iklock rfoot 1 0 delta x y hidden 
		$sequence hunter_pummel_Layer	"Hunter_pummel"	weightlist MELEE_NORM addlayer hunter_pummel_Delta x y hidden 
	
		
		$popd
		$pushd "dmx/animation"
		
		
		$sequence Run_Shoot_KNIFE		"Hunter_Melee" 	{
			fps 35 
			weightlist NONE 
			numframes 46 
			blendlayer Melee_01_Layer 0 9 32 46 spline 
			blendlayer Hunter_AimMatrix_Melee 0 9 32 46 spline    
		}
		
		$sequence Walk_Shoot_KNIFE		"Hunter_Melee" {
			fps 35 weightlist NONE 
			numframes 46 
			blendlayer Melee_01_Layer 0 9 32 46 spline 
			blendlayer Hunter_AimMatrix_Melee 0 9 32 46 spline   
		}
		
		$sequence Idle_Shoot_KNIFE		"Hunter_Melee" {
			fps 35 
			weightlist NONE 
			numframes 46 
			blendlayer Melee_01_Layer 0 9 32 46 spline 
			blendlayer Hunter_AimMatrix_Melee 0 9 32 46 spline   
		}
		
		$sequence Crouch_Idle_Shoot_KNIFE	"Hunter_Melee" {
			fps 35 
			weightlist NONE 
			numframes 46 
			blendlayer Melee_01_Layer 0 9 32 46 spline 
			blendlayer Hunter_AimMatrix_Melee 0 9 32 46 spline
		}
		   
		$sequence Crouch_Walk_Shoot_KNIFE	"Hunter_Melee" {
			fps 35 
			weightlist NONE 
			numframes 46 
			blendlayer Melee_01_Layer 0 9 32 46 spline 
			blendlayer Hunter_AimMatrix_Melee 0 9 32 46 spline
		}
		   
		$sequence Melee_Pounce	"Hunter_Melee_Pounce" {
			fps 35
			loop
			frames 0 325
			fixuploop -10 0
			activity ACT_TERROR_HUNTER_POUNCE_MELEE -1 
			event AE_CL_CREATE_PARTICLE_EFFECT 40 "hunter_stab start_at_attachment lhand"
			event AE_CL_CREATE_PARTICLE_EFFECT 53 "hunter_stab start_at_attachment rhand" 
			event AE_CL_CREATE_PARTICLE_EFFECT 67 "hunter_stab start_at_attachment lhand" 
			event AE_CL_CREATE_PARTICLE_EFFECT 106 "hunter_stab start_at_attachment lhand" 
			event AE_CL_CREATE_PARTICLE_EFFECT 119 "hunter_stab start_at_attachment rhand" 
			event AE_CL_CREATE_PARTICLE_EFFECT 155 "hunter_stab start_at_attachment lhand" 
			event AE_CL_CREATE_PARTICLE_EFFECT 155 "hunter_stab start_at_attachment rhand"
			event AE_CL_CREATE_PARTICLE_EFFECT 221 "hunter_stab start_at_attachment lhand" 
			event AE_CL_CREATE_PARTICLE_EFFECT 235 "hunter_stab start_at_attachment rhand" 
			event AE_CL_CREATE_PARTICLE_EFFECT 250 "hunter_stab start_at_attachment lhand" 
			event AE_CL_CREATE_PARTICLE_EFFECT 268 "hunter_stab start_at_attachment rhand" 
			event AE_CL_CREATE_PARTICLE_EFFECT 310 "hunter_stab start_at_attachment lhand" 
			event AE_CL_CREATE_PARTICLE_EFFECT 314 "hunter_stab start_at_attachment rhand" 
			event AE_CL_CREATE_PARTICLE_EFFECT 22 "hunter_claw follow_attachment lhand" 
			event AE_CL_CREATE_PARTICLE_EFFECT 42 "hunter_claw follow_attachment rhand" 
			event AE_CL_CREATE_PARTICLE_EFFECT 53 "hunter_claw follow_attachment lhand" 
			event AE_CL_CREATE_PARTICLE_EFFECT 65 "hunter_claw follow_attachment rhand" 
			event AE_CL_CREATE_PARTICLE_EFFECT 85 "hunter_claw follow_attachment lhand" 
			event AE_CL_CREATE_PARTICLE_EFFECT 100 "hunter_claw follow_attachment rhand" 
			event AE_CL_CREATE_PARTICLE_EFFECT 131 "hunter_claw follow_attachment lhand" 
			event AE_CL_CREATE_PARTICLE_EFFECT 129 "hunter_claw follow_attachment rhand" 
			event AE_CL_CREATE_PARTICLE_EFFECT 164 "hunter_claw follow_attachment lhand" 
			event AE_CL_CREATE_PARTICLE_EFFECT 165 "hunter_claw follow_attachment rhand" 
			event AE_CL_CREATE_PARTICLE_EFFECT 200 "hunter_claw follow_attachment lhand" 
			event AE_CL_CREATE_PARTICLE_EFFECT 202 "hunter_claw follow_attachment rhand" 
			event AE_CL_CREATE_PARTICLE_EFFECT 235 "hunter_claw follow_attachment lhand" 
			event AE_CL_CREATE_PARTICLE_EFFECT 254 "hunter_claw follow_attachment rhand" 
			event AE_CL_CREATE_PARTICLE_EFFECT 277 "hunter_claw follow_attachment lhand" 
			event AE_CL_CREATE_PARTICLE_EFFECT 277 "hunter_claw follow_attachment rhand" 
			event 5004 40 "PlayerZombie.AttackHit" 
			event 5004 53 "PlayerZombie.AttackHit" 
			event 5004 67 "PlayerZombie.AttackHit" 
			event 5004 106 "PlayerZombie.AttackHit" 
			event 5004 119 "PlayerZombie.AttackHit" 
			event 5004 155 "PlayerZombie.AttackHit" 
			event 5004 155 "PlayerZombie.AttackHit" 
			event 5004 221 "PlayerZombie.AttackHit" 
			event 5004 235 "PlayerZombie.AttackHit" 
			event 5004 250 "PlayerZombie.AttackHit" 
			event 5004 268 "PlayerZombie.AttackHit" 
			event 5004 310 "PlayerZombie.AttackHit" 
			event 5004 314 "PlayerZombie.AttackHit"
			event 5004 22 "PlayerZombie.AttackHit" 
			event 5004 42 "PlayerZombie.AttackHit" 
			event 5004 53 "PlayerZombie.AttackHit" 
			event 5004 65 "PlayerZombie.AttackHit" 
			event 5004 85 "PlayerZombie.AttackHit" 
			event 5004 100 "PlayerZombie.AttackHit" 
			event 5004 131 "PlayerZombie.AttackHit" 
			event 5004 129 "PlayerZombie.AttackHit" 
			event 5004 164 "PlayerZombie.AttackHit" 
			event 5004 165 "PlayerZombie.AttackHit" 
			event 5004 200 "PlayerZombie.AttackHit" 
			event 5004 202 "PlayerZombie.AttackHit" 
			event 5004 235 "PlayerZombie.AttackHit" 
			event 5004 254 "PlayerZombie.AttackHit" 
			event 5004 277 "PlayerZombie.AttackHit" 
			event 5004 277 "PlayerZombie.AttackHit" 
		}
			
// Knocked off from a pounce
		$sequence Melee_pounce_Knockoff_R "hunter_melee_pounce_knockoff_R.smd" {
			// jake: hack origin command to workaround weird interpolation in game.  The hunter
			// seems to move towards you before moving away from you.  cheating his starting pos out a bit, he
			// gets aligned to his bbox correctly by the end of the sequence.
			activity ACT_TERROR_HUNTER_POUNCE_KNOCKOFF_R 1 
			origin 8 0 0
			walkframe 2 lx ly 
			walkframe 12 lx ly 
			walkalignto 30 Idle_Crouching_01 lx ly
			walkalignto 60 Idle_Crouching_01 lx ly lzr
			// sounds...
			//event AE_CL_PLAYSOUND 1 "HunterZombie.Pain"
			event AE_CL_PLAYSOUND 21 "Flesh.ImpactHard"
			event AE_CL_PLAYSOUND 26 "Flesh.ImpactHard"
			event AE_CL_PLAYSOUND 40 "HunterZombie.Pounce.Cancel"
		}
		
// placeholders using shoved anims
		$sequence layer_pounce_pose "hunter_melee_pounce_knockoff_L.smd" {
			frame 0 0 
			numframes 30
		}
	
		//Missing footstep action events added to all stumbles. - Cuba
		$sequence Melee_pounce_Knockoff_Backward "Hunter_Shoved_backward_01" { 
			frame 5 74 
			fadein .1 fadeout .5 
			addlayer Hunter_AimMatrix_Idle_Standing 
			alignto Idle_Upper_KNIFE 
			walkframe 9 lx ly
			walkframe 33 lx ly
			walkalignto 69 Idle_Upper_KNIFE lx ly
			blendlayer layer_pounce_pose 0 0 0 12 spline
			activity ACT_TERROR_HUNTER_POUNCE_KNOCKOFF_BACKWARD 1
			{ event AE_FOOTSTEP_LEFT 13 } { event AE_FOOTSTEP_RIGHT 18 } { event AE_FOOTSTEP_LEFT 26 } { event AE_FOOTSTEP_RIGHT 31 }
		}
		 
		$sequence Melee_pounce_Knockoff_Forward "Hunter_Shoved_Forward" frame 7 84 fadein .1 fadeout .5 addlayer Hunter_AimMatrix_Idle_Standing alignto Idle_Upper_KNIFE {
			walkframe 30 lx ly
			walkframe 60 lx ly
			walkalignto 77 Idle_Upper_KNIFE lx ly
			blendlayer layer_pounce_pose 0 0 0 12 spline
			activity ACT_TERROR_HUNTER_POUNCE_KNOCKOFF_FORWARD 1
			{ event AE_FOOTSTEP_RIGHT 17 } { event AE_FOOTSTEP_RIGHT 37 } { event AE_FOOTSTEP_RIGHT 58 } { event AE_FOOTSTEP_RIGHT 77 } 
			{ event AE_FOOTSTEP_LEFT 8 } { event AE_FOOTSTEP_LEFT 27 }  { event AE_FOOTSTEP_LEFT 48 }  { event AE_FOOTSTEP_LEFT 69 }
		}
			
		$sequence Melee_pounce_Knockoff_L "Hunter_Shoved_Leftward" {
			frame 3 107 
			fadein .1 fadeout .5 
			addlayer Hunter_AimMatrix_Idle_Standing 
			alignto Idle_Upper_KNIFE 
			walkframe 31 lx ly
			walkframe 42 lx ly
			walkframe 56 lx ly
			walkalignto 104 Idle_Upper_KNIFE lx ly
			blendlayer layer_pounce_pose 0 0 0 12 spline
			activity ACT_TERROR_HUNTER_POUNCE_KNOCKOFF_L 1
			{ event AE_FOOTSTEP_RIGHT 14 } { event AE_FOOTSTEP_RIGHT 30 } { event AE_FOOTSTEP_RIGHT 51 } { event AE_FOOTSTEP_RIGHT 71 }
			{ event AE_FOOTSTEP_LEFT 20 } { event AE_FOOTSTEP_LEFT 40 }  { event AE_FOOTSTEP_LEFT 61 } 
		}
			
// pounce broadcast anim
		$sequence Melee_Pounce_Broadcast_01 "Hunter_PounceBroadcast_01.smd" {
			fps 30 
			origin 0 -15 0
			activity ACT_TERROR_HUNTER_POUNCE_BROADCAST 1
		}
		

//===================================================================================================================================================================
//
//		OTHER
//
//==================================================================================================================================================================

		//---------------------------------------
		//	Shoved
		//---------------------------------------

		//Missing footstep action events added to all stumbles. - Cuba
		$sequence Shoved_Backward_01 "Hunter_Shoved_backward_01" {
				frame 5 74 
				fadein .1 fadeout .5 
				addlayer Hunter_AimMatrix_Idle_Standing 
				alignto Idle_Upper_KNIFE 
				activity ACT_TERROR_SHOVED_BACKWARD 1   
				walkframe 9 lx ly
				walkframe 33 lx ly
				walkalignto 69 Idle_Upper_KNIFE lx ly
				{ event AE_FOOTSTEP_LEFT 13 } { event AE_FOOTSTEP_RIGHT 18 } { event AE_FOOTSTEP_LEFT 26 } { event AE_FOOTSTEP_RIGHT 31 }
			}
			
		$sequence Shoved_Backward_02 "Hunter_Shoved_backward_02" {
				frame 7 81 
				fadein .1 fadeout .5 
				addlayer Hunter_AimMatrix_Idle_Standing 
				alignto Idle_Upper_KNIFE 
				activity ACT_TERROR_SHOVED_BACKWARD 1   
				walkframe 9 lx ly
				walkframe 39 lx ly
				walkalignto 74 Idle_Upper_KNIFE lx ly
				{ event AE_FOOTSTEP_LEFT 8 } { event AE_FOOTSTEP_RIGHT 15 } { event AE_FOOTSTEP_LEFT 24 } { event AE_FOOTSTEP_RIGHT 32 } { event AE_FOOTSTEP_LEFT 37 } { event AE_FOOTSTEP_RIGHT 45 }
			}
			
		$sequence Shoved_Forward "Hunter_Shoved_Forward" {
				frame 7 84 
				fadein .1 fadeout .5 
				addlayer Hunter_AimMatrix_Idle_Standing 
				alignto Idle_Upper_KNIFE 
				activity ACT_TERROR_SHOVED_FORWARD -1   
				walkframe 30 lx ly
				walkframe 60 lx ly
				walkalignto 77 Idle_Upper_KNIFE lx ly
				{ event AE_FOOTSTEP_RIGHT 17 } { event AE_FOOTSTEP_RIGHT 37 } { event AE_FOOTSTEP_RIGHT 58 } { event AE_FOOTSTEP_RIGHT 77 } 
				{ event AE_FOOTSTEP_LEFT 8 } { event AE_FOOTSTEP_LEFT 27 }  { event AE_FOOTSTEP_LEFT 48 }  { event AE_FOOTSTEP_LEFT 69 }
			}

		$sequence Shoved_Leftward "Hunter_Shoved_Leftward" {
				frame 3 107 
				fadein .1 fadeout .5 
				addlayer Hunter_AimMatrix_Idle_Standing 
				alignto Idle_Upper_KNIFE 
				activity ACT_TERROR_SHOVED_LEFTWARD -1   
				walkframe 31 lx ly
				walkframe 42 lx ly
				walkframe 56 lx ly
				walkalignto 104 Idle_Upper_KNIFE lx ly
				{ event AE_FOOTSTEP_RIGHT 14 } { event AE_FOOTSTEP_RIGHT 30 } { event AE_FOOTSTEP_RIGHT 51 } { event AE_FOOTSTEP_RIGHT 71 }
				{ event AE_FOOTSTEP_LEFT 20 } { event AE_FOOTSTEP_LEFT 40 }  { event AE_FOOTSTEP_LEFT 61 } 
			}
			
		$sequence Shoved_Rightward "Hunter_Shoved_Rightward" {
				frame 4 106 
				fadein .1 fadeout .5 
				addlayer Hunter_AimMatrix_Idle_Standing 
				alignto Idle_Upper_KNIFE 
				activity ACT_TERROR_SHOVED_RIGHTWARD -1   
				walkframe 50 lx ly
				walkframe 68 lx ly
				walkalignto 102 Idle_Upper_KNIFE lx ly
				{ event AE_FOOTSTEP_RIGHT 24 } { event AE_FOOTSTEP_RIGHT 44 } { event AE_FOOTSTEP_RIGHT 65 } { event AE_FOOTSTEP_RIGHT 93 }
				{ event AE_FOOTSTEP_LEFT 17 } { event AE_FOOTSTEP_LEFT 35 }  { event AE_FOOTSTEP_LEFT 54 }  { event AE_FOOTSTEP_LEFT 80 }
			}


		//------------------------------------------
		//	Lunges
		//-----------------------------------------

// Poseparams to drive Lunge/Pounce in-air changes throughout trajectory
			$poseparameter "vert_vel" 0.0 1.0 
			$poseparameter "horiz_vel" 0.0 1.0


		$sequence a_Jump "Hunter_Lunge_Up" {
			frame 41 41 
			align Idle_Upper_KNIFE x y 0 0 
		}
		
		$sequence Jump "Hunter_Lunge_Up" {
			fadein 0.1 
			frame 17 71 
			alignto Idle_Upper_KNIFE 
			addlayer Hunter_AimMatrix_Idle_Standing 
			activity ACT_JUMP -1 
			event AE_FOOTSTEP_RIGHT 0 
			event AE_FOOTSTEP_LEFT 0 
			walkalignto 13 a_Jump lx ly lz
			walkalignto 24 a_Jump lx ly lz
		}

		$sequence Lunge_01 "Hunter_Lunge_Up" {
			fadein 0.1 
			frame 17 25 x y z 
			alignto Idle_Upper_KNIFE 
			//activity ACT_TERROR_HUNTER_LUNGE 1
		}
				
		$sequence Lunge_02 "Hunter_Lunge_OntoWall_02" {
			fadein 0.1 
			frame 12 20 x y z 
			alignto Idle_Upper_KNIFE 
			//activity ACT_TERROR_HUNTER_LUNGE 1
		}
		
// LOW PITCH LUNGE NAVIGATION
		$animation a_lunge_low_nav_01 "Hunter_Lunge_low_02.smd" {
			frames 1 12 
			x y z 
			alignto Idle_Upper_KNIFE
			walkalignto 5 Idle_Upper_KNIFE lz
		}
		
// HIGH PITCH LUNGE NAVIGATION
		$animation a_lunge_high_nav_01 "Hunter_Lunge_high_02.smd" {
			frames 1 12 
			x y z 
			alignto Idle_Upper_KNIFE 
			walkalignto 5 Idle_Upper_KNIFE lz
		}
		
		$sequence Lunge_nav_01 {
			a_lunge_high_nav_01 a_lunge_low_nav_01
			blend horiz_vel .1 .9
			activity ACT_TERROR_HUNTER_LUNGE 1
		}
		
// running is duped for now.  this act should go away(jake)
		$sequence Lunge_While_Running_01 {
			a_lunge_high_nav_01 a_lunge_low_nav_01
			blend horiz_vel .1 .9
			activity ACT_TERROR_HUNTER_LUNGE_WHILE_RUNNING 1
		}

// LUNGING AT A PLAYER (using regular LUNGE anim for now so there's not a pop to the LUNGE_IDLE)
// TODO: make seperate IDLE acts for LUNGE_INTO_SURVIVOR?		
		$sequence Lunge_Into_Survivor_01 {
			a_lunge_high_nav_01 a_lunge_low_nav_01
			blend horiz_vel .1 .9
			activity ACT_TERROR_HUNTER_LUNGE_INTO_SURVIVOR 1
		}
		
// BLENDED LUNGE NAV IDLE, OVER VERT VELOCITY
// the idea is to have the vert_vel poseparameter drive
// the cycle of the anim, so they start extended, compress near
// the apex, and stretch before landing.
		
		$sequence lunge_nav_idle_high_02 "Hunter_Lunge_high_02.smd" {
			frames 12 36
			align Idle_Upper_KNIFE x y z 0 0
			x y z
			posecycle vert_vel 
		}
		
		$sequence lunge_nav_idle_low_02 "Hunter_Lunge_low_02.smd" {
			frames 12 27
			align Idle_Upper_KNIFE x y z 0 0
			x y z
			posecycle vert_vel 
		}
		
		$sequence lunge_nav_idle_01 "Hunter_Lunge_high_01.smd" noanimation numframes 60 loop {
			blendlayer lunge_nav_idle_high_02 -1 0 0.1 0.9 spline poseparameter horiz_vel
			blendlayer lunge_nav_idle_low_02 .1 .9 1.0 2.0 spline poseparameter horiz_vel
			addlayer idlenoise_01
			addlayer idlenoise_02
			activity ACT_TERROR_HUNTER_LUNGE_IDLE 1
		}
		
// LUNGE_NAV_LANDS
		$animation Lunge_Land_low_nav_01_contact "Hunter_Lunge_low_01.smd" {
			frames 33 33 
			alignto Idle_Upper_KNIFE
		}
		
		$animation Lunge_Land_low_nav_01_contact2 "Hunter_Lunge_low_01.smd" {
			frames 38 38 
			alignto Idle_Upper_KNIFE
		}
		
		$animation Lunge_Land_low_nav_01_endPose "Hunter_Lunge_low_01.smd" {
		frames 55 55 
		alignto Idle_Upper_KNIFE
		}
		
		$sequence Lunge_Land_low_nav_01 "Hunter_Lunge_low_01.smd" {
			frames 35 55 
			align Idle_Upper_KNIFE x y z 0 0
			x y
			walkalignto 3 Lunge_Land_low_nav_01_contact2 lz
			walkalignto 19 Lunge_Land_low_nav_01_endPose lz
			activity ACT_TERROR_HUNTER_LANDING_HARD 1
		}
		
		$animation Lunge_Land_high_nav_01_contact "Hunter_Lunge_high_01.smd" {
			frames 33 33 
			alignto Idle_Upper_KNIFE
		}
		
		$animation Lunge_Land_high_nav_01_contact2 "Hunter_Lunge_high_01.smd" {
			frames 38 38 
			alignto Idle_Upper_KNIFE
		}
		
		$animation Lunge_Land_high_nav_01_endPose "Hunter_Lunge_high_01.smd" {
			frames 55 55 
			alignto Idle_Upper_KNIFE
		}
		
//$sequence Lunge_Land_high_nav_01 "Hunter_Lunge_high_01.smd" frames 33 55 {
		$sequence Lunge_Land_high_nav_01 "Hunter_Lunge_high_02.smd" {
			frames 38 58 
			align Idle_Upper_KNIFE x y z 0 0
			x y
			//walkalignto 3 Lunge_Land_low_nav_01_contact lz	// hack.  author it right
			walkalignto 5 Lunge_Land_high_nav_01_contact2 lz
			walkalignto 19 Lunge_Land_high_nav_01_endPose lz
			//activity ACT_TERROR_HUNTER_LANDING_HARD 1
		}
		
// land gesture
		$sequence Land_gesture_01 "Hunter_land_gesture_01.smd" weightlist ALLUPPERBODY subtract Land_gesture_01 0 delta iklock lfoot 0 1 iklock rfoot 0 1


//==================================================================================================================
//		
// POUNCES
//
//==================================================================================================================
		
// LOW PITCH POUNCE
		$animation a_pounce_low_01 "Hunter_Pounce_low_01.smd" {
			frames 1 11 
			x y z 
			alignto Idle_Upper_KNIFE
			walkalignto 5 Idle_Upper_KNIFE lz
		}
		
// HIGH PITCH POUNCE (just using LUNGE_HIGH for now.  What does a high-pitch pounce mean?  maybe coming down with all fours like a cat pounce?)
		$sequence Pounce_01_blendlayer {
			a_lunge_high_nav_01 a_pounce_low_01
			blend horiz_vel .1 .9
			//activity ACT_TERROR_HUNTER_POUNCE 1
		}
		
		$sequence Pounce_01 a_pounce_low_01 {
		{ event AE_CL_CREATE_PARTICLE_EFFECT 0 "hunter_motion_blur follow_attachment attach_blur" }
			blendlayer Pounce_01_blendlayer 3 10 11 11
			Activity ACT_TERROR_HUNTER_POUNCE 1
		}
		
// BLENDED POUNCE IDLE, OVER VERT VELOCITY
// the idea is to have the vert_vel poseparameter drive
// the cycle of the anim, so they start extended, compress near
// the apex, and 
		
		$sequence pounce_idle_high "Hunter_Lunge_high_02.smd" {
			frames 11 36
			align Idle_Upper_KNIFE x y z 0 0
			x y z
			posecycle vert_vel 
		}
		
		$sequence pounce_idle_low "Hunter_Pounce_low_01.smd" {
			frames 11 30
			align Idle_Upper_KNIFE x y z 0 0
			x y z
			posecycle vert_vel 
		}
		
		$sequence pounce_idle_01 "Hunter_Lunge_high_01.smd" noanimation numframes 60 loop {
			blendlayer pounce_idle_high -1 0 0.1 0.9 spline poseparameter horiz_vel
			blendlayer pounce_idle_low .1 .9 1.0 2.0 spline poseparameter horiz_vel
			addlayer idlenoise_01
			addlayer idlenoise_02
			{ event AE_CL_CREATE_PARTICLE_EFFECT 0 "hunter_motion_blur follow_attachment attach_blur" }
			activity ACT_TERROR_HUNTER_POUNCE_IDLE -1
		}
		
// these are duped for the other lunges above -- same anim for both acts.  
// there's no discernible difference in the game, because the hunter just 
// accellerates insanely fast at the start of the thing anyways.  this
// ACT should go away

		$sequence Lunge_OffWall_BacktoWall "Hunter_Lunge_OffWall_BackToWall" {
			fadein 0.1 
			frame 5 20 x y z 
			align Idle_Upper_KNIFE x y z 0 0 
			activity ACT_TERROR_HUNTER_LUNGE_OFF_WALL_BACK -1 
			event AE_CL_CREATE_PARTICLE_EFFECT 0 "hunter_leap_dust start_at_attachment rfoot"
			event AE_CL_CREATE_PARTICLE_EFFECT 0 "hunter_leap_dust start_at_attachment lfoot" 
		}
		
		$sequence Lunge_OffWall_Left_R "Hunter_Lunge_OffWall_SpinLeft" {
			fps 40 
			frame 6 27 
			x y z 
			align Idle_Upper_KNIFE x y z 0 0 
			rotate -90 
			activity ACT_TERROR_HUNTER_LUNGE_OFF_WALL_SPIN_LEFT -1 
			event AE_CL_CREATE_PARTICLE_EFFECT 0 "hunter_leap_dust start_at_attachment rfoot" 
			event AE_CL_CREATE_PARTICLE_EFFECT 0 "hunter_leap_dust start_at_attachment lfoot" 
		}
		
		$sequence Lunge_OffWall_Right_R "Hunter_Lunge_OffWall_SpinRight" {
			fps 35 
			frame 3 20 
			x y z 
			align Idle_Upper_KNIFE x y z 0 0 
			rotate 90 
			activity ACT_TERROR_HUNTER_LUNGE_OFF_WALL_SPIN_RIGHT -1 
			event AE_CL_CREATE_PARTICLE_EFFECT 0 "hunter_leap_dust start_at_attachment rfoot" 
			event AE_CL_CREATE_PARTICLE_EFFECT 0 "hunter_leap_dust start_at_attachment lfoot" 
		}

		$weightlist ALLLOWERBODY "Valvebiped.bip01_Pelvis" 0.0 "Valvebiped.Bip01_L_Thigh" .2 "Valvebiped.Bip01_R_Thigh" .2 

		$sequence Idlenoise_01 	"Hunter_Idle_Standing_01" {
			weightlist Melee_Norm 
			fixuploop -15 15 loop 
			subtract Idlenoise_01 0 
			delta 
			hidden
		}
		
		$sequence Idlenoise_02 	"Hunter_Idle_Standing_01" {
			fixuploop -15 15 
			loop 
			subtract Idlenoise_02 0 
			delta 
			hidden
		}
		
		$sequence Idlenoise_03 	"Hunter_RunN" {
			weightlist ALLLOWERBODY 
			fixuploop -7 7 
			loop 
			subtract Idlenoise_03 0 
			delta 
			hidden
		}

		$sequence Fall_Idle "Hunter_Land_02" {
			frame 4 4 
			numframes 60 
			addlayer idlenoise_01 
			addlayer idlenoise_02 
			align Idle_Upper_KNIFE x y z zr 0 0 
			activity ACT_TERROR_HUNTER_FALL_IDLE 1
		}

		$animation	a_Lunge_OntoWall_01 "Hunter_Lunge_OntoWall_01" {
			x y z 
			align Idle_Upper_KNIFE x y z 0 0 
			frame 19 37
		}
		
		$animation	a_Lunge_OntoWall_02 "Hunter_Lunge_OntoWall_02" {
			x y z 
			align Idle_Upper_KNIFE x y z 0 0 
			frame 25 47 
		}
			
		$animation	a_right	Hunter_Lunge_OffWall_SpinRight {
			frame 0 0 
			numframes 15 
			align Idle_Upper_KNIFE x y z 0 0 
		}
		
		$animation	a_back	Hunter_Lunge_OffWall_BackToWall {
			frame 0 0 
			numframes 15 
			rotate 180 
			align Idle_Upper_KNIFE x y z 0 0  
		}
		
		$animation	a_left	Hunter_Lunge_OffWall_SpinLeft {
			frame 0 0 
			numframes 15 
			align Idle_Upper_KNIFE x y z 0 0 
 		}
 		
		$sequence Lunge_OntoWall_01 { 
			a_back a_right a_Lunge_OntoWall_01 a_left a_back 
			blendwidth 5 blend body_yaw -180 180 
			fadein 0.1
			event AE_CL_CREATE_PARTICLE_EFFECT 0 "hunter_leap_dust start_at_attachment rfoot" 
			event AE_CL_CREATE_PARTICLE_EFFECT 0 "hunter_leap_dust start_at_attachment lfoot" 
			activity ACT_TERROR_HUNTER_LUNGE_ONTO_WALL 1 
			}

		$sequence Lunge_OntoWall_02 { 
			a_back a_right a_Lunge_OntoWall_02 a_left a_back 
			blendwidth 5 blend body_yaw -180 180 
			fadein 0.1
			event AE_CL_CREATE_PARTICLE_EFFECT 0 "hunter_leap_dust start_at_attachment rfoot" 
			event AE_CL_CREATE_PARTICLE_EFFECT 0 "hunter_leap_dust start_at_attachment lfoot" 
			activity ACT_TERROR_HUNTER_LUNGE_ONTO_WALL 1 
			}


	//----------------------------------------------------------------------------------------------------------------------------------
	//	Climbing
	//-----------------------------------------------------------------------------------------------------------------------------------

		$animation a_Ladder_Ascend "Hunter_ClimbUp" {
			frame 0 32 
			LZ 
			align Idle_Upper_KNIFE x y z 0 0 
			fixuploop -5 5 
			loop 
			ikrule lhand touch "" 
			ikrule rhand touch "" 
		}
		
		$animation a_Ladder_Descend "Hunter_ClimbDown" {
			frame 0 35 
			LZ 
			align Idle_Upper_KNIFE x y z 0 0 
			fixuploop -5 5 
			loop 
			ikrule lhand touch "" 
			ikrule rhand touch ""
		}
		
		$animation	a_Ladder_Dismount_1	Hunter_Ladder_Dismount {
			frame 10 10 
			origin 0 -7 23 
			ikrule lhand touch "" 
			ikrule rhand touch ""  
		}
		$animation	a_Ladder_Dismount_2	Hunter_Ladder_Dismount {
			frame 30 30 
			origin 0 -7 40 
			ikrule lhand touch "" 
			ikrule rhand touch ""    
		}
		
		$animation	a_Ladder_Dismount_3	Hunter_Ladder_Dismount {
			frame 45 45 
			origin 0 -13 60 
			ikrule lhand touch "" 
			ikrule rhand touch ""    
		}
				
		$animation	a_Ladder_Dismount_4	Hunter_Ladder_Dismount {
			frame 70 70 
			alignto Idle_Upper_KNIFE 
			origin 0 0 80 
			ikrule lhand touch "" 
			ikrule rhand touch ""   
		}
		
		//Layer to allow ladder idle noise added. (See below) - Cuba
		$sequence Ladder_Ascend {
			a_Ladder_Ascend a_Ladder_Dismount_1 a_Ladder_Dismount_2 a_Ladder_Dismount_3 a_Ladder_Dismount_4
			blendwidth 5x1 blend dismount 0 1
			addlayer Flinch_back
			activity ACT_CLIMB_UP -1
			} 
		
		$sequence Ladder_Descend {
			a_Ladder_Descend a_Ladder_Dismount_1 a_Ladder_Dismount_2 a_Ladder_Dismount_3 a_Ladder_Dismount_4
			blendwidth 5x1 blend dismount 0 1
			addlayer Flinch_back
			activity ACT_CLIMB_DOWN -1
			} 


	//------------------------------------------------------------------------------------------------------------------------------------
	//
	//	Flinches
	//
	//------------------------------------------------------------------------------------------------------------------------------------
	
		$sequence Flinch_left "Hunter_Flinch_left" {
			subtract Flinch_left 25 
			delta 
			weightlist ALLUPPERBODY 
			iklock lfoot 1 0 
			iklock rfoot 1 0 
			activity ACT_FLINCH_LEFTARM 1 
		}
		
		$sequence Flinch_right "Hunter_Flinch_right" {
			subtract Flinch_right 25 
			delta 
			weightlist ALLUPPERBODY 
			iklock lfoot 1 0 
			iklock rfoot 1 0 
			activity ACT_FLINCH_RIGHTARM 1 
		}
		
		//------------------------------------------------------------
		//	Flinches adopted from boomer's generic flitches. - Cuba
		//------------------------------------------------------------
		//Locational flinches are not present in L4D2, however the generic ones are. 
		//If we take them from the boomer we can give the hunter and smoker back some of the feedback present in L4D1.
		
		$weightlist INJUREDIDLENOISE  "Valvebiped.Bip01_L_Thigh" 0.0 "Valvebiped.Bip01_R_Thigh" 0.0 "Valvebiped.bip01_Pelvis" .6 "ValveBiped.Bip01_Spine1" .4 "ValveBiped.Bip01_L_Clavicle"  0  "ValveBiped.Bip01_R_Clavicle" 0
		$weightlist PELVIS75ARMS0  "Valvebiped.Bip01_L_Thigh" 0.0 "Valvebiped.Bip01_R_Thigh" 0.0 "Valvebiped.bip01_Pelvis" .75 "ValveBiped.Bip01_L_Clavicle"  0  "ValveBiped.Bip01_R_Clavicle" 0
		
		//Keep original sequence names to avoid issues with $declaresequence.
		$sequence Flinch_stomach "NamVet_Flinch01.smd" frame 6 27 fixuploop -6 7 subtract Flinch_stomach 0 delta weightlist PELVIS100ARMS0 iklock lfoot 1 0 iklock rfoot 1 0activity ACT_TERROR_FLINCH 1 
		$sequence Flinch_chest "NamVet_Flinch01.smd" frame 6 27 fixuploop -6 7 subtract Flinch_chest 0 delta weightlist INJUREDIDLENOISE iklock lfoot 1 0 iklock rfoot 1 0 activity ACT_TERROR_FLINCH 1 
		$sequence Flinch_head "NamVet_Flinch01.smd" frame 6 27 fixuploop -6 7 subtract Flinch_head 0 delta weightlist PELVIS75ARMS0 iklock lfoot 1 0 iklock rfoot 1 0 activity ACT_TERROR_FLINCH 1
		
		//------------------
		//Ladder Idle - Cuba
		//------------------
		//All standing locational flinches will never play in game, this allows us to use the sequnce for other purposes.
		//Repurposing one of the defunct flitches we can create a layer to add idle noise to climbing ladders like survivors. Currently SI are 100% static when idle on a ladder.		
		//Sequence name will have to stay the same to avoid $declaresequence issues.
		//This being such a small addition I fully understand if its deemed unnecessary, However these sequences are just taking up space and I figure it might be work putting them to use.
		
		$sequence Flinch_back "Hunter_Idle_Standing_01" fps 40 fixuploop -15 15 loop weightlist IDLENOISE subtract Flinch_back 0 iklock lfoot 1 0 iklock rfoot 1 0 iklock lhand 1 0 iklock rhand 1 0 delta realtime
		
		$sequence Flinch_leftleg "Hunter_Flinch_left_leg" {
			subtract Flinch_leftleg 25 
			delta 
			weightlist FULLBODY 
			activity ACT_FLINCH_LEFTLEG 1 
		}
		
		$sequence Flinch_rightleg "Hunter_Flinch_right_leg" {
			subtract Flinch_rightleg 25 
			delta 
			weightlist FULLBODY 
			activity ACT_FLINCH_RIGHTLEG 1 
		}
		
		//While locational standing flitches are disabled, the hunter has his own set of animations for his pounce state.
		//This seems to have been unintentionally missed when disabling locational flitches.
		//They lack proper iklock for the hands and even with it look rather janky, Giving them a blank weightlist would disable the animation.
		//Alternatively, replacing them with a generic flinch allows this feature to continue working while looking less distracting.
		
		$sequence Flinch_Crouch_left "NamVet_Flinch01.smd" frame 6 27 fixuploop -6 7 subtract Flinch_Crouch_left 0 delta weightlist PELVIS75ARMS0 iklock lfoot 1 0 iklock rfoot 1 0 iklock lhand 1 0 iklock rhand 1 0 activity ACT_FLINCH_CROUCH_LEFT 1
		$sequence Flinch_Crouch_right "NamVet_Flinch01.smd" frame 6 27 fixuploop -6 7 subtract Flinch_Crouch_right 0 delta weightlist INJUREDIDLENOISE iklock lfoot 1 0 iklock rfoot 1 0 iklock lhand 1 0 iklock rhand 1 0 activity ACT_FLINCH_CROUCH_RIGHT 1 
		$sequence Flinch_Crouch_Center "NamVet_Flinch01.smd" frame 6 27 fixuploop -6 7 subtract Flinch_Crouch_Center 0 delta weightlist PELVIS75ARMS0 iklock lfoot 1 0 iklock rfoot 1 0 iklock lhand 1 0 iklock rhand 1 0 activity ACT_FLINCH_CROUCH_FRONT 1
		$sequence Flinch_Crouch_Back "NamVet_Flinch01.smd" frame 6 27 fixuploop -6 7 subtract Flinch_Crouch_Back 0 delta weightlist PELVIS75ARMS0 iklock lfoot 1 0 iklock rfoot 1 0 iklock lhand 1 0 iklock rhand 1 0 activity ACT_FLINCH_CROUCH_Back 1
		
		//End edits
		
//=======================================================================================================================================================
//
//		DEATHS
//
//==========================================================================================================================================================
	//----------------------------------
	//	Death Poses
	//----------------------------------

/*
		$sequence deathpose_front "CT_Stand_Death_Front" {
			fps 1 
			frame 0 6 
			activity ACT_DIE_FRONTSIDE -1
		}
		
		$sequence deathpose_back  "CT_Stand_Death_Back"  {
			fps 1 
			frame 0 6 
			activity ACT_DIE_BACKSIDE  -1
		}
		
		$sequence deathpose_right "CT_Stand_Death_Right" {
			fps 1 
			frame 0 6 
			activity ACT_DIE_RIGHTSIDE -1
		}
		
		$sequence deathpose_left  "CT_Stand_Death_Left"  {
			fps 1 
			frame 0 6 
			activity ACT_DIE_LEFTSIDE  -1
		}
		
		$sequence deathpose_crouch_front "CT_Crouch_Death_Front" {
			fps 1 
			frame 0 6 
			activity ACT_DIE_CROUCH_FRONTSIDE -1
		}
		
		$sequence deathpose_crouch_back  "CT_Crouch_Death_Back" {
			fps 1 
			frame 0 6 
			activity ACT_DIE_CROUCH_BACKSIDE  -1
		}
		
		$sequence deathpose_crouch_right "CT_Crouch_Death_Right" {
			fps 1 
			frame 0 6 
			activity ACT_DIE_CROUCH_RIGHTSIDE -1
		}
		
		$sequence deathpose_crouch_left  "CT_Crouch_Death_Left"  {
			fps 1 
			frame 0 6 
			activity ACT_DIE_CROUCH_LEFTSIDE  -1
		}
*/		
	
$popd