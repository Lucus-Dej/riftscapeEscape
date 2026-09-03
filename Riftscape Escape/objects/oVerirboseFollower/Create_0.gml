event_inherited();
shoot_cooldown = irandom_range(10, 110);
shoot_delay = 50;
enemyHP = 2.8;
invincible = true;
image_alpha = 0.5;
enemSpeed = 5;
baseSpeed = enemSpeed;
damage = 10.5;
bullet_speed = 6.5;
searchPlayer();
flying = true;
path_cooldown = 5;
if (layer_get_name(layer) != "Flying") {
	layer = layer_get_id("Flying");
}