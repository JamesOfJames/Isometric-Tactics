///pathfinder_node_add_connections(Node,Connected Node List) ;
var N = argument0 ;
var C = argument1 ;
var L = ds_map_find_value(N,"Connected") ;
if (ds_exists(L,ds_type_list))
    {
    var Size = ds_list_size(C) ;
    for(var i = 0 ; i < Size ; i++)
        {
        ds_list_add(L,ds_list_find_value(C,i)) ;
        }
    }
else
    {
    ds_map_replace(N,"Connected",C) ;
    }