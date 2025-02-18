var file = "Screenshot.png"
screen_save(file)
show_debug_message(steam_send_screenshot(file, window_get_width(), window_get_height()))
