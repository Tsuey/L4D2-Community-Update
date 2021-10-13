// Created by Crowbar 0.71

$modelname "props_urban/Fence002_128_Breakable_Base.mdl"

$body studio "Fence002_128_Breakable_Base_REF.smd"

$staticprop
$surfaceprop "chainlink"
$contents "grate"
$cdmaterials "models\props_urban\"


$sequence "ref" "Fence002_128_Breakable_Base_REF.smd"

$collisionmodel "fence002_128_breakable_base_physics.smd"
{
	$mass 24.32086
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
		"base"		"Metal.MediumClient"
		"allowstatic"		"1"
	}
}
