if (explode && instance_exists(torz)) {
	with (torz) {
		var startingAng = 0;
		var inc = 360/6;
		for (var i = 0; i < 6; i++) {
			if (i == 0 || i == 3) {
				var bullet = bulletFire(x, y, startingAng, bullet_speed, damage, oTorzProjectile, id);
				bullet.canDecel = true;
				bullet.decelRate = 0.04;
				bullet.canExplode = true;
				bullet.explodeObj = oTorzolVines;
				bullet.explodeTimer = 60;
				bullet.canGrow = true;
				bullet.growRate = 0.02;
				bullet.isGhosting = true;
			} else {
				var e = bulletFire(other.x, other.y, startingAng, bullet_speed, damage, oTorzProjectile, id);
			}
			
			startingAng+= inc;
		}
	}
}