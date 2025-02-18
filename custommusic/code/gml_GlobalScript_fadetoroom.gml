function fadetoroom(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8) //gml_Script_fadetoroom
{
    if (argument5 == undefined)
        argument5 = -1
    if (argument6 == undefined)
        argument6 = -1
    if (argument7 == undefined)
        argument7 = -1
    if (argument8 == undefined)
        argument8 = -1
    if (!instance_exists(obj_fade))
    {
        with (obj_controller)
        {
            phone_page_type = "main"
            count_message = 0
            timer_run = false
            pomodoro_minute = pomodoro_minute_max
            rest_run = false
            rest_minute = rest_minute_max
        }
        with (obj_cup)
        {
            gain_gold = 0
            gain_exp = 0
            alarm[0] = 0
            image_index = 0
        }
        with (instance_create_depth(0, 0, -99999, obj_fade))
        {
            targetroom = argument0
            duration = argument1
            color = argument2
            dest_x = argument3
            dest_y = argument4
            girl_cloth = argument5
            pet_category = argument6
            pet = argument7
            head_wear = argument8
        }
    }
}

