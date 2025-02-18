function scr_createTooltip(argument0, argument1, argument2, argument3) //gml_Script_scr_createTooltip
{
    with (obj_tooltip)
    {
        text = argument2
        arrowFacing = argument3
        x = argument0
        y = argument1
        show = true
        if (text != argument2)
            alpha = 0
    }
}

