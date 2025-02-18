Obj_Steam_UGC_Item_Actions.visible = false
if (request == ds_map_find_value(async_load, "id"))
{
    if ds_map_find_value(async_load, "status")
    {
        show_debug_message("Option: " + (string(ds_map_find_value(async_load, "value"))))
        switch ds_map_find_value(async_load, "value")
        {
            case 1:
                show_debug_message("Item Subscribe")
                steam_ugc_subscribe_item(item)
                break
            case 2:
                show_debug_message("Item Unsubscribe")
                steam_ugc_unsubscribe_item(item)
                if fromSubs
                    instance_destroy()
                break
            case 3:
                show_debug_message("Item Install Info")
                var info_map = ds_map_create()
                var exists = steam_ugc_get_item_install_info(item, info_map)
                if (!exists)
                {
                    show_debug_message("Item needs to be subscribed first")
                    return;
                }
                show_debug_message("Item Install info: " + json_encode(info_map))
                var folder = ds_map_find_value(info_map, "folder")
                var file = file_text_open_read(folder + "/item.txt")
                show_debug_message(file_text_read_string(file))
                file_text_close(file)
                ds_map_destroy(info_map)
                break
            case 4:
                show_debug_message("Item Update Info")
                info_map = ds_map_create()
                exists = steam_ugc_get_item_update_info(item, info_map)
                if (!exists)
                {
                    show_debug_message("Item needs to be subscribed first")
                    return;
                }
                show_debug_message("Update Item Info: " + json_encode(info_map))
                ds_map_destroy(info_map)
                break
            case 5:
                show_debug_message("Item Details")
                steam_ugc_request_item_details(item, 60)
                break
            case 6:
                show_debug_message("Delete Item")
                steam_ugc_delete_item(item)
                instance_destroy()
                break
        }

    }
}
