// Inherit the parent event
event_inherited();
if (isBoss)
for (var i = 0; i < irandom_range(1, 2); i++) {
	var evil = instance_create_layer(x, y, "Instances", oEnemSpider);
	evil.xp = 0;
}