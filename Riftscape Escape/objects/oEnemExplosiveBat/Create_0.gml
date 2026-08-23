event_inherited();
shoot_cooldown = irandom_range(10, 110);
shoot_delay = 30;
 enemyHP = 1.8;
enemSpeed = 0.8;
baseSpeed = enemSpeed;
damage = 10.5;
bullet_speed = 4.5;
searchPlayer();
isDashing = false;
dashDuration = 48;
dashTimer = 0;
flying = true;
if (layer_get_name(layer) != "Flying") {
	layer = layer_get_id("Flying");
}