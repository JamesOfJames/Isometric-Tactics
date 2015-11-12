/*/// Display Messages
global.Message = ds_grid_create(5, 0);
// timeout, x, y, Message, opacity


if ds_grid_height(global.Message) < 1
{draw_set_alpha(1);
 draw_set_colour(c_black);

 var a, b, yy, c;
 a = ds_priority_find_max(global.Message); // Most recent message
 c = 16; // line height
 yy = view_hport[0] - c; // first line position
 for (b = a; b > 0; b -= 1)
 {ds_priority_find_priority(id, val);
 
  min(
 
 
 } 
}

ds_grid_get(global.Message, x, y);
