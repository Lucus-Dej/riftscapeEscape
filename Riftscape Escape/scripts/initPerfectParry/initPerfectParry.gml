function initPerfectParry(){
	if (oPlayerManager.overhealthSuperTimer > 0) {
		oPlayerManager.overhealthSuperTimer /= 2;
	}
	oPlayerManager.swordTotal = oPlayerManager.swordMax;
}