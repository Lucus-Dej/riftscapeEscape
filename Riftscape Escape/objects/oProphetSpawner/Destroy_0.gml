if (tempEnem) {
	exit;
}
// Inherit the parent event
event_inherited();

if (count > 0) {
	count--;
	for (var i = 0; i < count; i++) {
		var spawn = instance_create_layer(x, y, "Instances", oMiniProphet)
		spawn.xp = 0;
		spawn. enemyHP *= 0.1;
		spawn.maxHP *= 0.5;
		spawn.image_xscale /= 4;
		spawn.image_yscale /= 4;
	}
	
}