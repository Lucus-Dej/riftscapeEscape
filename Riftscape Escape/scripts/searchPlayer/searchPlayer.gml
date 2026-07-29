function searchPlayer() {

    canSeePlayer = false; 

    if (!instance_exists(oTruePlayer) || global.playerInvis) {
		return false;
	}

    var hit = collision_line(x, y,oTruePlayer.x, oTruePlayer.y, oBulletBlocker, false, true);

    canSeePlayer = (hit == noone);

    return canSeePlayer;
}
