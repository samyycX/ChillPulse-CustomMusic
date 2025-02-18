if (ds_map_find_value(async_load, "id") == request)
{
    if ds_map_find_value(async_load, "status")
    {
        var _chat_message_buf = buffer_create(1, buffer_grow, 1)
        buffer_write(_chat_message_buf, buffer_string, ds_map_find_value(async_load, "result"))
        steam_lobby_send_chat_message_buffer(_chat_message_buf)
        buffer_delete(_chat_message_buf)
    }
}
