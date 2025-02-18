var _exception;
if (ds_map_find_value(async_load, "id") == send)
{
    if (ds_map_find_value(async_load, "status") == 0)
    {
        @@try_hook@@(196, 252)
        var response_data = ds_map_find_value(async_load, "result")
        show_debug_message("first letter send OK ")
        letter_sent = true
        @@try_unhook@@()
    }
    else
    {
        show_debug_message("first letter send FAILURE！")
        if (letter_sent == false)
            waiting_server = false
    }
}
if (ds_map_find_value(async_load, "id") == get)
{
    if (ds_map_find_value(async_load, "status") == 0)
    {
        @@try_hook@@(1040, 1096)
        response_data = ds_map_find_value(async_load, "result")
        show_debug_message("消息已发送: " + response_data)
        var json_map = json_decode(response_data)
        var _message = ds_map_find_value(json_map, "messagesend")
        var _player = ds_map_find_value(json_map, "playername")
        var _message_eng = ds_map_find_value(json_map, "messagesend_eng")
        var _pid = ds_map_find_value(json_map, "pid")
        originname = _player
        request_letter = _message
        request_letter_eng = _message_eng
        show_debug_message(request_letter)
        show_debug_message(_player)
        show_debug_message(request_letter_eng)
        show_debug_message(_pid)
        state_reply = "receive_letter"
        pid = _pid
        instance_destroy(textbox_reply_mail)
        textbox_reply_mail = input_text_create_multiline_ext(700, 220, 450, 250, fontCJK_letter, 0, 1, 450, -1, 8, -1, 0, 0, true, 0)
        input_text_set_enabled(textbox_reply_mail, true)
        request_pending_cd = 0
        @@try_unhook@@()
    }
    else
        show_debug_message("letter request FAILURE!")
}
if (ds_map_find_value(async_load, "id") == reply)
{
    if (ds_map_find_value(async_load, "status") == 0)
    {
        @@try_hook@@(1372, 1428)
        response_data = ds_map_find_value(async_load, "result")
        show_debug_message("letter reply OK ")
        state_reply = "reply_success"
        reply_count++
        request_pending_cd = 0
        @@try_unhook@@()
    }
    else
        show_debug_message("letter reply FAILURE！")
}
if (ds_map_find_value(async_load, "id") == check)
{
    if (ds_map_find_value(async_load, "status") == 0)
    {
        @@try_hook@@(1704, 1760)
        response_data = ds_map_find_value(async_load, "result")
        show_debug_message("mailbox OK ")
        json_map = json_parse(response_data)
        mailbox = json_map.letter
        @@try_unhook@@()
    }
    else
        show_debug_message("getting mailbox FAILURE！")
}
if (ds_map_find_value(async_load, "id") == report)
{
    if (ds_map_find_value(async_load, "status") == 0)
    {
        @@try_hook@@(2000, 2056)
        response_data = ds_map_find_value(async_load, "result")
        show_debug_message("report OK ")
        state_reply = "report_success"
        @@try_unhook@@()
    }
    else
        show_debug_message("report letter FAILURE！")
}
if (ds_map_find_value(async_load, "id") == report_mailbox)
{
    if (ds_map_find_value(async_load, "status") == 0)
    {
        @@try_hook@@(2296, 2352)
        response_data = ds_map_find_value(async_load, "result")
        show_debug_message("report mailbox OK ")
        state_mailbox = "report_success"
        @@try_unhook@@()
    }
    else
        show_debug_message("report mailbox FAILURE！")
}
if (ds_map_find_value(async_load, "id") == send_livechat)
{
    if (ds_map_find_value(async_load, "status") == 0)
    {
        @@try_hook@@(2668, 2724)
        response_data = ds_map_find_value(async_load, "result")
        show_debug_message("sendlivechat OK ")
        show_debug_message(response_data)
        livechat_fail_count = 0
        if (response_data == "1")
            livechat_state = "wait"
        else
            livechat_state = "error"
        @@try_unhook@@()
    }
    else
        show_debug_message("send livechat FAILURE！")
}
if (ds_map_find_value(async_load, "id") == get_livechat)
{
    if (ds_map_find_value(async_load, "status") == 0)
    {
        @@try_hook@@(3000, 3056)
        response_data = ds_map_find_value(async_load, "result")
        show_debug_message("getlivechat OK ")
        json_map = json_parse(response_data)
        livechatlist = json_map.infos
        @@try_unhook@@()
    }
    else
        show_debug_message("getting livechat FAILURE！")
}
