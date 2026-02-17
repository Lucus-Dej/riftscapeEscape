function searchPlayer() {

    canSeePlayer = false; 

    if (!instance_exists(oTruePlayer)) {
		return false;
	}

    var hit = collision_line(x, y,oTruePlayer.x, oTruePlayer.y, oSuperwalls, false, true);

    canSeePlayer = (hit == noone);

    return canSeePlayer;
}
