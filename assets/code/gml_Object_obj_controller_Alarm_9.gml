if (page_livechat == true)
{
    var url = "http://47.100.210.210:5000/msg/livechatlist"
    get_livechat = http_get(url)
}
alarm[9] = 120
