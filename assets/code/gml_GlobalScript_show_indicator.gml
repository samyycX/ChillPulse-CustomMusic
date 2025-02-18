function show_indicator(argument0, argument1, argument2) //gml_Script_show_indicator
{
    if (argument1 == undefined)
        argument1 = "bot"
    if (argument2 == undefined)
        argument2 = "left"
    var mx_gui = device_mouse_x_to_gui(0)
    var my_gui = device_mouse_y_to_gui(0)
    var str_length = string_width(argument0) * 0.3
    if (argument1 == "top")
    {
        draw_rectangle_color((mx_gui - 20 - str_length - 40), (my_gui - 25), (mx_gui - 20), (my_gui - 45), c_black, c_black, c_black, c_black, false)
        draw_set_valign(fa_bottom)
        draw_set_halign(fa_right)
        draw_text_ext_transformed_color((mx_gui - 40), (my_gui - 25), argument0, -1, 1500, 0.3, 0.3, 0, 16777215, 16777215, 16777215, 16777215, 1)
    }
    else if (argument1 == "bot")
    {
        draw_rectangle_color((mx_gui - 20 - str_length - 40), (my_gui + 25), (mx_gui - 20), (my_gui + 55), c_black, c_black, c_black, c_black, false)
        draw_set_valign(fa_top)
        draw_set_halign(fa_right)
        draw_text_ext_transformed_color((mx_gui - 40), (my_gui + 25), argument0, -1, 1500, 0.3, 0.3, 0, 16777215, 16777215, 16777215, 16777215, 1)
    }
}

