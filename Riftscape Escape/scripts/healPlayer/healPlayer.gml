function healPlayer(_amount, _display = false){
	if (_display) {
		addDamageNumber(312+irandom_range(-3, 3), 64+irandom_range(-3, 3), _amount, c_red, "+", true);
	}
	if (_amount > 0) {
		global.player_health += _amount;
		if (global.player_health > oPlayerManager.hpSoftCap && !oPlayerManager.inOverhealth && !oPlayerManager.overHealthOverheated) {
			oPlayerManager.inOverhealth = true;
		}

	}
}