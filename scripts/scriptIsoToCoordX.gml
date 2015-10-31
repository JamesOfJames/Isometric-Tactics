// Accepts x, y coordinates on the isometric grid and computes the x, y position in the room

// argument0 = gridX
// argument1 = gridY

var posX = (argument0 - argument1) * global.TileWidth / 2;
var posY = (argument0 + argument1) * global.TileHeight / 2;

return posX;
