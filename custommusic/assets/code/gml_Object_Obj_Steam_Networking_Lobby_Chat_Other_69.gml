switch ds_map_find_value(async_load, "event_type")
{
    case "lobby_chat_update":
        var _from_id = ds_map_find_value(async_load, "user_id")
        var _from_name = steam_get_user_persona_name_sync(_from_id)
        if ((ds_map_find_value(async_load, "change_flags")) & 1)
        {
            ds_list_clear(rtt_list)
            rtt_curr = 0
            rtt_time = 0
        }
        break
    case "lobby_chat_message":
        var _msg_index = ds_map_find_value(async_load, "message_index")
        _from_id = ds_map_find_value(async_load, "user_id")
        _from_name = steam_get_user_persona_name_sync(_from_id)
        show_debug_message("A chat message from `" + string(_from_name) + "` (text): " + steam_lobby_get_chat_message_text(_msg_index))
        var _chat_message_buf = buffer_create(1, buffer_grow, 1)
        show_debug_message("Buffer Ok? " + (string(steam_lobby_get_chat_message_data(_msg_index, _chat_message_buf))))
        buffer_seek(_chat_message_buf, buffer_seek_start, 0)
        show_debug_message("A chat message from `" + string(_from_name) + "` (buffer): " + (buffer_read(_chat_message_buf, buffer_text)))
        buffer_delete(_chat_message_buf)
        break
}

