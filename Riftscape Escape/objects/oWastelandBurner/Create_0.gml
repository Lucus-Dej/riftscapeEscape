event_inherited();
enemey_hp = 1.6;
bite_cooldown = 75;
on_cooldown = false;
bite_timer = bite_cooldown;
enemSpeed = 5.5;
base_speed = enemSpeed;
damage = 12.5;
denyHP = true;
if (layer_get_name(layer) != "Flying") {
	layer = layer_get_id("Flying");
}