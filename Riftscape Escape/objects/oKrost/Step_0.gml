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
if (enemey_hp < phasePoint1 && !phase1Applied) {
	shoot_delay -= 30;
	base_speed += 0.75;
	bullet_speed += 2;
	directionCooldown -= 20;
	phase1Applied = true;
	with (oKrostTp) {
		var gridB = bulletFire(x, y, 0, 0, other.damage/2, oKrostBullet, other.id);
		gridB.gridBullet = true;
	}
}
if (enemey_hp < phasePoint2 && !phase2Applied) {
	base_speed += 1;
	shoot_delay -= 45;
	bullet_speed += 1;
	directionCooldown -= 30;
	phase2Applied = true;
	with (oKrostTp) {
		var gridB = bulletFire(x, y, 0, 0, other.damage/2, oKrostBullet, other.id);
		gridB.gridBullet = true;
		var bh = instance_create_layer(x, y, "Instances", oBlackHole);
	}
}
if (enemey_hp < phasePoint3 && !phase3Applied) {
	base_speed += 1.2;
	shoot_delay -= 60;
	directionCooldown -= 65;
	phase3Applied = true;
	with (oKrostTp) {
		var gridB = bulletFire(x, y, 0, 0, other.damage/2, oKrostBullet, other.id);
		gridB.gridBullet = true;
		var bh = instance_create_layer(x, y, "Instances", oBlackHole);
	}
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
if (shoot_cooldown <= 0) {
		var choice = irandom_range(1, 3);
		switch (choice) {
			case 1:
			// thunder wave then reverse (cover can stop it?)
			var startingAng = point_direction(x, y, oTruePlayer.x, oTruePlayer.y);
			var pelletCount = 6;
			for (var i = 0; i < pelletCount; i++) {
				var bullet = bulletFire(x, y, startingAng+20*i, bullet_speed, damage, oKrostBullet, id);
				var randDecel = i/16;
				bullet.canDecel = true;
				bullet.decelRate = 0.18 + randDecel;
				bullet.bounceBullet = true;
				if (i != 0) {
					var bullet1 = bulletFire(x, y, startingAng-20*i, bullet_speed, damage, oKrostBullet, id);
					var randDecel1 = i/15;
					bullet1.canDecel = true;
					bullet1.decelRate = 0.18 + randDecel1;
					bullet1.bounceBullet = true;
				}
			}
			shoot_cooldown = shoot_delay/2;
			break;
			
			case 2:
			// circle fire, freeze, reverse, expand, fire homing
			var circAng = point_direction(x, y, oTruePlayer.x, oTruePlayer.y);
			var bulletCount = 12;
			var circIncrement = 360/bulletCount;
			for (var f = 0; f < bulletCount; f++) {
				var circBullet = bulletFire(x, y, circAng+f*circIncrement, bullet_speed, damage, oKrostBullet, id);
				circBullet.canDecel = true;
				circBullet.decelRate = circBullet.decelRate/2;
				circBullet.canBounce = true;
				circBullet.bounceBullet = true;
			}
			
			shoot_cooldown = shoot_delay;
			break;
			
			case 3:
			// grid of bullets?
			var gridAng = 0;
			var spawn = instance_nearest(x, y, oBossStart);
			
			var gridB = bulletFire(spawn.x, spawn.y, 0, 0, damage/2, oKrostBullet, id);
			gridB.gridBullet = true;
			gridB.up = true;
			gridB.down = true;
			gridB.left = true;
			gridB.right = true;
			
			shoot_cooldown = shoot_delay;
			break;
		}
    
}
// direction switcher
directionTimer--;
if (directionTimer <= 0) {
	
	if (array_length(tpArray) > 0) {
		path_end();
		if (phase2Applied) {
			var gridB = bulletFire(x, y, 0, 0, damage/2, oKrostBullet, other.id);
			gridB.gridBullet = true;
			if (phase3Applied) gridB.existance /= 4;
		}
		var bh = instance_create_layer(x, y, "Items", oBlackHole)
		bh.image_xscale = 1.5;
		bh.image_yscale = 1.5;
		audio_play_sound_at(aPortalOpen, x, y, 0, 0, 64, 1, false, 4, global.sfxAudio)
		var f = irandom_range(1, 3);
		if (f == 3) {
		var bug = instance_create_layer(x, y, "Instances", oEnemSpider);
		with (bug) {
			base_speed *= 2;
			enemSpeed *= 2;
		}
		}
		
		var tpIndex = irandom(array_length(tpArray)-1);
		var tp = tpArray[tpIndex];
		x = tp.x;
		y = tp.y;
		pathfind(global.Grid, oTruePlayer, enemSpeed, id);
		if (phase2Applied) {
			var gridB = bulletFire(x, y, 0, 0, damage/2, oKrostBullet, other.id);
			gridB.gridBullet = true;
			if (phase3Applied) gridB.existance /= 4;
		}
	}
	dirMod = irandom_range(1, 4)
	directionTimer = directionCooldown;
	var bh = instance_create_layer(x, y, "Items", oBlackHole)
	bh.image_xscale = 2;
	bh.image_yscale = 2;
}
if (dirMod != 0) {
	switch (dirMod) {
		case 1: // up
		with (oTruePlayer) {
			var collCheck = collision_circle(x, y, 32, oSuperwalls, false, false);
			if (collCheck == noone) {
				y -= 1.2;
			}
		}
		with (oPlayerBullets) {
			y -= 6.5;
		}
		break;
		
		case 2: // down
		with (oTruePlayer) {
			var collCheck = collision_circle(x, y, 32, oSuperwalls, false, false);
			if (collCheck == noone) {
				y += 1.2;
			}
		}
		with (oPlayerBullets) {
			y += 6.5;
		}
		break;
		
		case 3: // left;
		with (oTruePlayer) {
			var collCheck = collision_circle(x, y, 32, oSuperwalls, false, false);
			if (collCheck == noone) {
				x -= 1.2;
			}
		}
		with (oPlayerBullets) {
			x -= 6.5;
		}
		break;
		
		case 4: // right
		with (oTruePlayer) {
			var collCheck = collision_circle(x, y, 32, oSuperwalls, false, false);
			if (collCheck == noone) {
			x += 1.2;
			}
		}
		with (oPlayerBullets) {
			x += 6.5;
		}
		break
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
    pathfind(global.Grid, oTruePlayer, enemSpeed, id);
}