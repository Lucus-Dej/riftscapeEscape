playerOnCircle = false;
if (doRefund) {
	oPlayerManager.circleTotal = existance/(existanceTot)*oPlayerManager.circleMax;
} else {
	oPlayerManager.circleTotal = 0;
}
if (oPlayerManager.hasCircleThought) {
		oPlayerManager.thoughtCircleFireRateBoost = 0;
	}