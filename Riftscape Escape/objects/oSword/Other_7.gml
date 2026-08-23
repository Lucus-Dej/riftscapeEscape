if (oPlayerManager.hasSwordFate) {
	oPlayerManager.moveSword = false;
	var swordMax = 3+global.playerFate/2;
	for (var i = 0; i < swordMax; i++) {
		var fateSword = instance_create_layer(oTruePlayer.x, oTruePlayer.y, "Instances", oSwordFate);
		oPlayerManager.swordAng += 360/swordMax
		fateSword.swordAng = oPlayerManager.swordAng;
		oPlayerManager.summonedSword++;
	}
	oPlayerManager.moveSword = true;
}
instance_destroy();