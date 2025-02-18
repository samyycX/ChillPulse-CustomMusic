function scr_surfaceStart() //gml_Script_scr_surfaceStart
{
    clipX = textBoxX
    clipY = textBoxY
    clipWidth = windowWidth
    clipHeight = windowHeight
    if (!surface_exists(clipSurface))
        clipSurface = surface_create(clipWidth, clipHeight)
    surface_set_target(clipSurface)
    draw_clear_alpha(c_black, 0)
}

