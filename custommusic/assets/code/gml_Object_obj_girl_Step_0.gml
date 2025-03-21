if (obj_controller.current_scene == 0)
{
    spr_base = asset_get_index("spr_girl_modern_base_" + (string(obj_controller.current_girl_cloth[obj_controller.current_scene] + 1)))
    spr_idle = asset_get_index("spr_girl_modern_idle_" + (string(obj_controller.current_girl_cloth[obj_controller.current_scene] + 1)))
    spr_writing = asset_get_index("spr_girl_modern_writing_" + (string(obj_controller.current_girl_cloth[obj_controller.current_scene] + 1)))
    spr_drinking = asset_get_index("spr_girl_modern_drinking_" + (string(obj_controller.current_girl_cloth[obj_controller.current_scene] + 1)))
}
else if (obj_controller.current_scene == 1)
{
    spr_base = asset_get_index("spr_girl_cyberpunk_base_" + (string(obj_controller.current_girl_cloth[obj_controller.current_scene] + 1)))
    spr_idle = asset_get_index("spr_girl_cyberpunk_idle_" + (string(obj_controller.current_girl_cloth[obj_controller.current_scene] + 1)))
    spr_writing = asset_get_index("spr_girl_cyberpunk_writing_" + (string(obj_controller.current_girl_cloth[obj_controller.current_scene] + 1)))
    spr_drinking = asset_get_index("spr_girl_cyberpunk_drinking_" + (string(obj_controller.current_girl_cloth[obj_controller.current_scene] + 1)))
}
else if (obj_controller.current_scene == 2)
{
    spr_base = asset_get_index("spr_girl_china_base_" + (string(obj_controller.current_girl_cloth[obj_controller.current_scene] + 1)))
    spr_idle = asset_get_index("spr_girl_china_idle_" + (string(obj_controller.current_girl_cloth[obj_controller.current_scene] + 1)))
    spr_writing = asset_get_index("spr_girl_china_writing_" + (string(obj_controller.current_girl_cloth[obj_controller.current_scene] + 1)))
    spr_drinking = asset_get_index("spr_girl_china_drinking_" + (string(obj_controller.current_girl_cloth[obj_controller.current_scene] + 1)))
}
else if (obj_controller.current_scene == 3)
{
    spr_base = asset_get_index("spr_girl_bar_base_" + (string(obj_controller.current_girl_cloth[obj_controller.current_scene] + 1)))
    spr_idle = asset_get_index("spr_girl_bar_idle_" + (string(obj_controller.current_girl_cloth[obj_controller.current_scene] + 1)))
    spr_writing = asset_get_index("spr_girl_bar_writing_" + (string(obj_controller.current_girl_cloth[obj_controller.current_scene] + 1)))
    spr_drinking = asset_get_index("spr_girl_bar_drinking_" + (string(obj_controller.current_girl_cloth[obj_controller.current_scene] + 1)))
}
else if (obj_controller.current_scene == 4)
{
    spr_base = asset_get_index("spr_girl_europe_base_" + (string(obj_controller.current_girl_cloth[obj_controller.current_scene] + 1)))
    spr_idle = asset_get_index("spr_girl_europe_idle_" + (string(obj_controller.current_girl_cloth[obj_controller.current_scene] + 1)))
    spr_writing = asset_get_index("spr_girl_europe_writing_" + (string(obj_controller.current_girl_cloth[obj_controller.current_scene] + 1)))
    spr_drinking = asset_get_index("spr_girl_europe_drinking_" + (string(obj_controller.current_girl_cloth[obj_controller.current_scene] + 1)))
}
else if (obj_controller.current_scene == 5)
{
    spr_base = asset_get_index("spr_girl_space_base_" + (string(obj_controller.current_girl_cloth[obj_controller.current_scene] + 1)))
    spr_idle = asset_get_index("spr_girl_space_idle_" + (string(obj_controller.current_girl_cloth[obj_controller.current_scene] + 1)))
    spr_writing = asset_get_index("spr_girl_space_writing_" + (string(obj_controller.current_girl_cloth[obj_controller.current_scene] + 1)))
    spr_drinking = asset_get_index("spr_girl_space_drinking_" + (string(obj_controller.current_girl_cloth[obj_controller.current_scene] + 1)))
}
else if (obj_controller.current_scene == 6)
{
    spr_base = asset_get_index("spr_girl_strange_base_" + (string(obj_controller.current_girl_cloth[obj_controller.current_scene] + 1)))
    spr_idle = asset_get_index("spr_girl_strange_idle_" + (string(obj_controller.current_girl_cloth[obj_controller.current_scene] + 1)))
    spr_writing = asset_get_index("spr_girl_strange_writing_" + (string(obj_controller.current_girl_cloth[obj_controller.current_scene] + 1)))
    spr_drinking = asset_get_index("spr_girl_strange_drinking_" + (string(obj_controller.current_girl_cloth[obj_controller.current_scene] + 1)))
}
switch state
{
    case "idle":
        sprite_index = spr_idle
        count++
        if (count >= (room_speed * 5))
        {
            if (irandom(10) >= 8)
                state = "writing"
            image_index = 0
            count = 0
        }
        break
    case "writing":
        sprite_index = spr_writing
        if (image_index >= (image_number - 3))
        {
            if (random(10) <= 8.5 && change_action == false)
                image_index = 3
            else
                change_action = true
            if (image_index >= (image_number - 1))
            {
                state = "idle"
                image_index = 0
                change_action = false
            }
        }
        break
    case "drinking":
        sprite_index = spr_drinking
        if (image_index >= (image_number - 1))
        {
            state = "idle"
            image_index = 0
        }
        break
}

if (obj_controller.page_music_list == -1 && obj_controller.page_customization == -1 && obj_controller.page_phone == -1 && obj_controller.mode_focus != 1 && obj_controller.page_diary == -1 && obj_controller.page_scene == -1)
{
    if collision_point(mouse_x, mouse_y, id, false, false)
    {
        if mouse_check_button_pressed(mb_left)
        {
        }
    }
}
