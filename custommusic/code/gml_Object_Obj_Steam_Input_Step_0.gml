var _temp_local_var_2;
steam_input_run_frame()
controllers = steam_input_get_connected_controllers()
self.update_handles()
var i = 0
var _temp_local_var_2 = gamepad_get_device_count()
if (gamepad_get_device_count() <= 0)
{
}
else
{
    while (true)
    {
        if gamepad_button_check_pressed(i++, gp_face4)
        {
            show_debug_message("floating show result = " + string(self.showFloatingKeyboard()))
            break
        }
        else
        {
            var _temp_local_var_2 = (gamepad_get_device_count() - 1)
            if (gamepad_get_device_count() - 1)
                continue
        }
    }
}
if mouse_check_button_pressed(mb_right)
{
    window_set_cursor(cr_beam)
    show_debug_message("floating show result = " + string(self.showFloatingKeyboard()))
    gc_collect()
}
