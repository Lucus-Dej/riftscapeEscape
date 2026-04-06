if (brainDead) {
    exit;
}
image_angle -= rotation;
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
	enemSpeed = base_speed;
}
// countdown
if (shoot_cooldown > 0 && canSeePlayer) {
    shoot_cooldown--;
}
flash = max(0, flash - 0.15);

// fire when ready
if (shoot_cooldown <= 0 && attack == -1) {
	attack = irandom_range(1, 2);
}
if (shoot_cooldown > 0) {
	shoot_cooldown--;
}
if (attack == 1) {
	// black hole
	blackHole = instance_create_layer(x, y, "Items", oBlackHole)
	blackHole.host = id;
	blackHole.image_yscale = image_yscale;
	blackHole.image_xscale = image_xscale;
	blackHole.pull = 1+image_xscale;
	blackHole.rotation = rotation/2;
	blackholeDuration = 300;
	attack = -2;
} 
if (shoot_cooldown > 0 && shoot_cooldown < 60) {
	flash+= 0.2;
}
if (attack == 2 && bulletCount > 0 && shoot_cooldown <= 0) {
	// bullet storm
	attack = -1;
	shotAngle = 360/bulletCount;
	shoot_cooldown = shoot_delay;
	if (!isBoss) {
		bulletCount = 0;
	}
	var singleAng = point_direction(x, y, oTruePlayer.x, oTruePlayer.y)
	if (bulletCount == 1) {
		bulletFire(x, y, singleAng, bullet_speed, damage, oBadBullet, id)
	} else {
		for (var i = 0; i < 360; i += shotAngle) {
			var angle = i;
			if (bulletCount < 24) {
				var bullet = bulletFire(x, y, singleAng+angle, bullet_speed, damage, oBadBullet, id)
				bullet.canDecel = true;
				bullet.decelRate = 0.08;
			} else {
				var bullet = bulletFire(x, y, singleAng+angle, bullet_speed*0.7, damage, oBossBullet, id)
				bullet.canDecel = true;
				bullet.decelRate = 0.08;
			}
			
		}
		
	}
	
	

} else if (attack == 2 && bulletCount <= 0) {
	attack = 1;
}
if (blackholeDuration > 0) {
	blackholeDuration--;
}
if (instance_exists(blackHole) && blackholeDuration <= 0) {
	instance_destroy(blackHole);
	blackHole = noone;
	
	if (bulletCount > 0) {
		attack = 2;
	} else {
		attack = -1;
		shoot_cooldown = shoot_delay;
	}
}
if (instance_exists(blackHole)) {
	blackHole.x = x;
	blackHole.y = y;
	invincible = true;
} else {
	invincible = false;
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