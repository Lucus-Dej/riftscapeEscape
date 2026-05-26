// Inherit the parent event
event_inherited();

if (count > 0) {
	count--;
	for (var i = 0; i < count; i++) {
		var spawn = instance_create_layer(x, y, "Instances", oEnemRifterSpider)
		spawn.xp = 0;
		spawn.image_xscale = image_xscale - 0.1;
		spawn.image_yscale = image_yscale - 0.1;
		spawn.enemey_hp*=0.4;
		spawn.count = count;
		spawn.damage = damage*0.8;
	}
	
}