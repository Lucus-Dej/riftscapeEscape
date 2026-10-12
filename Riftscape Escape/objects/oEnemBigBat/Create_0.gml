event_inherited();
shoot_cooldown = irandom_range(10, 110);
shoot_delay = 140;
enemyHP = 4.2;
enemSpeed = 0.5;
baseSpeed = enemSpeed;
damage = 17.5;
bullet_speed = 6.5;
searchPlayer();
isDashing = false;
dashDuration = 80;
dashTimer = 0;
dashSpeed = 3.8;
dashDir = 0;
flying = true;
if (layer_get_name(layer) != "Flying") {
	layer = layer_get_id("Flying");
}
image_xscale += 1;
image_yscale += 1;
if (global.difficulty >= 4) {
	dashSpeed = 4.4;
	shoot_delay = 70;
	dashDuration = 35;
	damage = 22.5;
}