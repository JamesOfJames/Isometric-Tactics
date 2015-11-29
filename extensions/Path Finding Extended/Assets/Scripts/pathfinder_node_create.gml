///pathfinder_node_create(x,y,type) ;
var M = ds_map_create() ;
//These are the basic parameters
ds_map_add(M,"X",argument0) ;
ds_map_add(M,"Y",argument1) ;
ds_map_add(M,"TYPE",argument2) ;
//These Will store ds_lists later
ds_map_add(M,"Connected",-1) ;
ds_map_add(M,"Connected Costs",-1) ;
return M ; 