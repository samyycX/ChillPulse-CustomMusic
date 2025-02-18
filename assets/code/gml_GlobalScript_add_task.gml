function add_task(argument0, argument1) //gml_Script_add_task
{
    if (argument1 == undefined)
        argument1 = noone
    var task = 
    {
        text: "",
        finish: false
    }

    if (argument1 != noone)
        task.text = argument1.text
    array_push(argument0, task)
}

