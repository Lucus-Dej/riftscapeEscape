event_inherited();

/*var push = global.player_speed;
var dir = point_direction(x, y, other.x, other.y);
dir = round(dir / 90) * 90;
other.x += lengthdir_x(push, dir);
other.y += lengthdir_y(push, dir);
*/
var push = global.player_speed+8;
var pushX = other.x - x;
var pushY = other.y - y;

if (abs(pushX) > abs(pushY)) {
    other.x += sign(pushX) * push;
} else {
    other.y += sign(pushY) * push;
}
if (oPlayerManager.iframes <= 0) {
	playerTakeDamage(contactDamage);
}