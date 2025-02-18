x = obj_camera.x - relative_x
yreal += random_range(0.4, 0.6)
y = obj_camera.y - relative_y + yreal
if (y > 250)
    instance_destroy()
