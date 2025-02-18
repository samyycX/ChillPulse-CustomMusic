function scr_textBoxStep() //gml_Script_scr_textBoxStep
{
    var ctrlCheck = (os_type == os_macosx ? (keyboard_check(ord("\\")) || keyboard_check(ord("["))) : keyboard_check(vk_control))
    if (!windowFocused)
        ctrlCheck = false
    var keyShift = (keyboard_check(vk_shift) && windowFocused)
    var keyBackspace = (keyboard_check(vk_backspace) && windowFocused)
    var keyHomePressed = (keyboard_check_pressed(vk_home) && windowFocused)
    var keyEndPressed = (keyboard_check_pressed(vk_end) && windowFocused)
    var keyLeft = (keyboard_check(vk_left) && windowFocused)
    var keyRight = (keyboard_check(vk_right) && windowFocused)
    var keyLeftPressed = (keyboard_check_pressed(vk_left) && windowFocused)
    var keyRightPressed = (keyboard_check_pressed(vk_right) && windowFocused)
    var shortcutPaste = (ctrlCheck && keyboard_check_pressed(ord("V")))
    var shortcutCopy = (ctrlCheck && keyboard_check_pressed(ord("C")))
    var shortcutCut = (ctrlCheck && keyboard_check_pressed(vk_f5))
    var shortcutSelectAll = (ctrlCheck && keyboard_check_pressed(ord("A")))
    var shortcutJumpRight = (ctrlCheck && keyRightPressed)
    var shortcutJumpLeft = (ctrlCheck && keyLeftPressed)
    draw_set_font(textFont)
    if (string_length(keyboard_string) > 1)
        keyboard_string = string_char_at(keyboard_string, 1)
    var input = ""
    if (string_length(keyboard_string) > 0 && windowFocused)
        input = keyboard_string
    var paste = false
    if shortcutPaste
    {
        if clipboard_has_text()
        {
            paste = true
            input = clipboard_get_text()
        }
    }
    if (string_length(keyboard_string) == 1 || shortcutPaste)
    {
        if (cursorIndex != highlightIndex)
        {
            var _min = min(cursorIndex, highlightIndex)
            var _max = max(cursorIndex, highlightIndex)
            var deleteLen = _max - _min
            str = string_delete(str, (_min + 1), deleteLen)
            if (cursorIndex < highlightIndex)
            {
                cursorIndex = clamp(cursorIndex, 0, string_length(str))
                highlightIndex = cursorIndex
            }
            else
            {
                highlightIndex = clamp(highlightIndex, 0, string_length(str))
                cursorIndex = highlightIndex
            }
        }
        cursorIndex++
        str = string_insert(input, str, cursorIndex)
        if (string_length(input) > 1)
            cursorIndex += (string_length(input) - 1)
        highlightIndex = cursorIndex
        strToCursor = string_copy(str, 1, cursorIndex)
        cursorX = textX + string_width(strToCursor)
        if (cursorX > (textBoxX + windowWidth))
            xOffset -= string_width(input)
        if windowFocused
            keyboard_string = ""
    }
    if keyBackspace
    {
        var backspaceTimer = os_type == os_macosx
        if (backspaceHold <= backspaceTimer || backspaceHold > 30)
        {
            deleteLen = 0
            _min = min(cursorIndex, highlightIndex)
            _max = max(cursorIndex, highlightIndex)
            deleteLen = _max - _min
            if (os_type == os_windows)
            {
                str = string_delete(str, (_min + 1), deleteLen)
                cursorIndex = _min
                highlightIndex = cursorIndex
            }
            if (deleteLen == 0)
            {
                var strToDel = string_copy(str, cursorIndex, 1)
                str = string_delete(str, cursorIndex, 1)
                cursorIndex--
                highlightIndex = cursorIndex
                if (xOffset < 0 && cursorX < (textBoxX + windowWidth * 0.7))
                    xOffset += string_width(strToDel)
            }
        }
        backspaceHold++
    }
    else
        backspaceHold = 0
    if (keyLeft && (!shortcutJumpLeft) && (!ctrlCheck))
    {
        if (leftArrowHold == 0 || leftArrowHold > 30)
        {
            cursorIndex--
            if (!keyShift)
                highlightIndex = cursorIndex
            if (cursorX < (textBoxX + windowWidth * 0.1))
                xOffset += string_width("A")
        }
        leftArrowHold++
    }
    else
        leftArrowHold = 0
    if (keyRight && (!shortcutJumpRight) && (!ctrlCheck))
    {
        if (rightArrowHold == 0 || rightArrowHold > 30)
        {
            cursorIndex++
            if (!keyShift)
                highlightIndex = cursorIndex
            if (cursorX > (textBoxX + windowWidth * 0.9))
                xOffset -= string_width("A")
        }
        rightArrowHold++
    }
    else
        rightArrowHold = 0
    if mouse_check_button(mb_left)
    {
        if (cursorIndex > highlightIndex && mouse_x > (textBoxX + windowWidth * 0.95))
        {
            if (xOffset > (-((string_width(str) - windowWidth * 0.9))))
                xOffset -= string_width("A")
        }
        else if ((cursorIndex < highlightIndex || cursorX < 0) && mouse_x < (textBoxX + windowWidth * 0.05))
        {
            if (xOffset < 0)
                xOffset += string_width("A")
        }
    }
    if keyHomePressed
    {
        cursorIndex = 0
        xOffset = 0
        if (!keyShift)
            highlightIndex = cursorIndex
    }
    if keyEndPressed
    {
        cursorIndex = string_length(str)
        xOffset = (-((string_width(str) - windowWidth * 0.9)))
        if (!keyShift)
            highlightIndex = cursorIndex
    }
    if shortcutSelectAll
    {
        cursorIndex = 0
        highlightIndex = string_length(str)
        xOffset = 0
    }
    if (shortcutCopy && cursorIndex != highlightIndex)
    {
        _min = min(cursorIndex, highlightIndex)
        _max = max(cursorIndex, highlightIndex)
        clipboard_set_text(string_copy(str, (_min + 1), (_max - _min)))
    }
    if (shortcutCut && cursorIndex != highlightIndex)
    {
        _min = min(cursorIndex, highlightIndex)
        _max = max(cursorIndex, highlightIndex)
        clipboard_set_text(string_copy(str, (_min + 1), (_max - _min)))
        deleteLen = _max - _min
        if (os_type == os_windows)
        {
            str = string_delete(str, (_min + 1), deleteLen)
            cursorIndex = _min
            highlightIndex = cursorIndex
        }
    }
    if shortcutJumpRight
    {
        if (cursorIndex < string_length(str))
            cursorIndex++
        while (scr_isCharLetter(string_char_at(str, cursorIndex)) && cursorIndex < string_length(str))
            cursorIndex++
        if ((cursorIndex + 1) < string_length(str))
        {
            while ((!(scr_isCharLetter(string_char_at(str, (cursorIndex + 1))))) && cursorIndex < string_length(str))
                cursorIndex++
        }
        if (!keyShift)
            highlightIndex = cursorIndex
    }
    if shortcutJumpLeft
    {
        if (cursorIndex > 0)
            cursorIndex--
        while (scr_isCharLetter(string_char_at(str, cursorIndex)) && cursorIndex > 0)
            cursorIndex--
        if ((cursorIndex - 1) > 0)
        {
            while ((!(scr_isCharLetter(string_char_at(str, cursorIndex)))) && cursorIndex > 0)
                cursorIndex--
        }
        if (!keyShift)
            highlightIndex = cursorIndex
    }
    cursorIndex = clamp(cursorIndex, 0, string_length(str))
    highlightIndex = clamp(highlightIndex, 0, string_length(str))
    strToCursor = string_copy(str, 1, cursorIndex)
    strToHighlight = string_copy(str, 1, highlightIndex)
    if (os_type == os_macosx)
    {
        if (keyboard_check_released(ord("[")) || keyboard_check_released(ord("\\")))
        {
            keyboard_key_release(vk_left)
            keyboard_key_release(vk_right)
        }
    }
    xOffset = min(xOffset, 0)
    doubleClickTimer = max((doubleClickTimer - 1), 0)
}

