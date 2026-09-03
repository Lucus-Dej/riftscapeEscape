// Inherit the parent event
event_inherited();
if (contactIframe > 0) {
	contactIframe--;
}

if (!sub)
path_timer--;
var trueSpeed = (enemSpeed + speedBonus)*(tempSlowMult*tempSpeedMult*slowMult);
if (place_meeting(x, y, oCricleOfFate)) {
	trueSpeed*= 0.4;
}
if (path_timer <= 0 && canPathfind && !brainDead) {
    path_timer = path_cooldown;
	var search = pathfind(global.Grid, pathTarget, trueSpeed, id);
	if (flying) {
		search = pathfind(global.flyGrid, pathTarget, trueSpeed, id);
	}
    
	if (!search) {
		respawnTimer--;
	}
}