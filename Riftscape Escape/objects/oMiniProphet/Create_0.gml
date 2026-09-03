event_inherited();
shoot_cooldown = irandom_range(10, 110);
shoot_delay = 90;
enemyHP = 5.1;
flying = true;
enemSpeed = 0.5;
baseSpeed = enemSpeed;
damage = 10.5;
bullet_speed = 7.5;
searchPlayer();
isDashing = false;
dashDuration = 32;
dashTimer = 0;
hasWasp = true;
if (layer_get_name(layer) != "Flying") {
	layer = layer_get_id("Flying");
}
image_speed = 0;
