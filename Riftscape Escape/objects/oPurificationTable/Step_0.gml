if (active) {
	if (place_meeting(x, y, oPlayer)) {
		drawDuration = 60;
		if (instance_exists(orb) && keyboard_check(vk_space)) {
			instance_destroy(orb);
			powerDoor(RoomID, true);
			with (oPurificationSpikes) {
				if (RoomID == other.RoomID) {
					prepped = true;
					sprite_index = sBloodySpikes;
				}
			}
		}
	}
	var check = true;
	with (oPurificationSpikes) {
		if (RoomID == other.RoomID) {
			if (!used) {
				check = false;
			}
		}
		if (check) {
			unpowerDoor(RoomID, true);
			oPlayerManager.canDestroyRune = true;
			other.drawDuration = 60;
			other.drawText = "Click On A Rune To Destroy It";
			other.active = false;
			oItemManager.dustCount -= 12;
		}
	}
}
