event_inherited();
enemey_hp = 5;
shoot_delay = 15;
on_cooldown = false;
bite_timer = shoot_delay;
enemSpeed = 5;
base_speed = enemSpeed;
xp = 0;
host = noone;
damage = 16.5;
contactDamage = damage;
denyHP = true;
image_xscale += 0.5;
image_yscale += 0.5;

if (layer_get_name(layer) != "Flying") {
	layer = layer_get_id("Flying");
}