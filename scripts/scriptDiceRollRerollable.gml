// Roll a dice a certain number of times, return the result, allowing for re-rolls.

// argument0 = how many times to roll the dice
// argument1 = add to roll (optional)
// argument2 = string; what are we checking against?
// argument3 = int; value of that stat?
// argument4 = bool; beware of success (false) or failure (true)
// argument5 = string; what is the possible negative outcome?

var a, b, c, d, e, f, g, h;
a = 0;
e = argument2;
f = argument3;
if argument4 {g = "success";}
else {g = "failure";}
h = argument5;

if argument_count != 0
{d = argument0;}
else
{d = 3;}

if argument_count > 1
{c = argument1;}
else
{c = 0;}

do
{for (b = 0; b < d; b++)
 {a += irandom_range(1, 6);}}
until (show_question("Rolling against " + e + " of " + string(f) + "; result is " + string (a + c) + ".  On a " + g + ", " + h + ".  Keep this roll?")); 

return a + c;
