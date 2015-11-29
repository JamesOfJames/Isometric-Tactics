///path_finder_grid_neighbours(grid,x,y)
/*
** Returns a ds_list of all the neighbours of the given cell that can be travelled too.
**
**
*/

var NeighbourList = ds_list_create() ;
var W = ds_grid_width(argument0) ;

for(var i = 0 ; i < 4 ; i++)
    {
    var X = argument1 + lengthdir_x(1,90*i) ;
    var Y = argument2 + lengthdir_y(1,90*i) ;
    if (path_finder_grid_in_bounds(argument0,X,Y))
        {
        if (path_finder_grid_cell_passable(argument0,X,Y))
            {
            ds_list_add(NeighbourList,X + W*Y) ;
            }
        }
    
    }
    
return NeighbourList ; 