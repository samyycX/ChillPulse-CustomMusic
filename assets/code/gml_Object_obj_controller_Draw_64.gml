if (mode_switch == true)
    return;
variables()
var center_x = display_get_gui_width() / 2
var center_y = display_get_gui_height() / 2
var mp_width = 500
var mp_height = 100
var mp_x = 400
var mp_y = display_get_gui_height() - 50
var mx_gui = device_mouse_x_to_gui(0)
var my_gui = device_mouse_y_to_gui(0)
var mc_click = mouse_check_button_pressed(mb_left)
var page_timer_x = display_get_gui_width() - 30
var page_timer_y = 100
if (level_count >= 100)
{
    level_count = 0
    level += 1
}
var score_to_draw = convert_number_to_science(score_total)
draw_set_font(fontCJK)
if (page_todo && page_customization == -1 && show_ui == 1)
{
    draw_sprite_stretched_ext(spr_exp_bar_one, 0, 560, 25, (level_count / 100 * 85), 16.8, c_white, 1)
    draw_set_valign(fa_middle)
    draw_set_halign(fa_left)
    draw_sprite_ext(spr_icon_diamond, 0, 430, 32, 0.6, 0.6, 0, c_white, 1)
    draw_text_transformed_color(450, 34, score_to_draw, 0.4, 0.4, 0, c_white, c_white, c_white, c_white, 1)
    draw_sprite_ext(spr_icon_spirit, 0, 560, 34, 0.6, 0.6, 0, c_white, 1)
    draw_set_font(ft_english)
    draw_set_valign(fa_middle)
    draw_set_halign(fa_center)
    draw_text_transformed_color(560, 34, level, 0.3, 0.3, 0, c_black, c_black, c_black, c_black, 0.5)
    draw_set_font(fontCJK)
}
else if (show_ui == 1)
{
    draw_sprite_stretched_ext(spr_exp_bar_one, 0, 170, 25, (level_count / 100 * 85), 16.8, c_white, 1)
    draw_set_valign(fa_middle)
    draw_set_halign(fa_left)
    draw_sprite_ext(spr_icon_diamond, 0, 30, 32, 0.6, 0.6, 0, c_white, 1)
    draw_text_transformed_color(50, 34, score_to_draw, 0.4, 0.4, 0, c_white, c_white, c_white, c_white, 1)
    draw_sprite_ext(spr_icon_spirit, 0, 160, 34, 0.6, 0.6, 0, c_white, 1)
    draw_set_font(ft_english)
    draw_set_valign(fa_middle)
    draw_set_halign(fa_center)
    draw_text_transformed_color(160, 34, level, 0.3, 0.3, 0, c_black, c_black, c_black, c_black, 0.5)
    draw_set_font(fontCJK)
}
if (show_ui == 1)
{
    if (music_playing == 1)
        draw_sprite_ext(spr_mp_play, 0, mp_x, (mp_y + 10), scale_playbutton, scale_playbutton, 0, c_white, 1)
    else
        draw_sprite_ext(spr_mp_play, 1, mp_x, (mp_y + 10), scale_playbutton, scale_playbutton, 0, c_white, 1)
    draw_sprite_ext(spr_mp_next, 0, (mp_x + 50), (mp_y + 10), scale_nextbutton, scale_nextbutton, 0, c_white, 1)
    draw_sprite_ext(spr_mp_next, 0, (mp_x - 55), (mp_y + 10), (-scale_previousbutton), scale_previousbutton, 0, c_white, 1)
    draw_sprite_ext(spr_mp_list, 0, 30, (mp_y + 10), scale_listbutton, scale_listbutton, 0, c_white, 1)
    draw_set_font(fontCJK)
    draw_set_valign(fa_middle)
    draw_set_halign(fa_left)
    if (array_length(music_names) > 0)
        draw_text_ext_transformed(60, (mp_y + 2), music_names[current_music_index], 60, 1000, 0.3, 0.3, 0)
    if button_collision(478, 663, 513, 690)
    {
        draw_sprite_ext(spr_mp_order, music_mode, (mp_x + 100), (mp_y + 10), 1.2, 1.2, 0, c_white, 1)
        if (mc_click && (!page_customization))
        {
            music_mode++
            if (music_mode >= 3)
                music_mode = 0
            if (music_mode == 2)
            {
                random_music_list = []
                for (var ii = 0; ii < array_length(music_list); ii++)
                    array_push(random_music_list, ii)
                random_music_list = array_shuffle(random_music_list)
                current_random_music = 0
            }
        }
    }
    else
        draw_sprite_ext(spr_mp_order, music_mode, (mp_x + 100), (mp_y + 10), 1, 1, 0, c_white, 1)
}
if (!page_scene)
{
    if show_ui
    {
        draw_set_color(c_dkgray)
        draw_line_width((mp_x + 150), (mp_y + 10), (mp_x + 250), (mp_y + 10), 3)
        draw_set_color(c_white)
    }
    var slider_w = 10
    var slider_h = 10
    if button_collision((mp_x + 150), (mp_y + 10 - slider_h), (mp_x + 250 + slider_w), (mp_y + 10 + slider_h))
    {
        if mc_click
            dragging_music_slider = true
    }
    if (dragging_music_slider == true)
    {
        slider_x = mx_gui - 150 - mp_x - slider_w / 2
        slider_x = clamp(slider_x, 0, 100)
        if mouse_check_button_released(mb_left)
            dragging_music_slider = false
    }
    if show_ui
        draw_rectangle((mp_x + 150 + slider_x), (mp_y + 10 - slider_h), (mp_x + 150 + slider_x + slider_w), (mp_y + 10 + slider_h), false)
    var volume = slider_x / 100
    audio_sound_gain(current_music, volume, 10)
}
if (page_stickynotes == -1 && page_drink == -1 && show_ui == 1)
{
    if (button_collision(1205, 647, 1252, 704) && page_drink != 1)
    {
        draw_sprite_ext(spr_icon_fullscreen, 0, (display_get_gui_width() - 50), (display_get_gui_height() - 40), 0.6, 0.6, 0, c_white, 1)
        if mc_click
        {
            if (fullscreen == true)
            {
                fullscreen = false
                window_set_showborder(true)
                window_set_size((display_get_width() / 3 * 2), (display_get_height() / 3 * 2))
                window_set_position((display_get_width() / 6), (display_get_height() / 6))
            }
            else
            {
                fullscreen = true
                window_set_fullscreen(true)
                alarm[4] = 10
            }
        }
    }
    else
        draw_sprite_ext(spr_icon_fullscreen, 0, (display_get_gui_width() - 50), (display_get_gui_height() - 40), 0.5, 0.5, 0, c_white, 1)
    if button_collision(1200, 25, 1250, 66)
    {
        draw_sprite_ext(spr_icon_timer, 0, (center_x + 585), 50, 0.7, 0.7, 0, c_white, 1)
        if (mc_click && page_drink == -1)
            timer_page *= -1
        show_indicator(_text_pomodoro_timer)
    }
    else
        draw_sprite_ext(spr_icon_timer, 0, (center_x + 585), 50, 0.6, 0.6, 0, c_white, 1)
    if button_collision(1135, 18, 1177, 73)
    {
        draw_sprite_ext(spr_icon_todo, 0, (center_x + 520), 50, 0.6, 0.6, 0, c_white, 1)
        if (mc_click && page_drink == -1)
            page_todo *= -1
        show_indicator(_text_todolist)
    }
    else
        draw_sprite_ext(spr_icon_todo, 0, (center_x + 520), 50, 0.5, 0.5, 0, c_white, 1)
    if button_collision(1150, 660, 1190, 690)
    {
        draw_sprite_ext(spr_icon_noise, 0, (display_get_gui_width() - 110), (display_get_gui_height() - 40), 0.6, 0.6, 0, c_white, 1)
        if (mc_click && no_window())
        {
            shutdown_windows()
            page_noise *= -1
            page_weather = -1
        }
        show_indicator(_text_sounds, "top")
    }
    else
        draw_sprite_ext(spr_icon_noise, 0, (display_get_gui_width() - 110), (display_get_gui_height() - 40), 0.5, 0.5, 0, c_white, 1)
    if button_collision(1100, 660, 1140, 690)
    {
        draw_sprite_ext(spr_icon_weather, 0, (display_get_gui_width() - 160), (display_get_gui_height() - 40), 0.6, 0.6, 0, c_white, 1)
        if (mc_click && no_window())
        {
            shutdown_windows()
            page_weather *= -1
            page_noise = -1
        }
        show_indicator(_text_weather, "top")
    }
    else
        draw_sprite_ext(spr_icon_weather, 0, (display_get_gui_width() - 160), (display_get_gui_height() - 40), 0.5, 0.5, 0, c_white, 1)
    if button_collision(1040, 660, 1080, 690)
    {
        draw_sprite_ext(spr_icon_sticknotes, 0, (display_get_gui_width() - 220), (display_get_gui_height() - 40), 0.6, 0.6, 0, c_white, 1)
        if (mc_click && no_window())
        {
            shutdown_windows()
            page_stickynotes *= -1
        }
        show_indicator(_text_sticky_note, "top")
    }
    else
        draw_sprite_ext(spr_icon_sticknotes, 0, (display_get_gui_width() - 220), (display_get_gui_height() - 40), 0.5, 0.5, 0, c_white, 1)
    var _alpha_icon = 1
    if (mode_focus == true)
        _alpha_icon = 0.3
    if button_collision(1063, 27, 1111, 67)
    {
        draw_sprite_ext(spr_icon_diary, 0, (center_x + 450), 52, 0.9, 0.9, 0, c_white, _alpha_icon)
        if (mc_click && page_drink == -1 && mode_focus == false && no_window())
        {
            shutdown_windows()
            page_diary = 1
            _current_year = current_year
            _current_month = current_month - 1
            _select_day = current_day
            _select_month = _current_month
            _select_year = _current_year
        }
        show_indicator(_text_hub)
    }
    else
        draw_sprite_ext(spr_icon_diary, 0, (center_x + 450), 52, 0.8, 0.8, 0, c_white, _alpha_icon)
    if button_collision(990, 27, 1043, 67)
    {
        draw_sprite_ext(spr_icon_message, 0, (center_x + 380), 52, 0.7, 0.7, 0, c_white, _alpha_icon)
        if (mc_click && page_drink == -1 && mode_focus == false && no_window())
        {
            shutdown_windows()
            page_phone *= -1
        }
        show_indicator(_text_phone)
    }
    else
        draw_sprite_ext(spr_icon_message, 0, (center_x + 380), 52, 0.6, 0.6, 0, c_white, _alpha_icon)
    if (silence_mode == -1)
    {
        for (ii = 0; ii < array_length(current_sentence[current_scene]); ii++)
        {
            if (current_sentence[current_scene][ii] != -1 && (current_sentence[current_scene][ii] + 1) < array_length(dialogue[current_scene][ii]))
            {
                if (dialogue[current_scene][ii][(current_sentence[current_scene][ii] + 1)][0] != "")
                {
                    draw_circle_color((center_x + 395), 35, 5, 0x4C4CFF, 0x4C4CFF, false)
                    draw_set_font(fontCJK)
                    draw_set_valign(fa_middle)
                    draw_set_halign(fa_center)
                }
            }
        }
        if (new_contact_notif[current_scene] == true)
        {
            draw_circle_color((center_x + 395), 35, 5, 0x4C4CFF, 0x4C4CFF, false)
            draw_set_font(fontCJK)
            draw_set_valign(fa_middle)
            draw_set_halign(fa_center)
        }
    }
    if button_collision(920, 27, 970, 67)
    {
        draw_sprite_ext(spr_icon_earring, 0, (center_x + 310), 52, 0.7, 0.7, 0, c_white, _alpha_icon)
        if (mc_click && page_drink == -1 && mode_focus == false && no_window())
        {
            shutdown_windows()
            page_customization *= -1
        }
        show_indicator(_text_accessoires)
    }
    else
        draw_sprite_ext(spr_icon_earring, 0, (center_x + 310), 52, 0.6, 0.6, 0, c_white, _alpha_icon)
    if button_collision(850, 27, 900, 67)
    {
        draw_sprite_ext(spr_icon_timetravel, 0, (center_x + 240), 52, 0.8, 0.8, 0, c_white, _alpha_icon)
        if (mc_click && page_drink == -1 && mode_focus == false && no_window())
        {
            shutdown_windows()
            page_scene *= -1
            page_scene_state = "idle"
        }
        show_indicator(_text_scene)
    }
    else
        draw_sprite_ext(spr_icon_timetravel, 0, (center_x + 240), 52, 0.7, 0.7, 0, c_white, _alpha_icon)
    if (mail_function == true)
    {
        if button_collision(775, 27, 835, 67)
        {
            draw_sprite_ext(spr_icon_mail, 0, (center_x + 165), 52, 0.8, 0.8, 0, c_white, _alpha_icon)
            if (mc_click && page_drink == -1 && mode_focus == false && no_window())
            {
                shutdown_windows()
                if (page_mail == -1)
                    page_mail_sub = -1
                page_mail = 1
                var url = "http://47.100.210.210:5000/msg/mailboxnew"
                check = http_post_string(url, ("playername=" + steamid))
            }
            show_indicator(_text_letters)
        }
        else
            draw_sprite_ext(spr_icon_mail, 0, (center_x + 165), 52, 0.7, 0.7, 0, c_white, _alpha_icon)
        if button_collision(700, 27, 760, 67)
        {
            draw_sprite_ext(spr_shutdown, 0, (center_x + 165 - 75), 52, 0.8, 0.8, 0, c_white, _alpha_icon)
            if (mc_click && no_window() == true)
            {
                if (mode_focus == false)
                    game_end()
            }
        }
        else
            draw_sprite_ext(spr_shutdown, 0, (center_x + 165 - 75), 52, 0.7, 0.7, 0, c_white, _alpha_icon)
    }
    else if button_collision(775, 27, 835, 67)
    {
        draw_sprite_ext(spr_shutdown, 0, (center_x + 165), 52, 0.8, 0.8, 0, c_white, _alpha_icon)
        if (mc_click && no_window() == true)
        {
            if (mode_focus == false)
                game_end()
        }
    }
    else
        draw_sprite_ext(spr_shutdown, 0, (center_x + 165), 52, 0.7, 0.7, 0, c_white, _alpha_icon)
    if (page_music_list == -1 && page_livechat == false && mail_function == true)
    {
        if button_collision(5, 600, 55, 650)
        {
            draw_sprite_ext(spr_icon_livechat, 0, 30, 625, 0.7, 0.7, 0, c_white, _alpha_icon)
            if (mc_click && page_drink == -1 && mode_focus == false && no_window())
            {
                page_livechat = true
                livechatlist_start = 20
            }
        }
        else
            draw_sprite_ext(spr_icon_livechat, 0, 30, 625, 0.6, 0.6, 0, c_white, _alpha_icon)
    }
}
if (mail_function == false)
    page_livechat = false
if (page_stickynotes == -1)
{
    if button_collision(970, 660, 1010, 690)
    {
        draw_sprite_ext(spr_icon_eye, 0, (display_get_gui_width() - 220 - 70), (display_get_gui_height() - 40), 0.6, 0.6, 0, c_white, 1)
        if (mc_click && no_window() == true)
            show_ui *= -1
        show_indicator(_text_clean_mode, "top")
    }
    else if (show_ui == 1)
        draw_sprite_ext(spr_icon_eye, 0, (display_get_gui_width() - 220 - 70), (display_get_gui_height() - 40), 0.5, 0.5, 0, c_white, 1)
    else
        draw_sprite_ext(spr_icon_eye, 0, (display_get_gui_width() - 220 - 70), (display_get_gui_height() - 40), 0.5, 0.5, 0, c_white, 0.3)
}
if (page_mail == 1)
{
    timer_page = -1
    draw_set_alpha(0.8)
    draw_set_color(c_black)
    draw_rectangle(0, 0, (center_x * 2), (center_y * 2), false)
    draw_set_alpha(1)
    draw_set_color(c_white)
    if button_collision(70, 140, 130, 200)
    {
        draw_sprite_ext(spr_icon_writing, 0, 100, 175, 0.6, 0.6, 0, c_white, 1)
        draw_rectangle_color((mx_gui + 20 - 40 - 20), (my_gui - 30), (mx_gui + 200 - 40 - 20), my_gui, c_black, c_black, c_black, c_black, false)
        draw_set_valign(fa_top)
        draw_set_halign(fa_left)
        draw_text_ext_transformed_color((mx_gui + 40 - 40 - 20), (my_gui - 30), _text_write_letter, -1, 1500, 0.3, 0.3, 0, 16777215, 16777215, 16777215, 16777215, 1)
        if mc_click
        {
            page_mail_sub = 1
            report_demand = false
            if (letter_sent == false)
            {
                instance_destroy(textbox_write_mail)
                instance_destroy(textbox_reply_mail)
                show_debug_message("write")
                textbox_write_mail = input_text_create_multiline_ext(410, 220, 450, 250, fontCJK_letter, 0, 1, 450, -1, 8, -1, 0, 0, true, 0)
                input_text_set_enabled(textbox_write_mail, true)
                input_text_set_text(textbox_write_mail, letter_text)
            }
        }
    }
    else
        draw_sprite_ext(spr_icon_writing, 0, 100, 175, 0.5, 0.5, 0, c_white, 1)
    if button_collision(70, 265, 130, 325)
    {
        draw_sprite_ext(spr_icon_find_letter, 0, 100, 300, 0.6, 0.6, 0, c_white, 1)
        draw_rectangle_color((mx_gui + 20 - 40 - 20), (my_gui - 30), (mx_gui + 200 - 40 - 20), my_gui, c_black, c_black, c_black, c_black, false)
        draw_set_valign(fa_top)
        draw_set_halign(fa_left)
        draw_text_ext_transformed_color((mx_gui - 20), (my_gui - 30), _text_request, -1, 1500, 0.3, 0.3, 0, 16777215, 16777215, 16777215, 16777215, 1)
        if mc_click
        {
            report_demand = false
            page_mail_sub = 2
            instance_destroy(textbox_reply_mail)
            instance_destroy(textbox_write_mail)
            if (state_reply == "receive_letter")
            {
                textbox_reply_mail = input_text_create_multiline_ext(700, 220, 450, 250, fontCJK_letter, 0, 1, 450, -1, 8, -1, 0, 0, true, 0)
                input_text_set_enabled(textbox_reply_mail, true)
                input_text_set_text(textbox_reply_mail, letter_reply_text)
            }
        }
    }
    else
        draw_sprite_ext(spr_icon_find_letter, 0, 100, 300, 0.5, 0.5, 0, c_white, 1)
    if button_collision(70, 390, 130, 450)
    {
        draw_sprite_ext(spr_icon_mailbox, 0, 100, 425, 0.6, 0.6, 0, c_white, 1)
        draw_rectangle_color((mx_gui + 20 - 40 - 20), (my_gui - 30), (mx_gui + 200 - 40 - 20), my_gui, c_black, c_black, c_black, c_black, false)
        draw_set_valign(fa_top)
        draw_set_halign(fa_left)
        draw_text_ext_transformed_color((mx_gui - 20), (my_gui - 30), _text_inbox, -1, 1500, 0.3, 0.3, 0, 16777215, 16777215, 16777215, 16777215, 1)
        if mc_click
        {
            report_demand = false
            page_mail_sub = 3
            instance_destroy(textbox_reply_mail)
            instance_destroy(textbox_write_mail)
        }
    }
    else
        draw_sprite_ext(spr_icon_mailbox, 0, 100, 425, 0.5, 0.5, 0, c_white, 1)
    steamid = string(steam_get_user_account_id())
    region = string(os_get_region())
    os_info = string(os_get_info())
    if (page_mail_sub == 1)
    {
        if (letter_sent == true)
        {
            draw_set_valign(fa_middle)
            draw_set_halign(fa_center)
            draw_text_ext_transformed_color((display_get_gui_width() / 2), (display_get_gui_height() / 2), _text_already_send, -1, 1500, 0.5, 0.5, 0, 16777215, 16777215, 16777215, 16777215, 1)
        }
        else if (sending_letter == true)
        {
            draw_set_valign(fa_middle)
            draw_set_halign(fa_center)
            draw_text_ext_transformed_color((display_get_gui_width() / 2), (display_get_gui_height() / 2), _text_letter_sending, -1, 1500, 0.5, 0.5, 0, 16777215, 16777215, 16777215, 16777215, 1)
            if (waiting_server == false)
            {
                waiting_server = true
                var _message = letter_text
                url = "http://47.100.210.210:5000/msg/lettersend"
                send = http_post_string(url, ("playername=" + steamid + "&messagesend=" + _message))
                show_debug_message("playername=" + steamid + "&messagesend=" + _message)
                count_lettersending++
                if (count_lettersending > 5)
                {
                    sending_letter = false
                    count_lettersending = 0
                }
            }
        }
        else
        {
            if instance_exists(textbox_write_mail)
                letter_text = textbox_write_mail.text_draw
            draw_set_valign(fa_middle)
            draw_set_halign(fa_center)
            draw_text_transformed_color((display_get_gui_width() / 2), 140, _text_write_mail, 0.5, 0.5, 0, c_white, c_white, c_white, c_white, 1)
            draw_sprite_ext(spr_mail, 0, (display_get_gui_width() / 2), 350, 2, 2, 0, c_white, 1)
            if (letter_text != "")
            {
                if button_request_new(1060, 240, _text_send)
                    sending_letter = true
            }
        }
    }
    if (page_mail_sub == 2)
    {
        switch state_reply
        {
            case "idle":
                draw_set_valign(fa_middle)
                draw_set_halign(fa_center)
                draw_set_font(fontCJK_letter)
                draw_text_ext_color((display_get_gui_width() / 2), (display_get_gui_height() / 2 - 50), _text_search_for_new_letter, -1, 800, c_white, c_white, c_white, c_white, 1)
                draw_set_font(fontCJK)
                if button_request_new((display_get_gui_width() / 2), (display_get_gui_height() / 2 + 150), _text_search)
                {
                    if debug_mode
                        steamid = string(359815222)
                    letter_send_request()
                }
                break
            case "fail":
                draw_set_valign(fa_middle)
                draw_set_halign(fa_center)
                draw_set_font(fontCJK_letter)
                draw_text_ext_color((display_get_gui_width() / 2), (display_get_gui_height() / 2 - 50), _text_no_connection, -1, 800, c_white, c_white, c_white, c_white, 1)
                draw_set_font(fontCJK)
                if button_request_new((display_get_gui_width() / 2), (display_get_gui_height() / 2 + 150), _text_search)
                {
                    if debug_mode
                        steamid = string(359815222)
                    letter_send_request()
                }
                break
            case "request_pending":
                draw_set_valign(fa_middle)
                draw_set_halign(fa_center)
                draw_text_ext_transformed_color((display_get_gui_width() / 2), (display_get_gui_height() / 2), _text_letter_sending, -1, 1500, 0.5, 0.5, 0, 16777215, 16777215, 16777215, 16777215, 1)
                request_pending_cd++
                if (request_pending_cd > 300)
                {
                    request_pending_cd = 0
                    state_reply = "fail"
                }
                instance_destroy(textbox_reply_mail)
                break
            case "reply_success":
                draw_set_valign(fa_middle)
                draw_set_halign(fa_center)
                draw_set_font(fontCJK_letter)
                draw_text_ext_color((display_get_gui_width() / 2), (display_get_gui_height() / 2 - 50), _text_reply_success, -1, 800, c_white, c_white, c_white, c_white, 1)
                draw_set_font(fontCJK)
                if button_request_new((display_get_gui_width() / 2), (display_get_gui_height() / 2 + 150), _text_search)
                {
                    if (reply_count >= letter_reply_limit)
                        state_reply = "too_much_reply"
                    else
                    {
                        if debug_mode
                            steamid = string(359815222)
                        letter_send_request()
                    }
                }
                break
            case "report_success":
                draw_set_valign(fa_middle)
                draw_set_halign(fa_center)
                draw_set_font(fontCJK_letter)
                draw_text_ext_color((display_get_gui_width() / 2), (display_get_gui_height() / 2 - 50), _text_report_success, -1, 800, c_white, c_white, c_white, c_white, 1)
                draw_set_font(fontCJK)
                if button_request_new((display_get_gui_width() / 2), (display_get_gui_height() / 2 + 150), _text_search)
                    letter_send_request()
                break
            case "too_much_reply":
                draw_set_valign(fa_middle)
                draw_set_halign(fa_center)
                draw_set_font(fontCJK_letter)
                draw_text_ext_color((display_get_gui_width() / 2), (display_get_gui_height() / 2 - 50), _text_too_much_reply, -1, 800, c_white, c_white, c_white, c_white, 1)
                draw_set_font(fontCJK)
                break
            case "receive_letter":
                draw_set_valign(fa_middle)
                draw_set_halign(fa_center)
                draw_text_ext_transformed_color((display_get_gui_width() / 2), 150, _text_kind_words, -1, 2000, 0.5, 0.5, 0, 16777215, 16777215, 16777215, 16777215, 1)
                draw_sprite_ext(spr_mail, 1, (display_get_gui_width() / 2 - 220), 350, 2, 2, 0, c_white, 1)
                draw_set_valign(fa_top)
                draw_set_halign(fa_left)
                draw_set_font(fontCJK_letter)
                if (english_letter == false)
                    draw_text_ext_color(188, 225, request_letter, -1, 450, c_black, c_black, c_black, c_black, 1)
                else
                {
                    draw_set_alpha(0.2)
                    draw_set_color(c_black)
                    draw_roundrect(184, 217, 646, 510, false)
                    draw_set_alpha(1)
                    draw_set_color(c_white)
                    draw_text_ext_color(188, 225, request_letter_eng, -1, 450, c_black, c_black, c_black, c_black, 1)
                }
                draw_set_font(fontCJK)
                if button_collision(610, 200, 662, 250)
                {
                    draw_rectangle_color((mx_gui + 20 - 40 - 20), (my_gui - 50), (mx_gui + 130 - 40 - 20), (my_gui - 20), c_black, c_black, c_black, c_black, false)
                    draw_set_valign(fa_top)
                    draw_set_halign(fa_left)
                    draw_text_ext_transformed_color((mx_gui - 20), (my_gui - 50), _text_show_report, -1, 1500, 0.3, 0.3, 0, 16777215, 16777215, 16777215, 16777215, 1)
                    draw_sprite_ext(spr_icon_report, 0, 635, 220, -0.8, 0.8, 0, c_white, 1)
                    if mc_click
                        report_demand = true
                }
                else
                    draw_sprite_ext(spr_icon_report, 0, 635, 220, -0.7, 0.7, 0, c_white, 1)
                draw_sprite_ext(spr_mail, 0, (display_get_gui_width() / 2 + 290), 350, 2, 2, 0, c_white, 1)
                if instance_exists(textbox_reply_mail)
                    letter_reply_text = textbox_reply_mail.text_draw
                if (report_demand == false)
                {
                    if button_request_new(260, (display_get_gui_height() / 2 + 230), _text_search)
                    {
                        if debug_mode
                            steamid = string(359815222)
                        letter_send_request()
                    }
                    if (letter_reply_text != "")
                    {
                        if button_request_new(1000, (display_get_gui_height() / 2 + 230), _text_send)
                        {
                            url = "http://47.100.210.210:5000/msg/letterreply"
                            reply = http_post_string(url, ("playername=" + steamid + "&messagesend=" + letter_reply_text + "&originname=" + string(originname) + "&originmessage=" + request_letter + "&pid=" + string(pid)))
                            show_debug_message("playername=" + steamid + "&messagesend=" + letter_reply_text + "&originname=" + string(originname) + "&originmessage=" + request_letter + "&pid=" + string(pid))
                            state_reply = "request_pending"
                        }
                    }
                    if (english_letter == false)
                    {
                        if button_request_new(500, (display_get_gui_height() / 2 + 230), _text_translate, spr_button2)
                            english_letter = true
                    }
                    else if button_request_new(500, (display_get_gui_height() / 2 + 230), _text_original, spr_button2)
                        english_letter = false
                }
                else
                {
                    draw_set_alpha(0.9)
                    draw_set_color(c_black)
                    draw_rectangle(0, 0, (center_x * 2), (center_y * 2), false)
                    draw_set_alpha(1)
                    draw_set_color(c_white)
                    draw_set_valign(fa_middle)
                    draw_set_halign(fa_center)
                    draw_set_font(fontCJK_letter)
                    draw_text_ext_color((display_get_gui_width() / 2), (display_get_gui_height() / 2 - 50), _text_report_message, -1, 800, c_white, c_white, c_white, c_white, 1)
                    draw_set_font(fontCJK)
                    if button_request_new((display_get_gui_width() / 2 - 150), (display_get_gui_height() / 2 + 60), _text_yes, spr_button2)
                    {
                        url = "http://47.100.210.210:5000/msg/reportorigin"
                        report = http_post_string(url, ("playername=" + steamid + "&originname=" + string(originname) + "&originmessage=" + request_letter + "&pid=" + string(pid)))
                        state_reply = "request_pending"
                        report_demand = false
                    }
                    if button_request_new((display_get_gui_width() / 2 + 150), (display_get_gui_height() / 2 + 60), _text_no, spr_button2)
                        report_demand = false
                }
                break
        }

    }
    if (page_mail_sub == 3)
    {
        switch state_mailbox
        {
            case "report_success":
                draw_set_valign(fa_middle)
                draw_set_halign(fa_center)
                draw_set_font(fontCJK_letter)
                draw_text_ext_color((display_get_gui_width() / 2), (display_get_gui_height() / 2 - 50), _text_report_success, -1, 800, c_white, c_white, c_white, c_white, 1)
                draw_set_font(fontCJK)
                if button_request_new((display_get_gui_width() / 2), (display_get_gui_height() / 2 + 150), _text_back)
                    state_mailbox = "idle"
                break
            case "request_pending":
                draw_set_valign(fa_middle)
                draw_set_halign(fa_center)
                draw_text_ext_transformed_color((display_get_gui_width() / 2), (display_get_gui_height() / 2), _text_letter_sending, -1, 1500, 0.5, 0.5, 0, 16777215, 16777215, 16777215, 16777215, 1)
                request_pending_cd++
                if (request_pending_cd > 300)
                {
                    request_pending_cd = 0
                    state_reply = "fail"
                }
                instance_destroy(obj_input_text)
                break
            case "idle":
                if (report_demand == false)
                {
                    if (array_length(mailbox) > 0)
                    {
                        if (array_length(mailbox[0].reply) > 0)
                        {
                            draw_sprite_ext(spr_mail, 0, (display_get_gui_width() / 2 - 220), 350, 2, 2, 0, c_white, 1)
                            draw_sprite_ext(spr_mail, 1, (display_get_gui_width() / 2 + 290), 350, 2, 2, 0, c_white, 1)
                            draw_set_valign(fa_middle)
                            draw_set_halign(fa_center)
                            draw_text_ext_transformed_color((display_get_gui_width() / 2), 140, _text_mailbox, -1, 1000, 0.75, 0.75, 0, 16777215, 16777215, 16777215, 16777215, 1)
                            draw_set_font(fontCJK)
                            if button_collision(586, 546, 618, 590)
                            {
                                draw_sprite_ext(spr_icon_changetheme, 0, 600, 570, -0.8, 0.8, 0, c_white, 1)
                                if mc_click
                                    current_originmessage = min((array_length(mailbox) - 1), (current_originmessage + 1))
                            }
                            else
                                draw_sprite_ext(spr_icon_changetheme, 0, 600, 570, -0.7, 0.7, 0, c_white, 1)
                            if button_collision(220, 546, 250, 590)
                            {
                                draw_sprite_ext(spr_icon_changetheme, 0, 240, 570, 0.8, 0.8, 0, c_white, 1)
                                if mc_click
                                    current_originmessage = max(0, (current_originmessage - 1))
                            }
                            else
                                draw_sprite_ext(spr_icon_changetheme, 0, 240, 570, 0.7, 0.7, 0, c_white, 1)
                            current_reply = clamp(current_reply, 0, (array_length(mailbox[current_originmessage].reply) - 1))
                            if button_collision(1086, 546, 1118, 590)
                            {
                                draw_sprite_ext(spr_icon_changetheme, 0, 1100, 570, -0.8, 0.8, 0, c_white, 1)
                                if mc_click
                                    current_reply = min((array_length(mailbox[current_originmessage].reply) - 1), (current_reply + 1))
                            }
                            else
                                draw_sprite_ext(spr_icon_changetheme, 0, 1100, 570, -0.7, 0.7, 0, c_white, 1)
                            if button_collision(720, 546, 750, 590)
                            {
                                draw_sprite_ext(spr_icon_changetheme, 0, 740, 570, 0.8, 0.8, 0, c_white, 1)
                                if mc_click
                                    current_reply = max(0, (current_reply - 1))
                            }
                            else
                                draw_sprite_ext(spr_icon_changetheme, 0, 740, 570, 0.7, 0.7, 0, c_white, 1)
                            draw_set_valign(fa_middle)
                            draw_set_halign(fa_center)
                            draw_set_font(fontCJK_letter)
                            draw_text_ext_transformed_color(420, 570, ((string(current_originmessage + 1)) + " / " + string(array_length(mailbox))), -1, 1000, 1, 1, 0, 16777215, 16777215, 16777215, 16777215, 1)
                            draw_text_ext_transformed_color(920, 570, ((string(current_reply + 1)) + " / " + string(array_length(mailbox[current_originmessage].reply))), -1, 1000, 1, 1, 0, 16777215, 16777215, 16777215, 16777215, 1)
                            draw_set_font(fontCJK)
                            draw_set_valign(fa_top)
                            draw_set_halign(fa_left)
                            draw_set_font(fontCJK_letter)
                            draw_text_ext_color(188, 225, mailbox[current_originmessage].originmessage, -1, 450, c_black, c_black, c_black, c_black, 1)
                            draw_text_ext_color(700, 225, mailbox[current_originmessage].reply[current_reply].reply_content, -1, 450, c_black, c_black, c_black, c_black, 1)
                            if button_collision(1130, 200, 1175, 250)
                            {
                                draw_rectangle_color((mx_gui + 20 - 40 - 20), (my_gui - 50), (mx_gui + 130 - 40 - 20), (my_gui - 20), c_black, c_black, c_black, c_black, false)
                                draw_set_valign(fa_top)
                                draw_set_halign(fa_left)
                                draw_set_font(fontCJK)
                                draw_text_ext_transformed_color((mx_gui - 20), (my_gui - 50), _text_show_report, -1, 1500, 0.3, 0.3, 0, 16777215, 16777215, 16777215, 16777215, 1)
                                draw_sprite_ext(spr_icon_report, 0, 1150, 220, -0.8, 0.8, 0, c_white, 1)
                                if mc_click
                                    report_demand = true
                            }
                            else
                                draw_sprite_ext(spr_icon_report, 0, 1150, 220, -0.7, 0.7, 0, c_white, 1)
                        }
                    }
                }
                else
                {
                    draw_set_alpha(0.9)
                    draw_set_color(c_black)
                    draw_rectangle(0, 0, (center_x * 2), (center_y * 2), false)
                    draw_set_alpha(1)
                    draw_set_color(c_white)
                    draw_set_valign(fa_middle)
                    draw_set_halign(fa_center)
                    draw_set_font(fontCJK_letter)
                    draw_text_ext_color((display_get_gui_width() / 2), (display_get_gui_height() / 2 - 50), _text_report_message, -1, 800, c_white, c_white, c_white, c_white, 1)
                    draw_set_font(fontCJK)
                    if button_request_new((display_get_gui_width() / 2 - 150), (display_get_gui_height() / 2 + 60), _text_yes, spr_button2)
                    {
                        url = "http://47.100.210.210:5000/msg/reportreply"
                        var _originmessage = string(mailbox[current_originmessage].originmessage)
                        var _pid = string(mailbox[current_originmessage].pid)
                        var _replymessage = string(mailbox[current_originmessage].reply[current_reply].reply_content)
                        var _replyname = string(mailbox[current_originmessage].reply[current_reply].reply_name)
                        var _msg = "author=" + steamid + "&originmessage=" + _originmessage + "&pid=" + _pid + "&replyname=" + _replyname + "&replymessage=" + _replymessage
                        show_debug_message(_msg)
                        report_mailbox = http_post_string(url, _msg)
                        state_mailbox = "request_pending"
                        report_demand = false
                    }
                    if button_request_new((display_get_gui_width() / 2 + 150), (display_get_gui_height() / 2 + 60), _text_no, spr_button2)
                        report_demand = false
                }
                break
            case "send gift":
                draw_sprite_ext(spr_mail, 0, (display_get_gui_width() / 2 - 220), 350, 2, 2, 0, c_white, 1)
                draw_sprite_ext(spr_mail, 1, (display_get_gui_width() / 2 + 290), 350, 2, 2, 0, c_white, 1)
                draw_set_valign(fa_top)
                draw_set_halign(fa_left)
                draw_set_font(fontCJK_letter)
                draw_text_ext_color(188, 225, mailbox[current_originmessage].originmessage, -1, 450, c_black, c_black, c_black, c_black, 1)
                draw_text_ext_color(700, 225, mailbox[current_originmessage].reply[current_reply].reply_content, -1, 450, c_black, c_black, c_black, c_black, 1)
                draw_set_font(fontCJK)
                draw_set_alpha(0.8)
                draw_rectangle_color(0, 0, (center_x * 2), (center_y * 2), c_black, c_black, c_black, c_black, false)
                draw_set_alpha(1)
                draw_set_valign(fa_middle)
                draw_set_halign(fa_center)
                draw_text_ext_transformed_color((display_get_gui_width() / 2), 120, _text_choose_gift, -1, 2000, 0.75, 0.75, 0, 16777215, 16777215, 16777215, 16777215, 1)
                break
        }

    }
    if button_clickon(40, 40)
    {
        if (state_mailbox == "send gift")
            state_mailbox = "idle"
        else
        {
            page_mail = -1
            instance_destroy(obj_input_text)
            report_demand = false
            state_mailbox = "idle"
        }
    }
}
if (page_stickynotes == 1)
{
    page_weather = -1
    page_noise = -1
    if button_clickon(680, 40)
    {
        page_stickynotes = -1
        if (writing_stickynote == true)
        {
            writing_stickynote = false
            instance_destroy(note_on_mouse)
            instance_destroy(obj_input_text)
        }
    }
}
if (timer_page == 1 && page_drink == -1)
{
    if (timer_run == true || rest_run == true)
        var _text_start = _stop
    else
        _text_start = _start
    var minute = string(pomodoro_minute div 3600)
    var second = string((pomodoro_minute div 60) % 60)
    if ((pomodoro_minute div 3600) < 10)
        minute = "0" + minute
    if (((pomodoro_minute div 60) % 60) < 10)
        second = "0" + second
    var minuteR = string(rest_minute div 3600)
    var secondR = string((rest_minute div 60) % 60)
    if ((rest_minute div 3600) < 10)
        minuteR = "0" + minuteR
    if (((rest_minute div 60) % 60) < 10)
        secondR = "0" + secondR
    var timer_text = minute + ":" + second
    var timer_rest_text = minuteR + ":" + secondR
    if (page_stickynotes == -1)
    {
        draw_set_alpha(0.5)
        draw_set_color(c_black)
        draw_roundrect((page_timer_x - 75 - 90), (page_timer_y + 30 - 40), (page_timer_x - 75 + 90), (page_timer_y + 30 + 110), false)
        draw_set_alpha(1)
        draw_set_color(c_white)
        draw_set_font(fontCJK)
        draw_set_valign(fa_middle)
        draw_set_halign(fa_center)
        if (timer_run == false)
            draw_set_color(c_gray)
        draw_text_transformed((page_timer_x - 75), (page_timer_y + 30), timer_text, 0.6, 0.6, 0)
        draw_set_color(c_white)
        if (rest_run == false)
            draw_set_color(c_gray)
        draw_text_transformed((page_timer_x - 75), (page_timer_y + 72), timer_rest_text, 0.35, 0.35, 0)
        draw_set_color(c_white)
        if (button_collision(1137, 190, 1210, 220) == true)
        {
            draw_text_transformed((page_timer_x - 75), (page_timer_y + 110), _text_start, 0.5, 0.5, 0)
            if mc_click
            {
                if (timer_run == false && rest_run == false)
                {
                    timer_run = true
                    page_pomodoro_setting = -1
                }
                else
                {
                    timer_run = false
                    rest_run = false
                }
            }
        }
        else
            draw_text_transformed((page_timer_x - 75), (page_timer_y + 110), _text_start, 0.4, 0.4, 0)
        if (button_collision(1090, 190, 1126, 220) == true)
        {
            draw_sprite_ext(spr_icon_setting, 0, (page_timer_x - 140), (page_timer_y + 110), 0.5, 0.5, 0, c_white, 1)
            if mc_click
                page_pomodoro_setting *= -1
        }
        else
            draw_sprite_ext(spr_icon_setting, 0, (page_timer_x - 140), (page_timer_y + 110), 0.4, 0.4, 0, c_white, 1)
        if (button_collision(1220, 180, 1260, 220) == true)
        {
            draw_sprite_ext(spr_icon_reset, 0, (page_timer_x - 10), (page_timer_y + 110), 0.5, 0.5, 0, c_white, 1)
            if mc_click
            {
                timer_run = false
                pomodoro_minute = pomodoro_minute_max
                rest_run = false
                rest_minute = rest_minute_max
            }
        }
        else
            draw_sprite_ext(spr_icon_reset, 0, (page_timer_x - 10), (page_timer_y + 110), 0.4, 0.4, 0, c_white, 1)
        if (page_pomodoro_setting == 1)
        {
            if (button_collision(940, 140, 977, 175) && (!timer_run) && (!writing_rest_timer))
            {
                draw_set_alpha(0.7)
                draw_rectangle(940, 140, 977, 175, false)
                draw_set_alpha(1)
                if mc_click
                {
                    writing_pomodoro = true
                    keyboard_string = string(pomodoro_minute_max / 3600)
                    keyboard_string = ""
                }
            }
            if (writing_pomodoro == true)
            {
                draw_set_alpha(0.7)
                draw_rectangle(940, 140, 977, 175, false)
                draw_set_alpha(1)
                keyboard_string = string_digits(keyboard_string)
                if (string_length(keyboard_string) > 2)
                    keyboard_string = string_copy(keyboard_string, 1, (string_length(keyboard_string) - 1))
                if (keyboard_string != "")
                    string_value = int64(keyboard_string)
                else
                    string_value = 0
                keyboard_string = string(string_value)
                if (keyboard_string != "")
                    pomodoro_minute_max = int64(keyboard_string) * 3600
                else
                    pomodoro_minute_max = 0
                if ((mc_click && (!(button_collision(940, 140, 977, 175)))) || keyboard_check_pressed(vk_return))
                {
                    writing_pomodoro = false
                    pomodoro_minute = pomodoro_minute_max
                }
            }
            if (button_collision(940, 240, 977, 275) && (!timer_run) && (!writing_pomodoro))
            {
                draw_set_alpha(0.7)
                draw_rectangle(940, 240, 977, 275, false)
                draw_set_alpha(1)
                if mc_click
                {
                    writing_rest_timer = true
                    keyboard_string = string(rest_minute_max / 3600)
                    keyboard_string = ""
                }
            }
            if (writing_rest_timer == true)
            {
                draw_set_alpha(0.7)
                draw_rectangle(940, 240, 977, 275, false)
                draw_set_alpha(1)
                keyboard_string = string_digits(keyboard_string)
                if (string_length(keyboard_string) > 2)
                    keyboard_string = string_copy(keyboard_string, 1, (string_length(keyboard_string) - 1))
                if (keyboard_string != "")
                    string_value = int64(keyboard_string)
                else
                    string_value = 0
                keyboard_string = string(string_value)
                if (keyboard_string != "")
                    rest_minute_max = int64(keyboard_string) * 3600
                else
                    rest_minute_max = 0
                if ((mc_click && (!(button_collision(940, 240, 977, 275)))) || keyboard_check_pressed(vk_return))
                {
                    writing_rest_timer = false
                    rest_minute = rest_minute_max
                }
            }
            draw_set_alpha(0.7)
            draw_set_color(c_black)
            draw_roundrect(850, (page_timer_y - 10), 1070, 370, false)
            draw_set_alpha(1)
            draw_set_color(c_white)
            draw_set_font(fontCJK)
            draw_set_valign(fa_top)
            draw_set_halign(fa_center)
            draw_text_transformed(960, page_timer_y, _text_timer, 0.35, 0.35, 0)
            draw_text_transformed(960, (page_timer_y + 35), (pomodoro_minute_max / 3600), 0.5, 0.5, 0)
            draw_text_transformed(960, (page_timer_y + 100), _text_rest, 0.35, 0.35, 0)
            draw_text_transformed(960, (page_timer_y + 135), (rest_minute_max / 3600), 0.5, 0.5, 0)
            if (button_collision(1007, 128, 1050, 167) == true)
            {
                draw_sprite_ext(spr_add, 0, 1030, (page_timer_y + 55), 0.9, 0.9, 0, c_white, 1)
                if (mc_click && (!timer_run) && (!rest_run))
                {
                    pomodoro_minute_max = min((pomodoro_minute_max + 3600), 356400)
                    pomodoro_minute = pomodoro_minute_max
                }
            }
            else
                draw_sprite_ext(spr_add, 0, 1030, (page_timer_y + 55), 0.75, 0.75, 0, c_white, 1)
            if (button_collision(865, 128, 906, 167) == true)
            {
                draw_sprite_ext(spr_minus, 0, 890, (page_timer_y + 55), 0.9, 0.9, 0, c_white, 1)
                if (mc_click && (!timer_run) && (!rest_run))
                {
                    pomodoro_minute_max = max((pomodoro_minute_max - 3600), 0)
                    pomodoro_minute = pomodoro_minute_max
                }
            }
            else
                draw_sprite_ext(spr_minus, 0, 890, (page_timer_y + 55), 0.75, 0.75, 0, c_white, 1)
            if (button_collision(1004, 238, 1050, 270) == true)
            {
                draw_sprite_ext(spr_add, 0, 1030, (page_timer_y + 155), 0.9, 0.9, 0, c_white, 1)
                if (mc_click && (!timer_run) && (!rest_run))
                {
                    rest_minute_max = min((rest_minute_max + 3600), 212400)
                    rest_minute = rest_minute_max
                }
            }
            else
                draw_sprite_ext(spr_add, 0, 1030, (page_timer_y + 155), 0.75, 0.75, 0, c_white, 1)
            if (button_collision(865, 238, 906, 270) == true)
            {
                draw_sprite_ext(spr_minus, 0, 890, (page_timer_y + 155), 0.9, 0.9, 0, c_white, 1)
                if (mc_click && (!timer_run) && (!rest_run))
                {
                    rest_minute_max = max((rest_minute_max - 3600), 0)
                    rest_minute = rest_minute_max
                }
            }
            else
                draw_sprite_ext(spr_minus, 0, 890, (page_timer_y + 155), 0.75, 0.75, 0, c_white, 1)
            draw_set_valign(fa_middle)
            draw_set_halign(fa_left)
            draw_text_transformed(865, 300, _text_auto_renew, 0.35, 0.35, 0)
            if (auto_renew_pomodoro == 1)
                var switch_ind = 0
            if (auto_renew_pomodoro == -1)
                switch_ind = 1
            if (button_collision(1011, 284, 1060, 308) == true)
            {
                draw_sprite_ext(spr_icon_switch, switch_ind, 1035, 300, 1, 1, 0, c_white, 1)
                if mc_click
                    auto_renew_pomodoro *= -1
            }
            else
                draw_sprite_ext(spr_icon_switch, switch_ind, 1035, 300, 1, 1, 0, c_white, 0.7)
            draw_set_valign(fa_middle)
            draw_set_halign(fa_left)
            draw_text_transformed(865, 340, _text_sound, 0.35, 0.35, 0)
            if (alarm_play_sound == 1)
                switch_ind = 0
            if (alarm_play_sound == -1)
                switch_ind = 1
            if (button_collision(1011, 324, 1060, 348) == true)
            {
                draw_sprite_ext(spr_icon_switch, switch_ind, 1035, 340, 1, 1, 0, c_white, 1)
                if mc_click
                    alarm_play_sound *= -1
            }
            else
                draw_sprite_ext(spr_icon_switch, switch_ind, 1035, 340, 1, 1, 0, c_white, 0.7)
        }
    }
}
if (page_music_list == 1)
{
    draw_set_alpha(0.7)
    draw_set_color(c_black)
    draw_roundrect(25, 360, 460, 640, false)
    draw_set_alpha(1)
    draw_set_color(c_white)
    if (button_collision(30, 400, 400, 630) && array_length(music_list) >= max_show_music_length)
    {
        if mouse_wheel_down()
            current_music_list_start = min((current_music_list_start + 1), (array_length(music_list) - max_show_music_length))
        if mouse_wheel_up()
            current_music_list_start = max((current_music_list_start - 1), 0)
    }
    for (var i = 0; i < min(array_length(music_names), max_show_music_length); i++)
    {
        if ((i + current_music_list_start) == current_music_index)
        {
            draw_set_alpha(0.3)
            draw_roundrect(35, (415 + i * 35), 400, (445 + i * 35), false)
            draw_set_alpha(1)
        }
        if button_collision(35, (415 + i * 35), 400, (445 + i * 35))
        {
            draw_set_alpha(0.3)
            draw_roundrect(35, (415 + i * 35), 400, (445 + i * 35), false)
            draw_set_alpha(1)
            if mc_click
            {
                current_music_index = i + current_music_list_start
                audio_stop_sound(current_music)
                current_music = music_list[current_music_index]
                audio_play_sound(current_music, 99, false)
            }
        }
        draw_set_halign(fa_left)
        draw_set_valign(fa_middle)
        var color_music = c_white
        if array_contains(album_list[0], music_list[(i + current_music_list_start)])
            color_music = c_white
        else if array_contains(album_list[1], music_list[(i + current_music_list_start)])
            color_music = 16737791
        else if array_contains(album_list[2], music_list[(i + current_music_list_start)])
            color_music = 6578158
        else if array_contains(album_list[3], music_list[(i + current_music_list_start)])
            color_music = 43775
        else if array_contains(album_list[4], music_list[(i + current_music_list_start)])
            color_music = 5043711
        else if array_contains(album_list[5], music_list[(i + current_music_list_start)])
            color_music = 16776960
        else if array_contains(album_list[6], music_list[(i + current_music_list_start)])
            color_music = 65280
        draw_set_color(color_music)
        draw_text_transformed(40, (430 + i * 35), music_names[(i + current_music_list_start)], 0.3, 0.3, 0)
        draw_set_color(c_white)
    }
    draw_set_alpha(0.5)
    draw_line_width(425, 425, 425, 625, 2)
    draw_set_alpha(1)
    var mc_list_slider = current_music_list_start / (array_length(music_list) - max_show_music_length) * 200 + 425
    draw_circle(425, mc_list_slider, 5, false)
    if button_clickon(460, 370, spr_icon_close_small, 1, "switch")
        page_music_list = -1
    if button_clickon(410, 370, spr_icon_plus_small, 1, "switch")
        page_full_music *= -1
    draw_sprite_ext(spr_icon_full_album, 0, 410, 370, 0.35, 0.35, 0, c_black, 1)
    if (page_full_music == 1)
    {
        music_mode = 0
        draw_set_alpha(0.7)
        draw_set_color(c_black)
        draw_roundrect(540, 80, 1050, 600, false)
        draw_set_alpha(1)
        draw_set_color(c_white)
        draw_line_width(570, 180, 1020, 180, 1)
        if button_clickon(1050, 120, spr_icon_close_small, 1, "switch")
            page_full_music = -1
        var _center_x1 = 610
        var _center_y1 = 155
        var cell_size = 123
        var _music_genre = [_text_all_music, _text_cyberpunk, _text_chinese_music, _text_custom, _text_classical, _text_ambient, _text_1980s]
        for (i = 0; i < array_length(album_name_list); i++)
        {
            var _line_num = i div 4
            var _col_num = i % 4
            if (i == current_music_genre)
            {
                draw_set_alpha(0.3)
                draw_roundrect_ext((_center_x1 - 60 + cell_size * _col_num), (_center_y1 - 15 - 40 + _line_num * 40), (_center_x1 + 60 + cell_size * _col_num), (_center_y1 + 15 - 40 + _line_num * 40), 30, 30, false)
                draw_set_alpha(1)
            }
            if button_collision((_center_x1 - 60 + cell_size * _col_num), (_center_y1 - 15 - 40 + _line_num * 40), (_center_x1 + 60 + cell_size * _col_num), (_center_y1 + 15 - 40 + _line_num * 40))
            {
                draw_set_alpha(0.2)
                draw_roundrect_ext((_center_x1 - 60 + cell_size * _col_num), (_center_y1 - 15 - 40 + _line_num * 40), (_center_x1 + 60 + cell_size * _col_num), (_center_y1 + 15 - 40 + _line_num * 40), 30, 30, false)
                draw_set_alpha(1)
                if mc_click
                {
                    current_music_list_start2 = 0
                    current_music_genre = i
                }
            }
            draw_set_valign(fa_middle)
            draw_set_halign(fa_center)
            draw_text_transformed((_center_x1 + cell_size * _col_num), (_center_y1 - 40 + _line_num * 40), _music_genre[i], 0.3, 0.3, 0)
        }
        if button_collision(540, 120, 1050, 600)
        {
            if (mouse_wheel_down() && array_length(album_list[current_music_genre]) > max_show_music_length2)
                current_music_list_start2 = min((current_music_list_start2 + 1), (array_length(album_list[current_music_genre]) - max_show_music_length2))
            if mouse_wheel_up()
                current_music_list_start2 = max((current_music_list_start2 - 1), 0)
        }
        for (i = 0; i < min(max_show_music_length2, array_length(album_name_list[current_music_genre])); i++)
        {
            if button_collision(565, (200 + i * 35), 950, (230 + i * 35))
            {
                draw_set_alpha(0.3)
                draw_roundrect(565, (200 + i * 35), 950, (230 + i * 35), false)
                draw_set_alpha(1)
            }
            if array_contains(music_list, album_list[current_music_genre][(i + current_music_list_start2)])
            {
                draw_set_halign(fa_left)
                draw_set_valign(fa_middle)
                draw_text_transformed(570, (215 + i * 35), album_name_list[current_music_genre][(i + current_music_list_start2)], 0.3, 0.3, 0)
                if button_clickon(980, (215 + i * 35), spr_minus, 0.6, "switch")
                {
                    var _element_ind = array_get_index(music_list, album_list[current_music_genre][(i + current_music_list_start2)])
                    if (current_music_list_start != 0)
                        current_music_list_start--
                    if (current_music_index == (array_length(music_list) - 1))
                        current_music_index = max(0, (current_music_index - 1))
                    if (current_music_index > 0)
                    {
                    }
                    array_delete(music_list, _element_ind, 1)
                    array_delete(music_names, _element_ind, 1)
                    array_delete(random_music_list, _element_ind, 1)
                    if (array_length(music_names) <= max_show_music_length)
                        current_music_list_start = 0
                }
            }
            else
            {
                draw_set_halign(fa_left)
                draw_set_valign(fa_middle)
                draw_set_alpha(0.5)
                draw_text_transformed(570, (215 + i * 35), album_name_list[current_music_genre][(i + current_music_list_start2)], 0.3, 0.3, 0)
                draw_set_alpha(1)
                if button_clickon(980, (215 + i * 35), spr_add, 0.6, "switch")
                {
                    array_push(music_list, album_list[current_music_genre][(i + current_music_list_start2)])
                    array_push(music_names, album_name_list[current_music_genre][(i + current_music_list_start2)])
                }
            }
        }
        draw_set_alpha(0.5)
        draw_line_width(1017, 200, 1017, 575, 2)
        draw_set_alpha(1)
        var mc_list_slider2 = current_music_list_start2 / (array_length(album_list[current_music_genre]) - max_show_music_length2) * 375 + 200
        draw_circle(1017, mc_list_slider2, 5, false)
    }
}
if (page_weather == 1)
{
    draw_set_alpha(0.8)
    draw_roundrect_color_ext(940, 590, 1150, 645, 50, 50, c_black, c_black, false)
    draw_set_alpha(1)
    if button_collision(1100, 600, 1140, 635)
    {
        draw_sprite_ext(spr_icon_rain, 0, (display_get_gui_width() - 160), (display_get_gui_height() - 100), 0.6, 0.6, 0, c_white, 1)
        if mc_click
            current_weather = "rain"
    }
    else
        draw_sprite_ext(spr_icon_rain, 0, (display_get_gui_width() - 160), (display_get_gui_height() - 100), 0.5, 0.5, 0, c_white, 1)
    if button_collision(1050, 600, 1090, 635)
    {
        draw_sprite_ext(spr_icon_snow, 0, (display_get_gui_width() - 210), (display_get_gui_height() - 100), 0.6, 0.6, 0, c_white, 1)
        if mc_click
            current_weather = "snow"
    }
    else
        draw_sprite_ext(spr_icon_snow, 0, (display_get_gui_width() - 210), (display_get_gui_height() - 100), 0.5, 0.5, 0, c_white, 1)
    if button_collision(1000, 600, 1040, 635)
    {
        draw_sprite_ext(spr_icon_storm, 0, (display_get_gui_width() - 260), (display_get_gui_height() - 100), 0.6, 0.6, 0, c_white, 1)
        if mc_click
            current_weather = "storm"
    }
    else
        draw_sprite_ext(spr_icon_storm, 0, (display_get_gui_width() - 260), (display_get_gui_height() - 100), 0.5, 0.5, 0, c_white, 1)
    if button_collision(950, 600, 990, 635)
    {
        draw_sprite_ext(spr_icon_no_weather, 0, (display_get_gui_width() - 260 - 50), (display_get_gui_height() - 100), 0.6, 0.6, 0, c_white, 1)
        if mc_click
            current_weather = "none"
    }
    else
        draw_sprite_ext(spr_icon_no_weather, 0, (display_get_gui_width() - 260 - 50), (display_get_gui_height() - 100), 0.5, 0.5, 0, c_white, 1)
    if button_clickon(1147, 594, spr_icon_close_small, 1, "switch")
        page_weather = -1
}
if (page_noise == 1)
{
    draw_set_alpha(0.8)
    draw_roundrect_color_ext(990, 500, 1200, 645, 50, 50, c_black, c_black, false)
    draw_set_alpha(1)
    if button_collision(1150, 600, 1190, 635)
        draw_sprite_ext(spr_icon_rain, 0, (display_get_gui_width() - 110), (display_get_gui_height() - 100), 0.6, 0.6, 0, c_white, 1)
    else
        draw_sprite_ext(spr_icon_rain, 0, (display_get_gui_width() - 110), (display_get_gui_height() - 100), 0.5, 0.5, 0, c_white, 1)
    if button_collision(1100, 600, 1140, 635)
        draw_sprite_ext(spr_icon_wind, 0, (display_get_gui_width() - 160), (display_get_gui_height() - 100), 0.6, 0.6, 0, c_white, 1)
    else
        draw_sprite_ext(spr_icon_wind, 0, (display_get_gui_width() - 160), (display_get_gui_height() - 100), 0.5, 0.5, 0, c_white, 1)
    if button_collision(1050, 600, 1090, 635)
        draw_sprite_ext(spr_icon_fire, 0, (display_get_gui_width() - 210), (display_get_gui_height() - 100), 0.6, 0.6, 0, c_white, 1)
    else
        draw_sprite_ext(spr_icon_fire, 0, (display_get_gui_width() - 210), (display_get_gui_height() - 100), 0.5, 0.5, 0, c_white, 1)
    if button_collision(1000, 600, 1040, 635)
        draw_sprite_ext(spr_icon_bird, 0, (display_get_gui_width() - 260), (display_get_gui_height() - 100), 0.6, 0.6, 0, c_white, 1)
    else
        draw_sprite_ext(spr_icon_bird, 0, (display_get_gui_width() - 260), (display_get_gui_height() - 100), 0.5, 0.5, 0, c_white, 1)
    slider_y1 = array_get(slider_volume((display_get_gui_width() - 110), slider_y1, drag_1, "rain"), 0)
    drag_1 = array_get(slider_volume((display_get_gui_width() - 110), slider_y1, drag_1, "rain"), 1)
    slider_y2 = array_get(slider_volume((display_get_gui_width() - 160), slider_y2, drag_2, "wind"), 0)
    drag_2 = array_get(slider_volume((display_get_gui_width() - 160), slider_y2, drag_2, "wind"), 1)
    slider_y3 = array_get(slider_volume((display_get_gui_width() - 210), slider_y3, drag_3, "fire"), 0)
    drag_3 = array_get(slider_volume((display_get_gui_width() - 210), slider_y3, drag_3, "fire"), 1)
    slider_y4 = array_get(slider_volume((display_get_gui_width() - 260), slider_y4, drag_4, "bird"), 0)
    drag_4 = array_get(slider_volume((display_get_gui_width() - 260), slider_y4, drag_4, "bird"), 1)
    if button_clickon(1197, 502, spr_icon_close_small, 1, "switch")
        page_noise = -1
}
if (time_total > 36000)
{
    if (!steam_get_achievement("quick_focus"))
        steam_set_achievement("quick_focus")
}
if (time_total > 108000)
{
    if (!steam_get_achievement("steady_concentration"))
        steam_set_achievement("steady_concentration")
}
if (time_total > 216000)
{
    if (!steam_get_achievement("hour_of_dedication"))
        steam_set_achievement("hour_of_dedication")
}
if (time_total > 1080000)
{
    if (!steam_get_achievement("five_hour_of_flow"))
        steam_set_achievement("five_hour_of_flow")
}
if (time_total > 2160000)
{
    if (!steam_get_achievement("ten_hour_deep"))
        steam_set_achievement("ten_hour_deep")
}
if (time_total > 4320000)
{
    if (!steam_get_achievement("day_of_devotion"))
        steam_set_achievement("day_of_devotion")
}
if (time_total > 21600000)
{
    if (!steam_get_achievement("century_of_focus"))
        steam_set_achievement("century_of_focus")
}
if (timer_run == true)
{
    mode_focus = true
    count_pomodoro += (60 / room_speed)
    time_total += (60 / room_speed)
    pomodoro_minute -= (60 / room_speed)
    score_count += (60 / room_speed)
    if (score_count >= 360)
    {
        score_count = 0
        score_show_delay = 120
        level_count += (60 / room_speed * (obj_cup.gain_exp / 100 + 1))
        if (state_reply == "too_much_reply")
            count_reply_cd += (60 / room_speed)
        if (count_reply_cd > 50)
        {
            count_reply_cd = 0
            reply_count = 0
            state_reply = "idle"
        }
        var _match = false
        for (i = 0; i < array_length(task_days); i++)
        {
            var _day = task_days[i]
            if (_day[0] == current_year && _day[1] == current_month && _day[2] == current_day)
            {
                _match = true
                _day[4] += 0.1
            }
        }
        if (_match == false)
            array_push(task_days, [current_year, current_month, current_day, [], 0])
    }
    if (pomodoro_minute <= 0)
    {
        if (!steam_get_achievement("first_pomodoro_task"))
            steam_set_achievement("first_pomodoro_task")
        if (alarm_play_sound == 1)
            audio_play_sound(sd_alarm, 99, false)
        if (flashing_effect == 1)
            fadetoroom(false, 30, 16777215, false, false)
        timer_run = false
        rest_run = true
        score_total += floor(count_pomodoro / 3600 * (obj_cup.gain_gold / 100 + 1) * 2 * (0.05263157894736842 * level + 0.9473684210526315))
        count_pomodoro_temp = floor(count_pomodoro / 3600)
        count_pomodoro = 0
        money_show_delay = 180
        if (current_scene == 0 && current_sentence[current_scene][1] == -1)
            new_contact_notif[current_scene] = true
        var _nora = current_npc[current_scene]
        if (current_sentence[current_scene][_nora] < (array_length(dialogue[current_scene][_nora]) - 1))
        {
            if (dialogue[current_scene][_nora][(current_sentence[current_scene][_nora] + 1)][0] == "")
            {
                if (dialogue[current_scene][_nora][(current_sentence[current_scene][_nora] + 1)][1] == "Me")
                {
                    current_sentence[current_scene][_nora] += 1
                    if (current_sentence[current_scene][_nora] >= 6)
                        sentence_show_start[current_scene][_nora] += 1
                }
                else
                {
                    current_npc[current_scene] = dialogue[current_scene][_nora][(current_sentence[current_scene][_nora] + 1)][1]
                    _nora = current_npc[current_scene]
                    if (current_sentence[current_scene][_nora] == -1)
                        new_contact_notif[current_scene] = true
                    else
                    {
                        current_sentence[current_scene][_nora] += 1
                        if (current_sentence[current_scene][_nora] >= 6)
                            sentence_show_start[current_scene][_nora] += 1
                    }
                }
            }
        }
    }
}
else
    mode_focus = false
if (rest_run == true)
{
    rest_minute -= 1
    if (rest_minute <= 0)
    {
        rest_run = false
        rest_minute = rest_minute_max
        pomodoro_minute = pomodoro_minute_max
        if (auto_renew_pomodoro == -1)
            timer_run = false
        else if (auto_renew_pomodoro == 1)
        {
            timer_run = true
            if (alarm_play_sound == 1)
                audio_play_sound(sd_alarm, 99, false)
        }
    }
}
score_show_delay = max(0, (score_show_delay - 1))
if (score_show_delay > 0 && show_level_up == 1)
{
    draw_sprite_ext(spr_icon_spirit_small, 0, (display_get_gui_width() / 2), (130 + score_show_delay / 4), 0.5, 0.5, 0, c_white, (score_show_delay / 120))
    draw_set_font(fontCJK)
    draw_set_valign(fa_middle)
    draw_set_halign(fa_center)
    draw_text_transformed_color((display_get_gui_width() / 2 + 30), (130 + score_show_delay / 4), ("+" + (string(obj_cup.gain_exp / 100 + 1))), 0.25, 0.25, 0, c_white, c_white, c_white, c_white, (score_show_delay / 60))
}
money_show_delay = max(0, (money_show_delay - 1))
if (money_show_delay > 0 && show_level_up == 1)
{
    draw_sprite_ext(spr_icon_diamond, 0, 40, (43 + money_show_delay / 4), 0.6, 0.6, 0, c_white, (money_show_delay / 120))
    draw_set_font(fontCJK)
    draw_set_valign(fa_middle)
    draw_set_halign(fa_center)
    draw_text_transformed_color(90, (43 + money_show_delay / 4), ("+" + (string(floor(count_pomodoro_temp * (obj_cup.gain_gold / 100 + 1))))), 0.3, 0.3, 0, c_white, c_white, c_white, c_white, (money_show_delay / 60))
}
if (page_todo && (!page_customization) && (!page_scene) && (!page_phone) && (!page_diary) && (!page_mail))
{
    if mc_click
    {
        var click_on_list_fav = false
        var click_on_list = false
    }
    if button_collision(327, 12, 370, 46)
    {
        draw_sprite_ext(spr_add, 0, 350, 32, 1.1, 1.1, 0, c_white, 1)
        if mc_click
            add_task(list_todo)
    }
    else
        draw_sprite_ext(spr_add, 0, 350, 32, 0.8, 0.8, 0, c_white, 1)
    if button_collision(277, 12, 320, 46)
    {
        draw_sprite_ext(spr_icon_star, 0, 300, 32, 0.35, 0.35, 0, c_white, 1)
        if mc_click
            page_fav_task = true
    }
    else
        draw_sprite_ext(spr_icon_star, 0, 300, 32, 0.3, 0.3, 0, c_white, 1)
    if (page_fav_task == true)
    {
        draw_set_alpha(0.8)
        draw_set_color(c_black)
        draw_roundrect(540, 100, 950, 500, false)
        draw_set_alpha(1)
        draw_set_color(c_white)
        draw_line_width(570, 150, 900, 150, 1)
        draw_set_font(fontCJK)
        draw_set_valign(fa_middle)
        draw_set_halign(fa_left)
        draw_text_transformed(570, 123, _text_todo_fav, 0.5, 0.5, 0)
        if (array_length(list_todo_fav) >= 8 && page_music_list == -1)
        {
            if button_collision(558, 165, 930, 500)
            {
                if mouse_wheel_down()
                    current_task_start_fav = min((current_task_start_fav + 1), (array_length(list_todo_fav) - 8))
                if mouse_wheel_up()
                    current_task_start_fav = max((current_task_start_fav - 1), 0)
            }
            draw_set_alpha(0.5)
            draw_line_width(940, 160, 940, 480, 2)
            draw_set_alpha(1)
            mc_list_slider2 = current_task_start_fav / (array_length(list_todo_fav) - 8) * 320 + 160
            draw_circle(940, mc_list_slider2, 5, false)
        }
        if button_collision(860, 103, 900, 143)
        {
            draw_sprite_ext(spr_add, 0, 880, 123, 1.1, 1.1, 0, c_white, 1)
            if mc_click
                add_task(list_todo_fav)
        }
        else
            draw_sprite_ext(spr_add, 0, 880, 123, 0.8, 0.8, 0, c_white, 1)
        if button_collision(810, 103, 850, 143)
        {
            draw_sprite_ext(spr_icon_addall, 0, 830, 123, 0.7, 0.7, 0, c_white, 1)
            if mc_click
            {
                for (var ilist = 0; ilist < array_length(list_todo_fav); ilist++)
                    add_task(list_todo, list_todo_fav[ilist])
            }
        }
        else
            draw_sprite_ext(spr_icon_addall, 0, 830, 123, 0.6, 0.6, 0, c_white, 1)
        if button_clickon(950, 100, spr_icon_close_small, 1, "switch")
            page_fav_task = false
        for (i = 0; i < min(8, array_length(list_todo_fav)); i++)
        {
            var _task = list_todo_fav[(i + current_task_start_fav)]
            if button_collision(570, (170 + i * 40), 835, (205 + i * 40))
            {
                draw_set_color(c_white)
                draw_set_alpha(0.5)
                draw_roundrect(570, (170 + i * 40), 835, (205 + i * 40), false)
                draw_set_color(c_white)
                draw_set_alpha(1)
                if mc_click
                {
                    click_on_list_fav = true
                    typing_active_fav = true
                    current_todo_fav = i + current_task_start_fav
                    keyboard_string = list_todo_fav[current_todo_fav].text
                    typing_active = false
                }
            }
            else
            {
                draw_set_color(c_white)
                draw_set_alpha(0.2)
                draw_roundrect(570, (170 + i * 40), 835, (205 + i * 40), false)
                draw_set_color(c_white)
                draw_set_alpha(1)
            }
            draw_set_font(fontCJK)
            if (_task.text != "")
                draw_text_transformed(580, (190 + i * 40), _task.text, 0.3, 0.3, 0)
            else
                draw_text_transformed(580, (190 + i * 40), _text_type_here, 0.3, 0.3, 0)
            draw_set_font(fontCJK)
            if button_collision(895, (170 + 40 * i), 945, (200 + 40 * i))
            {
                draw_sprite_ext(spr_minus, 0, 920, (185 + i * 40), 1.1, 1.1, 0, c_white, 1)
                if mc_click
                {
                    array_delete(list_todo_fav, (i + current_task_start_fav), 1)
                    typing_active_fav = false
                    current_task_start_fav = max(0, (current_task_start_fav - 1))
                }
            }
            else
                draw_sprite_ext(spr_minus, 0, 920, (185 + i * 40), 0.8, 0.8, 0, c_white, 1)
            if button_collision(845, (170 + 40 * i), 895, (200 + 40 * i))
            {
                draw_sprite_ext(spr_add, 0, 870, (185 + i * 40), 1.1, 1.1, 0, c_white, 1)
                if mc_click
                    add_task(list_todo, _task)
            }
            else
                draw_sprite_ext(spr_add, 0, 870, (185 + i * 40), 0.8, 0.8, 0, c_white, 1)
        }
        var _text_length = string_width(keyboard_string) * 0.3
        if (_text_length >= 250)
            keyboard_string = string_copy(keyboard_string, 1, (string_length(keyboard_string) - 1))
        if (typing_active_fav == true)
        {
            if ((current_todo_fav - current_task_start_fav) >= 0 && (current_todo - current_task_start_fav) < 8)
                draw_sprite_ext(spr_typing_flash, 0, (585 + string_width(keyboard_string) * 0.3), (190 + (current_todo_fav - current_task_start_fav) * 40), 0.75, 0.75, 0, c_white, 1)
            list_todo_fav[current_todo_fav].text = keyboard_string
        }
        if mc_click
        {
            if (click_on_list_fav == false)
                typing_active_fav = false
        }
    }
    draw_set_font(fontCJK)
    draw_set_valign(fa_middle)
    draw_set_halign(fa_left)
    draw_text_transformed(30, 32, _text_todo, 0.5, 0.5, 0)
    draw_line_width(30, 50, 370, 50, 2)
    if (button_collision(30, 0, 400, 360) && array_length(list_todo) >= 7)
    {
        if mouse_wheel_down()
            current_task_start = min((current_task_start + 1), (array_length(list_todo) - 7))
        if mouse_wheel_up()
            current_task_start = max((current_task_start - 1), 0)
    }
    if (array_length(list_todo) >= 9)
    {
        draw_set_alpha(0.8)
        draw_set_color(c_black)
        draw_roundrect(377, 57, 392, 330, false)
        draw_set_color(c_white)
        draw_set_alpha(1)
        draw_set_alpha(0.5)
        draw_line_width(385, 70, 385, 320, 2)
        draw_set_alpha(1)
        mc_list_slider2 = current_task_start / (array_length(list_todo) - 7) * 250 + 70
        draw_circle(385, mc_list_slider2, 5, false)
    }
    for (i = 0; i < min(7, array_length(list_todo)); i++)
    {
        _task = list_todo[(i + current_task_start)]
        if (button_collision(65, (60 + i * 40), 330, (95 + i * 40)) && _task.finish == false)
        {
            draw_set_color(c_white)
            draw_set_alpha(0.2)
            draw_roundrect(60, (60 + i * 40), 330, (95 + i * 40), false)
            draw_set_color(c_white)
            draw_set_alpha(1)
            if mc_click
            {
                click_on_list = true
                typing_active = true
                typing_active_fav = false
                current_todo = i + current_task_start
                keyboard_string = list_todo[current_todo].text
            }
        }
        else
        {
            draw_set_color(c_black)
            draw_set_alpha(0.7)
            draw_roundrect(60, (60 + i * 40), 330, (95 + i * 40), false)
            draw_set_color(c_white)
            draw_set_alpha(1)
        }
        draw_set_font(fontCJK)
        if (_task.text != "")
            draw_text_transformed(70, (80 + i * 40), _task.text, 0.3, 0.3, 0)
        else
            draw_text_transformed(70, (80 + i * 40), _text_type_here, 0.3, 0.3, 0)
        draw_set_font(fontCJK)
        if button_collision(332, (52 + 40 * i), 370, (80 + 40 * i))
        {
            draw_sprite_ext(spr_minus, 0, 350, (75 + i * 40), 1.1, 1.1, 0, c_white, 1)
            if mc_click
            {
                array_delete(list_todo, (i + current_task_start), 1)
                typing_active = false
                current_task_start = max(0, (current_task_start - 1))
            }
        }
        else
            draw_sprite_ext(spr_minus, 0, 350, (75 + i * 40), 0.8, 0.8, 0, c_white, 1)
        var _ind_img = 1
        if (_task.finish == true)
            _ind_img = 1
        else
            _ind_img = 0
        if button_collision(25, (62 + 40 * i), 54, (88 + 40 * i))
        {
            draw_sprite_ext(spr_case, _ind_img, 40, (78 + i * 40), 0.9, 0.9, 0, c_white, 1)
            if (mc_click && _task.finish == false)
            {
                if (!steam_get_achievement("first_step_forward"))
                    steam_set_achievement("first_step_forward")
                add_current_day_to_tasks()
                _task.finish = true
                for (ii = 0; ii < array_length(task_days); ii++)
                {
                    _day = task_days[ii]
                    if (_day[0] == current_year && _day[1] == current_month && _day[2] == current_day)
                    {
                        if (_task.text != "")
                            array_push(_day[3], _task.text)
                    }
                }
            }
        }
        else
            draw_sprite_ext(spr_case, _ind_img, 40, (78 + i * 40), 0.75, 0.75, 0, c_white, 1)
        if (_task.finish == true)
            draw_line_width(70, (80 + 40 * i), 300, (80 + 40 * i), 2)
    }
    draw_set_color(c_white)
    _text_length = string_width(keyboard_string) * 0.3
    if (_text_length >= 250)
        keyboard_string = string_copy(keyboard_string, 1, (string_length(keyboard_string) - 1))
    if (typing_active == true)
    {
        if ((current_todo - current_task_start) >= 0 && (current_todo - current_task_start) < 7)
            draw_sprite_ext(spr_typing_flash, 0, (75 + string_width(keyboard_string) * 0.3), (80 + (current_todo - current_task_start) * 40), 0.75, 0.75, 0, c_white, 1)
        list_todo[current_todo].text = keyboard_string
    }
    if mc_click
    {
        if (click_on_list == false)
            typing_active = false
    }
}
if page_diary
{
    draw_set_alpha(0.5)
    draw_set_color(c_black)
    draw_rectangle(0, 0, (center_x * 2), (center_y * 2), false)
    draw_set_alpha(1)
    draw_set_color(c_white)
    if button_collision(1022, 123, 1076, 178)
    {
        draw_sprite_ext(spr_icon_close, 0, 1050, 150, 2.2, 2.2, 0, c_white, 1)
        if mc_click
        {
            instance_destroy(obj_input_text)
            page_diary = -1
            current_diary = -1
        }
    }
    else
        draw_sprite_ext(spr_icon_close, 0, 1050, 150, 2, 2, 0, c_white, 1)
    draw_sprite_ext(spr_diary, current_scene, center_x, center_y, 2, 2, 0, c_white, 1)
    var _spr_tag = spr_tag_list
    for (i = 0; i < 3; i++)
    {
        if (i == current_diary_page)
            draw_sprite_ext(_spr_tag[current_scene], (2 * i), (center_x - 370), (center_y - 170 + 90 * i), 2, 2, 0, c_white, 1)
        else
            draw_sprite_ext(_spr_tag[current_scene], (2 * i), (center_x - 370), (center_y - 170 + 90 * i), 2, 2, 0, c_silver, 1)
        if button_collision(232, (154 + 90 * i), 303, (226 + 90 * i))
        {
            draw_sprite_ext(_spr_tag[current_scene], (2 * i + 1), (center_x - 370), (center_y - 170 + 90 * i), 2, 2, 0, c_white, 1)
            if mc_click
            {
                current_diary_page = i
                if (current_diary_page != 2)
                {
                    instance_destroy(obj_input_text)
                    current_diary = -1
                }
            }
        }
    }
    var color = color_hub
    if (_current_year == 2024)
    {
        list_month_length = list_month_length_2024
        first_day = first_day_2024
    }
    if (_current_year == 2025)
    {
        list_month_length = list_month_length_2025
        first_day = first_day_2025
    }
    if (current_diary_page == 0)
    {
        draw_set_valign(fa_middle)
        draw_set_halign(fa_center)
        color = color_diary_0
        draw_text_transformed_color((center_x - 160), 185, list_month[_current_month], 0.5, 0.5, 0, color[current_scene], color[current_scene], color[current_scene], color[current_scene], 1)
        draw_text_transformed_color(570, 530, _current_year, 0.5, 0.5, 0, color[current_scene], color[current_scene], color[current_scene], color[current_scene], 1)
        draw_text_transformed_color(513, 128, _text_calendar, 0.3, 0.3, 0, color[current_scene], color[current_scene], color[current_scene], color[current_scene], 1)
        for (i = 0; i <= 41; i++)
        {
            var _sum = (array_sum(list_month_length, _current_month)) + first_day
            var _current_pos = _sum % 7
            var start_day = _current_pos
            if (i >= start_day && i <= (start_day + list_month_length[_current_month] - 1))
            {
                ii = i - start_day + 1
                var ix = i % 7
                var iy = i div 7
                var start_x = center_x - 290
                var start_y = 250
                var cell_x = 40
                var cell_y = 50
                var color_slot = color_slot_list
                var r = 20
                if button_collision((start_x + ix * cell_x - r), (start_y + iy * cell_y - r), (start_x + ix * cell_x + r), (start_y + iy * cell_y + r))
                {
                    draw_set_alpha(0.3)
                    draw_circle_color((start_x + ix * cell_x), (start_y + iy * cell_y), r, color_slot[current_scene], color_slot[current_scene], false)
                    draw_set_alpha(1)
                    if mc_click
                    {
                        _select_day = ii
                        _select_month = _current_month
                        _select_year = _current_year
                    }
                }
                for (_task = 0; _task < array_length(task_days); _task++)
                {
                    var _current_task = task_days[_task]
                    if (_current_year == _current_task[0] && (_current_month + 1) == _current_task[1] && ii == _current_task[2])
                    {
                        if (_current_task[4] != 0 || array_length(_current_task[3]) != 0)
                            draw_sprite_ext(spr_calendar_icon_mark, current_scene, (start_x + ix * cell_x), (start_y + iy * cell_y), 0.8, 0.8, 0, c_white, 1)
                    }
                }
                draw_set_valign(fa_middle)
                draw_set_halign(fa_center)
                draw_text_transformed_color((start_x + ix * cell_x), (start_y + iy * cell_y), ii, 0.4, 0.4, 0, color[current_scene], color[current_scene], color[current_scene], color[current_scene], 1)
                if (current_year == _current_year && current_month == (_current_month + 1) && current_day == ii)
                    draw_sprite_ext(spr_calendar_current_day_ind, current_scene, (start_x + ix * cell_x), (start_y + iy * cell_y), 1, 1, 0, c_white, 1)
                if (_select_year == _current_year && _select_month == _current_month && _select_day == ii)
                {
                    draw_set_alpha(0.3)
                    draw_circle_color((start_x + ix * cell_x), (start_y + iy * cell_y), r, color_slot[current_scene], color_slot[current_scene], false)
                    draw_set_alpha(1)
                }
            }
        }
        if button_collision(570, 166, 600, 200)
        {
            draw_sprite_ext(spr_icon_changetheme, 0, 585, 186, -0.6, 0.6, 0, color[current_scene], 0.5)
            if mc_click
            {
                if (_current_month == 11 && _current_year == 2024)
                {
                    _current_month = 0
                    _current_year += 1
                }
                else
                    _current_month = min((array_length(list_month) - 1), (_current_month + 1))
            }
        }
        else
            draw_sprite_ext(spr_icon_changetheme, 0, 585, 186, -0.5, 0.5, 0, color[current_scene], 0.5)
        if button_collision(350, 166, 380, 200)
        {
            draw_sprite_ext(spr_icon_changetheme, 0, 370, 186, 0.6, 0.6, 0, color[current_scene], 0.5)
            if mc_click
            {
                if (_current_month == 0 && _current_year == 2025)
                {
                    _current_month = 11
                    _current_year -= 1
                }
                else
                    _current_month = max(0, (_current_month - 1))
            }
        }
        else
            draw_sprite_ext(spr_icon_changetheme, 0, 370, 186, 0.5, 0.5, 0, color[current_scene], 0.5)
        var text_date = string(_select_year) + "/" + (string(_select_month + 1)) + "/" + string(_select_day)
        draw_text_transformed_color(809, 145, text_date, 0.4, 0.4, 0, color[current_scene], color[current_scene], color[current_scene], color[current_scene], 1)
        draw_set_valign(fa_middle)
        draw_set_halign(fa_left)
        var _color = color
        draw_text_transformed_color(688, 220, _text_focus_time, 0.3, 0.3, 0, _color[current_scene], _color[current_scene], _color[current_scene], _color[current_scene], 1)
        draw_line_width_color(688, 240, 940, 240, 2, _color[current_scene], _color[current_scene])
        draw_text_transformed_color(688, 320, _text_task_completed, 0.3, 0.3, 0, _color[current_scene], _color[current_scene], _color[current_scene], _color[current_scene], 1)
        draw_line_width_color(688, 340, 940, 340, 2, _color[current_scene], _color[current_scene])
        for (var _d = 0; _d < array_length(task_days); _d++)
        {
            if (task_days[_d][0] == _select_year && task_days[_d][1] == (_select_month + 1) && task_days[_d][2] == _select_day)
            {
                if (task_days[_d][4] > 0)
                    draw_text_transformed_color(688, 260, (string(task_days[_d][4]) + _text_minute), 0.3, 0.3, 0, _color[current_scene], _color[current_scene], _color[current_scene], _color[current_scene], 1)
                if (button_collision(685, 347, 935, 555) && array_length(task_days[_d][3]) >= 7)
                {
                    if mouse_wheel_down()
                        current_task_diary_start = min((current_task_diary_start + 1), (array_length(task_days[_d][3]) - 7))
                    if mouse_wheel_up()
                        current_task_diary_start = max((current_task_diary_start - 1), 0)
                }
                if (array_length(task_days[_d][3]) >= 7)
                {
                    draw_set_color(_color[current_scene])
                    draw_set_alpha(0.5)
                    draw_line_width(947, 360, 947, 555, 2)
                    draw_set_alpha(1)
                    mc_list_slider2 = current_task_diary_start / (array_length(task_days[_d][3]) - 7) * 195 + 360
                    draw_circle(947, mc_list_slider2, 5, false)
                    draw_set_color(c_white)
                }
                for (var _t = 0; _t < min(7, array_length(task_days[_d][3])); _t++)
                {
                    draw_text_transformed_color(688, (348 + 30 * _t), ".", 0.6, 0.6, 0, _color[current_scene], _color[current_scene], _color[current_scene], _color[current_scene], 1)
                    draw_text_transformed_color(710, (360 + 30 * _t), task_days[_d][3][(_t + current_task_diary_start)], 0.3, 0.3, 0, _color[current_scene], _color[current_scene], _color[current_scene], _color[current_scene], 1)
                    var _color_diary_fond = color_diary_fond
                    if button_collision(690, (347 + 30 * _t), 937, (371 + 30 * _t))
                    {
                        draw_set_alpha(0.2)
                        draw_set_color(_color_diary_fond[current_scene])
                        draw_roundrect(690, (347 + 30 * _t), 937, (371 + 30 * _t), false)
                        draw_set_alpha(1)
                        draw_set_color(c_white)
                        if button_collision(915, (353 + 30 * _t), 930, (365 + 30 * _t))
                        {
                            draw_sprite_ext(spr_minus, 0, 923, (360 + 30 * _t), 0.7, 0.7, 0, _color_diary_fond[current_scene], 1)
                            if mc_click
                            {
                                array_delete(task_days[_d][3], (_t + current_task_diary_start), 1)
                                current_task_diary_start = max(0, (current_task_diary_start - 1))
                            }
                        }
                        else
                            draw_sprite_ext(spr_minus, 0, 923, (360 + 30 * _t), 0.5, 0.5, 0, _color_diary_fond[current_scene], 1)
                    }
                }
            }
        }
    }
    if (current_diary_page == 1)
    {
        color = color_diary_text
        draw_set_valign(fa_middle)
        draw_set_halign(fa_center)
        draw_text_transformed_color(513, 128, _text_setting, 0.3, 0.3, 0, color[current_scene], color[current_scene], color[current_scene], color[current_scene], 1)
        _color = color_diary_real_text
        draw_set_valign(fa_middle)
        draw_set_halign(fa_left)
        draw_text_transformed_color(340, 210, _text_language, 0.3, 0.3, 0, _color[current_scene], _color[current_scene], _color[current_scene], _color[current_scene], 1)
        if button_collision(560, 230, 580, 270)
        {
            draw_sprite_ext(spr_icon_changetheme, 0, 570, 250, -0.6, 0.6, 0, _color[current_scene], 0.5)
            if mc_click
                current_language = min((array_length(all_language) - 1), (current_language + 1))
        }
        else
            draw_sprite_ext(spr_icon_changetheme, 0, 570, 250, -0.5, 0.5, 0, _color[current_scene], 0.5)
        if button_collision(354, 230, 380, 270)
        {
            draw_sprite_ext(spr_icon_changetheme, 0, 370, 250, 0.6, 0.6, 0, _color[current_scene], 0.5)
            if mc_click
                current_language = max(0, (current_language - 1))
        }
        else
            draw_sprite_ext(spr_icon_changetheme, 0, 370, 250, 0.5, 0.5, 0, _color[current_scene], 0.5)
        draw_set_valign(fa_middle)
        draw_set_halign(fa_center)
        draw_text_transformed_color(460, 245, all_language[current_language], 0.3, 0.3, 0, _color[current_scene], _color[current_scene], _color[current_scene], _color[current_scene], 1)
        draw_set_valign(fa_middle)
        draw_set_halign(fa_left)
        draw_text_transformed_color(340, 320, _text_show_levelup, 0.3, 0.3, 0, _color[current_scene], _color[current_scene], _color[current_scene], _color[current_scene], 1)
        if (show_level_up == 1)
            _ind_img = 1
        else
            _ind_img = 0
        if button_collision(342, 303, 374, 376)
        {
            draw_sprite_ext(spr_case, _ind_img, 360, 360, 1.2, 1.2, 0, _color[current_scene], 1)
            if mc_click
                show_level_up *= -1
        }
        else
            draw_sprite_ext(spr_case, _ind_img, 360, 360, 1, 1, 0, _color[current_scene], 1)
        draw_set_valign(fa_middle)
        draw_set_halign(fa_left)
        draw_text_transformed_color(340, 400, _text_mouse_effect, 0.3, 0.3, 0, _color[current_scene], _color[current_scene], _color[current_scene], _color[current_scene], 1)
        if (mouse_effect == 1)
            _ind_img = 1
        else
            _ind_img = 0
        if button_collision(342, 432, 374, 464)
        {
            draw_sprite_ext(spr_case, _ind_img, 360, 450, 1.2, 1.2, 0, _color[current_scene], 1)
            if mc_click
                mouse_effect *= -1
        }
        else
            draw_sprite_ext(spr_case, _ind_img, 360, 450, 1, 1, 0, _color[current_scene], 1)
        draw_set_valign(fa_middle)
        draw_set_halign(fa_left)
        draw_text_transformed_color(340, 500, _text_light_effect, 0.3, 0.3, 0, _color[current_scene], _color[current_scene], _color[current_scene], _color[current_scene], 1)
        if (light_effect == 1)
            _ind_img = 1
        else
            _ind_img = 0
        if button_collision(345, 530, 374, 565)
        {
            draw_sprite_ext(spr_case, _ind_img, 360, 550, 1.2, 1.2, 0, _color[current_scene], 1)
            if mc_click
                light_effect *= -1
        }
        else
            draw_sprite_ext(spr_case, _ind_img, 360, 550, 1, 1, 0, _color[current_scene], 1)
        draw_set_valign(fa_middle)
        draw_set_halign(fa_left)
        draw_text_transformed_color(680, 135, _text_remove_human, 0.3, 0.3, 0, _color[current_scene], _color[current_scene], _color[current_scene], _color[current_scene], 1)
        if (show_human == -1)
            _ind_img = 1
        else
            _ind_img = 0
        if button_collision(932, 122, 965, 160)
        {
            draw_sprite_ext(spr_case, _ind_img, 950, 140, 1.2, 1.2, 0, _color[current_scene], 1)
            if mc_click
                show_human *= -1
        }
        else
            draw_sprite_ext(spr_case, _ind_img, 950, 140, 1, 1, 0, _color[current_scene], 1)
        draw_set_valign(fa_middle)
        draw_set_halign(fa_left)
        draw_text_transformed_color(680, 215, _text_show_border, 0.3, 0.3, 0, _color[current_scene], _color[current_scene], _color[current_scene], _color[current_scene], 1)
        if (show_border == -1)
            _ind_img = 1
        else
            _ind_img = 0
        if button_collision(682, 242, 715, 280)
        {
            draw_sprite_ext(spr_case, _ind_img, 700, 260, 1.2, 1.2, 0, _color[current_scene], 1)
            if mc_click
            {
                show_border *= -1
                if (show_border == 1)
                    window_set_showborder(true)
                else
                    window_set_showborder(false)
            }
        }
        else
            draw_sprite_ext(spr_case, _ind_img, 700, 260, 1, 1, 0, _color[current_scene], 1)
        draw_set_valign(fa_middle)
        draw_set_halign(fa_left)
        draw_text_transformed_color(680, 295, _text_flashing_effect, 0.3, 0.3, 0, _color[current_scene], _color[current_scene], _color[current_scene], _color[current_scene], 1)
        if (flashing_effect == 1)
            _ind_img = 1
        else
            _ind_img = 0
        if button_collision(682, 322, 715, 360)
        {
            draw_sprite_ext(spr_case, _ind_img, 700, 340, 1.2, 1.2, 0, _color[current_scene], 1)
            if mc_click
                flashing_effect *= -1
        }
        else
            draw_sprite_ext(spr_case, _ind_img, 700, 340, 1, 1, 0, _color[current_scene], 1)
        draw_set_valign(fa_middle)
        draw_set_halign(fa_left)
        draw_text_transformed_color(680, 175, _text_mail_function, 0.3, 0.3, 0, _color[current_scene], _color[current_scene], _color[current_scene], _color[current_scene], 1)
        if (mail_function == 1)
            _ind_img = 1
        else
            _ind_img = 0
        if button_collision(932, 162, 965, 200)
        {
            draw_sprite_ext(spr_case, _ind_img, 950, 180, 1.2, 1.2, 0, _color[current_scene], 1)
            if mc_click
                mail_function *= -1
        }
        else
            draw_sprite_ext(spr_case, _ind_img, 950, 180, 1, 1, 0, _color[current_scene], 1)
        draw_set_valign(fa_middle)
        draw_set_halign(fa_left)
        draw_text_transformed_color(680, 455, _text_festival_mode, 0.3, 0.3, 0, _color[current_scene], _color[current_scene], _color[current_scene], _color[current_scene], 1)
        if (scene_christmas == 1)
            _ind_img = 1
        else
            _ind_img = 0
        if button_collision(832, 482, 865, 520)
        {
            draw_sprite_ext(spr_case, _ind_img, 850, 500, 1.2, 1.2, 0, _color[current_scene], 1)
            if mc_click
            {
                scene_christmas *= -1
                if (scene_christmas == 1)
                    scene_halloween = -1
            }
        }
        else
            draw_sprite_ext(spr_case, _ind_img, 850, 500, 1, 1, 0, _color[current_scene], 1)
        draw_text_transformed_color(680, 495, _text_christmas, 0.3, 0.3, 0, _color[current_scene], _color[current_scene], _color[current_scene], _color[current_scene], 1)
        if (scene_halloween == 1)
            _ind_img = 1
        else
            _ind_img = 0
        if button_collision(832, 522, 865, 560)
        {
            draw_sprite_ext(spr_case, _ind_img, 850, 540, 1.2, 1.2, 0, _color[current_scene], 1)
            if mc_click
            {
                scene_halloween *= -1
                if (scene_halloween == 1)
                    scene_christmas = -1
            }
        }
        else
            draw_sprite_ext(spr_case, _ind_img, 850, 540, 1, 1, 0, _color[current_scene], 1)
        draw_text_transformed_color(680, 535, _text_halloween, 0.3, 0.3, 0, _color[current_scene], _color[current_scene], _color[current_scene], _color[current_scene], 1)
        draw_set_valign(fa_middle)
        draw_set_halign(fa_left)
        draw_text_transformed_color(680, 385, _text_time_format_24h, 0.3, 0.3, 0, _color[current_scene], _color[current_scene], _color[current_scene], _color[current_scene], 1)
        if (time_format_24 == 1)
            _ind_img = 1
        else
            _ind_img = 0
        if button_collision(932, 367, 965, 405)
        {
            draw_sprite_ext(spr_case, _ind_img, 950, 385, 1.2, 1.2, 0, _color[current_scene], 1)
            if mc_click
                time_format_24 *= -1
        }
        else
            draw_sprite_ext(spr_case, _ind_img, 950, 385, 1, 1, 0, _color[current_scene], 1)
    }
    if (current_diary_page == 2)
    {
        var color_diary = color_diary_text
        switch state_diary
        {
            case "idle":
                draw_set_valign(fa_middle)
                draw_set_halign(fa_center)
                draw_text_transformed_color(513, 128, _text_diary, 0.3, 0.3, 0, color[current_scene], color[current_scene], color[current_scene], color[current_scene], 1)
                start_x = 360
                start_y = 290
                draw_set_valign(fa_middle)
                draw_set_halign(fa_left)
                draw_text_transformed_color((start_x - 30), (start_y - 100), _text_my_diary, 0.4, 0.4, 0, color[current_scene], color[current_scene], color[current_scene], color[current_scene], 1)
                var max_line = max(0, (((array_length(new_all_diary) - 1) div 3) - 2 + 1))
                if (mx_gui < (display_get_gui_width() / 2))
                {
                    if mouse_wheel_down()
                        diary_line_start = min((diary_line_start + 1), max_line)
                    if mouse_wheel_up()
                        diary_line_start = max((diary_line_start - 1), 0)
                }
                var _pos = diary_line_start / max_line
                draw_slider(614, 234, 553, _pos, color[current_scene])
                for (i = 0; i < min(6, array_length(new_all_diary)); i++)
                {
                    if ((i + diary_line_start * 3) < array_length(new_all_diary))
                    {
                        if ((i + diary_line_start * 3) == 0)
                        {
                            draw_sprite_ext(spr_diary_cover_none, 0, start_x, start_y, 2, 2, 0, c_white, 1)
                            if button_collision(324, 238, 397, 340)
                            {
                                draw_set_alpha(0.1)
                                draw_set_color(c_black)
                                draw_rectangle(324, 238, 397, 340, false)
                                draw_set_alpha(1)
                                draw_set_color(c_white)
                                if mc_click
                                {
                                    diary_line_start = max_line
                                    var new_diary = 
                                    {
                                        title: _text_new_diary,
                                        cover: 0,
                                        content: []
                                    }

                                    array_push(new_all_diary, new_diary)
                                    sub_state_diary = "idle"
                                    current_diary_select = array_length(new_all_diary) - 1
                                }
                            }
                        }
                        else
                        {
                            ix = i % 3
                            iy = i div 3
                            var _one_diary = new_all_diary[(i + diary_line_start * 3)]
                            var xoff = 100
                            var yoff = 160
                            draw_sprite_ext(diary_cover[_one_diary.cover], 0, (start_x + ix * xoff), (start_y + iy * yoff), 2, 2, 0, c_white, 1)
                            draw_set_valign(fa_middle)
                            draw_set_halign(fa_center)
                            draw_text_transformed_color((360 + ix * xoff), (365 + iy * yoff), _one_diary.title, 0.18, 0.18, 0, color[current_scene], color[current_scene], color[current_scene], color[current_scene], 1)
                            if button_collision((324 + ix * xoff), (238 + iy * yoff), (397 + ix * xoff), (340 + iy * yoff))
                            {
                                draw_set_alpha(0.1)
                                draw_set_color(c_black)
                                draw_rectangle((324 + ix * xoff), (238 + iy * yoff), (397 + ix * xoff), (340 + iy * yoff), false)
                                draw_set_alpha(1)
                                draw_set_color(c_white)
                                if mc_click
                                {
                                    current_diary_select = i + diary_line_start * 3
                                    sub_state_diary = "idle"
                                    instance_destroy(obj_input_text)
                                }
                            }
                        }
                    }
                }
                switch sub_state_diary
                {
                    case "delete diary":
                        draw_set_valign(fa_middle)
                        draw_set_halign(fa_center)
                        draw_text_ext_transformed_color(820, 250, _text_delete_diary, -1, 500, 0.5, 0.5, 0, color[current_scene], color[current_scene], color[current_scene], color[current_scene], 1)
                        if button64(920, 450, 0.8, color[current_scene], spr_icon_yes, 0.8)
                        {
                            array_delete(new_all_diary, current_diary_select, 1)
                            current_diary_select = -1
                            sub_state_diary = "idle"
                        }
                        if button64(720, 450, 0.8, color[current_scene], spr_icon_no, 0.8)
                            sub_state_diary = "idle"
                        break
                    case "idle":
                        if (current_diary_select > 0)
                        {
                            draw_sprite_ext(diary_cover[new_all_diary[current_diary_select].cover], 0, 820, 265, 5, 5, 0, c_white, 1)
                            draw_set_valign(fa_middle)
                            draw_set_halign(fa_center)
                            draw_set_font(fontCJK_letter)
                            if (instance_exists(change_title_inputbox) == false)
                                draw_text_transformed_color(820, 450, new_all_diary[current_diary_select].title, 1, 1, 0, color[current_scene], color[current_scene], color[current_scene], color[current_scene], 1)
                            draw_set_font(fontCJK)
                            if (instance_exists(change_title_inputbox) == false)
                            {
                                if button64(960, 450, 0.5, color[current_scene], spr_icon_write, 0.8)
                                {
                                    instance_destroy(obj_input_text)
                                    change_title_inputbox = input_text_create_multiline_ext(820, 450, 150, 100, fontCJK_letter, color[current_scene], 1, 150, -1, 2, -1, 1, 1, true, 0)
                                    input_text_set_text(change_title_inputbox, new_all_diary[current_diary_select].title)
                                    input_text_set_enabled(change_title_inputbox, true)
                                    draw_set_font(fontCJK)
                                }
                            }
                            else if button64(960, 450, 0.5, color[current_scene], spr_icon_yes, 0.8)
                            {
                                new_all_diary[current_diary_select].title = change_title_inputbox.text_draw
                                instance_destroy(obj_input_text)
                            }
                            if button64(960, 200, 0.5, color[current_scene], spr_icon_trashcan, 0.8)
                            {
                                sub_state_diary = "delete diary"
                                instance_destroy(obj_input_text)
                            }
                            if button64(960, 150, 0.5, color[current_scene], spr_icon_cover, 0.8)
                            {
                                sub_state_diary = "change cover"
                                instance_destroy(obj_input_text)
                            }
                            draw_set_color(color_diary[current_scene])
                            draw_set_alpha(0.2)
                            draw_roundrect(685, 500, 970, 550, false)
                            draw_text_transformed_color(827, 525, _text_enter_diary, 0.4, 0.4, 0, color[current_scene], color[current_scene], color[current_scene], color[current_scene], 1)
                            draw_set_color(c_white)
                            if button_collision(685, 500, 970, 550)
                            {
                                draw_roundrect_color(685, 500, 970, 550, color_diary[current_scene], color_diary[current_scene], false)
                                if mc_click
                                {
                                    state_diary = "list"
                                    current_diary_enter = current_diary_select
                                    current_diary_start = 0
                                    current_diary = -1
                                    instance_destroy(obj_input_text)
                                }
                            }
                            draw_set_alpha(1)
                            ix = (current_diary_select - diary_line_start * 3) % 3
                            iy = (current_diary_select - diary_line_start * 3) div 3
                            xoff = 100
                            yoff = 160
                            if ((current_diary_select - diary_line_start * 3) >= 0 && (current_diary_select - diary_line_start * 3) <= 5)
                                draw_sprite_ext(spr_diary_cover_slot, 0, (start_x + ix * xoff), (start_y + iy * yoff), 2, 2, 0, c_white, 1)
                        }
                        break
                    case "buy cover":
                        draw_set_valign(fa_middle)
                        draw_set_halign(fa_center)
                        draw_text_ext_transformed_color(820, 250, _text_buy_diary_cover, -1, 500, 0.5, 0.5, 0, color[current_scene], color[current_scene], color[current_scene], color[current_scene], 1)
                        if button64(920, 450, 0.8, color[current_scene], spr_icon_yes, 0.8)
                        {
                            score_total -= diary_cover_price[current_cover_to_buy]
                            diary_cover_price[current_cover_to_buy] = 0
                            new_all_diary[current_diary_select].cover = current_cover_to_buy
                            sub_state_diary = "idle"
                        }
                        if button64(720, 450, 0.8, color[current_scene], spr_icon_no, 0.8)
                            sub_state_diary = "idle"
                        break
                    case "change cover":
                        start_x = 720
                        start_y = 230
                        draw_set_valign(fa_middle)
                        draw_set_halign(fa_right)
                        draw_text_transformed_color(950, (start_y - 100), _text_select_cover, 0.3, 0.3, 0, color[current_scene], color[current_scene], color[current_scene], color[current_scene], 1)
                        if button64(680, (start_y - 90), 0.5, color[current_scene], spr_icon_changetheme, 0.8)
                            sub_state_diary = "idle"
                        max_line = ((array_length(diary_cover) - 1) div 3) - 3 + 1
                        if (mx_gui > (display_get_gui_width() / 2))
                        {
                            if mouse_wheel_down()
                                diary_cover_line_start = min((diary_cover_line_start + 1), max_line)
                            if mouse_wheel_up()
                                diary_cover_line_start = max((diary_cover_line_start - 1), 0)
                        }
                        _pos = diary_cover_line_start / max_line
                        draw_slider(974, 220, 553, _pos, color[current_scene])
                        for (i = 0; i < min(9, array_length(diary_cover)); i++)
                        {
                            if ((i + diary_cover_line_start * 3) < array_length(diary_cover))
                            {
                                ix = i % 3
                                iy = i div 3
                                xoff = 100
                                yoff = 140
                                draw_sprite_ext(diary_cover[(i + diary_cover_line_start * 3)], 0, (start_x + ix * xoff), (start_y + iy * yoff), 2, 2, 0, c_white, 1)
                                if (diary_cover_price[(i + diary_cover_line_start * 3)] != 0)
                                {
                                    draw_set_alpha(0.2)
                                    draw_set_color(c_black)
                                    draw_rectangle((684 + ix * xoff), (238 + iy * yoff - 60), (757 + ix * xoff), (340 + iy * yoff - 60), false)
                                    draw_set_alpha(0.8)
                                    draw_rectangle((start_x + ix * xoff - 30), (start_y + iy * yoff - 10), (start_x + ix * xoff + 30), (start_y + iy * yoff + 10), false)
                                    draw_set_alpha(1)
                                    draw_set_color(c_white)
                                    draw_set_valign(fa_middle)
                                    draw_set_halign(fa_left)
                                    draw_sprite_ext(spr_icon_diamond, 0, (start_x + ix * xoff - 18), (start_y + iy * yoff), 0.4, 0.4, 0, c_aqua, 1)
                                    draw_text_transformed_color((start_x + ix * xoff + 2), (start_y + iy * yoff), diary_cover_price[(i + diary_cover_line_start * 3)], 0.25, 0.25, 0, c_aqua, c_aqua, c_aqua, c_aqua, 1)
                                }
                                if button_collision((684 + ix * xoff), (238 + iy * yoff - 60), (757 + ix * xoff), (340 + iy * yoff - 60))
                                {
                                    draw_set_alpha(0.1)
                                    draw_set_color(c_black)
                                    draw_rectangle((684 + ix * xoff), (238 + iy * yoff - 60), (757 + ix * xoff), (340 + iy * yoff - 60), false)
                                    draw_set_alpha(1)
                                    draw_set_color(c_white)
                                    if mc_click
                                    {
                                        if (diary_cover_price[(i + diary_cover_line_start * 3)] == 0)
                                        {
                                            new_all_diary[current_diary_select].cover = i + diary_cover_line_start * 3
                                            sub_state_diary = "idle"
                                        }
                                        else if (score_total >= diary_cover_price[(i + diary_cover_line_start * 3)])
                                        {
                                            sub_state_diary = "buy cover"
                                            current_cover_to_buy = i + diary_cover_line_start * 3
                                        }
                                    }
                                }
                            }
                        }
                        break
                }

                break
            case "list":
                draw_set_valign(fa_middle)
                draw_set_halign(fa_center)
                draw_text_transformed_color(513, 128, new_all_diary[current_diary_enter].title, 0.3, 0.3, 0, color[current_scene], color[current_scene], color[current_scene], color[current_scene], 1)
                if button_collision(334, 112, 363, 146)
                {
                    draw_sprite_ext(spr_icon_changetheme, 0, 350, 130, 0.6, 0.6, 0, color[current_scene], 0.5)
                    if mc_click
                    {
                        state_diary = "idle"
                        current_diary_select = -1
                        current_diary_enter = -1
                        instance_destroy(obj_input_text)
                        return;
                    }
                }
                else
                    draw_sprite_ext(spr_icon_changetheme, 0, 350, 130, 0.5, 0.5, 0, color[current_scene], 0.5)
                draw_set_valign(fa_middle)
                draw_set_halign(fa_left)
                draw_set_color(color_diary[current_scene])
                if (mx_gui < (display_get_gui_width() / 2))
                {
                    if (mouse_wheel_down() && array_length(new_all_diary[current_diary_enter].content) > 8)
                        current_diary_start = min((current_diary_start + 1), (array_length(new_all_diary[current_diary_enter].content) - 8))
                    if mouse_wheel_up()
                        current_diary_start = max((current_diary_start - 1), 0)
                }
                draw_set_alpha(0.5)
                draw_line_width(610, 175, 610, 515, 2)
                draw_set_alpha(1)
                mc_list_slider = current_diary_start / (array_length(new_all_diary[current_diary_enter].content) - 8) * 340 + 175
                draw_circle(610, mc_list_slider, 5, false)
                for (ii = 0; ii < min(8, array_length(new_all_diary[current_diary_enter].content)); ii++)
                {
                    draw_set_alpha(0.15)
                    draw_roundrect(320, (170 + 45 * ii), 600, (210 + 45 * ii), false)
                    if button_collision(320, (170 + 45 * ii), 600, (210 + 45 * ii))
                    {
                        draw_roundrect(320, (170 + 45 * ii), 600, (210 + 45 * ii), false)
                        if mc_click
                        {
                            current_diary = ii + current_diary_start
                            instance_destroy(obj_input_text)
                            diary_textbox = input_text_create_multiline_ext(680, 180, 280, 350, fontCJK_letter, color_diary[current_scene], 1, 280, -1, -1, -1, 0, 0, true, 0)
                            input_text_set_text(diary_textbox, new_all_diary[current_diary_enter].content[(ii + current_diary_start)][1])
                            title_textbox = input_text_create_singleline_ext(680, 142.5, 280, fontCJK_letter, color_diary[current_scene], 1, 280, 0, 1, true, 0)
                            input_text_set_text(title_textbox, new_all_diary[current_diary_enter].content[(ii + current_diary_start)][0])
                        }
                    }
                    if ((ii + current_diary_start) == current_diary)
                        draw_roundrect(320, (170 + 45 * ii), 600, (210 + 45 * ii), false)
                    draw_set_alpha(1)
                    draw_text_transformed(335, (190 + 45 * ii), new_all_diary[current_diary_enter].content[(ii + current_diary_start)][0], 0.3, 0.3, 0)
                    if button_collision(560, (180 + 45 * ii), 580, (200 + 45 * ii))
                    {
                        draw_sprite_ext(spr_minus, 0, 570, (190 + 45 * ii), 0.7, 0.7, 0, color_diary[current_scene], 1)
                        if mc_click
                        {
                            array_delete(new_all_diary[current_diary_enter].content, (ii + current_diary_start), 1)
                            current_diary--
                            instance_destroy(obj_input_text)
                            if (current_diary_start > 0)
                                current_diary_start--
                        }
                    }
                    else
                        draw_sprite_ext(spr_minus, 0, 570, (190 + 45 * ii), 0.5, 0.5, 0, color_diary[current_scene], 1)
                }
                draw_set_color(c_white)
                draw_set_color(color_diary[current_scene])
                draw_set_alpha(0.2)
                draw_roundrect(320, 530, 600, 570, false)
                draw_sprite_ext(spr_add, 0, 460, 550, 0.75, 0.75, 0, color_diary[current_scene], 1)
                draw_set_color(c_white)
                if button_collision(320, 530, 600, 570)
                {
                    draw_roundrect_color(320, 530, 600, 570, color_diary[current_scene], color_diary[current_scene], false)
                    if mc_click
                    {
                        array_push(new_all_diary[current_diary_enter].content, [_text_new_diary, _text_write_diary])
                        if (array_length(new_all_diary[current_diary_enter].content) > 8)
                            current_diary_start = array_length(new_all_diary[current_diary_enter].content) - 8
                    }
                }
                draw_set_alpha(1)
                if (current_diary >= 0)
                {
                    draw_set_alpha(0.1)
                    draw_roundrect_color(667, 125, 960, 160, color_diary[current_scene], color_diary[current_scene], false)
                    draw_roundrect_color(667, 170, 960, 546, color_diary[current_scene], color_diary[current_scene], false)
                    draw_set_alpha(1)
                    if (instance_exists(diary_textbox) && mc_click)
                        input_text_set_enabled(diary_textbox, point_in_rectangle(mx_gui, my_gui, 667, 170, 960, 546))
                    if (instance_exists(title_textbox) && mc_click)
                        input_text_set_enabled(title_textbox, point_in_rectangle(mx_gui, my_gui, 667, 125, 960, 160))
                    if button_collision(667, 170, 960, 546)
                    {
                        draw_set_alpha(0.1)
                        draw_roundrect_color(667, 170, 960, 546, color_diary[current_scene], color_diary[current_scene], false)
                        draw_set_alpha(1)
                    }
                    if button_collision(667, 125, 960, 160)
                    {
                        draw_set_alpha(0.1)
                        draw_roundrect_color(667, 125, 960, 160, color_diary[current_scene], color_diary[current_scene], false)
                        draw_set_alpha(1)
                    }
                    if instance_exists(diary_textbox)
                        new_all_diary[current_diary_enter].content[current_diary][1] = diary_textbox.text_draw
                    if instance_exists(title_textbox)
                        new_all_diary[current_diary_enter].content[current_diary][0] = title_textbox.text_draw
                    if instance_exists(diary_textbox)
                    {
                        draw_set_color(color_diary[current_scene])
                        draw_set_alpha(0.5)
                        draw_line_width(980, 180, 980, 530, 2)
                        draw_set_alpha(1)
                        mc_list_slider2 = diary_textbox.my_current_line / diary_textbox.lines * 350 + 180
                        draw_circle(980, mc_list_slider2, 5, false)
                        draw_set_color(c_white)
                    }
                }
                break
        }

    }
}
if (page_phone == 1)
{
    draw_set_alpha(0.5)
    draw_set_color(c_black)
    draw_rectangle(0, 0, (center_x * 2), (center_y * 2), false)
    draw_set_alpha(1)
    draw_set_color(c_white)
    var phone_x = 100
    var phone_y = 100
    var phone_centerx = phone_x + 170
    var _minute = string(current_minute)
    var _hour = string(current_hour)
    if (current_minute < 10)
        _minute = "0" + _minute
    if (current_hour < 10)
        _hour = "0" + _hour
    var _current_time = _hour + ":" + _minute
    draw_sprite_ext(spr_phone_ui, current_scene, phone_x, phone_y, 2, 2, 0, c_white, 1)
    draw_set_valign(fa_middle)
    draw_set_halign(fa_center)
    draw_text_transformed_color((phone_x + 40), (phone_y + 20), _current_time, 0.3, 0.3, 0, c_white, c_white, c_white, c_white, 1)
    draw_set_valign(fa_middle)
    draw_set_halign(fa_left)
    draw_text_transformed_color((phone_x + 260), (phone_y + 63), _text_silence_mode, 0.25, 0.25, 0, c_white, c_white, c_white, c_white, 1)
    if (silence_mode == 1)
        _ind_img = 1
    else
        _ind_img = 0
    if button_collision((phone_x + 400 - 20), (phone_y + 60 - 20), (phone_x + 400 + 20), (phone_y + 60 + 20))
    {
        draw_sprite_ext(spr_case, _ind_img, (phone_x + 400), (phone_y + 60), 1.2, 1.2, 0, menu_color_1[current_scene], 1)
        if mc_click
            silence_mode *= -1
    }
    else
        draw_sprite_ext(spr_case, _ind_img, (phone_x + 400), (phone_y + 60), 1, 1, 0, menu_color_1[current_scene], 1)
    if (phone_page_type != "chat")
    {
        draw_set_color(c_black)
        if button_collision(phone_x, 546, (phone_x + 165), 588)
        {
            draw_set_alpha(0.1)
            draw_rectangle(phone_x, 546, (phone_x + 170), 588, false)
            draw_set_alpha(1)
            if mc_click
                phone_page_type = "main"
        }
        if button_collision((phone_x + 175), 546, (phone_x + 170 + 165), 588)
        {
            draw_set_alpha(0.1)
            draw_rectangle((phone_x + 170), 546, (phone_x + 170 + 170), 588, false)
            draw_set_alpha(1)
            if mc_click
                phone_page_type = "contact"
        }
        draw_set_color(c_white)
        draw_sprite_ext(spr_phone_category, 0, phone_x, 546, 2, 2, 0, c_white, 1)
        draw_sprite_ext(spr_phone_category, 1, (phone_x + 170), 546, 2, 2, 0, c_white, 1)
        if (new_contact_notif[current_scene] == true)
            draw_circle_color(380, 556, 5, 0x4C4CFF, 0x4C4CFF, false)
        for (ii = 0; ii < array_length(current_sentence[current_scene]); ii++)
        {
            if (current_sentence[current_scene][ii] != -1 && (current_sentence[current_scene][ii] + 1) < array_length(dialogue[current_scene][ii]))
            {
                if (dialogue[current_scene][ii][(current_sentence[current_scene][ii] + 1)][0] != "")
                    draw_circle_color(214, 556, 5, 0x4C4CFF, 0x4C4CFF, false)
            }
        }
    }
    switch phone_page_type
    {
        case "main":
            draw_set_valign(fa_middle)
            draw_set_halign(fa_center)
            draw_text_transformed_color((phone_x + 170), (phone_y + 55), _text_chat_title, 0.5, 0.5, 0, c_white, c_white, c_white, c_white, 1)
            for (i = 0; i < array_length(phone_contact_list[current_scene]); i++)
            {
                if (current_sentence[current_scene][i] != -1)
                {
                    if button_collision(phone_x, (phone_y + 80 + 70 * i), (phone_x + 350), (phone_y + 150 + 70 * i))
                    {
                        draw_set_color(c_black)
                        draw_set_alpha(0.1)
                        draw_rectangle(phone_x, (phone_y + 80 + 70 * i), (phone_x + 350), (phone_y + 150 + 70 * i), false)
                        draw_set_color(c_white)
                        draw_set_alpha(1)
                        if mc_click
                        {
                            phone_page_type = "chat"
                            current_contact[current_scene] = i
                        }
                    }
                    draw_set_valign(fa_middle)
                    draw_set_halign(fa_left)
                    draw_text_transformed_color((phone_x + 80), (phone_y + 105 + 70 * i), phone_contact_list[current_scene][i], 0.35, 0.35, 0, c_black, c_black, c_black, c_black, 1)
                    draw_set_color(c_black)
                    draw_set_alpha(0.1)
                    draw_line_width((phone_x + 0), (phone_y + 150 + 70 * i), (phone_x + 350), (phone_y + 150 + 70 * i), 2)
                    draw_set_color(c_white)
                    draw_set_alpha(1)
                    if (current_sentence[current_scene][i] != -1 && (current_sentence[current_scene][i] + 1) < array_length(dialogue[current_scene][i]))
                    {
                        if (dialogue[current_scene][i][(current_sentence[current_scene][i] + 1)][0] != "")
                            draw_circle_color((phone_x + 20), (phone_y + 105 + 70 * i), 5, 0x4C4CFF, 0x4C4CFF, false)
                    }
                }
            }
            break
        case "chat":
            if button_collision(110, 144, 137, 176)
            {
                draw_sprite_ext(spr_icon_changetheme, 0, 127, 160, 0.5, 0.5, 0, c_white, 1)
                if mc_click
                    phone_page_type = "main"
            }
            else
                draw_sprite_ext(spr_icon_changetheme, 0, 127, 160, 0.4, 0.4, 0, c_white, 1)
            draw_text_transformed_color((phone_x + 170), (phone_y + 60), phone_contact_list[current_scene][current_contact[current_scene]], 0.4, 0.4, 0, c_white, c_white, c_white, c_white, 1)
            var text_scale = 0.2
            color = c_black
            draw_set_valign(fa_middle)
            if (current_sentence[current_scene][current_contact[current_scene]] >= array_length(dialogue[current_scene][current_contact[current_scene]]))
            {
                current_sentence[current_scene][current_contact[current_scene]] = array_length(dialogue[current_scene][current_contact[current_scene]]) - 1
                sentence_show_start[current_scene][current_contact[current_scene]] = max(0, (current_sentence[current_scene][current_contact[current_scene]] - 5))
                show_debug_message("got you")
            }
            if (button_collision(0, 0, 500, 720) && current_sentence[current_scene][current_contact[current_scene]] >= 6)
            {
                if mouse_wheel_down()
                    sentence_show_start[current_scene][current_contact[current_scene]] = min((sentence_show_start[current_scene][current_contact[current_scene]] + 1), (current_sentence[current_scene][current_contact[current_scene]] - 5))
                if mouse_wheel_up()
                    sentence_show_start[current_scene][current_contact[current_scene]] = max((sentence_show_start[current_scene][current_contact[current_scene]] - 1), 0)
            }
            if (current_sentence[current_scene][current_contact[current_scene]] >= 5)
            {
                draw_set_alpha(0.5)
                draw_set_color(c_black)
                draw_line_width(540, 190, 540, 500, 2)
                draw_set_alpha(1)
                var dialogue_slider = sentence_show_start[current_scene][current_contact[current_scene]] / (current_sentence[current_scene][current_contact[current_scene]] - 5) * 310 + 190
                draw_circle(540, dialogue_slider, 5, false)
                draw_set_color(c_white)
            }
            for (i = 0; i < min(6, (current_sentence[current_scene][current_contact[current_scene]] + 1)); i++)
            {
                var text_y = phone_y + 120 + i * 50
                var text_to_draw = dialogue[current_scene][current_contact[current_scene]][(i + sentence_show_start[current_scene][current_contact[current_scene]])][0]
                var textbox_length = string_width(text_to_draw) * text_scale
                if (dialogue[current_scene][current_contact[current_scene]][(i + sentence_show_start[current_scene][current_contact[current_scene]])][0] != "")
                {
                    if (dialogue[current_scene][current_contact[current_scene]][(i + sentence_show_start[current_scene][current_contact[current_scene]])][1] == "Me")
                    {
                        draw_set_halign(fa_right)
                        var text_x = phone_x + 410
                        draw_sprite_ext(spr_dialogue_pop, 0, (text_x + 20), (text_y - 20), -2, 2, 0, 0x81E572, 1)
                        draw_sprite_stretched_ext(spr_dialogue_pop, 1, (text_x - textbox_length), (text_y - 20), textbox_length, 42, 0x81E572, 1)
                        draw_sprite_ext(spr_dialogue_pop, 2, (text_x - textbox_length), (text_y - 20), -2, 2, 0, 0x81E572, 1)
                    }
                    else
                    {
                        draw_set_halign(fa_left)
                        text_x = phone_x - 50
                        draw_sprite_ext(spr_dialogue_pop, 0, (text_x - 20), (text_y - 20), 2, 2, 0, 0xE0E0E0, 1)
                        draw_sprite_stretched_ext(spr_dialogue_pop, 1, text_x, (text_y - 20), textbox_length, 42, 0xE0E0E0, 1)
                        draw_sprite_ext(spr_dialogue_pop, 2, (text_x + textbox_length), (text_y - 20), 2, 2, 0, 0xE0E0E0, 1)
                    }
                    draw_text_transformed_color(text_x, text_y, text_to_draw, text_scale, text_scale, 0, color, color, color, color, 1)
                }
            }
            if ((current_sentence[current_scene][current_contact[current_scene]] + 1) < array_length(dialogue[current_scene][current_contact[current_scene]]))
            {
                var next_text_to_draw = dialogue[current_scene][current_contact[current_scene]][(current_sentence[current_scene][current_contact[current_scene]] + 1)][0]
                if (next_text_to_draw != "")
                {
                    if (dialogue[current_scene][current_contact[current_scene]][(current_sentence[current_scene][current_contact[current_scene]] + 1)][1] == "Me")
                    {
                        draw_set_alpha(0.1)
                        draw_set_color(c_black)
                        draw_roundrect((phone_centerx - 240), 520, (phone_centerx + 270), 580, false)
                        if button_collision((phone_centerx - 240), 520, (phone_centerx + 270), 580)
                        {
                            draw_roundrect((phone_centerx - 240), 520, (phone_centerx + 270), 580, false)
                            if mc_click
                            {
                                mode_switch_finish = false
                                current_sentence[current_scene][current_contact[current_scene]] += 1
                                if (current_sentence[current_scene][current_contact[current_scene]] >= 6)
                                    sentence_show_start[current_scene][current_contact[current_scene]] += 1
                            }
                        }
                        draw_set_alpha(1)
                        draw_set_color(c_white)
                        draw_set_halign(fa_center)
                        draw_set_valign(fa_middle)
                        draw_text_transformed_color(phone_centerx, 550, next_text_to_draw, text_scale, text_scale, 0, color, color, color, color, 1)
                    }
                    else
                    {
                        count_message++
                        if (count_message >= 120)
                        {
                            mode_switch_finish = false
                            current_sentence[current_scene][current_contact[current_scene]] += 1
                            count_message = 0
                            if (current_sentence[current_scene][current_contact[current_scene]] >= 6)
                                sentence_show_start[current_scene][current_contact[current_scene]] += 1
                        }
                        else
                            draw_sprite_ext(spr_message_waiting, 2, (phone_x + 10), (text_y - 20 + 70), 1.2, 1.2, 0, c_white, 1)
                    }
                    if (array_length(dialogue[current_scene][current_contact[current_scene]][(current_sentence[current_scene][current_contact[current_scene]] + 1)]) > 2)
                    {
                        if (dialogue[current_scene][current_contact[current_scene]][(current_sentence[current_scene][current_contact[current_scene]] + 1)][2] == "switch")
                        {
                            if (mode_switch_finish == false)
                            {
                                mode_switch = true
                                alarm[10] = 120
                                mode_switch_finish = true
                                if (upsidedown == true)
                                    upsidedown = false
                                else
                                    upsidedown = true
                                fadetoroom(false, 30, 16777215, false, false)
                            }
                        }
                    }
                }
            }
            if (sentence_show_start[current_scene][current_contact[current_scene]] != (current_sentence[current_scene][current_contact[current_scene]] - 5) && current_sentence[current_scene][current_contact[current_scene]] >= 6)
                draw_sprite_ext(spr_icon_ind_message, 2, 100, 470, 0.75, 0.75, 0, c_white, 0.75)
            break
        case "contact":
            if (new_contact_notif[current_scene] == false)
            {
                draw_set_valign(fa_middle)
                draw_set_halign(fa_center)
                draw_text_transformed_color((phone_x + 170), (phone_y + 160), _text_no_new_friend, 0.4, 0.4, 0, c_black, c_black, c_black, c_black, 1)
            }
            else
            {
                draw_set_valign(fa_middle)
                draw_set_halign(fa_center)
                draw_text_transformed_color((phone_x + 170), (phone_y + 120), _text_new_friend, 0.4, 0.4, 0, c_black, c_black, c_black, c_black, 1)
                draw_text_transformed_color((phone_x + 170), (phone_y + 250), phone_contact_list[current_scene][(phone_contact_unlock[current_scene] + 1)], 0.5, 0.5, 0, c_black, c_black, c_black, c_black, 1)
                draw_text_transformed_color((phone_x + 170), (phone_y + 300), phone_contact_request_list[current_scene][(phone_contact_unlock[current_scene] + 1)], 0.3, 0.3, 0, c_black, c_black, c_black, c_black, 0.8)
                draw_set_color(c_black)
                draw_set_alpha(0.1)
                draw_roundrect((phone_centerx - 80), (phone_y + 350), (phone_centerx + 80), (phone_y + 390), false)
                if button_collision((phone_centerx - 80), (phone_y + 350), (phone_centerx + 80), (phone_y + 390))
                {
                    draw_roundrect((phone_centerx - 80), (phone_y + 350), (phone_centerx + 80), (phone_y + 390), false)
                    if mc_click
                    {
                        phone_contact_unlock[current_scene] += 1
                        new_contact_notif[current_scene] = false
                        current_sentence[current_scene][phone_contact_unlock[current_scene]] += 1
                    }
                }
                draw_set_alpha(1)
                draw_set_color(c_white)
                draw_text_transformed_color((phone_x + 170), (phone_y + 370), _text_accept, 0.3, 0.3, 0, c_black, c_black, c_black, c_black, 1)
            }
            break
    }

    if button_clickon(700, 122)
        page_phone = -1
}
if (page_drink == 1)
{
    _right = lerp(_right, display_get_gui_width(), 0.1)
    var _xscale = -1
}
else
{
    page_menu = -1
    _right = lerp(_right, (display_get_gui_width() + 450), 0.1)
    _xscale = 1
}
var _icon_x = _right - 480
_alpha_icon = 1
if (mode_focus == true)
    _alpha_icon = 0.3
if ((!page_customization) && (!page_scene) && (!page_phone) && (!page_diary) && (!page_stickynotes) && show_ui == 1 && (!page_mail))
{
    if button_collision((_icon_x - 20), 333, (_icon_x + 20), 383)
    {
        draw_sprite_ext(spr_icon_changetheme, 0, _icon_x, 365, (_xscale * 0.7), 0.7, 0, c_white, _alpha_icon)
        if (mc_click && mode_focus == false)
            page_drink *= -1
    }
    else
        draw_sprite_ext(spr_icon_changetheme, 0, _icon_x, 365, (_xscale * 0.6), 0.6, 0, c_white, _alpha_icon)
}
var machine_x = _right - 200
var machine_y = 470
var shelf_y = machine_y - 260
var drink_icon = drink_icon_list
var drink_1 = drink_1_list
var drink_2 = drink_2_list
var drink_3 = drink_3_list
var spr_final_drinks = spr_final_drinks_list
draw_sprite_ext(spr_wall, current_scene, _right, 0, 2, 2, 0, c_white, 1)
draw_sprite_ext(spr_coffee_machine, current_scene, machine_x, machine_y, 2, 2, 0, c_white, 1)
draw_sprite_ext(spr_final_drinks[current_scene], 0, (machine_x - 5), (machine_y + 90), 2, 2, 0, c_white, 1)
draw_sprite_ext(spr_shelf, current_scene, machine_x, shelf_y, 2, 2, 0, c_white, 1)
draw_sprite_ext(drink_2[current_scene], 0, machine_x, (shelf_y - 25), 2, 2, 0, c_white, 1)
draw_sprite_ext(drink_1[current_scene], 0, (machine_x - 100), (shelf_y - 15), 2, 2, 0, c_white, 1)
draw_sprite_ext(drink_3[current_scene], 0, (machine_x + 100), (shelf_y - 10), 2, 2, 0, c_white, 1)
draw_set_valign(fa_middle)
draw_set_halign(fa_left)
draw_sprite_ext(spr_icon_diamond, 0, (machine_x - 200), 28, 0.6, 0.6, 0, c_white, 1)
score_to_draw = convert_number_to_science(score_total)
draw_text_transformed_color((machine_x - 180), 30, score_to_draw, 0.4, 0.4, 0, c_white, c_white, c_white, c_white, 1)
if (page_drink == 1)
{
    if button_collision(876, 621, 937, 702)
    {
        draw_sprite_ext(spr_menu, current_scene, (machine_x - 170), 664, 1.6, 1.6, 0, c_white, 1)
        if (mc_click && (!making_drink))
            page_menu *= -1
    }
    else
        draw_sprite_ext(spr_menu, current_scene, (machine_x - 170), 664, 1.5, 1.5, 0, c_white, 1)
    if (page_menu == -1)
    {
        draw_set_color(c_black)
        draw_set_halign(fa_center)
        draw_set_valign(fa_middle)
        if button_collision(945, 135, 1000, 245)
        {
            draw_sprite_ext(drink_1[current_scene], 1, (machine_x - 100), (shelf_y - 15), 2, 2, 0, c_white, 1)
            if (mc_click && array_length(list_mix_drink) < 3)
                array_push(list_mix_drink, 0)
            var str_w = string_width(list_drink_material[0]) * 0.3
            draw_rectangle((mx_gui - str_w / 2 - 10), (my_gui - 90), (mx_gui + str_w / 2 + 10), (my_gui - 50), false)
            draw_text_transformed_color(mx_gui, (my_gui - 70), list_drink_material[0], 0.3, 0.3, 0, c_white, c_white, c_white, c_white, 1)
        }
        if button_collision(1030, 130, 1120, 245)
        {
            draw_sprite_ext(drink_2[current_scene], 1, machine_x, (shelf_y - 25), 2, 2, 0, c_white, 1)
            if (mc_click && array_length(list_mix_drink) < 3)
                array_push(list_mix_drink, 1)
            str_w = string_width(list_drink_material[1]) * 0.3
            draw_rectangle((mx_gui - str_w / 2 - 10), (my_gui - 90), (mx_gui + str_w / 2 + 10), (my_gui - 50), false)
            draw_text_transformed_color(mx_gui, (my_gui - 70), list_drink_material[1], 0.3, 0.3, 0, c_white, c_white, c_white, c_white, 1)
        }
        if button_collision(1150, 160, 1205, 245)
        {
            draw_sprite_ext(drink_3[current_scene], 1, (machine_x + 100), (shelf_y - 10), 2, 2, 0, c_white, 1)
            if (mc_click && array_length(list_mix_drink) < 3)
                array_push(list_mix_drink, 2)
            str_w = string_width(list_drink_material[2]) * 0.3
            draw_rectangle((mx_gui - str_w / 2 - 10), (my_gui - 90), (mx_gui + str_w / 2 + 10), (my_gui - 50), false)
            draw_text_transformed_color(mx_gui, (my_gui - 70), list_drink_material[2], 0.3, 0.3, 0, c_white, c_white, c_white, c_white, 1)
        }
        draw_set_color(c_white)
        for (i = 0; i < array_length(list_mix_drink); i++)
        {
            draw_set_valign(fa_middle)
            draw_set_halign(fa_center)
            draw_sprite_ext(spr_coffee_machine_pad, current_scene, (949 + 82 * i + _right - display_get_gui_width()), 331, 2, 2, 0, c_white, 1)
            draw_sprite_ext(drink_icon[current_scene], list_mix_drink[i], (949 + 82 * i + _right - display_get_gui_width()), 331, 2, 2, 0, c_white, 1)
            draw_set_alpha(1)
        }
        if (array_length(list_mix_drink) > 0)
        {
            draw_set_alpha(0.8)
            draw_set_color(c_black)
            draw_roundrect(970, 630, 1170, 700, false)
            draw_set_alpha(1)
            draw_set_color(0x000001)
            if button_collision(970, 630, 1170, 700)
            {
                draw_set_alpha(0.3)
                draw_set_color(c_white)
                draw_roundrect(970, 630, 1170, 700, false)
                draw_set_alpha(1)
                draw_set_color(0x000001)
                if (mc_click && score_total >= 3 && making_drink == false)
                {
                    if (array_length(list_mix_drink) >= 3 && check_mixture() == true)
                    {
                        making_drink = true
                        score_total -= 3
                    }
                }
            }
            draw_set_valign(fa_middle)
            draw_set_halign(fa_center)
            draw_text_transformed_color(1090, 664, "Mix", 0.7, 0.7, 0, c_white, c_white, c_white, c_white, 1)
            draw_sprite_ext(spr_icon_diamond, 0, 1000, 664, 0.5, 0.5, 0, c_aqua, 1)
            draw_text_transformed_color(1030, 664, "3", 0.5, 0.5, 0, c_aqua, c_aqua, c_aqua, c_aqua, 1)
            draw_set_alpha(0.8)
            draw_set_color(0x5F5BE5)
            draw_roundrect(1200, 630, 1270, 700, false)
            draw_set_alpha(1)
            draw_set_color(0x000001)
            if button_collision(1200, 630, 1270, 700)
            {
                draw_set_alpha(0.2)
                draw_roundrect_color(1200, 630, 1270, 700, c_white, c_white, false)
                draw_set_alpha(1)
                if mc_click
                    list_mix_drink = []
            }
            draw_sprite_ext(spr_trash_icon, 0, 1235, 668, 3, 3, 0, c_white, 1)
        }
        if (making_drink == true)
        {
            var _drink_color = c_white
            if (current_scene == 0)
                _drink_color = 0x444C66
            else if (current_scene == 1)
                _drink_color = c_lime
            else if (current_scene == 2)
                _drink_color = c_orange
            else if (current_scene == 3)
                _drink_color = c_orange
            count_drink++
            draw_set_alpha(0.5)
            draw_rectangle_color(857, 0, 1280, 720, c_black, c_black, c_black, c_black, false)
            draw_set_alpha(1)
            if (count_drink > 30)
            {
                machine_big_y = lerp(machine_big_y, 0, 0.1)
                draw_sprite_ext(spr_coffee_machine_scene, current_scene, _right, machine_big_y, 2, 2, 0, c_white, 1)
                draw_sprite_ext(spr_final_drinks[current_scene], 0, 1070, (630 + machine_big_y), 5, 5, 0, c_white, 1)
                if (count_drink > 150 && count_drink <= 300)
                {
                    if (!audio_is_playing(sd_pourwater))
                        audio_play_sound(sd_pourwater, 99, false)
                    draw_sprite_ext(spr_coffee_machine_scene_pour, (count_drink / 12), 1070, 253, 2, 2, 0, _drink_color, 1)
                }
                if (count_drink > 300)
                {
                    if audio_is_playing(sd_pourwater)
                        audio_stop_sound(sd_pourwater)
                    draw_set_alpha(0.5)
                    draw_rectangle_color(857, 0, 1280, 720, c_black, c_black, c_black, c_black, false)
                    draw_set_alpha(1)
                    draw_sprite_ext(spr_final_drinks[current_scene], (drink_to_make_ind + 1), 1070, (630 + machine_big_y), 5, 5, 0, c_white, 1)
                    drink_unlock[current_scene][drink_to_make_ind] = 1
                    alpha_text_coffee += 0.01
                    draw_set_font(fontCJK)
                    draw_set_valign(fa_middle)
                    draw_set_halign(fa_center)
                    draw_text_ext_transformed_color(1070, 50, drink_to_make, 70, 300, 0.7, 0.7, 0, 16777215, 16777215, 16777215, 16777215, alpha_text_coffee)
                    draw_sprite_ext(spr_icon_timer, 0, 920, 170, 0.5, 0.5, 0, c_white, 1)
                    draw_text_ext_transformed_color(980, 170, (string(drink_effect[drink_to_make_ind][0]) + " min"), 70, 300, 0.3, 0.3, 0, 16777215, 16777215, 16777215, 16777215, alpha_text_coffee)
                    draw_sprite_ext(spr_icon_gain_gold, 0, 1050, 170, 0.5, 0.5, 0, c_white, 1)
                    draw_text_ext_transformed_color(1100, 170, ("+" + string(drink_effect[drink_to_make_ind][1]) + "%"), 70, 300, 0.3, 0.3, 0, 16777215, 16777215, 16777215, 16777215, alpha_text_coffee)
                    draw_sprite_ext(spr_icon_gain_exp, 0, 1160, 170, 0.5, 0.5, 0, c_white, 1)
                    draw_text_ext_transformed_color(1210, 170, ("+" + string(drink_effect[drink_to_make_ind][2]) + "%"), 70, 300, 0.3, 0.3, 0, 16777215, 16777215, 16777215, 16777215, alpha_text_coffee)
                    draw_text_ext_transformed_color(1070, 330, drink_to_make_description, 80, 1200, 0.3, 0.3, 0, 16777215, 16777215, 16777215, 16777215, alpha_text_coffee)
                    draw_roundrect_color(970, 655, 1170, 715, c_black, c_black, false)
                    draw_set_alpha(0.8)
                    draw_set_color(0x5F5BE5)
                    draw_roundrect(1200, 650, 1270, 715, false)
                    draw_set_alpha(1)
                    draw_set_color(0x000001)
                    if button_collision(1200, 650, 1270, 715)
                    {
                        draw_set_alpha(0.2)
                        draw_roundrect_color(1200, 650, 1270, 715, c_white, c_white, false)
                        draw_set_alpha(1)
                        if mc_click
                        {
                            list_mix_drink = []
                            count_drink = 0
                            making_drink = false
                            machine_big_y = -720
                            alpha_text_coffee = 0
                        }
                    }
                    draw_sprite_ext(spr_trash_icon, 0, 1235, 688, 3, 3, 0, c_white, 1)
                    if button_collision(970, 655, 1170, 715)
                    {
                        draw_set_alpha(0.3)
                        draw_roundrect_color(970, 655, 1170, 715, c_white, c_white, false)
                        draw_set_alpha(1)
                        if mc_click
                        {
                            obj_girl.state = "drinking"
                            obj_girl.image_index = 0
                            page_drink = -1
                            obj_cup.image_index = drink_to_make_ind + 1
                            obj_cup.alarm[0] = drink_effect[drink_to_make_ind][0] * 60 * 60
                            obj_cup.gain_gold = drink_effect[drink_to_make_ind][1]
                            obj_cup.gain_exp = drink_effect[drink_to_make_ind][2]
                            if (!steam_get_achievement("first_drink"))
                                steam_set_achievement("first_drink")
                        }
                    }
                    draw_text_transformed_color(1070, 685, "Drink", 0.7, 0.7, 0, c_white, c_white, c_white, c_white, 1)
                }
            }
        }
    }
    else if (page_menu == 1)
    {
        draw_sprite_ext(spr_big_menu, current_scene, _right, 0, 2, 2, 0, c_white, 1)
        draw_set_font(fontCJK)
        draw_set_valign(fa_middle)
        var color1 = menu_color_1
        var color2 = menu_color_2
        if (page_drink_detail == false)
        {
            for (i = 0; i < 4; i++)
            {
                if button_collision(900, (185 + i * 80), 1230, (250 + i * 80))
                {
                    draw_set_alpha(0.2)
                    draw_set_color(c_black)
                    draw_roundrect(900, (185 + i * 80), 1230, (250 + i * 80), false)
                    draw_set_alpha(1)
                    draw_set_color(c_white)
                    if (mc_click && drink_unlock[current_scene][(i + current_drink_start)] != 0)
                    {
                        page_drink_detail = true
                        current_drink_detail = i + current_drink_start
                    }
                }
                if (drink_unlock[current_scene][(i + current_drink_start)] != 0)
                {
                    draw_set_halign(fa_left)
                    draw_text_transformed_color(920, (200 + i * 80), drink_menu[(i + current_drink_start)], 0.3, 0.3, 0, color1[current_scene], color1[current_scene], color1[current_scene], color1[current_scene], 1)
                    for (var j = 0; j < 3; j++)
                    {
                        draw_set_halign(fa_center)
                        draw_text_transformed_color(930, (230 + i * 80), ".....", 0.3, 0.3, 0, color2[current_scene], color2[current_scene], color2[current_scene], color2[current_scene], 1)
                        draw_text_transformed_color(1210, (230 + i * 80), ".....", 0.3, 0.3, 0, color2[current_scene], color2[current_scene], color2[current_scene], color2[current_scene], 1)
                        draw_text_ext_transformed_color((990 + j * 80), (235 + i * 80), list_drink_material[mix_menu[(i + current_drink_start)][j]], 70, 400, 0.2, 0.2, 0, color2[current_scene], color2[current_scene], color2[current_scene], color2[current_scene], 1)
                    }
                }
                else
                {
                    draw_set_halign(fa_left)
                    draw_text_transformed_color(920, (200 + i * 80), "???", 0.3, 0.3, 0, color1[current_scene], color1[current_scene], color1[current_scene], color1[current_scene], 1)
                    for (j = 0; j < 3; j++)
                    {
                        draw_set_halign(fa_center)
                        draw_text_transformed_color(930, (230 + i * 80), ".....", 0.3, 0.3, 0, color2[current_scene], color2[current_scene], color2[current_scene], color2[current_scene], 1)
                        draw_text_transformed_color(1210, (230 + i * 80), ".....", 0.3, 0.3, 0, color2[current_scene], color2[current_scene], color2[current_scene], color2[current_scene], 1)
                        draw_text_transformed_color((990 + j * 80), (235 + i * 80), "???", 0.2, 0.2, 0, color2[current_scene], color2[current_scene], color2[current_scene], color2[current_scene], 1)
                    }
                }
            }
            if mouse_wheel_down()
                current_drink_start = min((current_drink_start + 1), (array_length(drink_menu) - 4))
            if mouse_wheel_up()
                current_drink_start = max((current_drink_start - 1), 0)
            draw_set_alpha(0.5)
            draw_set_color(color1[current_scene])
            draw_line_width(1245, 180, 1245, 500, 2)
            mc_list_slider = current_drink_start / (array_length(drink_menu) - 4) * 320 + 180
            draw_circle(1245, mc_list_slider, 5, false)
            draw_set_alpha(1)
            draw_set_color(c_white)
            if button_clickon(1220, 34)
                page_menu = -1
        }
        else
        {
            var color_backsign = menu_color_backsign
            if button_collision(910, 166, 950, 220)
            {
                draw_sprite_ext(spr_icon_changetheme, 0, 930, 190, 0.8, 0.8, 0, color_backsign[current_scene], 1)
                if mc_click
                    page_drink_detail = false
            }
            else
                draw_sprite_ext(spr_icon_changetheme, 0, 930, 190, 0.7, 0.7, 0, color_backsign[current_scene], 1)
            draw_sprite_ext(spr_final_drinks[current_scene], (current_drink_detail + 1), 1068, 340, 3, 3, 0, c_white, 1)
            draw_set_valign(fa_middle)
            draw_set_halign(fa_center)
            draw_text_transformed_color(1090, 190, drink_menu[current_drink_detail], 0.3, 0.3, 0, color2[current_scene], color2[current_scene], color2[current_scene], color2[current_scene], 1)
            draw_text_ext_transformed_color(1070, 400, drink_descrip[current_drink_detail], 80, 1300, 0.25, 0.25, 0, color1[current_scene], color1[current_scene], color1[current_scene], color1[current_scene], 1)
            draw_sprite_ext(spr_icon_timer, 0, 920, 510, 0.5, 0.5, 0, color2[current_scene], 1)
            draw_text_ext_transformed_color(980, 510, (string(drink_effect[current_drink_detail][0]) + " min"), 70, 300, 0.3, 0.3, 0, color2[current_scene], color2[current_scene], color2[current_scene], color2[current_scene], 1)
            draw_sprite_ext(spr_icon_gain_gold, 0, 1050, 510, 0.5, 0.5, 0, color2[current_scene], 1)
            draw_text_ext_transformed_color(1100, 510, ("+" + string(drink_effect[current_drink_detail][1]) + "%"), 70, 300, 0.3, 0.3, 0, color2[current_scene], color2[current_scene], color2[current_scene], color2[current_scene], 1)
            draw_sprite_ext(spr_icon_gain_exp, 0, 1160, 510, 0.5, 0.5, 0, color2[current_scene], 1)
            draw_text_ext_transformed_color(1210, 510, ("+" + string(drink_effect[current_drink_detail][2]) + "%"), 70, 300, 0.3, 0.3, 0, color2[current_scene], color2[current_scene], color2[current_scene], color2[current_scene], 1)
        }
    }
}
else if (page_drink == -1)
{
    list_mix_drink = []
    count_drink = 0
    making_drink = false
    machine_big_y = -720
    alpha_text_coffee = 0
}
if (page_customization == 1 && alarm[2] <= 0)
{
    page_pomodoro_setting = -1
    timer_page = -1
    draw_set_alpha(0.85)
    draw_set_color(c_black)
    draw_rectangle(0, 0, (display_get_gui_width() / 3), display_get_gui_height(), false)
    draw_set_alpha(1)
    draw_set_color(c_white)
    draw_set_valign(fa_middle)
    draw_set_halign(fa_left)
    draw_sprite_ext(spr_icon_diamond, 0, 30, 32, 0.6, 0.6, 0, c_white, 1)
    score_to_draw = convert_number_to_science(score_total)
    draw_text_transformed_color(50, 34, score_to_draw, 0.4, 0.4, 0, c_white, c_white, c_white, c_white, 1)
    draw_line_width_color(15, 60, 400, 60, 2, c_dkgray, c_dkgray)
    start_x = 75
    start_y = 100
    cell_size = 90
    for (i = 0; i < array_length(list_spr_deco); i++)
    {
        var _x = start_x + i * cell_size
        var _y = start_y
        if (i == i)
        {
            if button_collision((_x - 20), (_y - 20), (_x + 20), (_y + 20))
            {
                draw_sprite_ext(list_spr_deco[i], 0, _x, _y, 0.8, 0.8, 0, c_white, 1)
                if mc_click
                    current_page_deco = i
            }
            else if (current_page_deco == i)
                draw_sprite_ext(list_spr_deco[i], 0, _x, _y, 0.7, 0.7, 0, c_white, 1)
            else
                draw_sprite_ext(list_spr_deco[i], 0, _x, _y, 0.7, 0.7, 0, c_white, 0.3)
        }
    }
    if (current_page_deco == 1)
    {
        for (ii = 0; ii < array_length(pets); ii++)
        {
            cell_size = 60
            _x = 88 + ii * cell_size
            _y = 160
            if button_collision((_x - 20), (_y - 20), (_x + 20), (_y + 20))
            {
                draw_sprite_ext(pets[ii].spr_icon, 0, _x, _y, 0.6, 0.6, 0, c_white, 1)
                if mc_click
                {
                    current_category = ii
                    pet_buying = false
                }
            }
            else if (current_category == ii)
                draw_sprite_ext(pets[ii].spr_icon, 0, _x, _y, 0.5, 0.5, 0, c_white, 1)
            else
                draw_sprite_ext(pets[ii].spr_icon, 0, _x, _y, 0.5, 0.5, 0, c_white, 0.3)
        }
        if (pet_buying == true)
        {
            draw_set_alpha(0.85)
            draw_set_color(c_black)
            draw_roundrect(810, 144, 1020, 400, false)
            draw_set_alpha(1)
            draw_set_color(c_white)
            draw_sprite_ext(spr_icon_diamond, 0, 875, 224, 0.75, 0.75, 0, c_aqua, 1)
            draw_text_transformed_color(900, 224, pets[current_category].animals[current_pet_to_buy].price, 0.75, 0.75, 0, c_aqua, c_aqua, c_aqua, c_aqua, 1)
            draw_set_alpha(0.2)
            draw_roundrect_color(820, 300, 1010, 390, c_white, c_white, false)
            draw_set_alpha(1)
            draw_text_transformed_color(930, 345, _text_buy, 0.5, 0.5, 0, c_white, c_white, c_white, c_white, 1)
            if button_collision(820, 300, 1010, 390)
            {
                draw_set_alpha(0.2)
                draw_roundrect_color(820, 300, 1010, 390, c_white, c_white, false)
                draw_set_alpha(1)
                if mc_click
                {
                    if (pets[current_category].animals[current_pet_to_buy].price <= score_total)
                    {
                        score_total -= pets[current_category].animals[current_pet_to_buy].price
                        pets[current_category].animals[current_pet_to_buy].price = 0
                        obj_cat.spr_idle = pets[current_category].animals[current_pet_to_buy].sprite
                        pet_buying = false
                        current_pet_category_to_save = current_category
                        current_pet_to_save = current_pet_to_buy
                        if (!steam_get_achievement("first_pet"))
                            steam_set_achievement("first_pet")
                    }
                }
            }
        }
        if debug_mode
        {
            if keyboard_check(ord("M"))
                score_total++
        }
        for (i = 0; i < array_length(pets[current_category].animals); i++)
        {
            ix = i % 3
            iy = i div 3
            start_x = 25
            start_y = 200
            if button_collision((start_x + ix * 130), (start_y + iy * 170), (start_x + ix * 130 + 120), (start_y + iy * 170 + 165))
            {
                draw_set_alpha(0.2)
                draw_rectangle((start_x + ix * 130), (start_y + iy * 170), (start_x + ix * 130 + 120), (start_y + iy * 170 + 165), false)
                draw_set_alpha(1)
                if mc_click
                {
                    if (pets[current_category].animals[i].price == 0)
                    {
                        obj_cat.spr_idle = pets[current_category].animals[i].sprite
                        pet_buying = false
                        current_pet_category_to_save = current_category
                        current_pet_to_save = i
                    }
                    else
                    {
                        pet_buying = true
                        current_pet_to_buy = i
                    }
                }
            }
            draw_sprite_ext(spr_rectangle, 1, (start_x + ix * 130), (start_y + iy * 170), 1.5, 1.5, 0, c_white, 1)
            draw_sprite_ext(pets[current_category].animals[i].sprite, 0, (start_x + ix * 130 + 60), (start_y + iy * 170 + 50), 1.2, 1.2, 0, c_white, 1)
            draw_set_valign(fa_middle)
            draw_set_halign(fa_center)
            draw_text_ext_transformed_color((start_x + ix * 130 + 60), (start_y + iy * 170 + 113), pets[current_category].animals[i].name[current_language], -1, 500, 0.25, 0.25, 0, 16777215, 16777215, 16777215, 16777215, 1)
            if (pets[current_category].animals[i].price != 0)
            {
                draw_sprite_ext(spr_icon_diamond, 0, (start_x + ix * 130 + 40), (start_y + iy * 170 + 140), 0.4, 0.4, 0, c_aqua, 1)
                draw_text_transformed_color((start_x + ix * 130 + 70), (start_y + iy * 170 + 140), pets[current_category].animals[i].price, 0.25, 0.25, 0, c_aqua, c_aqua, c_aqua, c_aqua, 1)
            }
            else
                draw_sprite_ext(spr_confirm, 0, (start_x + ix * 130 + 60), (start_y + iy * 170 + 140), 0.4, 0.4, 0, c_white, 0.3)
        }
    }
    if (current_page_deco == 2)
    {
        switch fish_page_state
        {
            case "idle":
                if tutorial_fish
                {
                    draw_sprite_ext(spr_menu, 0, 862, 356, 10, 10, 0, c_white, 1)
                    draw_set_valign(fa_top)
                    draw_set_halign(fa_left)
                    draw_text_ext_transformed_color(710, 120, _text_fish_tutorial, 100, 1200, 0.3, 0.3, 0, 0, 0, 0, 0, 1)
                    draw_set_alpha(0.2)
                    draw_set_color(c_black)
                    draw_roundrect(745, 500, 955, 566, false)
                    draw_set_color(c_black)
                    draw_set_alpha(1)
                    draw_sprite_ext(spr_confirm, 0, 852, 535, 1, 1, 0, c_black, 1)
                    if button_collision(745, 500, 955, 566)
                    {
                        draw_set_alpha(0.2)
                        draw_roundrect(745, 500, 955, 566, false)
                        draw_set_alpha(1)
                        if mc_click
                            tutorial_fish = false
                    }
                }
                if (fish_detail == true)
                {
                    draw_set_alpha(0.5)
                    draw_set_color(c_black)
                    draw_roundrect(1070, 220, 1230, 490, false)
                    draw_set_color(c_white)
                    draw_set_alpha(1)
                    var _current_fish_name = ""
                    var _current_fish_price = 0
                    var _current_fish_exp = current_fish.experience
                    for (ii = 0; ii < array_length(obj_fish_list); ii++)
                    {
                        if (obj_fish_list[ii] == current_fish.object_index)
                        {
                            _current_fish_name = list_fish_names[ii][current_language]
                            _current_fish_price = list_fish_price[ii]
                        }
                    }
                    if (current_fish.scale != 1)
                        _current_fish_price = 2
                    else
                        _current_fish_price = floor(_current_fish_price * 1.2)
                    draw_sprite_ext(current_fish.sprite_index, 0, 1150, 310, 1.5, 1.5, 0, c_white, 1)
                    draw_set_valign(fa_middle)
                    draw_set_halign(fa_center)
                    draw_text_ext_transformed_color(1150, 250, _current_fish_name, -1, 500, 0.25, 0.25, 0, 16777215, 16777215, 16777215, 16777215, 1)
                    draw_sprite_ext(spr_exp_bar, 0, 1084, 357, 2, 2, 0, c_white, 1)
                    draw_sprite_stretched_ext(spr_exp_one, 0, 1084, 357, (_current_fish_exp / 108000 * 67 * 2), 18, c_white, 1)
                    draw_set_alpha(0.2)
                    draw_roundrect_color(1084, 426, 1217, 477, c_white, c_white, false)
                    if button_collision(1084, 426, 1217, 477)
                    {
                        draw_roundrect_color(1084, 426, 1217, 477, c_white, c_white, false)
                        if mc_click
                        {
                            instance_destroy(current_fish)
                            score_total += _current_fish_price
                            fish_detail = false
                        }
                    }
                    draw_set_alpha(1)
                    draw_sprite_ext(spr_icon_diamond, 0, 1122, 404, 0.5, 0.5, 0, c_yellow, 1)
                    draw_text_transformed_color(1168, 404, ("+ " + string(_current_fish_price)), 0.3, 0.3, 0, c_yellow, c_yellow, c_yellow, c_yellow, 1)
                    draw_text_transformed_color(1151, 453, _text_sell, 0.4, 0.4, 0, c_white, c_white, c_white, c_white, 1)
                    if button_clickon(1225, 223, spr_icon_close_small, 1, "switch")
                    {
                        fish_detail = false
                        current_fish = -1
                    }
                }
                if button_collision(700, 261, 1000, 480)
                {
                    if mouse_check_button_pressed(mb_right)
                        instance_create_layer(mouse_x, mouse_y, "EFFECT", obj_fish_food)
                }
                if button_request_new(550, 180, _text_sell_all_fish, spr_button3)
                    fish_page_state = "sell all"
                max_line = ((array_length(list_fish_price) - 1) div 3) - 3 + 1
                if (mx_gui < (display_get_gui_width() / 3))
                {
                    if mouse_wheel_down()
                        fish_line_start = min((fish_line_start + 1), max_line)
                    if mouse_wheel_up()
                        fish_line_start = max((fish_line_start - 1), 0)
                }
                draw_set_alpha(0.5)
                draw_line_width(410, 150, 410, 680, 2)
                draw_set_alpha(1)
                mc_list_slider2 = fish_line_start / max_line * 530 + 150
                draw_circle(410, mc_list_slider2, 5, false)
                for (i = 0; i < 9; i++)
                {
                    if ((i + fish_line_start * 3) < array_length(list_fish_spr))
                    {
                        ix = i % 3
                        iy = i div 3
                        start_x = 15
                        start_y = 150
                        if button_collision((start_x + ix * 130), (start_y + iy * 170), (start_x + ix * 130 + 120), (start_y + iy * 170 + 165))
                        {
                            draw_set_alpha(0.2)
                            draw_rectangle((start_x + ix * 130), (start_y + iy * 170), (start_x + ix * 130 + 120), (start_y + iy * 170 + 165), false)
                            draw_set_alpha(1)
                            if mc_click
                            {
                                if (instance_number(obj_fish) <= 20)
                                {
                                    if (score_total >= list_fish_price[(i + fish_line_start * 3)])
                                    {
                                        score_total -= list_fish_price[(i + fish_line_start * 3)]
                                        instance_create_layer(465, 155, "EFFECT", obj_fish_list[(i + fish_line_start * 3)])
                                    }
                                }
                            }
                        }
                        draw_sprite_ext(spr_rectangle, 1, (start_x + ix * 130), (start_y + iy * 170), 1.5, 1.5, 0, c_white, 1)
                        draw_sprite_ext(list_fish_spr[(i + fish_line_start * 3)], 0, (start_x + ix * 130 + 60), (start_y + iy * 170 + 50), 1.75, 1.75, 0, c_white, 1)
                        draw_set_valign(fa_middle)
                        draw_set_halign(fa_center)
                        draw_text_ext_transformed_color((start_x + ix * 130 + 60), (start_y + iy * 170 + 100), list_fish_names[(i + fish_line_start * 3)][current_language], -1, 500, 0.25, 0.25, 0, 16777215, 16777215, 16777215, 16777215, 1)
                        draw_sprite_ext(spr_icon_diamond, 0, (start_x + ix * 130 + 40), (start_y + iy * 170 + 130), 0.4, 0.4, 0, c_aqua, 1)
                        draw_text_transformed_color((start_x + ix * 130 + 70), (start_y + iy * 170 + 130), list_fish_price[(i + fish_line_start * 3)], 0.25, 0.25, 0, c_aqua, c_aqua, c_aqua, c_aqua, 1)
                    }
                }
                break
            case "sell all":
                draw_set_alpha(0.9)
                draw_set_color(c_black)
                draw_rectangle(0, 0, (center_x * 2), (center_y * 2), false)
                draw_set_alpha(1)
                draw_set_color(c_white)
                draw_set_valign(fa_middle)
                draw_set_halign(fa_center)
                draw_set_font(fontCJK_letter)
                draw_text_ext_color((display_get_gui_width() / 2), (display_get_gui_height() / 2 - 50), _text_confirm_sell_all_fish, -1, 800, c_white, c_white, c_white, c_white, 1)
                draw_set_font(fontCJK)
                if button_request_new((display_get_gui_width() / 2 - 150), (display_get_gui_height() / 2 + 60), _text_yes, spr_button2)
                {
                    fish_detail = false
                    for (i = 0; i < array_length(obj_fish_list); i++)
                    {
                        for (j = 0; j < instance_number(obj_fish); j++)
                        {
                            var _one_fish = instance_find(obj_fish, j)
                            var _ind_fish = array_get_index(obj_fish_list, _one_fish.object_index)
                            var _fish_price = list_fish_price[_ind_fish]
                            if (_one_fish.scale != 1)
                                _fish_price = 2
                            else
                                _fish_price = floor(_fish_price * 1.2)
                            score_total += _fish_price
                            instance_destroy(_one_fish)
                        }
                    }
                    fish_page_state = "idle"
                }
                if button_request_new((display_get_gui_width() / 2 + 150), (display_get_gui_height() / 2 + 60), _text_no, spr_button2)
                    fish_page_state = "idle"
                break
        }

    }
    if (current_page_deco == 0)
    {
        max_line = ((array_length(list_headwear_price) - 1) div 3) - 3 + 1
        if (mx_gui < (display_get_gui_width() / 3))
        {
            if mouse_wheel_down()
                headwear_line_start = min((headwear_line_start + 1), max_line)
            if mouse_wheel_up()
                headwear_line_start = max((headwear_line_start - 1), 0)
        }
        draw_set_alpha(0.5)
        draw_line_width(410, 150, 410, 680, 2)
        draw_set_alpha(1)
        mc_list_slider2 = headwear_line_start / max_line * 530 + 150
        draw_circle(410, mc_list_slider2, 5, false)
        if (headwear_buying == true)
        {
            draw_set_alpha(0.85)
            draw_set_color(c_black)
            draw_roundrect(810, 144, 1020, 400, false)
            draw_set_alpha(1)
            draw_set_color(c_white)
            draw_sprite_ext(spr_icon_diamond, 0, 875, 224, 0.75, 0.75, 0, c_aqua, 1)
            draw_text_transformed_color(900, 224, list_headwear_price[current_headwear_to_buy], 0.75, 0.75, 0, c_aqua, c_aqua, c_aqua, c_aqua, 1)
            draw_set_alpha(0.2)
            draw_roundrect_color(820, 300, 1010, 390, c_white, c_white, false)
            draw_set_alpha(1)
            draw_text_transformed_color(930, 345, _text_buy, 0.5, 0.5, 0, c_white, c_white, c_white, c_white, 1)
            if button_collision(820, 300, 1010, 390)
            {
                draw_set_alpha(0.2)
                draw_roundrect_color(820, 300, 1010, 390, c_white, c_white, false)
                draw_set_alpha(1)
                if mc_click
                {
                    if (list_headwear_price[current_headwear_to_buy] <= score_total)
                    {
                        if (!steam_get_achievement("decorators_debut"))
                            steam_set_achievement("decorators_debut")
                        score_total -= list_headwear_price[current_headwear_to_buy]
                        list_headwear_price[current_headwear_to_buy] = 0
                        obj_earrings.sprite_index = list_spr_hearwear_small[current_headwear_to_buy]
                        obj_earrings.real_sprite = list_spr_hearwear_small[current_headwear_to_buy]
                        headwear_buying = false
                        current_head_wearing = current_headwear_to_buy
                    }
                }
            }
        }
        for (i = 0; i < 9; i++)
        {
            if ((i + headwear_line_start * 3) < array_length(list_headwear_price))
            {
                ix = i % 3
                iy = i div 3
                start_x = 15
                start_y = 150
                if button_collision((start_x + ix * 130), (start_y + iy * 170), (start_x + ix * 130 + 120), (start_y + iy * 170 + 165))
                {
                    draw_set_alpha(0.2)
                    draw_rectangle((start_x + ix * 130), (start_y + iy * 170), (start_x + ix * 130 + 120), (start_y + iy * 170 + 165), false)
                    draw_set_alpha(1)
                    if mc_click
                    {
                        if (list_headwear_price[(i + headwear_line_start * 3)] == 0)
                        {
                            obj_earrings.sprite_index = list_spr_hearwear_small[(i + headwear_line_start * 3)]
                            obj_earrings.real_sprite = list_spr_hearwear_small[(i + headwear_line_start * 3)]
                            headwear_buying = false
                            current_head_wearing = i + headwear_line_start * 3
                        }
                        else
                        {
                            headwear_buying = true
                            current_headwear_to_buy = i + headwear_line_start * 3
                            obj_earrings.sprite_index = list_spr_hearwear_small[(i + headwear_line_start * 3)]
                        }
                    }
                }
                draw_sprite_ext(spr_rectangle, 1, (start_x + ix * 130), (start_y + iy * 170), 1.5, 1.5, 0, c_white, 1)
                var y_dist = (sprite_get_yoffset(list_spr_hearwear[(i + headwear_line_start * 3)])) - (sprite_get_height(list_spr_hearwear[(i + headwear_line_start * 3)])) / 2
                var x_dist = (sprite_get_xoffset(list_spr_hearwear[(i + headwear_line_start * 3)])) - (sprite_get_width(list_spr_hearwear[(i + headwear_line_start * 3)])) / 2
                var _scale = 1
                draw_sprite_ext(list_spr_hearwear[(i + headwear_line_start * 3)], 0, (start_x + ix * 130 + 60 + x_dist * _scale), (start_y + iy * 170 + 77.5 + y_dist * _scale), _scale, _scale, 0, c_white, 1)
                if ((i + headwear_line_start * 3) != 0)
                {
                    if (list_headwear_price[(i + headwear_line_start * 3)] != 0)
                    {
                        draw_sprite_ext(spr_icon_diamond, 0, (start_x + ix * 130 + 40), (start_y + iy * 170 + 140), 0.4, 0.4, 0, c_aqua, 1)
                        draw_text_transformed_color((start_x + ix * 130 + 70), (start_y + iy * 170 + 140), list_headwear_price[(i + headwear_line_start * 3)], 0.25, 0.25, 0, c_aqua, c_aqua, c_aqua, c_aqua, 1)
                    }
                    else
                        draw_sprite_ext(spr_confirm, 0, (start_x + ix * 130 + 60), (start_y + iy * 170 + 140), 0.4, 0.4, 0, c_white, 0.3)
                }
                else
                    draw_sprite_ext(spr_nothing_sign, 0, (start_x + ix * 130 + 60 + x_dist * _scale), (start_y + iy * 170 + 80 + y_dist * _scale), _scale, _scale, 0, c_white, 1)
            }
        }
    }
    if (current_page_deco == 3)
    {
        if (cloth_buying == true)
        {
            draw_set_alpha(0.85)
            draw_set_color(c_black)
            draw_roundrect(810, 144, 1020, 400, false)
            draw_set_alpha(1)
            draw_set_color(c_white)
            draw_sprite_ext(spr_icon_diamond, 0, 875, 224, 0.75, 0.75, 0, c_aqua, 1)
            draw_text_transformed_color(900, 224, cloth_price[current_scene][current_cloth_to_buy[current_scene]], 0.75, 0.75, 0, c_aqua, c_aqua, c_aqua, c_aqua, 1)
            draw_set_alpha(0.2)
            draw_roundrect_color(820, 300, 1010, 390, c_white, c_white, false)
            draw_set_alpha(1)
            draw_text_transformed_color(930, 345, _text_buy, 0.5, 0.5, 0, c_white, c_white, c_white, c_white, 1)
            if button_collision(820, 300, 1010, 390)
            {
                draw_set_alpha(0.2)
                draw_roundrect_color(820, 300, 1010, 390, c_white, c_white, false)
                draw_set_alpha(1)
                if mc_click
                {
                    if (cloth_price[current_scene][current_cloth_to_buy[current_scene]] <= score_total)
                    {
                        score_total -= cloth_price[current_scene][current_cloth_to_buy[current_scene]]
                        cloth_price[current_scene][current_cloth_to_buy[current_scene]] = 0
                        cloth_buying = false
                        current_girl_cloth[current_scene] = current_cloth_to_buy[current_scene]
                    }
                }
            }
        }
        for (i = 0; i < 9; i++)
        {
            if ((i + cloth_line_start * 3) < array_length(cloth_price[current_scene]))
            {
                ix = i % 3
                iy = i div 3
                start_x = 15
                start_y = 150
                if button_collision((start_x + ix * 130), (start_y + iy * 170), (start_x + ix * 130 + 120), (start_y + iy * 170 + 165))
                {
                    draw_set_alpha(0.2)
                    draw_rectangle((start_x + ix * 130), (start_y + iy * 170), (start_x + ix * 130 + 120), (start_y + iy * 170 + 165), false)
                    draw_set_alpha(1)
                    if mc_click
                    {
                        if (cloth_price[current_scene][i] == 0)
                        {
                            current_girl_cloth[current_scene] = i
                            cloth_buying = false
                        }
                        else
                        {
                            cloth_buying = true
                            current_cloth_to_buy[current_scene] = i
                        }
                    }
                }
                draw_sprite_ext(spr_cloth_list[current_scene], i, (start_x + ix * 130), (start_y + iy * 170), 1.5, 1.5, 0, c_white, 1)
                if (cloth_price[current_scene][i] == 0)
                    draw_sprite_ext(spr_confirm, 0, (start_x + ix * 130 + 60), (start_y + iy * 170 + 140), 0.4, 0.4, 0, c_white, 0.3)
                else
                {
                    draw_sprite_ext(spr_icon_diamond, 0, (start_x + ix * 130 + 35), (start_y + iy * 170 + 140), 0.4, 0.4, 0, c_aqua, 1)
                    draw_text_transformed_color((start_x + ix * 130 + 55), (start_y + iy * 170 + 140), cloth_price[current_scene][i], 0.25, 0.25, 0, c_aqua, c_aqua, c_aqua, c_aqua, 1)
                }
            }
        }
    }
    if (fish_page_state != "sell all")
    {
        if (button_clickon((display_get_gui_width() / 3 + 35), 35) == true)
        {
            page_customization = -1
            headwear_buying = false
            fish_detail = false
            current_fish = -4
            cloth_buying = false
        }
    }
}
if (page_scene == 1)
{
    draw_set_alpha(0.9)
    draw_set_color(c_black)
    draw_rectangle(0, 0, (center_x * 2), (center_y * 2), false)
    draw_set_alpha(1)
    draw_set_color(c_white)
    switch page_scene_state
    {
        case "fav":
            draw_set_valign(fa_middle)
            draw_set_halign(fa_center)
            draw_text_transformed_color((display_get_gui_width() / 2), 100, _text_todo_fav, 0.75, 0.75, 0, c_white, c_white, c_white, c_white, 1)
            if button_collision(900, 80, 1100, 120)
            {
                draw_sprite_ext(spr_icon_save_scene, 0, 1000, 100, 1, 1, 0, c_silver, 1)
                if mc_click
                    page_scene_state = "typename"
            }
            else
                draw_sprite_ext(spr_icon_save_scene, 0, 1000, 100, 1, 1, 0, c_white, 1)
            if button_collision(1224, 335, 1260, 385)
            {
                draw_sprite_ext(spr_icon_changetheme, 0, (display_get_gui_width() - 40), (display_get_gui_height() / 2), -0.8, 0.8, 0, c_white, 1)
                if mc_click
                {
                    if (array_length(saved_scenes_list) > 4)
                        save_scene_list_start = min((save_scene_list_start + 1), (array_length(saved_scenes_list) - 4))
                }
            }
            else
                draw_sprite_ext(spr_icon_changetheme, 0, (display_get_gui_width() - 40), (display_get_gui_height() / 2), -0.7, 0.7, 0, c_white, 1)
            if button_collision(0, 335, 50, 385)
            {
                draw_sprite_ext(spr_icon_changetheme, 0, 50, (display_get_gui_height() / 2), 0.8, 0.8, 0, c_white, 1)
                if mc_click
                    save_scene_list_start = max((save_scene_list_start - 1), 0)
            }
            else
                draw_sprite_ext(spr_icon_changetheme, 0, 50, (display_get_gui_height() / 2), 0.7, 0.7, 0, c_white, 1)
            for (i = 0; i < min(array_length(saved_scenes_list), 4); i++)
            {
                if instance_exists(obj_girl)
                {
                    var girl_x = 230 + i * 280
                    var girl_y = display_get_gui_height() / 2 + 15
                    draw_sprite_ext(spr_scene_poster, saved_scenes_list[(i + save_scene_list_start)].current_scene, girl_x, (display_get_gui_height() / 2 - 10), 0.9, 0.9, 0, c_white, 1)
                    var _spr_base = asset_get_index("spr_girl_" + (list_scene[saved_scenes_list[(i + save_scene_list_start)].current_scene]) + "_base_" + (string((saved_scenes_list[(i + save_scene_list_start)].current_girl_cloth) + 1)))
                    var _spr_writing = asset_get_index("spr_girl_" + (list_scene[saved_scenes_list[(i + save_scene_list_start)].current_scene]) + "_writing_" + (string((saved_scenes_list[(i + save_scene_list_start)].current_girl_cloth) + 1)))
                    draw_sprite_ext(_spr_base, 0, girl_x, girl_y, 0.75, 0.75, 0, c_white, 1)
                    draw_sprite_ext(_spr_writing, 5, girl_x, girl_y, 0.75, 0.75, 0, c_white, 1)
                    draw_sprite_ext(spr_girl_eyes, 0, girl_x, girl_y, 0.75, 0.75, 0, c_white, 1)
                    var _spr_pet = pets[saved_scenes_list[(i + save_scene_list_start)].current_pet.category].animals[saved_scenes_list[(i + save_scene_list_start)].current_pet.pet].sprite
                    draw_sprite_ext(_spr_pet, 0, (girl_x + 40), (girl_y + 60), 1.1, 1.1, 0, c_white, 1)
                    var _spr_headwear = list_spr_hearwear_small[saved_scenes_list[(i + save_scene_list_start)].current_head_wearing]
                    draw_sprite_ext(_spr_headwear, 0, (girl_x + 19.5), (girl_y - 18.75), 0.75, 0.75, 0, c_white, 1)
                    draw_set_halign(fa_center)
                    draw_set_valign(fa_middle)
                    draw_text_ext_transformed(girl_x, (girl_y + 150), saved_scenes_list[(i + save_scene_list_start)].scene_name, 10, 800, 0.5, 0.5, 0)
                    if button_collision((girl_x - sprite_get_width(spr_scene_poster) / 2 * 0.7), (display_get_gui_height() / 2 - 10 - sprite_get_height(spr_scene_poster) / 2 * 0.9), (girl_x + sprite_get_width(spr_scene_poster) / 2 * 0.7), (display_get_gui_height() / 2 - 10 + sprite_get_height(spr_scene_poster) / 2 * 0.9))
                    {
                        draw_sprite_ext(spr_scene_poster_highlight, 0, girl_x, (display_get_gui_height() / 2 - 10), 0.9, 0.9, 0, c_white, 0.1)
                        if mc_click
                        {
                            obj_controller.current_scene_select = saved_scenes_list[(i + save_scene_list_start)].current_scene
                            fadetoroom(false, 60, 0, false, false, saved_scenes_list[(i + save_scene_list_start)].current_girl_cloth, saved_scenes_list[(i + save_scene_list_start)].current_pet.category, saved_scenes_list[(i + save_scene_list_start)].current_pet.pet, saved_scenes_list[(i + save_scene_list_start)].current_head_wearing)
                        }
                        if button_collision((girl_x + 70 - 25), (display_get_gui_height() / 2 - 130 - 25), (girl_x + 70 + 25), (display_get_gui_height() / 2 - 130 + 25))
                        {
                            draw_sprite_ext(spr_icon_trashcan, 0, (girl_x + 70), (display_get_gui_height() / 2 - 130), 0.8, 0.8, 0, c_white, 1)
                            if mc_click
                            {
                                array_delete(saved_scenes_list, (i + save_scene_list_start), 1)
                                if (save_scene_list_start > 0)
                                    save_scene_list_start -= 1
                            }
                        }
                        else
                            draw_sprite_ext(spr_icon_trashcan, 0, (girl_x + 70), (display_get_gui_height() / 2 - 130), 0.7, 0.7, 0, c_white, 1)
                    }
                }
            }
            if button_back(150, 40)
                page_scene_state = "idle"
            break
        case "typename":
            draw_set_alpha(0.85)
            draw_set_color(c_black)
            draw_roundrect(0, 0, display_get_gui_width(), display_get_gui_height(), false)
            draw_set_alpha(1)
            draw_set_color(c_white)
            draw_set_halign(fa_center)
            draw_set_valign(fa_middle)
            draw_text_ext_transformed((display_get_gui_width() / 2), (display_get_gui_height() / 2 - 150), _text_inputname, 10, 800, 0.5, 0.5, 0)
            if (!instance_exists(textbox_scene_name))
            {
                textbox_scene_name = input_text_create_singleline_ext((display_get_gui_width() / 2), (display_get_gui_height() / 2), 1000, fontCJK_note, 16777215, 1, 12, 1, 0, true, 0)
                input_text_set_enabled(textbox_scene_name, true)
            }
            if button_request_new((display_get_gui_width() / 2), (display_get_gui_height() / 2 + 200), _text_yes)
            {
                current_scene_name_to_save = textbox_scene_name.text_draw
                var _scene_to_save = 
                {
                    scene_name: current_scene_name_to_save,
                    current_scene: current_scene,
                    current_girl_cloth: current_girl_cloth[current_scene],
                    current_head_wearing: current_head_wearing,
                    current_pet: 
                    {
                        pet: argument[4],
                        category: argument[5]
                    }
                }

                show_debug_message(obj_controller.pets[obj_controller.current_pet_category_to_save].animals[obj_controller.current_pet_to_save].sprite)
                array_push(saved_scenes_list, _scene_to_save)
                show_debug_message(_scene_to_save)
                instance_destroy(textbox_scene_name)
                page_scene_state = "fav"
                if (array_length(saved_scenes_list) > 4)
                    save_scene_list_start = array_length(saved_scenes_list) - 4
            }
            if button_back(150, 40)
            {
                page_scene_state = "fav"
                instance_destroy(textbox_scene_name)
            }
            break
        case "idle":
            for (i = 0; i < 3; i++)
            {
                draw_sprite_ext(spr_scene_poster, (i + current_scene_start), (display_get_gui_width() / 2 - 400 + 400 * i), (display_get_gui_height() / 2 - 20), 1.5, 1.5, 0, c_silver, 1)
                draw_set_valign(fa_middle)
                draw_set_halign(fa_center)
                draw_text_transformed_color((display_get_gui_width() / 2 - 400 + 400 * i), (display_get_gui_height() / 2 + 255), scene_name[(i + current_scene_start)], 0.5, 0.5, 0, c_silver, c_silver, c_silver, c_silver, 1)
                if button_collision((77 + 400 * i), 86, (407 + 400 * i), 589)
                {
                    draw_sprite_ext(spr_scene_poster, (i + current_scene_start), (display_get_gui_width() / 2 - 400 + 400 * i), (display_get_gui_height() / 2 - 20), 1.5, 1.5, 0, c_white, 1)
                    if mc_click
                    {
                        current_scene_select = i + current_scene_start
                        page_scene_state = "detail"
                    }
                }
            }
            if button_collision(1224, 335, 1260, 385)
            {
                draw_sprite_ext(spr_icon_changetheme, 0, (display_get_gui_width() - 40), (display_get_gui_height() / 2), -0.8, 0.8, 0, c_white, 1)
                if mc_click
                    current_scene_start = min((current_scene_start + 1), (array_length(scene_descrip) - 3))
            }
            else
                draw_sprite_ext(spr_icon_changetheme, 0, (display_get_gui_width() - 40), (display_get_gui_height() / 2), -0.7, 0.7, 0, c_white, 1)
            if button_collision(0, 335, 50, 385)
            {
                draw_sprite_ext(spr_icon_changetheme, 0, 50, (display_get_gui_height() / 2), 0.8, 0.8, 0, c_white, 1)
                if mc_click
                    current_scene_start = max((current_scene_start - 1), 0)
            }
            else
                draw_sprite_ext(spr_icon_changetheme, 0, 50, (display_get_gui_height() / 2), 0.7, 0.7, 0, c_white, 1)
            var img_num = sprite_get_number(spr_background)
            var interval = 30
            var rad = 5
            for (var a = 0; a < (img_num - 2); a++)
            {
                draw_circle_color((display_get_gui_width() / 2 - (img_num - 2) * interval / 2 + a * interval), (display_get_gui_height() - 50), rad, c_dkgray, c_dkgray, false)
                if (a == current_scene_start)
                    draw_circle_color((display_get_gui_width() / 2 - (img_num - 2) * interval / 2 + a * interval), (display_get_gui_height() - 50), rad, c_white, c_white, false)
            }
            break
        case "detail":
            start_x = display_get_gui_width() / 2 + 50
            start_y = 150
            draw_sprite_ext(spr_scene_poster, current_scene_select, (display_get_gui_width() / 2 - 200), (display_get_gui_height() / 2 - 20), 1.5, 1.5, 0, c_white, 1)
            if button_back(150, 40)
                page_scene_state = "idle"
            draw_set_font(fontCJK)
            draw_set_valign(fa_middle)
            draw_set_halign(fa_left)
            draw_text_transformed_color(start_x, (start_y - 50), scene_name[current_scene_select], 0.6, 0.6, 0, c_white, c_white, c_white, c_white, 1)
            draw_text_transformed_color((start_x + 450), (start_y - 50), scene_year[current_scene_select], 0.6, 0.6, 0, c_silver, c_silver, c_silver, c_silver, 1)
            draw_text_ext_transformed_color(start_x, (start_y + 170), scene_descrip[current_scene_select], 90, 1700, 0.3, 0.3, 0, 12632256, 12632256, 12632256, 12632256, 0.8)
            if (debug_mode == false)
            {
                if ((current_scene_select == 1 && level >= 2) || current_scene_select == 0 || (current_scene_select == 2 && level >= 7) || (current_scene_select == 3 && level >= 13) || (current_scene_select == 4 && level >= 20) || (current_scene_select == 5 && level >= 30) || (current_scene_select == 6 && level >= 31))
                {
                    if button_collision(690, 530, 820, 574)
                    {
                        draw_text_transformed_color((start_x + 5), 554, _text_enter_scene, 0.7, 0.7, 0, 0x7FF8FF, 0x7FF8FF, 0x7FF8FF, 0x7FF8FF, 1)
                        if mc_click
                            fadetoroom(false, 60, 0, false, false)
                    }
                    else
                        draw_text_transformed_color((start_x + 5), 554, _text_enter_scene, 0.6, 0.6, 0, 0x7FF8FF, 0x7FF8FF, 0x7FF8FF, 0x7FF8FF, 1)
                }
                else
                {
                    if (current_scene_select == 1)
                        draw_text_transformed_color((start_x + 5), 554, (_text_locked + "  2"), 0.5, 0.5, 0, c_white, c_white, c_white, c_white, 0.5)
                    if (current_scene_select == 2)
                        draw_text_transformed_color((start_x + 5), 554, (_text_locked + "  7"), 0.5, 0.5, 0, c_white, c_white, c_white, c_white, 0.5)
                    if (current_scene_select == 3)
                        draw_text_transformed_color((start_x + 5), 554, (_text_locked + "  13"), 0.5, 0.5, 0, c_white, c_white, c_white, c_white, 0.5)
                    if (current_scene_select == 4)
                        draw_text_transformed_color((start_x + 5), 554, (_text_locked + "  20"), 0.5, 0.5, 0, c_white, c_white, c_white, c_white, 0.5)
                    if (current_scene_select == 5)
                        draw_text_transformed_color((start_x + 5), 554, (_text_locked + "  30"), 0.5, 0.5, 0, c_white, c_white, c_white, c_white, 0.5)
                    if (current_scene_select == 6)
                        draw_text_transformed_color((start_x + 5), 554, (_text_locked + "  31"), 0.5, 0.5, 0, c_white, c_white, c_white, c_white, 0.5)
                }
            }
            else if (current_scene_select == 0 || current_scene_select == 1 || current_scene_select == 2 || current_scene_select == 3 || current_scene_select == 4 || current_scene_select == 5 || current_scene_select == 6)
            {
                if button_collision(690, 530, 820, 574)
                {
                    draw_text_transformed_color((start_x + 5), 554, _text_enter_scene, 0.7, 0.7, 0, 0x7FF8FF, 0x7FF8FF, 0x7FF8FF, 0x7FF8FF, 1)
                    if mc_click
                        fadetoroom(false, 60, 0, false, false)
                }
                else
                    draw_text_transformed_color((start_x + 5), 554, _text_enter_scene, 0.6, 0.6, 0, 0x7FF8FF, 0x7FF8FF, 0x7FF8FF, 0x7FF8FF, 1)
            }
            else
            {
                if (current_scene_select == 1)
                    draw_text_transformed_color((start_x + 5), 554, (_text_locked + "  2"), 0.5, 0.5, 0, c_white, c_white, c_white, c_white, 0.5)
                if (current_scene_select == 2)
                    draw_text_transformed_color((start_x + 5), 554, (_text_locked + "  7"), 0.5, 0.5, 0, c_white, c_white, c_white, c_white, 0.5)
                if (current_scene_select == 3)
                    draw_text_transformed_color((start_x + 5), 554, (_text_locked + "  13"), 0.5, 0.5, 0, c_white, c_white, c_white, c_white, 0.5)
                if (current_scene_select == 4)
                    draw_text_transformed_color((start_x + 5), 554, (_text_locked + "  20"), 0.5, 0.5, 0, c_white, c_white, c_white, c_white, 0.5)
                if (current_scene_select == 5)
                    draw_text_transformed_color((start_x + 5), 554, (_text_locked + "  30"), 0.5, 0.5, 0, c_white, c_white, c_white, c_white, 0.5)
                if (current_scene_select == 6)
                    draw_text_transformed_color((start_x + 5), 554, (_text_locked + "  31"), 0.5, 0.5, 0, c_white, c_white, c_white, c_white, 0.5)
            }
            break
    }

    if button_clickon(40, 40)
    {
        page_scene = -1
        page_scene_detail = false
        instance_destroy(textbox_scene_name)
    }
}
if (page_livechat == true)
{
    if (livechat_name == "")
    {
        instance_destroy(livechat_inputbox)
        draw_set_alpha(0.85)
        draw_set_color(c_black)
        draw_roundrect(0, 0, display_get_gui_width(), display_get_gui_height(), false)
        draw_set_alpha(1)
        draw_set_color(c_white)
        draw_set_halign(fa_center)
        draw_set_valign(fa_middle)
        draw_text_ext_transformed((display_get_gui_width() / 2), (display_get_gui_height() / 2 - 150), _text_inputname, 10, 800, 0.5, 0.5, 0)
        if (!instance_exists(inputname_textbox))
        {
            inputname_textbox = input_text_create_singleline_ext((display_get_gui_width() / 2), (display_get_gui_height() / 2), 1000, fontCJK_note, 16777215, 1, 12, 1, 0, true, 0)
            input_text_set_enabled(inputname_textbox, true)
        }
        if button_request_new((display_get_gui_width() / 2), (display_get_gui_height() / 2 + 200), _text_yes)
        {
            livechat_name = inputname_textbox.text_draw
            instance_destroy(inputname_textbox)
        }
        if button_clickon(40, 40)
        {
            page_livechat = false
            instance_destroy(inputname_textbox)
        }
    }
    else
    {
        var lc_x1 = 25
        var lc_y1 = 360
        var lc_x2 = 510
        var lc_y2 = 650
        draw_set_alpha(0.7)
        draw_set_color(c_black)
        draw_roundrect(lc_x1, lc_y1, lc_x2, lc_y2, false)
        draw_set_alpha(1)
        draw_set_color(c_white)
        draw_line_width_color(lc_x1, (lc_y2 - 50), lc_x2, (lc_y2 - 50), 1, c_gray, c_gray)
        if button_clickon(lc_x2, 370, spr_icon_close_small, 1, "switch")
            page_livechat = false
        if button_clickon((lc_x2 - 50), 370, spr_icon_profil, 1, "switch")
            livechat_name = ""
        draw_set_alpha(0.5)
        draw_line_width((lc_x2 - 15), 390, (lc_x2 - 15), 585, 2)
        draw_set_alpha(1)
        mc_list_slider2 = livechatlist_start / (array_length(livechatlist) - 6) * 195 + 390
        draw_circle((lc_x2 - 15), mc_list_slider2, 5, false)
        if (button_collision(0, 360, (lc_x2 - 10), 600) && array_length(livechatlist) >= 6)
        {
            if mouse_wheel_down()
                livechatlist_start = min((livechatlist_start + 1), (array_length(livechatlist) - 6))
            if mouse_wheel_up()
                livechatlist_start = max((livechatlist_start - 1), 0)
        }
        if (array_length(livechatlist) > 0)
        {
            for (i = 0; i < min(6, array_length(livechatlist)); i++)
            {
                draw_set_valign(fa_top)
                draw_set_halign(fa_left)
                draw_set_font(fontCJK)
                var _text_livechat_color = c_white
                if (livechatlist[(i + livechatlist_start)].user == "344605016")
                    _text_livechat_color = 65535
                draw_text_transformed_color((lc_x1 + 110), (lc_y1 + 10 + 40 * i), (": " + (livechatlist[(i + livechatlist_start)].content)), 0.25, 0.25, 0, _text_livechat_color, _text_livechat_color, _text_livechat_color, _text_livechat_color, 1)
                draw_text_transformed_color((lc_x1 + 10), (lc_y1 + 10 + 40 * i), livechatlist[(i + livechatlist_start)].livechatname, 0.25, 0.25, 0, _text_livechat_color, _text_livechat_color, _text_livechat_color, _text_livechat_color, 1)
            }
        }
        show_debug_message(livechatlist)
        switch livechat_state
        {
            case "idle":
                var text_empty = true
                if instance_exists(livechat_inputbox)
                {
                    var string_no_spaces = string_replace_all(livechat_inputbox.text_draw, " ", "")
                    var length_no_spaces = string_length(string_no_spaces)
                    if (length_no_spaces > 0)
                        text_empty = false
                }
                if (instance_exists(livechat_inputbox) == false)
                {
                    livechat_inputbox = input_text_create_singleline_ext((lc_x1 + 120), (lc_y2 - 40), 290, fontCJK_letter, 16777215, 1, 45, 0, 0, true, 0)
                    input_text_set_enabled(livechat_inputbox, true)
                }
                draw_set_valign(fa_top)
                draw_set_halign(fa_left)
                draw_set_font(fontCJK)
                draw_text_transformed_color((lc_x1 + 10), (lc_y2 - 40), livechat_name, 0.25, 0.25, 0, c_lime, c_lime, c_lime, c_lime, 1)
                draw_text_transformed_color((lc_x1 + 110), (lc_y2 - 40), ":", 0.25, 0.25, 0, c_lime, c_lime, c_lime, c_lime, 1)
                if button_collision((lc_x2 - 35 - 20), (lc_y2 - 25 - 20), (lc_x2 - 35 + 20), (lc_y2 - 25 + 20))
                {
                    draw_sprite_ext(spr_icon_send, 0, (lc_x2 - 35), (lc_y2 - 25), 0.5, 0.5, 0, c_white, 1)
                    if (mc_click && text_empty == false)
                    {
                        url = "http://47.100.210.210:5000/msg/livechat"
                        send_livechat = http_post_string(url, ("livechatname=" + livechat_name + "&playername=" + steamid + "&content=" + livechat_inputbox.text_draw))
                        livechat_state = "pending"
                    }
                }
                else
                    draw_sprite_ext(spr_icon_send, 0, (lc_x2 - 35), (lc_y2 - 25), 0.4, 0.4, 0, c_white, 1)
                if (keyboard_check_pressed(vk_return) && text_empty == false)
                {
                    url = "http://47.100.210.210:5000/msg/livechat"
                    send_livechat = http_post_string(url, ("livechatname=" + livechat_name + "&playername=" + steamid + "&content=" + livechat_inputbox.text_draw))
                    livechat_state = "pending"
                }
                break
            case "pending":
                if instance_exists(livechat_inputbox)
                    instance_destroy(livechat_inputbox)
                livechat_fail_count += 1
                if (livechat_fail_count > (room_speed * 10))
                {
                    livechat_fail_count = 0
                    livechat_state = "idle"
                }
                break
            case "wait":
                draw_text_transformed_color((lc_x1 + 200), (lc_y2 - 40), "......", 0.25, 0.25, 0, c_white, c_white, c_white, c_white, 1)
                livechat_cd += 1
                if (livechat_cd >= (room_speed * 5))
                {
                    livechat_cd = 0
                    livechat_state = "idle"
                }
                break
            case "error":
                draw_text_transformed_color((lc_x1 + 110), (lc_y2 - 40), _text_only_english, 0.25, 0.25, 0, c_white, c_white, c_white, c_white, 1)
                livechat_cd += 1
                if (livechat_cd >= (room_speed * 5))
                {
                    livechat_cd = 0
                    livechat_state = "idle"
                }
                break
            case "politic":
                draw_text_transformed_color((lc_x1 + 110), (lc_y2 - 40), _text_politic, 0.25, 0.25, 0, c_white, c_white, c_white, c_white, 1)
                livechat_cd += 1
                if (livechat_cd >= (room_speed * 5))
                {
                    livechat_cd = 0
                    livechat_state = "idle"
                }
                break
        }

    }
}
else if instance_exists(livechat_inputbox)
    instance_destroy(livechat_inputbox)
if (obj_controller.page_customization == 1 && obj_controller.current_page_deco == 0)
    layer_enable_fx("black", true)
else
    layer_enable_fx("black", false)
draw_rectangle_color(display_get_gui_width(), 0, (display_get_gui_width() / 2 * 3), display_get_gui_height(), c_black, c_black, c_black, c_black, false)
