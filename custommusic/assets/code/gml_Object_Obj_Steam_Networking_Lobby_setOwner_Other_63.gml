if (ds_map_find_value(async_load, "id") == request)
{
    if ds_map_find_value(async_load, "status")
        steam_lobby_set_owner_id(steam_lobby_get_member_id(ds_map_find_value(async_load, "value")))
}
