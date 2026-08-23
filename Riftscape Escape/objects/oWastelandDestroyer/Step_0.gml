event_inherited();
if (brainDead) {
    exit;
}

if (( enemyHP <= phasePoint1) && phase < 1) {
	attack = 0;
	phase++;
	segments += 4;
	wallTotal += 2;
	ringCount += 2;
	nadoIntensity += 10;
	shoot_delay -= 60;
	bullet_count += 2;
	spawnTimer -= -50;
	spawnPool -= 55;
	
	with oEnemStart {
		if (RoomID == other.RoomID) {
			instance_create_layer(x, y, "Instances", oWastelandBurner);
		}
	}
}
if (( enemyHP <= phasePoint2) && phase < 2) {
	attack = 0;
	phase++;
	segments +=6;
	spacing += 2;
	wallTotal += 6;
	ringCount += 2;
	nadoIntensity += 5;
	spawnTimer -= -150;
	shoot_delay -= 140;
	bullet_count += 3;
	lineCount += 2;
	spawnPool -= 65;
	lineRotateSpeed += 0.5;
	with oEnemStart {
		if (RoomID == other.RoomID) {
			var e = instance_create_layer(x, y, "Instances", oWastelandFireRunner);
			e. enemyHP /= 8;
			e.phasePoint1 /= 8;
		}
	}
}
if (attack == 0) {
	attack = irandom_range(1, 8);
}

// countdown
if (shoot_cooldown > 0) {
    shoot_cooldown--;
}
// fire when ready
if (shoot_cooldown <= 0) {
	//fires orbitals of fire that spawn an enemy on destruction
	if (attack == 1 || attack == 2) {
		wdFireShield();
		shoot_cooldown = shoot_delay;
		attack = 0;
	}
	// summon attack (range 3-4)
	if (attack == 3) {
		wdSummonFireRunners();
		shoot_cooldown = shoot_delay;
		attack = 0;
	}
	// fire wall? (range 5)
	if (attack == 5 || attack == 4) {
		if (wallSpawnTimer > 0) {
			wallSpawnTimer--;
		}
		if (wallSpawnTimer <= 0) {
			wdFirewall();
			wallSpawnTimer = wallSpawnCooldown;
			wallCount--;
		}
		if (wallCount <= 0) {
			wallCount = wallTotal;
			shoot_cooldown = shoot_delay;
			attack = 0;
			
		}
	}
	if (attack == 6 || attack == 7) {
		if (!nadoActive) {
			nadoAngle = 0;
			wdFirenado(ringCount);

		}
		if (nadoActive) {
			nadoFireTimer++;
			accel = 0.00
			if (nadoFireTimer mod nadoIntensity == 0) {
				
				var angle = nadoAngle;
				if (phase == 1) {
					var d = bulletFire(x, y, 0, 0, damage, owdBullets, id, true);
					d.type = 1;
					d.spinDir = sign(nadoSpin);
					d.dir = angle;
					d.ring = 0;
					d.ringSpeed = nadoRingSpeed+ringBonus;
					d.ringAccel = accel;
				
					d.angularSpeed = abs(nadoSpin);
					d.existance = 1600;
				
					d.image_xscale = 2;
					d.image_yscale = 2;
					
					var f = bulletFire(x, y, 0, 0, damage, owdBullets, id, true);
					f.type = 1;
					f.spinDir = sign(nadoSpin);
					f.dir = angle+120;
					f.ring = 0;
					f.ringSpeed = nadoRingSpeed+ringBonus;
					f.ringAccel = accel;
				
					f.angularSpeed = abs(nadoSpin);
					f.existance = 1600;
				
					f.image_xscale = 2;
					f.image_yscale = 2;
					
					var c = bulletFire(x, y, 0, 0, damage, owdBullets, id, true);
					c.type = 1;
					c.spinDir = sign(nadoSpin);
					c.dir = angle+240;
					c.ring = 0;
					c.ringSpeed = nadoRingSpeed+ringBonus;
					c.ringAccel = accel;
				
					c.angularSpeed = abs(nadoSpin);
					c.existance = 1600;
				
					c.image_xscale = 2;
					c.image_yscale = 2;
				}
				if (phase == 2) {
					var c = bulletFire(x, y, 0, 0, damage, owdBullets, id, true);
					c.type = 1;
					c.spinDir = sign(nadoSpin);
					c.dir = angle + 90;
					c.ring = 0;
					c.ringSpeed = nadoRingSpeed+ringBonus;
					c.ringAccel = accel;
				
					c.angularSpeed = abs(nadoSpin);
					c.existance = 1600;
				
					c.image_xscale = 2;
					c.image_yscale = 2;
					
					var d = bulletFire(x, y, 0, 0, damage, owdBullets, id, true);
					d.type = 1;
					d.spinDir = sign(nadoSpin);
					d.dir = angle + 270;
					d.ring = 0;
					d.ringSpeed = nadoRingSpeed+ringBonus;
					d.ringAccel = accel;
				
					d.angularSpeed = abs(nadoSpin);
					d.existance = 1600;
				
					d.image_xscale = 2;
					d.image_yscale = 2;
				}
				if (phase == 0 || phase == 2) {
					var c = bulletFire(x, y, 0, 0, damage, owdBullets, id, true);
					c.type = 1;
					c.spinDir = sign(nadoSpin);
					c.dir = angle;
					c.ring = 0;
					c.ringSpeed = nadoRingSpeed+ringBonus;
					c.ringAccel = accel;
				
					c.angularSpeed = abs(nadoSpin);
					c.existance = 1600;
				
					c.image_xscale = 2;
					c.image_yscale = 2;
				
					var d = bulletFire(x, y, 0, 0, damage, owdBullets, id, true);
					d.type = 1;
					d.spinDir = sign(nadoSpin);
					d.dir = angle + 180;
					d.ring = 0;
					d.ringSpeed = nadoRingSpeed+ringBonus;
					d.ringAccel = accel;
				
					d.angularSpeed = abs(nadoSpin);
					d.existance = 1600;
				
					d.image_xscale = 2;
					d.image_yscale = 2;
				}
				nadoAngle += (nadoSpin/3);
			}
			if (nadoFireTimer > nadoFireDuration) {
				shoot_cooldown = shoot_delay/2;
				attack = 0;
				nadoFireTimer = 0;
				ringBonus = 0;
				
			}
		}
	}
	if (attack == 18) {
		wdFireShield();
		shoot_cooldown = shoot_delay;
	}
	if (attack == 8) {
		var target = oTruePlayer;
		var inc = 360/missleMax;
		if (missleMax > missleCount) {
			audio_play_sound(aBoom, 1, false, global.sfxAudio)
			var startingX = lengthdir_x(sprite_width/6, missleDir);
			var startingY = lengthdir_y(sprite_height/6, missleDir);
			var rocket = bulletFire(x+startingX, y+startingY, missleDir, 6, damage, oBadBullet, id);
			rocket.existance = 360;
			rocket.explodeTimer = 360;
			rocket.canExplode = true;
			rocket.explodeObj = oExplosiveRuneBoom;
			rocket.homingTarget = target;
			rocket.canFlash = true;
			rocket.canHome = true;
			rocket.turnSpeed = 1;
			rocket.homeSpeed = 6;
			rocket.homeDuration = 180;
			rocket.sprite_index = sRocket;
			missleDir += inc;
			missleCount++;
		} else {
			shoot_cooldown = shoot_delay;
			missleDir = 0;
			attack = 0;
			missleCount = 0;
		}
	}
}
//passive attacks
//randomly summons exploders
if (irandom(spawnPool) == 0) {
	var ranOffest = irandom_range(-128, 128)
    var enem = instance_create_layer(x+ranOffest, y+ranOffest, "Instances", oWastelandBurner);
	enem.xp = 0;
	enem. enemyHP = 0.85;
	enem.damage /= 2;
}

if (phase >= 1) {
	lineTimer++;
if (lineTimer >= lineInterval) {
    lineTimer = 0;
    for (var l = 0; l < lineCount; l++) {
		if (l == 1) {
			spawnFireLine(lineAngleCW);
		} else if (l == 2) {
			spawnFireLine(lineAngleCCW + 90);
		}
    }
	lineAngleCW += lineRotateSpeed;
	lineAngleCCW -= lineRotateSpeed;
}
}
