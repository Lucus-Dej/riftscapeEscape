realityCheck--;
if (realityCheck < 0 && hasSpawned = false) {
	if (oPlayerManager.hasCrystalReality && chainDistance > 0) {
		chainDistance--;
	if (variable_instance_exists(self, "goUp")) {
		if (goUp && distance_to_object(oWalls) > 64) {
			up = instance_create_layer(x, y+64, "Instances", oChildCrystal)
			up.goUp = goUp;
			up.chainDistance = chainDistance;
		}
	}
	if (variable_instance_exists(self, "goLeft")) {
		if (goLeft && distance_to_object(oWalls) > 64) {
			left = instance_create_layer(x-64, y, "Instances", oChildCrystal)
			left.goLeft = goLeft;
			left.chainDistance = chainDistance;
		}
	}
	if (variable_instance_exists(self, "goDown")) {
		if (goDown && distance_to_object(oWalls) > 64) {
			down = instance_create_layer(x, y-64, "Instances", oChildCrystal)
			down.goDown = goDown;
			down.chainDistance = chainDistance;
		}
	}
	if (variable_instance_exists(self, "goRight")) {
		if (goRight && distance_to_object(oWalls) > 64) {
			right = instance_create_layer(x+64, y, "Instances", oChildCrystal)
			right.goRight = goRight;
			right.chainDistance = chainDistance;
		}
	}
}
hasSpawned = true;
}