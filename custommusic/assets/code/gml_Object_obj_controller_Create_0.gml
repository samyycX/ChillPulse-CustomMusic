var _exception;
alarm[1] = 120
alarm[3] = 420
alarm[7] = 60
alarm[9] = 60
color_diary_text = [0, 16776960, 0, 0, 0, 16776960]
color_diary_real_text = [0, 16711935, 0, 0, 0, 16711935]
color_hub = [4210752, 16711935, 4210752, 4210752, 4210752, 16711935]
drink_icon_list = [spr_coffee_machine_icon, spr_coffee_machine_icon_cyberpunk, spr_coffee_machine_icon_tea, spr_coffee_machine_icon_bar, spr_coffee_machine_icon_europe, spr_coffee_machine_icon_space]
drink_1_list = [spr_milk, spr_spirit, spr_tea_bag, spr_whiskey, spr_herbs, spr_electro_water]
drink_2_list = [spr_coffee_bag, spr_juice, spr_jasmin, spr_rum, spr_berries, spr_protein]
drink_3_list = [spr_sirop, spr_liquor, spr_goji, spr_absinte, spr_wine, spr_vitamin_jelly]
spr_final_drinks_list = [spr_final_cup1, spr_final_cup2, spr_final_cup3, spr_final_cup4, spr_final_cup5, spr_final_cup6]
menu_color_1 = [4210752, 16776960, 4210752, 16777215, 0, 16776960]
menu_color_2 = [4210752, 16711935, 4210752, 8421504, 0, 16711935]
menu_color_backsign = [0, 16776960, 0, 16777215, 16777215, 16776960]
spr_tag_list = [spr_tag, spr_tag_cyberpunk, spr_tag, spr_tag, spr_tag, spr_tag_cyberpunk]
color_diary_0 = [0, 16776960, 0, 0, 0, 16776960]
color_slot_list = [0, 16777215, 0, 0, 0, 16777215]
spr_stickynote_list = [spr_stickynote, spr_stickynote_cyber, spr_stickynote, spr_stickynote, spr_stickynote, spr_stickynote_cyber]
color_note = [0, 16711935, 0, 0, 0, 16711935]
color_diary_fond = [0, 16777215, 0, 0, 0, 16777215]
list_scene = ["modern", "cyberpunk", "china", "bar", "europe", "space"]
textbox_write_mail = -4
textbox_reply_mail = -4
textbox_show_mail = -4
textbox_scene_name = -4
all_time = 0
get = 0
send = 0
reply = 0
report = 0
get_livechat = 0
report_mailbox = 0
send_grab_request = false
request_letter = ""
request_letter_eng = ""
letter_text = ""
letter_reply_text = ""
letter_sent = false
letter_sending = 0
count_lettersending = 0
waiting_server = false
steamid = string(steam_get_user_account_id())
region = string(os_get_region())
os_info = string(os_get_info())
originname = ""
reply_sent = false
state_reply = "idle"
state_mailbox = "idle"
reply_count = 0
english_letter = false
count_reply_cd = 0
letter_reply_limit = 5
request_pending_cd = 0
pid = -1
mailbox = []
current_originmessage = 0
current_reply = 0
mail_function = true
report_demand = false
send_livechat = 0
livechatlist = 0
livechatlist_start = 0
livechat_inputbox = -4
livechat_state = "idle"
livechat_cd = 0
livechat_name = ""
inputname_textbox = -4
livechat_fail_count = 0
language = "english"
all_language = ["English", "中文", "日本語", "繁體中文", "français", "Русский", "한국어", "Deutsch", "Español", "Italiano", "Português"]
if (os_get_language() == "en")
    current_language = 0
else if (os_get_language() == "zh")
    current_language = 1
else if (os_get_language() == "ja")
    current_language = 2
else if (os_get_language() == "zh-Hant")
    current_language = 3
else if (os_get_language() == "fr")
    current_language = 4
else if (os_get_language() == "ru")
    current_language = 5
else if (os_get_language() == "ko")
    current_language = 6
else if (os_get_language() == "de")
    current_language = 7
else if (os_get_language() == "es")
    current_language = 8
else if (os_get_language() == "it")
    current_language = 9
else if (os_get_language() == "pt")
    current_language = 10
else
    current_language = 0
if debug_mode
    current_language = 0
language = all_language[current_language]
var filepath = working_directory + "KlokanTechNotoSansCJK-Regular.otf"
fontCJK = font_add(filepath, 50, false, false, 32, 127)
fontCJK_letter = font_add(filepath, 15, false, false, 32, 127)
fontCJK_note = font_add(filepath, 25, false, false, 32, 127)
variables()
earring_sprite = spr_morning_dew_small
level = 1
level_count = 0
score_total = 100
score_count = 0
score_show_delay = 0
current_scene_select = 0
current_scene = 0
time_total = 0
drink_unlock[0] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
drink_unlock[1] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
drink_unlock[2] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
drink_unlock[3] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
drink_unlock[4] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
drink_unlock[5] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
lover = "Her"
me = "Me"
rj = "RJ"
signal = "Signal"
yudi = "Yudi"
current_sentence[0] = [-1, -1]
current_sentence[1] = [-1]
current_sentence[2] = [0]
current_sentence[3] = [-1]
current_sentence[4] = [0]
current_sentence[5] = [-1, -1]
sentence_show_start[0][0] = 0
sentence_show_start[0][1] = 0
sentence_show_start[1][0] = 0
sentence_show_start[2][0] = 0
sentence_show_start[3][0] = 0
sentence_show_start[4][0] = 0
sentence_show_start[5][0] = 0
sentence_show_start[5][1] = 0
phone_contact_list[0] = [rj, lover]
phone_contact_list[1] = [lover]
phone_contact_list[2] = [lover]
phone_contact_list[3] = [lover]
phone_contact_list[4] = [lover]
phone_contact_list[5] = [yudi, signal]
count_message = 0
new_contact_notif[0] = true
new_contact_notif[1] = true
new_contact_notif[2] = false
new_contact_notif[3] = true
new_contact_notif[4] = false
new_contact_notif[5] = true
phone_contact_unlock[0] = -1
phone_contact_unlock[1] = -1
phone_contact_unlock[2] = -1
phone_contact_unlock[3] = -1
phone_contact_unlock[4] = -1
phone_contact_unlock[5] = -1
current_contact[0] = 0
current_contact[1] = 0
current_contact[2] = 0
current_contact[3] = 0
current_contact[4] = 0
current_contact[5] = 0
current_npc[0] = 1
current_npc[1] = 0
current_npc[2] = 0
current_npc[3] = 0
current_npc[4] = 0
current_npc[5] = 0
phone_page_type = "main"
phone_dialogue()
_current_year = 2024
current_year_show = 2024
calendar_text()
first_day = 1
first_day_2024 = 1
first_day_2025 = 3
list_month_length = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
list_month_length_2024 = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
list_month_length_2025 = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
_current_month = 0
_select_day = 1
_select_month = 1
_select_year = 2024
current_diary_page = 0
task_days = []
fish_page_state = "idle"
if (os_get_region() == "USA")
    time_format_24 = -1
else
    time_format_24 = 1
save_scene_list_start = 0
scene_christmas = -1
scene_halloween = -1
christmas_mode = 1
current_scene_name_to_save = ""
saved_scenes_list = []
saved_scene_start = 0
ask_offline = false
cloth_buying = false
page_fav_task = false
dp_x = display_get_width() / 4
dp_y = display_get_height() / 4
dp_w = 0
dp_h = 0
timer_to_type = ""
random_music_list = []
music_playing = 1
scale_playbutton = 2
scale_previousbutton = 2
scale_nextbutton = 2
scael_listbutton = 2
timer_page = -1
pomodoro_minute_max = 90000
pomodoro_minute = pomodoro_minute_max
rest_minute_max = 18000
rest_minute = rest_minute_max
timer_run = false
rest_run = false
page_pomodoro_setting = -1
page_todo = -1
page_music_list = -1
page_customization = -1
page_diary = -1
page_calendar = -1
current_todo = -1
current_todo_fav = -1
page_drink = -1
typing_active = false
typing_active_fav = false
auto_renew_pomodoro = -1
max_show_music_length = 6
max_show_music_length2 = 11
dragging_music_slider = false
slider_x = 100
music_mode = 0
page_noise = -1
current_page = 0
making_drink = false
count_drink = 0
machine_big_y = -720
alpha_text_coffee = 0
_right = display_get_gui_width() + 450
page_menu = -1
page_phone = -1
page_scene = -1
page_setting = -1
page_scene_detail = false
page_weather = -1
page_scene_state = "idle"
current_weather = "snow"
list_spr_deco = [spr_icon_headwear, spr_icon_pet, spr_icon_aquarium, spr_icon_human]
current_page_deco = 0
page_full_music = -1
page_stickynotes = -1
new_stickynote = true
note_on_mouse = -4
delay_show_stickynote = 0
mode_focus = false
current_scene_start = 0
writing_stickynote = false
current_line = ""
show_ui = 1
show_level_up = 1
count_pomodoro = 0
money_show_delay = 0
count_pomodoro_temp = 0
headwear_buying = false
current_headwear_to_buy = 0
fullscreen = false
mouse_effect = -1
light_effect = 1
writing_pomodoro = false
current_play_list = 0
page_drink_detail = false
current_drink_detail = 0
show_human = true
page_mail = -1
page_mail_sub = -1
image_index_count = 0
all_diary = []
current_diary = -1
diary_textbox = -4
title_textbox = -4
current_diary_start = 0
show_border = 1
writing_rest_timer = false
sending_letter = false
flashing_effect = 1
alarm_play_sound = 1
current_dragging_note = -1
current_task_start = 0
current_task_diary_start = 0
current_task_start_fav = 0
tutorial_finish = false
page_livechat = false
change_title_inputbox = -4
diary_line_start = 0
diary_cover_line_start = 0
state_diary = "idle"
sub_state_diary = "idle"
current_diary_select = -1
current_diary_enter = -1
diary_cover = [spr_diary_cover1, spr_diary_cover2, spr_diary_cover3, spr_diary_cover4, spr_diary_cover5, spr_diary_cover6, spr_diary_cover7, spr_diary_cover8, spr_diary_cover9, spr_diary_cover10, spr_diary_cover11, spr_diary_cover12]
diary_cover_price = [0, 0, 0, 0, 0, 0, 100, 100, 80, 80, 80, 80]
new_all_diary = []
first_diary = 
{
    title: "First Diary",
    cover: 0,
    content: [["haha", "xdxd"]]
}

array_push(new_all_diary, "")
scene_description()
current_category = 0
current_pet_to_save = 0
current_pet_category_to_save = 0
pet_buying = false
current_pet_to_buy = -1
pets_info()
current_earring = 0
list_spr_earring = [spr_morning_dew, spr_aurora_fantasy, spr_sakura_promise]
list_earring_name = ["Morning Dew", "Aurora Fantasy", "Sakura Promise"]
list_earring_ybuffer = [0, 0, 150]
head_wear_info()
cloth_info()
cloth_line_start = 0
fish_line_start = 0
tutorial_fish = true
fish_detail = false
current_fish = -4
fish_info()
current_drink_start = 0
drink_to_make = -1
list_mix_drink = []
drink_info()
drink_to_make_ind = 0
drink_to_make_description = -1
all_music()
music_list = []
music_names = []
array_copy(music_list, 0, album_list[0], 0, array_length(album_list[0]))
array_copy(music_names, 0, album_name_list[0], 0, array_length(album_name_list[0]))
current_music_genre = 0
current_random_music = 0
current_music_list_start = 0
current_music_list_start2 = 0
current_music_index = 0
current_music = music_list[current_music_index]
slider_y1 = 0
slider_y2 = 0
slider_y3 = 0
slider_y4 = 0
slider_y5 = 0
drag_1 = false
drag_2 = false
drag_3 = false
drag_4 = false
drag_5 = false
sd_fire = fireplace_with_crackling_sounds_2_min_rk_178392
sd_wind = wind_outside_sound_ambient_141989
sd_bird = forest_with_small_river_birds_and_nature_field_recording_6735
sd_rain = rain_sounds_relaxing_noise_and_sound_of_summer_rain_143334
audio_play_sound(sd_fire, 99, true)
audio_play_sound(sd_wind, 99, true)
audio_play_sound(sd_bird, 99, true)
audio_play_sound(sd_rain, 99, true)
audio_sound_gain(sd_fire, 0, 5)
audio_sound_gain(sd_wind, 0, 5)
audio_sound_gain(sd_bird, 0, 5)
audio_sound_gain(sd_rain, 0, 5)
list_todo = []
add_task(list_todo)
list_todo_fav = []
os_powersave_enable(false)
if (!debug_mode)
    load_game()
if (array_length(music_list) > 0)
{
    @@try_hook@@(8876, 8968)
    current_music = music_list[current_music_index]
    @@try_unhook@@()
    audio_play_sound(current_music, 99, false)
    audio_sound_gain(current_music, (slider_x / 100), 10)
    random_music_list = []
    for (var ii = 0; ii < array_length(music_list); ii++)
        array_push(random_music_list, ii)
    random_music_list = array_shuffle(random_music_list)
    current_random_music = 0
}
add_current_day_to_tasks()
if (debug_mode == true)
{
    score_total = 100000
    level = 30
}
