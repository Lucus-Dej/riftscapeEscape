event_inherited();
shoot_cooldown = irandom_range(10, 110);
shoot_delay = 90;
enemey_hp = 3.5;
enemSpeed = 0.5;
base_speed = enemSpeed;
damage = 12.5;
bullet_speed = 7.5;
searchPlayer();
isDashing = false;
dashDuration = 32;
dashTimer = 0;
if (layer_get_name(layer) != "Flying") {
	layer = layer_get_id("Flying");
}