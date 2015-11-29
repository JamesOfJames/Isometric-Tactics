///path_finder_grid_instance_set_as_wall(grid, CellSize, inst)
/*
** Sets the cells occupied by the instance or object in the given grid as a wall (value of 1) 
** Returns the number of those instances marked as walls
**
*/

var Graph = argument0 ; // grid
var W = ds_grid_width(Graph) ; // grid width
var H = ds_grid_height(Graph) ; // grid height
var CS = argument1 ; // CellSize
var Inst = argument2 ; // The instance(s) to add as walls
var i = 0 ;
with(Inst) // with each of these objects
{var x1 = floor(bbox_left / CS) ;
 var y1 = floor(bbox_top / CS) ;
 var x2 = floor(bbox_right / CS) ;
 var y2 = floor(bbox_bottom / CS) ;
 
 show_debug_message("building wall from: " + string(x1) + ", " + string(y1) + " to " + string(x2) + ", " + string(y2));
 
 var a, b;
 for (b = y1; b <= y2; b += 1)
 {for (a = x1; a <= x2; a += 1)
  {if (path_finder_grid_in_bounds(Graph, a, b))
   {if position_meeting(a * CS, b * CS, Inst)
    {ds_grid_set(Graph, a, b, 1);}}}}
 i++;}

return i ; 
