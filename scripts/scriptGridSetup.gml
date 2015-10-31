// Get the template tile used for defining the size of an isometric tile
var templateTile, gridHeight, xorigin, yorigin;
templateTile = spriteSpace;

// Work out the origin for the grid within the room
gridHeight = floor(sprite_get_height(templateTile) / 2) * array_height_2d(global.IsoGrid);

xorigin = (room_width - sprite_get_width(templateTile)) / 2;
yorigin = (room_height - gridHeight - sprite_get_height(templateTile)) / 2;

var i, j, k;
for (i = 0; i < array_height_2d(global.IsoGrid); i += 1) 
{for (j = 0; j < array_length_2d(global.IsoGrid, i); j += 1)
 {if global.IsoGrid[i, j] == 1
  {// Determine the x/y position for the sprite
   var xx, yy;
   xx = xorigin + (((i * 0.5) - (j * 0.5)) * sprite_get_width(templateTile));
   yy = yorigin + (((j * 0.5) + (i * 0.5)) * 2 * floor(sprite_get_height(templateTile) / 2));
   k = instance_create(xx, yy, objectSpace);
   k.depth = -yy;}}}