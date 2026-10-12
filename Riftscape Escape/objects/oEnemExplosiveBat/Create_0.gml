event_inherited();
shoot_cooldown = irandom_range(10, 110);
shoot_delay = 30;
enemyHP = 0.7;
enemSpeed = 0.8;
baseSpeed = enemSpeed;
damage = 10.5;
bullet_speed = 4.5;
dashSpeed = 8;
dashDir = 0;
searchPlayer();
isDashing = false;
dashDuration = 48;
dashTimer = 0;
flying = true;
if (layer_get_name(layer) != "Flying") {
	layer = layer_get_id("Flying");
}
if (global.difficulty >= 4) {
	dashDuration = 26;
	dashSpeed = 11;
	damage = 14;
	shoot_delay = 12;
}