event_inherited();
shoot_cooldown = irandom_range(10, 110);
shoot_delay = 110;
enemyHP = 2.3;
enemSpeed = 0.5;
baseSpeed = enemSpeed;
damage = 10.5;
bullet_speed = 6.5;
searchPlayer();
isDashing = false;
dashDuration = 32;
dashTimer = 0;
dashSpeed = 4.2;
dashDir = 0;
flying = true;
if (layer_get_name(layer) != "Flying") {
	layer = layer_get_id("Flying");
}
maxDist = 256;
if (global.difficulty >= 4) {
	shoot_delay = 20;
	dashDuration = 20;
	dashSpeed = 8;
	damage = 15;
	show_debug_message("EVIL MODE ACTIVATED")
}