event_inherited();
if (brainDead) {
    exit;
}



// countdown

// fire when ready
if (shoot_cooldown <= 0 && attack == -1) {
	attack = irandom_range(1, 6);
}
if (shoot_cooldown > 0) {
	shoot_cooldown--;
}
if (instance_exists(blackHole)) {
	enemSpeed = 0;
	image_alpha = 0.1;
} else {
	enemSpeed = baseSpeed;
	image_alpha = 1;
}
if (attack != -1) 
if (attack == 1) {
	// black hole
	blackHole = instance_create_layer(x, y, "Items", oFatedVortex)
	blackHole.host = id;
	shoot_cooldown = 320;
	attack = -1;
}  else {
	// bullet storm
	show_debug_message(attack)
	var dir = point_direction(x, y, oTruePlayer.x, oTruePlayer.y)
	var bullet = bulletFire(x, y, dir, bullet_speed*0.6, damage, oBadBullet, id)
	bullet.isGhost = true;
	bullet.image_alpha = 0.8;
	bullet.sprite_index = sHomingBullet;
	bullet.canHome = true;
	bullet.canFriendlyFireOwner = true
	bullet.homeDuration = 160;
	bullet.turnSpeed = 2;
	bullet.homeSpeed = bullet_speed*0.6;
	bullet.homingTarget = oTruePlayer;
	bullet.sprite_index = sHomingBullet;
	shoot_cooldown = shoot_delay;
	attack = -1;
} 
if (shoot_cooldown > 0 && shoot_cooldown < 60) {
	flash += 0.2;
}

