 if (instance_exists(oEnemy) == false) {

	instance_destroy (oBarrier)
	with (oBossBarrierKey) {
		active = true;
	}
	with (oFlagUpdate) {
		active = true;
	}
}