shader_set(shdHit);
shader_set_uniform_f(shader_get_uniform(shdHit, "flash"), flash);

draw_self();

shader_reset();
