if (instance_exists(enemyA)) {
	x = enemyA.x;
	y = enemyA.y;
} else {
	instance_destroy()
}
if (evil) {
	if (evilDmgTimer > 0) {
		evilDmgTimer--;
	} else {
		evilDmgTimer = evilDmgCooldown;
		var dist = point_distance(enemyA.x, enemyA.y, enemyB.x, enemyB.y);
		
		if (dist > 128) {
			
			instance_destroy();
			if (instance_exists(enemyA)) {
				enemyA.sifterLinked = false;
			}
		} else {
			playerTakeDamage(2.5)
		}
	}
} 