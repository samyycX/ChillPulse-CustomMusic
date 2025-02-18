function button_request_new(argument0, argument1, argument2, argument3) //gml_Script_button_request_new
{
    if (argument3 == undefined)
        argument3 = spr_button
    var mc_click = mouse_check_button_pressed(mb_left)
    var ww = abs(sprite_get_bbox_left(argument3) - sprite_get_bbox_right(argument3))
    var hh = abs(sprite_get_bbox_bottom(argument3) - sprite_get_bbox_top(argument3))
    if button_collision((argument0 - ww / 2), (argument1 - hh / 2), (argument0 + ww / 2), (argument1 + hh / 2))
    {
        draw_sprite_ext(argument3, 1, argument0, argument1, 1, 1, 0, c_white, 1)
        if mc_click
            return true;
    }
    else
        draw_sprite_ext(argument3, 0, argument0, argument1, 1, 1, 0, c_white, 1)
    draw_set_valign(fa_middle)
    draw_set_halign(fa_center)
    draw_set_font(obj_controller.fontCJK)
    draw_text_transformed_color(argument0, argument1, argument2, 0.5, 0.5, 0, c_white, c_white, c_white, c_white, 1)
}

