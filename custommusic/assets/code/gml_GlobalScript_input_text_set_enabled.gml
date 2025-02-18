function input_text_set_enabled(argument0, argument1) //gml_Script_input_text_set_enabled
{
    if argument1
    {
        if (!argument0.enabled)
        {
            with (obj_input_text)
            {
                enabled = false
                selection_start = 0
            }
            with (argument0)
            {
                enabled = true
                enabled_step = 0
                keyboard_string = ""
                cursor_timer = cursor_time
                key_pressed_timer = -1
                key_down = -1
                event_perform(ev_step, ev_step_normal)
            }
        }
    }
    else if argument0.enabled
    {
        with (argument0)
        {
            enabled = false
            selection_start = 0
        }
    }
}

