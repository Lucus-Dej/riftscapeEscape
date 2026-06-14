event_inherited();
if (brainDead) {
    exit;
}


path_timer--;
var mouseDist = 999;

if (instance_exists(oMouseTracker)) {
	mouseDist = point_distance(x, y, oMouseTracker.x, oMouseTracker.y);
}
if (mouseDist > 64) {
	enemSpeed = base_speed;
} else {
	if (rageTimer < rageBreak) {
		rageTimer++;
		enemSpeed = 0;
	}
	
}
if (!halfRaged && !fullRaged && rageTimer > rageBreak*0.5) {
	halfRaged = true;
	image_index = 1;
}
if (!fullRaged && rageTimer >= rageBreak) {
	image_index = 2;
	fullRaged = true;
	base_speed += 0.4;
	bullet_speed+= 2;
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
		dir = point_direction(x, y, mouse_x, mouse_y);
	} else {
		var bullet = bulletFire(x, y, dir+20, bullet_speed, damage, oBadBullet, id);
		var bullet1 = bulletFire(x, y, dir, bullet_speed, damage, oBadBullet, id);
		var bullet2 = bulletFire(x, y, dir-20, bullet_speed, damage, oBadBullet, id);
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
}/*
var l = irandom(shoot_delay*0.5)
if (l == 1) {
	var sand = instance_create_layer(x, y, "Instances", oMiniMummyQuicksand);
	sand.image_xscale = 0.1;
	sand.image_yscale = 0.1;
}