///path_finder_greedy_first_search_8d(Graph,start,goal,directions,constraints) 


//Set Up
var Graph = argument0 ;
var start = argument1 ;
var goal  = argument2 ;
var DIRS  = argument3 ;
var Cons  = argument4 ;


//Create our Frontier and Paths Map
var frontier = ds_priority_create() ;
ds_priority_add(frontier,start,0) ;

var came_from = ds_map_create() ;
came_from[?start] = start ;

var current = -1 ;
var next    = -1 ;
while (!ds_priority_empty(frontier))
    {
   current = ds_priority_delete_min(frontier) ;

   //Early Exit
   if (current == goal)
    {
     ds_priority_destroy(frontier);
     return came_from ;
    }
    
    
   var X = path_finder_grid_cell_get_x(Graph,current) ;
   var Y = path_finder_grid_cell_get_y(Graph,current) ;
   
   if (DIRS == 0)
    {
    if (ds_exists(Cons,ds_type_map))
        {
        var NeighbourList = path_finder_grid_neighbours_directional_constraints(Graph,X,Y,Cons) ;
        }
    else
        {
        var NeighbourList = path_finder_grid_neighbours(Graph,X,Y) ;
        }
    }
    else
        {
        if (ds_exists(Cons,ds_type_map))
        {
        var NeighbourList = path_finder_grid_neighbours_directional_constraints_8(Graph,X,Y,Cons) ;
        }
    else
        {
        var NeighbourList = path_finder_grid_8_neighbours(Graph,X,Y) ;
        }
        }
    
   
   var Size = ds_list_size(NeighbourList) ;
    
   for(i=0;i<Size;i++)
        { 
        var next = NeighbourList[|i] ;
   
      if  (!ds_map_exists(came_from,next))
        {
         priority = heuristic(Graph,goal, next) ;
         ds_priority_add(frontier,next,priority) ;
         came_from[?next] = current ;
         
         }
        }
   ds_list_destroy(NeighbourList) ;
   }
   
   
ds_priority_destroy(frontier) ;
return came_from ;
