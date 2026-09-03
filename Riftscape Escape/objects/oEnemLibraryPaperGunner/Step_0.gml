event_inherited();
if (brainDead) {
    exit;
}



// countdown
if (shoot_cooldown > 0 && canSeePlayer) {
    shoot_cooldown--;
}

// countdown
shoot_cooldown--;

// fire when ready, fires default bullet
if (shoot_cooldown <= 0) {
	var playerAng = point_direction(x, y, oTruePlayer.x, oTruePlayer.y);
	with (oPaperProjBullet) {
		if (owner == other.id) {
			orbitRadius += 12;
			owner = noone;
		}
	}
	var inc = 360/8;
	for (var i = 0; i < 8; i++) {
		var c =  bulletFire(x, y, (playerAng-60)+inc*i, 5, damage, oPaperProjBullet, id);
		c.orbitAngle = inc*i;
		c.image_angle = inc*i;
		if (isBoss) {
			var d =  bulletFire(x, y, (playerAng-60)+inc*i-inc/2, 5, damage, oPaperProjBullet, id);
			d.orbitAngle = inc*i-inc/2;
			d.image_angle = inc*i-inc/2;
		}
	}
	
	//var d =  bulletFire(x, y, playerAng-25, bullet_speed*1.5, damage*1.2, oBossBullet, id);
	shoot_cooldown = shoot_delay;
}