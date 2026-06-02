event_inherited();
if (phasePoint1 >= enemey_hp && enraged == false) {
	enraged = true;
	image_blend = c_aqua;
}
if (brainDead) {
    exit;
}
//path timer reduction
path_timer--;

chargeCooldown -= 0.5;

if (iFrames >= 0) {
	iFrames--;
}


	

if (dragTimer > 0) {
    applyDrag(dragPower, dragDir, oWalls);
    dragTimer--;

    if (dragTimer <= 0) {
        path_timer = 0;
    }
}
if (state == ENEM_STATE.CHASE) {
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
		path_end();
		state = ENEM_STATE.WINDUP;
		attackDelay = 36;
		enemSpeed = 0;
	}
}

if (state == ENEM_STATE.WINDUP) {
	attackDelay--;
	if (attackDelay <= 0) {
		chargeTime = 16;
		state = ENEM_STATE.CHARGE;
		chargeBonus = 3.5;
		contactDamage *= chargeBonus;
		if (enraged) {
			enemSpeed = 16;
		} else {
			enemSpeed = 14;
		}
	}
}
if (state == ENEM_STATE.CHARGE) {
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
		state = ENEM_STATE.RECOVER;
		contactDamage /= chargeBonus;
		chargeBonus = 0;
		enemSpeed = 0;
		path_timer = path_cooldown;
	}
}

if (state == ENEM_STATE.RECOVER) {
	chargeCooldown = chargeDelay;
	enemSpeed = 0.3;
	path_timer = path_cooldown;
	state = ENEM_STATE.CHASE;
}


if (path_timer <= 0 && state == ENEM_STATE.CHASE) {
	path_timer = path_cooldown;
    pathfind(global.Grid, oTruePlayer, enemSpeed, id);
}
