var _color_note = color_note
if (obj_controller.writing_stickynote == true && obj_controller.note_on_mouse == id)
{
    draw_set_alpha(0.2)
    draw_sprite(sprite_index, image_index, x, y)
    draw_set_alpha(1)
}
else if (obj_controller.page_stickynotes == 1)
{
    draw_self()
    draw_set_halign(fa_center)
    draw_set_valign(fa_middle)
    draw_set_font(obj_controller.fontCJK)
    draw_set_color(_color_note[obj_controller.current_scene])
    draw_text_transformed(x, y, note, 0.09, 0.09, 0)
    draw_set_color(c_white)
    if (!new_born)
    {
        if collision_point(mouse_x, mouse_y, id, false, false)
        {
            if (mouse_x > (x + 15) && mouse_y < (y - 15))
            {
                draw_sprite_ext(spr_icon_see_small, 1, (x + 25), (y - 25), 0.5, 0.5, 0, c_white, 1)
                if mouse_check_button_pressed(mb_left)
                {
                    with (obj_controller)
                    {
                        new_stickynote = true
                        writing_stickynote = true
                        note_on_mouse = other.id
                        instance_destroy(obj_input_text)
                        var id1 = input_text_create_multiline_ext(450, 220, 375, 220, fontCJK_note, _color_note[current_scene], 1, 375, -1, 4, -1, 0, 0, true, 0)
                        input_text_set_enabled(id1, true)
                        input_text_set_text(id1, other.note)
                    }
                }
            }
            else
            {
                draw_sprite_ext(spr_icon_see_small, 0, (x + 25), (y - 25), 0.5, 0.5, 0, c_white, 1)
                if (mouse_check_button_pressed(mb_left) && obj_controller.current_dragging_note == -1)
                {
                    dragging = true
                    obj_controller.current_dragging_note = id
                }
            }
        }
        if dragging
        {
            if button_collision(0, 108, 815, 611)
                draw_sprite_ext(spr_poubelle_indicate, 1, 405, 70, 1, 1, 0, c_white, 1)
            else
                draw_sprite_ext(spr_poubelle_indicate, 0, 405, 70, 1, 1, 0, c_white, 1)
            x = mouse_x
            y = mouse_y
            if mouse_check_button_released(mb_left)
            {
                if (mouse_x < 430)
                    instance_destroy()
                dragging = false
                obj_controller.current_dragging_note = -1
            }
        }
    }
}
