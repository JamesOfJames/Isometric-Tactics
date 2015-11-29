///pathfinder_node_a_star_search(Graph,Type Map,start, goal,returnmode):
var Graph = argument0 ;
var Types = argument1
var start = argument2;
var goal  = argument3 ;
var R = argument4 ;
var frontier = ds_priority_create() ;
ds_priority_add(frontier,start,0) ;
var came_from = ds_map_create() ;
var cost_so_far = ds_map_create() ;
ds_map_add(came_from,start,start) ;
ds_map_add(cost_so_far,start,0) ;
show_debug_message("A* Started") ;
//show_debug_message("A* Goal at : " + string(goal)) ;
var current = -1 ;
var next    = -1 ;
while (!ds_priority_empty(frontier))
    {
    current = ds_priority_delete_min(frontier) ;
    show_debug_message("A* Currently at : " + string(current)) ;
    if (current == goal)
        {
        show_debug_message("A* Found Goal") ;
        var Del = came_from*(R) + cost_so_far*(!R) ;
        ds_map_destroy(Del) ;
        ds_priority_destroy(frontier) ;
         return came_from*(!R) + cost_so_far*R ;
         }
    var CList = pathfinder_node_get_connections(current) ;
    if (ds_exists(CList,ds_type_list))
        {
        var NeighbourList = ds_list_create() ;
        ds_list_copy(NeighbourList,CList) ;
        var Size = ds_list_size(NeighbourList) ;
        var NodeCostList = pathfinder_node_get_costs(current) ;
        if (ds_exists(NodeCostList,ds_type_list))
            {
            //show_debug_message("Neighbours : " + string(Size)) ;
           for(var i=0;i<Size;i++)
                { 
                var Node_Cost = ds_list_find_index(NodeCostList,i) ;
                var next = ds_list_find_value(NeighbourList,i) ;
                if (ds_exists(Types,ds_type_map))
                    {
                    var TypeCost = pathfinder_node_get_type_cost(next,Types) ;
                    }
                else
                    {
                    var TypeCost = 0 ;
                    }
                var new_cost = ds_map_find_value(cost_so_far,current) + Node_Cost + TypeCost
                  if  (!ds_map_exists(came_from,next)) || (new_cost < ds_map_find_value(cost_so_far,next))
                        {
                        ds_map_add(cost_so_far,next,new_cost) ;
                        priority = node_heuristic(goal, next) + new_cost ;
                        ds_priority_add(frontier,next,priority) ;
                        ds_map_add(came_from,next,current) ;
                        }
                }
            }
       ds_list_destroy(NeighbourList) ;
       }
    }
var Del = came_from*(R) + cost_so_far*(!R) ;
ds_map_destroy(Del) ; 
ds_priority_destroy(frontier) ;
//show_debug_message("A* Did not Find Goal") ;
return came_from*(!R) + cost_so_far*R ;
