///pathfinder_node_dijkstra_search(graph,Type Map, start, goal,return mode)
/*
** Return Mode 0 : came_from (Paths List)
** Return Mode 1 : cost_so_far(Costs List) 
*/
//Store the input
var Graph           = argument0 ;
var Types           = argument1 ;
var start           = argument2 ;
var goal            = argument3 ;
var R               = argument4 ;
//The frontier is a priority queue of cells to visit
var  frontier = ds_priority_create() ;
ds_priority_add(frontier,start,0) ;
//These are maps linking any cell to the cell before it and the cost to get there.
var came_from = ds_map_create() ;
var cost_so_far = ds_map_create() ;
//We add the start position to the maps
ds_map_add(came_from,start,start) ;
ds_map_add(cost_so_far,start,0) ;   
   var current = -1 ;
   var next = -1 ;
   //While there is still cells to visist
   while (!ds_priority_empty(frontier))
    {
    //We look at the first cell in the frontier
      current = ds_priority_delete_min(frontier) ;
      //Early Exit
      if current == goal
            {
            ds_priority_destroy(frontier);
            //Destroys the map you didn't want returned
            ds_map_destroy(came_from*(R) + cost_so_far*(!R)) ;
            return came_from*(!R) + cost_so_far*R ;
            }
      //Get all the Neighbours of the current cell so we can progress      
      var CList = pathfinder_node_get_connections(current) ;
      var NeighbourList = ds_list_create() ;
      ds_list_copy(NeighbourList,CList) ;
      var Size = ds_list_size(NeighbourList) ;
      var CostList = pathfinder_node_get_costs(current) ;
      //Check all Neighbours
      for (var i = 0 ; i < Size ; i++)
        {
        next = ds_list_find_value(NeighbourList,i) ;
         if (ds_exists(Types,ds_type_map))
                    {
                    var TypeCost = pathfinder_node_get_type_cost(next,Types) ;
                    }
                else
                    {
                    var TypeCost = 0 ;
                    }
        COST = ds_list_find_value(CostList,i) ;
        new_cost = ds_map_find_value(cost_so_far,current) + COST +TypeCost ;
        //If we aren't in the cost_so_far map or if the new cost is less than the value in cost_so_far    
         if (!ds_map_exists(cost_so_far,next))||(new_cost < ds_map_find_value(cost_so_far,next)) 
            {
            //We add this neighbour to the maps and the frontier
            ds_map_add(cost_so_far,next,new_cost) ;
            ds_priority_add(frontier,next,new_cost) ;
            ds_map_add(came_from,next,current) ;
            }
        }
    //Clean Up the Neighbour List
    ds_list_destroy(NeighbourList) ;
    }
    //Destroys the Map you didn't want returned
    ds_map_destroy(came_from*(R) + cost_so_far*(!R)) ;
    ds_priority_destroy(frontier);
   return came_from*(!R) + cost_so_far*R ;