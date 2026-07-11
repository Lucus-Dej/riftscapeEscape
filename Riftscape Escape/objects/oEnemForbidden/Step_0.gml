event_inherited();
if (brainDead) {
    exit;
}

path_timer--;
if (!canSeePlayer) {
	enemSpeed = base_speed;
} else if (canSeePlayer) {
	enemSpeed = 0;
}
// countdown
if (shoot_cooldown > 0 && canSeePlayer) {
    shoot_cooldown--;
}


// fire when ready
if (shoot_cooldown <= 0) {
	var dist = point_distance(x, y, oTruePlayer.x, oTruePlayer.y);
	var tth = dist/bullet_speed;
	var futureX = oTruePlayer.x + oTruePlayer.hsp*tth*0.2;
	var futureY = oTruePlayer.y + oTruePlayer.vsp*tth*0.2;
	var dir = point_direction(x, y,futureX, futureY);

	var bullet = bulletFire(x, y, dir, bullet_speed, damage, oBossBullet, id);

	
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
var l = irandom(750)
if (isBoss) {
	l = irandom(750/cooldownMult)
}

if (l == 1) {
	var spawn = instance_create_layer(x, y, "Instances", oEnemSpider);
	if (isBoss) {
		spawn.base_speed += 0.2;
		spawn.maxHP -= 0.5;
		
	}
	spawn.xp = 0;
}