//Pipebomb Item Pile for L4D2 2nd Community Update, by Lt. Rocky

//Purpose: a model of several pipe bombs clumped together for The Passing footlocker, to vastly optimize map entity counts

$modelname "w_models\Weapons/itemPile_Pipebomb.mdl"

$staticprop
$mostlyopaque

$body "Body" "ItemPile_Pipebomb_Reference"

$cdmaterials models\w_models\eq_pipebomb
//$cdmaterials models\v_models\weapons\eq_molotov
$sequence idle "ItemPile_Pipebomb_Reference"
$surfaceprop "grenade"

$collisionmodel "ItemPile_Pipebomb_Phys.dmx"
{
	$mass 150
	$inertia 1
	$damping 0
	$rotdamping 0

}
