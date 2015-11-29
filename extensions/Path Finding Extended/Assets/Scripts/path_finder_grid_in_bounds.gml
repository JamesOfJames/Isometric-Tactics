///path_finder_grid_in_bounds(Grid,x,y)
/*
** Returns if the given cell is within the bounds of the grid
**
*/
var X = argument1 ;
var Y = argument2 ;
return (X >= 0)&&(X <ds_grid_width(argument0)&&(Y>=0)&&(Y< ds_grid_height(argument0)))