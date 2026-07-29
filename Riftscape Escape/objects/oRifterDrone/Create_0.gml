event_inherited();
shoot_cooldown = irandom_range(10, 110);
shoot_delay = 24;
 enemyHP = 5.5;
enemSpeed = 0.4;
baseSpeed = enemSpeed;
damage = 17.5;
bullet_speed = 6.5;
searchPlayer();
isDashing = false;
dashDuration = 24;
dashTimer = 0;
flying = true;
if (layer_get_name(layer) != "Flying") {
	layer = layer_get_id("Flying");
}