spr_idle = spr_cat
var spr_idle_name = sprite_get_name(spr_idle)
spr_howl = asset_get_index(spr_idle_name + "_howl")
state = "idle"
spr_idle = obj_controller.pets[obj_controller.current_pet_category_to_save].animals[obj_controller.current_pet_to_save].sprite
