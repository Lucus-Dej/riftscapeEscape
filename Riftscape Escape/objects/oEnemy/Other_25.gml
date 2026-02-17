if (doTick) {
	dotCooldown = dotDelay; 
	if (dotTicks > 0) {
		dotDelay--;
		if (dotDelay < 0) {
			self.enemey_hp -= dotDamage;
			dotTicks--;
			dotDelay = dotCooldown;
		}
	}
	if (self.enemey_hp <= 0) {
		instance_destroy(self)
	}
}