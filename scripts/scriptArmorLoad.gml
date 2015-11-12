// argument0 = Which Armor?
var a, b;

a = argument0;
b = instance_create(x, y, objectArmor);

with b
{ArmType = ds_grid_get(global.ArmorList, 0, a); // Armor Type
 ArmTL = ds_grid_get(global.ArmorList, 1, a); // Tech Level
 ArmName = ds_grid_get(global.ArmorList, 2, a); // Armor Name
 ArmLocations = ds_grid_get(global.ArmorList, 3, a); // Damage Locations
 MaxDR = ds_grid_get(global.ArmorList, 4, a); // High DR
 MaxLowDR = ds_grid_get(global.ArmorList, 5, a); // Low DR
 ArmDmgTypes = ds_grid_get(global.ArmorList, 6, a); // // Damage types High DR is effective against
 ArmFlexible = ds_grid_get(global.ArmorList, 7, a); // Flexible?
 Weight = ds_grid_get(global.ArmorList, 8, a); // Weight
 Price = ds_grid_get(global.ArmorList, 9, a); // Price
 LC = ds_grid_get(global.ArmorList, 10, a); // Legality
 DR = MaxDR;
 LowDR = MaxLowDR;
 ArmDamageRatio = MaxDR / MaxLowDR;}

show_debug_message("Equipping " + b.ArmName + "...");

return b;

/*damage locations
ALL
 head
  skull
  eyes
  face
FULL
 suit
  body
   neck
   torso
    front
    back
   groin
  limbs
   arms
   * hands if FULL
   legs
   * feet if FULL*/
