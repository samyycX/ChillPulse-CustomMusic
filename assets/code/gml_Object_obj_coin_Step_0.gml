if (obj_controller.page_customization == 1 && obj_controller.current_page_deco == 2)
{
    if (x < 300)
    {
        x = random_range(400, 526)
        y = random_range(150, 260)
    }
}
else if (x > 300)
{
    x = random_range(70, 124)
    y = random_range(277, 314)
}
if (obj_controller.page_customization == 1 && obj_controller.current_page_deco == 2)
{
    image_xscale = 1.5
    image_yscale = image_xscale
    if collision_point(mouse_x, mouse_y, id, false, false)
    {
        instance_destroy()
        obj_controller.score_total++
        instance_create_depth(x, y, depth, obj_coin_break)
    }
}
else
{
    image_xscale = 0.75
    image_yscale = image_xscale
}
