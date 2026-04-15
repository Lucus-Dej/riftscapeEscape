if (brainDead) {
    exit;
}
path_timer--;
if (!bossModApplied && isBoss) { 
	bossModApplied = true;
	enemey_hp *= hpMult;
	base_speed *= speedMult;
	enemSpeed *= speedMult;
	damage *= dmgMult;
	shoot_delay /= cooldownMult;
	event_user(13);
}
if (!canSeePlayer) {
	enemSpeed = base_speed;
} else if (canSeePlayer) {
	enemSpeed = 0;
}
// countdown
if (shoot_cooldown > 0 && canSeePlayer) {
    shoot_cooldown--;
}
flash = max(0, flash - 0.15);

// fire when ready
if (shoot_cooldown <= 0) {
	var dist = point_distance(x, y, oTruePlayer.x, oTruePlayer.y);
	var tth = dist/bullet_speed;
	var futureX = oTruePlayer.x + oTruePlayer.hsp*tth*0.2;
	var futureY = oTruePlayer.y + oTruePlayer.vsp*tth*0.2;
	var dir = point_direction(x, y,futureX, futureY);
	if (oPlayerManager.hasCircleTime && oTruePlayer.inCircle) {
		var circdir = point_direction(x, y, mouse_x, mouse_y);
		var bullet = bulletFire(x, y, circdir, bullet_speed, damage, oBossBullet, id);
	} else {
		
	var bullet = bulletFire(x, y, dir, bullet_speed, damage, oBossBullet, id);

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
    path_timer = path_cooldown;
    pathfind(global.Grid, oTruePlayer, enemSpeed, id);
}
var l = irandom(600)
if (isBoss) {
	l = irandom(400)
}

if (l == 1) {
	var spawn = instance_create_layer(x, y, "Instances", oEnemSpider);
	spawn.xp = 0;
}