if (debug_mode == true)
{
    draw_text_transformed(device_mouse_x_to_gui(0), (device_mouse_y_to_gui(0) - 30), device_mouse_x_to_gui(0), 0.25, 0.25, 0)
    draw_text_transformed((device_mouse_x_to_gui(0) + 50), (device_mouse_y_to_gui(0) - 30), device_mouse_y_to_gui(0), 0.25, 0.25, 0)
    draw_text_transformed(device_mouse_x_to_gui(0), (device_mouse_y_to_gui(0) + 30), mouse_x, 0.25, 0.25, 0)
    draw_text_transformed((device_mouse_x_to_gui(0) + 50), (device_mouse_y_to_gui(0) + 30), mouse_y, 0.25, 0.25, 0)
}
var mx = device_mouse_x_to_gui(0)
var my = device_mouse_y_to_gui(0)
count_immobile += 1
if (mouse_x != mouse_x_before || mouse_y != mouse_y_before)
{
    mouse_x_before = mouse_x
    mouse_y_before = mouse_y
    count_immobile = 0
}
if (count_immobile <= (game_get_speed(gamespeed_fps) * 5))
    draw_sprite_ext(spr_cursor, 0, mx, my, 0.35, 0.35, 0, c_white, 1)
