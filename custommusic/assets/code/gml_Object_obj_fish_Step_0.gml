experience = min(108000, (experience + 1))
if (experience >= 108000)
    scale = 1
if (obj_controller.page_customization == 1 && obj_controller.current_page_deco == 2)
{
    if (x < 300)
    {
        x = random_range(400, 526)
        y = random_range(150, 260)
        target_x = random_range(400, 526)
        target_y = random_range(150, 260)
        spd = random_range(0.2, 0.5)
    }
}
else if (x > 300)
{
    x = random_range(70, 124)
    y = random_range(277, 314)
    target_x = random_range(70, 124)
    target_y = random_range(277, 314)
    spd = random_range(0.05, 0.2)
}
switch state
{
    case "idle":
        if (point_distance(x, y, target_x, target_y) < 1)
        {
            if (x < 300)
            {
                target_x = random_range(70, 124)
                target_y = random_range(277, 314)
                spd = random_range(0.1, 0.3)
            }
            else
            {
                target_x = random_range(400, 526)
                target_y = random_range(150, 260)
                spd = random_range(0.3, 0.7)
            }
        }
        else
            move_towards_point(target_x, target_y, spd)
        if (x > 300)
        {
            if (collision_circle(x, y, 50, obj_fish_food, false, false) && scale < 1)
            {
                state = "chase"
                target = instance_nearest(x, y, obj_fish_food)
                spd = random_range(0.5, 0.8)
            }
        }
        break
    case "chase":
        if instance_exists(target)
        {
            move_towards_point(target.x, target.y, spd)
            if place_meeting(x, y, target)
            {
                with (target)
                    instance_destroy()
                experience += 1200
            }
        }
        else
        {
            if (x < 300)
            {
                target_x = random_range(70, 124)
                target_y = random_range(277, 314)
                spd = random_range(0.1, 0.3)
            }
            else
            {
                target_x = random_range(400, 526)
                target_y = random_range(150, 260)
                spd = random_range(0.3, 0.7)
            }
            state = "idle"
        }
        break
}

if (collision_point(mouse_x, mouse_y, id, false, false) && mouse_check_button_pressed(mb_left))
{
    obj_controller.fish_detail = true
    obj_controller.current_fish = id
}
