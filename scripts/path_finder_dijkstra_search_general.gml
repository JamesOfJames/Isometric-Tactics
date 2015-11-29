///path_finder_dijkstra_search_general(graph,weighted graph, start, goal,MovementWeights,Constraints,directions,returnmode)
/*
** Return Mode 0 : came_from (Paths List)
** Return Mode 1 : cost_so_far(Costs List) 
*/


//Store the input
var Graph           = argument0 ;
var WeightedGraph   = argument1 ;
var start           = argument2 ;
var goal            = argument3 ;
var MovementWeights = argument4 ;
var Constraints     = argument5 ;
var DIRS            = argument6 ;
var R               = argument7 ;

//The frontier is a priority queue of cells to visit

var  frontier = ds_priority_create() ;
ds_priority_add(frontier,start,0) ;

//These are maps linking any cell to the cell before it and the cost to get there.
var came_from = ds_map_create() ;
var cost_so_far = ds_map_create() ;
   
//We add the start position to the maps
came_from[?start] = start ;
cost_so_far[?start] = 0 ;   


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
      var X = path_finder_grid_cell_get_x(Graph,current) ;
      var Y = path_finder_grid_cell_get_y(Graph,current) ;
      
      
      
      if (!ds_exists(Constraints,ds_type_map))
        {
        if (DIRS == 0)
            {
            var NeighbourList = path_finder_grid_neighbours(Graph,X,Y) ;
            }
        else
            {
            var NeighbourList = path_finder_grid_8_neighbours(Graph,X,Y) ;
            }
        }
      else
        {
        if (DIRS == 0)
            {
            var NeighbourList = path_finder_grid_neighbours_directional_constraints(Graph,X,Y,Constraints) ;
            }
        else
            {
            var NeighbourList = path_finder_grid_neighbours_directional_constraints_8(Graph,X,Y,Constraints) ;
            }
        
        }
      var Size = ds_list_size(NeighbourList) ;
      //Check all Neighbours
      for (var i = 0 ; i < Size ; i++)
        {
          
        next = NeighbourList[|i] ;
        var Dir = point_direction(X,Y,path_finder_grid_cell_get_x(Graph,next),path_finder_grid_cell_get_y(Graph,next)) ;
        if (ds_exists(MovementWeights,ds_type_grid))
            {
            var Cost = MovementWeights[#1 + sign(lengthdir_x(1,Dir))*1,1 + sign(lengthdir_y(1,Dir))*1] ;
            }
        else
            {
            var Cost = 0 ;
            }
     
        new_cost = Cost + cost_so_far[?current] + path_finder_grid_cell_weight(WeightedGraph,next) ;
        //If we aren't in the cost_so_far map or if the new cost is less than the value in cost_so_far    
         if (!ds_map_exists(cost_so_far,next))||(new_cost < cost_so_far[?next]) 
            {
            //We add this neighbour to the maps and the frontier
            cost_so_far[?next] = new_cost ;
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
