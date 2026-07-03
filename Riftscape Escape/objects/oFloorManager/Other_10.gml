// play room/floor clear/ give rewards
if (floorState == genState.done && !floorCompleteFlag) {
	var check = true;
	for (var i = 0; i < array_length(roomManagerArray); i++) {
		var rmMnger = roomManagerArray[i];
		if (!rmMnger.combatFinished) {
			check = false;
			show_debug_message(rmMnger.RoomID)
			break;
		}
	}
	if (check) {
		floorCompleteFlag = true;
		audio_play_sound(aFloorClear, 2, false, global.sfxAudio);

	} else {
		audio_play_sound(aRoomClear, 2, false, global.sfxAudio);
	}
} 