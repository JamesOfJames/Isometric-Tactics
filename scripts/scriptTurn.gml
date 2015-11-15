// Not yet at the stopping point
if PathPoint < path_get_number(Path) - 1
{var x1, y1, x2, y2;
 x1 = path_get_point_x(Path, PathPoint);
 y1 = path_get_point_y(Path, PathPoint);
 x2 = path_get_point_x(Path, PathPoint + 1);
 y2 = path_get_point_y(Path, PathPoint + 1);
 
 NextDirection = point_direction(x1, y1, x2, y2);
 if image_angle == NextDirection
 {timer[1] = StepTimer;}
 else
 {image_angle = NextDirection;
  timer[0] = TurnTimer;}
}
