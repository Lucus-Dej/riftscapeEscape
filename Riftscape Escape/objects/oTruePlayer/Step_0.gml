var _right = keyboard_check(vk_right) or keyboard_check(ord("D"));
var _left = keyboard_check(vk_left) or keyboard_check(ord("A"));
var _up = keyboard_check(vk_up) or keyboard_check(ord("W"));
var _down = keyboard_check(vk_down) or keyboard_check(ord("S"));

_xinput = _right - _left;
_yinput = _down - _up;

var len = point_distance(0, 0, _xinput, _yinput);

if (len > 0) {
    _xinput /= len;
    _yinput /= len;
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
if (lockedTimer > 0) {
	lockedTimer--;
	realSpeed = 0;
	global.bullet_cooldown = global.bullet_delay
}
hsp = _xinput * realSpeed;
vsp = _yinput * realSpeed;
if (is_debug_overlay_open()) {
	move_and_collide(hsp*2, vsp*2, oAbilityGive);
} else if (global.playerCanFly) {
	move_and_collide(hsp, vsp, oIndestructable);
} else {
	move_and_collide(hsp, vsp, oSuperwalls);
}


currentSpeed = point_distance(0, 0, hsp, vsp);

if (global.bullet_cooldown > 0) {
    global.bullet_cooldown--;
}
if ((keyboard_check(vk_space) or mouse_check_button(mb_left)) && global.bullet_cooldown <= 0) {
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
	
	playerBulletFire(x, y, dir, global.bullet_speed, global.playerDamage, global.chosenBullet, id);
    global.bullet_cooldown = global.bullet_delay;
}

if (instance_exists(visual)) {
	visual.x = x;
	visual.y = y;
	var ang = point_direction(x, y, mouse_x, mouse_y);
	if (lockedTimer <= 0) {
		visual.image_angle = ang;
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

	