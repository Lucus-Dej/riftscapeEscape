// Inherit the parent event
event_inherited();

if (count > 0) {
	count--;
	for (var i = 0; i < count; i++) {
		var spawnIndex = irandom(array_length(spiderArray)-1)
		var spawn = instance_create_layer(x, y, "Instances", spiderArray[spawnIndex])
		spawn.xp = 0;
		spawn.image_xscale = image_xscale - 1.5;
		spawn.image_yscale = image_yscale - 1.5;
		spawn.enemey_hp *= 0.2;
		spawn.damage = damage*0.8;
		spawn.bite_cooldown /= 2;
	}
	
}