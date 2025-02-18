steam_set_stat_int("NumGames", (steam_get_stat_int("NumGames") + 1))
steam_set_stat_int(stat, (steam_get_stat_int(stat) + 1))
steam_indicate_achievement_progress("ACH_WIN_100_GAMES", steam_get_stat_int(stat), 100)
