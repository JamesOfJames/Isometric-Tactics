// argument0 - Character's health to check

var a, b, c, d;
d = argument0;

// Mortally Wounded & Wounded Again
if d.MortalWound
{if d.RecentlyWounded
 {c = script_execute(scriptDiceRoll);
  if c > d.HT or c > 17
  {// Failed Health Check, Dead
   d.Conscious = false;
   d.Alive = false;}}}

// Reeling
if d.HP / d.MaxHP < 1/3
{script_execute(scriptMoveDodgeCalc, d);}

// Blackout Danger
if d.HP <= 0
{if d.Conscious
 {if !DoNothing
 {a = script_execute(scriptDiceRoll) - ceil(d.HP / d.MaxHP);
   if a > d.HT or a > 17
   {// Failed Health Check, Pass out
    d.Conscious = false;}}}}

// Death Danger
if d.HP <= -d.MaxHP
{if d.Alive
 {if !d.RecentlyWounded
  {b = script_execute(scriptDiceRoll);
   if b > d.HT + 2 or b > 17
   {// Failed Health Check, Dead
    d.Conscious = false;
    d.Alive = false;}
   if b > d.HT and b <= d.HT + 2
   {// Mortal Wound
    d.Conscious = false;
    d.MortalWound = true;}}}}

// Instant Death
if d.HP <= -5 * d.MaxHP
{if d.Alive
 {d.Conscious = false;
  d.Alive = false;}}
