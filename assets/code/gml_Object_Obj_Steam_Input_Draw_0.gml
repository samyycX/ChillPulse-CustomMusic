draw_set_font(fnt_gm_15)
draw_set_valign(fa_top)
draw_set_halign(fa_left)
var _i = 0
var _x = 50
var _y = 100
var _m = 30
for (_i = 0; _i < array_length(controllers); _i++)
{
    var conhandle = controllers[_i]
    steam_input_activate_action_set(conhandle, action_sets.menu_controls)
    var _cs = ""
    _cs += (string(conhandle) + ", MenuSelect = " + (string(steam_input_get_digital_action_data(conhandle, digital_actions.menu_select))) + " - Xbox A button in this controller -> ")
    var _menu_select_origins = steam_input_get_digital_action_origins(conhandle, action_sets.menu_controls, digital_actions.menu_select)
    var _origin = steam_input_get_action_origin_from_xbox_origin(conhandle, 0)
    var _originsprpath = steam_input_get_glyph_png_for_action_origin(_origin, 0, 0)
    var _originspr = self.ensureSpriteExists(_originsprpath)
    draw_text(_x, (_y + _i * _m), _cs)
    var _csw = string_width(_cs) + 1
    draw_sprite(_originspr, 0, (_x + _csw), (_y + _i * _m))
}
