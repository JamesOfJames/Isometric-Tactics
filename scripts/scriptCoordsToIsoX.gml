// Accepts x, y position in the room and computes the x, y position on the isometric grid

// argument0 = roomX
// argument1 = roomY

var isoX = round((argument1 / global.TileHeight) + (argument0 / (2 * global.TileWidth)));
var isoY = round((argument1 / global.TileHeight) - (argument0 / (2 * global.TileWidth)));

return isoX;
