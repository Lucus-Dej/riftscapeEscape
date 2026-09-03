array_insert(oTutorialManager.flagArray, flagNum, id);
if (flagNum == 2) {
	with (oRoomManager) {
		oTutorialManager.rmManager = id;
	}
}