event_inherited();

if (active) {
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
}

