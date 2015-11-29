///ds_list_print_to_console("Header" , "Footer" , List) 

var L = argument2 ;
var Size = ds_list_size(L) ;
var Spacer = chr(13) + chr(13) ;
show_debug_message(string(argument0)) ;
show_debug_message(Spacer) ;

for(var i = 0 ; i < Size ; i++)
    {
    show_debug_message(ds_list_find_value(L,i)) ;
    }
show_debug_message(Spacer) ;
show_debug_message(argument1) ;
