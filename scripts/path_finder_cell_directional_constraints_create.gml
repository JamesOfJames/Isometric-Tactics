///path_finder_cell_directional_constraints_create() ;

var M = ds_map_create() ;
var SM = ds_map_create() ;
ds_map_add(SM,"UP",true) ;
ds_map_add(SM,"DOWN",true) ;
ds_map_add(SM,"RIGHT",true) ;
ds_map_add(SM,"LEFT",true) ;

ds_map_add(M,1,SM) ;

return M ;
