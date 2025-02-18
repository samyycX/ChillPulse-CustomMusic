function letter_send_request() //gml_Script_letter_send_request
{
    var url = "http://47.100.210.210:5000/msg/letterrequestnew"
    get = http_post_string(url, ("playername=" + steamid + "&messagesend=letterrequest"))
    state_reply = "request_pending"
    english_letter = false
}

