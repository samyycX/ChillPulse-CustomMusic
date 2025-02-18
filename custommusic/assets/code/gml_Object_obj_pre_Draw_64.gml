draw_set_color(c_black)
draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false)
draw_set_color(c_white)
draw_sprite_ext(spr_catos_game, 0, (display_get_gui_width() / 2), (display_get_gui_height() / 2), 0.5, 0.5, 0, c_white, alpha)
