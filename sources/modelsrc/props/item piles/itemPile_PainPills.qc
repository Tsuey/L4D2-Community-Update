//Pain Pill Item Pile for L4D2 2nd Community Update, by Lt. Rocky

//Purpose: a model of several pain pills clumped together for The Passing footlocker, to vastly optimize map entity counts

$modelname "w_models\Weapons/itemPile_PainPills.mdl"

$staticprop
$mostlyopaque

$body "Body" "ItemPile_PainPills_Reference"

$cdmaterials models\w_models\eq_painpills

$sequence idle "ItemPile_PainPills_Reference"
$surfaceprop "plastic"

$collisionmodel "ItemPile_PainPills_Phys.dmx"
{
	$mass 150
	$inertia 1
	$damping 0
	$rotdamping 0

}
