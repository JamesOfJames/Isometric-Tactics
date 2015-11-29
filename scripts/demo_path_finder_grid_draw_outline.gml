///demo_path_finder_grid_draw_outline(Graph,CellSize,XOffset,YOffset)
var G = argument0 ;
var CS = argument1 ;
var XO = argument2 ;
var YO = argument3 ;
var W = ds_grid_width(G) ;
var H = ds_grid_height(G) ;

for(var a = 0 ; a < W ; a ++)
    {
    for(var b = 0 ; b < H ; b++)
        {
        draw_rectangle(XO + a*CS,YO + b*CS,XO + (a+1)*CS,YO + (b+1)*CS,true) ;
        }
    }
