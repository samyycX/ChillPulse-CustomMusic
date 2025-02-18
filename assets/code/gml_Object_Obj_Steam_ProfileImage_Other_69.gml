if (ds_map_find_value(async_load, "event_type") != "avatar_image_loaded")
    return;
var success = ds_map_find_value(async_load, "success")
if (success == 1)
{
    avatar_sprite = self.steam_image_create_sprite(ds_map_find_value(async_load, "image"))
    steam_set_rich_presence("status", "GameMaker")
    steam_set_rich_presence("connect", "hi there")
    steam_set_rich_presence("yoyogames", "limited")
    steam_request_friend_rich_presence(steam_get_user_steam_id())
}
else
    show_debug_message("Failed to get user avatar")
