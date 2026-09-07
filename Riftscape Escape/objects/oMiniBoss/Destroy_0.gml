// Inherit the parent event
event_inherited();

if (tempEnem) {
	exit;
}
if (!sub) {
	var count = irandom_range(3, 6)
	for (var i = 0; i < count; i++) {
		var spawnIndex = irandom(array_length(batArray)-1)
		var spawn = instance_create_layer(x, y, "Instances", batArray[spawnIndex])
		spawn.xp = 0;
		spawn.enemyHP *= 0.2;
		spawn.damage = damage*0.8;
		spawn.shoot_delay /= 2;
	}
	
}
