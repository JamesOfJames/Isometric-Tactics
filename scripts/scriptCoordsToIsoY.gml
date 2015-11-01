// Accepts x, y position in the room and computes the x, y position on the isometric grid

// argument0 = roomX
// argument1 = roomY

var isoX = round((argument0 / global.TileWidth) + (argument1 / global.TileHeight));
var isoY = round((argument1 / global.TileHeight) - (argument0 / global.TileWidth));

return isoY;
