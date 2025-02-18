if (obj_controller.mode_focus == true && obj_controller.light_effect == 1)
{
    layer_enable_fx("background_main", true)
    layer_enable_fx("background_main_christmas", true)
    layer_enable_fx("background_main_halloween", true)
    layer_enable_fx("christmas_tree", true)
    layer_enable_fx("christmas_plants", true)
}
else
{
    layer_enable_fx("background_main", false)
    layer_enable_fx("christmas_tree", false)
    layer_enable_fx("christmas_plants", false)
    layer_enable_fx("background_main_christmas", false)
    layer_enable_fx("background_main_halloween", false)
}
var lay_id = layer_get_id("christmas_tree")
var back = layer_background_get_id(lay_id)
var lay_id2 = layer_get_id("christmas_plants")
var back2 = layer_background_get_id(lay_id2)
if (obj_controller.current_scene == 0 && obj_controller.scene_christmas == 1)
{
    layer_background_visible(back, true)
    layer_background_visible(back2, true)
}
else
{
    layer_background_visible(back, false)
    layer_background_visible(back2, false)
}
