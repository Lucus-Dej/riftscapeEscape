// Inherit the parent event
if (tempEnem) {
	exit;
}
event_inherited();

var boom = instance_create_layer(x, y, "Instances", oExplosiveRuneBoom);
boom.damage = damage*2.5;
boom.image_xscale += 0.5;
boom.image_yscale += 0.5;// Inherit the parent event


