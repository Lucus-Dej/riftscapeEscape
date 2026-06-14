function spawnEnemViaEgg(_existance, _enemy, _isBoss, _isChallenge, _rID, _mnger, _spwnr){
	audio_listener_position(x, y, 0);
	audio_play_sound_at(aPortalOpen, _spwnr.x, _spwnr.y, 0, 1, 1, 1, false, 0, global.sfxAudio)
	var egg = instance_create_layer(_spwnr.x, _spwnr.y, "Instances", oEnemPortalEgg, {
		Spawner: _spwnr, bossEgg: _isBoss, challengeEgg: _isChallenge, RoomID: _rID, Manager: _mnger, enemHatchling: _enemy, existance: _existance})
}