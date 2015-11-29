///pathfinder_node_debug_draw_nodes(Node Array,Colour,Radius)
var A = argument0 ;
var S = array_length_1d(A) ;
var R = argument2 ;
draw_set_colour(argument1) ;
for(var i = 0 ; i < S ; i++)
    {
    var N = A[i] ;
    var X = ds_map_find_value(N,"X") ;
    var Y = ds_map_find_value(N,"Y") ;
    draw_circle(X,Y,R,false) ;
    }