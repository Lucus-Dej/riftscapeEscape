event_inherited();
if (brainDead) {
    exit;
}

if (instance_exists(oTruePlayer) && ds_queue_size(oTruePlayer.trackerQueue) > 0) {
	enemSpeed = global.player_speed;
    pathTarget = ds_queue_head(oTruePlayer.trackerQueue);
}
/*
if (!canSeePlayer || point_distance(x, y, oTruePlayer.x, oTruePlayer.y) > 256) {
	enemSpeed = initalSpeed*4.2;
} else if (canSeePlayer) {
	enemSpeed = initalSpeed;
} */
// countdown
if (shoot_cooldown > 0) {
  //  shoot_cooldown--;
}


// fire when ready
if (shoot_cooldown <= 0) {
	var dist = point_distance(x, y, oTruePlayer.x, oTruePlayer.y);
	var tth = dist/bullet_speed;
	var futureX = oTruePlayer.x + oTruePlayer.hsp*tth*0.7;
	var futureY = oTruePlayer.y + oTruePlayer.vsp*tth*0.7;
	var dir = point_direction(x, y,futureX, futureY);
		
		
	var bullet = bulletFire(x, y, dir+20, bullet_speed, damage, oBadBullet, id);
	var bullet1 = bulletFire(x, y, dir-20, bullet_speed, damage, oBadBullet, id);
	bullet.existance /= 2;
	bullet1.existance /= 2;
	with (bullet) {
		if (layer_get_name(layer) != "Flying") {
			layer = layer_get_id("Flying");
		}
	}
	with (bullet1) {
		if (layer_get_name(layer) != "Flying") {
			layer = layer_get_id("Flying");
		}
	}
	bullet.isGhost = true;
	bullet1.isGhost = true;
	bullet1.image_xscale /= 2;
	bullet1.image_yscale /= 2;
	bullet.image_xscale /= 2;
	bullet.image_yscale /= 2;
	shoot_cooldown = shoot_delay;
}
