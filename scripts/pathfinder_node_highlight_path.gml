///pathfinder_node_highlight_path(Path,Colour) ;
var P = argument0 ;
var Col = argument1 ;
draw_set_colour(Col) ;
if (ds_exists(P,ds_type_list))
    {
    var S = ds_list_size(P) ;
    var N = ds_list_find_value(P,0) ;
    var LX = ds_map_find_value(N,"X") ;
    var LY = ds_map_find_value(N,"Y") ;
    for(var i = 1 ; i < S ; i++)
        {
        N = ds_list_find_value(P,i) ;
        X = ds_map_find_value(N,"X") ;
        Y = ds_map_find_value(N,"Y") ;
        draw_line_width(X,Y,LX,LY,4) ;
        draw_arrow(LX,LY,X,Y,16) ;
        LX = X ;
        LY = Y ;
        }
    }
