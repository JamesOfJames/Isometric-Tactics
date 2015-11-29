///heuristic(Graph,A,B)
/*
** Returns the manhattan distance between the two given cells from a given graph.
**
**
*/
var Graph = argument0 ;
var X,Y ;
X[0] = path_finder_grid_cell_get_x(Graph,argument1) ;
Y[0] = path_finder_grid_cell_get_y(Graph,argument1) ;
X[1] = path_finder_grid_cell_get_x(Graph,argument2) ;
Y[1] = path_finder_grid_cell_get_y(Graph,argument2) ;

return abs(X[0] - X[1]) + abs(Y[0] - Y[1]) ;
