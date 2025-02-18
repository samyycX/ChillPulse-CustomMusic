if (ds_map_find_value(async_load, "event_type") == "user_encrypted_app_ticket_response_received")
{
    if ds_map_find_value(async_load, "result")
    {
        var ticket_data = ds_map_find_value(async_load, "ticket_data")
        show_debug_message("ticket_data: " + ticket_data)
    }
}
if (ds_map_find_value(async_load, "event_type") == "ticket_response")
{
    if (ds_map_find_value(async_load, "auth_ticket_handle") > 0)
    {
        auth_ticket_handle = ds_map_find_value(async_load, "auth_ticket_handle")
        show_debug_message("Auth ticket can now be used, see buffer index " + string(auth_ticket_buffer))
    }
}
