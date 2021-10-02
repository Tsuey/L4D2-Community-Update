//Forklift recompile for L4D2 Anniversary Update, by Lt. Rocky

//Purpose: Allowing Tanks to break the fork portion of the forklift off, for easier use as a weapon in Versus

$modelname "forklift_brokenlift.mdl"

$staticprop


$body "Body" "forklift_brokenlift.dmx"

/*
$lod 60
{
	replacemodel "forklift.smd" "forklift_lod1.smd"
	nofacial
}
$lod 100
{
	replacemodel "forklift.smd" "forklift_lod2.smd"
	nofacial
}
*/

$surfaceprop "metalvehicle"

$contents "solid"

$illumposition -0.005 -0.053 48.333
//$illumposition -47 0 36

$cdmaterials "models\props\cs_assault\"

$cbox 0 0 0 0 0 0

$bbox -30.666 -84.247 -2.203 30.417 83.571 98.828

$definebone "static_prop" "" 0 0 0 0 0 0 0 0 0 0 0 0


$sequence "idle" "forklift_brokenlift" activity "act_idle" 1

$collisionmodel "forklift_brokenlift_physics.dmx"
{
	$mass 800
	$inertia 1
	$damping 0
	$rotdamping 0
	//$rootbone " "
	$concave
	$maxconvexpieces 20
	//$masscenter 47 0 36
	$masscenter -47 0 40
}

$KeyValues
{
	prop_data 
	{
		"base" "Metal.Large"
		"allowstatic" "1"
	}
}

//$attachment "attach_camera" "static_prop" -47 0 30 rotate 0 0 0
