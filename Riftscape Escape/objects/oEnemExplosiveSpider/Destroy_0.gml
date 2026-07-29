// Inherit the parent event
event_inherited();

var boom = instance_create_layer(x, y, "Instances", oExplosiveRuneBoom);
boom.damage = damage*5;
boom.image_xscale += 0.5;
boom.image_yscale += 0.5;