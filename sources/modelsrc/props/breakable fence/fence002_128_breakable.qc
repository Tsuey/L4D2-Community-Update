// Broken fence model #2 for L4D2 community fixes update, by Lt. Rocky

//Purpose: fixing a duo of propdata syntax errors that prevented the model from correctly breaking when destroyed

$modelname "props_urban/fence002_128_Breakable.mdl"

$body studio "fence002_128_REF.smd"

$staticprop
$surfaceprop "chainlink"
$contents "grate"
$cdmaterials "models\props_urban\"

$sequence "ref" "fence002_128_REF.smd"

$collisionmodel "fence002_128_breakable_physics.smd"
{
	$mass 358.868
	$inertia 1
	$damping 0
	$rotdamping 0
//	$rootbone " "
	$concave
	$maxconvexpieces 3

}

$keyvalues
{
	prop_data 
	{
		"base"		"Metal.break2"
		"dmg.bullets"		"0"
		"dmg.fire"		"0"
		"dmg.club"		".35"
		"dmg.explosive"		"1"
		"allowstatic"		"1"
		"health" "50"
		"multiplayer_break"		"both"
	}
}

$collisiontext
{
	break 
	{
		"model"		"props_urban/Fence002_128_Breakable_Base.mdl"
		"dmg.bullets"		"0"
		"dmg.club"		"0"
		"motiondisabled"		"1"
		"debris"		"0"
		"fadetime"		"0"
		//"multiplayer_break"		"server"
	}
	
 	break 
	{
		"model"		"props_urban\Fence002_128_Breakable_Part01.mdl"
		"health"		"50"
		"fadetime"		"20"
		//"multiplayer_break"		"server"
	}
	break 
	{
		"model"		"props_urban\Fence002_128_Breakable_Part02.mdl"
		"health"		"50"
		"fadetime"		"20"
		//"multiplayer_break"		"server"
	}
	break 
	{
		"model"		"props_urban\Fence002_128_Breakable_Part03.mdl"
		"health"		"50"
		"fadetime"		"20"
		//"multiplayer_break"		"server"
	}
	break 
	{
		"model"		"props_urban\Fence002_128_Breakable_Part04.mdl"
		"health"		"50"
		"fadetime"		"20"
		//"multiplayer_break"		"server"
	}
	break 
	{
		"model"		"props_urban\Fence002_128_Breakable_Part05.mdl"
		"health"		"50"
		"fadetime"		"20"
		//"multiplayer_break"		"server"
	}
	break 
	{
		"model"		"props_urban\Fence002_128_Breakable_Part06.mdl"
		"health"		"50"
		"fadetime"		"20"
		//"multiplayer_break"		"server"
	}
	break 
	{
		"model"		"props_urban\Fence002_128_Breakable_Part07.mdl"
		"health"		"50"
		"fadetime"		"20"
		//"multiplayer_break"		"server"
	}
	break 
	{
		"model"		"props_urban\Fence002_128_Breakable_Part08.mdl"
		"health"		"50"
		"fadetime"		"20"
		//"multiplayer_break"		"server"
	}
	break 
	{
		"model"		"props_urban\Fence002_128_Breakable_Part09.mdl"
		"health"		"50"
		"fadetime"		"20"
		//"multiplayer_break"		"server"
	}
	
}
