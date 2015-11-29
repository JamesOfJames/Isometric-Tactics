///path_finder_directional_weight_grid_declare(Top Left , Top Center , Top Right , Center Left , Center Right,Bottom Left ,Bottom Center, Bottom Right)

var G = ds_grid_create(3,3) ;
ds_grid_set(G,0,0,argument0) ; // Top Left
ds_grid_set(G,1,0,argument1) ; // Top Center
ds_grid_set(G,2,0,argument2) ; // Top Right
ds_grid_set(G,0,1,argument3) ; // Center Left
ds_grid_set(G,1,1,0) ; // Center
ds_grid_set(G,2,1,argument4) ; // Center Right 
ds_grid_set(G,0,2,argument5) ; // Bottom Left
ds_grid_set(G,1,2,argument6) ; //Bottom Center
ds_grid_set(G,2,2,argument7) ; // Bottom Right 

return G ;
