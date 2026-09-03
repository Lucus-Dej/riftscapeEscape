event_inherited();
shoot_cooldown = irandom_range(10, 110);
shoot_delay = 50;
enemyHP = 6.8;
enemSpeed = 1.5;
baseSpeed = enemSpeed;
damage = 18;
bullet_speed = 6.5;
searchPlayer();
isDashing = false;
dashDuration = 32;
dashTimer = 0;
flying = true;
dashSpeed = 6;
if (layer_get_name(layer) != "Flying") {
	layer = layer_get_id("Flying");
}