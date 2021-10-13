//Metal Desk prop for community fix update, by Lt. Rocky & Salad

//Purpose: Adjusting the collision model with a new, more accurate concave mesh to allow items placed under it to be picked up

$modelname "props_interiors\desk_metal.mdl"

$staticprop

$body "Body" "desk_metal.smd"


$surfaceprop "metalpanel"
$contents "solid"
//$illumposition 0 0.062 16.132
$cdmaterials "models\props_interiors\"
//$cbox 0 0 0 0 0 0
//$bbox -17.111 -39.61 -0.002 16.844 39.619 33.305
//$definebone "static_prop" "" 0 0 0 0 0 0 0 0 0 0 0 0


$sequence "idle" "desk_metal.smd" activity "act_idle" 1

$collisionmodel "desk_metal_physics_new.dmx"
{
	$mass 300
	$concave
	//$maxconvexpieces 10
}
