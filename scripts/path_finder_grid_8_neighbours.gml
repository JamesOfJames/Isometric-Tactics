///path_finder_grid_8_neighbours(grid,x,y)
/*
** Returns a ds_list of all the neighbours of the given cell that can be travelled too.
**
**
*/

var NeighbourList = ds_list_create() ;
var W = ds_grid_width(argument0) ;
for(var i = 0 ; i < 8 ; i++)
    {
    var X = argument1 + sign(lengthdir_x(1,45*i))*1 ;
    var Y = argument2 + sign(lengthdir_y(1,45*i))*1 ;
    if (path_finder_grid_in_bounds(argument0,X,Y))
        {
        if (path_finder_grid_cell_passable(argument0,X,Y))
            {
            ds_list_add(NeighbourList,X + W*Y) ;
            }
        }
    
    }
    
return NeighbourList ; 
