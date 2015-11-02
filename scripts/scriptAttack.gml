// argument0 = Attacker
// argument1 = Target

var a, b, c, d, e, f, g;
a = argument0;
d = argument1;

show_debug_message(string(a.Name) + " is attacking " + string(d.Name));

if a.Ammo > 0
{// Has ammo
if point_distance(a.x, a.y, d.x, d.y) <= a.GunMaxRange
{// In Range
 // Basic Aim adjustment
 b = a.GunAcc

 // Basic Range adjustment
 c = sqrt(sqr(a.GridX - d.GridX) + sqr(a.GridX - d.GridX)) / global.GridSize // distance between gridspaces

 var SpeedRange;
 SpeedRange[0] = 2;
 SpeedRange[1] = 3;
 SpeedRange[2] = 5;
 SpeedRange[3] = 7;
 SpeedRange[4] = 10;
 SpeedRange[5] = 15;
 SpeedRange[6] = 20;
 SpeedRange[7] = 30;
 SpeedRange[8] = 50;

 for (e = array_length_1d(SpeedRange); e > 0; e -= 1)
 {if c <= SpeedRange[e] {c = -e;}}
 
 // Basic Rapid Fire adjustment
 var RapidFire;
 RapidFire[0] = 4;
 RapidFire[1] = 8;
 RapidFire[2] = 12;
 RapidFire[3] = 16;
 RapidFire[4] = 24;
 RapidFire[5] = 49;
 RapidFire[6] = 99;
 RapidFire[7] = 199;
 RapidFire[8] = 399;
 
 f = 0;
 for (e = 0; e < array_length_1d(RapidFire); e += 1)
 {if a.GunROF > RapidFire[e] {f = e;}}
 
// show_debug_message("Skill of " + string(a.SkillGuns) + " + " + string(b) + " for aim, + " + string(c) + " for range, + " + string(f) + " for rapid fire");
 a.EffectiveSkill = a.SkillGuns + b + d.Size + c + f;
 a.AttackRoll = script_execute(scriptDiceRoll, 3);
 
 a.Shots = min(a.GunROF, a.Ammo);
 
 // How many rapid fire shots may hit?
 if a.EffectiveSkill - a.AttackRoll > 0
 {if a.EffectiveSkill - a.AttackRoll > a.GunRcl
  {a.Hits = min(floor((a.EffectiveSkill - a.AttackRoll) / a.GunRcl), a.Shots);}
  else {a.Hits = 1;}}
 else {a.Hits = 0;}
 
 // Use Ammo
 a.Ammo -= a.Shots;
 
 if a.AttackRoll <= a.EffectiveSkill {show_debug_message("Attacker rolls " + string(a.AttackRoll) + " against an effective skill of " + string(a.EffectiveSkill) + ", hitting up to " + string(a.Hits) + " times");}
 else {{show_debug_message("Attacker rolls " + string(a.AttackRoll) + " against an effective skill of " + string(a.EffectiveSkill) + ", missing");}}

 a.Critical = false;
 d.Critical = false;
    
 if a.AttackRoll < 5
 {// Critical Hit
  a.Critical = true;
  d.NumberDodged = 0;}
 else 
 {// Not Critical Hit
  if a.AttackRoll <= a.EffectiveSkill
  {// Successful Attack Roll
   // Defender rolls to dodge
   d.DodgeRoll = script_execute(scriptDiceRoll, 3);
      
   if d.DodgeRoll > 5
   {if d.DodgeRoll > d.Dodge
    {// Failed Dodge
     show_debug_message("Defender rolls " + string(d.DodgeRoll) + " against a dodge of " + string(d.Dodge) + " and fails to dodge");
     d.NumberDodged = 0;}
    else
    {// Successful Dodge
     // # of dodged hits
     d.NumberDodged = max(d.Dodge - d.DodgeRoll, 1);
     show_debug_message("Defender rolls " + string(d.DodgeRoll) + " against a dodge of " + string(d.Dodge) + " and dodges " + string(d.NumberDodged) + " hits");}}
   else
   {// Critical Dodge
    d.Critical = true;
    show_debug_message("Defender rolls " + string(d.DodgeRoll) + " and dodges all hits");}}}
 
/*
GunType = ds_grid_get(global.GunList, 0, a); // Weapon Type
GunTL = ds_grid_get(global.GunList, 1, a); // Tech Level
GunName = ds_grid_get(global.GunList, 2, a); // Weapon Name
GunDmgDice = ds_grid_get(global.GunList, 3, a); // Damage Dice
GunDmgAdd = ds_grid_get(global.GunList, 4, a); // Damage Add
GunDmgType = ds_grid_get(global.GunList, 5, a); // Damage Type
GunAcc = ds_grid_get(global.GunList, 6, a); // Accuracy
GunHalfRange = ds_grid_get(global.GunList, 7, a); // Half Damage Range
GunRange = ds_grid_get(global.GunList, 8, a); // Extreme Range
GunWeight = ds_grid_get(global.GunList, 9, a); // Weapon Weight
GunAmmoWeight = ds_grid_get(global.GunList, 10, a); // Magazine Weight
GunROF = ds_grid_get(global.GunList, 11, a); // Rate of Fire
GunMagSize = ds_grid_get(global.GunList, 12, a); // Shots / Magazine
GunReload = ds_grid_get(global.GunList, 13, a); // Reload Time
GunST = ds_grid_get(global.GunList, 14, a); // Strength
GunTwoHanded = ds_grid_get(global.GunList, 15, a); // Two-Handed?
GunBulk = ds_grid_get(global.GunList, 16, a); // Bulk penalty
GunRecoil = ds_grid_get(global.GunList, 17, a); // Recoil
GunPrice = ds_grid_get(global.GunList, 18, a); // Price
GunLC = ds_grid_get(global.GunList, 19, a); // Legality
*/    
    
    
 if !d.Critical
 {// For attacks not fully dodged
  for (e = 0; e < a.Hits - d.NumberDodged; e += 1)
  {// Damage
   if !a.Critical {a.DamageRoll = script_execute(scriptDiceRoll, GunDmgDice, GunDmgAdd);;}
   else {a.DamageRoll = (6 * GunDmgDice) + GunDmgAdd;}}
   if string_count(string(a.GunDmgType), string(d.DamageType)) > 0
   {// Defender's Armor absorbs Attaker's damage type
    d.DQ = d.DR / (d.HP + d.DR);}
   else
   {// Defender's Armor does not absorb Attaker's damage type
    d.DQ = d.LowDR / (d.HP + d.LowDR);}
    d.ArmorDamage = round(d.DQ * a.DamageRoll);
    d.HealthDamage = a.DamageRoll - d.ArmorDamage;
    while (d.ArmorDamage > 0 or )
    {if irandom(d.ArmorDamage) >
    }
    
    
    d.PenetratingDamage = max(a.DamageRoll - d.LowDR, 0);
    d.HP -= d.PenetratingDamage;
   show_debug_message("Attacker hit \#" + string(e + 1) + ": " + string(a.DamageRoll) + ", of which " + string(d.PenetratingDamage) + " penetrates, leaving defender at " + string(d.HP));
   }}
 else
 {// Out of Range
 }
}
else
{// Out of ammo
}
