draw_self()
var _day = string(current_day)
var _month = string(current_month)
var _year = string(current_year)
var _minute = string(current_minute)
var _hour = string(current_hour)
if (obj_controller.time_format_24 != 1)
{
    if (current_hour > 12)
        _hour = string(current_hour - 12)
}
if (current_minute < 10)
    _minute = "0" + _minute
if (current_hour < 10)
    _hour = "0" + _hour
var _current_time = _hour + ":" + _minute
var _current_date = _year + "/" + _month + "/" + _day
draw_set_font(obj_controller.fontCJK)
draw_set_valign(fa_middle)
draw_set_halign(fa_center)
draw_set_color(0xCCEDFF)
if (obj_controller.time_format_24 != 1)
{
    if (current_hour > 12)
        var ind_am = "pm"
    else
        ind_am = "am"
    draw_text_transformed((x + 22), (y - 5), ind_am, 0.1, 0.1, 0)
    draw_text_transformed((x - 8), y, _current_time, 0.25, 0.25, 0)
}
else
    draw_text_transformed(x, y, _current_time, 0.25, 0.25, 0)
draw_set_color(c_white)
image_index = obj_controller.current_scene
