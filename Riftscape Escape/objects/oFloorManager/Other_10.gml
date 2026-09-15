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
		if (!global.meta.challenges.gotItemGenStone) {
			var highestDoorCheck = 0;
			var doorArray = [];
			with (oGhostBarrier) {
				array_push(doorArray, playerHit)
			}
			for (var i = 0; i < array_length(doorArray); i++) {
				var tempCount = doorArray[i];
				if (tempCount > highestDoorCheck) {
					highestDoorCheck = tempCount;
				} 
				show_debug_message("CURRENT CHECK IS "+string(tempCount))
				show_debug_message("CURRENT HIGHEST IS "+string(highestDoorCheck))
			}
			if (highestDoorCheck < 2) {
				showChallenge("gotItemGenStone");
				global.meta.challenges.gotItemGenStone = true;
			}
		}

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