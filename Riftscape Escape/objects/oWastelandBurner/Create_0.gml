event_inherited();
 enemyHP = 1.6;
bite_cooldown = 75;
on_cooldown = false;
bite_timer = bite_cooldown;
enemSpeed = 5.5;
baseSpeed = enemSpeed;
damage = 25.5;
flying = true;
denyHP = true;
if (layer_get_name(layer) != "Flying") {
	layer = layer_get_id("Flying");
}