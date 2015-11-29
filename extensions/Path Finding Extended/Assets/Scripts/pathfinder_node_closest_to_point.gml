///pathfinder_node_closest_to_point(Graph,x,y,n) ;
/*
** Find the Nth closest node to the given position in the Graph Array
** In the demo the Graph is given as the Node array
** 
**
**/
var N = argument0 ;
var S = array_length_1d(N) ;
var X = argument1 ;
var Y = argument2 ;
var nth = argument3 ;
var Prio = ds_priority_create() ;
for(var i = 0 ; i < S ; i++)
    {
    var X2 = ds_map_find_value(N[i],"X") ;
    var Y2 = ds_map_find_value(N[i],"Y") ;
    ds_priority_add(Prio,N[i],point_distance(X,Y,X2,Y2)) ;    
    }
var Return = -1 ;
repeat(nth)
    {
    Return = ds_priority_delete_min(Prio) ;
    }
ds_priority_destroy(Prio) ;
return Return ;