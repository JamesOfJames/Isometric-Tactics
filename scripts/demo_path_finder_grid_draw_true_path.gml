
///demo_path_finder_grid_draw_true_path(Graph,Paths,Cell Size , X Offset , Y Offset,Start,End) ;
var Graph = argument0 ;
var W = ds_grid_width(Graph) ;
var H = ds_grid_height(Graph) ;
var Const = W*H

var Paths = argument1 ;

var CS = argument2 ;
var XO = argument3 ;
var YO = argument4 ;
var SC = argument5 ;
var EC = argument6 ;

var Next = ds_map_find_value(Paths,EC) ;
var Pre  = Next ;


//Construct a list of cells to visit
var List = ds_list_create() ;
ds_list_add(List,EC) ;
ds_list_add(List,Pre) ;
var i = 0 ;
do
    {
    Pre = Next ;
    if (ds_map_exists(Paths,Pre))
        {
        Next = ds_map_find_value(Paths,Pre) ;
        }
    ds_list_add(List,Next) ;
    i++
    }
until (Pre == SC)|| i > Const

var Size = ds_list_size(List) ;

//Then we draw arrows along that path.
for(var i = 1 ; i < Size ; i++)
    {
            var Pre = ds_list_find_value(List,i-1) ;
            var Next = ds_list_find_value(List,i) ;
            
            var X1 = path_finder_grid_cell_get_x(Graph,Pre) + 0.5 ;
            var Y1 = path_finder_grid_cell_get_y(Graph,Pre) + 0.5 ;
            var X2 = path_finder_grid_cell_get_x(Graph,Next)+0.5 ; 
            var Y2 = path_finder_grid_cell_get_y(Graph,Next)+0.5 ;
            //draw_arrow(XO + a*CS,YO + b*CS,XO + X2*CS,YO + Y2*CS,8) ;
            draw_arrow(XO + X2*CS,YO + Y2*CS,XO + (X1)*CS,YO + (Y1)*CS,8) ;
            
    }
ds_list_destroy(List) ;
