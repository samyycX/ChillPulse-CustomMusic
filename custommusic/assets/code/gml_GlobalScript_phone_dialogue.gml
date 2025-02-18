function phone_dialogue() //gml_Script_phone_dialogue
{
    if (current_language == 0)
        scene_1_eng()
    else if (current_language == 1)
        scene_1_cn()
    else if (current_language == 2)
        scene_1_jap()
    else if (current_language == 3)
        scene_1_tc()
    else
        scene_1_eng()
}

