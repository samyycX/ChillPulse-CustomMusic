var _exception, unclassified_diary;
function real_load_game(argument0) //gml_Script_real_load_game
{
    if (argument0 == undefined)
        argument0 = "save.txt"
    var _file = file_text_open_read(argument0)
    var _json = file_text_read_string(_file)
    var _main = json_parse(_json)
    @@try_hook@@(240, 296)
    score_total = _main._gold
    level = _main._exp
    level_count = _main._exp_count
    @@try_unhook@@()
    @@try_hook@@(824, 880)
    task_days = _main._tasks
    for (var i = 0; i < (array_length(task_days) - 1); i++)
    {
        for (var j = i + 1; j < array_length(task_days); j++)
        {
            if (task_days[i][0] == task_days[j][0] && task_days[i][1] == task_days[j][1] && task_days[i][2] == task_days[j][2])
            {
                array_delete(task_days, j, 1)
                j--
            }
        }
    }
    @@try_unhook@@()
    @@try_hook@@(1772, 1828)
    for (i = 0; i < array_length(_main._current_sentence); i++)
        current_sentence[i] = _main._current_sentence[i]
    for (i = 0; i < array_length(_main._sentence_show_start); i++)
        sentence_show_start[i] = _main._sentence_show_start[i]
    for (i = 0; i < array_length(_main._phone_contact_list); i++)
        phone_contact_list[i] = _main._phone_contact_list[i]
    for (i = 0; i < array_length(_main._new_contact_notif); i++)
        new_contact_notif[i] = _main._new_contact_notif[i]
    for (i = 0; i < array_length(_main._phone_contact_unlock); i++)
        phone_contact_unlock[i] = _main._phone_contact_unlock[i]
    for (i = 0; i < array_length(_main._current_contact); i++)
        current_contact[i] = _main._current_contact[i]
    @@try_unhook@@()
    @@try_hook@@(2252, 2308)
    var _headwear_price = _main._list_headwear_price
    if (array_length(_headwear_price) == 9)
    {
        for (i = 0; i < array_length(_headwear_price); i++)
            list_headwear_price[(i + 1)] = _headwear_price[i]
    }
    else if (array_length(_headwear_price) != list_headwear_price)
    {
        for (i = 0; i < array_length(list_headwear_price); i++)
            list_headwear_price[i] = _headwear_price[i]
    }
    else
        list_headwear_price = _main._list_headwear_price
    @@try_unhook@@()
    @@try_hook@@(2500, 2556)
    for (i = 0; i < array_length(_main._drink_unlock); i++)
        drink_unlock[i] = _main._drink_unlock[i]
    @@try_unhook@@()
    @@try_hook@@(2636, 2692)
    current_language = _main._current_language
    @@try_unhook@@()
    @@try_hook@@(3200, 3256)
    var all_fish = _main._fish
    for (var ii = 0; ii < array_length(all_fish); ii++)
    {
        if (typeof(all_fish[ii][0]) != "string")
        {
            with (instance_create_layer(465, 155, "EFFECT", choose(obj_chili_rasbora, obj_neon_tetra, obj_tiger_barb, obj_dwarf_gourami, obj_zebrafish, obj_cichild, obj_angelfish, obj_clownfish, obj_bettafish)))
                experience = all_fish[ii][1]
        }
        else
        {
            with (instance_create_layer(465, 155, "EFFECT", asset_get_index(all_fish[ii][0])))
                experience = all_fish[ii][1]
        }
    }
    @@try_unhook@@()
    @@try_hook@@(3336, 3392)
    list_todo = _main._list_todo
    @@try_unhook@@()
    @@try_hook@@(3472, 3528)
    list_todo_fav = _main._list_todo_fav
    @@try_unhook@@()
    @@try_hook@@(3608, 3668)
    slider_x = _main._slider_x
    @@try_unhook@@()
    @@try_hook@@(4180, 4236)
    var _list = _main._music_list
    music_list = []
    music_names = []
    for (i = 0; i < array_length(_list); i++)
    {
        for (j = 0; j < array_length(album_name_list); j++)
        {
            if array_contains(album_name_list[j], _main._music_names[i])
            {
                var _music_index = array_get_index(album_name_list[j], _main._music_names[i])
                array_push(music_names, _main._music_names[i])
                array_push(music_list, album_list[j][_music_index])
            }
        }
    }
    @@try_unhook@@()
    @@try_hook@@(4316, 4372)
    current_scene = _main._current_scene
    @@try_unhook@@()
    @@try_hook@@(4452, 4508)
    slider_y1 = _main._slider1
    @@try_unhook@@()
    @@try_hook@@(4588, 4644)
    slider_y2 = _main._slider2
    @@try_unhook@@()
    @@try_hook@@(4724, 4780)
    slider_y3 = _main._slider3
    @@try_unhook@@()
    @@try_hook@@(4860, 4916)
    slider_y4 = _main._slider4
    @@try_unhook@@()
    slider_y1 = array_get(slider_volume((display_get_gui_width() - 110), slider_y1, drag_1, "rain"), 0)
    drag_1 = array_get(slider_volume((display_get_gui_width() - 110), slider_y1, drag_1, "rain"), 1)
    slider_y2 = array_get(slider_volume((display_get_gui_width() - 160), slider_y2, drag_2, "wind"), 0)
    drag_2 = array_get(slider_volume((display_get_gui_width() - 160), slider_y2, drag_2, "wind"), 1)
    slider_y3 = array_get(slider_volume((display_get_gui_width() - 210), slider_y3, drag_3, "fire"), 0)
    drag_3 = array_get(slider_volume((display_get_gui_width() - 210), slider_y3, drag_3, "fire"), 1)
    slider_y4 = array_get(slider_volume((display_get_gui_width() - 260), slider_y4, drag_4, "bird"), 0)
    drag_4 = array_get(slider_volume((display_get_gui_width() - 260), slider_y4, drag_4, "bird"), 1)
    @@try_hook@@(5604, 5660)
    mouse_effect = _main._mouse_effect
    @@try_unhook@@()
    @@try_hook@@(5740, 5796)
    show_level_up = _main._show_level_up
    @@try_unhook@@()
    @@try_hook@@(5876, 5932)
    light_effect = _main._light_effect
    @@try_unhook@@()
    @@try_hook@@(6012, 6068)
    music_mode = _main._music_mode
    @@try_unhook@@()
    @@try_hook@@(6164, 6220)
    pomodoro_minute_max = _main._pomodoro_minute_max
    pomodoro_minute = pomodoro_minute_max
    @@try_unhook@@()
    @@try_hook@@(6316, 6372)
    rest_minute_max = _main._rest_minute_max
    rest_minute = rest_minute_max
    @@try_unhook@@()
    @@try_hook@@(6452, 6508)
    auto_renew_pomodoro = _main._auto_renew_pomodoro
    @@try_unhook@@()
    @@try_hook@@(6836, 6892)
    var all_notes = _main._list_stickynotes
    for (i = 0; i < array_length(all_notes); i++)
    {
        with (instance_create_layer(mouse_x, mouse_y, "EFFECT", obj_stickynote))
        {
            x = all_notes[i][1]
            y = all_notes[i][2]
            note = all_notes[i][3]
        }
    }
    @@try_unhook@@()
    @@try_hook@@(6972, 7028)
    tutorial_fish = _main._tutorial_fish
    @@try_unhook@@()
    @@try_hook@@(7108, 7164)
    time_total = _main._time_total
    @@try_unhook@@()
    @@try_hook@@(7244, 7300)
    current_weather = _main._current_weather
    @@try_unhook@@()
    @@try_hook@@(7380, 7436)
    current_music_index = _main._current_music_index
    @@try_unhook@@()
    @@try_hook@@(7516, 7572)
    current_head_wearing = _main._current_head_wearing
    @@try_unhook@@()
    @@try_hook@@(7652, 7708)
    current_pet_category_to_save = _main._current_pet_category_to_save
    @@try_unhook@@()
    @@try_hook@@(7788, 7844)
    current_pet_to_save = _main._current_pet_to_save
    @@try_unhook@@()
    @@try_hook@@(8224, 8280)
    var load_pets = _main._pets
    for (var a = 0; a < array_length(load_pets); a++)
    {
        var _pet_category = load_pets[a].animals
        for (var b = 0; b < array_length(_pet_category); b++)
        {
            var _single_pet = _pet_category[b]
            pets[a].animals[b].price = _single_pet.price
        }
    }
    @@try_unhook@@()
    @@try_hook@@(8360, 8416)
    show_human = _main._show_human
    @@try_unhook@@()
    @@try_hook@@(8496, 8740)
    new_all_diary = _main._new_all_diary
    @@try_unhook@@()
    @@try_hook@@(8884, 8940)
    show_border = _main._show_border
    if (show_border == 1)
        window_set_showborder(true)
    else
        window_set_showborder(false)
    @@try_unhook@@()
    @@try_hook@@(9020, 9076)
    flashing_effect = _main._flashing_effect
    @@try_unhook@@()
    @@try_hook@@(9156, 9212)
    alarm_play_sound = _main._alarm_play_sound
    @@try_unhook@@()
    @@try_hook@@(9332, 9388)
    var temp_state_reply = _main._state_reply
    if (temp_state_reply == "too_much_reply")
        state_reply = "too_much_reply"
    @@try_unhook@@()
    @@try_hook@@(9468, 9524)
    reply_count = _main._reply_count
    @@try_unhook@@()
    @@try_hook@@(9604, 9660)
    timer_page = _main._page_timer
    @@try_unhook@@()
    @@try_hook@@(9740, 9796)
    page_todo = _main._page_todolist
    @@try_unhook@@()
    @@try_hook@@(9876, 9932)
    mode_focus = _main._mode_clean
    @@try_unhook@@()
    @@try_hook@@(10012, 10068)
    tutorial_finish = _main._tutorial_finish
    @@try_unhook@@()
    @@try_hook@@(10148, 10204)
    mail_function = _main._mail_function
    @@try_unhook@@()
    @@try_hook@@(10436, 10492)
    var length_old = array_length(_main._diary_cover_price)
    var length_new = array_length(diary_cover_price)
    for (i = 0; i < length_old; i++)
        diary_cover_price[i] = _main._diary_cover_price[i]
    @@try_unhook@@()
    @@try_hook@@(10544, 10600)
    @@try_unhook@@()
    @@try_hook@@(10992, 11048)
    for (j = 0; j < array_length(_main._cloth_price); j++)
    {
        var length_cloth = array_length(_main._cloth_price[j])
        for (i = 0; i < length_cloth; i++)
            cloth_price[j][i] = _main._cloth_price[j][i]
        current_girl_cloth[j] = _main._current_girl_cloth[j]
    }
    @@try_unhook@@()
    @@try_hook@@(11240, 11536)
    for (i = 0; i < array_length(_main._current_npc); i++)
        current_npc[i] = _main._current_npc[i]
    @@try_unhook@@()
    @@try_hook@@(11616, 11672)
    livechat_name = _main._livechat_name
    @@try_unhook@@()
    @@try_hook@@(11752, 11808)
    christmas_mode = _main._christmas_mode
    @@try_unhook@@()
    @@try_hook@@(11888, 11944)
    time_format_24 = _main._time_format_24
    @@try_unhook@@()
    @@try_hook@@(12136, 12192)
    for (i = 0; i < array_length(_main._first_time_new_scene); i++)
        first_time_new_scene[i] = _main._first_time_new_scene[i]
    @@try_unhook@@()
    @@try_hook@@(12272, 12328)
    upsidedown = _main._upsidedown
    @@try_unhook@@()
    @@try_hook@@(12408, 12464)
    silence_mode = _main._silence_mode
    @@try_unhook@@()
}

