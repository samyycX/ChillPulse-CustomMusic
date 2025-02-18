function draw_slider(argument0, argument1, argument2, argument3, argument4) //gml_Script_draw_slider
{
    if (argument4 == undefined)
        argument4 = 0
    draw_set_color(argument4)
    draw_set_alpha(0.5)
    draw_line_width(argument0, argument1, argument0, argument2, 2)
    draw_set_alpha(1)
    var mc_list_slider2 = argument3 * (argument2 - argument1) + argument1
    draw_circle(argument0, mc_list_slider2, 5, false)
    draw_set_color(c_white)
}

