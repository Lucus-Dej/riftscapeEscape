realityCheck--;
if (realityCheck < 0 && hasSpawned = false) {
	if (oPlayerManager.hasCrystalReality && chainDistance > 0) {
		chainDistance--;
	if (variable_instance_exists(self, "goUp")) {
		if (goUp && distance_to_object(oWalls) > 64) {
			up = instance_create_layer(x, y+64, "Instances", oChildCrystalEssence)
			up.goUp = goUp;
			up.chainDistance = chainDistance;
		}
	}
	if (variable_instance_exists(self, "goLeft")) {
		if (goLeft && distance_to_object(oWalls) > 64) {
			left = instance_create_layer(x-64, y, "Instances", oChildCrystalEssence)
			left.goLeft = goLeft;
			left.chainDistance = chainDistance;
		}
	}
	if (variable_instance_exists(self, "goDown")) {
		if (goDown && distance_to_object(oWalls) > 64) {
			down = instance_create_layer(x, y-64, "Instances", oChildCrystalEssence)
			down.goDown = goDown;
			down.chainDistance = chainDistance;
		}
	}
	if (variable_instance_exists(self, "goRight")) {
		if (goRight && distance_to_object(oWalls) > 64) {
			right = instance_create_layer(x+64, y, "Instances", oChildCrystalEssence)
			right.goRight = goRight;
			right.chainDistance = chainDistance;
		}
	}
}
hasSpawned = true;
}
if (oPlayerManager.hasCrystalThought && chainDistance <= 0) {
	target = instance_nearest(x, y, oEnemy);
	pathTimer--;
	if (target != noone && instance_exists(target) && pathTimer <= 0) {
		pathfind(global.Grid, target, chaseSpeed, id);
		pathTimer = 10;
	}
}