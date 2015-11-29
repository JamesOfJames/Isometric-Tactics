///pathfinder_node_greedy_first_search(Graph,start,goal) 
//Set Up
var Graph = argument0 ;
var start = argument1 ;
var goal  = argument2 ;
//Create our Frontier and Paths Map
var frontier = ds_priority_create() ;
ds_priority_add(frontier,start,0) ;
var came_from = ds_map_create() ;
ds_map_add(came_from,start,start) ;
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
        var CList = pathfinder_node_get_connections(current) ;
      var NList = ds_list_create() ;
      ds_list_copy(NList,CList) ;
      var Size = ds_list_size(NList)
   for(i=0;i<Size;i++)
        { 
        var next = ds_list_find_value(NList,i) ;
      if  (!ds_map_exists(came_from,next))
        {
         priority = node_heuristic(goal, next) ;
         ds_priority_add(frontier,next,priority) ;
         ds_map_add(came_from,next,current)
         }
        }
   ds_list_destroy(NList) ;
   }
ds_priority_destroy(frontier) ;
return came_from ;
