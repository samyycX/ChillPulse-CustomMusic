draw_set_font(fnt_gm_15)
draw_set_valign(fa_top)
draw_set_halign(fa_left)
var _i = 0
draw_text(50, (100 + _i++ * 30), ("steam_is_cloud_enabled_for_app: " + string(steam_is_cloud_enabled_for_app())))
draw_text(50, (100 + _i++ * 30), ("steam_is_cloud_enabled_for_account: " + string(steam_is_cloud_enabled_for_account())))
draw_text(50, (100 + _i++ * 30), ("steam_get_quota_total: " + string(steam_get_quota_total())))
draw_text(50, (100 + _i++ * 30), ("steam_get_quota_free: " + string(steam_get_quota_free())))
if steam_file_exists("STEAM_REMOTESTORAGE_FILE.txt")
{
    draw_text(50, (100 + _i++ * 30), ("steam_file_size: " + string(steam_file_size("STEAM_REMOTESTORAGE_FILE.txt"))))
    draw_text(50, (100 + _i++ * 30), ("steam_file_persisted: " + string(steam_file_persisted("STEAM_REMOTESTORAGE_FILE.txt"))))
}
_i += 5
draw_text(50, (100 + _i++ * 30), "File list:")
var files = steam_file_get_list()
var i = 0
var len = array_length(files)
while (i < len)
{
    var file = files[i]
    draw_text(50, (100 + _i++ * 30), (file.file_name + " size is " + string(file.file_size)))
    i++
}
