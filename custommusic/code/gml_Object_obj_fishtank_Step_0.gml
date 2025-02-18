image_index = obj_controller.current_scene
if (idle_state() == true)
{
    if collision_point(mouse_x, mouse_y, id, false, false)
    {
        if mouse_check_button_pressed(mb_left)
        {
            obj_controller.page_customization = 1
            obj_controller.current_page_deco = 2
            obj_controller.alarm[2] = 2
        }
    }
}
