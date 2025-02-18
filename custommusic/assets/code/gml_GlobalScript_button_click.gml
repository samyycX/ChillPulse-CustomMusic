function button_click(argument0, argument1, argument2, argument3) //gml_Script_button_click
{
    var mx_gui = device_mouse_x_to_gui(0)
    var my_gui = device_mouse_y_to_gui(0)
    if (mx_gui >= argument0 && my_gui >= argument1 && mx_gui <= argument2 && my_gui <= argument3 && mouse_check_button_pressed(mb_left))
        return true;
}

function button_collision(argument0, argument1, argument2, argument3) //gml_Script_button_collision
{
    mx_gui = device_mouse_x_to_gui(0)
    my_gui = device_mouse_y_to_gui(0)
    if (mx_gui >= argument0 && my_gui >= argument1 && mx_gui <= argument2 && my_gui <= argument3)
        return true;
}

