// argument0 - Character's movement & dodge to figure

var d;
d = argument0;

switch (floor(Encumberance / Lift))
{case 0:
 case 1:
 EncumberanceLevel = 0;
 break;
 case 2:
 EncumberanceLevel = 1;
 break;
 case 3:
 case 4:
 case 5:
 EncumberanceLevel = 2;
 break;
 case 6:
 case 7:
 case 8:
 case 9:
 EncumberanceLevel = 3;
 break;
 default:
 EncumberanceLevel = 4;
 break;
}
