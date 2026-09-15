if (prepped && !used) {
	var push = global.player_speed+8;
	var pushX = other.x - x;
	var pushY = other.y - y;
	
	if (abs(pushX) > abs(pushY)) {
	    other.x += sign(pushX) * push;
	} else {
	    other.y += sign(pushY) * push;
	}
	if (!used) {
		playerTakeDamage(1);
		if (global.healthPenalty > 0.1) {
			global.healthPenalty -= 0.05;
		} else if (!global.meta.challenges.gotItemSacDagger) {
			global.meta.challenges.gotItemSacDagger = true;
			showChallenge("gotItemSacDagger")
		}
		sprite_index = sRetractedSpikes;
	}
	used = true;
}