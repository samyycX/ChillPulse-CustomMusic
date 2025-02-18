if (ds_map_find_value(async_load, "event_type") == "leaderboard_download")
{
    if (ds_map_find_value(async_load, "id") == request)
    {
        if ds_map_find_value(async_load, "num_entries")
        {
            var entries = ds_map_find_value(async_load, "entries")
            var map = json_decode(entries)
            if ds_map_exists(map, "default")
            {
                ds_map_destroy(map)
                return;
            }
            else
            {
                var list = ds_map_find_value(map, "entries")
                var len = ds_list_size(list)
                for (var i = 0; i < len; i++)
                {
                    var entry = ds_list_find_value(list, i)
                    with (instance_create_depth(800, (110 + i * 120), 0, Obj_Steam_Leaderboard_Entry))
                    {
                        rank = ds_map_find_value(entry, "rank")
                        score_ = ds_map_find_value(entry, "score")
                        name = ds_map_find_value(entry, "name")
                        userID = ds_map_find_value(entry, "userID")
                        if (!(is_undefined(ds_map_find_value(entry, "data"))))
                        {
                            var buff = buffer_base64_decode(ds_map_find_value(entry, "data"))
                            var level = buffer_read(buff, buffer_u8)
                            var str = buffer_read(buff, buffer_string)
                            data = str + " (" + string(level) + ")"
                        }
                        else
                            data = ""
                    }
                }
            }
            ds_map_destroy(map)
        }
    }
}
