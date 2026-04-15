if (brainDead) {
    exit;
}
path_timer--;
if (!bossModApplied && isBoss) {
	bossModApplied = true;
	enemey_hp *= hpMult;
	base_speed *= speedMult;
	damage *= dmgMult;
	attackTimer /= cooldownMult;
	shoot_delay /= cooldownMult;
	event_user(13);
}
// countdown
if (shoot_cooldown > 0 && canSeePlayer) {
    shoot_cooldown--;
}
flash = max(0, flash - 0.15);
// enraged
if (phasePoint1 >= enemey_hp && enraged == false) {
	shoot_delay -= 20;
	enraged = true;
	arcAngle +=30;
}


if (attack == 0) {
	if (!canSeePlayer) {
		attack = 2;
	} else {
	attack = irandom_range(1, 3)
	}
	currentArc = arcAngle;
}

if (enraged && distance_to_object(oTruePlayer) < 120) {
	spiralArc += 20;
	bulletFire(x, y, spiralArc, bullet_speed+1, damage, oFireBullet, id);
	if (spiralArc > 360) {
		spiralArc -= 360;
	}
} 
// fire when ready
if (shoot_cooldown <= 0) {
	if (attack == 1 or attack == 2) {
		if (currentArc >= arcAngle*-1) {
			arcFire = point_direction(x, y, oTruePlayer.x, oTruePlayer.y) + currentArc;
			var f = bulletFire(x, y, arcFire, bullet_speed+1.5, damage, oFireBullet, id)
			f.accel = true;
			currentArc -= 15;
			} else {
			shoot_cooldown = shoot_delay;
			attack = 0;
			}
	} else if (attack == 3) {
	// summon attack
	for (var i = 0; i < summonNum; i++) {
		range = irandom_range(-32,32)
		var c = instance_create_layer(x+range, y+range, "Instances", spawnEnemy);
		c.xp = 0;
	}
	attack = 0;
	shoot_cooldown = shoot_delay*2;
	}
}
if (dragTimer > 0) {
    applyDrag(dragPower, dragDir, oWalls);
    dragTimer--;

    if (dragTimer <= 0) {
        path_timer = 0;
    }
}

if (path_timer <= 0) {
    path_timer = path_cooldown;
    pathfind(global.Grid, oTruePlayer, enemSpeed, id);
}