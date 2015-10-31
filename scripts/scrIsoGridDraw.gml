var gridDimensions;
gridDimensions = instance_find(objGridDimensions, 0);

var i, j;
for (i = 0; i < gridDimensions.gridWidth; i += 1) 
{
    var st,c;
    st="";
    for (j = 0; j < gridDimensions.gridHeight; j += 1)
    {
        // Determine the x/y position for the sprite
        var xx, yy;
        xx = xorigin + (((i * 0.5) - (j * 0.5)) * sprite_get_width(templateTile));
        yy = yorigin + (((j * 0.5) + (i * 0.5)) * sprite_get_height(templateTile));
        
        draw_sprite(gridCell[i, j], 0, xx, yy);
    }
}
