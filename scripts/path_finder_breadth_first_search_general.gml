///path_finder_breadth_first_search_general(graph, start,goal,Dirs,Constraints):
var graph = argument0 ;
var start = argument1 ;
var goal  = argument2 ;
var DIRS = argument3 ;
var Cons = argument4 ;
var Graph = graph ;

var W = ds_grid_width(graph) ;

var frontier = ds_queue_create() ;
ds_queue_enqueue(frontier,start) ;

var came_from = ds_map_create() ;
came_from[?start] = start ;
   
   
   while (! ds_queue_empty(frontier))
    {
      current = ds_queue_dequeue(frontier) ;
      //Early Exit
      if (current == goal)
        {
        ds_queue_destroy(frontier) ;
        return came_from ; 
        }
        
        var X = path_finder_grid_cell_get_x(Graph,current) ;
        var Y = path_finder_grid_cell_get_y(Graph,current) ;
      
      //Get the list of neighbours
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
      var NSize = ds_list_size(NeighbourList) ;
      
      //Loop through each neigher and check if we've been there already or not
      for ( i = 0 ; i < NSize ; i++) 
        {
        next = NeighbourList[|i] ;
        //If we've not been there 
        if (!ds_map_exists(came_from,next))
            {
            //Add to the queue of places to go
            ds_queue_enqueue(frontier,next) ;
            //And make sure to store the cell we would come from to go there
            came_from[?next] = current ;
            }
         }
      //Clean up the list
      ds_list_destroy(NeighbourList) ;
      }

//Destroy the frontier queue
ds_queue_destroy(frontier) ;
//Retrun the map of nodes.
return came_from ; 
