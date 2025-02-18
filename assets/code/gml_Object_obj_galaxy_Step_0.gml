if (instance_number(obj_star) <= 400)
{
    repeat (50)
    {
        _x = random_range(0, room_width)
        _y = random_range(0, room_height)
        instance_create_layer(_x, _y, "PLANET", obj_star)
    }
}
