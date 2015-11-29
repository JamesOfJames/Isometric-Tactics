///path_finder_grid_cell_set_wall(grid,x,y)
/*
** Sets the cell in the given grid as a wall (value of 1) 
**
**
*/
var G = argument0 ;
if (path_finder_grid_in_bounds(G,argument1,argument2))
    {
    G[#argument1,argument2] = 1 ;
    }
