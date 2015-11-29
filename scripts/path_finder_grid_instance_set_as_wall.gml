///path_finder_grid_instance_set_as_wall(grid,CellSize,XOffset,YOffset,inst)
/*
** Sets the cells occupied by the instance or object in the given grid as a wall (value of 1) 
** Returns the number of those instances marked as walls
**
*/

var Graph = argument0 ;
var W = ds_grid_width(Graph) ;
var H = ds_grid_height(Graph) ;
var CS = argument1 ;
var XO = argument2 ;
var YO = argument3 ;
var Inst = argument4 ;
var i = 0 ;
with(Inst)
    {
    var X = floor((x-XO)/CS) ;
    var Y = floor((y-YO)/CS) ;
    //show_debug_message("Should be a Wall at : " + string(X) + "," + string(Y)) ;
    if (path_finder_grid_in_bounds(Graph,X,Y))
        {
        ds_grid_set(Graph,X,Y,1) ;
        i++ ;
        }
    }

return i ; 
