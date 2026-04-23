if (brainDead) {
    exit;
}
if (!bossModApplied && isBoss) {
	bossModApplied = true;
	enemey_hp *= hpMult;
	//base_speed *= speedMult;
	//enemSpeed *= speedMult;
	damage *= dmgMult;
	shoot_delay /= cooldownMult;
	event_user(13);
}
//path timer reduction
path_timer--;
if (phasePoint1 >= enemey_hp && enraged == false) {
	//enemSpeed -= 0.2;
	enraged = true;
}

flash = max(0, flash - 0.15);

// countdown
shoot_cooldown--;
// fire when ready, fires default bullet
if (shoot_cooldown <= 0) {
	recoil_timer--;
	if (recoil_timer <= 0) {
		fire_timer --;
		if (fire_timer > 0) {
			var counter = 0;
			if (ang > 360) ang -= 360;
			for (var i = 0; i < 4; i++) {
				bulletFire(x, y, ang, bullet_speed, damage, oMiniBossBullet, id);
				ang += 90;
			}
			recoil_timer = recoil_cooldown;
			
			
			} else {
				if (enraged && !startEnragedLoop) {
				enragedDelay = enragedCooldown-15;
				fire_duration -= 1;
				bullet_speed-= 0.4;
				startEnragedLoop = true;
			}
				shoot_cooldown = shoot_delay;
				recoil_timer = recoil_cooldown;
				fire_timer = fire_duration;
				enemSpeed += 0.015;
		}
		
	}
}

if (enragedDelay > 0 && enraged) {
	enragedDelay--
}

if (enragedDelay <= 0 && enraged) {
	enragedRecoil--;
	if (enragedRecoil <= 0) {
		enragedFireDuration--;
		if (enragedFireDuration > 0) {
			var enragedAng = 45;
			for (var i = 0; i < 4; i++) {
				bulletFire(x, y, enragedAng, bullet_speed, damage, oMiniBossBullet, id);
				enragedAng += 90;
			}
			enragedRecoil = recoil_cooldown;
		} else {
			enragedRecoil = recoil_cooldown;
			enragedFireDuration = fire_duration;
			enragedDelay = shoot_delay;
		}
	}
}
//pathfinding
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