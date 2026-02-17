existance--;
if (existance < 0) {
	instance_destroy();
}
realityCheck--;
if (realityCheck < 0 && hasSpawned = false) {
	if (oPlayerManager.hasCrystalReality) {
	if (variable_instance_exists(self, "goUp")) {
		if (goUp) {
			up = instance_create_layer(x, y+32, "Instances", oChildCrystalEssence)
			up.goUp = goUp;
			up.chainDistance = chainDistance;
		}
	}
	if (variable_instance_exists(self, "goLeft")) {
		if (goLeft) {
			left = instance_create_layer(x-32, y, "Instances", oChildCrystalEssence)
			left.goLeft = goLeft;
			left.chainDistance = chainDistance;
		}
	}
	if (variable_instance_exists(self, "goDown")) {
		if (goDown) {
			down = instance_create_layer(x, y-32, "Instances", oChildCrystalEssence)
			down.goDown = goDown;
			down.chainDistance = chainDistance
		}
	}
	if (variable_instance_exists(self, "goRight")) {
		if (goRight) {
			right = instance_create_layer(x+32, y, "Instances", oChildCrystalEssence)
			right.goRight = goRight;
			right.chainDistance = chainDistance;
		}
	}
}
hasSpawned = true;
}