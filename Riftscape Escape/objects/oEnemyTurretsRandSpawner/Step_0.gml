event_inherited();
if (!active) exit;
if (passiveSwitch) {
	switchTimer--;
	
	if (switchTimer <= 0) {
		switchTimer = switchCooldown;
		if (instance_exists(currentTurret)) {
			instance_destroy(currentTurret);
		}
		turretIndex = irandom(array_length(turretArray)-1);
		currentTurret = turretArray[turretIndex];
		var newTurret = instance_create_layer(x, y, "Instances", currentTurret);
		currentTurret = newTurret;
	}
}