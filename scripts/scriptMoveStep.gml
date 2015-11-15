// Not yet at the stopping point
if PathPoint < path_get_number(Path) - 1
{PathPoint += 1;
 x = path_get_point_x(Path, PathPoint);
 y = path_get_point_y(Path, PathPoint);
 event_user(0); // Recenter view on Character
 
 script_execute(scriptMoveTurn);}
