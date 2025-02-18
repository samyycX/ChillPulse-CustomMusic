function array_sum(argument0, argument1) //gml_Script_array_sum
{
    var arr = argument0
    var _x = argument1
    var sum = 0
    _x = min(_x, array_length(arr))
    for (var i = 0; i < _x; i++)
        sum += arr[i]
    return sum;
}

