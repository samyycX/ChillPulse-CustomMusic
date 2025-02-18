function scr_debugVars() //gml_Script_scr_debugVars
{
    draw_set_halign(fa_right)
    draw_set_valign(fa_middle)
    draw_set_font(fnt_debug)
    draw_set_color(make_color_rgb(35, 217, 83))
    draw_set_alpha(1)
    var strHeight = string_height("0")
    var debugY = room_height * 0.12
    var debugX = room_width - 10
    draw_text(debugX, debugY, ("textBoxX: " + string(textBoxX)))
    draw_text(debugX, (debugY + strHeight), ("textBoxY: " + string(textBoxY)))
    draw_text(debugX, (debugY + strHeight * 2), ("windowWidth: " + string(windowWidth)))
    draw_text(debugX, (debugY + strHeight * 3), ("windowHeight: " + string(windowHeight)))
    draw_text(debugX, (debugY + strHeight * 5), ("cursorIndex: " + string(cursorIndex)))
    draw_text(debugX, (debugY + strHeight * 6), ("highlightIndex: " + string(highlightIndex)))
    draw_text(debugX, (debugY + strHeight * 7), ("str: " + string(str)))
    draw_text(debugX, (debugY + strHeight * 8), ("strToCursor: " + string(strToCursor)))
    draw_text(debugX, (debugY + strHeight * 9), ("strToHighlight: " + string(strToHighlight)))
    draw_text(debugX, (debugY + strHeight * 10), ("string_char_at cursor: '" + (string(string_char_at(str, cursorIndex))) + "'"))
    draw_text(debugX, (debugY + strHeight * 11), ("drawCursor: " + string(drawCursor)))
    draw_text(debugX, (debugY + strHeight * 12), ("xOffset: " + string(xOffset)))
    draw_text(debugX, (debugY + strHeight * 13), ("clipboard: " + string(clipboard_get_text())))
}

