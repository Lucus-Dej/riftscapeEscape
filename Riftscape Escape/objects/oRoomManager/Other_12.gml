if instance_exists(workerX) {
	claimX = workerX.x;
	claimX2 = workerY.x;
	claimY = workerX.y;
	claimY2 = workerY.y;
	global.Grid = mp_grid_create(claimX,claimY, (claimX2 - claimX)/ 32, (claimY2-claimY)/32, 32, 32);
	mp_grid_add_instances(global.Grid, oColl, true);
	global.flyGrid = mp_grid_create(claimX,claimY, (claimX2 - claimX)/ 32, (claimY2-claimY)/32, 32, 32);
	mp_grid_add_instances(global.flyGrid, oIndestructable, true);
	with (oSuperwalls) {
		if (x > other.claimX && x < other.claimX2 && y > other.claimY && y < other.claimY2) {
			RoomID = other.RoomID;
		}
		
	}
}
