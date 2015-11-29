///node_heuristic(goal,next)
//You can use raw manhattan distance by setting global.NODE_SIZE to 1
//If you do this you will need to have your costs in the same scale
var G = argument0 ;
var N = argument1 ;
var X1 = ds_map_find_value(G,"X") ;
var X2 = ds_map_find_value(N,"X") ;
var Y1 = ds_map_find_value(G,"Y") ;
var Y2 = ds_map_find_value(N,"Y") ;
return abs((Y2-Y1) + (X2-X1))/max(1,global.NODE_SIZE) ;