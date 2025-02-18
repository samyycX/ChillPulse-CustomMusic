if (ds_map_find_value(async_load, "id") == new_item)
{
    if (ds_map_find_value(async_load, "event_type") == "ugc_create_item")
    {
        var published_file_id = ds_map_find_value(async_load, "published_file_id")
        var updateHandle = steam_ugc_start_item_update(steam_get_app_id(), published_file_id)
        steam_ugc_set_item_title(updateHandle, "My New YoYo-Item! -")
        steam_ugc_set_item_description(updateHandle, "Amazing YoYo-Item -")
        steam_ugc_set_item_visibility(updateHandle, 2)
        var tagArray = ["Single-player", "Multi-player"]
        steam_ugc_set_item_tags(updateHandle, tagArray)
        var itemPath = "itemFolderContent/myItem.png"
        var spr = sprite_duplicate(spr_gm_button)
        sprite_save(spr, 0, itemPath)
        sprite_delete(spr)
        var localFile = "itemFolderContent/item.txt"
        var file = file_text_open_write(localFile)
        file_text_write_string(file, "YoYo-Item")
        file_text_close(file)
        steam_ugc_set_item_content(updateHandle, "itemFolderContent")
        steam_ugc_set_item_preview(updateHandle, itemPath)
        requestId = steam_ugc_submit_item_update(updateHandle, "Version 1.2")
    }
}
if (ds_map_find_value(async_load, "id") == requestId)
{
    if (ds_map_find_value(async_load, "event_type") == "ugc_update_item")
        show_debug_message("steam_ugc_submit_item_update() Result: " + (string(ds_map_find_value(async_load, "result"))))
}
