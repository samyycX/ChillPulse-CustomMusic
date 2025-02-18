if (obj_controller.current_scene != 6)
{
    if (lightning == true)
    {
        draw_set_alpha(lightning_alpha)
        draw_rectangle(0, 0, room_width, room_height, false)
        draw_set_alpha(1)
        if (count_lightning_time == 0)
            lightning_alpha -= (1/30)
        else
            lightning_alpha -= 0.022222222222222223
        if (lightning_alpha <= 0)
        {
            if (count_lightning_time >= 1)
            {
                count_lightning_time = 0
                lightning = false
            }
            else
                count_lightning_time += 1
            lightning_alpha = 1
        }
    }
}
