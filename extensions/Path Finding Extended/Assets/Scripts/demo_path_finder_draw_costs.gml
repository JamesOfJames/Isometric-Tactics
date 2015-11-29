///demo_path_finder_draw_costs(Grid,Paths,CellSize,X Offset, Y Offset)

var G = argument0 ;
var P = argument1 ;
var W = ds_grid_width(G) ;
var H = ds_grid_height(G) ;

var CS = argument2 ;
var XO = argument3 ;
var YO = argument4 ;


for(var a = 0 ; a < W ; a++)
    {
    for(var b = 0 ; b < H ; b++)
        {
        var C = path_finder_grid_cell_get_id(G,a,b) ;
        var Cost = ds_map_find_value(P,C) ;
        if (Cost > 0)
            {
            draw_text(XO + (a+0.5)*CS,YO + (b+0.5)*CS,Cost) ;
            }
        }
    }