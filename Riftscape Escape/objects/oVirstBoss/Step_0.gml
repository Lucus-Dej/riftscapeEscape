if (brainDead) {
    exit;
}
if (!alextraLocked && oItemManager.hasAlextraEssence) {
	with (oTruePlayer) {
		lockedTimer = 360;
	}
	alextraLocked = true;
}

if (brainReduction > 0) {
	brainReduction -= 0.5;
	if (brainReduction < 0) {
		brainReduction = 0;
	}
}
shoot_delay = baseShootDelay - brainReduction;
if (shoot_cooldown > 0) {
	shoot_cooldown--;
} else {
	var target = oTruePlayer;
	var dir = point_direction(x, y, target.x, target.y)
	var f = playerBulletFire(x, y, dir, bullet_speed, 5, oVirstBullet, id);
	shoot_cooldown = shoot_delay;
}
flash = max(0, flash - 0.15);
if (oItemManager.hasTorzolEssence) {
	var missingHP = (maxHP -  enemyHP);
	var torzBonus = (missingHP*0.0008);
	 enemyHP += torzBonus;
}
if (!sifterLinked && oItemManager.hasSifterEssence) {
	sifterEssenceDmg = damage*0.05
	var d = point_distance(x, y, oTruePlayer.x, oTruePlayer.y);
	
	if (d <= 128 && instance_exists(oTruePlayer)) {
		var target = instance_nearest(x, y, oTruePlayer);
		var link = instance_create_layer(x, y, "Instances", oEnemyLink);
		link.evil = true;
		sifterLinked = true;
		link.enemyA = id;
		link.enemyB = target.id;
	}
}
