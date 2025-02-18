if (obj_controller.show_human == 1)
{
    with (obj_girl)
    {
        if (ds_map_find_value(event_data, "event_type") == "sprite event")
        {
            switch ds_map_find_value(event_data, "message")
            {
                case "take2":
                    other.x = 345
                    other.y = 285
                    break
                case "take3":
                    other.x = 357
                    other.y = 230
                    break
                case "take4":
                    other.x = 345
                    other.y = 285
                    break
                case "take5":
                    other.x = 276
                    other.y = 328
                    break
                case "happy":
                    instance_create_layer(357, 125, "EFFECT", obj_happiness)
                    break
            }

        }
    }
}
