direction = 190
mv_speed = 0.02
relative_x += lengthdir_x(mv_speed, direction)
relative_y += lengthdir_y(mv_speed, direction)
x = obj_camera.x + relative_x
y = obj_camera.y + relative_y + 50
if (x < 100)
{
    instance_destroy()
    instance_create_layer(start_x, start_y, "PLANET", obj_planet)
}
