if (obj_controller.page_customization == 1 && obj_controller.current_page_deco == 2)
{
    if (id == obj_controller.current_fish)
        outline_draw(shader_outlineW)
    else
        draw_sprite_ext(sprite_index, 0, x, y, (dir * image_xscale * scale), (1 * scale), 0, c_white, 1)
}
else
    draw_sprite_ext(sprite_index, 0, x, y, (dir * 0.5 * image_xscale * scale), (0.5 * scale), 0, c_white, 1)
var vx = x - xprevious
if (vx > 0)
    image_xscale = 1 * scale
else if (vx < 0)
    image_xscale = -1 * scale
