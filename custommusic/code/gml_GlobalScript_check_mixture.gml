function check_mixture() //gml_Script_check_mixture
{
    for (var i = 0; i < array_length(mix_menu); i++)
    {
        var _current_menu = mix_menu[i]
        array_sort(_current_menu, true)
        var _current_mix = []
        array_copy(_current_mix, 0, list_mix_drink, 0, 3)
        array_sort(_current_mix, true)
        if array_equals(_current_menu, _current_mix)
        {
            drink_to_make = drink_menu[i]
            drink_to_make_ind = i
            drink_to_make_description = drink_descrip[i]
            return true;
        }
    }
}

