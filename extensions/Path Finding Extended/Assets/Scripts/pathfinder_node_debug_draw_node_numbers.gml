///pathfinder_node_debug_draw_node_numbers(Node Array,Colour)
var A = argument0 ;
var S = array_length_1d(A) ;
draw_set_colour(argument1) ;
for(var i = 0 ; i < S ; i++)
    {
    var N = A[i] ;
    var X = ds_map_find_value(N,"X") ;
    var Y = ds_map_find_value(N,"Y") ;
    draw_text(X,Y,i) ;
    }