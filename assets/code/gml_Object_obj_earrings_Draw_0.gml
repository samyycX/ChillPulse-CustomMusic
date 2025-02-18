if (obj_controller.show_human == true)
{
    if (obj_controller.headwear_buying == true)
        draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, c_white, 0.5)
    else
    {
        sprite_index = real_sprite
        if (obj_controller.current_scene == 1 || obj_controller.current_scene == 5)
            draw_sprite_ext(real_sprite, image_index, x, y, image_xscale, image_yscale, 0, 0xFFCCCE, image_alpha)
        else
            draw_sprite_ext(real_sprite, image_index, x, y, image_xscale, image_yscale, 0, c_white, image_alpha)
    }
}
