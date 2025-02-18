var _temp_local_var_5, _temp_local_var_50;
var mx = device_mouse_x_to_gui(0)
var my = device_mouse_y_to_gui(0)
var activated = false
if (mx >= (display_get_gui_width() / 2) && obj_controller.current_diary_page == 2 && obj_controller.state_diary == "list")
    activated = true
if enabled
{
    key_pressed = 0
    if keyboard_check_pressed(vk_anykey)
    {
        key_pressed_timer = 380000
        key_down = keyboard_key
        key_pressed = key_down
    }
    else
    {
        key_pressed_timer -= delta_time
        if (key_pressed_timer <= 0)
        {
            key_pressed_timer = 26000
            if keyboard_check(key_down)
                key_pressed = key_down
        }
    }
    var m_x = device_mouse_x_to_gui(0) - x
    var m_y = device_mouse_y_to_gui(0) - y
    if (image_angle != 0)
    {
        var t_x = m_x
        var t_y = m_y
        m_x = (lengthdir_x(t_x, image_angle)) + (lengthdir_y(t_y, image_angle))
        m_y = (lengthdir_x(t_y, image_angle)) - (lengthdir_y(t_x, image_angle))
    }
    if (image_xscale == 0)
        m_x = 0
    else
        m_x /= image_xscale
    if (image_yscale == 0)
        m_y = 0
    else
        m_y /= image_yscale
}
draw_set_font(font)
var cursor_stay_visible = false
var add_to_text = ""
var action = 0
if (max_undo_redo_states != 0)
    var text_previous = text
if selection_enabled
    var selection_update = false
while true
{
    if is_string(text_change_from_outside)
    {
        text = text_change_from_outside
        text_change_from_outside = false
        cursor_position = string_length(text) + 1
        if selection_enabled
            selection_start = 0
        cursor_stay_visible = true
        action = 8
        break
    }
    else if transformation_was_changed
    {
        transformation_was_changed = false
        action = 9
        break
    }
    else if (!enabled)
        break
    else if (selection_enabled && selection_start != 0 && keyboard_check(vk_control))
    {
        if (key_pressed == 67 || key_pressed == 88)
        {
            var s = string_copy(text, selection_start_ordered, (selection_end_ordered - selection_start_ordered))
            if (os_type == os_windows && true)
                clipboard_set_text(s)
            else
                global.clipboard_local = s
            if (key_pressed == 88)
            {
                action = 6
                break
            }
            else if (max_undo_redo_states != 0 && keyboard_check(vk_control))
            {
                if (((keyboard_check(vk_shift) && key_pressed == 90) || key_pressed == 89) && undo_redo_position < (ds_list_size(undo_redo_text_list) - 1))
                {
                    undo_redo_position++
                    text = ds_list_find_value(undo_redo_text_list, undo_redo_position)
                    cursor_position = ds_list_find_value(undo_redo_cursor_position_list, undo_redo_position)
                    if selection_enabled
                        selection_start = 0
                    cursor_stay_visible = true
                    action = 5
                    break
                }
                else if ((!keyboard_check(vk_shift)) && key_pressed == 90 && undo_redo_position > 0)
                {
                    undo_redo_position--
                    text = ds_list_find_value(undo_redo_text_list, undo_redo_position)
                    cursor_position = ds_list_find_value(undo_redo_cursor_position_list, undo_redo_position)
                    if selection_enabled
                        selection_start = 0
                    cursor_stay_visible = true
                    action = 5
                    break
                }
                else if (selection_enabled && keyboard_check(vk_control) && key_pressed == 65)
                {
                    selection_start = 1
                    cursor_position = string_length(text) + 1
                    selection_update = true
                    action = 3
                    break
                }
                else if (mouse_check_button_pressed(mb_left) || (selection_enabled && mouse_check_button(mb_left) && (m_x != m_x_previous || m_y != m_y_previous)) || (multiline && ((mouse_wheel_up() && activated) || (mouse_wheel_down() && activated) || key_pressed == 38 || key_pressed == 40 || key_pressed == 33 || key_pressed == 34)))
                {
                    if selection_enabled
                    {
                        var double_clicked = false
                        if mouse_check_button_pressed(mb_left)
                        {
                            double_clicked = (enabled_step > 1 && selection_start == 0 && m_x == m_x_previous && m_y == m_y_previous && (get_timer() - mouse_pressed_previous) < double_click_time && (string_lettersdigits_universal(string_char_at(text, cursor_position)) != "" || string_lettersdigits_universal(string_char_at(text, (cursor_position - 1))) != ""))
                            mouse_pressed_previous = get_timer()
                        }
                    }
                    if (selection_enabled && double_clicked)
                    {
                        mouse_clear(mb_left)
                        if (multiline && cursor_position < 0)
                            cursor_position = (-cursor_position) + 1
                        selection_start = cursor_position
                        while true
                        {
                            var char = string_char_at(text, selection_start)
                            if (selection_start == 1)
                                var char_before = ""
                            else
                                char_before = string_char_at(text, (selection_start - 1))
                            if (string_lettersdigits_universal(char) != "" && string_lettersdigits_universal(char_before) == "")
                                break
                            else
                            {
                                selection_start--
                                if (selection_start <= 1)
                                    break
                                else
                                    continue
                            }
                        }
                        while true
                        {
                            char = string_char_at(text, cursor_position)
                            if (cursor_position == 1)
                                char_before = ""
                            else
                                char_before = string_char_at(text, (cursor_position - 1))
                            if (string_lettersdigits_universal(char) == "" && string_lettersdigits_universal(char_before) != "")
                                break
                            else
                            {
                                cursor_position++
                                if (cursor_position > string_length(text))
                                    break
                                else
                                    continue
                            }
                        }
                        selection_update = true
                    }
                    else
                    {
                        var searched_width = 0
                        var smallest = -1
                        if multiline
                        {
                            if (key_pressed == 38 || mouse_wheel_up())
                            {
                                var line = cursor_line - 1
                                if keyboard_check(vk_control)
                                {
                                    while (line > 0)
                                    {
                                        if (((ds_list_find_value(new_line_list, line)) - 1) == ds_list_find_value(new_line_list, (line - 1)) && cursor_position != ((ds_list_find_value(new_line_list, line)) + 1) && string_char_at(text, ((ds_list_find_value(new_line_list, line)) + 1)) != "\n")
                                            break
                                        else
                                        {
                                            line--
                                            continue
                                        }
                                    }
                                }
                            }
                            else if (key_pressed == 40 || mouse_wheel_down())
                            {
                                line = cursor_line + 1
                                if keyboard_check(vk_control)
                                {
                                    while (line < (lines - 1))
                                    {
                                        if (((ds_list_find_value(new_line_list, line)) - 1) == ds_list_find_value(new_line_list, (line - 1)) && string_char_at(text, ((ds_list_find_value(new_line_list, line)) + 1)) != "\n")
                                            break
                                        else
                                        {
                                            line++
                                            continue
                                        }
                                    }
                                }
                            }
                            else if (key_pressed == 33)
                            {
                                if keyboard_check(vk_control)
                                {
                                    if (v_align == 0)
                                        line = ceil((-offset_y) / line_separation)
                                    else if (v_align == 2)
                                        line = ceil(lines - (offset_y + height) / line_separation)
                                    else
                                        line = ceil(lines * 0.5 - (height * 0.5 + offset_y) / line_separation)
                                }
                                else
                                {
                                    line = cursor_line - (height div line_separation)
                                    offset_y += ((height div line_separation) * line_separation)
                                }
                            }
                            else if (key_pressed == 34)
                            {
                                if keyboard_check(vk_control)
                                {
                                    if (v_align == 0)
                                        line = floor((height - offset_y) / line_separation - 1)
                                    else if (v_align == 2)
                                        line = floor(lines - offset_y / line_separation - 1)
                                    else
                                        line = floor(lines * 0.5 + (height * 0.5 - offset_y) / line_separation - 1)
                                }
                                else
                                {
                                    line = cursor_line + (height div line_separation)
                                    offset_y -= ((height div line_separation) * line_separation)
                                }
                            }
                            else
                                line = (m_y - offset_y - v_align_offset) div line_separation
                            line = clamp(line, 0, (lines - 1))
                            my_current_line = line
                            cursor_position = (ds_list_find_value(new_line_list, line)) + 1
                            var last_index = (min(ds_list_find_value(new_line_list, (line + 1)), string_length(text))) + 1
                            show_debug_message(new_line_list)
                            var line_width = string_width(string_copy(text, cursor_position, (last_index - cursor_position)))
                        }
                        else
                        {
                            cursor_position = 1
                            last_index = string_length(text) + 1
                            line_width = text_width
                        }
                        if (multiline && (key_pressed == 38 || key_pressed == 40 || mouse_wheel_down() || mouse_wheel_up()))
                        {
                            if keyboard_check(vk_control)
                                var target_width = (-line_width)
                            else
                                target_width = cursor_offset_x - offset_x
                        }
                        else if (multiline && (key_pressed == 33 || key_pressed == 34))
                            target_width = cursor_offset_x - offset_x
                        else
                            target_width = m_x - offset_x
                        if (h_align == 1)
                            target_width += (line_width >> 1)
                        else if (h_align == 2)
                            target_width += line_width
                        if (target_width > 0)
                        {
                            while true
                            {
                                if (smallest == -1 || abs(target_width - searched_width) <= smallest)
                                {
                                    smallest = abs(target_width - searched_width)
                                    if (cursor_position == last_index)
                                        break
                                    else
                                    {
                                        searched_width += string_width(string_char_at(text, cursor_position))
                                        cursor_position++
                                        continue
                                    }
                                }
                                else
                                {
                                    cursor_position--
                                    break
                                }
                            }
                        }
                        if (multiline && cursor_position == last_index && (cursor_position - 1) < string_length(text))
                        {
                            cursor_position--
                            if (string_char_at(text, cursor_position) != "\n")
                                cursor_position *= -1
                        }
                    }
                    m_x_previous = m_x
                    m_y_previous = m_y
                    action = 3
                    break
                }
                else if (clipboard_pasting_enabled && keyboard_check(vk_control) && key_pressed == 86 && ((os_type != os_windows && true && global.clipboard_local != "") || clipboard_has_text()))
                {
                    if (os_type == os_windows && true)
                        s = clipboard_get_text()
                    else
                        s = global.clipboard_local
                    add_to_text = string_replace_all(s, "\r", "")
                    if (!multiline)
                        add_to_text = string_replace_all(add_to_text, "\n", "")
                    action = 7
                    break
                }
                else if (multiline && key_pressed == 13)
                {
                    add_to_text = "\n"
                    action = 4
                    break
                }
                else if (key_pressed == 46)
                {
                    if (selection_enabled && selection_start != 0)
                    {
                        action = 2
                        break
                    }
                    else if (cursor_position <= string_length(text))
                    {
                        var position = cursor_position
                        if keyboard_check(vk_control)
                        {
                            while (position <= string_length(text))
                            {
                                char = string_char_at(text, position)
                                var char_next = string_char_at(text, (position + 1))
                                if (char == "\n" || char_next == "\n" || (string_lettersdigits_universal(char) == "" && string_lettersdigits_universal(char_next) != ""))
                                    break
                                else
                                {
                                    position++
                                    continue
                                }
                            }
                        }
                        text = string_delete(text, cursor_position, (position - cursor_position + 1))
                        cursor_stay_visible = true
                        action = 2
                        break
                    }
                    else if (key_pressed == 8)
                    {
                        if (selection_enabled && selection_start != 0)
                        {
                            action = 2
                            break
                        }
                        else if (cursor_position > 1)
                        {
                            position = cursor_position - 1
                            if keyboard_check(vk_control)
                            {
                                while (position > 1)
                                {
                                    char = string_char_at(text, position)
                                    char_before = string_char_at(text, (position - 1))
                                    if (char == "\n" || char_before == "\n" || (string_lettersdigits_universal(char) != "" && string_lettersdigits_universal(char_before) == ""))
                                        break
                                    else
                                    {
                                        position--
                                        continue
                                    }
                                }
                            }
                            text = string_delete(text, position, (cursor_position - position))
                            cursor_position = position
                            action = 2
                            break
                        }
                        else if (key_pressed == 36)
                        {
                            if (multiline && (!keyboard_check(vk_control)))
                                cursor_position = (ds_list_find_value(new_line_list, cursor_line)) + 1
                            else
                                cursor_position = 1
                            action = 3
                            break
                        }
                        else if (key_pressed == 35)
                        {
                            if (multiline && (!keyboard_check(vk_control)))
                            {
                                cursor_position = ds_list_find_value(new_line_list, (cursor_line + 1))
                                if (cursor_position <= string_length(text) && string_char_at(text, cursor_position) != "\n")
                                    cursor_position *= -1
                            }
                            else
                                cursor_position = string_length(text) + 1
                            action = 3
                            break
                        }
                        else if (key_pressed == 39 || key_pressed == 37)
                        {
                            while (true)
                            {
                                if (key_pressed == 39)
                                {
                                    if (cursor_position > string_length(text))
                                    {
                                    }
                                    else
                                    {
                                        cursor_position++
                                        char = string_char_at(text, cursor_position)
                                        char_before = string_char_at(text, (cursor_position - 1))
                                        if ((!keyboard_check(vk_control)) || char == "\n" || char_before == "\n" || (string_lettersdigits_universal(char) != "" && string_lettersdigits_universal(char_before) == ""))
                                        {
                                        }
                                        else
                                            continue
                                    }
                                }
                                else if (cursor_position == 1)
                                {
                                }
                                else
                                {
                                    cursor_position--
                                    char = string_char_at(text, cursor_position)
                                    char_before = string_char_at(text, (cursor_position - 1))
                                    if ((!keyboard_check(vk_control)) || char == "\n" || char_before == "\n" || (string_lettersdigits_universal(char) != "" && string_lettersdigits_universal(char_before) == ""))
                                    {
                                    }
                                    else
                                        continue
                                }
                            }
                            action = 3
                            break
                        }
                        else
                        {
                            keyboard_string = string_replace_all(keyboard_string, "", "")
                            if (keyboard_string != "")
                            {
                                add_to_text = keyboard_string
                                action = 1
                                break
                            }
                            else
                                break
                        }
                    }
                    else if (key_pressed == 36)
                    {
                        if (multiline && (!keyboard_check(vk_control)))
                            cursor_position = (ds_list_find_value(new_line_list, cursor_line)) + 1
                        else
                            cursor_position = 1
                        action = 3
                        break
                    }
                    else if (key_pressed == 35)
                    {
                        if (multiline && (!keyboard_check(vk_control)))
                        {
                            cursor_position = ds_list_find_value(new_line_list, (cursor_line + 1))
                            if (cursor_position <= string_length(text) && string_char_at(text, cursor_position) != "\n")
                                cursor_position *= -1
                        }
                        else
                            cursor_position = string_length(text) + 1
                        action = 3
                        break
                    }
                    else if (key_pressed == 39 || key_pressed == 37)
                    {
                        while (true)
                        {
                            if (key_pressed == 39)
                            {
                                if (cursor_position > string_length(text))
                                {
                                }
                                else
                                {
                                    cursor_position++
                                    char = string_char_at(text, cursor_position)
                                    char_before = string_char_at(text, (cursor_position - 1))
                                    if ((!keyboard_check(vk_control)) || char == "\n" || char_before == "\n" || (string_lettersdigits_universal(char) != "" && string_lettersdigits_universal(char_before) == ""))
                                    {
                                    }
                                    else
                                        continue
                                }
                            }
                            else if (cursor_position == 1)
                            {
                            }
                            else
                            {
                                cursor_position--
                                char = string_char_at(text, cursor_position)
                                char_before = string_char_at(text, (cursor_position - 1))
                                if ((!keyboard_check(vk_control)) || char == "\n" || char_before == "\n" || (string_lettersdigits_universal(char) != "" && string_lettersdigits_universal(char_before) == ""))
                                {
                                }
                                else
                                    continue
                            }
                        }
                        action = 3
                        break
                    }
                    else
                    {
                        keyboard_string = string_replace_all(keyboard_string, "", "")
                        if (keyboard_string != "")
                        {
                            add_to_text = keyboard_string
                            action = 1
                            break
                        }
                        else
                            break
                    }
                }
                else if (key_pressed == 8)
                {
                    if (selection_enabled && selection_start != 0)
                    {
                        action = 2
                        break
                    }
                    else if (cursor_position > 1)
                    {
                        position = cursor_position - 1
                        if keyboard_check(vk_control)
                        {
                            while (position > 1)
                            {
                                char = string_char_at(text, position)
                                char_before = string_char_at(text, (position - 1))
                                if (char == "\n" || char_before == "\n" || (string_lettersdigits_universal(char) != "" && string_lettersdigits_universal(char_before) == ""))
                                    break
                                else
                                {
                                    position--
                                    continue
                                }
                            }
                        }
                        text = string_delete(text, position, (cursor_position - position))
                        cursor_position = position
                        action = 2
                        break
                    }
                    else if (key_pressed == 36)
                    {
                        if (multiline && (!keyboard_check(vk_control)))
                            cursor_position = (ds_list_find_value(new_line_list, cursor_line)) + 1
                        else
                            cursor_position = 1
                        action = 3
                        break
                    }
                    else if (key_pressed == 35)
                    {
                        if (multiline && (!keyboard_check(vk_control)))
                        {
                            cursor_position = ds_list_find_value(new_line_list, (cursor_line + 1))
                            if (cursor_position <= string_length(text) && string_char_at(text, cursor_position) != "\n")
                                cursor_position *= -1
                        }
                        else
                            cursor_position = string_length(text) + 1
                        action = 3
                        break
                    }
                    else if (key_pressed == 39 || key_pressed == 37)
                    {
                        while (true)
                        {
                            if (key_pressed == 39)
                            {
                                if (cursor_position > string_length(text))
                                {
                                }
                                else
                                {
                                    cursor_position++
                                    char = string_char_at(text, cursor_position)
                                    char_before = string_char_at(text, (cursor_position - 1))
                                    if ((!keyboard_check(vk_control)) || char == "\n" || char_before == "\n" || (string_lettersdigits_universal(char) != "" && string_lettersdigits_universal(char_before) == ""))
                                    {
                                    }
                                    else
                                        continue
                                }
                            }
                            else if (cursor_position == 1)
                            {
                            }
                            else
                            {
                                cursor_position--
                                char = string_char_at(text, cursor_position)
                                char_before = string_char_at(text, (cursor_position - 1))
                                if ((!keyboard_check(vk_control)) || char == "\n" || char_before == "\n" || (string_lettersdigits_universal(char) != "" && string_lettersdigits_universal(char_before) == ""))
                                {
                                }
                                else
                                    continue
                            }
                        }
                        action = 3
                        break
                    }
                    else
                    {
                        keyboard_string = string_replace_all(keyboard_string, "", "")
                        if (keyboard_string != "")
                        {
                            add_to_text = keyboard_string
                            action = 1
                            break
                        }
                        else
                            break
                    }
                }
                else if (key_pressed == 36)
                {
                    if (multiline && (!keyboard_check(vk_control)))
                        cursor_position = (ds_list_find_value(new_line_list, cursor_line)) + 1
                    else
                        cursor_position = 1
                    action = 3
                    break
                }
                else if (key_pressed == 35)
                {
                    if (multiline && (!keyboard_check(vk_control)))
                    {
                        cursor_position = ds_list_find_value(new_line_list, (cursor_line + 1))
                        if (cursor_position <= string_length(text) && string_char_at(text, cursor_position) != "\n")
                            cursor_position *= -1
                    }
                    else
                        cursor_position = string_length(text) + 1
                    action = 3
                    break
                }
                else if (key_pressed == 39 || key_pressed == 37)
                {
                    while (true)
                    {
                        if (key_pressed == 39)
                        {
                            if (cursor_position > string_length(text))
                            {
                            }
                            else
                            {
                                cursor_position++
                                char = string_char_at(text, cursor_position)
                                char_before = string_char_at(text, (cursor_position - 1))
                                if ((!keyboard_check(vk_control)) || char == "\n" || char_before == "\n" || (string_lettersdigits_universal(char) != "" && string_lettersdigits_universal(char_before) == ""))
                                {
                                }
                                else
                                    continue
                            }
                        }
                        else if (cursor_position == 1)
                        {
                        }
                        else
                        {
                            cursor_position--
                            char = string_char_at(text, cursor_position)
                            char_before = string_char_at(text, (cursor_position - 1))
                            if ((!keyboard_check(vk_control)) || char == "\n" || char_before == "\n" || (string_lettersdigits_universal(char) != "" && string_lettersdigits_universal(char_before) == ""))
                            {
                            }
                            else
                                continue
                        }
                    }
                    action = 3
                    break
                }
                else
                {
                    keyboard_string = string_replace_all(keyboard_string, "", "")
                    if (keyboard_string != "")
                    {
                        add_to_text = keyboard_string
                        action = 1
                        break
                    }
                    else
                        break
                }
            }
            else if (selection_enabled && keyboard_check(vk_control) && key_pressed == 65)
            {
                selection_start = 1
                cursor_position = string_length(text) + 1
                selection_update = true
                action = 3
                break
            }
            else if (mouse_check_button_pressed(mb_left) || (selection_enabled && mouse_check_button(mb_left) && (m_x != m_x_previous || m_y != m_y_previous)) || (multiline && ((mouse_wheel_up() && activated) || (mouse_wheel_down() && activated) || key_pressed == 38 || key_pressed == 40 || key_pressed == 33 || key_pressed == 34)))
            {
                if selection_enabled
                {
                    var double_clicked = false
                    if mouse_check_button_pressed(mb_left)
                    {
                        var _temp_local_var_50 = (enabled_step > 1 && selection_start == 0 && m_x == m_x_previous && m_y == m_y_previous && (get_timer() - mouse_pressed_previous) < double_click_time && (string_lettersdigits_universal(string_char_at(text, cursor_position)) != "" || string_lettersdigits_universal(string_char_at(text, (cursor_position - 1))) != ""))
                        double_clicked = (enabled_step > 1 && selection_start == 0 && m_x == m_x_previous && m_y == m_y_previous && (get_timer() - mouse_pressed_previous) < double_click_time && (string_lettersdigits_universal(string_char_at(text, cursor_position)) != "" || string_lettersdigits_universal(string_char_at(text, (cursor_position - 1))) != ""))
                        mouse_pressed_previous = get_timer()
                    }
                }
                if (selection_enabled && double_clicked)
                {
                    mouse_clear(mb_left)
                    if (multiline && cursor_position < 0)
                        cursor_position = (-cursor_position) + 1
                    selection_start = cursor_position
                    while true
                    {
                        var char = string_char_at(text, selection_start)
                        if (selection_start == 1)
                            var char_before = ""
                        else
                            char_before = string_char_at(text, (selection_start - 1))
                        if (string_lettersdigits_universal(char) != "" && string_lettersdigits_universal(char_before) == "")
                            break
                        else
                        {
                            selection_start--
                            if (selection_start <= 1)
                                break
                            else
                                continue
                        }
                    }
                    while true
                    {
                        char = string_char_at(text, cursor_position)
                        if (cursor_position == 1)
                            char_before = ""
                        else
                            char_before = string_char_at(text, (cursor_position - 1))
                        if (string_lettersdigits_universal(char) == "" && string_lettersdigits_universal(char_before) != "")
                            break
                        else
                        {
                            cursor_position++
                            if (cursor_position > string_length(text))
                                break
                            else
                                continue
                        }
                    }
                    selection_update = true
                }
                else
                {
                    var searched_width = 0
                    var smallest = -1
                    if multiline
                    {
                        if (key_pressed == 38 || mouse_wheel_up())
                        {
                            var line = cursor_line - 1
                            if keyboard_check(vk_control)
                            {
                                while (line > 0)
                                {
                                    if (((ds_list_find_value(new_line_list, line)) - 1) == ds_list_find_value(new_line_list, (line - 1)) && cursor_position != ((ds_list_find_value(new_line_list, line)) + 1) && string_char_at(text, ((ds_list_find_value(new_line_list, line)) + 1)) != "\n")
                                        break
                                    else
                                    {
                                        line--
                                        continue
                                    }
                                }
                            }
                        }
                        else if (key_pressed == 40 || mouse_wheel_down())
                        {
                            line = cursor_line + 1
                            if keyboard_check(vk_control)
                            {
                                while (line < (lines - 1))
                                {
                                    if (((ds_list_find_value(new_line_list, line)) - 1) == ds_list_find_value(new_line_list, (line - 1)) && string_char_at(text, ((ds_list_find_value(new_line_list, line)) + 1)) != "\n")
                                        break
                                    else
                                    {
                                        line++
                                        continue
                                    }
                                }
                            }
                        }
                        else if (key_pressed == 33)
                        {
                            if keyboard_check(vk_control)
                            {
                                if (v_align == 0)
                                    line = ceil((-offset_y) / line_separation)
                                else if (v_align == 2)
                                    line = ceil(lines - (offset_y + height) / line_separation)
                                else
                                    line = ceil(lines * 0.5 - (height * 0.5 + offset_y) / line_separation)
                            }
                            else
                            {
                                line = cursor_line - (height div line_separation)
                                offset_y += ((height div line_separation) * line_separation)
                            }
                        }
                        else if (key_pressed == 34)
                        {
                            if keyboard_check(vk_control)
                            {
                                if (v_align == 0)
                                    line = floor((height - offset_y) / line_separation - 1)
                                else if (v_align == 2)
                                    line = floor(lines - offset_y / line_separation - 1)
                                else
                                    line = floor(lines * 0.5 + (height * 0.5 - offset_y) / line_separation - 1)
                            }
                            else
                            {
                                line = cursor_line + (height div line_separation)
                                offset_y -= ((height div line_separation) * line_separation)
                            }
                        }
                        else
                            line = (m_y - offset_y - v_align_offset) div line_separation
                        line = clamp(line, 0, (lines - 1))
                        my_current_line = line
                        cursor_position = (ds_list_find_value(new_line_list, line)) + 1
                        var last_index = (min(ds_list_find_value(new_line_list, (line + 1)), string_length(text))) + 1
                        show_debug_message(new_line_list)
                        var line_width = string_width(string_copy(text, cursor_position, (last_index - cursor_position)))
                    }
                    else
                    {
                        cursor_position = 1
                        last_index = string_length(text) + 1
                        line_width = text_width
                    }
                    if (multiline && (key_pressed == 38 || key_pressed == 40 || mouse_wheel_down() || mouse_wheel_up()))
                    {
                        if keyboard_check(vk_control)
                            var target_width = (-line_width)
                        else
                            target_width = cursor_offset_x - offset_x
                    }
                    else if (multiline && (key_pressed == 33 || key_pressed == 34))
                        target_width = cursor_offset_x - offset_x
                    else
                        target_width = m_x - offset_x
                    if (h_align == 1)
                        target_width += (line_width >> 1)
                    else if (h_align == 2)
                        target_width += line_width
                    if (target_width > 0)
                    {
                        while true
                        {
                            if (smallest == -1 || abs(target_width - searched_width) <= smallest)
                            {
                                smallest = abs(target_width - searched_width)
                                if (cursor_position == last_index)
                                    break
                                else
                                {
                                    searched_width += string_width(string_char_at(text, cursor_position))
                                    cursor_position++
                                    continue
                                }
                            }
                            else
                            {
                                cursor_position--
                                break
                            }
                        }
                    }
                    if (multiline && cursor_position == last_index && (cursor_position - 1) < string_length(text))
                    {
                        cursor_position--
                        if (string_char_at(text, cursor_position) != "\n")
                            cursor_position *= -1
                    }
                }
                m_x_previous = m_x
                m_y_previous = m_y
                action = 3
                break
            }
            else if (clipboard_pasting_enabled && keyboard_check(vk_control) && key_pressed == 86 && ((os_type != os_windows && true && global.clipboard_local != "") || clipboard_has_text()))
            {
                if (os_type == os_windows && true)
                    s = clipboard_get_text()
                else
                    s = global.clipboard_local
                add_to_text = string_replace_all(s, "\r", "")
                if (!multiline)
                    add_to_text = string_replace_all(add_to_text, "\n", "")
                action = 7
                break
            }
            else if (multiline && key_pressed == 13)
            {
                add_to_text = "\n"
                action = 4
                break
            }
            else if (key_pressed == 46)
            {
                if (selection_enabled && selection_start != 0)
                {
                    action = 2
                    break
                }
                else if (cursor_position <= string_length(text))
                {
                    var position = cursor_position
                    if keyboard_check(vk_control)
                    {
                        while (position <= string_length(text))
                        {
                            char = string_char_at(text, position)
                            var char_next = string_char_at(text, (position + 1))
                            if (char == "\n" || char_next == "\n" || (string_lettersdigits_universal(char) == "" && string_lettersdigits_universal(char_next) != ""))
                                break
                            else
                            {
                                position++
                                continue
                            }
                        }
                    }
                    text = string_delete(text, cursor_position, (position - cursor_position + 1))
                    cursor_stay_visible = true
                    action = 2
                    break
                }
                else if (key_pressed == 8)
                {
                    if (selection_enabled && selection_start != 0)
                    {
                        action = 2
                        break
                    }
                    else if (cursor_position > 1)
                    {
                        position = cursor_position - 1
                        if keyboard_check(vk_control)
                        {
                            while (position > 1)
                            {
                                char = string_char_at(text, position)
                                char_before = string_char_at(text, (position - 1))
                                if (char == "\n" || char_before == "\n" || (string_lettersdigits_universal(char) != "" && string_lettersdigits_universal(char_before) == ""))
                                    break
                                else
                                {
                                    position--
                                    continue
                                }
                            }
                        }
                        text = string_delete(text, position, (cursor_position - position))
                        cursor_position = position
                        action = 2
                        break
                    }
                    else if (key_pressed == 36)
                    {
                        if (multiline && (!keyboard_check(vk_control)))
                            cursor_position = (ds_list_find_value(new_line_list, cursor_line)) + 1
                        else
                            cursor_position = 1
                        action = 3
                        break
                    }
                    else if (key_pressed == 35)
                    {
                        if (multiline && (!keyboard_check(vk_control)))
                        {
                            cursor_position = ds_list_find_value(new_line_list, (cursor_line + 1))
                            if (cursor_position <= string_length(text) && string_char_at(text, cursor_position) != "\n")
                                cursor_position *= -1
                        }
                        else
                            cursor_position = string_length(text) + 1
                        action = 3
                        break
                    }
                    else if (key_pressed == 39 || key_pressed == 37)
                    {
                        while (true)
                        {
                            if (key_pressed == 39)
                            {
                                if (cursor_position > string_length(text))
                                {
                                }
                                else
                                {
                                    cursor_position++
                                    char = string_char_at(text, cursor_position)
                                    char_before = string_char_at(text, (cursor_position - 1))
                                    if ((!keyboard_check(vk_control)) || char == "\n" || char_before == "\n" || (string_lettersdigits_universal(char) != "" && string_lettersdigits_universal(char_before) == ""))
                                    {
                                    }
                                    else
                                        continue
                                }
                            }
                            else if (cursor_position == 1)
                            {
                            }
                            else
                            {
                                cursor_position--
                                char = string_char_at(text, cursor_position)
                                char_before = string_char_at(text, (cursor_position - 1))
                                if ((!keyboard_check(vk_control)) || char == "\n" || char_before == "\n" || (string_lettersdigits_universal(char) != "" && string_lettersdigits_universal(char_before) == ""))
                                {
                                }
                                else
                                    continue
                            }
                        }
                        action = 3
                        break
                    }
                    else
                    {
                        keyboard_string = string_replace_all(keyboard_string, "", "")
                        if (keyboard_string != "")
                        {
                            add_to_text = keyboard_string
                            action = 1
                            break
                        }
                        else
                            break
                    }
                }
                else if (key_pressed == 36)
                {
                    if (multiline && (!keyboard_check(vk_control)))
                        cursor_position = (ds_list_find_value(new_line_list, cursor_line)) + 1
                    else
                        cursor_position = 1
                    action = 3
                    break
                }
                else if (key_pressed == 35)
                {
                    if (multiline && (!keyboard_check(vk_control)))
                    {
                        cursor_position = ds_list_find_value(new_line_list, (cursor_line + 1))
                        if (cursor_position <= string_length(text) && string_char_at(text, cursor_position) != "\n")
                            cursor_position *= -1
                    }
                    else
                        cursor_position = string_length(text) + 1
                    action = 3
                    break
                }
                else if (key_pressed == 39 || key_pressed == 37)
                {
                    while (true)
                    {
                        if (key_pressed == 39)
                        {
                            if (cursor_position > string_length(text))
                            {
                            }
                            else
                            {
                                cursor_position++
                                char = string_char_at(text, cursor_position)
                                char_before = string_char_at(text, (cursor_position - 1))
                                if ((!keyboard_check(vk_control)) || char == "\n" || char_before == "\n" || (string_lettersdigits_universal(char) != "" && string_lettersdigits_universal(char_before) == ""))
                                {
                                }
                                else
                                    continue
                            }
                        }
                        else if (cursor_position == 1)
                        {
                        }
                        else
                        {
                            cursor_position--
                            char = string_char_at(text, cursor_position)
                            char_before = string_char_at(text, (cursor_position - 1))
                            if ((!keyboard_check(vk_control)) || char == "\n" || char_before == "\n" || (string_lettersdigits_universal(char) != "" && string_lettersdigits_universal(char_before) == ""))
                            {
                            }
                            else
                                continue
                        }
                    }
                    action = 3
                    break
                }
                else
                {
                    keyboard_string = string_replace_all(keyboard_string, "", "")
                    if (keyboard_string != "")
                    {
                        add_to_text = keyboard_string
                        action = 1
                        break
                    }
                    else
                        break
                }
            }
            else if (key_pressed == 8)
            {
                if (selection_enabled && selection_start != 0)
                {
                    action = 2
                    break
                }
                else if (cursor_position > 1)
                {
                    position = cursor_position - 1
                    if keyboard_check(vk_control)
                    {
                        while (position > 1)
                        {
                            char = string_char_at(text, position)
                            char_before = string_char_at(text, (position - 1))
                            if (char == "\n" || char_before == "\n" || (string_lettersdigits_universal(char) != "" && string_lettersdigits_universal(char_before) == ""))
                                break
                            else
                            {
                                position--
                                continue
                            }
                        }
                    }
                    text = string_delete(text, position, (cursor_position - position))
                    cursor_position = position
                    action = 2
                    break
                }
                else if (key_pressed == 36)
                {
                    if (multiline && (!keyboard_check(vk_control)))
                        cursor_position = (ds_list_find_value(new_line_list, cursor_line)) + 1
                    else
                        cursor_position = 1
                    action = 3
                    break
                }
                else if (key_pressed == 35)
                {
                    if (multiline && (!keyboard_check(vk_control)))
                    {
                        cursor_position = ds_list_find_value(new_line_list, (cursor_line + 1))
                        if (cursor_position <= string_length(text) && string_char_at(text, cursor_position) != "\n")
                            cursor_position *= -1
                    }
                    else
                        cursor_position = string_length(text) + 1
                    action = 3
                    break
                }
                else if (key_pressed == 39 || key_pressed == 37)
                {
                    while (true)
                    {
                        if (key_pressed == 39)
                        {
                            if (cursor_position > string_length(text))
                            {
                            }
                            else
                            {
                                cursor_position++
                                char = string_char_at(text, cursor_position)
                                char_before = string_char_at(text, (cursor_position - 1))
                                if ((!keyboard_check(vk_control)) || char == "\n" || char_before == "\n" || (string_lettersdigits_universal(char) != "" && string_lettersdigits_universal(char_before) == ""))
                                {
                                }
                                else
                                    continue
                            }
                        }
                        else if (cursor_position == 1)
                        {
                        }
                        else
                        {
                            cursor_position--
                            char = string_char_at(text, cursor_position)
                            char_before = string_char_at(text, (cursor_position - 1))
                            if ((!keyboard_check(vk_control)) || char == "\n" || char_before == "\n" || (string_lettersdigits_universal(char) != "" && string_lettersdigits_universal(char_before) == ""))
                            {
                            }
                            else
                                continue
                        }
                    }
                    action = 3
                    break
                }
                else
                {
                    keyboard_string = string_replace_all(keyboard_string, "", "")
                    if (keyboard_string != "")
                    {
                        add_to_text = keyboard_string
                        action = 1
                        break
                    }
                    else
                        break
                }
            }
            else if (key_pressed == 36)
            {
                if (multiline && (!keyboard_check(vk_control)))
                    cursor_position = (ds_list_find_value(new_line_list, cursor_line)) + 1
                else
                    cursor_position = 1
                action = 3
                break
            }
            else if (key_pressed == 35)
            {
                if (multiline && (!keyboard_check(vk_control)))
                {
                    cursor_position = ds_list_find_value(new_line_list, (cursor_line + 1))
                    if (cursor_position <= string_length(text) && string_char_at(text, cursor_position) != "\n")
                        cursor_position *= -1
                }
                else
                    cursor_position = string_length(text) + 1
                action = 3
                break
            }
            else if (key_pressed == 39 || key_pressed == 37)
            {
                while (true)
                {
                    if (key_pressed == 39)
                    {
                        if (cursor_position > string_length(text))
                        {
                        }
                        else
                        {
                            cursor_position++
                            char = string_char_at(text, cursor_position)
                            char_before = string_char_at(text, (cursor_position - 1))
                            if ((!keyboard_check(vk_control)) || char == "\n" || char_before == "\n" || (string_lettersdigits_universal(char) != "" && string_lettersdigits_universal(char_before) == ""))
                            {
                            }
                            else
                                continue
                        }
                    }
                    else if (cursor_position == 1)
                    {
                    }
                    else
                    {
                        cursor_position--
                        char = string_char_at(text, cursor_position)
                        char_before = string_char_at(text, (cursor_position - 1))
                        if ((!keyboard_check(vk_control)) || char == "\n" || char_before == "\n" || (string_lettersdigits_universal(char) != "" && string_lettersdigits_universal(char_before) == ""))
                        {
                        }
                        else
                            continue
                    }
                }
                action = 3
                break
            }
            else
            {
                keyboard_string = string_replace_all(keyboard_string, "", "")
                if (keyboard_string != "")
                {
                    add_to_text = keyboard_string
                    action = 1
                    break
                }
                else
                    break
            }
        }
        else if (max_undo_redo_states != 0 && keyboard_check(vk_control))
        {
            if (((keyboard_check(vk_shift) && key_pressed == 90) || key_pressed == 89) && undo_redo_position < (ds_list_size(undo_redo_text_list) - 1))
            {
                undo_redo_position++
                text = ds_list_find_value(undo_redo_text_list, undo_redo_position)
                cursor_position = ds_list_find_value(undo_redo_cursor_position_list, undo_redo_position)
                if selection_enabled
                    selection_start = 0
                cursor_stay_visible = true
                action = 5
                break
            }
            else if ((!keyboard_check(vk_shift)) && key_pressed == 90 && undo_redo_position > 0)
            {
                undo_redo_position--
                text = ds_list_find_value(undo_redo_text_list, undo_redo_position)
                cursor_position = ds_list_find_value(undo_redo_cursor_position_list, undo_redo_position)
                if selection_enabled
                    selection_start = 0
                cursor_stay_visible = true
                action = 5
                break
            }
            else if (selection_enabled && keyboard_check(vk_control) && key_pressed == 65)
            {
                selection_start = 1
                cursor_position = string_length(text) + 1
                selection_update = true
                action = 3
                break
            }
            else if (mouse_check_button_pressed(mb_left) || (selection_enabled && mouse_check_button(mb_left) && (m_x != m_x_previous || m_y != m_y_previous)) || (multiline && ((mouse_wheel_up() && activated) || (mouse_wheel_down() && activated) || key_pressed == 38 || key_pressed == 40 || key_pressed == 33 || key_pressed == 34)))
            {
                if selection_enabled
                {
                    var double_clicked = false
                    if mouse_check_button_pressed(mb_left)
                    {
                        var _temp_local_var_50 = (enabled_step > 1 && selection_start == 0 && m_x == m_x_previous && m_y == m_y_previous && (get_timer() - mouse_pressed_previous) < double_click_time && (string_lettersdigits_universal(string_char_at(text, cursor_position)) != "" || string_lettersdigits_universal(string_char_at(text, (cursor_position - 1))) != ""))
                        double_clicked = (enabled_step > 1 && selection_start == 0 && m_x == m_x_previous && m_y == m_y_previous && (get_timer() - mouse_pressed_previous) < double_click_time && (string_lettersdigits_universal(string_char_at(text, cursor_position)) != "" || string_lettersdigits_universal(string_char_at(text, (cursor_position - 1))) != ""))
                        mouse_pressed_previous = get_timer()
                    }
                }
                if (selection_enabled && double_clicked)
                {
                    mouse_clear(mb_left)
                    if (multiline && cursor_position < 0)
                        cursor_position = (-cursor_position) + 1
                    selection_start = cursor_position
                    while true
                    {
                        var char = string_char_at(text, selection_start)
                        if (selection_start == 1)
                            var char_before = ""
                        else
                            char_before = string_char_at(text, (selection_start - 1))
                        if (string_lettersdigits_universal(char) != "" && string_lettersdigits_universal(char_before) == "")
                            break
                        else
                        {
                            selection_start--
                            if (selection_start <= 1)
                                break
                            else
                                continue
                        }
                    }
                    while true
                    {
                        char = string_char_at(text, cursor_position)
                        if (cursor_position == 1)
                            char_before = ""
                        else
                            char_before = string_char_at(text, (cursor_position - 1))
                        if (string_lettersdigits_universal(char) == "" && string_lettersdigits_universal(char_before) != "")
                            break
                        else
                        {
                            cursor_position++
                            if (cursor_position > string_length(text))
                                break
                            else
                                continue
                        }
                    }
                    selection_update = true
                }
                else
                {
                    var searched_width = 0
                    var smallest = -1
                    if multiline
                    {
                        if (key_pressed == 38 || mouse_wheel_up())
                        {
                            var line = cursor_line - 1
                            if keyboard_check(vk_control)
                            {
                                while (line > 0)
                                {
                                    if (((ds_list_find_value(new_line_list, line)) - 1) == ds_list_find_value(new_line_list, (line - 1)) && cursor_position != ((ds_list_find_value(new_line_list, line)) + 1) && string_char_at(text, ((ds_list_find_value(new_line_list, line)) + 1)) != "\n")
                                        break
                                    else
                                    {
                                        line--
                                        continue
                                    }
                                }
                            }
                        }
                        else if (key_pressed == 40 || mouse_wheel_down())
                        {
                            line = cursor_line + 1
                            if keyboard_check(vk_control)
                            {
                                while (line < (lines - 1))
                                {
                                    if (((ds_list_find_value(new_line_list, line)) - 1) == ds_list_find_value(new_line_list, (line - 1)) && string_char_at(text, ((ds_list_find_value(new_line_list, line)) + 1)) != "\n")
                                        break
                                    else
                                    {
                                        line++
                                        continue
                                    }
                                }
                            }
                        }
                        else if (key_pressed == 33)
                        {
                            if keyboard_check(vk_control)
                            {
                                if (v_align == 0)
                                    line = ceil((-offset_y) / line_separation)
                                else if (v_align == 2)
                                    line = ceil(lines - (offset_y + height) / line_separation)
                                else
                                    line = ceil(lines * 0.5 - (height * 0.5 + offset_y) / line_separation)
                            }
                            else
                            {
                                line = cursor_line - (height div line_separation)
                                offset_y += ((height div line_separation) * line_separation)
                            }
                        }
                        else if (key_pressed == 34)
                        {
                            if keyboard_check(vk_control)
                            {
                                if (v_align == 0)
                                    line = floor((height - offset_y) / line_separation - 1)
                                else if (v_align == 2)
                                    line = floor(lines - offset_y / line_separation - 1)
                                else
                                    line = floor(lines * 0.5 + (height * 0.5 - offset_y) / line_separation - 1)
                            }
                            else
                            {
                                line = cursor_line + (height div line_separation)
                                offset_y -= ((height div line_separation) * line_separation)
                            }
                        }
                        else
                            line = (m_y - offset_y - v_align_offset) div line_separation
                        line = clamp(line, 0, (lines - 1))
                        my_current_line = line
                        cursor_position = (ds_list_find_value(new_line_list, line)) + 1
                        var last_index = (min(ds_list_find_value(new_line_list, (line + 1)), string_length(text))) + 1
                        show_debug_message(new_line_list)
                        var line_width = string_width(string_copy(text, cursor_position, (last_index - cursor_position)))
                    }
                    else
                    {
                        cursor_position = 1
                        last_index = string_length(text) + 1
                        line_width = text_width
                    }
                    if (multiline && (key_pressed == 38 || key_pressed == 40 || mouse_wheel_down() || mouse_wheel_up()))
                    {
                        if keyboard_check(vk_control)
                            var target_width = (-line_width)
                        else
                            target_width = cursor_offset_x - offset_x
                    }
                    else if (multiline && (key_pressed == 33 || key_pressed == 34))
                        target_width = cursor_offset_x - offset_x
                    else
                        target_width = m_x - offset_x
                    if (h_align == 1)
                        target_width += (line_width >> 1)
                    else if (h_align == 2)
                        target_width += line_width
                    if (target_width > 0)
                    {
                        while true
                        {
                            if (smallest == -1 || abs(target_width - searched_width) <= smallest)
                            {
                                smallest = abs(target_width - searched_width)
                                if (cursor_position == last_index)
                                    break
                                else
                                {
                                    searched_width += string_width(string_char_at(text, cursor_position))
                                    cursor_position++
                                    continue
                                }
                            }
                            else
                            {
                                cursor_position--
                                break
                            }
                        }
                    }
                    if (multiline && cursor_position == last_index && (cursor_position - 1) < string_length(text))
                    {
                        cursor_position--
                        if (string_char_at(text, cursor_position) != "\n")
                            cursor_position *= -1
                    }
                }
                m_x_previous = m_x
                m_y_previous = m_y
                action = 3
                break
            }
            else if (clipboard_pasting_enabled && keyboard_check(vk_control) && key_pressed == 86 && ((os_type != os_windows && true && global.clipboard_local != "") || clipboard_has_text()))
            {
                if (os_type == os_windows && true)
                    s = clipboard_get_text()
                else
                    s = global.clipboard_local
                add_to_text = string_replace_all(s, "\r", "")
                if (!multiline)
                    add_to_text = string_replace_all(add_to_text, "\n", "")
                action = 7
                break
            }
            else if (multiline && key_pressed == 13)
            {
                add_to_text = "\n"
                action = 4
                break
            }
            else if (key_pressed == 46)
            {
                if (selection_enabled && selection_start != 0)
                {
                    action = 2
                    break
                }
                else if (cursor_position <= string_length(text))
                {
                    var position = cursor_position
                    if keyboard_check(vk_control)
                    {
                        while (position <= string_length(text))
                        {
                            char = string_char_at(text, position)
                            var char_next = string_char_at(text, (position + 1))
                            if (char == "\n" || char_next == "\n" || (string_lettersdigits_universal(char) == "" && string_lettersdigits_universal(char_next) != ""))
                                break
                            else
                            {
                                position++
                                continue
                            }
                        }
                    }
                    text = string_delete(text, cursor_position, (position - cursor_position + 1))
                    cursor_stay_visible = true
                    action = 2
                    break
                }
                else if (key_pressed == 8)
                {
                    if (selection_enabled && selection_start != 0)
                    {
                        action = 2
                        break
                    }
                    else if (cursor_position > 1)
                    {
                        position = cursor_position - 1
                        if keyboard_check(vk_control)
                        {
                            while (position > 1)
                            {
                                char = string_char_at(text, position)
                                char_before = string_char_at(text, (position - 1))
                                if (char == "\n" || char_before == "\n" || (string_lettersdigits_universal(char) != "" && string_lettersdigits_universal(char_before) == ""))
                                    break
                                else
                                {
                                    position--
                                    continue
                                }
                            }
                        }
                        text = string_delete(text, position, (cursor_position - position))
                        cursor_position = position
                        action = 2
                        break
                    }
                    else if (key_pressed == 36)
                    {
                        if (multiline && (!keyboard_check(vk_control)))
                            cursor_position = (ds_list_find_value(new_line_list, cursor_line)) + 1
                        else
                            cursor_position = 1
                        action = 3
                        break
                    }
                    else if (key_pressed == 35)
                    {
                        if (multiline && (!keyboard_check(vk_control)))
                        {
                            cursor_position = ds_list_find_value(new_line_list, (cursor_line + 1))
                            if (cursor_position <= string_length(text) && string_char_at(text, cursor_position) != "\n")
                                cursor_position *= -1
                        }
                        else
                            cursor_position = string_length(text) + 1
                        action = 3
                        break
                    }
                    else if (key_pressed == 39 || key_pressed == 37)
                    {
                        while (true)
                        {
                            if (key_pressed == 39)
                            {
                                if (cursor_position > string_length(text))
                                {
                                }
                                else
                                {
                                    cursor_position++
                                    char = string_char_at(text, cursor_position)
                                    char_before = string_char_at(text, (cursor_position - 1))
                                    if ((!keyboard_check(vk_control)) || char == "\n" || char_before == "\n" || (string_lettersdigits_universal(char) != "" && string_lettersdigits_universal(char_before) == ""))
                                    {
                                    }
                                    else
                                        continue
                                }
                            }
                            else if (cursor_position == 1)
                            {
                            }
                            else
                            {
                                cursor_position--
                                char = string_char_at(text, cursor_position)
                                char_before = string_char_at(text, (cursor_position - 1))
                                if ((!keyboard_check(vk_control)) || char == "\n" || char_before == "\n" || (string_lettersdigits_universal(char) != "" && string_lettersdigits_universal(char_before) == ""))
                                {
                                }
                                else
                                    continue
                            }
                        }
                        action = 3
                        break
                    }
                    else
                    {
                        keyboard_string = string_replace_all(keyboard_string, "", "")
                        if (keyboard_string != "")
                        {
                            add_to_text = keyboard_string
                            action = 1
                            break
                        }
                        else
                            break
                    }
                }
                else if (key_pressed == 36)
                {
                    if (multiline && (!keyboard_check(vk_control)))
                        cursor_position = (ds_list_find_value(new_line_list, cursor_line)) + 1
                    else
                        cursor_position = 1
                    action = 3
                    break
                }
                else if (key_pressed == 35)
                {
                    if (multiline && (!keyboard_check(vk_control)))
                    {
                        cursor_position = ds_list_find_value(new_line_list, (cursor_line + 1))
                        if (cursor_position <= string_length(text) && string_char_at(text, cursor_position) != "\n")
                            cursor_position *= -1
                    }
                    else
                        cursor_position = string_length(text) + 1
                    action = 3
                    break
                }
                else if (key_pressed == 39 || key_pressed == 37)
                {
                    while (true)
                    {
                        if (key_pressed == 39)
                        {
                            if (cursor_position > string_length(text))
                            {
                            }
                            else
                            {
                                cursor_position++
                                char = string_char_at(text, cursor_position)
                                char_before = string_char_at(text, (cursor_position - 1))
                                if ((!keyboard_check(vk_control)) || char == "\n" || char_before == "\n" || (string_lettersdigits_universal(char) != "" && string_lettersdigits_universal(char_before) == ""))
                                {
                                }
                                else
                                    continue
                            }
                        }
                        else if (cursor_position == 1)
                        {
                        }
                        else
                        {
                            cursor_position--
                            char = string_char_at(text, cursor_position)
                            char_before = string_char_at(text, (cursor_position - 1))
                            if ((!keyboard_check(vk_control)) || char == "\n" || char_before == "\n" || (string_lettersdigits_universal(char) != "" && string_lettersdigits_universal(char_before) == ""))
                            {
                            }
                            else
                                continue
                        }
                    }
                    action = 3
                    break
                }
                else
                {
                    keyboard_string = string_replace_all(keyboard_string, "", "")
                    if (keyboard_string != "")
                    {
                        add_to_text = keyboard_string
                        action = 1
                        break
                    }
                    else
                        break
                }
            }
            else if (key_pressed == 8)
            {
                if (selection_enabled && selection_start != 0)
                {
                    action = 2
                    break
                }
                else if (cursor_position > 1)
                {
                    position = cursor_position - 1
                    if keyboard_check(vk_control)
                    {
                        while (position > 1)
                        {
                            char = string_char_at(text, position)
                            char_before = string_char_at(text, (position - 1))
                            if (char == "\n" || char_before == "\n" || (string_lettersdigits_universal(char) != "" && string_lettersdigits_universal(char_before) == ""))
                                break
                            else
                            {
                                position--
                                continue
                            }
                        }
                    }
                    text = string_delete(text, position, (cursor_position - position))
                    cursor_position = position
                    action = 2
                    break
                }
                else if (key_pressed == 36)
                {
                    if (multiline && (!keyboard_check(vk_control)))
                        cursor_position = (ds_list_find_value(new_line_list, cursor_line)) + 1
                    else
                        cursor_position = 1
                    action = 3
                    break
                }
                else if (key_pressed == 35)
                {
                    if (multiline && (!keyboard_check(vk_control)))
                    {
                        cursor_position = ds_list_find_value(new_line_list, (cursor_line + 1))
                        if (cursor_position <= string_length(text) && string_char_at(text, cursor_position) != "\n")
                            cursor_position *= -1
                    }
                    else
                        cursor_position = string_length(text) + 1
                    action = 3
                    break
                }
                else if (key_pressed == 39 || key_pressed == 37)
                {
                    while (true)
                    {
                        if (key_pressed == 39)
                        {
                            if (cursor_position > string_length(text))
                            {
                            }
                            else
                            {
                                cursor_position++
                                char = string_char_at(text, cursor_position)
                                char_before = string_char_at(text, (cursor_position - 1))
                                if ((!keyboard_check(vk_control)) || char == "\n" || char_before == "\n" || (string_lettersdigits_universal(char) != "" && string_lettersdigits_universal(char_before) == ""))
                                {
                                }
                                else
                                    continue
                            }
                        }
                        else if (cursor_position == 1)
                        {
                        }
                        else
                        {
                            cursor_position--
                            char = string_char_at(text, cursor_position)
                            char_before = string_char_at(text, (cursor_position - 1))
                            if ((!keyboard_check(vk_control)) || char == "\n" || char_before == "\n" || (string_lettersdigits_universal(char) != "" && string_lettersdigits_universal(char_before) == ""))
                            {
                            }
                            else
                                continue
                        }
                    }
                    action = 3
                    break
                }
                else
                {
                    keyboard_string = string_replace_all(keyboard_string, "", "")
                    if (keyboard_string != "")
                    {
                        add_to_text = keyboard_string
                        action = 1
                        break
                    }
                    else
                        break
                }
            }
            else if (key_pressed == 36)
            {
                if (multiline && (!keyboard_check(vk_control)))
                    cursor_position = (ds_list_find_value(new_line_list, cursor_line)) + 1
                else
                    cursor_position = 1
                action = 3
                break
            }
            else if (key_pressed == 35)
            {
                if (multiline && (!keyboard_check(vk_control)))
                {
                    cursor_position = ds_list_find_value(new_line_list, (cursor_line + 1))
                    if (cursor_position <= string_length(text) && string_char_at(text, cursor_position) != "\n")
                        cursor_position *= -1
                }
                else
                    cursor_position = string_length(text) + 1
                action = 3
                break
            }
            else if (key_pressed == 39 || key_pressed == 37)
            {
                while (true)
                {
                    if (key_pressed == 39)
                    {
                        if (cursor_position > string_length(text))
                        {
                        }
                        else
                        {
                            cursor_position++
                            char = string_char_at(text, cursor_position)
                            char_before = string_char_at(text, (cursor_position - 1))
                            if ((!keyboard_check(vk_control)) || char == "\n" || char_before == "\n" || (string_lettersdigits_universal(char) != "" && string_lettersdigits_universal(char_before) == ""))
                            {
                            }
                            else
                                continue
                        }
                    }
                    else if (cursor_position == 1)
                    {
                    }
                    else
                    {
                        cursor_position--
                        char = string_char_at(text, cursor_position)
                        char_before = string_char_at(text, (cursor_position - 1))
                        if ((!keyboard_check(vk_control)) || char == "\n" || char_before == "\n" || (string_lettersdigits_universal(char) != "" && string_lettersdigits_universal(char_before) == ""))
                        {
                        }
                        else
                            continue
                    }
                }
                action = 3
                break
            }
            else
            {
                keyboard_string = string_replace_all(keyboard_string, "", "")
                if (keyboard_string != "")
                {
                    add_to_text = keyboard_string
                    action = 1
                    break
                }
                else
                    break
            }
        }
        else if (selection_enabled && keyboard_check(vk_control) && key_pressed == 65)
        {
            selection_start = 1
            cursor_position = string_length(text) + 1
            selection_update = true
            action = 3
            break
        }
        else if (mouse_check_button_pressed(mb_left) || (selection_enabled && mouse_check_button(mb_left) && (m_x != m_x_previous || m_y != m_y_previous)) || (multiline && ((mouse_wheel_up() && activated) || (mouse_wheel_down() && activated) || key_pressed == 38 || key_pressed == 40 || key_pressed == 33 || key_pressed == 34)))
        {
            if selection_enabled
            {
                var double_clicked = false
                if mouse_check_button_pressed(mb_left)
                {
                    var _temp_local_var_50 = (enabled_step > 1 && selection_start == 0 && m_x == m_x_previous && m_y == m_y_previous && (get_timer() - mouse_pressed_previous) < double_click_time && (string_lettersdigits_universal(string_char_at(text, cursor_position)) != "" || string_lettersdigits_universal(string_char_at(text, (cursor_position - 1))) != ""))
                    double_clicked = (enabled_step > 1 && selection_start == 0 && m_x == m_x_previous && m_y == m_y_previous && (get_timer() - mouse_pressed_previous) < double_click_time && (string_lettersdigits_universal(string_char_at(text, cursor_position)) != "" || string_lettersdigits_universal(string_char_at(text, (cursor_position - 1))) != ""))
                    mouse_pressed_previous = get_timer()
                }
            }
            if (selection_enabled && double_clicked)
            {
                mouse_clear(mb_left)
                if (multiline && cursor_position < 0)
                    cursor_position = (-cursor_position) + 1
                selection_start = cursor_position
                while true
                {
                    var char = string_char_at(text, selection_start)
                    if (selection_start == 1)
                        var char_before = ""
                    else
                        char_before = string_char_at(text, (selection_start - 1))
                    if (string_lettersdigits_universal(char) != "" && string_lettersdigits_universal(char_before) == "")
                        break
                    else
                    {
                        selection_start--
                        if (selection_start <= 1)
                            break
                        else
                            continue
                    }
                }
                while true
                {
                    char = string_char_at(text, cursor_position)
                    if (cursor_position == 1)
                        char_before = ""
                    else
                        char_before = string_char_at(text, (cursor_position - 1))
                    if (string_lettersdigits_universal(char) == "" && string_lettersdigits_universal(char_before) != "")
                        break
                    else
                    {
                        cursor_position++
                        if (cursor_position > string_length(text))
                            break
                        else
                            continue
                    }
                }
                selection_update = true
            }
            else
            {
                var searched_width = 0
                var smallest = -1
                if multiline
                {
                    if (key_pressed == 38 || mouse_wheel_up())
                    {
                        var line = cursor_line - 1
                        if keyboard_check(vk_control)
                        {
                            while (line > 0)
                            {
                                if (((ds_list_find_value(new_line_list, line)) - 1) == ds_list_find_value(new_line_list, (line - 1)) && cursor_position != ((ds_list_find_value(new_line_list, line)) + 1) && string_char_at(text, ((ds_list_find_value(new_line_list, line)) + 1)) != "\n")
                                    break
                                else
                                {
                                    line--
                                    continue
                                }
                            }
                        }
                    }
                    else if (key_pressed == 40 || mouse_wheel_down())
                    {
                        line = cursor_line + 1
                        if keyboard_check(vk_control)
                        {
                            while (line < (lines - 1))
                            {
                                if (((ds_list_find_value(new_line_list, line)) - 1) == ds_list_find_value(new_line_list, (line - 1)) && string_char_at(text, ((ds_list_find_value(new_line_list, line)) + 1)) != "\n")
                                    break
                                else
                                {
                                    line++
                                    continue
                                }
                            }
                        }
                    }
                    else if (key_pressed == 33)
                    {
                        if keyboard_check(vk_control)
                        {
                            if (v_align == 0)
                                line = ceil((-offset_y) / line_separation)
                            else if (v_align == 2)
                                line = ceil(lines - (offset_y + height) / line_separation)
                            else
                                line = ceil(lines * 0.5 - (height * 0.5 + offset_y) / line_separation)
                        }
                        else
                        {
                            line = cursor_line - (height div line_separation)
                            offset_y += ((height div line_separation) * line_separation)
                        }
                    }
                    else if (key_pressed == 34)
                    {
                        if keyboard_check(vk_control)
                        {
                            if (v_align == 0)
                                line = floor((height - offset_y) / line_separation - 1)
                            else if (v_align == 2)
                                line = floor(lines - offset_y / line_separation - 1)
                            else
                                line = floor(lines * 0.5 + (height * 0.5 - offset_y) / line_separation - 1)
                        }
                        else
                        {
                            line = cursor_line + (height div line_separation)
                            offset_y -= ((height div line_separation) * line_separation)
                        }
                    }
                    else
                        line = (m_y - offset_y - v_align_offset) div line_separation
                    line = clamp(line, 0, (lines - 1))
                    my_current_line = line
                    cursor_position = (ds_list_find_value(new_line_list, line)) + 1
                    var last_index = (min(ds_list_find_value(new_line_list, (line + 1)), string_length(text))) + 1
                    show_debug_message(new_line_list)
                    var line_width = string_width(string_copy(text, cursor_position, (last_index - cursor_position)))
                }
                else
                {
                    cursor_position = 1
                    last_index = string_length(text) + 1
                    line_width = text_width
                }
                if (multiline && (key_pressed == 38 || key_pressed == 40 || mouse_wheel_down() || mouse_wheel_up()))
                {
                    if keyboard_check(vk_control)
                        var target_width = (-line_width)
                    else
                        target_width = cursor_offset_x - offset_x
                }
                else if (multiline && (key_pressed == 33 || key_pressed == 34))
                    target_width = cursor_offset_x - offset_x
                else
                    target_width = m_x - offset_x
                if (h_align == 1)
                    target_width += (line_width >> 1)
                else if (h_align == 2)
                    target_width += line_width
                if (target_width > 0)
                {
                    while true
                    {
                        if (smallest == -1 || abs(target_width - searched_width) <= smallest)
                        {
                            smallest = abs(target_width - searched_width)
                            if (cursor_position == last_index)
                                break
                            else
                            {
                                searched_width += string_width(string_char_at(text, cursor_position))
                                cursor_position++
                                continue
                            }
                        }
                        else
                        {
                            cursor_position--
                            break
                        }
                    }
                }
                if (multiline && cursor_position == last_index && (cursor_position - 1) < string_length(text))
                {
                    cursor_position--
                    if (string_char_at(text, cursor_position) != "\n")
                        cursor_position *= -1
                }
            }
            m_x_previous = m_x
            m_y_previous = m_y
            action = 3
            break
        }
        else if (clipboard_pasting_enabled && keyboard_check(vk_control) && key_pressed == 86 && ((os_type != os_windows && true && global.clipboard_local != "") || clipboard_has_text()))
        {
            if (os_type == os_windows && true)
                s = clipboard_get_text()
            else
                s = global.clipboard_local
            add_to_text = string_replace_all(s, "\r", "")
            if (!multiline)
                add_to_text = string_replace_all(add_to_text, "\n", "")
            action = 7
            break
        }
        else if (multiline && key_pressed == 13)
        {
            add_to_text = "\n"
            action = 4
            break
        }
        else if (key_pressed == 46)
        {
            if (selection_enabled && selection_start != 0)
            {
                action = 2
                break
            }
            else if (cursor_position <= string_length(text))
            {
                var position = cursor_position
                if keyboard_check(vk_control)
                {
                    while (position <= string_length(text))
                    {
                        char = string_char_at(text, position)
                        var char_next = string_char_at(text, (position + 1))
                        if (char == "\n" || char_next == "\n" || (string_lettersdigits_universal(char) == "" && string_lettersdigits_universal(char_next) != ""))
                            break
                        else
                        {
                            position++
                            continue
                        }
                    }
                }
                text = string_delete(text, cursor_position, (position - cursor_position + 1))
                cursor_stay_visible = true
                action = 2
                break
            }
            else if (key_pressed == 8)
            {
                if (selection_enabled && selection_start != 0)
                {
                    action = 2
                    break
                }
                else if (cursor_position > 1)
                {
                    position = cursor_position - 1
                    if keyboard_check(vk_control)
                    {
                        while (position > 1)
                        {
                            char = string_char_at(text, position)
                            char_before = string_char_at(text, (position - 1))
                            if (char == "\n" || char_before == "\n" || (string_lettersdigits_universal(char) != "" && string_lettersdigits_universal(char_before) == ""))
                                break
                            else
                            {
                                position--
                                continue
                            }
                        }
                    }
                    text = string_delete(text, position, (cursor_position - position))
                    cursor_position = position
                    action = 2
                    break
                }
                else if (key_pressed == 36)
                {
                    if (multiline && (!keyboard_check(vk_control)))
                        cursor_position = (ds_list_find_value(new_line_list, cursor_line)) + 1
                    else
                        cursor_position = 1
                    action = 3
                    break
                }
                else if (key_pressed == 35)
                {
                    if (multiline && (!keyboard_check(vk_control)))
                    {
                        cursor_position = ds_list_find_value(new_line_list, (cursor_line + 1))
                        if (cursor_position <= string_length(text) && string_char_at(text, cursor_position) != "\n")
                            cursor_position *= -1
                    }
                    else
                        cursor_position = string_length(text) + 1
                    action = 3
                    break
                }
                else if (key_pressed == 39 || key_pressed == 37)
                {
                    while (true)
                    {
                        if (key_pressed == 39)
                        {
                            if (cursor_position > string_length(text))
                            {
                            }
                            else
                            {
                                cursor_position++
                                char = string_char_at(text, cursor_position)
                                char_before = string_char_at(text, (cursor_position - 1))
                                if ((!keyboard_check(vk_control)) || char == "\n" || char_before == "\n" || (string_lettersdigits_universal(char) != "" && string_lettersdigits_universal(char_before) == ""))
                                {
                                }
                                else
                                    continue
                            }
                        }
                        else if (cursor_position == 1)
                        {
                        }
                        else
                        {
                            cursor_position--
                            char = string_char_at(text, cursor_position)
                            char_before = string_char_at(text, (cursor_position - 1))
                            if ((!keyboard_check(vk_control)) || char == "\n" || char_before == "\n" || (string_lettersdigits_universal(char) != "" && string_lettersdigits_universal(char_before) == ""))
                            {
                            }
                            else
                                continue
                        }
                    }
                    action = 3
                    break
                }
                else
                {
                    keyboard_string = string_replace_all(keyboard_string, "", "")
                    if (keyboard_string != "")
                    {
                        add_to_text = keyboard_string
                        action = 1
                        break
                    }
                    else
                        break
                }
            }
            else if (key_pressed == 36)
            {
                if (multiline && (!keyboard_check(vk_control)))
                    cursor_position = (ds_list_find_value(new_line_list, cursor_line)) + 1
                else
                    cursor_position = 1
                action = 3
                break
            }
            else if (key_pressed == 35)
            {
                if (multiline && (!keyboard_check(vk_control)))
                {
                    cursor_position = ds_list_find_value(new_line_list, (cursor_line + 1))
                    if (cursor_position <= string_length(text) && string_char_at(text, cursor_position) != "\n")
                        cursor_position *= -1
                }
                else
                    cursor_position = string_length(text) + 1
                action = 3
                break
            }
            else if (key_pressed == 39 || key_pressed == 37)
            {
                while (true)
                {
                    if (key_pressed == 39)
                    {
                        if (cursor_position > string_length(text))
                        {
                        }
                        else
                        {
                            cursor_position++
                            char = string_char_at(text, cursor_position)
                            char_before = string_char_at(text, (cursor_position - 1))
                            if ((!keyboard_check(vk_control)) || char == "\n" || char_before == "\n" || (string_lettersdigits_universal(char) != "" && string_lettersdigits_universal(char_before) == ""))
                            {
                            }
                            else
                                continue
                        }
                    }
                    else if (cursor_position == 1)
                    {
                    }
                    else
                    {
                        cursor_position--
                        char = string_char_at(text, cursor_position)
                        char_before = string_char_at(text, (cursor_position - 1))
                        if ((!keyboard_check(vk_control)) || char == "\n" || char_before == "\n" || (string_lettersdigits_universal(char) != "" && string_lettersdigits_universal(char_before) == ""))
                        {
                        }
                        else
                            continue
                    }
                }
                action = 3
                break
            }
            else
            {
                keyboard_string = string_replace_all(keyboard_string, "", "")
                if (keyboard_string != "")
                {
                    add_to_text = keyboard_string
                    action = 1
                    break
                }
                else
                    break
            }
        }
        else if (key_pressed == 8)
        {
            if (selection_enabled && selection_start != 0)
            {
                action = 2
                break
            }
            else if (cursor_position > 1)
            {
                position = cursor_position - 1
                if keyboard_check(vk_control)
                {
                    while (position > 1)
                    {
                        char = string_char_at(text, position)
                        char_before = string_char_at(text, (position - 1))
                        if (char == "\n" || char_before == "\n" || (string_lettersdigits_universal(char) != "" && string_lettersdigits_universal(char_before) == ""))
                            break
                        else
                        {
                            position--
                            continue
                        }
                    }
                }
                text = string_delete(text, position, (cursor_position - position))
                cursor_position = position
                action = 2
                break
            }
            else if (key_pressed == 36)
            {
                if (multiline && (!keyboard_check(vk_control)))
                    cursor_position = (ds_list_find_value(new_line_list, cursor_line)) + 1
                else
                    cursor_position = 1
                action = 3
                break
            }
            else if (key_pressed == 35)
            {
                if (multiline && (!keyboard_check(vk_control)))
                {
                    cursor_position = ds_list_find_value(new_line_list, (cursor_line + 1))
                    if (cursor_position <= string_length(text) && string_char_at(text, cursor_position) != "\n")
                        cursor_position *= -1
                }
                else
                    cursor_position = string_length(text) + 1
                action = 3
                break
            }
            else if (key_pressed == 39 || key_pressed == 37)
            {
                while (true)
                {
                    if (key_pressed == 39)
                    {
                        if (cursor_position > string_length(text))
                        {
                        }
                        else
                        {
                            cursor_position++
                            char = string_char_at(text, cursor_position)
                            char_before = string_char_at(text, (cursor_position - 1))
                            if ((!keyboard_check(vk_control)) || char == "\n" || char_before == "\n" || (string_lettersdigits_universal(char) != "" && string_lettersdigits_universal(char_before) == ""))
                            {
                            }
                            else
                                continue
                        }
                    }
                    else if (cursor_position == 1)
                    {
                    }
                    else
                    {
                        cursor_position--
                        char = string_char_at(text, cursor_position)
                        char_before = string_char_at(text, (cursor_position - 1))
                        if ((!keyboard_check(vk_control)) || char == "\n" || char_before == "\n" || (string_lettersdigits_universal(char) != "" && string_lettersdigits_universal(char_before) == ""))
                        {
                        }
                        else
                            continue
                    }
                }
                action = 3
                break
            }
            else
            {
                keyboard_string = string_replace_all(keyboard_string, "", "")
                if (keyboard_string != "")
                {
                    add_to_text = keyboard_string
                    action = 1
                    break
                }
                else
                    break
            }
        }
        else if (key_pressed == 36)
        {
            if (multiline && (!keyboard_check(vk_control)))
                cursor_position = (ds_list_find_value(new_line_list, cursor_line)) + 1
            else
                cursor_position = 1
            action = 3
            break
        }
        else if (key_pressed == 35)
        {
            if (multiline && (!keyboard_check(vk_control)))
            {
                cursor_position = ds_list_find_value(new_line_list, (cursor_line + 1))
                if (cursor_position <= string_length(text) && string_char_at(text, cursor_position) != "\n")
                    cursor_position *= -1
            }
            else
                cursor_position = string_length(text) + 1
            action = 3
            break
        }
        else if (key_pressed == 39 || key_pressed == 37)
        {
            while (true)
            {
                if (key_pressed == 39)
                {
                    if (cursor_position > string_length(text))
                    {
                    }
                    else
                    {
                        cursor_position++
                        char = string_char_at(text, cursor_position)
                        char_before = string_char_at(text, (cursor_position - 1))
                        if ((!keyboard_check(vk_control)) || char == "\n" || char_before == "\n" || (string_lettersdigits_universal(char) != "" && string_lettersdigits_universal(char_before) == ""))
                        {
                        }
                        else
                            continue
                    }
                }
                else if (cursor_position == 1)
                {
                }
                else
                {
                    cursor_position--
                    char = string_char_at(text, cursor_position)
                    char_before = string_char_at(text, (cursor_position - 1))
                    if ((!keyboard_check(vk_control)) || char == "\n" || char_before == "\n" || (string_lettersdigits_universal(char) != "" && string_lettersdigits_universal(char_before) == ""))
                    {
                    }
                    else
                        continue
                }
            }
            action = 3
            break
        }
        else
        {
            keyboard_string = string_replace_all(keyboard_string, "", "")
            if (keyboard_string != "")
            {
                add_to_text = keyboard_string
                action = 1
                break
            }
            else
                break
        }
    }
    else if (max_undo_redo_states != 0 && keyboard_check(vk_control))
    {
        if (((keyboard_check(vk_shift) && key_pressed == 90) || key_pressed == 89) && undo_redo_position < (ds_list_size(undo_redo_text_list) - 1))
        {
            undo_redo_position++
            text = ds_list_find_value(undo_redo_text_list, undo_redo_position)
            cursor_position = ds_list_find_value(undo_redo_cursor_position_list, undo_redo_position)
            if selection_enabled
                selection_start = 0
            cursor_stay_visible = true
            action = 5
            break
        }
        else if ((!keyboard_check(vk_shift)) && key_pressed == 90 && undo_redo_position > 0)
        {
            undo_redo_position--
            text = ds_list_find_value(undo_redo_text_list, undo_redo_position)
            cursor_position = ds_list_find_value(undo_redo_cursor_position_list, undo_redo_position)
            if selection_enabled
                selection_start = 0
            cursor_stay_visible = true
            action = 5
            break
        }
        else if (selection_enabled && keyboard_check(vk_control) && key_pressed == 65)
        {
            selection_start = 1
            cursor_position = string_length(text) + 1
            selection_update = true
            action = 3
            break
        }
        else if (mouse_check_button_pressed(mb_left) || (selection_enabled && mouse_check_button(mb_left) && (m_x != m_x_previous || m_y != m_y_previous)) || (multiline && ((mouse_wheel_up() && activated) || (mouse_wheel_down() && activated) || key_pressed == 38 || key_pressed == 40 || key_pressed == 33 || key_pressed == 34)))
        {
            if selection_enabled
            {
                var double_clicked = false
                if mouse_check_button_pressed(mb_left)
                {
                    var _temp_local_var_50 = (enabled_step > 1 && selection_start == 0 && m_x == m_x_previous && m_y == m_y_previous && (get_timer() - mouse_pressed_previous) < double_click_time && (string_lettersdigits_universal(string_char_at(text, cursor_position)) != "" || string_lettersdigits_universal(string_char_at(text, (cursor_position - 1))) != ""))
                    double_clicked = (enabled_step > 1 && selection_start == 0 && m_x == m_x_previous && m_y == m_y_previous && (get_timer() - mouse_pressed_previous) < double_click_time && (string_lettersdigits_universal(string_char_at(text, cursor_position)) != "" || string_lettersdigits_universal(string_char_at(text, (cursor_position - 1))) != ""))
                    mouse_pressed_previous = get_timer()
                }
            }
            if (selection_enabled && double_clicked)
            {
                mouse_clear(mb_left)
                if (multiline && cursor_position < 0)
                    cursor_position = (-cursor_position) + 1
                selection_start = cursor_position
                while true
                {
                    var char = string_char_at(text, selection_start)
                    if (selection_start == 1)
                        var char_before = ""
                    else
                        char_before = string_char_at(text, (selection_start - 1))
                    if (string_lettersdigits_universal(char) != "" && string_lettersdigits_universal(char_before) == "")
                        break
                    else
                    {
                        selection_start--
                        if (selection_start <= 1)
                            break
                        else
                            continue
                    }
                }
                while true
                {
                    char = string_char_at(text, cursor_position)
                    if (cursor_position == 1)
                        char_before = ""
                    else
                        char_before = string_char_at(text, (cursor_position - 1))
                    if (string_lettersdigits_universal(char) == "" && string_lettersdigits_universal(char_before) != "")
                        break
                    else
                    {
                        cursor_position++
                        if (cursor_position > string_length(text))
                            break
                        else
                            continue
                    }
                }
                selection_update = true
            }
            else
            {
                var searched_width = 0
                var smallest = -1
                if multiline
                {
                    if (key_pressed == 38 || mouse_wheel_up())
                    {
                        var line = cursor_line - 1
                        if keyboard_check(vk_control)
                        {
                            while (line > 0)
                            {
                                if (((ds_list_find_value(new_line_list, line)) - 1) == ds_list_find_value(new_line_list, (line - 1)) && cursor_position != ((ds_list_find_value(new_line_list, line)) + 1) && string_char_at(text, ((ds_list_find_value(new_line_list, line)) + 1)) != "\n")
                                    break
                                else
                                {
                                    line--
                                    continue
                                }
                            }
                        }
                    }
                    else if (key_pressed == 40 || mouse_wheel_down())
                    {
                        line = cursor_line + 1
                        if keyboard_check(vk_control)
                        {
                            while (line < (lines - 1))
                            {
                                if (((ds_list_find_value(new_line_list, line)) - 1) == ds_list_find_value(new_line_list, (line - 1)) && string_char_at(text, ((ds_list_find_value(new_line_list, line)) + 1)) != "\n")
                                    break
                                else
                                {
                                    line++
                                    continue
                                }
                            }
                        }
                    }
                    else if (key_pressed == 33)
                    {
                        if keyboard_check(vk_control)
                        {
                            if (v_align == 0)
                                line = ceil((-offset_y) / line_separation)
                            else if (v_align == 2)
                                line = ceil(lines - (offset_y + height) / line_separation)
                            else
                                line = ceil(lines * 0.5 - (height * 0.5 + offset_y) / line_separation)
                        }
                        else
                        {
                            line = cursor_line - (height div line_separation)
                            offset_y += ((height div line_separation) * line_separation)
                        }
                    }
                    else if (key_pressed == 34)
                    {
                        if keyboard_check(vk_control)
                        {
                            if (v_align == 0)
                                line = floor((height - offset_y) / line_separation - 1)
                            else if (v_align == 2)
                                line = floor(lines - offset_y / line_separation - 1)
                            else
                                line = floor(lines * 0.5 + (height * 0.5 - offset_y) / line_separation - 1)
                        }
                        else
                        {
                            line = cursor_line + (height div line_separation)
                            offset_y -= ((height div line_separation) * line_separation)
                        }
                    }
                    else
                        line = (m_y - offset_y - v_align_offset) div line_separation
                    line = clamp(line, 0, (lines - 1))
                    my_current_line = line
                    cursor_position = (ds_list_find_value(new_line_list, line)) + 1
                    var last_index = (min(ds_list_find_value(new_line_list, (line + 1)), string_length(text))) + 1
                    show_debug_message(new_line_list)
                    var line_width = string_width(string_copy(text, cursor_position, (last_index - cursor_position)))
                }
                else
                {
                    cursor_position = 1
                    last_index = string_length(text) + 1
                    line_width = text_width
                }
                if (multiline && (key_pressed == 38 || key_pressed == 40 || mouse_wheel_down() || mouse_wheel_up()))
                {
                    if keyboard_check(vk_control)
                        var target_width = (-line_width)
                    else
                        target_width = cursor_offset_x - offset_x
                }
                else if (multiline && (key_pressed == 33 || key_pressed == 34))
                    target_width = cursor_offset_x - offset_x
                else
                    target_width = m_x - offset_x
                if (h_align == 1)
                    target_width += (line_width >> 1)
                else if (h_align == 2)
                    target_width += line_width
                if (target_width > 0)
                {
                    while true
                    {
                        if (smallest == -1 || abs(target_width - searched_width) <= smallest)
                        {
                            smallest = abs(target_width - searched_width)
                            if (cursor_position == last_index)
                                break
                            else
                            {
                                searched_width += string_width(string_char_at(text, cursor_position))
                                cursor_position++
                                continue
                            }
                        }
                        else
                        {
                            cursor_position--
                            break
                        }
                    }
                }
                if (multiline && cursor_position == last_index && (cursor_position - 1) < string_length(text))
                {
                    cursor_position--
                    if (string_char_at(text, cursor_position) != "\n")
                        cursor_position *= -1
                }
            }
            m_x_previous = m_x
            m_y_previous = m_y
            action = 3
            break
        }
        else if (clipboard_pasting_enabled && keyboard_check(vk_control) && key_pressed == 86 && ((os_type != os_windows && true && global.clipboard_local != "") || clipboard_has_text()))
        {
            if (os_type == os_windows && true)
                s = clipboard_get_text()
            else
                s = global.clipboard_local
            add_to_text = string_replace_all(s, "\r", "")
            if (!multiline)
                add_to_text = string_replace_all(add_to_text, "\n", "")
            action = 7
            break
        }
        else if (multiline && key_pressed == 13)
        {
            add_to_text = "\n"
            action = 4
            break
        }
        else if (key_pressed == 46)
        {
            if (selection_enabled && selection_start != 0)
            {
                action = 2
                break
            }
            else if (cursor_position <= string_length(text))
            {
                var position = cursor_position
                if keyboard_check(vk_control)
                {
                    while (position <= string_length(text))
                    {
                        char = string_char_at(text, position)
                        var char_next = string_char_at(text, (position + 1))
                        if (char == "\n" || char_next == "\n" || (string_lettersdigits_universal(char) == "" && string_lettersdigits_universal(char_next) != ""))
                            break
                        else
                        {
                            position++
                            continue
                        }
                    }
                }
                text = string_delete(text, cursor_position, (position - cursor_position + 1))
                cursor_stay_visible = true
                action = 2
                break
            }
            else if (key_pressed == 8)
            {
                if (selection_enabled && selection_start != 0)
                {
                    action = 2
                    break
                }
                else if (cursor_position > 1)
                {
                    position = cursor_position - 1
                    if keyboard_check(vk_control)
                    {
                        while (position > 1)
                        {
                            char = string_char_at(text, position)
                            char_before = string_char_at(text, (position - 1))
                            if (char == "\n" || char_before == "\n" || (string_lettersdigits_universal(char) != "" && string_lettersdigits_universal(char_before) == ""))
                                break
                            else
                            {
                                position--
                                continue
                            }
                        }
                    }
                    text = string_delete(text, position, (cursor_position - position))
                    cursor_position = position
                    action = 2
                    break
                }
                else if (key_pressed == 36)
                {
                    if (multiline && (!keyboard_check(vk_control)))
                        cursor_position = (ds_list_find_value(new_line_list, cursor_line)) + 1
                    else
                        cursor_position = 1
                    action = 3
                    break
                }
                else if (key_pressed == 35)
                {
                    if (multiline && (!keyboard_check(vk_control)))
                    {
                        cursor_position = ds_list_find_value(new_line_list, (cursor_line + 1))
                        if (cursor_position <= string_length(text) && string_char_at(text, cursor_position) != "\n")
                            cursor_position *= -1
                    }
                    else
                        cursor_position = string_length(text) + 1
                    action = 3
                    break
                }
                else if (key_pressed == 39 || key_pressed == 37)
                {
                    while (true)
                    {
                        if (key_pressed == 39)
                        {
                            if (cursor_position > string_length(text))
                            {
                            }
                            else
                            {
                                cursor_position++
                                char = string_char_at(text, cursor_position)
                                char_before = string_char_at(text, (cursor_position - 1))
                                if ((!keyboard_check(vk_control)) || char == "\n" || char_before == "\n" || (string_lettersdigits_universal(char) != "" && string_lettersdigits_universal(char_before) == ""))
                                {
                                }
                                else
                                    continue
                            }
                        }
                        else if (cursor_position == 1)
                        {
                        }
                        else
                        {
                            cursor_position--
                            char = string_char_at(text, cursor_position)
                            char_before = string_char_at(text, (cursor_position - 1))
                            if ((!keyboard_check(vk_control)) || char == "\n" || char_before == "\n" || (string_lettersdigits_universal(char) != "" && string_lettersdigits_universal(char_before) == ""))
                            {
                            }
                            else
                                continue
                        }
                    }
                    action = 3
                    break
                }
                else
                {
                    keyboard_string = string_replace_all(keyboard_string, "", "")
                    if (keyboard_string != "")
                    {
                        add_to_text = keyboard_string
                        action = 1
                        break
                    }
                    else
                        break
                }
            }
            else if (key_pressed == 36)
            {
                if (multiline && (!keyboard_check(vk_control)))
                    cursor_position = (ds_list_find_value(new_line_list, cursor_line)) + 1
                else
                    cursor_position = 1
                action = 3
                break
            }
            else if (key_pressed == 35)
            {
                if (multiline && (!keyboard_check(vk_control)))
                {
                    cursor_position = ds_list_find_value(new_line_list, (cursor_line + 1))
                    if (cursor_position <= string_length(text) && string_char_at(text, cursor_position) != "\n")
                        cursor_position *= -1
                }
                else
                    cursor_position = string_length(text) + 1
                action = 3
                break
            }
            else if (key_pressed == 39 || key_pressed == 37)
            {
                while (true)
                {
                    if (key_pressed == 39)
                    {
                        if (cursor_position > string_length(text))
                        {
                        }
                        else
                        {
                            cursor_position++
                            char = string_char_at(text, cursor_position)
                            char_before = string_char_at(text, (cursor_position - 1))
                            if ((!keyboard_check(vk_control)) || char == "\n" || char_before == "\n" || (string_lettersdigits_universal(char) != "" && string_lettersdigits_universal(char_before) == ""))
                            {
                            }
                            else
                                continue
                        }
                    }
                    else if (cursor_position == 1)
                    {
                    }
                    else
                    {
                        cursor_position--
                        char = string_char_at(text, cursor_position)
                        char_before = string_char_at(text, (cursor_position - 1))
                        if ((!keyboard_check(vk_control)) || char == "\n" || char_before == "\n" || (string_lettersdigits_universal(char) != "" && string_lettersdigits_universal(char_before) == ""))
                        {
                        }
                        else
                            continue
                    }
                }
                action = 3
                break
            }
            else
            {
                keyboard_string = string_replace_all(keyboard_string, "", "")
                if (keyboard_string != "")
                {
                    add_to_text = keyboard_string
                    action = 1
                    break
                }
                else
                    break
            }
        }
        else if (key_pressed == 8)
        {
            if (selection_enabled && selection_start != 0)
            {
                action = 2
                break
            }
            else if (cursor_position > 1)
            {
                position = cursor_position - 1
                if keyboard_check(vk_control)
                {
                    while (position > 1)
                    {
                        char = string_char_at(text, position)
                        char_before = string_char_at(text, (position - 1))
                        if (char == "\n" || char_before == "\n" || (string_lettersdigits_universal(char) != "" && string_lettersdigits_universal(char_before) == ""))
                            break
                        else
                        {
                            position--
                            continue
                        }
                    }
                }
                text = string_delete(text, position, (cursor_position - position))
                cursor_position = position
                action = 2
                break
            }
            else if (key_pressed == 36)
            {
                if (multiline && (!keyboard_check(vk_control)))
                    cursor_position = (ds_list_find_value(new_line_list, cursor_line)) + 1
                else
                    cursor_position = 1
                action = 3
                break
            }
            else if (key_pressed == 35)
            {
                if (multiline && (!keyboard_check(vk_control)))
                {
                    cursor_position = ds_list_find_value(new_line_list, (cursor_line + 1))
                    if (cursor_position <= string_length(text) && string_char_at(text, cursor_position) != "\n")
                        cursor_position *= -1
                }
                else
                    cursor_position = string_length(text) + 1
                action = 3
                break
            }
            else if (key_pressed == 39 || key_pressed == 37)
            {
                while (true)
                {
                    if (key_pressed == 39)
                    {
                        if (cursor_position > string_length(text))
                        {
                        }
                        else
                        {
                            cursor_position++
                            char = string_char_at(text, cursor_position)
                            char_before = string_char_at(text, (cursor_position - 1))
                            if ((!keyboard_check(vk_control)) || char == "\n" || char_before == "\n" || (string_lettersdigits_universal(char) != "" && string_lettersdigits_universal(char_before) == ""))
                            {
                            }
                            else
                                continue
                        }
                    }
                    else if (cursor_position == 1)
                    {
                    }
                    else
                    {
                        cursor_position--
                        char = string_char_at(text, cursor_position)
                        char_before = string_char_at(text, (cursor_position - 1))
                        if ((!keyboard_check(vk_control)) || char == "\n" || char_before == "\n" || (string_lettersdigits_universal(char) != "" && string_lettersdigits_universal(char_before) == ""))
                        {
                        }
                        else
                            continue
                    }
                }
                action = 3
                break
            }
            else
            {
                keyboard_string = string_replace_all(keyboard_string, "", "")
                if (keyboard_string != "")
                {
                    add_to_text = keyboard_string
                    action = 1
                    break
                }
                else
                    break
            }
        }
        else if (key_pressed == 36)
        {
            if (multiline && (!keyboard_check(vk_control)))
                cursor_position = (ds_list_find_value(new_line_list, cursor_line)) + 1
            else
                cursor_position = 1
            action = 3
            break
        }
        else if (key_pressed == 35)
        {
            if (multiline && (!keyboard_check(vk_control)))
            {
                cursor_position = ds_list_find_value(new_line_list, (cursor_line + 1))
                if (cursor_position <= string_length(text) && string_char_at(text, cursor_position) != "\n")
                    cursor_position *= -1
            }
            else
                cursor_position = string_length(text) + 1
            action = 3
            break
        }
        else if (key_pressed == 39 || key_pressed == 37)
        {
            while (true)
            {
                if (key_pressed == 39)
                {
                    if (cursor_position > string_length(text))
                    {
                    }
                    else
                    {
                        cursor_position++
                        char = string_char_at(text, cursor_position)
                        char_before = string_char_at(text, (cursor_position - 1))
                        if ((!keyboard_check(vk_control)) || char == "\n" || char_before == "\n" || (string_lettersdigits_universal(char) != "" && string_lettersdigits_universal(char_before) == ""))
                        {
                        }
                        else
                            continue
                    }
                }
                else if (cursor_position == 1)
                {
                }
                else
                {
                    cursor_position--
                    char = string_char_at(text, cursor_position)
                    char_before = string_char_at(text, (cursor_position - 1))
                    if ((!keyboard_check(vk_control)) || char == "\n" || char_before == "\n" || (string_lettersdigits_universal(char) != "" && string_lettersdigits_universal(char_before) == ""))
                    {
                    }
                    else
                        continue
                }
            }
            action = 3
            break
        }
        else
        {
            keyboard_string = string_replace_all(keyboard_string, "", "")
            if (keyboard_string != "")
            {
                add_to_text = keyboard_string
                action = 1
                break
            }
            else
                break
        }
    }
    else if (selection_enabled && keyboard_check(vk_control) && key_pressed == 65)
    {
        selection_start = 1
        cursor_position = string_length(text) + 1
        selection_update = true
        action = 3
        break
    }
    else if (mouse_check_button_pressed(mb_left) || (selection_enabled && mouse_check_button(mb_left) && (m_x != m_x_previous || m_y != m_y_previous)) || (multiline && ((mouse_wheel_up() && activated) || (mouse_wheel_down() && activated) || key_pressed == 38 || key_pressed == 40 || key_pressed == 33 || key_pressed == 34)))
    {
        if selection_enabled
        {
            var double_clicked = false
            if mouse_check_button_pressed(mb_left)
            {
                var _temp_local_var_50 = (enabled_step > 1 && selection_start == 0 && m_x == m_x_previous && m_y == m_y_previous && (get_timer() - mouse_pressed_previous) < double_click_time && (string_lettersdigits_universal(string_char_at(text, cursor_position)) != "" || string_lettersdigits_universal(string_char_at(text, (cursor_position - 1))) != ""))
                double_clicked = (enabled_step > 1 && selection_start == 0 && m_x == m_x_previous && m_y == m_y_previous && (get_timer() - mouse_pressed_previous) < double_click_time && (string_lettersdigits_universal(string_char_at(text, cursor_position)) != "" || string_lettersdigits_universal(string_char_at(text, (cursor_position - 1))) != ""))
                mouse_pressed_previous = get_timer()
            }
        }
        if (selection_enabled && double_clicked)
        {
            mouse_clear(mb_left)
            if (multiline && cursor_position < 0)
                cursor_position = (-cursor_position) + 1
            selection_start = cursor_position
            while true
            {
                var char = string_char_at(text, selection_start)
                if (selection_start == 1)
                    var char_before = ""
                else
                    char_before = string_char_at(text, (selection_start - 1))
                if (string_lettersdigits_universal(char) != "" && string_lettersdigits_universal(char_before) == "")
                    break
                else
                {
                    selection_start--
                    if (selection_start <= 1)
                        break
                    else
                        continue
                }
            }
            while true
            {
                char = string_char_at(text, cursor_position)
                if (cursor_position == 1)
                    char_before = ""
                else
                    char_before = string_char_at(text, (cursor_position - 1))
                if (string_lettersdigits_universal(char) == "" && string_lettersdigits_universal(char_before) != "")
                    break
                else
                {
                    cursor_position++
                    if (cursor_position > string_length(text))
                        break
                    else
                        continue
                }
            }
            selection_update = true
        }
        else
        {
            var searched_width = 0
            var smallest = -1
            if multiline
            {
                if (key_pressed == 38 || mouse_wheel_up())
                {
                    var line = cursor_line - 1
                    if keyboard_check(vk_control)
                    {
                        while (line > 0)
                        {
                            if (((ds_list_find_value(new_line_list, line)) - 1) == ds_list_find_value(new_line_list, (line - 1)) && cursor_position != ((ds_list_find_value(new_line_list, line)) + 1) && string_char_at(text, ((ds_list_find_value(new_line_list, line)) + 1)) != "\n")
                                break
                            else
                            {
                                line--
                                continue
                            }
                        }
                    }
                }
                else if (key_pressed == 40 || mouse_wheel_down())
                {
                    line = cursor_line + 1
                    if keyboard_check(vk_control)
                    {
                        while (line < (lines - 1))
                        {
                            if (((ds_list_find_value(new_line_list, line)) - 1) == ds_list_find_value(new_line_list, (line - 1)) && string_char_at(text, ((ds_list_find_value(new_line_list, line)) + 1)) != "\n")
                                break
                            else
                            {
                                line++
                                continue
                            }
                        }
                    }
                }
                else if (key_pressed == 33)
                {
                    if keyboard_check(vk_control)
                    {
                        if (v_align == 0)
                            line = ceil((-offset_y) / line_separation)
                        else if (v_align == 2)
                            line = ceil(lines - (offset_y + height) / line_separation)
                        else
                            line = ceil(lines * 0.5 - (height * 0.5 + offset_y) / line_separation)
                    }
                    else
                    {
                        line = cursor_line - (height div line_separation)
                        offset_y += ((height div line_separation) * line_separation)
                    }
                }
                else if (key_pressed == 34)
                {
                    if keyboard_check(vk_control)
                    {
                        if (v_align == 0)
                            line = floor((height - offset_y) / line_separation - 1)
                        else if (v_align == 2)
                            line = floor(lines - offset_y / line_separation - 1)
                        else
                            line = floor(lines * 0.5 + (height * 0.5 - offset_y) / line_separation - 1)
                    }
                    else
                    {
                        line = cursor_line + (height div line_separation)
                        offset_y -= ((height div line_separation) * line_separation)
                    }
                }
                else
                    line = (m_y - offset_y - v_align_offset) div line_separation
                line = clamp(line, 0, (lines - 1))
                my_current_line = line
                cursor_position = (ds_list_find_value(new_line_list, line)) + 1
                var last_index = (min(ds_list_find_value(new_line_list, (line + 1)), string_length(text))) + 1
                show_debug_message(new_line_list)
                var line_width = string_width(string_copy(text, cursor_position, (last_index - cursor_position)))
            }
            else
            {
                cursor_position = 1
                last_index = string_length(text) + 1
                line_width = text_width
            }
            if (multiline && (key_pressed == 38 || key_pressed == 40 || mouse_wheel_down() || mouse_wheel_up()))
            {
                if keyboard_check(vk_control)
                    var target_width = (-line_width)
                else
                    target_width = cursor_offset_x - offset_x
            }
            else if (multiline && (key_pressed == 33 || key_pressed == 34))
                target_width = cursor_offset_x - offset_x
            else
                target_width = m_x - offset_x
            if (h_align == 1)
                target_width += (line_width >> 1)
            else if (h_align == 2)
                target_width += line_width
            if (target_width > 0)
            {
                while true
                {
                    if (smallest == -1 || abs(target_width - searched_width) <= smallest)
                    {
                        smallest = abs(target_width - searched_width)
                        if (cursor_position == last_index)
                            break
                        else
                        {
                            searched_width += string_width(string_char_at(text, cursor_position))
                            cursor_position++
                            continue
                        }
                    }
                    else
                    {
                        cursor_position--
                        break
                    }
                }
            }
            if (multiline && cursor_position == last_index && (cursor_position - 1) < string_length(text))
            {
                cursor_position--
                if (string_char_at(text, cursor_position) != "\n")
                    cursor_position *= -1
            }
        }
        m_x_previous = m_x
        m_y_previous = m_y
        action = 3
        break
    }
    else if (clipboard_pasting_enabled && keyboard_check(vk_control) && key_pressed == 86 && ((os_type != os_windows && true && global.clipboard_local != "") || clipboard_has_text()))
    {
        if (os_type == os_windows && true)
            s = clipboard_get_text()
        else
            s = global.clipboard_local
        add_to_text = string_replace_all(s, "\r", "")
        if (!multiline)
            add_to_text = string_replace_all(add_to_text, "\n", "")
        action = 7
        break
    }
    else if (multiline && key_pressed == 13)
    {
        add_to_text = "\n"
        action = 4
        break
    }
    else if (key_pressed == 46)
    {
        if (selection_enabled && selection_start != 0)
        {
            action = 2
            break
        }
        else if (cursor_position <= string_length(text))
        {
            var position = cursor_position
            if keyboard_check(vk_control)
            {
                while (position <= string_length(text))
                {
                    char = string_char_at(text, position)
                    var char_next = string_char_at(text, (position + 1))
                    if (char == "\n" || char_next == "\n" || (string_lettersdigits_universal(char) == "" && string_lettersdigits_universal(char_next) != ""))
                        break
                    else
                    {
                        position++
                        continue
                    }
                }
            }
            text = string_delete(text, cursor_position, (position - cursor_position + 1))
            cursor_stay_visible = true
            action = 2
            break
        }
        else if (key_pressed == 8)
        {
            if (selection_enabled && selection_start != 0)
            {
                action = 2
                break
            }
            else if (cursor_position > 1)
            {
                position = cursor_position - 1
                if keyboard_check(vk_control)
                {
                    while (position > 1)
                    {
                        char = string_char_at(text, position)
                        char_before = string_char_at(text, (position - 1))
                        if (char == "\n" || char_before == "\n" || (string_lettersdigits_universal(char) != "" && string_lettersdigits_universal(char_before) == ""))
                            break
                        else
                        {
                            position--
                            continue
                        }
                    }
                }
                text = string_delete(text, position, (cursor_position - position))
                cursor_position = position
                action = 2
                break
            }
            else if (key_pressed == 36)
            {
                if (multiline && (!keyboard_check(vk_control)))
                    cursor_position = (ds_list_find_value(new_line_list, cursor_line)) + 1
                else
                    cursor_position = 1
                action = 3
                break
            }
            else if (key_pressed == 35)
            {
                if (multiline && (!keyboard_check(vk_control)))
                {
                    cursor_position = ds_list_find_value(new_line_list, (cursor_line + 1))
                    if (cursor_position <= string_length(text) && string_char_at(text, cursor_position) != "\n")
                        cursor_position *= -1
                }
                else
                    cursor_position = string_length(text) + 1
                action = 3
                break
            }
            else if (key_pressed == 39 || key_pressed == 37)
            {
                while (true)
                {
                    if (key_pressed == 39)
                    {
                        if (cursor_position > string_length(text))
                        {
                        }
                        else
                        {
                            cursor_position++
                            char = string_char_at(text, cursor_position)
                            char_before = string_char_at(text, (cursor_position - 1))
                            if ((!keyboard_check(vk_control)) || char == "\n" || char_before == "\n" || (string_lettersdigits_universal(char) != "" && string_lettersdigits_universal(char_before) == ""))
                            {
                            }
                            else
                                continue
                        }
                    }
                    else if (cursor_position == 1)
                    {
                    }
                    else
                    {
                        cursor_position--
                        char = string_char_at(text, cursor_position)
                        char_before = string_char_at(text, (cursor_position - 1))
                        if ((!keyboard_check(vk_control)) || char == "\n" || char_before == "\n" || (string_lettersdigits_universal(char) != "" && string_lettersdigits_universal(char_before) == ""))
                        {
                        }
                        else
                            continue
                    }
                }
                action = 3
                break
            }
            else
            {
                keyboard_string = string_replace_all(keyboard_string, "", "")
                if (keyboard_string != "")
                {
                    add_to_text = keyboard_string
                    action = 1
                    break
                }
                else
                    break
            }
        }
        else if (key_pressed == 36)
        {
            if (multiline && (!keyboard_check(vk_control)))
                cursor_position = (ds_list_find_value(new_line_list, cursor_line)) + 1
            else
                cursor_position = 1
            action = 3
            break
        }
        else if (key_pressed == 35)
        {
            if (multiline && (!keyboard_check(vk_control)))
            {
                cursor_position = ds_list_find_value(new_line_list, (cursor_line + 1))
                if (cursor_position <= string_length(text) && string_char_at(text, cursor_position) != "\n")
                    cursor_position *= -1
            }
            else
                cursor_position = string_length(text) + 1
            action = 3
            break
        }
        else if (key_pressed == 39 || key_pressed == 37)
        {
            while (true)
            {
                if (key_pressed == 39)
                {
                    if (cursor_position > string_length(text))
                    {
                    }
                    else
                    {
                        cursor_position++
                        char = string_char_at(text, cursor_position)
                        char_before = string_char_at(text, (cursor_position - 1))
                        if ((!keyboard_check(vk_control)) || char == "\n" || char_before == "\n" || (string_lettersdigits_universal(char) != "" && string_lettersdigits_universal(char_before) == ""))
                        {
                        }
                        else
                            continue
                    }
                }
                else if (cursor_position == 1)
                {
                }
                else
                {
                    cursor_position--
                    char = string_char_at(text, cursor_position)
                    char_before = string_char_at(text, (cursor_position - 1))
                    if ((!keyboard_check(vk_control)) || char == "\n" || char_before == "\n" || (string_lettersdigits_universal(char) != "" && string_lettersdigits_universal(char_before) == ""))
                    {
                    }
                    else
                        continue
                }
            }
            action = 3
            break
        }
        else
        {
            keyboard_string = string_replace_all(keyboard_string, "", "")
            if (keyboard_string != "")
            {
                add_to_text = keyboard_string
                action = 1
                break
            }
            else
                break
        }
    }
    else if (key_pressed == 8)
    {
        if (selection_enabled && selection_start != 0)
        {
            action = 2
            break
        }
        else if (cursor_position > 1)
        {
            position = cursor_position - 1
            if keyboard_check(vk_control)
            {
                while (position > 1)
                {
                    char = string_char_at(text, position)
                    char_before = string_char_at(text, (position - 1))
                    if (char == "\n" || char_before == "\n" || (string_lettersdigits_universal(char) != "" && string_lettersdigits_universal(char_before) == ""))
                        break
                    else
                    {
                        position--
                        continue
                    }
                }
            }
            text = string_delete(text, position, (cursor_position - position))
            cursor_position = position
            action = 2
            break
        }
        else if (key_pressed == 36)
        {
            if (multiline && (!keyboard_check(vk_control)))
                cursor_position = (ds_list_find_value(new_line_list, cursor_line)) + 1
            else
                cursor_position = 1
            action = 3
            break
        }
        else if (key_pressed == 35)
        {
            if (multiline && (!keyboard_check(vk_control)))
            {
                cursor_position = ds_list_find_value(new_line_list, (cursor_line + 1))
                if (cursor_position <= string_length(text) && string_char_at(text, cursor_position) != "\n")
                    cursor_position *= -1
            }
            else
                cursor_position = string_length(text) + 1
            action = 3
            break
        }
        else if (key_pressed == 39 || key_pressed == 37)
        {
            while (true)
            {
                if (key_pressed == 39)
                {
                    if (cursor_position > string_length(text))
                    {
                    }
                    else
                    {
                        cursor_position++
                        char = string_char_at(text, cursor_position)
                        char_before = string_char_at(text, (cursor_position - 1))
                        if ((!keyboard_check(vk_control)) || char == "\n" || char_before == "\n" || (string_lettersdigits_universal(char) != "" && string_lettersdigits_universal(char_before) == ""))
                        {
                        }
                        else
                            continue
                    }
                }
                else if (cursor_position == 1)
                {
                }
                else
                {
                    cursor_position--
                    char = string_char_at(text, cursor_position)
                    char_before = string_char_at(text, (cursor_position - 1))
                    if ((!keyboard_check(vk_control)) || char == "\n" || char_before == "\n" || (string_lettersdigits_universal(char) != "" && string_lettersdigits_universal(char_before) == ""))
                    {
                    }
                    else
                        continue
                }
            }
            action = 3
            break
        }
        else
        {
            keyboard_string = string_replace_all(keyboard_string, "", "")
            if (keyboard_string != "")
            {
                add_to_text = keyboard_string
                action = 1
                break
            }
            else
                break
        }
    }
    else if (key_pressed == 36)
    {
        if (multiline && (!keyboard_check(vk_control)))
            cursor_position = (ds_list_find_value(new_line_list, cursor_line)) + 1
        else
            cursor_position = 1
        action = 3
        break
    }
    else if (key_pressed == 35)
    {
        if (multiline && (!keyboard_check(vk_control)))
        {
            cursor_position = ds_list_find_value(new_line_list, (cursor_line + 1))
            if (cursor_position <= string_length(text) && string_char_at(text, cursor_position) != "\n")
                cursor_position *= -1
        }
        else
            cursor_position = string_length(text) + 1
        action = 3
        break
    }
    else if (key_pressed == 39 || key_pressed == 37)
    {
        while (true)
        {
            if (key_pressed == 39)
            {
                if (cursor_position > string_length(text))
                {
                }
                else
                {
                    cursor_position++
                    char = string_char_at(text, cursor_position)
                    char_before = string_char_at(text, (cursor_position - 1))
                    if ((!keyboard_check(vk_control)) || char == "\n" || char_before == "\n" || (string_lettersdigits_universal(char) != "" && string_lettersdigits_universal(char_before) == ""))
                    {
                    }
                    else
                        continue
                }
            }
            else if (cursor_position == 1)
            {
            }
            else
            {
                cursor_position--
                char = string_char_at(text, cursor_position)
                char_before = string_char_at(text, (cursor_position - 1))
                if ((!keyboard_check(vk_control)) || char == "\n" || char_before == "\n" || (string_lettersdigits_universal(char) != "" && string_lettersdigits_universal(char_before) == ""))
                {
                }
                else
                    continue
            }
        }
        action = 3
        break
    }
    else
    {
        keyboard_string = string_replace_all(keyboard_string, "", "")
        if (keyboard_string != "")
        {
            add_to_text = keyboard_string
            action = 1
            break
        }
        else
            break
    }
}
if action
{
    keyboard_string = ""
    if (action != 3)
    {
        if (selection_enabled && selection_start != 0)
        {
            text = string_delete(text, selection_start_ordered, (selection_end_ordered - selection_start_ordered))
            cursor_position = selection_start_ordered
            selection_start = 0
            cursor_stay_visible = true
        }
        if (add_to_text != "")
        {
            text = string_insert(add_to_text, text, cursor_position)
            cursor_position += string_length(add_to_text)
        }
        if (max_length != -1 && string_length(text) > max_length)
        {
            cursor_position -= (string_length(text) - max_length)
            text = string_delete(text, cursor_position, (string_length(text) - max_length))
        }
    }
    if multiline
    {
        if (action != 3)
        {
            while true
            {
                text_draw = text
                ds_list_clear(new_line_list)
                ds_list_add(new_line_list, 0)
                position = 0
                var offset = 0
                while (position <= string_length(text))
                {
                    var delta_position = string_pos("\n", string_delete(text, 1, position))
                    if (!delta_position)
                        delta_position = string_length(text) + 1 - position
                    if (wrapping_width != -1)
                    {
                        var position_1 = 0
                        var text_line = string_copy(text, (position + 1), (delta_position - 1))
                        searched_width = 0
                        if (string_width(text_line) > wrapping_width)
                        {
                            while true
                            {
                                delta_position_1 = string_pos(" ", string_delete(text_line, 1, position_1))
                                if ((!delta_position_1) || string_width(string_copy(text_line, 1, (position_1 + delta_position_1 - 1))) > wrapping_width)
                                    break
                                else
                                {
                                    position_1 += delta_position_1
                                    continue
                                }
                            }
                            if (h_align == 2 && position_1 == 1 && string_char_at(text_line, 1) == " ")
                                position_1 = 0
                            if (position_1 == 0)
                            {
                                while true
                                {
                                    position_1++
                                    searched_width += string_width(string_char_at(text_line, position_1))
                                    if (searched_width > wrapping_width)
                                    {
                                        position_1--
                                        break
                                    }
                                    else
                                        continue
                                }
                            }
                            if (position_1 == 0 && delta_position != 2)
                                position_1 = 1
                            if (position_1 != 0)
                            {
                                delta_position = position_1 - (h_align == 2 && string_char_at(text_line, position_1) == " " && position_1 != 1)
                                offset++
                                text_draw = string_insert("\n", text_draw, (position + delta_position + offset))
                            }
                        }
                    }
                    position += delta_position
                    ds_list_add(new_line_list, position)
                }
                lines = ds_list_size(new_line_list) - 1
                var i = 1
                var t = abs(cursor_position)
                while (t > ds_list_find_value(new_line_list, i))
                    i++
                cursor_line = i - 1
                if (max_lines != -1 && lines > max_lines)
                {
                    if (lines > (max_lines + 1))
                    {
                        t = ds_list_find_value(new_line_list, (cursor_line + max_lines + 2 - lines))
                        text = string_delete(text, t, (cursor_position - t))
                        cursor_position = t
                    }
                    else
                    {
                        cursor_position--
                        text = string_delete(text, cursor_position, 1)
                    }
                    continue
                }
                else
                    break
            }
        }
        else
        {
            i = 1
            t = abs(cursor_position)
            while (t > ds_list_find_value(new_line_list, i))
                i++
            cursor_line = i - 1
        }
    }
    else
        text_draw = text
    text_width = string_width(text_draw)
    if multiline
    {
        text_height = line_separation * (lines - 1) + char_height
        var text_height_above_cursor = line_separation * cursor_line
        line_width = string_width(string_copy(text, ((ds_list_find_value(new_line_list, cursor_line)) + 1), ((ds_list_find_value(new_line_list, (cursor_line + 1))) - (ds_list_find_value(new_line_list, cursor_line)))))
        if (cursor_position < 0)
            var text_width_left_of_cursor = line_width
        else
            text_width_left_of_cursor = string_width(string_copy(text, ((ds_list_find_value(new_line_list, cursor_line)) + 1), (cursor_position - (ds_list_find_value(new_line_list, cursor_line)) - 1)))
    }
    else
    {
        text_height = char_height
        text_height_above_cursor = 0
        text_width_left_of_cursor = string_width(string_copy(text, 1, (cursor_position - 1)))
        line_width = text_width
    }
    v_align_offset = 0
    cursor_offset_x = text_width_left_of_cursor
    if (h_align == 1)
        cursor_offset_x -= (line_width >> 1)
    else if (h_align == 2)
        cursor_offset_x -= line_width
    if (v_align == 1)
        v_align_offset -= (text_height >> 1)
    else if (v_align == 2)
        v_align_offset -= text_height
    cursor_offset_y = text_height_above_cursor + v_align_offset
    var local_scale_x_previous = local_scale_x
    var local_scale_y_previous = local_scale_y
    if (fit_style == 0)
    {
        offset_x = clamp(offset_x, ((-origin_x) - cursor_offset_x), ((-origin_x) + width - cursor_offset_x))
        offset_y = clamp(offset_y, ((-origin_y) - cursor_offset_y), ((-origin_y) + height - cursor_offset_y - char_height))
        if (h_align == 0)
            offset_x = clamp2(offset_x, (width - text_width), 0)
        else if (h_align == 2)
            offset_x = clamp2(offset_x, 0, (text_width - width))
        else
            offset_x = clamp2(offset_x, ((width - text_width) >> 1), ((text_width - width) >> 1))
        if (v_align == 0)
            offset_y = clamp2(offset_y, (height - text_height), 0)
        else if (v_align == 2)
            offset_y = clamp2(offset_y, 0, (text_height - height))
        else
            offset_y = clamp2(offset_y, ((height - text_height) >> 1), ((text_height - height) >> 1))
        cursor_offset_x += offset_x
        cursor_offset_y += offset_y
    }
    else
    {
        if (text_width <= width)
            local_scale_x = 1
        else
            local_scale_x = width / text_width
        if (text_height <= height)
            local_scale_y = 1
        else
            local_scale_y = height / text_height
        if (fit_style == 1)
        {
            local_scale_x = min(local_scale_x, local_scale_y)
            local_scale_y = local_scale_x
        }
        matrix_local = matrix_build(origin_x, origin_y, 0, 0, 0, 0, local_scale_x, local_scale_y, 1)
        offset_x = 0
        offset_y = 0
    }
    if (local_scale_x != local_scale_x_previous || local_scale_y != local_scale_y_previous)
    {
        image_xscale = global_scale_x * local_scale_x
        image_yscale = global_scale_y * local_scale_y
        matrix_cursor = matrix_build(0, 0, 0, 0, 0, 0, image_xscale, image_yscale, 1)
        matrix_cursor = matrix_multiply(matrix_cursor, matrix_build(x, y, 0, 0, 0, image_angle, 1, 1, 1))
    }
    if (max_undo_redo_states != 0 && action != action_previous && (action != 3 || cursor_position != cursor_position_previous) && action != 9)
    {
        if ((!((action == 3 && action_previous == 5))) && (!((action == 5 && action_previous == 3))))
        {
            if (action == 5)
                undo_redo_position--
            else
            {
                while true
                {
                    var last = ds_list_size(undo_redo_text_list) - 1
                    if (undo_redo_position == (last + 1))
                        break
                    else
                    {
                        ds_list_delete(undo_redo_text_list, last)
                        ds_list_delete(undo_redo_cursor_position_list, last)
                        continue
                    }
                }
            }
            ds_list_add(undo_redo_text_list, text_previous)
            ds_list_add(undo_redo_cursor_position_list, cursor_position_previous)
            if (max_undo_redo_states != -1)
            {
                while (ds_list_size(undo_redo_text_list) > max_undo_redo_states)
                {
                    ds_list_delete(undo_redo_text_list, 0)
                    ds_list_delete(undo_redo_cursor_position_list, 0)
                    undo_redo_position--
                }
            }
            undo_redo_position++
        }
        action_previous = action
    }
    if selection_enabled
    {
        if ((action == 3 && (keyboard_check(vk_shift) || (mouse_check_button(mb_left) && (!mouse_check_button_pressed(mb_left))))) || selection_update)
        {
            if (selection_start == 0 || selection_update)
            {
                if (!selection_update)
                    selection_start = cursor_position_previous
                if multiline
                {
                    if (selection_start < 0)
                        selection_start = (-selection_start) + 1
                    i = 0
                    while (selection_start > ds_list_find_value(new_line_list, i))
                        i++
                    selection_start_line = i - 1
                }
                else
                    selection_start_line = 0
            }
            selection_end = cursor_position
            if multiline
            {
                if (selection_end < 0)
                    selection_end = (-selection_end) + 1
                i = 0
                while (selection_end > ds_list_find_value(new_line_list, i))
                    i++
                selection_end_line = i - 1
            }
            else
                selection_end_line = 0
            if (selection_start == selection_end)
                selection_start = 0
            else if (selection_start < selection_end)
            {
                selection_start_ordered = selection_start
                selection_end_ordered = selection_end
                selection_start_line_ordered = selection_start_line
                selection_end_line_ordered = selection_end_line
            }
            else
            {
                selection_start_ordered = selection_end
                selection_end_ordered = selection_start
                selection_start_line_ordered = selection_end_line
                selection_end_line_ordered = selection_start_line
            }
        }
        else if (selection_start != 0)
        {
            selection_start = 0
            cursor_stay_visible = true
        }
    }
    if (cursor_position != cursor_position_previous)
    {
        cursor_stay_visible = true
        cursor_position_previous = cursor_position
    }
    if (multiline && cursor_position < 0)
        cursor_position = (-cursor_position) + 1
    update_surfaces = true
}
if enabled
{
    enabled_step++
    cursor_timer -= delta_time
    if (cursor_timer <= (-cursor_time) || cursor_stay_visible)
        cursor_timer = cursor_time
}
