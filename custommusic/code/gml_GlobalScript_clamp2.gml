function clamp2(argument0, argument1, argument2) //gml_Script_clamp2
{
    if (argument2 < argument1)
        return 0;
    return clamp(argument0, argument1, argument2);
}

