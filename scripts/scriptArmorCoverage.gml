ArmType = ds_grid_get(global.ArmorList, 0, a); // Armor Type
ArmTL = ds_grid_get(global.ArmorList, 1, a); // Tech Level
ArmName = ds_grid_get(global.ArmorList, 2, a); // Armor Name
ArmLocations = ds_grid_get(global.ArmorList, 3, a); // Damage Locations
MaxDR = ds_grid_get(global.ArmorList, 4, a); // High DR
MaxLowDR = ds_grid_get(global.ArmorList, 5, a); // Low DR
ArmDmgTypes = ds_grid_get(global.ArmorList, 6, a); // // Damage types High DR is effective against
ArmFlexible = ds_grid_get(global.ArmorList, 7, a); // Flexible?
ArmWeight = ds_grid_get(global.ArmorList, 8, a); // Weight
ArmPrice = ds_grid_get(global.ArmorList, 9, a); // Price
ArmLC = ds_grid_get(global.ArmorList, 10, a); // Legality

// argument0 = Character wearing Armor
// argument1 = Piece of Armor

var a, b, c, ALL, head, skull, eyes, face, FULL, suit, body, neck, torso, front, back, groin, limbs, arms, hands, legs, feet;
c = argument0;
a = argument1;
b = a.ArmLocations;

if string_count("ALL", b) > 0 {ALL = true;}
if string_count("head", b) > 0 or ALL {head = true;}
if string_count("skull", b) > 0 or head {skull = true;}
if string_count("eyes", b) > 0 or head {eyes = true;}
if string_count("face", b) > 0 or head {face = true;}
if string_count("FULL", b) > 0 or ALL {FULL = true;}
if string_count("suit", b) > 0 or FULL {suit = true;}
if string_count("body", b) > 0 or suit {body = true;}
if string_count("neck", b) > 0 or body {neck = true;}
if string_count("torso", b) > 0 or body {torso = true;}
if string_count("front", b) > 0 or torso {front = true;}
if string_count("back", b) > 0 or torso {back = true;}
if string_count("groin", b) > 0 or body {groin = true;}
if string_count("limbs", b) > 0 or suit {limbs = true;}
if string_count("arms", b) > 0 or limbs {arms = true;}
if string_count("hands", b) > 0 or FULL {hands = true;}
if string_count("legs", b) > 0 or limbs {legs = true;}
if string_count("feet", b) > 0 or FULL {feet = true;}



/*
skull
eyes
face
neck
torso
groin
L arm
R arm
L hand
R hand
L leg
R leg
L foot
R foot
