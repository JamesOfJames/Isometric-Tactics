///pathfinder_node_debug_draw_connections(Node,One Way Colour,Two Way Colour)
var M = argument0 ;
var C1 = argument1 ;
var C2 = argument2 ;
var Connections = pathfinder_node_get_connections(M) ;
if (ds_exists(Connections,ds_type_list))
    {
    var S = ds_list_size(Connections) ;
    var X = ds_map_find_value(M,"X") ;
    var Y = ds_map_find_value(M,"Y") ;
    for (var i = 0 ; i < S ; i++)
        {
        var O = ds_list_find_value(Connections,i) ;
        if (ds_exists(O,ds_type_map))
                {
            var OX = ds_map_find_value(O,"X") ;
            var OY = ds_map_find_value(O,"Y") ;
            var OC = ds_map_find_value(O,"Connected") ;
            if (ds_exists(OC,ds_type_list))
                {
                if ( ds_list_find_index(OC,M) >= 0 )
                    {
                    draw_set_colour(C2) ;
                    }
                else
                    {
                    draw_set_colour(C1) ;
                    }
                }
            draw_arrow(X,Y,OX,OY,16) ;
            }
        }
    }