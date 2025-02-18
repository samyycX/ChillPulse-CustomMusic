function input_text_set_text(argument0, argument1) //gml_Script_input_text_set_text
{
    with (argument0)
    {
        text_change_from_outside = string_replace_all(argument1, "\r", "")
        event_perform(ev_step, ev_step_normal)
    }
}

