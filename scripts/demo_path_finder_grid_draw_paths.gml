///demo_path_finder_grid_draw_paths(Graph,Paths,Cell Size , X Offset , Y Offset) ;
var Graph = argument0 ;
var W = ds_grid_width(Graph) ;
var H = ds_grid_height(Graph) ;


var Paths = argument1 ;

var CS = argument2 ;
var XO = argument3 ;
var YO = argument4 ;

for(var a = 0 ; a < W ; a++)
    {
    for(var b = 0 ; b < H ; b++)
        {
        var V = path_finder_grid_cell_get_id(Graph,a,b) ;
        if (ds_map_exists(Paths,V))
            {
            var C = ds_map_find_value(Paths,V) ;
            var X2 = path_finder_grid_cell_get_x(Graph,C)+0.5 ; 
            var Y2 = path_finder_grid_cell_get_y(Graph,C)+0.5 ;
            //draw_arrow(XO + a*CS,YO + b*CS,XO + X2*CS,YO + Y2*CS,8) ;
            draw_arrow(XO + X2*CS,YO + Y2*CS,XO + (a+0.5)*CS,YO + (b+0.5)*CS,8) ;
            }
        }
    }

    
