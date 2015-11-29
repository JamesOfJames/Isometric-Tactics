///path_finder_can_reach_goal(Paths,Start,Goal) 


var Paths = argument0 ;
var Const = ds_map_size(Paths) ;

var SC = argument1 ;
var EC = argument2 ;

//var Next = ds_map_find_value(Paths,EC) ;
var Next  = Paths[? EC]
var Pre  = Next ;


//Construct a list of cells to visit
var List = ds_list_create() ;
ds_list_add(List,EC) ;
ds_list_add(List,Pre) ;

var Return = false ;

var i = 0 ;
do
    {
    Pre = Next ;
    if (ds_map_exists(Paths,Pre))
        {
        //Next = ds_map_find_value(Paths,Pre) ;
        Next = Paths[? Pre]
        }
    ds_list_add(List,Next) ;
    i++
    if (Pre == SC) 
        {
        Return = true;
        }
    }
until (Pre == SC)|| i > Const

ds_list_destroy(List) ;
return Return;