if (rune == noone) {
	var tempRuneIndex = irandom(array_length(oPlayerManager.validRuneArray)-1);
	var tempRune = oPlayerManager.validRuneArray[tempRuneIndex];
	rune = instance_create_layer(x, y-32, "Items", tempRune);
}