function enemyTakeDamage(_dmg, _source) {
	if (instance_exists(_source)) {
		audio_listener_position(oTruePlayer.x, oTruePlayer.y, 0);
		audio_play_sound_at(aBoom, _source.x, _source.y, 0, 1, 1, 1, false, 0, global.sfxAudio)
		if (oItemManager.hasWaterDamagedNote && !_source.hasDamaged) {
			_dmg *= 1.4;
			_source.hasDamaged = true;
		}
		_source.enemey_hp -= _dmg;
		addDamageNumber(_source.x, _source.y, _dmg);
		_source.flash = 1;
	}
	if (_source.enemey_hp <= 0) {
		oPlayerManager.lastKilled = _source
		oPlayerManager.lastKilledX = _source.x;
		oPlayerManager.lastKilledY = _source.y;
		instance_destroy(_source);
		var overkill = _dmg - _source.enemey_hp;
		global.playerKilled = true;
		if (oItemManager.hasHauntedGravestone) {
			var ghost = instance_create_layer(x, y, "Instances", oGravestoneGhost);
		if (oItemManager.hasLostCrown) {
			ghost.damage += overkill*1.2;
		} else {
			ghost.damage += overkill*1.05;
			}
		}
		if (object_index == oSwordLife) {
			if (oPlayerManager.hasSwordThought) {
				oPlayerManager.swordCooldownBonus = 22;
				oPlayerManager.swordCooldownBonusTime = 30;
			}
		}
	}
}
function playerTakeDamage(_dmg) {
	if (oPlayerManager.iframes <= 0) {
		global.player_health -= _dmg;
		oPlayerManager.iframes = oPlayerManager.iframeTotal;
	}
	if (global.player_health <= 0 && !oPlayerManager.inOverhealth) {
		playerDied();
	}
}
function playerKilledEnemy () {
	
}
function playerDied () {
	
}