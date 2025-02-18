window_set_position(dp_x, dp_y)
window_set_size(dp_w, dp_h)
if (fullscreen == true)
    window_set_showborder(false)
var _right_border = dp_w + dp_x
show_debug_message(_right_border)
show_debug_message(dp_x)
if ((sign(dp_x) != sign(_right_border) && _right_border != 0 && dp_x != 0) || _right_border > display_get_width())
{
    fullscreen = false
    window_set_showborder(true)
    window_set_size(1280, 720)
    window_center()
}
