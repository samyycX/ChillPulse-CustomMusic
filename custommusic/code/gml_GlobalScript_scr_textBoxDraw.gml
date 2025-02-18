function scr_textBoxDraw() //gml_Script_scr_textBoxDraw
{
    if windowFocused
        scr_debugVars()
    draw_set_font(textFont)
    var strLen = string_length(str)
    var strHeight = string_height("A")
    var textMarginX = 10
    var textMarginY = 10
    textX = floor(textBoxX + textMarginX + xOffset)
    textY = floor(textBoxY + textMarginY)
    windowHeight = strHeight + textMarginY * 2
    var mouseoverWindow = point_in_rectangle(mouse_x, mouse_y, textBoxX, textBoxY, (textBoxX + windowWidth), (textBoxY + windowHeight))
    if mouse_check_button_pressed(mb_left)
    {
        if (mouseoverWindow && (!windowFocused))
        {
            windowFocused = true
            drawCursor = true
            alarm[0] = blinkRate
        }
        else if ((!mouseoverWindow) && windowFocused)
            windowFocused = false
    }
    if mouse_check_button(mb_left)
    {
        var closestCharToMouse = 0
        var minDistToMouse = 999999999
        for (var i = 0; i <= strLen; i++)
        {
            var subStr = string_copy(str, 1, i)
            var subStrX = textX + string_width(subStr)
            var subStrY = textY
            var distToMouse = point_distance(mouse_x, mouse_y, subStrX, subStrY)
            if (distToMouse < minDistToMouse)
            {
                minDistToMouse = distToMouse
                closestCharToMouse = i
            }
        }
        if mouse_check_button_pressed(mb_left)
        {
            validDrag = mouseoverWindow
            if validDrag
                highlightIndex = closestCharToMouse
        }
        if validDrag
            cursorIndex = closestCharToMouse
        if (mouse_check_button_pressed(mb_left) && validDrag && mouseoverWindow)
        {
            if (doubleClickTimer > 0)
                doubleClick = true
            else
                doubleClickTimer = doubleClickTimerFull
        }
    }
    if mouse_check_button_released(mb_left)
    {
        validDrag = true
        if doubleClick
        {
            doubleClick = false
            while (scr_isCharLetter(string_char_at(str, cursorIndex)) && cursorIndex < strLen)
                cursorIndex++
            while (scr_isCharLetter(string_char_at(str, highlightIndex)) && highlightIndex > 0)
                highlightIndex--
            if (cursorIndex < strLen || (!(scr_isCharLetter(string_char_at(str, cursorIndex)))))
                cursorIndex--
        }
    }
    draw_set_alpha(1)
    draw_set_color(colorBack)
    draw_rectangle(textBoxX, textBoxY, (textBoxX + windowWidth), (textBoxY + windowHeight), false)
    scr_surfaceStart()
    draw_set_font(textFont)
    draw_set_color(colorText)
    draw_set_alpha(1)
    draw_set_halign(fa_left)
    draw_set_valign(fa_top)
    draw_text((textX - clipX), (textY - clipY), str)
    cursorX = textX + string_width(strToCursor)
    var cursorY1 = textY
    var cursorY2 = cursorY1 + strHeight
    if windowFocused
    {
        var drawCursorReal = false
        if (drawCursor || keyboard_check(vk_anykey))
            drawCursorReal = true
        if drawCursorReal
        {
            draw_set_color(colorCursor)
            draw_line_width((cursorX - clipX), (cursorY1 - clipY), (cursorX - clipX), (cursorY2 - clipY), 2)
        }
    }
    var drawHighlightRect = (mouse_check_button(mb_left) || cursorIndex != highlightIndex)
    if drawHighlightRect
    {
        var highlightX = textX + string_width(strToHighlight)
        var highlightRectX1 = min(cursorX, highlightX)
        var highlightRectY1 = cursorY1
        var highlightRectX2 = max(cursorX, highlightX)
        var highlightRectY2 = cursorY2
        draw_set_color(colorHighlight)
        draw_set_alpha(0.6)
        draw_rectangle((highlightRectX1 - clipX), (highlightRectY1 - clipY), (highlightRectX2 - clipX), (highlightRectY2 - clipY), false)
        draw_set_alpha(1)
    }
    scr_surfaceEnd()
    draw_set_color(colorOutline)
    if windowFocused
    {
        for (i = 0; i < 3; i++)
            draw_rectangle((textBoxX + i), (textBoxY + i), (textBoxX + windowWidth + i), (textBoxY + windowHeight + i), true)
    }
    else
        draw_rectangle(textBoxX, textBoxY, (textBoxX + windowWidth), (textBoxY + windowHeight), true)
}

