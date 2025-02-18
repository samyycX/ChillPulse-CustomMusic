if (obj_controller.current_scene != 5)
{
    if (obj_controller.current_weather == "storm")
    {
        count_delay += 0.016666666666666666
        if (count_delay >= next_storm_time)
        {
            lightning = true
            count_delay = 0
            next_storm_time = choose(15, 30)
            audio_play_sound(sd_lightning, 99, false)
        }
    }
}
