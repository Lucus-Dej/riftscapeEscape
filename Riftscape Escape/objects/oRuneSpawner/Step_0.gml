if (rune == noone && RoomID != -1) {
	if (array_length(oPlayerManager.validRuneArray) > 0) {
		runeIndex = irandom(array_length(oPlayerManager.validRuneArray)-1);
		var tempRune = oPlayerManager.validRuneArray[runeIndex];
		rune = instance_create_layer(x, y-32, "Instances", tempRune);
		show_debug_message(tempRune)
		rune.host = id;
		rune.index = runeIndex;
		rune.RoomID = RoomID;
		array_delete(oPlayerManager.validRuneArray, runeIndex, 1);
	} else {
		rune = instance_create_layer(x, y -32, "Instances", oDullRune);
		rune.host = id;
		rune.index = runeIndex;
		rune.RoomID = RoomID;
		realRune = false;
	}
	
	
	
}