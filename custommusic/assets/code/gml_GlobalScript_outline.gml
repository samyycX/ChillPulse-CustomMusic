function outline_create(argument0) //gml_Script_outline_create
{
    upixelH = shader_get_uniform(argument0, "pixelH")
    upixelW = shader_get_uniform(argument0, "pixelW")
    texelW = texture_get_texel_width(sprite_get_texture(sprite_index, 2))
    texelH = texture_get_texel_height(sprite_get_texture(sprite_index, 2))
}

function outline_draw(argument0) //gml_Script_outline_draw
{
    shader_set(argument0)
    shader_set_uniform_f(upixelW, texelW)
    shader_set_uniform_f(upixelH, texelH)
    draw_sprite_ext(sprite_index, 0, x, y, (dir * image_xscale * scale), (1 * scale), 0, c_white, 1)
    shader_reset()
}

