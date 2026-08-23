event_inherited();

image_xscale = 0.5;
image_yscale = 0.5;
shoot_cooldown = irandom_range(10, 110);
shoot_delay = 140;
enemSpeed = 0.5;
damage = 17.5;
bullet_speed = 6.5;
searchPlayer();
isDashing = false;
dashDuration = 60;
dashTimer = 0;
flying = true;
dashFlashstepX = -1;
dashFlashstepY = -1;
dashSpeed = 4;
dashDir = 0;
path_timer = 15;
path_cooldown = 15;
path = -1;
maxDist = 256;
xp = 0;
if (layer_get_name(layer) != "Flying") {
	layer = layer_get_id("Flying");
}
image_xscale += 1;
image_yscale += 1;