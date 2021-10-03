//Forklift recompile for L4D2 Anniversary Update, by Lt. Rocky

//Purpose: Allowing Tanks to break the fork portion of the forklift off, for easier use as a weapon in Versus

$modelname "props\cs_assault\forklift_brokenfork.mdl"

$staticprop
 
$body "Body" "forklift_brokenfork"

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
$cdmaterials "models\props\cs_assault\"
$cbox 0 0 0 0 0 0
$bbox -30.666 -84.247 -2.203 30.417 83.571 98.828
$definebone "static_prop" "" 0 0 0 0 0 0 0 0 0 0 0 0


$sequence "idle" "forklift_brokenfork" activity "act_idle" 1

$collisionmodel "forklift_brokenfork_physics.dmx"
{
	$mass 400
	$inertia 1
	$damping 0
	$rotdamping 0
	//$rootbone " "
	$concave
	$maxconvexpieces 20
}

$KeyValues
{
	prop_data 
	{
		"base" "Metal.Large"
		"dmg.bullets" "0"
		"dmg.fire" "0"
		"dmg.club" "2"
		"dmg.explosive" "1"
		"allowstatic" "1"
		"health" "100"
		"multiplayer_break" "both"
	}
}

$collisiontext
{
	break 
	{
		"model" "props\cs_assault\forklift_brokenfork1.mdl"
		"fadetime" "80"
		"burst" 	"50"
	}
	break 
	{
		"model" "props\cs_assault\forklift_brokenfork2.mdl"
		"fadetime" "80"
		"burst" 	"50"
	}
	break 
	{
		"model" "props\cs_assault\forklift_brokenfork3.mdl"
		"fadetime" "80"
		"burst" 	"50"
	}
	break 
	{
		"model" "props\cs_assault\forklift_brokenfork4.mdl"
		"fadetime" "80"
		"burst" 	"50"
	}
	break 
	{
		"model" "props\cs_assault\forklift_brokenfork5.mdl"
		"fadetime" "80"
		"burst" 	"50"
	}
	break 
	{
		"model" "props\cs_assault\forklift_brokenfork6.mdl"
		"fadetime" "80"
		"burst" 	"50"
	}
	break 
	{
		"model" "props\cs_assault\forklift_brokenfork7.mdl"
		"fadetime" "80"
		"burst" 	"50"
	}
}