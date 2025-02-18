if (obj_controller.current_scene != 5)
{
    if (obj_controller.current_weather == "rain")
    {
        part_emitter_enable(particle_system, emitterrain, true)
        part_emitter_enable(particle_system, emitter_storm, false)
    }
    else if (obj_controller.current_weather == "storm")
    {
        part_emitter_enable(particle_system, emitter_storm, true)
        part_emitter_enable(particle_system, emitterrain, false)
    }
    else
    {
        part_emitter_enable(particle_system, emitter_storm, false)
        part_emitter_enable(particle_system, emitterrain, false)
    }
}
else
{
    part_emitter_enable(particle_system, emitter_storm, false)
    part_emitter_enable(particle_system, emitterrain, false)
}
