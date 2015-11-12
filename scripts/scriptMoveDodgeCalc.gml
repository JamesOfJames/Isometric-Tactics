// argument0 - Character's movement & dodge to figure

/*MaxSpeed = 5;
Moves = Speed * 2;
Height = 1//sprite_get_height(sprite_index);

Size = 0
MaxDodge = Speed + 3;
script_execute(scriptMoveDodgeCalc, id);
SkillGuns = 13;

if Moves <= 0
{Moves = Speed;
 with (objectSpace) event_user(0);}
*/

var d;
d = argument0;

d.Speed = d.MaxSpeed;
d.Dodge = d.MaxDodge;

script_execute(scriptEncumberanceCalc, d);

Speed = max(1, round(MaxSpeed * (1 - (EncumberanceLevel * .2))));
Dodge = max(3, MaxDodge - EncumberanceLevel);

// Reeling
if d.HP / d.MaxHP < 1/3
{d.Speed = ceil(d.Speed / 2);
 d.Dodge = max(3, ceil(d.Dodge / 2));}
 
d.Moves = d.Speed * 2;
