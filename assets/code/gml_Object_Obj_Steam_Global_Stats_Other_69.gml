switch ds_map_find_value(async_load, "event_type")
{
    case "steam_request_global_stats":
        show_debug_message(steam_get_global_stat_int("NumWins"))
        show_debug_message(steam_get_global_stat_real("WalkedDist"))
        show_debug_message(steam_get_global_stat_history_int("NumWins"))
        show_debug_message(steam_get_global_stat_history_real("WalkedDist"))
        break
    case "steam_request_global_achievement_percentages":
        show_debug_message(steam_get_most_achieved_achievement_info())
        break
    case "number_of_current_players":
        if ds_map_find_value(async_load, "success")
        {
            var players = ds_map_find_value(async_load, "players")
            show_debug_message(string(players) + " players are playing this game")
            globalplayers = string(players) + " players"
        }
        else
        {
            show_debug_message("Call to steam_get_number_of_current_players failed")
            globalplayers = "failed"
        }
        break
}

