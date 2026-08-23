event_inherited();
if (brainDead) {
    exit;
}
if (phasePoint1 >=  enemyHP && enraged == false) {
	//enemSpeed -= 0.2;
	enraged = true;
}

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
			if (enraged) {
				ang = point_direction(x, y, oTruePlayer.x, oTruePlayer.y)
			}
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
			if (enraged) {
				enragedAng = point_direction(x, y, oTruePlayer.x, oTruePlayer.y)+45
			}
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