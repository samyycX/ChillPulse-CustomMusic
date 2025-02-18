function is_cjk(argument0) //gml_Script_is_cjk
{
    var code = ord(argument0)
    if ((code >= 19968 && code <= 40959) || (code >= 13312 && code <= 19903))
        return true;
    else if (code >= 55360 && code <= 55400)
        return true;
    return false;
}

