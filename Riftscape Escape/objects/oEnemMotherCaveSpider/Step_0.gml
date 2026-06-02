event_inherited();
if (brainDead) {
    exit;
}

shoot_cooldown--;
if (shoot_cooldown > 0) {
	var playerDir = point_direction(x, y, oTruePlayer.x, oTruePlayer.y); 
	image_angle = playerDir+90;
	enemSpeed = base_speed;
} 
if (shoot_cooldown < 0) {
	enemSpeed = 0.2;
}
if (shoot_cooldown < -1*shoot_delay/2) {
	shoot_cooldown = irandom(shoot_delay);
}
// countdown
path_timer--;


if (dragTimer > 0) {
    applyDrag(dragPower, dragDir, oWalls);
    dragTimer--;

    if (dragTimer <= 0) {
        path_timer = 0;
    }
}

if (path_timer <= 0) {
    path_timer = path_cooldown;
    pathfind(global.Grid, oTruePlayer, enemSpeed, id);
}