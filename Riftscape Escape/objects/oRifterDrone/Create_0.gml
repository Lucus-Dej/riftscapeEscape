event_inherited();
shoot_cooldown = irandom_range(10, 110);
shoot_delay = 24;
enemey_hp = 5.5;
enemSpeed = 0.4;
base_speed = enemSpeed;
damage = 17.5;
bullet_speed = 6.5;
searchPlayer();
isDashing = false;
dashDuration = 24;
dashTimer = 0;
if (layer_get_name(layer) != "Flying") {
	layer = layer_get_id("Flying");
}