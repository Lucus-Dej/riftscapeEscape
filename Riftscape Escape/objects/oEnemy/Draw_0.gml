shader_set(shdHit);
shader_set_uniform_f(shader_get_uniform(shdHit, "flash"), flash);

draw_self();

shader_reset();

if (oItemManager.hasGenStone) {
	draw_healthbar(x-26, y-4-sprite_height/2, x+26, y-8-sprite_height/2, (enemey_hp/maxHP)*100, c_black, c_red, c_red, 0, true, true)
}