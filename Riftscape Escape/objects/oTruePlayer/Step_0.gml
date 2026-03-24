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

move_and_collide(_xinput * global.player_speed, _yinput * global.player_speed, oEnemy);

var realSpeed = global.player_speed;

hsp = _xinput * realSpeed;
vsp = _yinput * realSpeed;

currentSpeed = point_distance(0, 0, hsp, vsp);

if (global.bullet_cooldown > 0) {
    global.bullet_cooldown--;
}
if ((keyboard_check(vk_space) or mouse_check_button(mb_left)) && global.bullet_cooldown <= 0) {
	global.shot = true;
	if (instance_exists(oMinion)) {
		oMinion.fire = true;
	}
	if (instance_exists(oMinionTime)) {
		oMinionTime.fire = true;
	}
	if (instance_exists(oMinionEssence)) {
		oMinionEssence.fire = true;
	}
	var dir = point_direction(x, y, mouse_x, mouse_y);
	bulletFire(x, y, dir, global.bullet_speed, global.playerDamage, global.chosenBullet, id);
    global.bullet_cooldown = global.bullet_delay;
	if (oItemManager.hasMetalOrb) {
		bulletFire(x, y, dir+35, global.bullet_speed, global.playerDamage*0.4, global.chosenBullet, id);
		bulletFire(x, y, dir-35, global.bullet_speed, global.playerDamage*0.4, global.chosenBullet, id);
	}
}

if (instance_exists(visual)) {
	visual.x = x;
	visual.y = y;
	var ang = point_direction(x, y, mouse_x, mouse_y);
	visual.image_angle = ang;
}
	