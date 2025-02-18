if (state == 0)
{
    timer++
    if (timer >= duration)
    {
        if (targetroom != false)
            room_goto(targetroom)
        if (obj_controller.page_scene == 1)
        {
            obj_controller.current_scene = obj_controller.current_scene_select
            if (obj_controller.page_scene_state == "fav")
            {
                obj_controller.current_girl_cloth[obj_controller.current_scene] = girl_cloth
                obj_controller.current_pet_to_save = pet
                obj_controller.current_pet_category_to_save = pet_category
                obj_controller.current_head_wearing = head_wear
                with (obj_cat)
                    spr_idle = obj_controller.pets[obj_controller.current_pet_category_to_save].animals[obj_controller.current_pet_to_save].sprite
                with (obj_earrings)
                    real_sprite = obj_controller.list_spr_hearwear_small[obj_controller.current_head_wearing]
            }
        }
        state = 1
        if (duration == 0)
        {
            state = 0.5
            timer = 180
        }
    }
}
else if (state == 0.5)
{
    timer2--
    if (timer2 <= 0)
    {
        timer2 = 300
        state = 1
    }
}
else if (state == 1)
{
    obj_controller.page_scene = -1
    obj_controller.page_scene_detail = false
    timer--
    if (timer <= 0)
        instance_destroy()
}
if (duration == 0)
    alpha = timer / 180
else
    alpha = timer / duration
