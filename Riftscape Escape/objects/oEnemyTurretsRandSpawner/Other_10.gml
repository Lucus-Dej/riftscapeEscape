//switch event

if (instance_exists(currentTurret)) {
	instance_destroy(currentTurret);
}
turretIndex = irandom(array_length(turretArray)-1);
currentTurret = turretArray[turretIndex];
var newTurret = instance_create_layer(x, y, "Instances", currentTurret);
currentTurret = newTurret;
newTurret.active = active;
newTurret.RoomID = RoomID;