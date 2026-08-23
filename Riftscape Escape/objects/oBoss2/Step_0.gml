event_inherited();
if (brainDead) {
    exit;
}
if (phasePoint1 >=  enemyHP && enraged == false) {
	spawnNum -= 150;
	enemSpeed -= 1;
	bullet_speed = 1.5;
	fire_duration = 16;
	shoot_delay = 30;
	recoil_cooldown = 6;
	enraged = true;
	enragedAngle = 1;
}
if (enraged) {
	enragedAngle = irandom_range(0, 359);
}
// countdown
shoot_cooldown--;
// fire when ready, fires default bullet
if (shoot_cooldown <= 0) {
	recoil_timer--;
	if (recoil_timer <= 0) {
		fire_timer --;
		if (fire_timer > 0) {
			if (enraged) {
				bulletAng = enragedAngle;
			} else {
			bulletAng = point_direction(x, y, oTruePlayer.x, oTruePlayer.y);
		}
		bulletFire(x, y, bulletAng, bullet_speed, damage, oMiniBossBullet, id);
	
		recoil_timer = recoil_cooldown;
		} else {
			shoot_cooldown = shoot_delay;
			recoil_timer = recoil_cooldown;
			fire_timer = fire_duration;
			if (enraged)
			bullet_speed += 0.1;
		}
	}
}

spawnCheck = irandom(spawnNum)
if (isBoss) {
	spawnCheck = irandom(spawnNum/cooldownMult)
}

if (spawnCheck == 1) {
	var spawn = instance_create_layer(x, y, "Instances", oEnemSpider);
	if (isBoss) {
		spawn.baseSpeed += 0.2;
		spawn.maxHP -= 0.5;
		
	}
	spawn.xp = 0;
}