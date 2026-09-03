var _right = keyboard_check(vk_right) or keyboard_check(ord("D"));
var _left = keyboard_check(vk_left) or keyboard_check(ord("A"));
var _up = keyboard_check(vk_up) or keyboard_check(ord("W"));
var _down = keyboard_check(vk_down) or keyboard_check(ord("S"));
//audio_listener_position(x, y, 0);
_xinput = _right - _left;
_yinput = _down - _up;

var len = point_distance(0, 0, _xinput, _yinput);
if (len > 0) {
    _xinput /= len;
    _yinput /= len;
}
if (trackerTimer > 0) {
	trackerTimer--;
} else {
	if (ds_queue_size(trackerQueue) > trackerNodeLimit) {
		var tempHead = ds_queue_dequeue(trackerQueue);
		instance_destroy(tempHead)
	}
	trackerTimer = trackerDelay;
	var newNode = instance_create_layer(x, y, "Instances", oPlayerTrailTracker);
	ds_queue_enqueue(trackerQueue, newNode);
}
//move_and_collide(_xinput * global.player_speed, _yinput * global.player_speed, oSuperwalls);\
var realSpeed = global.player_speed+2;

if (instance_exists(oEnemy)) {
	realSpeed = global.player_speed/oPlayerManager.krostRuneDebuff;
}
if (global.playerInvis) {
	realSpeed *= 1.4;
}
var trap = instance_place(x, y, oTurretDOT);
if (trap != noone) {
	if (trap.type == "ice") {
		realSpeed *= 0.4;
	}
}
if (torzPower > 0) {
	var maxSlow = 0.80;
	var multiplier = 1 - maxSlow * (1 - exp(-torzPower * 0.12));
	realSpeed *= multiplier;
}
if (lockedTimer > 0) {
	lockedTimer--;
	realSpeed = 0;
	global.bullet_cooldown = global.bullet_delay
}
hsp = _xinput * realSpeed;
vsp = _yinput * realSpeed;

if (oPlayerManager.hasFirstPRune) {
	var forwardDir = oCamera.direction;
	var sideDir = oCamera.direction-90;
	vsp*=-1
	var move_x = lengthdir_x(vsp, forwardDir) + lengthdir_x(hsp, sideDir);
	var move_y = lengthdir_y(vsp, forwardDir) + lengthdir_y(hsp, sideDir);
	
	if (abs(move_x) < abs(_xinput)) {
		_xinput *= 0.9;
	} else {
		_xinput = move_x;
	}

	if (abs(move_y) < abs(_yinput)) {
		_yinput *= 0.9;
	} else {
		_yinput = move_y;
	}

	_xinput = move_x;
	_yinput = move_y;
	if (is_debug_overlay_open()) {
		move_and_collide(hsp*2, vsp*2, oRoomStartMarker);
	} else {
		move_and_collide(_xinput, _yinput, [oSuperwalls])
	}
	
} else {
	if (is_debug_overlay_open()) {
		move_and_collide(hsp*2, vsp*2, oRoomStartMarker);
	} else if (global.playerCanFly) {
		move_and_collide(hsp, vsp, oIndestructable);
	} else {
		move_and_collide(hsp, vsp, oSuperwalls);
	}
}


currentSpeed = point_distance(0, 0, hsp, vsp);

if (global.bullet_cooldown > 0) {
    global.bullet_cooldown--;
}
if (room == tutorial) {
	if (oItemManager.hasDeal && mouse_check_button(mb_left) && global.bullet_cooldown <= 0) {
		global.shot = true;
		if (instance_exists(oMinion)) {
			oMinion.fire = true;
		}
		if (instance_exists(oMinionFate)) {
			oMinionFate.fire = true;
		}
		if (instance_exists(oMinionEssence)) {
			oMinionEssence.fire = true;
		}
		var dir = point_direction(x, y, mouse_x, mouse_y);
		if (oPlayerManager.hasFirstPRune) {
			dir = oCamera.direction
		}
		playerBulletFire(x, y, dir, global.bullet_speed, global.playerDamage, global.chosenBullet, id);
	    global.bullet_cooldown = global.bullet_delay;
	}
} else {
	if (mouse_check_button(mb_left) && global.bullet_cooldown <= 0) {
		global.shot = true;
		if (instance_exists(oMinion)) {
			oMinion.fire = true;
		}
		if (instance_exists(oMinionFate)) {
			oMinionFate.fire = true;
		}
		if (instance_exists(oMinionEssence)) {
			oMinionEssence.fire = true;
		}
		var dir = point_direction(x, y, mouse_x, mouse_y);
		if (oPlayerManager.hasFirstPRune) {
			dir = oCamera.direction
		}
		playerBulletFire(x, y, dir, global.bullet_speed, global.playerDamage, global.chosenBullet, id);
	    global.bullet_cooldown = global.bullet_delay;
	}
}


if (instance_exists(visual)) {
	visual.x = x;
	visual.y = y;
	var ang = point_direction(x, y, mouse_x, mouse_y);
	if (oPlayerManager.hasFirstPRune) {
		ang = oCamera.direction
	}
	if (lockedTimer <= 0) {
		visual.image_angle = ang;
	}
	if (instance_exists(line)) {
		line.image_angle = ang;
	}
	var drawX = x + lengthdir_x(1024, ang);
	var drawY = y + lengthdir_y(1024, ang);
	var lineCheck = collision_line(x, y, drawX, drawY, oBulletBlocker, false, false);
	if (instance_exists(lineCheck)) {
		nearWallDist = point_distance(x, y, lineCheck.x, lineCheck.y);
	}
}

if (array_length(damageArray) > 0) {
	for (var i = array_length(damageArray) - 1; i >= 0; i--) {
		if (damageTimerArray[i] < dmgRefreshTime) {
			damageTimerArray[i]++;
		} else {
			array_delete(damageTimerArray, i, 1);
			array_delete(damageArray, i, 1);
		}
	}
}

	