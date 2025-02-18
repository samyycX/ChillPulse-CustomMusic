tutorial_text()
switch state
{
    case "tuto":
        var mc_click = mouse_check_button_pressed(mb_left)
        var center_y = display_get_gui_height() / 2
        var center_x = display_get_gui_width() / 2
        draw_set_alpha(0.8)
        draw_set_color(c_black)
        draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false)
        draw_set_color(c_white)
        draw_set_alpha(1)
        draw_sprite_ext(spr_paper_tuto, 0, (display_get_gui_width() / 2), (display_get_gui_height() / 2), 1, 1, 0, c_white, 1)
        draw_set_valign(fa_middle)
        draw_set_halign(fa_center)
        draw_set_font(obj_controller.fontCJK)
        draw_set_color(c_black)
        draw_text_ext_transformed((display_get_gui_width() / 2), (display_get_gui_height() / 2 - 170), text_tutorial[current_page], -1, 1000, 0.75, 0.75, 0)
        draw_set_valign(fa_top)
        draw_set_halign(fa_left)
        draw_set_font(obj_controller.fontCJK_letter)
        if (obj_controller.current_language == 1 || obj_controller.current_language == 2 || obj_controller.current_language == 3)
            draw_text_ext_transformed(340, 310, pages[current_page], -1, -1, 1, 1, 0)
        else
            draw_text_ext_transformed(340, 310, pages[current_page], -1, 600, 1, 1, 0)
        draw_set_font(obj_controller.fontCJK)
        draw_set_color(c_white)
        if button_collision(910, 530, 930, 570)
        {
            draw_sprite_ext(spr_icon_changetheme, 0, 920, 550, -0.6, 0.6, 0, c_black, 0.5)
            if mc_click
                current_page = min((array_length(pages) - 1), (current_page + 1))
        }
        else
            draw_sprite_ext(spr_icon_changetheme, 0, 920, 550, -0.5, 0.5, 0, c_black, 0.5)
        if button_collision(354, 530, 380, 560)
        {
            draw_sprite_ext(spr_icon_changetheme, 0, 370, 550, 0.6, 0.6, 0, c_black, 0.5)
            if mc_click
                current_page = max(0, (current_page - 1))
        }
        else
            draw_sprite_ext(spr_icon_changetheme, 0, 370, 550, 0.5, 0.5, 0, c_black, 0.5)
        draw_set_valign(fa_middle)
        draw_set_halign(fa_center)
        draw_text_transformed_color((display_get_gui_width() / 2), 550, ((string(current_page + 1)) + " / " + string(array_length(pages))), 0.3, 0.3, 0, c_black, c_black, c_black, c_black, 1)
        draw_sprite_ext(spr_icon_pointer, 0, pointer_pos[current_page][0], pointer_pos[current_page][1], 0.75, (0.75 * pointer_pos[current_page][2]), 0, c_white, 1)
        if (current_page == 1)
            draw_sprite_ext(spr_icon_timer, 0, (center_x + 585), 50, 0.6, 0.6, 0, c_white, 1)
        if (current_page == 2)
            draw_sprite_ext(spr_icon_todo, 0, (center_x + 520), 50, 0.5, 0.5, 0, c_white, 1)
        if (current_page == 3)
            draw_sprite_ext(spr_icon_diary, 0, (center_x + 450), 52, 0.8, 0.8, 0, c_white, 1)
        if (current_page == 4)
            draw_sprite_ext(spr_icon_message, 0, (center_x + 380), 52, 0.6, 0.6, 0, c_white, 1)
        if (current_page == 5)
            draw_sprite_ext(spr_icon_earring, 0, (center_x + 310), 52, 0.6, 0.6, 0, c_white, 1)
        if (current_page == 6)
            draw_sprite_ext(spr_icon_timetravel, 0, (center_x + 240), 52, 0.7, 0.7, 0, c_white, 1)
        if (current_page == 7)
            draw_sprite_ext(spr_icon_mail, 0, (center_x + 165), 52, 0.7, 0.7, 0, c_white, 1)
        if (current_page == 8)
            draw_sprite_ext(spr_icon_fullscreen, 0, (display_get_gui_width() - 50), (display_get_gui_height() - 40), 0.5, 0.5, 0, c_white, 1)
        if (current_page == 9)
        {
            draw_sprite_ext(spr_icon_noise, 0, (display_get_gui_width() - 110), (display_get_gui_height() - 40), 0.5, 0.5, 0, c_white, 1)
            draw_sprite_ext(spr_icon_weather, 0, (display_get_gui_width() - 160), (display_get_gui_height() - 40), 0.5, 0.5, 0, c_white, 1)
        }
        if (current_page == 10)
            draw_sprite_ext(spr_icon_sticknotes, 0, (display_get_gui_width() - 220), (display_get_gui_height() - 40), 0.5, 0.5, 0, c_white, 1)
        if (current_page == 11)
            draw_sprite_ext(spr_icon_livechat, 0, 30, 625, 0.6, 0.6, 0, c_white, 1)
        if (current_page == 0)
        {
            with (obj_controller)
            {
                if button_collision(760, 230, 780, 270)
                {
                    draw_sprite_ext(spr_icon_changetheme, 0, 770, 250, -0.6, 0.6, 0, c_black, 0.5)
                    if mc_click
                        current_language = min((array_length(all_language) - 1), (current_language + 1))
                }
                else
                    draw_sprite_ext(spr_icon_changetheme, 0, 770, 250, -0.5, 0.5, 0, c_black, 0.5)
                if button_collision(504, 230, 530, 270)
                {
                    draw_sprite_ext(spr_icon_changetheme, 0, 520, 250, 0.6, 0.6, 0, c_black, 0.5)
                    if mc_click
                        current_language = max(0, (current_language - 1))
                }
                else
                    draw_sprite_ext(spr_icon_changetheme, 0, 520, 250, 0.5, 0.5, 0, c_black, 0.5)
                draw_set_valign(fa_middle)
                draw_set_halign(fa_center)
                draw_text_transformed_color((display_get_gui_width() / 2), 245, all_language[current_language], 0.3, 0.3, 0, c_black, c_black, c_black, c_black, 1)
            }
        }
        if button_clickon(1000, 200)
        {
            obj_controller.tutorial_finish = true
            instance_destroy()
        }
        break
    case "choose":
        draw_set_alpha(0.8)
        draw_set_color(c_black)
        draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false)
        draw_set_color(c_white)
        draw_set_alpha(1)
        draw_set_valign(fa_middle)
        draw_set_halign(fa_center)
        draw_text_transformed_color((display_get_gui_width() / 2), 245, _text_choose_christmas[obj_controller.current_language], 0.3, 0.3, 0, c_white, c_white, c_white, c_white, 1)
        if (button_request_new((display_get_gui_width() / 2 - 200), (display_get_gui_height() / 2 + 100), "yes") == true)
        {
            obj_controller.christmas_mode = 1
            instance_destroy()
        }
        if (button_request_new((display_get_gui_width() / 2 + 200), (display_get_gui_height() / 2 + 100), "no") == true)
        {
            obj_controller.christmas_mode = -1
            instance_destroy()
        }
        break
}

