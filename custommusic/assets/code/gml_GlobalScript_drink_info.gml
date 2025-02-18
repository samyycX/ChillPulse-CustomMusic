function drink_info() //gml_Script_drink_info
{
    if (current_language == 0)
        drink_info_eng()
    else if (current_language == 1)
        drink_info_cn()
    else if (current_language == 2)
        drink_info_jap()
    else if (current_language == 3)
        drink_info_tc()
    else if (current_language == 4)
        drink_info_fr()
    else if (current_language == 5)
        drink_info_ru()
    else if (current_language == 6)
        drink_info_ko()
    else if (current_language == 7)
        drink_info_de()
    else if (current_language == 8)
        drink_info_es()
    else if (current_language == 9)
        drink_info_it()
    else if (current_language == 10)
        drink_info_pr()
    if (current_scene == 0)
    {
        mix_menu = [[0, 1, 2], [1, 1, 1], [0, 0, 0], [1, 1, 0], [1, 1, 2], [1, 2, 2], [0, 0, 2], [0, 2, 2], [0, 0, 1], [2, 2, 2]]
        drink_effect = [[12, 30, 50], [8, 50, 30], [15, 40, 60], [10, 30, 45], [12, 55, 35], [5, 60, 40], [13, 35, 55], [18, 50, 30], [7, 45, 65], [20, 30, 55]]
    }
    else if (current_scene == 1)
    {
        mix_menu = [[0, 1, 2], [1, 1, 1], [0, 0, 0], [1, 1, 0], [1, 1, 2], [1, 2, 2], [0, 0, 2], [0, 2, 2], [0, 0, 1], [2, 2, 2]]
        drink_effect = [[10, 30, 20], [12, 20, 25], [15, 25, 15], [8, 40, 30], [10, 35, 10], [20, 10, 40], [18, 15, 35], [25, 5, 45], [7, 50, 25], [25, 5, 45]]
    }
    if (current_scene == 2)
    {
        mix_menu = [[0, 0, 0], [0, 0, 1], [0, 0, 2], [0, 1, 2], [1, 1, 0], [1, 1, 2], [2, 2, 0], [2, 2, 1], [1, 1, 1], [2, 2, 2]]
        drink_effect = [[10, 30, 20], [12, 20, 25], [15, 25, 15], [8, 40, 30], [10, 35, 10], [20, 10, 40], [18, 15, 35], [25, 5, 45], [7, 50, 25], [6, 55, 30]]
    }
    if (current_scene == 3)
    {
        mix_menu = [[0, 0, 0], [0, 0, 1], [0, 0, 2], [0, 1, 2], [1, 1, 1], [1, 1, 0], [1, 1, 2], [2, 2, 1], [2, 2, 0], [2, 2, 2]]
        drink_effect = [[15, 25, 10], [10, 15, 20], [20, 10, 30], [8, 20, 25], [12, 18, 18], [25, 5, 15], [30, 10, 5], [18, 20, 10], [5, 30, 35], [25, 5, 15]]
    }
    if (current_scene == 4)
    {
        mix_menu = [[0, 0, 0], [0, 0, 1], [0, 0, 2], [0, 1, 2], [1, 1, 0], [1, 1, 2], [2, 2, 0], [2, 2, 1], [1, 1, 1], [2, 2, 2]]
        drink_effect = [[10, 30, 20], [12, 20, 25], [15, 25, 15], [8, 40, 30], [10, 35, 10], [20, 10, 40], [18, 15, 35], [25, 5, 45], [7, 50, 25], [6, 55, 30]]
    }
    if (current_scene == 5)
    {
        mix_menu = [[0, 0, 0], [1, 1, 2], [0, 0, 1], [0, 2, 2], [1, 1, 0], [2, 2, 2], [1, 1, 1], [2, 1, 0], [0, 0, 2], [2, 2, 1]]
        drink_effect = [[10, 30, 20], [12, 20, 25], [15, 25, 15], [8, 40, 30], [10, 35, 10], [20, 10, 40], [18, 15, 35], [25, 5, 45], [7, 50, 25], [6, 55, 30]]
    }
}

