if (tempEnem) {
	exit;
}
// Inherit the parent event
event_inherited();

if (count > 0) {
	count--;
	for (var i = 0; i < count; i++) {
		var spawnIndex = irandom(array_length(spiderArray)-1)
		var spawn = instance_create_layer(x, y, "Instances", spiderArray[spawnIndex])
		spawn.xp = 0;
		spawn.image_xscale = 0.5;
		spawn.image_yscale = 0.5;
		spawn. enemyHP *= 0.2;
		spawn.damage = damage*0.8;
		spawn.shoot_delay /= 2;
	}
	
}