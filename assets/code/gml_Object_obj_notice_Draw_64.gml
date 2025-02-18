var cx = display_get_gui_width() / 2
var cy = display_get_gui_height() / 2 - 50
var mc_click = mouse_check_button_pressed(mb_left)
draw_set_alpha(0.85)
draw_set_color(c_black)
draw_roundrect((cx - 350), (cy - 250), (cx + 350), (cy + 300), false)
draw_set_color(c_white)
draw_set_alpha(1)
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_text_ext_transformed((cx - 300), (cy - 200), text, 100, 2000, 0.3, 0.3, 0)
if button_collision(905, 85, 950, 130)
{
    draw_sprite_ext(spr_add, 0, 930, 110, 1.7, 1.7, 45, c_white, 1)
    if mc_click
        instance_destroy()
}
else
    draw_sprite_ext(spr_add, 0, 930, 110, 1.5, 1.5, 45, c_white, 1)
