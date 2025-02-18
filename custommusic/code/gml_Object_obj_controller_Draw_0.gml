var mc_click = mouse_check_button_pressed(mb_left)
var mc_hold = mouse_check_button(mb_left)
var mx = mouse_x
var my = mouse_y
var _text_stickynote = "Sticky Note"
if (page_stickynotes == 1)
{
    var _color_note = color_note
    delay_show_stickynote++
    draw_set_color(c_black)
    draw_set_alpha(0.7)
    draw_rectangle((room_width / 3 * 2 - 50), 0, room_width, room_height, false)
    draw_set_alpha(1)
    draw_set_color(c_white)
    if (delay_show_stickynote > 10)
        draw_sprite_ext(spr_stickynote_list[current_scene], 1, (room_width - 20), (room_height - 20), 0.8, 0.8, 0, c_white, 1)
    if (button_collision(1240, 650, 1300, 800) && (!writing_stickynote))
    {
        draw_set_alpha(0.4)
        draw_sprite_ext(spr_stickynote_list[current_scene], 0, (room_width - 58 + 10), (room_height - 46 + 10), 0.8, 0.8, 0, c_white, 1)
        draw_set_alpha(1)
        if mc_hold
        {
            if (new_stickynote == true)
            {
                new_stickynote = false
                with (instance_create_layer(mouse_x, mouse_y, "EFFECT", obj_stickynote))
                {
                    other.note_on_mouse = id
                    new_born = true
                }
            }
        }
    }
    if (mouse_check_button_released(mb_left) && new_stickynote == false)
    {
        new_stickynote = true
        note_on_mouse.new_born = false
        if (mx >= 420 && my <= 320)
        {
            writing_stickynote = true
            instance_destroy(obj_input_text)
            var id1 = input_text_create_multiline_ext(450, 220, 375, 220, fontCJK_note, _color_note[current_scene], 1, 375, -1, 4, -1, 0, 0, true, 0)
            input_text_set_enabled(id1, true)
        }
        else
            instance_destroy(note_on_mouse)
    }
    if (writing_stickynote == true)
    {
        draw_set_color(c_black)
        draw_set_alpha(0.5)
        draw_rectangle(0, 0, room_width, room_height, false)
        draw_set_alpha(1)
        draw_set_color(c_white)
        draw_sprite_ext(spr_stickynote_list[current_scene], 0, (room_width / 2), (room_height / 2), 3, 3, 0, c_white, 1)
        if button_collision(460, 476, 886, 520)
        {
            draw_sprite_ext(spr_stickynote_confirm, 0, (room_width / 2), (room_height - 130), 0.7, 0.7, 0, c_white, 1)
            if mc_click
            {
                if (!steam_get_achievement("note_to_self"))
                    steam_set_achievement("note_to_self")
                writing_stickynote = false
                with (note_on_mouse)
                {
                    note = obj_input_text.text_draw
                    instance_destroy(obj_input_text)
                }
            }
        }
        else
            draw_sprite_ext(spr_stickynote_confirm, 0, (room_width / 2), (room_height - 130), 0.7, 0.7, 0, c_white, 0.8)
    }
}
else
    delay_show_stickynote = 0
