event_inherited();
if (brainDead) {
    exit;
}


path_timer--;

/*if (!canSeePlayer) {
	enemSpeed = base_speed*1.5;
} else if (canSeePlayer) {
	enemSpeed = base_speed;
}*/
// countdown
if (shoot_cooldown > 0 && canSeePlayer) {
    shoot_cooldown--;
}


// fire when ready
if (shoot_cooldown <= 0) {
	speedBoost = irandom(shoot_delay*0.25)
	var dist = point_distance(x, y, oTruePlayer.x, oTruePlayer.y);
	var tth = dist/bullet_speed;
	var futureX = oTruePlayer.x + oTruePlayer.hsp*tth*0.6;
	var futureY = oTruePlayer.y + oTruePlayer.vsp*tth*0.6;
	var dir = point_direction(x, y,futureX, futureY);
	if (oPlayerManager.hasCircleTime && oTruePlayer.inCircle) {
		var circdir = point_direction(x, y, mouse_x, mouse_y);
		var bullet = bulletFire(x, y, circdir, bullet_speed, damage, oBadBullet, id);
	} else {
		
	var bullet = bulletFire(x, y, dir, bullet_speed, damage, oBadBullet, id);

	}
    shoot_cooldown = shoot_delay;
}
if (speedBoost > 0) {
	enemSpeed = base_speed + 2;
	speedBoost--;
	if (speedBoost <= 0) {
		enemSpeed = base_speed;
	}
}
if (dragTimer > 0) {
    applyDrag(dragPower, dragDir, oWalls);
    dragTimer--;

    if (dragTimer <= 0) {
        path_timer = 0;
    }
}
if (path_timer <= 0) {
    path_timer = path_cooldown;
    var search = pathfind(global.Grid, oTruePlayer, enemSpeed, id);
	if (!search) {
		respawnTimer--;
	}
}
var l = irandom(shoot_delay*2)
if (l == 1) {
	var sand = instance_create_layer(x, y, "Instances", oSludgerSludge);
	sand.image_xscale = 0.1;
	sand.image_yscale = 0.1;
	if (isBoss) {
		sand.existance *= hpMult*1.5;
	}
}