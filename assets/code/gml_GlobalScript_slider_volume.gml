function slider_volume(argument0, argument1, argument2, argument3) //gml_Script_slider_volume
{
    if (argument3 == undefined)
        argument3 = ""
    var mc_click = mouse_check_button_pressed(mb_left)
    var mx_gui = device_mouse_x_to_gui(0)
    var my_gui = device_mouse_y_to_gui(0)
    draw_set_color(c_dkgray)
    draw_line_width(argument0, 580, argument0, 510, 3)
    draw_set_color(c_white)
    var slider_w = 10
    var slider_h = 10
    if button_collision((argument0 - slider_w), (510 - slider_h / 2), (argument0 + slider_w), (580 + slider_h / 2))
    {
        if mc_click
            argument2 = true
    }
    if (argument2 == true)
    {
        argument1 = my_gui + slider_h / 2 - 580
        argument1 = clamp(argument1, -65, 0)
        if mouse_check_button_released(mb_left)
            argument2 = false
    }
    draw_rectangle((argument0 - slider_w), (argument1 + 580), (argument0 + slider_w), (argument1 + 580 - slider_h), false)
    var volume = argument1 / 65
    if (argument3 == "wind")
        audio_sound_gain(sd_wind, (-volume), 10)
    if (argument3 == "bird")
        audio_sound_gain(sd_bird, (-volume), 10)
    if (argument3 == "rain")
        audio_sound_gain(sd_rain, (-volume), 10)
    if (argument3 == "fire")
        audio_sound_gain(sd_fire, (-volume), 10)
    return [argument1, argument2];
}

