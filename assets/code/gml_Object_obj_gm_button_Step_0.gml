if locked
{
    image_index = 2
    return;
}
if point_in_rectangle(mouse_x, mouse_y, bbox_left, bbox_top, bbox_right, bbox_bottom)
{
    image_index = 1
    if mouse_check_button_pressed(mb_left)
        image_index = 0
}
else
    image_index = 0
