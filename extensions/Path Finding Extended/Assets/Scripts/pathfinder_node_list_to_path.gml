///pathfinder_node_list_to_path(List) ;
var List = argument0 ;
var Path = path_add() ;
var Size = ds_list_size(List) ;
for(var i = 0 ; i < Size ; i++)
    {
    var N = ds_list_find_value(List,i) ;
    var X = ds_map_find_value(N,"X") ;
    var Y = ds_map_find_value(N,"Y") ;
    path_add_point(Path,X,Y,1) ;
    }
return Path ;