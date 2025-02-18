if (ds_map_find_value(async_load, "id") == request)
{
    if ds_map_find_value(async_load, "status")
    {
        if (ds_map_find_value(async_load, "result") != "")
            steam_lobby_join_id(int64(ds_map_find_value(async_load, "result")))
    }
}
