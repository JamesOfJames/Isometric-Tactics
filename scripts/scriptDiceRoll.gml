// Roll a dice a certain number of times, return the result.

// argument0 = how many times to roll the dice
// argument1 = add to roll (optional)

var a, b, c, d;
a = 0

if argument_count != 0
{d = argument0;}
else
{d = 3;}

if argument_count > 1
{c = argument1;}
else
{c = 0;}

for (b = 0; b < d; b++)
{a += irandom_range(1, 6);}

return a + c;
