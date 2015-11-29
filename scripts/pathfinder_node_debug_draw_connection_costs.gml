///pathfinder_node_debug_draw_connections(Node,Colour)
var M = argument0 ;
var C1 = argument1 ;
var Connections = pathfinder_node_get_connections(M) ;
var Costs  = pathfinder_node_get_costs(M) ;
if (ds_exists(Connections,ds_type_list) && ds_exists(Costs,ds_type_list))
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
            var MX = (OX + X) / 2 ;
            var MY = (OY + Y) / 2 ;
            var DIR = point_direction(X,Y,OX,OY)
            var COST = ds_list_find_value(Costs,i) ;
            draw_text_ext_transformed_colour(MX,MY,COST,-1,200,1,1,DIR,C1,C1,C1,C1,1) ; 
            draw_arrow(X,Y,OX,OY,16) ;
            }
        }
    }
