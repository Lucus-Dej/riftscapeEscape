if instance_exists(workerX) {
	claimX = workerX.x;
	claimX2 = workerY.x + 64;
	claimY = workerX.y;
	claimY2 = workerY.y +64;
	width = abs(workerX.x - workerY.x - 64);
	
	evilWallList = ds_list_create();
	with (oEvilWalls) {
		if (x > other.claimX && x < other.claimX2 && y > other.claimY && y < other.claimY2) {
			ds_list_add(other.evilWallList, id);
		}
	}
	with (oSuperwalls) {
		if (x > other.claimX && x < other.claimX2 && y > other.claimY && y < other.claimY2) {
			RoomID = other.RoomID;
		}
		
	}
}
if (isChallenge) {
	var request = getEnemPool(floorID)
	enemArray = array_concat(enemArray, challengeArray)
}