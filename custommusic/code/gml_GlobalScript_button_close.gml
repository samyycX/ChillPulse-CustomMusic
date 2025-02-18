function button_clickon(argument0, argument1, argument2, argument3, argument4) //gml_Script_button_clickon
{
    if (argument2 == undefined)
        argument2 = spr_icon_close
    if (argument3 == undefined)
        argument3 = 2
    if (argument4 == undefined)
        argument4 = "enlarge"
    if button_collision((argument0 - 30 * argument3 / 2), (argument1 - 30 * argument3 / 2), (argument0 + 30 * argument3 / 2), (argument1 + 30 * argument3 / 2))
    {
        if (argument4 == "enlarge")
            draw_sprite_ext(argument2, 0, argument0, argument1, (argument3 * 1.1), (argument3 * 1.1), 0, c_white, 1)
        if (argument4 == "switch")
            draw_sprite_ext(argument2, 1, argument0, argument1, argument3, argument3, 0, c_white, 1)
        if (mouse_check_button_pressed(mb_left) == true)
            return true;
    }
    else
        draw_sprite_ext(argument2, 0, argument0, argument1, argument3, argument3, 0, c_white, 1)
}

function button_back(argument0, argument1) //gml_Script_button_back
{
    if button_collision((argument0 - 30), (argument1 - 30), (argument0 + 30), (argument1 + 30))
    {
        draw_sprite_ext(spr_icon_back, 0, argument0, argument1, 2.2, 2.2, 0, c_white, 1)
        if (mouse_check_button_pressed(mb_left) == true)
            return true;
    }
    else
        draw_sprite_ext(spr_icon_back, 0, argument0, argument1, 2, 2, 0, c_white, 1)
}

