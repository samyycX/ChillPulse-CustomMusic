function add_current_day_to_tasks() //gml_Script_add_current_day_to_tasks
{
    var _match = false
    for (var i = 0; i < array_length(task_days); i++)
    {
        var _day = task_days[i]
        if (_day[0] == current_year && _day[1] == current_month && _day[2] == current_day)
            _match = true
    }
    if (_match == false)
        array_push(task_days, [current_year, current_month, current_day, [], 0])
}

