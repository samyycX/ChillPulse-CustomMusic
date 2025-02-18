var spr_idle_name = sprite_get_name(spr_idle)
spr_howl = asset_get_index(spr_idle_name + "_howl")
switch state
{
    case "idle":
        sprite_index = spr_idle
        if (collision_point(mouse_x, mouse_y, id, false, false) && obj_controller.page_weather == -1 && obj_controller.page_noise == -1 && obj_controller.page_stickynotes == -1 && obj_controller.page_customization == -1 && no_window() == true)
        {
            if (mouse_check_button_pressed(mb_left) && obj_controller.page_full_music != true)
            {
                state = "howl"
                image_index = 0
                instance_create_layer(mouse_x, (mouse_y - 30), "EFFECT", obj_happiness)
                if (obj_controller.pets[obj_controller.current_pet_category_to_save].category == "Cat")
                    audio_play_sound(sd_meow, 99, false)
            }
        }
        break
    case "howl":
        sprite_index = spr_howl
        if (image_index >= (image_number - 1))
        {
            state = "idle"
            image_index = 0
        }
        break
}

if (spr_idle == spr_call_chick && obj_controller.show_human == true)
{
    x = 354
    y = 100
}
else
{
    x = 570
    y = 290
}
if (obj_controller.current_pet_category_to_save == 3 && obj_controller.current_pet_to_save == 2)
{
    image_xscale = 1
    image_yscale = image_xscale
}
else
{
    image_xscale = 1.5
    image_yscale = image_xscale
}
