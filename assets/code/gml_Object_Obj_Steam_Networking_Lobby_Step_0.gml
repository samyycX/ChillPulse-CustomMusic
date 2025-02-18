if (request_lobbies > 0 && --request_lobbies <= 0)
{
    show_debug_message("Requesting lobbies.")
    steam_lobby_list_add_string_filter("game", "steamworks.gml", 0)
    steam_lobby_list_request()
}
while steam_net_packet_receive()
{
    var sender = steam_net_packet_get_sender_id()
    steam_net_packet_get_data(inbuf)
    buffer_seek(inbuf, buffer_seek_start, 0)
    var index = buffer_read(inbuf, buffer_u8)
    switch index
    {
        case (10 << 0):
            if (rtt_time > 0)
            {
                ds_list_add(rtt_list, (current_time - rtt_time))
                if (ds_list_size(rtt_list) > 10)
                    ds_list_delete(rtt_list, 0)
                var n = ds_list_size(rtt_list)
                rtt_curr = 0
                for (var i = 0; i < n; i++)
                    rtt_curr += ds_list_find_value(rtt_list, i)
                rtt_curr /= n
            }
            rtt_time = current_time
            buffer_seek(outbuf, buffer_seek_start, 0)
            buffer_write(outbuf, buffer_u8, (10 << 0))
            steam_net_packet_send(sender, outbuf)
            break
        case (11 << 0):
            show_debug_message("Got a greet!")
            break
        case (12 << 0):
            var Color = buffer_read(inbuf, buffer_u32)
            var X = buffer_read(inbuf, buffer_u16)
            var Y = buffer_read(inbuf, buffer_u16)
            var ins = instance_create_depth(X, Y, 0, Obj_Steam_Networking_Circle)
            ins.image_blend = Color
            break
        default:
            show_debug_message("Unknown packet.")
            break
    }

}
