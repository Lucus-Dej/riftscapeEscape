event_inherited();
shoot_cooldown = irandom_range(10, 110);
shoot_delay = 90;
enemey_hp = 3.5;
enemSpeed = 0.5;
base_speed = enemSpeed;
xp = 6;
damage = 10.5;
bullet_speed = 7.5;
searchPlayer();
spawnWeight = 1.5;
isDashing = false;
dashDuration = 32;
dashTimer = 0;
hasWasp = true;
if (layer_get_name(layer) != "Flying") {
	layer = layer_get_id("Flying");
}
image_speed = 0;
