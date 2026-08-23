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
if (oPlayerManager.hasVeribroseRune && !floorCompleteFlag) {
	var check = true;
	for (var i = 0; i < array_length(veribroseLockArray); i++) {
		var rmMnger = veribroseLockArray[i];
		if (!rmMnger.combatFinished) {
			check = false;
			show_debug_message(rmMnger.RoomID)
			break;
		}
	}
	if (check) {
		floorCompleteFlag = true;
		audio_play_sound(aUnlock, 2, false, global.sfxAudio);
		with (oGhostBarrier) {
			if (veribroseRuneLocked && awaitingUnlock) {
				veribroseRuneLocked = false;
				unpowerDoorByID(id);
			} else if (veribroseRuneLocked && !awaitingUnlock) {
				veribroseRuneLocked = false;
			}
		}
	} 
}