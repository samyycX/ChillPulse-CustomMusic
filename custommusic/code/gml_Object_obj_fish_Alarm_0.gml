alarm[0] = 3600
if (scale == 1 && (instance_number(obj_fish) * 10) > instance_number(obj_coin))
    instance_create_layer(x, y, "EFFECT", obj_coin)
