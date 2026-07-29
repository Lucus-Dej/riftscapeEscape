existance--;
if (existance < 0) {
	instance_destroy();
}
if (oPlayerManager.hasCrystalReality && !shotBeams) {
	shotBeams = true;
	var up = instance_create_layer(x, y, "Instances", oCrystalBombBeam, {dir: 90})
	up.damage = damage;
	up.image_yscale -= 0.5;

	var left = instance_create_layer(x, y, "Instances", oCrystalBombBeam, {dir: 180})
	left.damage = damage;
	left.image_yscale -= 0.5;

	var down = instance_create_layer(x, y, "Instances", oCrystalBombBeam, {dir: 270})
	down.damage = damage;
	down.image_yscale -= 0.5;

	var right = instance_create_layer(x, y, "Instances", oCrystalBombBeam, {dir: 0})
	right.damage = damage;
	right.image_yscale -= 0.5;
}