//path timer reduction
path_timer--;
if (!canSeePlayer) {
	chargeCooldown--;
}
flash = max(0, flash - 0.15);
if (iFrames >= 0) {
	iFrames--;
}

if (enrage_point >= enemey_hp && enraged == false) {
	enraged = true;
}
	

if (dragTimer > 0) {
    applyDrag(dragPower, dragDir, oWalls);
    dragTimer--;

    if (dragTimer <= 0) {
        path_timer = 0;
    }
}
if (state == ENEM_STATE.CHASE) {
	chargeCooldown--;
	if (chargeCooldown <= 0 && instance_exists(oTruePlayer)) {
		chargeTargetX = oTruePlayer.x;
		chargeTargetY = oTruePlayer.y;
		chargeDir = point_direction(x, y, chargeTargetX, chargeTargetY);
		audio_play_sound_at(aPortalOpen, x, y, 0, 0, 0, 0, 0, 1)
		path_end();
		state = ENEM_STATE.WINDUP;
		attackDelay = 36;
		enemSpeed = 0;
	}
}

if (state == ENEM_STATE.WINDUP) {
	attackDelay--;
	if (attackDelay <= 0) {
		chargeTime = 12;
		state = ENEM_STATE.CHARGE;
		
		enemSpeed = 12;
	}
}
if (state == ENEM_STATE.CHARGE) {
	hsp = lengthdir_x(enemSpeed, chargeDir);
	vsp = lengthdir_y(enemSpeed, chargeDir);
	if (!place_meeting(x + hsp, y, oWalls)) {
        x += hsp;
    } else {
        state = ENEM_STATE.RECOVER;
    }
	if (!place_meeting(x, y + vsp, oWall)) {
        y += vsp;
    } else {
        state = ENEM_STATE.RECOVER;
    }
	chargeTime--;
	if (chargeTime <= 0) {
		state = ENEM_STATE.RECOVER;
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
    pathfind(global.Grid, oTruePlayer, enemSpeed);
}
