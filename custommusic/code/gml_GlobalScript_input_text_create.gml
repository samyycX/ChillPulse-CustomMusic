function input_text_create(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10, argument11, argument12, argument13, argument14, argument15) //gml_Script_input_text_create
{
    var instance = instance_create(argument1, argument2, obj_input_text)
    with (instance)
    {
        multiline = argument0
        width = argument3
        height = argument4
        font = argument5
        color = argument6
        alpha = argument7
        wrapping_width = argument8
        max_length = argument9
        max_lines = argument10
        line_separation = argument11
        h_align = argument12
        v_align = argument13
        selection_enabled = argument14
        fit_style = argument15
        enabled = 0
        enabled_previous = 0
        sf_main = -1
        update_surfaces = false
        cursor_style = 0
        cursor_time = 700000
        cursor_position = 1
        cursor_position_previous = cursor_position
        action_previous = 8
        text = ""
        draw_set_font(font)
        char_height = string_height(" ")
        eoln_width = 6
        cursor = spr_input_text_cursor_default
        cursor_scale = char_height / sprite_get_height(cursor)
        if (line_separation == -1)
            line_separation = char_height
        if ((!multiline) && height == -1)
            height = char_height
        clipboard_pasting_enabled = true
        if (os_type != os_windows && true)
            global.clipboard_local = ""
        global_scale_x = 1
        global_scale_y = 1
        local_scale_x = 1
        local_scale_y = 1
        transformation_was_changed = false
        offset_x = 0
        offset_y = 0
        origin_x = 0
        if (h_align == 1)
            origin_x += (width >> 1)
        else if (h_align == 2)
            origin_x += width
        origin_y = 0
        if (v_align == 1)
            origin_y += (height >> 1)
        else if (v_align == 2)
            origin_y += height
        matrix_identity = matrix_build(0, 0, 0, 0, 0, 0, 1, 1, 1)
        if (fit_style == 0)
            matrix_local = matrix_build(origin_x, origin_y, 0, 0, 0, 0, 1, 1, 1)
        matrix_global = matrix_build(x, y, 0, 0, 0, 0, 1, 1, 1)
        matrix_cursor = matrix_global
        draw_rectangle_add = 0
        shaders = true
        max_undo_redo_states = 32
        undo_redo_text_list = ds_list_create()
        undo_redo_cursor_position_list = ds_list_create()
        undo_redo_position = 0
        if multiline
        {
            new_line_list = ds_list_create()
            new_line_offset = 0
        }
        if selection_enabled
        {
            sf_selection = -1
            selection_start = 0
            selection_end = 0
            selection_color_background = 0
            selection_alpha_background = 0.6
            selection_color_text = 16777215
            selection_alpha_text = 1
            m_x_previous = 0
            m_y_previous = 0
            double_click_time = 500000
            mouse_pressed_previous = (-double_click_time)
            uniform_sf_selection = shader_get_sampler_index(sh_input_text_selection, "sf_selection")
            uniform_selection_color_text = shader_get_uniform(sh_input_text_selection, "selection_color_text")
            uniform_selection_color_background = shader_get_uniform(sh_input_text_selection, "selection_color_background")
            uniform_alpha = shader_get_uniform(sh_input_text_selection, "alpha")
            selection_red_text = color_get_red(selection_color_text) / 255
            selection_green_text = color_get_green(selection_color_text) / 255
            selection_blue_text = color_get_blue(selection_color_text) / 255
            selection_red_background = color_get_red(selection_color_background) / 255
            selection_green_background = color_get_green(selection_color_background) / 255
            selection_blue_background = color_get_blue(selection_color_background) / 255
        }
        input_text_set_text(id, "")
    }
    return instance;
}

