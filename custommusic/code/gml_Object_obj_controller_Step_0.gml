if (first_time_new_scene[current_scene] == 0 && current_scene != 0)
{
    first_time_new_scene[current_scene] = 1
    for (var i = 0; i < array_length(album_list[current_scene]); i++)
    {
        if (!(array_contains(music_list, album_list[current_scene][i])))
        {
            array_push(music_list, album_list[current_scene][i])
            array_push(music_names, album_name_list[current_scene][i])
        }
    }
    current_music_index = array_length(music_list) - array_length(album_list[current_scene])
    audio_stop_sound(current_music)
    current_music = music_list[current_music_index]
    audio_play_sound(current_music, 99, false)
}
if (current_scene == 6)
{
    if (upsidedown == true)
        layer_enable_fx("ef_upsidedown", true)
    else
        layer_enable_fx("ef_upsidedown", false)
}
else
    layer_enable_fx("ef_upsidedown", false)
calendar_text()
if (current_language == 0)
{
    signal = "Signal"
    yudi = "Yudi"
}
else if (current_language == 1)
{
    signal = "信号"
    yudi = "雨点"
}
else if (current_language == 2)
{
    signal = "信号"
    yudi = "雨点"
}
else if (current_language == 3)
{
    signal = "信號"
    yudi = "雨點"
}
phone_contact_list[5] = [yudi, signal]
if steam_is_cloud_enabled_for_app()
    quota = steam_get_quota_total()
var num_unlock = 0
for (var ii = 0; ii < array_length(list_headwear_price); ii++)
{
    if (list_headwear_price[ii] == 0)
        num_unlock++
}
if (num_unlock > 3)
{
    if (!steam_get_achievement("decorators_debut"))
        steam_set_achievement("decorators_debut")
}
steam_update()
if (current_scene == 1)
{
    if (!steam_get_achievement("new_tokyo_traveler"))
        steam_set_achievement("new_tokyo_traveler")
}
if (current_scene == 2)
{
    if (!steam_get_achievement("ancient_voyager"))
        steam_set_achievement("ancient_voyager")
}
if (current_scene == 3)
{
    if (!steam_get_achievement("retro_reveler"))
        steam_set_achievement("retro_reveler")
}
phone_dialogue()
if (current_language == 0)
    list_month = ["January", "Feburary", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
if (current_language == 1 || current_language == 2 || current_language == 3)
    list_month = ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"]
if (current_language == 6)
    list_month = ["일월", "이월", "삼월", "사월", "오월", "유월", "칠월", "팔월", "구월", "십월", "십일월", "십이월"]
if debug_mode
{
    if keyboard_check_pressed(vk_right)
    {
        current_sentence[current_scene][1] += 1
        if (current_sentence[current_scene][1] >= 6)
            sentence_show_start[current_scene][1] += 1
    }
    if keyboard_check_pressed(vk_down)
        new_contact_notif[current_scene] = true
}
scene_description()
drink_info()
var mx_gui = device_mouse_x_to_gui(0)
var my_gui = device_mouse_y_to_gui(0)
var ms_click = mouse_check_button_pressed(mb_left)
var timer_x = 1190
var timer_y = 10
var size_timer_icon = 60
scale_playbutton = 1
scale_previousbutton = 1
scale_nextbutton = 1
scale_listbutton = 1
if (mx_gui >= 325 && my_gui >= 660 && mx_gui <= 356 && my_gui <= 700)
{
    scale_previousbutton = 1.25
    if (ms_click && array_length(music_names) > 0 && (!page_customization))
    {
        if (music_mode == 0 || music_mode == 1)
        {
            current_music_index--
            if (current_music_index < 0)
                current_music_index = array_length(music_list) - 1
        }
        else if (music_mode == 2)
        {
            if (current_random_music != 0)
                current_random_music--
            current_music_index = random_music_list[current_random_music]
        }
        audio_stop_sound(current_music)
        current_music = music_list[current_music_index]
        audio_play_sound(current_music, 99, false)
    }
}
if (mx_gui >= 430 && my_gui >= 660 && mx_gui <= 462 && my_gui <= 700)
{
    scale_nextbutton = 1.25
    if (ms_click && array_length(music_names) > 0 && (!page_customization))
    {
        if (music_mode == 0 || music_mode == 1)
        {
            current_music_index++
            if (current_music_index >= array_length(music_list))
                current_music_index = 0
        }
        else if (music_mode == 2)
        {
            if (current_random_music >= (array_length(random_music_list) - 1))
            {
                random_music_list = []
                for (ii = 0; ii < array_length(music_list); ii++)
                    array_push(random_music_list, ii)
                random_music_list = array_shuffle(random_music_list)
                current_random_music = 0
            }
            else
                current_random_music++
            current_music_index = random_music_list[current_random_music]
        }
        audio_stop_sound(current_music)
        current_music = music_list[current_music_index]
        audio_play_sound(current_music, 99, false)
    }
}
if (mx_gui >= 374 && my_gui >= 660 && mx_gui <= 420 && my_gui <= 700)
{
    scale_playbutton = 1.25
    if (ms_click && array_length(music_names) > 0 && (!page_customization))
    {
        music_playing *= -1
        if (music_playing == -1)
            audio_pause_sound(current_music)
        else
            audio_resume_sound(current_music)
    }
}
if (mx_gui >= 8 && my_gui >= 660 && mx_gui <= 60 && my_gui <= 700)
{
    scale_listbutton = 1.25
    if (ms_click && (!page_customization) && no_window())
    {
        page_music_list *= -1
        page_full_music = -1
    }
}
if (audio_is_playing(current_music) == false && array_length(music_list) > 0)
{
    if (music_mode == 2)
    {
        current_random_music++
        if (current_random_music > (array_length(random_music_list) - 1))
        {
            random_music_list = []
            for (ii = 0; ii < array_length(music_list); ii++)
                array_push(random_music_list, ii)
            random_music_list = array_shuffle(random_music_list)
            current_random_music = 0
        }
        current_music_index = random_music_list[current_random_music]
    }
    if (music_mode == 0)
    {
        current_music_index++
        if (current_music_index >= array_length(music_list))
            current_music_index = 0
    }
    if (music_mode == 1)
    {
    }
    if (array_length(music_list) > 0)
    {
        current_music = music_list[current_music_index]
        audio_play_sound(current_music, 99, false)
    }
}
var lay_id = layer_get_id("background_main")
var back_id = layer_background_get_id(lay_id)
layer_background_index(back_id, current_scene)
var lay_id_far = layer_get_id("background_far")
var back_id_far = layer_background_get_id(lay_id_far)
layer_background_index(back_id_far, current_scene)
var lay_id_table = layer_get_id("table")
var back_id_table = layer_background_get_id(lay_id_table)
layer_background_index(back_id_table, current_scene)
lay_id = layer_get_id("background_main_christmas")
var back = layer_background_get_id(lay_id)
if (current_scene == 0 && scene_christmas == 1)
    layer_background_visible(back, true)
else
    layer_background_visible(back, false)
lay_id = layer_get_id("background_main_halloween")
back = layer_background_get_id(lay_id)
if (current_scene == 0 && scene_halloween == 1)
    layer_background_visible(back, true)
else
    layer_background_visible(back, false)
