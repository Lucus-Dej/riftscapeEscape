event_inherited();
if (phasePoint1 >=  enemyHP && enraged == false) {
	enraged = true;
	slamLimit += 1;
	image_blend = c_aqua;
}

if (brainDead) {
    exit;
}


chargeCooldown -= 0.5;

if (iFrames >= 0) {
	iFrames--;
}


	
if (state == CHARGE_STATE.CHASE) {
	if (canSeePlayer)
		chargeCooldown--;
	if (enraged) {
		chargeCooldown -= 1.5;
	}
	if (chargeCooldown <= 0 && instance_exists(oTruePlayer)) {
		chargeTargetX = oTruePlayer.x;
		chargeTargetY = oTruePlayer.y;
		chargeDir = point_direction(x, y, chargeTargetX, chargeTargetY);
		audio_play_sound(aPortalOpen, 1, 0, global.sfxAudio)
		canPathfind = false;
		path_end();
		state = CHARGE_STATE.WINDUP;
		attackDelay = 36;
		enemSpeed = 0;
	}
}

if (state == CHARGE_STATE.WINDUP) {
	attackDelay--;
	if (attackDelay <= 0) {
		attackDelay = 36;
		chargeTime = 16;
		chargeBonus = 3;
		contactDamage *= chargeBonus;
		state = CHARGE_STATE.CHARGE;
		slamCount++;
		if (enraged) {
			enemSpeed = 16;
		} else {
			enemSpeed = 14;
		}
	}
}
if (state == CHARGE_STATE.CHARGE) {
	hsp = lengthdir_x(enemSpeed, chargeDir);
	vsp = lengthdir_y(enemSpeed, chargeDir);
	if (enraged && isBoss) {
		chargeTime -= 0.75;
	} else if (enraged && !isBoss) {
		chargeTime -= 0.85;
	} else if (!enraged && isBoss) {
		chargeTime -= 0.8;
	} else {
		chargeTime -= 1;
	}
	
	var moved = false;
	var bullet = bulletFire(x, y, irandom_range(0, 359), 0.6, 10, oMiniBossBullet, id);
	bullet.image_yscale -= 0.33;
	bullet.image_xscale -= 0.33;
	bullet.canAccel = true;
	var bounceCheck = irandom_range(1, 10);
	if (bounceCheck == 1) {
		bullet.canBounce = true;
		bullet.bounceTarget = oTruePlayer;
		bullet.tracking = 0.6;
	}
	if (!place_meeting(x + hsp, y + vsp, oIndestructable) && !place_meeting(x + hsp, y + vsp, oAbyss)) {
        x += hsp;
		y += vsp;
		moved = true;
    } else {
        if (!place_meeting(x + hsp, y, oIndestructable) && !place_meeting(x + hsp, y + vsp, oAbyss)) {
			x += hsp;
			moved = true;
		}
		if (!place_meeting(x, y + vsp, oIndestructable) && !place_meeting(x + hsp, y + vsp, oAbyss)) {
			y += vsp;
			moved = true;
		}
	}
	if (chargeTime <= 0 || !moved) {
		if (slamCount >= slamLimit) {
			state = CHARGE_STATE.RECOVER;
			slamCount = 0;
			contactDamage /= chargeBonus;
			chargeBonus = 0;
		} else {
			contactDamage /= chargeBonus;
			chargeBonus = 0;
			state = CHARGE_STATE.WINDUP;
			attackDelay = 18;
			chargeDir = point_direction(x, y, oTruePlayer.x, oTruePlayer.y);
		}
		
		enemSpeed = 0;
		path_timer = path_cooldown;
	}
}

if (state == CHARGE_STATE.RECOVER) {
	canPathfind = true;
	chargeCooldown = chargeDelay;
	enemSpeed = 0.3;
	path_timer = path_cooldown;
	state = CHARGE_STATE.CHASE;
}