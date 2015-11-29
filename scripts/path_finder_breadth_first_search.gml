///path_finder_breadth_first_search(graph, start,goal):
var graph = argument0 ;
var start = argument1 ;
var goal  = argument2 ;

var W = ds_grid_width(graph) ;

var frontier = ds_queue_create() ;
ds_queue_enqueue(frontier,start) ;

var came_from = ds_map_create() ;
ds_map_add(came_from,start,start) ;
   
   
   while (! ds_queue_empty(frontier))
    {
      current = ds_queue_dequeue(frontier) ;
      //Early Exit
      if (current == goal)
        {
        ds_queue_destroy(frontier) ;
        return came_from ; 
        }
        
      
      
      //Get the list of neighbours
      var NList = path_finder_grid_neighbours(graph,current mod W,floor(current/W)) ;
      var NSize = ds_list_size(NList) ;
      
      //Loop through each neigher and check if we've been there already or not
      for ( i = 0 ; i < NSize ; i++) 
        {
        next = NList[|i] ;
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
      ds_list_destroy(NList) ;
      }

//Destroy the frontier queue
ds_queue_destroy(frontier) ;
//Retrun the map of nodes.
return came_from ; 
