if (obj_controller.page_customization == 1 && obj_controller.current_page_deco == 2)
{
    draw_set_alpha(0.6)
    draw_rectangle_color(243.33333333333334, 0, room_width, room_height, c_black, c_black, c_black, c_black, false)
    draw_set_alpha(1)
    draw_sprite_ext(sprite_index, obj_controller.current_scene, (room_width / 2 + 100), (room_height / 2 - 20), 2, 2, 0, c_white, 1)
}
else
    draw_self()
