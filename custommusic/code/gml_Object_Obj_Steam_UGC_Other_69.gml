if (ds_map_find_value(async_load, "event_type") == "ugc_query")
{
    with (Obj_Steam_UGC_Item)
        instance_destroy()
    if ds_map_exists(async_load, "results_list")
    {
        var list = ds_map_find_value(async_load, "results_list")
        var a = 0
        while (a < ds_list_size(list) && a < 4)
        {
            var item_map = ds_list_find_value(list, a)
            with (instance_create_depth(500, (350 + a * 100), depth, Obj_Steam_UGC_Item))
            {
                text = "Item " + string(a)
                item = ds_map_find_value(item_map, "published_file_id")
                handle_preview_file = ds_map_find_value(item_map, "handle_preview_file")
            }
            a++
        }
    }
}
