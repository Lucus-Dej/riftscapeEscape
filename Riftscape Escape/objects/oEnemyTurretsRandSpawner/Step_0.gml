event_inherited();
if (!active) exit;
if (passiveSwitch && RoomID != -1) {
	switchTimer--;
	if (oPlayerManager.hasTrapRune) {
		switchTimer--;
	}
	if (switchTimer <= 0 && Manager != noone) {
		show_debug_message("OH MY GOD BRUH")
		switchTimer = switchCooldown;
		if (instance_exists(currentTurret)) {
			instance_destroy(currentTurret);
		}
		turretIndex = irandom(array_length(turretArray)-1);
		currentTurret = turretArray[turretIndex];
		var newTurret = instance_create_layer(x, y, "Instances", currentTurret);
		currentTurret = newTurret;
		newTurret.Manager = Manager;
		newTurret.cooldown = 30;
	}
}