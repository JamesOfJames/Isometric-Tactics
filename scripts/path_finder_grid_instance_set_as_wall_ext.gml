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
    var X1 = floor((bbox_left-XO)/CS) ;
    var Y1 = floor((bbox_top-YO)/CS) ;
    var X2 = floor((bbox_right-XO)/CS) ;
    var Y2 = floor((bbox_bottom-YO)/CS) ;
    //show_debug_message("Should be a Wall at : " + string(X) + "," + string(Y)) ;
    if (path_finder_grid_in_bounds(Graph,X1,Y1))
        {
        if (path_finder_grid_in_bounds(Graph,X2,Y2))
            {
            ds_grid_set_region(Graph,X1,Y1,X2,Y2,1) ;
            i++
            }
        }
    }
return i ; 
