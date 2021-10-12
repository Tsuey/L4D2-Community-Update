//Adrenaline Item Pile for L4D2 2nd Community Update, by Lt. Rocky

//Purpose: a model of several adrenaline needles clumped together for The Passing footlocker, to vastly optimize map entity counts

$modelname "w_models\Weapons\ItemPile_Adrenaline_Reference.mdl"

$staticprop
$mostlyopaque

$body "Body" "ItemPile_Adrenaline_Reference"

$cdmaterials models/v_models/Weapons/eq_adrenaline

$sequence idle "ItemPile_Adrenaline_Reference"
$surfaceprop "plastic"

$collisionmodel "ItemPile_Adrenaline_Phys.dmx"
{
	$mass 150
	$inertia 1
	$damping 0
	$rotdamping 0

}
