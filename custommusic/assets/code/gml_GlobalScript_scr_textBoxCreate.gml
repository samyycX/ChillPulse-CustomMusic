function scr_textBoxCreate(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10) //gml_Script_scr_textBoxCreate
{
    textBoxX = argument0
    textBoxY = argument1
    windowWidth = argument2
    windowHeight = 0
    windowFocused = argument4
    str = argument5
    cursorIndex = (argument4 ? string_length(str) : 0)
    highlightIndex = 0
    strToCursor = ""
    strToHighlight = ""
    leftArrowHold = 0
    rightArrowHold = 0
    backspaceHold = 0
    blinkRate = 30
    drawCursor = true
    alarm[0] = blinkRate
    textX = 0
    textY = 0
    cursorX = 0
    clipSurface = -1
    clipWidth = 0
    clipHeight = 0
    clipX = 0
    clipY = 0
    xOffset = 0
    validDrag = false
    doubleClickTimerFull = 30
    doubleClickTimer = 0
    doubleClick = false
    textFont = argument3
    colorText = argument6
    colorCursor = argument7
    colorHighlight = argument8
    colorBack = argument9
    colorOutline = argument10
}

