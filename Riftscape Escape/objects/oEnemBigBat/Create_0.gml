event_inherited();
shoot_cooldown = irandom_range(10, 110);
shoot_delay = 140;
enemyHP = 5.8;
enemSpeed = 0.5;
baseSpeed = enemSpeed;
damage = 10.5;
bullet_speed = 6.5;
searchPlayer();
isDashing = false;
dashDuration = 80;
dashTimer = 0;
flying = true;
if (layer_get_name(layer) != "Flying") {
	layer = layer_get_id("Flying");
}
image_xscale += 1;
image_yscale += 1;