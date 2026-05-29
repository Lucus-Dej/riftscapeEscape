event_inherited();
if (oPlayerManager.iframes <= 0) {
	global.player_health -= contactDamage;
	oPlayerManager.tookDamage = true;
	oPlayer.flash = 2;
	var push = global.player_speed+4;
var dir = point_direction(x, y, other.x, other.y);
other.x += lengthdir_x(push, dir);
other.y += lengthdir_x(push, dir);
}
