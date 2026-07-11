event_inherited();

if (swap) {
	if (oPlayerManager.iframes <= 0) {
		playerTakeDamage(contactDamage);
		var push = global.player_speed+sprite_width/2;
		var dir = point_direction(x, y, other.x, other.y);
		other.x += lengthdir_x(push, dir+global.player_speed);
		other.y += lengthdir_x(push, dir+global.player_speed);
	}
}

