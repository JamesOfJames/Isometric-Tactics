///path_finder_grid_declare_weights(Graph,Terrain_Mappings,MinCost) ;

var UnWeighted = argument0 ;
W = ds_grid_width(UnWeighted) ;
H = ds_grid_height(UnWeighted) ;


var Weighted = ds_grid_create(W,H) ;
var Terrain_Mappings = argument1 ;
var MinCost = argument2 ;

for(var a = 0 ; a < W ; a++)
    {
    for(var b = 0 ; b < H ; b++)
        {
        var V = ds_grid_get(UnWeighted,a,b) ;
        if (ds_map_exists(Terrain_Mappings,V))
            {
            ds_grid_set(Weighted,a,b,ds_map_find_value(Terrain_Mappings,V)) ;
            }
        else
            {
            ds_grid_set(Weighted,a,b,MinCost) ;
            }
        }
    }

    
return Weighted ;
