var texfilter_previous = gpu_get_texfilter()
gpu_set_texfilter(true)
if ((!surface_exists(sf_main)) || (selection_enabled && (!surface_exists(sf_selection))))
    update_surfaces = true
if update_surfaces
{
    update_surfaces = false
    draw_set_font(font)
    matrix_set(2, matrix_local)
    if selection_enabled
    {
        if (!surface_exists(sf_selection))
            sf_selection = surface_create((width + eoln_width), height)
        if (selection_start != 0)
        {
            surface_set_target(sf_selection)
            draw_clear_alpha(c_black, 0)
            draw_set_color(c_white)
            var cover_x = -1 + draw_rectangle_add
            var cover_y = (max(line_separation, char_height)) - 1 + draw_rectangle_add
            for (var i = selection_start_line_ordered; i <= selection_end_line_ordered; i++)
            {
                if multiline
                {
                    var line_width = string_width(string_copy(text, ((ds_list_find_value(new_line_list, i)) + 1), ((ds_list_find_value(new_line_list, (i + 1))) - (ds_list_find_value(new_line_list, i)))))
                    if (i == selection_start_line_ordered)
                    {
                        var first = selection_start_ordered
                        var selection_start_x = string_width(string_copy(text, ((ds_list_find_value(new_line_list, i)) + 1), (first - (ds_list_find_value(new_line_list, i)) - 1)))
                    }
                    else
                    {
                        first = (ds_list_find_value(new_line_list, i)) + 1
                        selection_start_x = 0
                    }
                }
                else
                {
                    line_width = text_width
                    first = selection_start_ordered
                    selection_start_x = string_width(string_copy(text, 1, (first - 1)))
                }
                selection_start_x += offset_x
                if (h_align == fa_center)
                    selection_start_x -= (line_width >> 1)
                else if (h_align == fa_right)
                    selection_start_x -= line_width
                if (i == selection_end_line_ordered)
                    var last = selection_end_ordered - 1
                else
                    last = ds_list_find_value(new_line_list, (i + 1))
                if (i == selection_start_line_ordered || i == selection_end_line_ordered)
                    var selection_end_x = selection_start_x + (string_width(string_copy(text, first, (last - first + 1))))
                else
                    selection_end_x = selection_start_x + line_width
                if (i < selection_end_line_ordered && string_char_at(text, last) == "\n")
                    selection_end_x += eoln_width
                if (selection_start_x != selection_end_x)
                {
                    var selection_start_y = offset_y + v_align_offset + line_separation * i
                    draw_rectangle(selection_start_x, selection_start_y, (selection_end_x + cover_x), (selection_start_y + cover_y), false)
                }
            }
            surface_reset_target()
        }
    }
    if (!surface_exists(sf_main))
        sf_main = surface_create((width + eoln_width), height)
    surface_set_target(sf_main)
    draw_enable_alphablend(false)
    draw_set_alpha_test(true)
    draw_set_alpha_test_ref_value(0)
    draw_clear_alpha(c_black, 0)
    draw_set_halign(h_align)
    draw_set_valign(fa_top)
    draw_set_color(color)
    draw_set_alpha(alpha)
    draw_text_ext(offset_x, (offset_y + v_align_offset), text_draw, line_separation, -1)
    draw_set_alpha(1)
    draw_set_alpha_test(false)
    draw_enable_alphablend(true)
    surface_reset_target()
}
matrix_set(2, matrix_global)
if (selection_enabled && selection_start != 0)
{
    if shaders
    {
        shader_set(sh_input_text_selection)
        texture_set_stage(uniform_sf_selection, surface_get_texture(sf_selection))
        shader_set_uniform_f(uniform_selection_color_text, selection_red_text, selection_green_text, selection_blue_text, selection_alpha_text)
        shader_set_uniform_f(uniform_selection_color_background, selection_red_background, selection_green_background, selection_blue_background, selection_alpha_background)
        shader_set_uniform_f(uniform_alpha, alpha)
        draw_surface(sf_selection, (-origin_x), (-origin_y))
    }
    else
        draw_surface_ext(sf_selection, (-origin_x), (-origin_y), 1, 1, 0, selection_color_background, selection_alpha_background)
}
draw_surface(sf_main, (-origin_x), (-origin_y))
if (shaders && selection_enabled && selection_start != 0)
    shader_reset()
if (enabled && ((!selection_enabled) || selection_start == 0))
{
    switch cursor_style
    {
        case 0:
            var cursor_alpha = cursor_timer > 0
            break
        case 1:
            cursor_alpha = sqr(max(0, (cursor_timer / cursor_time + 0.5)))
            break
        case 2:
            cursor_alpha = sqr(abs(cursor_timer / cursor_time))
            break
    }

    if (cursor_alpha > 0)
    {
        matrix_set(2, matrix_cursor)
        draw_sprite_ext(cursor, 0, cursor_offset_x, cursor_offset_y, cursor_scale, cursor_scale, 0, color, cursor_alpha)
    }
}
matrix_set(2, matrix_identity)
gpu_set_texfilter(texfilter_previous)
