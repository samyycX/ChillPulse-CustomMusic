function array_delete_element(argument0, argument1) //gml_Script_array_delete_element
{
    if (argument1 < 0 || argument1 >= array_length(argument0))
        show_error("Index out of bounds", true)
    for (var i = argument1; i < (array_length(argument0) - 1); i++)
        argument0[i] = argument0[(i + 1)]
    array_resize(argument0, (array_length(argument0) - 1))
    return argument0;
}

