spd = 0.5
dir = 1
randomize()
alarm[0] = 10
state = "idle"
target = -4
target_x = random_range(400, 526)
target_y = random_range(150, 260)
experience = 0
scale = 0.75
outline_create(shader_outlineW)
if (!steam_get_achievement("first_pin_pal"))
    steam_set_achievement("first_pin_pal")
