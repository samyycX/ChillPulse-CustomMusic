function string_lettersdigits_universal(argument0) //gml_Script_string_lettersdigits_universal
{
    var last_index = string_length(argument0)
    var result = ""
    for (var i = 1; i <= last_index; i++)
    {
        var t = ord(string_char_at(argument0, i))
        if ((t >= 48 && t <= 57) || (t >= 65 && t <= 90) || (t >= 97 && t <= 122) || t == 181 || (t >= 192 && t <= 214) || (t >= 216 && t <= 246) || (t >= 248 && t <= 255))
            result += string_char_at(argument0, i)
    }
    return result;
}

