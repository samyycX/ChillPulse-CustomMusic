function steam_image_create_sprite@gml_Object_Obj_Steam_ProfileImage_Create_0(argument0) //gml_Script_steam_image_create_sprite@gml_Object_Obj_Steam_ProfileImage_Create_0
{
    var l_dims = steam_image_get_size(argument0)
    if (l_dims == undefined)
        return -1;
    var buff_size = l_dims[0] * l_dims[1] * 4
    var l_cols = buffer_create(buff_size, buffer_fixed, 1)
    var l_ok = steam_image_get_rgba(argument0, l_cols, buff_size)
    if l_ok
    {
        var l_surf = surface_create(l_dims[0], l_dims[1])
        buffer_set_surface(l_cols, l_surf, 0)
        var l_sprite = sprite_create_from_surface(l_surf, 0, 0, l_dims[0], l_dims[1], false, false, 0, 0)
        surface_free(l_surf)
    }
    else
        l_sprite = -1
    buffer_delete(l_cols)
    return l_sprite;
}

var av = steam_get_user_avatar(steam_get_user_steam_id(), 2)
if (av != -1)
    avatar_sprite = steam_image_create_sprite(av)
else
    avatar_sprite = -1
