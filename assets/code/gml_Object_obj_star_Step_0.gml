direction = point_direction((room_width / 2), (room_height / 2), x, y)
mv_speed = 0.1
relative_x += lengthdir_x(mv_speed, direction)
relative_y += lengthdir_y(mv_speed, direction)
x = obj_camera.x + relative_x
y = obj_camera.y + relative_y
if (x < (room_width / 4) || x > (room_width * 2 / 3) || y > (room_height * 2 / 3))
    instance_destroy()
