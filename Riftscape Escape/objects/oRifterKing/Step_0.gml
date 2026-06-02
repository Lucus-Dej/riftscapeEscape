event_inherited();
if (brainDead) {
    exit;
}
if (enemey_hp < phasePoint1 && !phasedUpOne) {
	phase++;
	shoot_delay -= 60;
	attackDelay -= 6;
	phasedUpOne = true;
	healing = true;
	slamLimit++;
}
if (enemey_hp < phasePoint2 && !phasedUpTwo) {
	phase++;
	shoot_delay -= 90;
	attackDelay -= 18;
	phasedUpTwo = true;
	healing = true;
	slamLimit++;
	with (oRifterKingCenter) {
		active = true;
	}
	
}
path_timer--;

if (healing && shield == noone) {
	shield = instance_create_layer(x, y, "Instances", oRifterKingShield);
	shield.image_xscale = 2.5;
	shield.image_yscale = 2.5;
	invincible = true;
	with (oRifterKingFlag) {
		if (ID <= other.phase-2) {
			var f = ds_list_size(other.Manager.spawnerList)
			var i = irandom(f-1);
			var target = other.Manager.spawnerList[| i];
			
			var battery = instance_create_layer(target.x, target.y, "Instances", oRifterTank);
			var linker = instance_create_layer(oRifterKing.x, oRifterKing.y, "Instances", oEnemyLink);
			linker.enemyA = battery;
			linker.enemyB = oRifterKing;
		}
	}
	
}
if (instance_exists(shield)) {
	shield.x = x;
	shield.y = y
	image_alpha = 0.35;
	if (enemey_hp < baseHP) {
		enemey_hp += 0.0375*instance_number(oRifterTank);
	}
	if (!instance_exists(oRifterTank)) {
		instance_destroy(shield);
		healing = false;
		invincible = false;
		image_alpha = 1;
		attack = 0;
		shield = noone;
	}
}
if (attack == 0) {
	if (healing) {
		attack = -1;
	} else {
		attack = irandom_range(1, 9);
	}
}

// countdown
if (shoot_cooldown > 0) {
    shoot_cooldown--;
}
// fire when ready
if (shoot_cooldown <= 0) {
	// a "wave" of bullets, with built in space to dodge. 
	if (attack == 1 || attack == 2) {
		if (waveCount <= 0) {
			shoot_cooldown = shoot_delay;
			attack = 0;
			
			waveCount = WaveTotal;
		}
		if (waveTimer > 0) {
			waveTimer--;
		}
		if (waveTimer <= 0) {
			if (waveCount > 0) {
				rkWave();
				waveCount--;
			} 
			waveTimer = waveCooldown;
		}
		
		
	}
	// disables a corner of the map, puts it under a blanket of dot. if the player enters, they take damage. 
	// while it is active, enemies spawn from it slowly
	if (attack == 3) {
		flagArray = [];
		with (oRifterKingFlag) {
			if (ID <= other.phase-1) {
				array_push(other.flagArray, id);
				show_debug_message(other.flagArray)
			}
		}
		array_push(flagArray, id);
		rkBlackOut(2*(phase+1))
		shoot_cooldown = shoot_delay;
		attack = 0;
	}
	// a huge circle attack (meaning bullets fly in all directions). the bullets slow, when they hit zero
	// they will hover. then in clockwise order, they will all fire with a delay back to the center
	if (attack == 4 || attack == 5) {
		if (shotAngle < 360) {
			var bullet = bulletFire(x, y, shotAngle, 9, damage, oRifterKingBullets, id);
			bullet.decelRate = 0.036;
			bullet.canDecel = true;
			bullet.existance = 1300;
			bullet.image_xscale = 2;
			bullet.image_yscale = 2;
			shotAngle += 12;
		}
		if (shotAngle >= 360) {
			shotAngle = 0;
			shoot_cooldown = shoot_delay;
			attack = 0;
		}
	}
	// from the four corners of the arena, a spiral of bullets fly
	if (attack == 6) {
		if (spiralAng < 1440*1.5) {
			if (spiralTimer > 0) {
				spiralTimer--;
			}
			if (spiralTimer <= 0) {
				var mainBullet = bulletFire(x, y, spiralAng*-1, 2, damage*0.75, oRifterKingBullets, id);
				mainBullet.existance = 800;
				with (oRifterKingFlag) {
					if (ID <= other.phase-1) {
						var bullet = bulletFire(x, y, other.spiralAng, 2, other.damage*0.5, oRifterKingBullets, id);
						bullet.existance = 800;
						bullet.image_xscale -= 0.5;
						bullet.image_yscale -= 0.5;
					}
				}
				
				spiralAng += irandom_range(20, 47);
				spiralTimer = spiralBuffer;
			}
		} else {
			spiralAng = 0;
			attack = 0;
			shoot_cooldown = shoot_delay;
		}
		
	}
	// slam attack 
	if (attack == 7 || attack == 8 || attack == 9) {
		if (state = RIFTERCHARGE.IDLE) {
			slamTimer -= 1.5;
			if (slamTimer <= 0 && instance_exists(oTruePlayer)) {
				chargeTargetX = oTruePlayer.x;
				chargeTargetY = oTruePlayer.y;
				chargeDir = point_direction(x, y, chargeTargetX, chargeTargetY);
				audio_play_sound(aPortalOpen, 1, 0, global.sfxAudio)
				path_end();
				state = RIFTERCHARGE.WINDUP;
				attackTimer = attackDelay;
				enemSpeed = 0;
			}
		}
		if (state == RIFTERCHARGE.WINDUP) {
			attackTimer--;
			if (attackTimer <= 0) {
				rkSlamNado();
				attackTimer = attackDelay;
				chargeTime = 18;
				state = RIFTERCHARGE.CHARGE;
				slamCount++;
				enemSpeed = 8+phase*2;
			}
		}
		if (state == RIFTERCHARGE.CHARGE) {
			slamTimer = slamCooldown;
			hsp = lengthdir_x(enemSpeed, chargeDir);
			vsp = lengthdir_y(enemSpeed, chargeDir);
			chargeTime -= 1;
			
			if (chargeTime <= 0 ) {
				if (slamCount >= slamLimit) {
					state = RIFTERCHARGE.RECOVER;
					
				} else {
					state = RIFTERCHARGE.WINDUP;
					attackTimer = attackDelay;
					chargeDir = point_direction(x, y, oTruePlayer.x, oTruePlayer.y);
				}
		
				enemSpeed = 0;
				path_timer = path_cooldown;
			}
		}

		if (state == RIFTERCHARGE.RECOVER) {
			enemSpeed = 0.55;
			path_timer = path_cooldown;
			state = RIFTERCHARGE.IDLE;
			slamCount = 0;
			slamTimer = slamCooldown;
			attack = 0;
		}
	}
}
if (phase > 1 && !healing) {
	var spawnCheck = irandom_range(1, 700-(phase*50))
	if (spawnCheck == 1) {
		var bossCheck = irandom(array_length(spawnArray)-1);
		var enem = spawnArray[bossCheck];
		instance_create_layer(x, y, "Instances", enem)
	}
}
if (phase > 2 && endDelay > 0) {
	endDelay--;
}
if (phase > 2 && endDelay <= 0 && !endSpawned) {
	rkPhaseWall();
	endSpawned = true;
}
// pathfinding
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