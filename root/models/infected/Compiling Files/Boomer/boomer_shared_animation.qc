
$animblocksize 32

$modelname infected/anim_boomer.mdl
$include "QCIs/boomer_bones.qci"
$include "QCIs/boomer_hitbox.qci"
$include "QCIs/boomer_ruleshierarchy.qci"
$pushd "DMX/animation"
$lockbonelengths
$cmdlist IK_to_BBox ikrule lfoot touch "" ikrule rfoot touch ""

//================================================================================================================
//
//	IDLES
//
//==============================================================================================================

		$sequence Idle_Upper_KNIFE "Boomer_Idle_Standing" {
			fixuploop -15 15 
			loop 
			fadein 0.5 fadeout 0.5 
			addlayer Boomer_AimMatrix_Idle_Standing 
			cmdlist IK_to_BBox 
			activity ACT_IDLE -1
		}
		
		$sequence Idle_Standing "Boomer_Idle_Standing" {
			loop 
			cmdlist IK_to_BBox
		}
		
		$sequence Crouch_Idle_Upper_KNIFE "Boomer_Idle_Crouching" {
			fixuploop -15 15 
			loop 
			fadein 1 fadeout 0.5 
			addlayer Boomer_AimMatrix_Idle_Crouching 
			cmdlist IK_to_BBox 
			activity ACT_CROUCHIDLE -1
		}
		
		$sequence BoomerVar_squat "BoomerVar_squat" {
			frame 1 25 
			fadein 1 
			activity ACT_TERROR_CROUCH_LEAKER -1
		}
		
		$sequence BoomerVar_squat_idle "BoomerVar_squat" {
			frame 24 25 
			activity ACT_TERROR_CROUCHIDLE_LEAKER -1
		}


//==================================================================================================================================
//
//	MOVEMENT
//
//==================================================================================================================================
	//------------------------------------------------------
	//	Run
	//----------------------------------------------------------------

		$animation a_RunS		Boomer_RunS	{
			fps 32.49 
			frame 0 36 
			startloop 14 
			fixuploop -4 4 
			LX LY 
			loop 
			alignto Idle_Standing 
			rotateto -180 
			cmdlist IK_to_BBox
		}
		
		$animation a_RunSE	Boomer_RunSE {
			fps 32.49 
			frame 0 36 
			startloop 14 
			fixuploop -4 4 
			LX LY 
			loop 
			alignto Idle_Standing 
			rotateto -135 
			cmdlist IK_to_BBox
		}
		
		$animation a_RunE		Boomer_RunE		{
			startloop 14  
			fixuploop -4 4 
			LX LY 
			loop 
			alignto Idle_Standing 
			rotateto -90 
			cmdlist IK_to_BBox
		}
		
		$animation a_RunNE	Boomer_RunNE {	
			startloop 14  
			fixuploop -4 4 
			LX LY 
			loop 
			alignto Idle_Standing 
			rotateto -45 
			cmdlist IK_to_BBox
		}
		
		$animation a_RunN		Boomer_RunN	{
			startloop 14  
			fixuploop -4 4 
			LX LY 
			loop 
			alignto Idle_Standing 
			rotateto 0 
			cmdlist IK_to_BBox
		}
		
		$animation a_RunNW	Boomer_RunNW {
			startloop 14  
			fixuploop -4 4 
			LX LY 
			loop 
			alignto Idle_Standing 
			rotateto 45 
			cmdlist IK_to_BBox
		}
		
		$animation a_RunW		Boomer_RunW {
			startloop 14  
			fixuploop -4 4 
			LX LY 
			loop 
			alignto Idle_Standing 
			rotateto 90 
			cmdlist IK_to_BBox
		}
		
		$animation a_RunSW	Boomer_RunSW {
			fps 32.49 
			frame 0 36 
			startloop 14 
			fixuploop -4 4 
			LX LY 
			loop 
			alignto Idle_Standing 
			rotateto 135 
			cmdlist IK_to_BBox
		}
		
		$animation a_RunZero "Boomer_Idle_Standing" {
			frame 0 0 
			numframes 60 
			loop 
			cmdlist IK_to_BBox
		}
		
		$animation a_RunN_Leaker		RunN_Leaker	{
			startloop 14  
			fixuploop -4 4 
			LX LY 
			loop 
			alignto Idle_Standing 
			rotateto 0 
			cmdlist IK_to_BBox
		}
		
		$sequence Run_Upper_KNIFE {
			a_RunNW a_RunN a_RunNE 
			a_RunW a_RunZero a_RunE 
			a_RunSW a_RunS a_RunSE 
			blendwidth 3 blend move_y -1 1 blend move_x 1 -1 loop
			addlayer Boomer_AimMatrix_Idle_Standing 
			fadein 0.2 fadeout 0.5 
			ACT_RUN -1
			{ event AE_FOOTSTEP_RIGHT 4 }
			{ event AE_FOOTSTEP_LEFT 14 }
			{ event AE_FOOTSTEP_RIGHT 23 }
			{ event AE_FOOTSTEP_LEFT 34 }
		}
		
		$sequence Run_Upper_KNIFE_Leaker {
			a_RunNW a_RunN_Leaker a_RunNE 
			a_RunW a_RunZero a_RunE 
			a_RunSW a_RunS a_RunSE 
			blendwidth 3 blend move_y -1 1 blend move_x 1 -1 loop
			addlayer Boomer_AimMatrix_Idle_Standing 
			fadein 0.2 fadeout 0.5 
			ACT_TERROR_RUN_LEAKER -1
			{ event AE_FOOTSTEP_RIGHT 4 }
			{ event AE_FOOTSTEP_LEFT 14 }
			{ event AE_FOOTSTEP_RIGHT 23 }
			{ event AE_FOOTSTEP_LEFT 34 }
		}

	//------------------------------------------
	//	Walk
	//------------------------------------------


	//=======================================================
	//
	//	S Move Macro without IK (for anims with unique South)
	//
	//=======================================================

		$definemacro SMoveNoIKMacro sequencename move NorthFilename N_fps N_loopstart N_lastframe SouthFilename S_fps S_loopstart S_lastframe NW_fps NW_loopstart NW_lastframe SW_fps SW_loopstart SW_lastframe fixloop ZeroMove Z_firstframe Z_lastframe Z_numframes align BN_loopstart BN_weight SouthBlend BS_loopstart BS_lastframe BS_weight aimlayer activity event1 event2 Rfoot Lfoot Rfoot2 Lfoot2 fadein fadeout \\
		$animation a_$sequencename$N		$NorthFilename$	   fps $N_fps$  startloop $N_loopstart$  frame 0 $N_lastframe$  fixuploop -$fixloop$ $fixloop$ LX LY loop alignto Idle_Standing rotateto    0 cmdlist IK_to_BBox \\
		$animation a_$sequencename$S		$SouthFilename$		 fps $S_fps$  startloop $S_loopstart$  frame 0 $S_lastframe$  fixuploop -$fixloop$ $fixloop$ LX LY loop alignto Idle_Standing rotateto -180 cmdlist IK_to_BBox \\
		$popd \\
		$pushd "DMX/animation" \\
		$animation a_$sequencename$SE		NamVet_$move$SE_Rifle	 fps $SW_fps$ startloop $SW_loopstart$ frame 0 $SW_lastframe$ fixuploop -$fixloop$ $fixloop$ LX LY loop alignto Idle_Standing rotateto -135 weightlist $BS_weight$ worldspaceblendloop a_$sequencename$S 0 weightlist FULLBODY cmdlist IK_to_BBox \\
		$animation a_$sequencename$E		NamVet_$move$E_Rifle	 fps $NW_fps$ startloop $NW_loopstart$ frame 0 $NW_lastframe$ fixuploop -$fixloop$ $fixloop$ LX LY loop alignto Idle_Standing rotateto  -90 weightlist $BN_weight$ worldspaceblendloop a_$sequencename$N 0 weightlist FULLBODY cmdlist IK_to_BBox \\
		$animation a_$sequencename$NE		NamVet_$move$NE_Rifle	 fps $NW_fps$ startloop $NW_loopstart$ frame 0 $NW_lastframe$ fixuploop -$fixloop$ $fixloop$ LX LY loop alignto Idle_Standing rotateto  -45 weightlist $BN_weight$ worldspaceblendloop a_$sequencename$N 0 weightlist FULLBODY cmdlist IK_to_BBox \\
		$animation a_$sequencename$NW		NamVet_$move$NW_Rifle	 fps $NW_fps$ startloop $NW_loopstart$ frame 0 $NW_lastframe$ fixuploop -$fixloop$ $fixloop$ LX LY loop alignto Idle_Standing rotateto   45 weightlist $BN_weight$ worldspaceblendloop a_$sequencename$N 0 weightlist FULLBODY cmdlist IK_to_BBox \\
		$animation a_$sequencename$W		NamVet_$move$W_Rifle	 fps $NW_fps$ startloop $NW_loopstart$ frame 0 $NW_lastframe$ fixuploop -$fixloop$ $fixloop$ LX LY loop alignto Idle_Standing rotateto   90 weightlist $BN_weight$ worldspaceblendloop a_$sequencename$N 0 weightlist FULLBODY cmdlist IK_to_BBox \\
		$animation a_$sequencename$SW		NamVet_$move$SW_Rifle	 fps $SW_fps$ startloop $SW_loopstart$ frame 0 $SW_lastframe$ fixuploop -$fixloop$ $fixloop$ LX LY loop alignto Idle_Standing rotateto  135 weightlist $BS_weight$ worldspaceblendloop a_$sequencename$S 0 weightlist FULLBODY cmdlist IK_to_BBox \\
		$popd \\
		$pushd "DMX/animation" \\
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


	//$MoveMacro	 			(sequence name) 			(motion) 		(North Filename) 		(N fps,start,last) (South Filename) 	(S fps,start,last) (NW fps,start,last) (SW fps,start,last) (fixloop) 				(Zero Move) 					(Z range, numframes, 	align) 					(N Blend start, 		weight) 		(South Blend, 					start, end) 	(S Blend weight)						(aim matrix) 							(ACT)	 		(events) 			(R foot,	 		L foot)		(Fade in/out)
	$SMoveNoIKMacro			Walk_Upper_Knife				Walk				Boomer_WalkN 					38 	10 	71			 Boomer_WalkS				38 	   0    50			30 	   19 	58			30 	   9     56	     5	    	Boomer_Idle_Standing					0 				0  			80							Idle_Upper_KNIFE			0				SPINEBLEND	Boomer_WalkN		41  51				SPINEBLEND			Boomer_AimMatrix_Idle_Standing			 WALK			7002 4002			  8 26     			43 58				.5 .5


	//-----------------------
	//	Crouch_Walk
	//-----------------------

		//$MoveMacro	 				(sequence name) 				(motion) 		(North Filename) 				(N fps,start,last) 		(South Filename) 			(S fps,start,last) (NW fps,start,last) (SW fps,start,last) (fixloop) 				(Zero Move) 					(Z range, 	numframes, 			align) 						(N Blend start, 		weight) 				(South Blend, 					start, end) 	(S Blend weight)							(aim matrix) 								(ACT)	 					(events) 			(R foot,	 		L foot)		(Fade in/out)
	$SMoveNoIKMacro			Crouch_Walk_Upper_KNIFE		 CrouchWalk		Boomer_CrouchWalkN 				30	  11 	  55			Boomer_CrouchWalkS			30	   6   46	     21.78	 23 	55		19.84	  20    49	     5	    	Boomer_Idle_Crouching					0 				0  75			Idle_Upper_KNIFE						0						SPINEBLEND			Boomer_CrouchWalkN					3 		62				SPINEBLEND				Boomer_AimMatrix_Idle_Standing		RUN_CROUCH				7002 4002				6 18 				 33 45				.75 .5




//============================================================================================================================================================================================
//
//		AIM MATRICES
//
//============================================================================================================================================================================================

	//-------------------------------------------
	//	Aim Macro
	//------------------------------------------

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

	//-----------------------------------------------------------
	//	Aims
	//-----------------------------------------------------------

	//	$AimMacro (smd file name)

		$AimMacro Boomer_AimMatrix_Idle_Standing
		$AimMacro Boomer_AimMatrix_Melee

	//-----------------------------------------------------------
	//	CrouchAim Macro
	//-----------------------------------------------------------

		$definemacro CrouchAimMacro sequencename filename \\
		$sequence $sequencename$ { \\
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

		$CrouchAimMacro Boomer_AimMatrix_Idle_Crouching Boomer_AimMatrix_Idle_Standing

//====================================================
//
//		ATTACKS
//
//====================================================

	//------------------
	//	Melee Attack
	//------------------
		
		$sequence Melee "Boomer_Melee" {
			alignto Idle_Standing 
			hidden
		}
		
		$definemacro MeleeMacro num start end b1 b2 b3 b4 hit \\
		$sequence Melee_$num$_Delta 	"Boomer_Melee" 	frame $start$ $end$ alignto Melee_$num$_Delta weightlist MELEE_DELTA subtract Melee 0 iklock lfoot 1 0 iklock rfoot 1 0 delta  hidden \\
		$sequence Melee_$num$_Layer	"Boomer_Melee"	frame $start$ $end$ weightlist MELEE_NORM addlayer Melee_$num$_Delta x y z hidden \\
		$sequence Melee_$num$		"Boomer_Melee" 	fps 35 weightlist NONE numframes $b4$ blendlayer Melee_$num$_Layer $b1$ $b2$ $b3$ $b4$ spline blendlayer Boomer_AimMatrix_Melee $b1$ $b2$ $b3$ $b4$ spline activity ACT_TERROR_ATTACK 1  { \\
			{ event AE_ATTACK_HIT $hit$ } \\
		} \\
		
		//MeleeMacro 	(melee) 	(start,	end)  	(blend frames) 
		$MeleeMacro 	01 					15 		 50  			0 7 20 35		12
		$MeleeMacro 	02 					45 		 85 			0 8 25 40		20
		$MeleeMacro 	03 					130 	180 			0 10 35 50		19

		
		$sequence Run_Shoot_KNIFE		"Boomer_Melee" {
			fps 35 
			weightlist NONE 
			numframes 35 
			blendlayer Melee_01_Layer 0 7 25 35 spline 
			blendlayer Boomer_AimMatrix_Melee 0 7 25 35 spline
		}
		
		$sequence Walk_Shoot_KNIFE		"Boomer_Melee" {
			fps 35 
			weightlist NONE 
			numframes 35 
			blendlayer Melee_01_Layer 0 7 25 35 spline 
			blendlayer Boomer_AimMatrix_Melee 0 7 25 35 spline 
		}
		
		$sequence Idle_Shoot_KNIFE		"Boomer_Melee" {
			fps 35 
			weightlist NONE 
			numframes 35 
			blendlayer Melee_01_Layer 0 7 25 35 spline 
			blendlayer Boomer_AimMatrix_Melee 0 7 25 35 spline 
		}
		
		$sequence Crouch_Idle_Shoot_KNIFE	"Boomer_Melee" {
			fps 35 
			weightlist NONE 
			numframes 35 
			blendlayer Melee_01_Layer 0 7 25 35 spline 
			blendlayer Boomer_AimMatrix_Melee 0 7 25 35 spline 
		}
		
		$sequence Crouch_Walk_Shoot_KNIFE	"Boomer_Melee" {
			fps 35 
			weightlist NONE 
			numframes 35 
			blendlayer Melee_01_Layer 0 7 25 35 spline 
			blendlayer Boomer_AimMatrix_Melee 0 7 25 35 spline 
		}
		
		
	//-------------------------------------------------------
	//	Vomit Attack
	//-------------------------------------------------------

		$animation a_Vomit "Boomer_Vomit" {
			subtract Idle_Standing 25 
			frame 7 87 
			fixuploop -40 10
		}
		
		$sequence Vomit_Attack "a_vomit" {
			alignto Idle_Standing 
			fadein .2 fadeout 1.2 
			iklock lfoot 1 0 
			iklock rfoot 1 0 
			delta 
			activity ACT_SECONDARYATTACK -1 
			event AE_ATTACK_HIT 10 
			event AE_ATTACK_END 40 
		}


//=====================================================================================================
//
//		OTHER
//
//=====================================================================================================

	//--------------------------
	//	Shoved
	//--------------------------

		//Missing footstep action events added to all stumbles. - Cuba
		$sequence Shoved_Backward_01 "Boomer_Shoved_backward_01" {
			frame 6 90 
			fadein .1 fadeout .5 
			alignto Idle_Upper_KNIFE 
			activity ACT_TERROR_SHOVED_BACKWARD 1  
			walkframe 50 lx ly
			walkframe 73 lx ly
			walkalignto 84 Idle_Upper_KNIFE lx ly
			{ event AE_FOOTSTEP_RIGHT 12 } { event AE_FOOTSTEP_RIGHT 28 } { event AE_FOOTSTEP_RIGHT 43 } { event AE_FOOTSTEP_RIGHT 65 }
			{ event AE_FOOTSTEP_LEFT 5 } { event AE_FOOTSTEP_LEFT 20 }  { event AE_FOOTSTEP_LEFT 36 }  { event AE_FOOTSTEP_LEFT 53 }
		}
			
		$sequence Shoved_Forward "Boomer_Shoved_Forward" {
			frame 7 84 
			fadein .1 fadeout .5 
			alignto Idle_Upper_KNIFE 
			activity ACT_TERROR_SHOVED_FORWARD 1   
			walkframe 30 lx ly
			walkframe 60 lx ly
			walkalignto 77 Idle_Upper_KNIFE lx ly
			{ event AE_FOOTSTEP_RIGHT 17 } { event AE_FOOTSTEP_RIGHT 37 } { event AE_FOOTSTEP_RIGHT 58 } { event AE_FOOTSTEP_RIGHT 77 } 
			{ event AE_FOOTSTEP_LEFT 8 } { event AE_FOOTSTEP_LEFT 27 }  { event AE_FOOTSTEP_LEFT 48 }  { event AE_FOOTSTEP_LEFT 69 }
		}
			
		$sequence Shoved_Leftward "Boomer_Shoved_Leftward" {
			frame 3 107 
			fadein .1 fadeout .5 
			alignto Idle_Upper_KNIFE 
			activity ACT_TERROR_SHOVED_LEFTWARD 1   
			walkframe 31 lx ly
			walkframe 42 lx ly
			walkframe 56 lx ly
			walkalignto 104 Idle_Upper_KNIFE lx ly
			{ event AE_FOOTSTEP_RIGHT 14 } { event AE_FOOTSTEP_RIGHT 30 } { event AE_FOOTSTEP_RIGHT 51 } { event AE_FOOTSTEP_RIGHT 71 }
			{ event AE_FOOTSTEP_LEFT 20 } { event AE_FOOTSTEP_LEFT 40 }  { event AE_FOOTSTEP_LEFT 61 } 
		}
			
		$sequence Shoved_Rightward "Boomer_Shoved_Rightward" {
			frame 4 106 
			fadein .1 fadeout .5 
			alignto Idle_Upper_KNIFE 
			activity ACT_TERROR_SHOVED_RIGHTWARD 1   
			walkframe 50 lx ly
			walkframe 68 lx ly
			walkalignto 102 Idle_Upper_KNIFE lx ly
			{ event AE_FOOTSTEP_RIGHT 24 } { event AE_FOOTSTEP_RIGHT 44 } { event AE_FOOTSTEP_RIGHT 65 } { event AE_FOOTSTEP_RIGHT 93 }
			{ event AE_FOOTSTEP_LEFT 17 } { event AE_FOOTSTEP_LEFT 35 }  { event AE_FOOTSTEP_LEFT 54 }  { event AE_FOOTSTEP_LEFT 80 }
		}
		
		
	//------------------------------------
	//	Jump
	//------------------------------------

		$sequence Jump "Boomer_Jump" {
			z 
			frame 4 56 
			fadein 0.1 fadeout 0.3 
			alignto Idle_Standing 
			addlayer Boomer_AimMatrix_Idle_Standing 
			activity ACT_JUMP -1 
			event AE_FOOTSTEP_RIGHT 0 
			event AE_FOOTSTEP_LEFT 0 
		}


	//------------------------------------
	//	Climbing
	//------------------------------------

		$animation a_Ladder_Ascend "Boomer_ClimbUp" {
			frame 0 32 
			LZ 
			align Idle_Standing x y z 0 0 
			fixuploop -5 5 
			loop 
			ikrule lhand touch "" 
			ikrule rhand touch ""
		}
		
		$animation a_Ladder_Descend "Boomer_ClimbDown" {
			frame 0 35 
			LZ 
			align Idle_Standing x y z 0 0 
			fixuploop -5 5 
			loop 
			ikrule lhand touch "" 
			ikrule rhand touch ""
		}
		
		$animation	a_Ladder_Dismount_1	Boomer_Ladder_Dismount {
			frame 10 10 
			origin 0 -7 23 
			ikrule lhand touch "" 
			ikrule rhand touch ""  
		}
		
		$animation	a_Ladder_Dismount_2	Boomer_Ladder_Dismount {
			frame 30 30 
			origin 0 -7 40 
			ikrule lhand touch "" 
			ikrule rhand touch ""    
		}
		
		$animation	a_Ladder_Dismount_3	Boomer_Ladder_Dismount {
			frame 45 45 
			origin 0 -13 60 
			ikrule lhand touch "" 
			ikrule rhand touch ""    
		}
		
		$animation	a_Ladder_Dismount_4	Boomer_Ladder_Dismount {
			frame 70 70 
			alignto Idle_Standing 
			origin 0 0 80 
			ikrule lhand touch "" 
			ikrule rhand touch ""   
		}
		
		$sequence Ladder_Ascend {
			a_Ladder_Ascend a_Ladder_Dismount_1 a_Ladder_Dismount_2 a_Ladder_Dismount_3 a_Ladder_Dismount_4
			blendwidth 5x1 blend dismount 0 1
			activity ACT_CLIMB_UP -1
			} 
		
		$sequence Ladder_Descend {
			a_Ladder_Descend a_Ladder_Dismount_1 a_Ladder_Dismount_2 a_Ladder_Dismount_3 a_Ladder_Dismount_4
			blendwidth 5x1 blend dismount 0 1
			activity ACT_CLIMB_DOWN -1
			} 
		
		
			
	//-------------------------------------------------
	//	Flinches
	//-------------------------------------------------
		//Nick: possibly move these to a common file
		// temp from survivors for getting hooked up
		$weightlist INJUREDIDLENOISE  "Valvebiped.Bip01_L_Thigh" 0.0 "Valvebiped.Bip01_R_Thigh" 0.0 "Valvebiped.bip01_Pelvis" .6 "ValveBiped.Bip01_Spine1" .4 "ValveBiped.Bip01_L_Clavicle"  0  "ValveBiped.Bip01_R_Clavicle" 0
		$weightlist CALMIDLENOISE 		"Valvebiped.Bip01_L_Thigh" 0.0 "Valvebiped.Bip01_R_Thigh" 0.0 "Valvebiped.bip01_Pelvis" .4 "ValveBiped.Bip01_Spine1" .2 "ValveBiped.Bip01_L_Clavicle"  0  "ValveBiped.Bip01_R_Clavicle" 0 "ValveBiped.Bip01_Neck1" 0.1
		$weightlist CALMIDLENOISEPISTOL	"Valvebiped.Bip01_L_Thigh" 0.0 "Valvebiped.Bip01_R_Thigh" 0.0 "Valvebiped.bip01_Pelvis" .4 "ValveBiped.Bip01_Spine1" .2 "ValveBiped.Bip01_Neck1" 0.1 
		$weightlist PELVIS75ARMS0  "Valvebiped.Bip01_L_Thigh" 0.0 "Valvebiped.Bip01_R_Thigh" 0.0 "Valvebiped.bip01_Pelvis" .75 "ValveBiped.Bip01_L_Clavicle"  0  "ValveBiped.Bip01_R_Clavicle" 0

		$sequence Flinch_01 "NamVet_Flinch01.smd" frame 6 27 fixuploop -6 7 subtract Flinch_01 0 delta weightlist PELVIS100ARMS0 iklock lfoot 1 0 iklock rfoot 1 0 activity ACT_TERROR_FLINCH 1 
		$sequence Flinch_02 "NamVet_Flinch01.smd" frame 6 27 fixuploop -6 7 subtract Flinch_02 0 delta weightlist INJUREDIDLENOISE iklock lfoot 1 0 iklock rfoot 1 0 activity ACT_TERROR_FLINCH 1 
		$sequence Flinch_03 "NamVet_Flinch01.smd" frame 6 27 fixuploop -6 7 subtract Flinch_03 0 delta weightlist PELVIS75ARMS0 iklock lfoot 1 0 iklock rfoot 1 0 activity ACT_TERROR_FLINCH 1 



//================================================================================================================
//
//	Death Poses
//
//================================================================================================================
	//------------------
	//Ladder Idle - Cuba
	//------------------
	//Since the boomer explodes when shoot the ACT_DIE_ activities are rendered somewhat obsolete.
	//Repurposing one of these we can create a layer to add idle noise to climbing ladders like survivors. Currently SI are 100% static when idle on a ladder.		
	//Sequence name will have to stay the same to avoid $declaresequence issues.
	//This being such a small addition I fully understand if its deemed unnecessary, However these sequences are just taking up space and I figure it might be work putting them to use.

	$sequence deathpose_front "Boomer_Idle_Standing" fps 40 fixuploop -15 15 loop weightlist IDLENOISE subtract deathpose_front 0 iklock lfoot 1 0 iklock rfoot 1 0 iklock lhand 1 0 iklock rhand 1 0 delta realtime
	
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
	
	$sequence deathpose_crouch_left  "CT_Crouch_Death_Left" {
		fps 1 
		frame 0 6 
		activity ACT_DIE_CROUCH_LEFTSIDE  -1
	}
	
	
$popd