event_inherited();
if (brainDead) {
    exit;
}


path_timer--;

if (!canSeePlayer) {
	enemSpeed = base_speed*1.5;
} else if (canSeePlayer) {
	enemSpeed = base_speed;
}
// countdown
if (shoot_cooldown > 0 && canSeePlayer) {
    shoot_cooldown--;
}


// fire when ready
if (shoot_cooldown <= 0) {
	var dist = point_distance(x, y, oTruePlayer.x, oTruePlayer.y);
	var tth = dist/bullet_speed;
	var futureX = oTruePlayer.x + oTruePlayer.hsp*tth*0.8;
	var futureY = oTruePlayer.y + oTruePlayer.vsp*tth*0.8;
	var dir = point_direction(x, y,futureX, futureY);
	if (oPlayerManager.hasCircleTime && oTruePlayer.inCircle) {
		var circdir = point_direction(x, y, mouse_x, mouse_y);
		var bullet = bulletFire(x, y, circdir, bullet_speed, damage, oBadBullet, id);
	} else {
		
	var bullet = bulletFire(x, y, dir, bullet_speed, damage, oBadBullet, id);

	}
    shoot_cooldown = shoot_delay;
}
if (dragTimer > 0) {
    applyDrag(dragPower, dragDir, oWalls);
    dragTimer--;

    if (dragTimer <= 0) {
        path_timer = 0;
    }
}

if (path_timer <= 0) {
	var playerDir = point_direction(x, y, oTruePlayer.x, oTruePlayer.y); 
	image_angle = playerDir+90;
    path_timer = path_cooldown;
    pathfind(global.Grid, oTruePlayer, enemSpeed, id);
}
var l = irandom(shoot_delay*0.5)
if (l == 1) {
	var sand = instance_create_layer(x, y, "Instances", oMiniMummyQuicksand);
	sand.image_xscale = 0.01;
	sand.image_yscale = 0.01;
}