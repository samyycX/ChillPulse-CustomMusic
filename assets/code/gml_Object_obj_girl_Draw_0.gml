var image_speed_1 = 5
image_count_1 += (image_speed_1 / 60)
if (obj_controller.show_human == true)
{
    draw_sprite_ext(spr_base, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha)
    draw_sprite_ext(spr_eyes, image_count_1, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha)
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha)
    if (obj_controller.cloth_buying == true)
    {
        if (obj_controller.current_scene == 0)
            var spr_preview = asset_get_index("spr_girl_modern_base_" + (string(obj_controller.current_cloth_to_buy[obj_controller.current_scene] + 1)))
        if (obj_controller.current_scene == 1)
            spr_preview = asset_get_index("spr_girl_cyberpunk_base_" + (string(obj_controller.current_cloth_to_buy[obj_controller.current_scene] + 1)))
        if (obj_controller.current_scene == 2)
            spr_preview = asset_get_index("spr_girl_china_base_" + (string(obj_controller.current_cloth_to_buy[obj_controller.current_scene] + 1)))
        if (obj_controller.current_scene == 3)
            spr_preview = asset_get_index("spr_girl_bar_base_" + (string(obj_controller.current_cloth_to_buy[obj_controller.current_scene] + 1)))
        if (obj_controller.current_scene == 4)
            spr_preview = asset_get_index("spr_girl_europe_base_" + (string(obj_controller.current_cloth_to_buy[obj_controller.current_scene] + 1)))
        if (obj_controller.current_scene == 5)
            spr_preview = asset_get_index("spr_girl_space_base_" + (string(obj_controller.current_cloth_to_buy[obj_controller.current_scene] + 1)))
        var _alpha = 0.5
        draw_sprite_ext(spr_preview, 0, x, y, image_xscale, image_yscale, image_angle, image_blend, _alpha)
        draw_sprite_ext(spr_eyes, image_count_1, x, y, image_xscale, image_yscale, image_angle, image_blend, _alpha)
    }
}
