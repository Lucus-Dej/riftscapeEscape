shader_set(shdHit);
shader_set_uniform_f(shader_get_uniform(shdHit, "flash"), flash);

gpu_push_state();
gpu_set_fog(false, 0,0,0)
draw_self();
gpu_pop_state();

shader_reset();