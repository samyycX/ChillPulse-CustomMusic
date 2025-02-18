var _exception;
function load_game() //gml_Script_load_game
{
    show_debug_message("-------------------------------- loading saved game ---------------------------------")
    show_debug_message(working_directory)
    show_debug_message(program_directory)
    @@try_hook@@(212, 528)
    if file_exists("save.txt")
    {
        real_load_game("save.txt")
        show_debug_message("-----------------------------successfully loaded file----------------------------------")
    }
    else
        show_debug_message("------------------------------- saved file not found -------------------------------")
    @@try_unhook@@()
}

