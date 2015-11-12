// argument0 = Attacker
// argument1 = Target
// argument2 = Attacker's Gun
// argument3 = Target's Armor

var a, b, c, d, e, f, g, h, i, j;
a = argument0;
d = argument1;
i = argument2;
j = argument3;

show_debug_message(string(a.Name) + " is attacking " + string(d.Name));

if i.Ammo > 0
{// Has ammo
if point_distance(a.x, a.y, d.x, d.y) <= i.GunRange
{// In Range
 a.HalfDamage = false;
 // 1/2 damage range?
 if point_distance(a.x, a.y, d.x, d.y) <= i.GunHalfRange {a.HalfDamage = true;}

 // Basic Aim adjustment
 b = i.GunAcc
 // This should actually account for # of aim actions before firing; snapshot penalty, etc.

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
 {if i.GunROF > RapidFire[e] {f = e;}}
 
// show_debug_message("Skill of " + string(a.SkillGuns) + " + " + string(b) + " for aim, + " + string(c) + " for range, + " + string(f) + " for rapid fire");
 a.EffectiveSkill = a.SkillGuns + b + d.Size + c + f - a.Shock;
 a.AttackRoll = script_execute(scriptDiceRoll);

 // Figure Shots, Use Ammo 
 a.Shots = min(i.GunROF, i.Ammo);
 i.Ammo -= a.Shots;

 // How many rapid fire shots may hit?
 if a.Shots > 1
 {if a.EffectiveSkill - a.AttackRoll >= 0
  {if a.EffectiveSkill - a.AttackRoll > a.GunRcl
   {a.Hits = min(floor((a.EffectiveSkill - a.AttackRoll) / i.GunRcl), a.Shots);}
   else {a.Hits = 1;}}
  else {a.Hits = 0;}}
     
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
   d.DodgeRoll = script_execute(scriptDiceRoll);

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
    show_debug_message("Defender rolls " + string(d.DodgeRoll) + " and dodges all hits");}}
 else
 {// Missed - failed attack roll
  if a.AttackRoll > 16 // Critical Failure of attack roll
  {// Gun Jams?  Shoot self?
  
  }}}
  
 if !d.Critical
 {// For attacks not fully dodged
  for (e = 0; e < a.Hits - d.NumberDodged; e += 1)
  {// Damage
   if !a.Critical {a.DamageRoll = script_execute(scriptDiceRoll, i.GunDmgDice, i.GunDmgAdd);} // Figure Damage as Normal
   else {a.DamageRoll = (6 * i.GunDmgDice) + i.GunDmgAdd;} // Max Damage on Critical
   h = false; // Using high or low DR?  false = low
   if string_count(string(i.GunDmgType), string(j.ArmDmgTypes)) > 0 // search for weapon's damage type in armor's high-resistance types
   {// Defender's Armor absorbs Attaker's damage type
    d.DQ = j.DR / (d.HP + j.DR);
    h = true;}
   else
   {// Defender's Armor does not absorb Attaker's damage type
    d.DQ = j.LowDR / (d.HP + j.LowDR);}
// show_debug_message("Damage Quotient: " + string(d.DQ) + "; using high DR? " + string(h));
    d.ArmorDamage = round(d.DQ * a.DamageRoll);
    d.HealthDamage = a.DamageRoll - d.ArmorDamage;
    j.ArmorWear = 0;   
// show_debug_message("d.ArmorDamage " + string(d.ArmorDamage) + ", j.LowDR " + string(j.LowDR) + ", j.DR " + string(j.DR) + ", j.ArmDamageRatio " + string(j.ArmDamageRatio) + ", j.ArmorWear " + string(j.ArmorWear));
    if d.DQ > 0
    {if !h
     {// Deal Damage to Armor using LowDR
      while (d.ArmorDamage > 0 and j.LowDR > 0)
      {if irandom(d.ArmorDamage) > j.LowDR
       {j.LowDR -= 1;
        j.DR -= 1 / j.ArmDamageRatio;
        j.ArmorWear += 1;
        if j.LowDR <= 0
        {// Armor broke!
         show_debug_message("Defender's armor broke with " + d.ArmorDamage + " damage to armor left, on top of " + d.HealthDamage + "!");}}
        d.ArmorDamage -= j.LowDR;}}
     else 
     {// Deal Damage to Armor using DR
      while (d.ArmorDamage > 0 and j.DR > 0)
      {if irandom(d.ArmorDamage) > j.DR
       {j.DR -= 1;
        j.ArmorWear += 1;
        j.LowDR -= j.ArmDamageRatio;
        if j.DR <= 0
        {// Armor broke!
         show_debug_message("Defender's armor broke with " + d.ArmorDamage + " damage to armor left, on top of " + d.HealthDamage + "!");}}
        d.ArmorDamage -= j.DR;}}
    if d.ArmorDamage > 0 // Armor was broken
    {d.HealthDamage += d.ArmorDamage;}}
    d.PenetratingDamage = max(d.HealthDamage, 0);
    d.HP -= d.PenetratingDamage;
    if d.PenetratingDamage > 0 {d.RecentlyWounded = true;} // for purposes of re-checking certain potentially fatal injuries
    show_debug_message("Attacker hit \#" + string(e + 1) + ": " + string(a.DamageRoll) + ", which reduces armor by " + string(j.ArmorWear) + ", with " + string(d.PenetratingDamage) + " penetrating, leaving defender at " + string(d.HP));
    // Shock
    d.Shock += floor(d.PenetratingDamage * (1 / max(1, d.MaxHP / 10)));
    d.Shock = max(4, d.Shock);
    show_debug_message("shock: " + string(d.Shock));
    script_execute(scriptHealthCheck, d);
    }}}
 else
 {// Out of Range
  show_debug_message("Out of Range");
 }
}
else
{// Out of ammo
  show_debug_message("Out of Ammo; reloading...");
  with i
  {event_user(0);} // Gun: Reload
}

j.DR = round(j.DR);
j.LowDR = round(j.LowDR);
j.ArmorWear = 0;
