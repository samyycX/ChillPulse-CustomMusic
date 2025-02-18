function save_game(argument0) //gml_Script_save_game
{
    if (argument0 == undefined)
        argument0 = "save.txt"
    show_debug_message("-------------------------------saving game ---------------------------------")
    show_debug_message(working_directory)
    show_debug_message(program_directory)
    var all_notes = []
    for (var i = 0; i < instance_number(obj_stickynote); i++)
    {
        var _id = instance_find(obj_stickynote, i)
        var _one_note = [_id, _id.x, _id.y, _id.note]
        array_push(all_notes, _one_note)
    }
    var fish_own = []
    for (i = 0; i < instance_number(obj_fish); i++)
    {
        var _id_fish = instance_find(obj_fish, i)
        var _one_fish = [object_get_name(_id_fish.object_index), _id_fish.experience]
        array_push(fish_own, _one_fish)
    }
    var _main = 
    {
        _christmas_mode: christmas_mode,
        _gold: score_total,
        _exp: level,
        _exp_count: level_count,
        _tasks: task_days,
        _current_sentence: current_sentence,
        _sentence_show_start: sentence_show_start,
        _phone_contact_list: phone_contact_list,
        _new_contact_notif: new_contact_notif,
        _phone_contact_unlock: phone_contact_unlock,
        _current_contact: current_contact,
        _list_headwear_price: list_headwear_price,
        _music_list: music_list,
        _music_names: music_names,
        _drink_unlock: drink_unlock,
        _current_language: current_language,
        _current_music: current_music,
        _fish: fish_own,
        _list_todo: list_todo,
        _list_todo_fav: list_todo_fav,
        _slider_x: slider_x,
        _current_scene: current_scene,
        _slider1: slider_y1,
        _slider2: slider_y2,
        _slider3: slider_y3,
        _slider4: slider_y4,
        _mouse_effect: mouse_effect,
        _show_level_up: show_level_up,
        _light_effect: light_effect,
        _music_mode: music_mode,
        _pomodoro_minute_max: pomodoro_minute_max,
        _rest_minute_max: rest_minute_max,
        _auto_renew_pomodoro: auto_renew_pomodoro,
        _list_stickynotes: all_notes,
        _tutorial_fish: tutorial_fish,
        _time_total: time_total,
        _current_weather: current_weather,
        _current_music_index: current_music_index,
        _current_head_wearing: current_head_wearing,
        _pets: pets,
        _current_pet_to_save: current_pet_to_save,
        _current_pet_category_to_save: current_pet_category_to_save,
        _show_human: show_human,
        _all_diary: all_diary,
        _show_border: show_border,
        _flashing_effect: flashing_effect,
        _alarm_play_sound: alarm_play_sound,
        _state_reply: state_reply,
        _reply_count: reply_count,
        _page_timer: timer_page,
        _page_todolist: page_todo,
        _mode_clean: mode_focus,
        _tutorial_finish: tutorial_finish,
        _mail_function: mail_function,
        _new_all_diary: new_all_diary,
        _diary_cover_price: diary_cover_price,
        _dp_w: window_get_width(),
        _dp_h: window_get_height(),
        _dp_x: window_get_x(),
        _dp_y: window_get_y(),
        _fullscreen: fullscreen,
        _cloth_price: cloth_price,
        _current_girl_cloth: current_girl_cloth,
        _current_npc: current_npc,
        _livechat_name: livechat_name,
        _time_format_24: time_format_24
    }

    var _string = json_stringify(_main)
    var _file = file_text_open_write(argument0)
    file_text_write_string(_file, _string)
    file_text_close(_file)
}

