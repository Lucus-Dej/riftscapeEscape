event_inherited();
if (enemyHP < healthTotal) {
	enemyHP += regenRate;
}

if (brainDead) {
    exit;
}
if (enemyHP < phasePoint1 && !phase1Applied) {
	shoot_delay -= 20;
	initalSpeed += 0.05;
	regenRate += 0.002;
	phase1Applied = true;
	maxMoves++;
	move1Limit+=2;
	move2Limit+=2;
	move3Limit += 2
	move3speed += 8;
	move3Timer -= 10;
	moveTotal += 3;
	moveCount = 0;
	revincibleDuration = 0;
	phase++;
} else if (enemyHP < phasePoint2 && !phase2Applied) {
	initalSpeed += 0.1;
	shoot_delay -= 30;
	bullet_speed += 1;
	phase2Applied = true;
	move1Limit+=2;
	move2Limit+=2;
	move3Limit += 2
	move3speed += 8;
	move3Timer -= 10;
	move4limit += 2;
	moveTotal += 1;
	moveCount = 0;
	revincibleDuration = 0;
	phase++;
} else if (enemyHP < phasePoint3 && !phase3Applied) {
	initalSpeed += 0.2;
	shoot_delay -= 50;
	phase3Applied = true;
	move1Limit+=2;
	move2Limit+=2;
	move3Limit += 2
	move3speed += 16;
	maxMoves++;
	move3Timer -= 10;
	move4limit += 1;
	moveTotal += 3;
	moveCount = 0;
	revincibleDuration = 0;
	phase++;
}


// countdown
if (shoot_cooldown > 0) {
    shoot_cooldown--;
}
var look = irandom_range(1, 16)
if (look == 1) {
	var playerDir = point_direction(x, y, oTruePlayer.x, oTruePlayer.y); 
	image_angle = playerDir+90;
}
if (!invincible) {
	revincibleDuration--;
	if (revincibleDuration <= 0) {
		revincibleDuration = 300;
		invincible = true;
		image_blend = c_white;
	}
}
if (choice == -1) {
	canPathfind = true;
	enemSpeed = initalSpeed;
	moveTimerFlex = -2;
	choice = irandom_range(1, maxMoves);
	var playerDir = point_direction(x, y, oTruePlayer.x, oTruePlayer.y); 
	image_angle = playerDir+90;
}
// fire when ready
if (shoot_cooldown <= 0 && invincible) {
	if (moveCount < moveTotal) {
		if (choice == 1) { // triple shot & double shot split
			if (move1Count < move1Limit) {
				var playerDir = point_direction(x, y, oTruePlayer.x, oTruePlayer.y); 
				image_angle = playerDir+90;
				var dir = point_direction(x, y, oTruePlayer.x, oTruePlayer.y);
				if (moveTimerFlex == -2) {
					moveTimerFlex = 32;
				}
				moveTimerFlex--;
				if (moveTimerFlex == 16) {
					var bullet = bulletFire(x, y, dir+50, bullet_speed*0.8, damage, oTorzProjectile, id);
					var bullet1 = bulletFire(x, y, dir, bullet_speed*0.8, damage, oTorzProjectile, id);
					var bullet2 = bulletFire(x, y, dir-50, bullet_speed*0.8, damage, oTorzProjectile, id);
				}
				if (moveTimerFlex <= 0) {
					var bulletB = bulletFire(x, y, dir+25, bullet_speed*0.8, damage, oTorzProjectile, id);
					var bullet1B = bulletFire(x, y, dir-25, bullet_speed*0.8, damage, oTorzProjectile, id);
					moveTimerFlex = 32;
					move1Count++;
				}
			} else {
				move1Count = 0;
				shoot_cooldown = shoot_delay;
				choice = -1;
				moveCount++;
			}
		} else if (choice == 2) { // bombs;
			for (var i = 0; i < move2Limit; i++) {
				var dir = irandom(360)
				var bullet = bulletFire(x, y, dir, bullet_speed*1.3, damage, oTorzProjectile, id);
				bullet.canDecel = true;
				bullet.canExplode = true;
				bullet.explodeObj = oTorzolVines;
				bullet.explodeTimer = 60;
				bullet.canGrow = true;
				bullet.growRate = 0.02;
				bullet.decelLockedToZero = true;
				bullet.isGhosting = true;
			}
			shoot_cooldown = shoot_delay;
			choice = -1;
			moveCount++;
		} else if (choice == 3) {
			if (moveTimerFlex == -2) {
				moveTimerFlex = move3Timer;
				//show_debug_message("trying warning move" +string(move3count))
				warning = instance_create_layer(oTruePlayer.x, oTruePlayer.y, "Items", oTorzWarning);
				warning.torz = id;
				warning.explode = true;
				enemSpeed = 0;
				canPathfind = false;
		
				path_end();
			}
			if (moveTimerFlex > 0) {
				moveTimerFlex--;
			}
			
			if (moveTimerFlex <= 0) {
				if (!place_meeting(x, y, warning)) {
					var dir = point_direction(x, y, warning.x, warning.y);
					x += lengthdir_x(move3speed, dir);
					y += lengthdir_y(move3speed, dir);
				} else {
					var playerDir = point_direction(x, y, oTruePlayer.x, oTruePlayer.y); 
					image_angle = playerDir+90;
					move3count++;
					instance_destroy(warning);
					if (move3count < move3Limit) {
						moveTimerFlex = -2
					} else {
						move3count = 0;
						canPathfind = true;
						path_timer = 0;
						enemSpeed = initalSpeed;
						shoot_cooldown = shoot_delay*0.6;
						choice = -1;
						moveCount++;
					}
				}
				
			}
		} else if (choice == 4) {
			if (instance_exists(oTorzling)) {
				instance_create_layer(x, y, "Instances", oTorzling);
				choice = -1;
			} else {
				for (var i = 0; i < move4limit; i++) {
					instance_create_layer(x, y, "Instances", oTorzling);
				}
				shoot_cooldown = shoot_delay;
				choice = -1;
				moveCount++;
			}
		} else if (choice == 5) {
			if (moveTimerFlex == -2) {
				moveTimerFlex = 240;
				with (oTorzolFountain) {
					active = true;
					activeDuration = 320;
				}
				move5rngRate = moveTimerFlex;
				var center = instance_nearest(x, y, oTorzFlag);
				warning = instance_create_layer(center.x, center.y, "Items", oTorzWarning);
				warning.torz = id;
				enemSpeed = 0;			
				canPathfind = false;
				path_end();
			}
			if (instance_exists(warning) && !place_meeting(x, y, warning)) {
				x = warning.x;
				y = warning.y;
			} else {
				moveTimerFlex--;
				var chance = 6/max(1, (moveTimerFlex/move5rngRate)*80);
				if (random(1) < chance) {
					 var l = bulletFire(x, y, irandom(360), bullet_speed, damage, oTorzProjectile, id);
					 l.canAccel = true;
				}
				if (moveTimerFlex <= 22) {
					var startingAng = 0;
					var inc = 360/move5BulletCount;
					for (var i = 0; i < move5BulletCount; i++) {
						if (i == 0) {
							var e = bulletFire(x, y, startingAng, bullet_speed*1.5, damage*8, oTorzProjectile, id);
						} else {
							var e = bulletFire(x, y, startingAng, bullet_speed*1.5, damage*8, oTorzProjectile, id, true);
						}
						
						startingAng+= inc;
					}
				}
				if (moveTimerFlex <= 0 && instance_exists(warning)) {
					instance_destroy(warning);
					with (oTruePlayer) {
						if (!place_meeting(x, y, oTorzolFountain)) {
							callDOT(self, 0.2, 9999999, 6, dotType.torz, irandom(99999999999));
						}
					}
					shoot_cooldown = shoot_delay*2;
					choice = -1;
					moveTimerFlex = 999;
					canPathfind = true;
					path_timer = 2;
					enemSpeed = initalSpeed;
					
					
					moveCount +=2;
				}
			}
		}
	} else {
		with (oTorzolFountain) {
			active = true;
		}
		var dir = point_direction(x, y, oTruePlayer.x, oTruePlayer.y);
		var bullet1 = bulletFire(x, y, dir, bullet_speed*0.5, damage, oTorzProjectile, id);
		bullet1.canFlash = true;
		bullet1.canGrow = true;
		bullet1.growRate = 0.005;
		bullet1.canHome = true;
		bullet1.homeSpeed = bullet_speed*0.5;
		bullet1.turnSpeed = 6;
		bullet1.homingTarget = oTruePlayer;
		bullet1.homeDuration = 360;
		bullet1.canExplode = true;
		bullet1.explodeTimer = 360;
		bullet1.explodeObj = oTorzolVines;
		bullet1.isGhost = true;
		shoot_cooldown = 160;
		moveCount -= irandom_range(1, 3)
	}
	/*
	
	//var bullet2 = bulletFire(x, y, dir-20, bullet_speed, damage, oBadBullet, id);
    
	*/
}
show_debug_message(canPathfind)