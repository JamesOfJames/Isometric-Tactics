///demo_path_finder_grid_draw(grid,cell size,x offset,y offset)
var G = argument0 ;
var W = ds_grid_width(G) ;
var H = ds_grid_height(G) ;
var CS = argument1 ;
var XO = argument2 ;
var YO = argument3 ;

for (var i = 0 ; i < W ; i++)
    {
    for(var j = 0 ; j < H ; j++)
        {
        var V = ds_grid_get(G,i,j) ;
        var Col = c_green*(V==1) + c_teal*(V==-1)+c_orange*(V==2)+c_purple*(V==3) ;
        draw_set_colour(Col) ;
        draw_rectangle(XO + i*CS , YO + j*CS , XO + (i+1)*CS,YO + (j+1)*CS,false) ;
        }
    }
