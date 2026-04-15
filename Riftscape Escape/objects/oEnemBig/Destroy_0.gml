// Inherit the parent event
event_inherited();

for (var i = 0; i < irandom_range(2, 4); i++) {
	var evil = instance_create_layer(x, y, "Instances", oEnemSpider);
	evil.xp = 0;
}