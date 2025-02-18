function input_text_set_misc(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9) //gml_Script_input_text_set_misc
{
    with (argument0)
    {
        clipboard_pasting_enabled = argument1
        cursor = argument2
        cursor_scale = char_height / sprite_get_height(cursor)
        cursor_style = argument3
        max_undo_redo_states = argument4
        selection_color_background = argument5
        selection_alpha_background = argument6
        selection_color_text = argument7
        selection_alpha_text = argument8
        update_surfaces = true
        shaders = argument9
        selection_red_text = color_get_red(selection_color_text) / 255
        selection_green_text = color_get_green(selection_color_text) / 255
        selection_blue_text = color_get_blue(selection_color_text) / 255
        selection_red_background = color_get_red(selection_color_background) / 255
        selection_green_background = color_get_green(selection_color_background) / 255
        selection_blue_background = color_get_blue(selection_color_background) / 255
    }
}

