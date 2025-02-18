function convert_number_to_science(argument0) //gml_Script_convert_number_to_science
{
    if (argument0 >= 1000000)
        score_to_draw = (string(argument0 / 1000000)) + "m"
    else if (argument0 >= 1000)
        score_to_draw = (string(argument0 / 1000)) + "k"
    else
        score_to_draw = string(argument0)
    return score_to_draw;
}

