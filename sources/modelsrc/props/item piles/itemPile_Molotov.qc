//Molotov Item Pile for L4D2 2nd Community Update, by Lt. Rocky

//Purpose: a model of several molotovs clumped together for The Passing footlocker, to vastly optimize map entity counts

$modelname "w_models\Weapons/itemPile_Molotov.mdl"

$staticprop
$mostlyopaque

$body "Body" "ItemPile_Molotov_Reference"

$cdmaterials models\w_models\eq_molotov
//$cdmaterials models\v_models\weapons\eq_molotov
$sequence idle "ItemPile_Molotov_Reference"
$surfaceprop "glass"

$collisionmodel "ItemPile_Molotov_Phys.dmx"
{
	$mass 150
	$inertia 1
	$damping 0
	$rotdamping 0

}
