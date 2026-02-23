if instance_exists(workerX) {
	claimX = workerX.x;
	claimX2 = workerY.x;
	claimY = workerX.y;
	claimY2 = workerY.y;
	width = abs(workerX.x - workerY.x - 64);
	
	evilWallList = ds_list_create();
	with (oEvilWalls) {
		if (x > other.claimX && x < other.claimX2 && y > other.claimY && y < other.claimY2) {
			ds_list_add(other.evilWallList, id);
		}
	}
}