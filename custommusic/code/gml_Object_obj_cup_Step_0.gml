sprite_index = spr_list[obj_controller.current_scene]
if ((!obj_controller.page_customization) && (!obj_controller.page_scene) && (!obj_controller.page_phone) && (!obj_controller.page_diary) && (!obj_controller.page_stickynotes) && obj_controller.show_ui == 1 && obj_controller.mode_focus == false && obj_controller.page_mail == -1 && idle_state() == true)
{
    if collision_point(mouse_x, mouse_y, id, false, false)
    {
        if mouse_check_button_pressed(mb_left)
            obj_controller.page_drink = 1
    }
}
