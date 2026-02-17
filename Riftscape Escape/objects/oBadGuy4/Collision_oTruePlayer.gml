if (bite_timer <= 0 && on_cooldown =false && oPlayerManager.iframes <= 0) {	
	audio_play_sound_at(aBite, x, y, 1, 1, 1, 1, false, 1);
	if (oPlayerManager.dodgeLifeBonus > 0) {
		oPlayerManager.dodgeLifeBonus -= damage;
	} else {
		global.player_health -= damage;
	}
	on_cooldown = true;
	bite_timer = bite_cooldown;
	oPlayerManager.tookDamage = true;
}