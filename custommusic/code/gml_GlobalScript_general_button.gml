function button64(argument0, argument1, argument2, argument3, argument4, argument5) //gml_Script_button64
{
    if (argument5 == undefined)
        argument5 = 1
    var mc_click = mouse_check_button_pressed(mb_left)
    if button_collision((argument0 - 64 * argument2 / 2), (argument1 - 64 * argument2 / 2), (argument0 + 64 * argument2 / 2), (argument1 + 64 * argument2 / 2))
    {
        draw_sprite_ext(argument4, 0, argument0, argument1, (argument2 * 1.1), (argument2 * 1.1), 0, argument3, argument5)
        if mc_click
            return true;
    }
    else
        draw_sprite_ext(argument4, 0, argument0, argument1, argument2, argument2, 0, argument3, argument5)
}

