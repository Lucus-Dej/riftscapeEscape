if (oPlayerManager.circleThoughtUpgrade && !inCircle) {
	oPlayerManager.circleCooldownBonus = 0;
}
if (instance_exists(oCricleOfFate)) {
	if (!oCricleOfFate.playerOnCircle) {
	inCircle = false;
	}
}
if (!instance_exists(oCricleOfFate)) {
	inCircle = false;
}