// Inherit the parent event
event_inherited();

var halfWidth = (image_xscale*28) * 0.5;
var lightningCheck = irandom_range(1, 24);
if (lightningCheck + abs(global.playerTime*0.6) >= 24) {
	var f = instance_create_layer(x+random_range(halfWidth, halfWidth*-1), y+random_range(halfWidth, halfWidth*-1), "Flying", oLightningBolt);
	//instance_create_layer(f.x, f.y, "Instances", oBlueprint)
}