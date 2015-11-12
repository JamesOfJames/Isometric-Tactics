// argument0 = Which Gun?
var a, b;

a = argument0;
b = instance_create(x, y, objectGun);

with b
{GunType = ds_grid_get(global.GunList, 0, a); // Weapon Type
 GunTL = ds_grid_get(global.GunList, 1, a); // Tech Level
 GunName = ds_grid_get(global.GunList, 2, a); // Weapon Name
 GunDmgDice = ds_grid_get(global.GunList, 3, a); // Damage Dice
 GunDmgAdd = ds_grid_get(global.GunList, 4, a); // Damage Add
 GunDmgType = ds_grid_get(global.GunList, 5, a); // Damage Type
 GunAcc = ds_grid_get(global.GunList, 6, a); // Accuracy
 GunHalfRange = ds_grid_get(global.GunList, 7, a); // Half Damage Range
 GunRange = ds_grid_get(global.GunList, 8, a); // Extreme Range
 Weight = ds_grid_get(global.GunList, 9, a); // Weapon Weight
 GunAmmoWeight = ds_grid_get(global.GunList, 10, a); // Magazine Weight
 GunROF = ds_grid_get(global.GunList, 11, a); // Rate of Fire
 GunMagSize = ds_grid_get(global.GunList, 12, a); // Shots / Magazine
 GunReload = ds_grid_get(global.GunList, 13, a); // Reload Time
 GunST = ds_grid_get(global.GunList, 14, a); // Strength
 GunTwoHanded = ds_grid_get(global.GunList, 15, a); // Two-Handed?
 GunBulk = ds_grid_get(global.GunList, 16, a); // Bulk penalty
 GunRecoil = ds_grid_get(global.GunList, 17, a); // Recoil
 Price = ds_grid_get(global.GunList, 18, a); // Price
 LC = ds_grid_get(global.GunList, 19, a); // Legality
 Ammo = GunMagSize;}
 
show_debug_message("Equipping " + b.GunName + "...");

a = argument0;

return b;
