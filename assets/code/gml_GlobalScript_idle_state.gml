function idle_state() //gml_Script_idle_state
{
    with (obj_controller)
    {
        if (page_diary == -1 && page_music_list == -1 && page_customization == -1 && page_phone == -1 && mode_focus != 1 && page_calendar == -1 && page_scene == -1 && page_mail == -1 && (!instance_exists(obj_tutorial)) && page_livechat == false)
            return true;
    }
}

function no_window() //gml_Script_no_window
{
    with (obj_controller)
    {
        if (page_diary == -1 && page_customization == -1 && page_phone == -1 && page_calendar == -1 && page_scene == -1 && page_mail == -1 && (!instance_exists(obj_tutorial)) && page_drink == -1)
            return true;
    }
}

