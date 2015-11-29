///path_finder_a_star_search_8d_weighted(Graph,weighted graph, start, goal,MovementWeights,Constraints,Directions,ReturnMode):

var Graph = argument0 ;
var Weighted = argument1;
var start = argument2 ;
var goal  = argument3 ;
var MovementWeights = argument4 ;
var Constraints = argument5 ;
var DIRS = argument6
var R = argument7 ;
 
var frontier = ds_priority_create() ;

ds_priority_add(frontier,start,0) ;

var came_from = ds_map_create() ;
var cost_so_far = ds_map_create() ;

came_from[?start] = start ;
cost_so_far[?start] = 0 ;

//show_debug_message("A* Started") ;
//show_debug_message("A* Goal at : " + string(goal)) ;

var current = -1 ;
var next    = -1 ;

while (!ds_priority_empty(frontier))
    {
    
    current = ds_priority_delete_min(frontier) ;
    //show_debug_message("A* Currently at : " + string(current)) ;
    
    if (current == goal)
        {
        //show_debug_message("A* Found Goal") ;
        var Del = came_from*(R) + cost_so_far*(!R) ;
        ds_priority_destroy(frontier) ;
        ds_map_destroy(Del) ;
         return came_from*(!R) + cost_so_far*R ;
         }
      
    var CX = path_finder_grid_cell_get_x(Graph,current) ;
    var CY = path_finder_grid_cell_get_y(Graph,current) ;
        
   if (!ds_exists(Constraints,ds_type_map))
        {
        if (DIRS == 0)
            {
            var NeighbourList = path_finder_grid_neighbours(Graph,CX,CY) ;
            }
        else
            {
            var NeighbourList = path_finder_grid_8_neighbours(Graph,CX,CY) ;
            }
        }
      else
        {
        if (DIRS == 0)
            {
            var NeighbourList = path_finder_grid_neighbours_directional_constraints(Graph,CX,CY,Constraints) ;
            }
        else
            {
            var NeighbourList = path_finder_grid_neighbours_directional_constraints_8(Graph,CX,CY,Constraints) ;
            }
        
        }
    var Size = ds_list_size(NeighbourList) ;
    //show_debug_message("Neighbours : " + string(Size)) ;
   for(i=0;i<Size;i++)
        { 
        
        var next = NeighbourList[|i] ;
        
        if (ds_exists(MovementWeights,ds_type_grid))
            {
            var Dir = point_direction(CX,CY,path_finder_grid_cell_get_x(Graph,next),path_finder_grid_cell_get_y(Graph,next)) ;
            var Cost = MovementWeights[#1 + sign(lengthdir_x(1,Dir))*1,1 + sign(lengthdir_y(1,Dir))*1] ;
            }
        else
            {
            var Cost = 0 ;
            }
            
        var new_cost = Cost + cost_so_far[?current] + path_finder_grid_cell_get_weight(Weighted,next) ;
        
          if  (!ds_map_exists(came_from,next)) || (new_cost < cost_so_far[?next])
                {
                cost_so_far[?next] = new_cost ;
                priority = heuristic(Graph,goal, next) + new_cost ;
                ds_priority_add(frontier,next,priority) ;
                came_from[?next] = current ;
             
                }
        }
   ds_list_destroy(NeighbourList) ;
   }


var Del = came_from*(R) + cost_so_far*(!R) ;
ds_map_destroy(Del) ; 
ds_priority_destroy(frontier) ;
//show_debug_message("A* Did not Find Goal") ;
return came_from*(!R) + cost_so_far*R ;
