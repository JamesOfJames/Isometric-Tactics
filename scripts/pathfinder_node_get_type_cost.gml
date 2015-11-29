///pathfinder_node_get_type_cost(Node,Type Map)
var N = argument0 ;
var M = argument1 ;
var T = M[?N[?"Type"]]
if (T  <= 0)
    {
    T = M[?"Default"] ;
    }
return T  ;
