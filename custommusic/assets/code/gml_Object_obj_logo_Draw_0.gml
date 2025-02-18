draw_self()
var buttonY = 35
var buttonWidth = sprite_get_width(spr_web)
var buttonRad = buttonWidth * 0.45
var resetX = room_width - buttonWidth
var webX = resetX - buttonWidth * 1.25
var discordX = webX - buttonWidth * 1.25
var mouseoverReset = point_in_circle(mouse_x, mouse_y, resetX, buttonY, buttonRad)
var mouseoverWeb = point_in_circle(mouse_x, mouse_y, webX, buttonY, buttonRad)
var mouseoverDiscord = point_in_circle(mouse_x, mouse_y, discordX, buttonY, buttonRad)
if mouseoverReset
{
    draw_set_alpha((mouse_check_button(mb_left) ? 0.4 : 0.2))
    draw_set_color(c_gray)
    draw_circle(resetX, buttonY, buttonRad, false)
    scr_createTooltip(resetX, (buttonY + buttonRad), "Reset", obj_tooltip.arrowFaceUp)
    if mouse_check_button_released(mb_left)
        room_restart()
}
else if mouseoverWeb
{
    draw_set_alpha((mouse_check_button(mb_left) ? 0.4 : 0.2))
    draw_set_color(c_gray)
    draw_circle(webX, buttonY, buttonRad, false)
    scr_createTooltip(webX, (buttonY + buttonRad), "Visit rezonator.com", obj_tooltip.arrowFaceUp)
    if mouse_check_button_released(mb_left)
        url_open("https://rezonator.com/")
}
else if mouseoverDiscord
{
    draw_set_alpha((mouse_check_button(mb_left) ? 0.4 : 0.2))
    draw_set_color(c_gray)
    draw_circle(discordX, buttonY, buttonRad, false)
    scr_createTooltip(discordX, (buttonY + buttonRad), "Discord", obj_tooltip.arrowFaceUp)
    if mouse_check_button_released(mb_left)
        url_open("https://discord.gg/rmrQv9rzjx")
}
draw_set_alpha(1)
draw_sprite(spr_reset, 0, resetX, buttonY)
draw_sprite(spr_web, 0, webX, buttonY)
draw_sprite(spr_discord, 0, discordX, buttonY)
