event_inherited();
if (brainDead) {
    exit;
}

if ((enemyHP <= phasePoint1) && phase == 0) {
	attack = 0;
	invincible = true;
	resetAttack();
	bossMode = veriMode.inMaze;
	with (oVeribroseFightWall) {
		self.turnOn();
	}
	for (var i = 0; i < array_length(laserArray); i++) {
		var laser = laserArray[i];
		laser.setPower(true);	
	}
	resetLaserAng();
	global.grid_cool = false;
	phase++;
	shoot_delay -= 40;
	enemSpeed += 1.2;
	mazeLaserTotal++; // from 2 to 3
	mazeLaserExistFrames -= 8; // from 48 to 40
	
	mazeBulletExistTime += 30; // from 240 to 270
	mazeBulletTot += 2; // from 2 to 4
	
	mazeSlowExistTime += 30; // from 120 to 150
	
	unleashedBulletStormCount += 4; // from 12 to 16
	
	unleashedLaserSpiralDuration += 60; // from 360 to 420
	//unleashedLaserSpiralTick += 0.2; // from 1 to 1.2
	unleashedBulletSpiralCount += 8; // from 24 to 32
	unleashedBulletSpiralDelay -= 12; // from 30 to 18
}
if ((enemyHP <= phasePoint2) && phase == 1) {
	attack = 0;
	invincible = true;
	attack = 0;
	resetAttack();
	bossMode = veriMode.inMaze;
	with (oVeribroseFightWall) {
		self.turnOn();
	}
	for (var i = 0; i < array_length(laserArray); i++) {
		var laser = laserArray[i];
		laser.setPower(true);	
	}
	resetLaserAng();
	global.grid_cool = false;
	phase++;
	shoot_delay -= 60;
	enemSpeed += 1.2;
	
	mazeLaserTotal++; // from 3 to 4
	mazeLaserExistFrames -= 8; // from 40 to 32
	
	mazeBulletExistTime += 15; // from 270 to 285
	mazeBulletTot += 1; // from 4 to 5
	
	mazeSlowExistTime += 20; // from 150 to 170
	
	unleashedBulletStormCount += 4; // from 12 to 16
	
	//unleashedLaserSpiralDuration += 60; // from 420 to 480
	unleashedLaserSpiralTick += 0.2; // from 1.2 to 1.4
	unleashedBulletSpiralCount += 8; // from 32 to 40
	unleashedBulletSpiralDelay -= 12; // from 18 to 12
}

if ((enemyHP <= phasePoint3) && phase == 2) {
	attack = 0;
	resetAttack();
	bossMode = veriMode.desperate;
	for (var i = 0; i < array_length(laserArray); i++) {
		var laser = laserArray[i];
		laser.enraged = true;
		laser.setPower(true);	
	}
	phase++;
	
	shoot_delay -= 80;
	enemSpeed += 2;
	
	mazeLaserTotal++; // from 4 to 5
	mazeLaserExistFrames -= 12; // from 32 to 20
	
	mazeBulletExistTime += 15; // from 285 to 300
	mazeBulletTot += 1; // from 5 to 6
	
	mazeSlowExistTime += 15; // from 170 to 185
	
	unleashedBulletStormCount += 8; // from 16 to 24
	
	//unleashedLaserSpiralTick += 0.6; // from 1.4 to 2
	unleashedBulletSpiralCount += 8; // from 40 to 48
	unleashedBulletSpiralDelay -= 6; // from 18 to 12
}



if (attack == 0) {
	if (bossMode == veriMode.inMaze) {
		currentMaxMoves = maxMazeMoves;
	} else if (bossMode == veriMode.unleashed) {
		currentMaxMoves = maxUnleashedMoves;
	} else if (bossMode == veriMode.desperate) {
		maxTotalMoves = 4;
		currentMaxMoves = maxTotalMoves;
	}
	attack = irandom_range(1, currentMaxMoves);
}

// countdown
if (shoot_cooldown > 0) {
    shoot_cooldown--;
}
// fire when ready
if (shoot_cooldown <= 0) {
	if (bossMode == veriMode.inMaze) {
		// laser attack
		if (attack == 1) {
			if (mazeLaserTotal > mazeLaserNum) {
				if (!instance_exists(mazeLaser)) {
					mazeLaser = instance_create_layer(x, y, "Instances", oVeribroseBossLaser);
					mazeLaser.host = id;
					mazeLaser.image_xscale = 120;
				} else {
					var leadAmount = point_distance(x, y, oTruePlayer.x, oTruePlayer.y)*0.7;

					var moveDir = point_direction(0, 0, oTruePlayer.hsp, oTruePlayer.vsp);
					var moveSpeed = point_distance(0, 0, oTruePlayer.hsp, oTruePlayer.vsp);

					var futureX = oTruePlayer.x;
					var futureY = oTruePlayer.y;

					if (moveSpeed > 0) {
					    futureX += lengthdir_x(leadAmount, moveDir);
					    futureY += lengthdir_y(leadAmount, moveDir);
					}

					var dir = point_direction(x, y, futureX, futureY);

					var turnFactor = 0.05 * (1 - mazeLaserAlpha);
					laserDir -= angle_difference(laserDir, dir) * turnFactor;
			
			
					if (laserDir > 360) {
						laserDir -= 360;
					}
					if (laserDir < 0) {
						laserDir += 360;
					}
					if (mazeLaserAlpha < 1) {
						mazeLaserAlpha += mazeLaserInc;
						mazeLaserInc += 0.00015;
						mazeLaser.image_alpha = mazeLaserAlpha;
						mazeLaser.image_angle = laserDir
					} else {
						if (mazeLaserCurrentFrames < mazeLaserExistFrames) {
							mazeLaserCurrentFrames++;
						} else {
							instance_destroy(mazeLaser);
							mazeLaserNum++;
							mazeLaserCurrentFrames = 0;
							mazeLaserAlpha = -0.2;
							mazeLaserInc = 0.001;
						}
					}
					
				}
			} else {
				mazeLaserNum = 0;
				resetAttack();
			}
			
		} else if (attack == 2) {
			// "homing bullets"
			for (var i = 0; i < mazeBulletTot; i++) {
				var b = instance_create_layer(x, y, "Instances", oVeribroseHomingBullet);
				b.enemyHP = mazeBulletExistTime;
			}
			
			resetAttack();
		} else if (attack == 3) {
			if (!instance_exists(mazeSlowField)) {
				mazeSlowField = instance_create_layer(x, y, "Instances", oVeribroseSlowField);
				mazeSlowField.host = id;
				resetAttack();
			}
		}
	} else if (bossMode == veriMode.unleashed) {
		if (attack == 1) {
			// leading bullet storm and chance of homing
			var dist = point_direction(x, y, oTruePlayer.x, oTruePlayer.y);
			var time = (clamp(dist / unleashedBulletStormBulletSpeed, 0, 30))+18;
			var dir = point_direction(x, y, oTruePlayer.x+oTruePlayer.hsp*time, oTruePlayer.y+oTruePlayer.vsp*time);
			if (unleashedBulletStormNum < unleashedBulletStormCount) {
				var b = bulletFire(x+irandom_range(-64, 64), y+irandom_range(-64, 64), dir, unleashedBulletStormBulletSpeed, damage*0.8, oBadBullet, id);
				b.canAccel = true;
				var t = irandom_range(1, 500);
				if (t <= unleashedBulletStormHomingChance) {
					b.sprite_index = sHomingBullet;
					b.canHome = true;
					b.homeSpeed = unleashedBulletStormBulletSpeed;
					b.homingTarget = oTruePlayer;
					b.homeDuration = 60;
					b.turnSpeed = phase*2+2;
					b.image_blend = c_orange;
				}
				unleashedBulletStormNum++;
			} else {
				resetAttack();
				unleashedBulletStormNum = 0;
			}
			
		} else if (attack == 2) {
			// laser spin attack (higher phase more lasers)
			var laserInc = 360/(phase+1)
			if (array_length(unleashedLaserSpiralArray) > 0) {
				for (var i = array_length(unleashedLaserSpiralArray); i > 0; i--) {
					var laser = unleashedLaserSpiralArray[i-1];
					//instance_destroy(laser);
					array_delete(unleashedLaserSpiralArray, i-1, 1);
					laser.decay = true;
				}
			}
			array_delete(unleashedLaserSpiralArray, 0, array_length(unleashedLaserSpiralArray))
			var dir = point_direction(x, y, oTruePlayer.x, oTruePlayer.y);
			for (var i = 0; i < phase+1; i++) {
				var l = instance_create_layer(x, y, "Instances", oVeribroseBossLaser);
				l.host = id;
				l.trackingID = i+1;
				l.image_angle = dir + i*laserInc;
				l.image_alpha = 0;
				array_push(unleashedLaserSpiralArray, l);
			}
			resetAttack();
			unleashedLaserSpiralTime = 0;
		} else if (attack == 3) {
			//bullet spiral
			var dist = 520;
			unleashedBulletSpiralInc = 360/unleashedBulletSpiralCount;
			if (unleashedBulletSpiralNum < unleashedBulletSpiralCount) {
				if (unleashedBulletSpiralWaitNum >= unleashedBulletSpiralWaitTime) {
					var summonX = x + lengthdir_x(dist, unleashedBulletSpiralAng)
					var summonY = y + lengthdir_y(dist, unleashedBulletSpiralAng)
				
					var b = bulletFire(summonX, summonY, unleashedBulletSpiralAng-180, 0, 1, oBadBullet, id);
					b.pauseTime = unleashedBulletSpiralDelay; //accelRate = 0.085;
					b.canHome = true;
					b.canAccel = true;
					b.homeDuration = 140;
					b.homeSpeed = 0;
					b.homingTarget = oTruePlayer;
					b.turnSpeed = 0.5;
					b.isGhost = true;
					unleashedBulletSpiralAng += unleashedBulletSpiralInc;
					unleashedBulletSpiralNum++;
					unleashedBulletSpiralWaitNum = 0;
				} else {
					unleashedBulletSpiralWaitNum++;
				}
				
			} else {
				unleashedBulletSpiralNum = 0;
				unleashedBulletSpiralAng = irandom(359);
				resetAttack();
			}
			
		}
	} else if (bossMode == veriMode.desperate) {
		if (attack == 1) {
			// leading bullet storm and chance of homing
			var dist = point_direction(x, y, oTruePlayer.x, oTruePlayer.y);
			var time = (clamp(dist / unleashedBulletStormBulletSpeed, 0, 30))+18;
			var dir = point_direction(x, y, oTruePlayer.x+oTruePlayer.hsp*time, oTruePlayer.y+oTruePlayer.vsp*time);
			if (unleashedBulletStormNum < unleashedBulletStormCount) {
				var b = bulletFire(x+irandom_range(-64, 64), y+irandom_range(-64, 64), dir, unleashedBulletStormBulletSpeed, damage*0.8, oBadBullet, id);
				b.canAccel = true;
				var t = irandom_range(1, 500);
				if (t <= unleashedBulletStormHomingChance) {
					b.sprite_index = sHomingBullet;
					b.canHome = true;
					b.homeSpeed = unleashedBulletStormBulletSpeed;
					b.homingTarget = oTruePlayer;
					b.homeDuration = 60;
					b.turnSpeed = phase*2+2;
					b.image_blend = c_orange;
				}
				unleashedBulletStormNum++;
			} else {
				resetAttack();
				unleashedBulletStormNum = 0;
			}
		} else if (attack == 2) {
			// "homing bullets"
			for (var i = 0; i < mazeBulletTot; i++) {
				var b = instance_create_layer(x, y, "Instances", oVeribroseHomingBullet);
				b.enemyHP = mazeBulletExistTime;
			}
			resetAttack();
		} else if (attack == 3) {
			// laser spin attack (higher phase more lasers)
			var laserInc = 360/(phase+3)
			if (array_length(unleashedLaserSpiralArray) > 0) {
				for (var i = array_length(unleashedLaserSpiralArray); i > 0; i--) {
					var laser = unleashedLaserSpiralArray[i-1];
					//instance_destroy(laser);
					array_delete(unleashedLaserSpiralArray, i-1, 1);
					laser.decay = true;
				}
			}
			array_delete(unleashedLaserSpiralArray, 0, array_length(unleashedLaserSpiralArray))
			var dir = point_direction(x, y, oTruePlayer.x, oTruePlayer.y);
			for (var i = 0; i < phase+3; i++) {
				var l = instance_create_layer(x, y, "Instances", oVeribroseBossLaser);
				l.host = id;
				l.trackingID = i+1;
				l.image_angle = dir + i*laserInc;
				l.image_alpha = 0;
				array_push(unleashedLaserSpiralArray, l);
			}
			resetAttack();
			unleashedLaserSpiralTime = 0;
		} else if (attack == 4) {
			//bullet spiral
			var dist = 520;
			unleashedBulletSpiralInc = 360/unleashedBulletSpiralCount;
			if (unleashedBulletSpiralNum < unleashedBulletSpiralCount) {
				if (unleashedBulletSpiralWaitNum >= unleashedBulletSpiralWaitTime) {
					var summonX = x + lengthdir_x(dist, unleashedBulletSpiralAng)
					var summonY = y + lengthdir_y(dist, unleashedBulletSpiralAng)
				
					var b = bulletFire(summonX, summonY, unleashedBulletSpiralAng-180, 0, 1, oBadBullet, id);
					b.pauseTime = unleashedBulletSpiralDelay; //accelRate = 0.085;
					b.canHome = true;
					b.canAccel = true;
					b.homeDuration = 140;
					b.homeSpeed = 0;
					b.homingTarget = oTruePlayer;
					b.turnSpeed = 0.5;
					b.isGhost = true;
					unleashedBulletSpiralAng += unleashedBulletSpiralInc;
					unleashedBulletSpiralNum++;
					unleashedBulletSpiralWaitNum = 0;
				} else {
					unleashedBulletSpiralWaitNum++;
				}
				
			} else {
				unleashedBulletSpiralNum = 0;
				unleashedBulletSpiralAng = irandom(359);
				resetAttack();
			}
		}
	}
	
}
//passive attacks
if (bossMode == veriMode.unleashed) {
	if (phase > 0) {
		var i = irandom_range(0, unleashedMinionSpawnRate);
		if (i = 0) {
			var j = irandom(array_length(unleashedMinionArray)-1);
			var e = unleashedMinionArray[j];
			spawnEnemViaEgg(6, e, false, false, RoomID, id, id)
		}
	}
} else if (bossMode == veriMode.desperate) {
	var i = irandom_range(0, desperateMinionSpawnRate);
	if (i = 0) {
		var j = irandom(array_length(desperateMinionArray)-1);
		var e = desperateMinionArray[j];
		spawnEnemViaEgg(6, e, false, false, RoomID, id, id)
	}
} else if (bossMode == veriMode.inMaze) {
	show_debug_message("SWITCHING PHASES")
	if (phase > 0) {
		var i = irandom_range(0, mazeMinionSpawnRate);
		if (i = 0) {
			var j = irandom(array_length(mazeMinionArray)-1);
			var e = mazeMinionArray[j];
			spawnEnemViaEgg(6, e, false, false, RoomID, id, id)
		}
	}
	var phaseFlipFlag = true;
	for (var i = 0; i < array_length(laserArray); i++) {
		if (instance_exists(laserArray[i].laser)) {
			var laser = laserArray[i].laser
			if (!laser.targetFound) {
				phaseFlipFlag = false;
			}
		} else {
			phaseFlipFlag = false;
		}
		
	}
	if (phaseFlipFlag) {
		bossMode = veriMode.unleashed;
		invincible = false;
		with (oVeribroseFightWall) {
			self.turnOff();
		}
		for (var i = 0; i < array_length(laserArray); i++) {
			var laser = laserArray[i].laser
			laser.host.setPower(false);	
		}
		resetAttack();
		global.grid_cool = false;
	}
}
// checking on laser spiral
if (unleashedLaserSpiralTime < unleashedLaserSpiralDuration) {
	unleashedLaserSpiralTime++;
	for (var i = 0; i < array_length(unleashedLaserSpiralArray); i++) {
		var laser = unleashedLaserSpiralArray[i];
		laser.image_angle += unleashedLaserSpiralTick;
		if (laser.image_alpha < 1) {
			laser.image_alpha += 0.02;
		}
	}
} else {
	for (var i = array_length(unleashedLaserSpiralArray); i > 0; i--) {
		var laser = unleashedLaserSpiralArray[i-1];
		laser.decay = true;
		array_delete(unleashedLaserSpiralArray, i-1, 1);
	}
}
//randomly summons exploders

