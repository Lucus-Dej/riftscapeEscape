event_inherited();
if (brainDead) {
    exit;
}



/*if (!canSeePlayer) {
	enemSpeed = initalSpeed*1.5;
} else if (canSeePlayer) {
	enemSpeed = initalSpeed;
}*/
// countdown
if (shoot_cooldown > 0 && canSeePlayer) {
    shoot_cooldown--;
}


// fire when ready
if (shoot_cooldown <= 0) {
	speedBoost = shoot_delay*0.25
	var dist = point_distance(x, y, oTruePlayer.x, oTruePlayer.y);
	var tth = dist/bullet_speed;
	var futureX = oTruePlayer.x + oTruePlayer.hsp*tth*0.6;
	var futureY = oTruePlayer.y + oTruePlayer.vsp*tth*0.6;
	var dir = point_direction(x, y,futureX, futureY)
		
	var bullet = bulletFire(x, y, dir, bullet_speed, damage, oBadBullet, id);

    shoot_cooldown = shoot_delay;
	var sand = instance_create_layer(x, y, "Instances", oSludgerSludge);
	sand.image_xscale = 0.1;
	sand.image_yscale = 0.1;
	if (isBoss) {
		sand.existance *= hpMult*1.1;
	}
}
if (speedBoost > 0) {
	enemSpeed = initalSpeed + 2;
	speedBoost -= 0.5;
	if (speedBoost <= 0) {
		enemSpeed = initalSpeed;
	}
}