if keyboard_check_pressed(vk_escape)
    game_end()
if mouse_check_button_pressed(mb_left)
{
    if (mouse_y > (room_height - 80) && ((mouse_x > (room_width - 90) && (true || example != (examples - 1))) || (example != 0 && mouse_x < 90)))
    {
        if (mouse_x < 90)
            example--
        else
            example++
        with (obj_input_text)
            instance_destroy()
        switch example
        {
            case 1:
                var instance = input_text_create_singleline_ext(((room_width >> 1) - 280), floor(room_height * 0.6), 560, ft_input_0, 4210752, 1, -1, 0, 1, true, 0)
                input_text_set_enabled(instance, true)
                break
            case 2:
                input_text_create_multiline_ext(((room_width >> 2) - 238), floor(room_height * 0.35), 476, 318, ft_input_1, 4210752, 1, 476, -1, -1, -1, 0, 0, true, 0)
                input_text_create_multiline_ext(((floor(room_width * 0.75)) - 238), floor(room_height * 0.35), 476, 318, ft_input_1, 4210752, 1, -1, -1, -1, -1, 0, 0, true, 0)
                break
            case 3:
                align_x[0] = 0
                align_x[1] = 1
                align_x[2] = 2
                align_y[0] = 0
                align_y[1] = 1
                align_y[2] = 2
                for (var t_y = 0; t_y < 3; t_y++)
                {
                    for (var t_x = 0; t_x < 3; t_x++)
                        input_text_create_multiline_ext(((room_width >> 1) + (t_x - 1) * 550), ((room_height >> 1) + (t_y - 1) * 220), 313, 96, ft_input_1, 4210752, 1, 313, -1, -1, -1, align_x[t_x], align_y[t_y], true, 0)
                }
                break
            case 4:
                input_text_create_multiline_ext(((room_width >> 1) - 156), ((room_height >> 1) - 120), 313, 96, ft_input_1, 4210752, 1, -1, -1, -1, -1, 0, 0, true, 0)
                input_text_create_multiline_ext(((room_width >> 1) - 156), ((room_height >> 1) + 30), 313, 96, ft_input_1, 4210752, 1, -1, -1, -1, -1, 0, 0, true, 1)
                input_text_create_multiline_ext(((room_width >> 1) - 156), ((room_height >> 1) + 180), 313, 96, ft_input_1, 4210752, 1, -1, -1, -1, -1, 0, 0, true, 2)
                break
            case 5:
                rotated = input_text_create_singleline_ext(((room_width >> 1) - 470), floor(room_height * 0.7), 400, ft_input_0, 4210752, 1, -1, 0, 1, true, 0)
                input_text_set_transformation(rotated, rotated.x, rotated.y, 1, 1, 45)
                colorful = input_text_create_singleline_ext(((room_width >> 1) + 120), floor(room_height * 0.5), 400, ft_input_0, 17561, 1, -1, 0, 1, true, 0)
                input_text_set_misc(colorful, true, spr_input_text_cursor_default, 2, 32, 0, 0.5, 0, 0, true)
                vertical = input_text_create_multiline_ext((room_width >> 1), floor(room_height * 0.3), 84, 400, ft_input_0, 4210752, 1, 0, -1, -1, 38, 1, 0, true, 0)
                break
            case 7:
                game_end()
                break
        }

    }
    if (example == 2)
    {
        with (obj_input_text)
            input_text_set_enabled(id, point_in_rectangle(mouse_x, mouse_y, (x - 16), (y - 16), (x + width + 15), (y + height + 15)))
    }
    if (example == 3 || example == 4)
    {
        with (obj_input_text)
            input_text_set_enabled(id, point_in_rectangle(mouse_x, mouse_y, (x - origin_x - 12), (y - origin_y - 12), (x - origin_x + width + 11), (y - origin_y + height + 11)))
    }
    if (example == 5)
    {
        with (obj_input_text)
        {
            sprite_index = spr_input_3
            if (id == other.vertical)
                image_angle -= 90
            input_text_set_enabled(id, position_meeting(mouse_x, mouse_y, id))
            if (id == other.vertical)
                image_angle += 90
            sprite_index = -1
        }
    }
}
