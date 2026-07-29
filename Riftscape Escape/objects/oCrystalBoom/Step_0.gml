existance--;
if (existance < 0) {
	instance_destroy();
}
if (oPlayerManager.hasCrystalReality && !shotBeams) {
	shotBeams = true;
	var up = instance_create_layer(x, y, "Instances", oCrystalBombBeam, {dir: 90})
	up.damage = damage;

	var left = instance_create_layer(x, y, "Instances", oCrystalBombBeam, {dir: 180})
	left.damage = damage;

	var down = instance_create_layer(x, y, "Instances", oCrystalBombBeam, {dir: 270})
	down.damage = damage;

	var right = instance_create_layer(x, y, "Instances", oCrystalBombBeam, {dir: 0})
	right.damage = damage;
}