if (obj_controller.page_customization == -1 && obj_controller.page_drink == -1 && obj_controller.page_stickynotes == -1 && obj_controller.mouse_effect == 1 && obj_controller.page_mail == -1 && obj_controller.page_phone == -1 && obj_controller.page_scene == -1)
{
    xTo = room_width / 2 + (mouse_x - room_width / 2) / 20
    yTo = room_height / 2 + (mouse_y - room_height / 2) / 20
}
else
{
    xTo = room_width / 2
    yTo = room_height / 2
}
x += ((xTo - x) / 5)
y += ((yTo - y) / 5)
x = clamp(x, view_w_half, (room_width - view_w_half))
y = clamp(y, view_h_half, (room_height - view_h_half))
x += random_range((-shake_remain), shake_remain)
y += random_range((-shake_remain), shake_remain)
shake_remain = max(0, (shake_remain - 1 / shake_length * shake_magnitude))
view_w_half = camera_get_view_width(cam) / 2
view_h_half = camera_get_view_height(cam) / 2
camera_set_view_pos(cam, (x - view_w_half), (y - view_h_half))
layer_x("far", (x - room_width / 2))
layer_y("far", (y - room_height / 2))
layer_x("background_main", ((x - room_width / 2) / 2))
layer_y("background_main", ((y - room_height / 2) / 2))
layer_x("christmas_plants", ((x - room_width / 2) / 2))
layer_y("christmas_plants", ((y - room_height / 2) / 2))
layer_x("christmas_tree", ((x - room_width / 2) / 2))
layer_y("christmas_tree", ((y - room_height / 2) / 2))
layer_x("background_main_christmas", ((x - room_width / 2) / 2))
layer_y("background_main_christmas", ((y - room_height / 2) / 2))
layer_x("background_main_halloween", ((x - room_width / 2) / 2))
layer_y("background_main_halloween", ((y - room_height / 2) / 2))
layer_x("background_far", (x - room_width / 2))
layer_y("background_far", (y - room_height / 2))
