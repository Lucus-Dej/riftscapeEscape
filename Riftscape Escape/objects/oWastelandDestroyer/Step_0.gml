if (brainDead) {
    exit;
}
path_timer--;
flash = max(0, flash - 0.15);
if (!bossModApplied && isBoss) {
	bossModApplied = true;
	enemey_hp *= hpMult;
	base_speed *= speedMult;
	damage *= dmgMult;
	shoot_delay /= cooldownMult;
	event_user(13);
}
if ((enemey_hp <= phasePoint1) && phase < 1) {
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
if ((enemey_hp <= phasePoint2) && phase < 2) {
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
	lineInterval -=2;
	lineRotateSpeed += 1.25;
	with oEnemStart {
		if (RoomID == other.RoomID) {
			var e = instance_create_layer(x, y, "Instances", oWastelandFireRunner);
			e.enemey_hp /= 8;
			e.phasePoint1 /= 8;
		}
	}
}
if (attack == 0) {
	attack = irandom_range(1, 7);
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
					var d = bulletFire(x, y, 0, 0, damage, owdBullets, id);
					d.type = 1;
					d.spinDir = sign(nadoSpin);
					d.dir = angle;
					d.ring = 0;
					d.ringSpeed = nadoRingSpeed+ringBonus;
					d.ringAccel = accel;
				
					d.angularSpeed = abs(nadoSpin);
					d.existance = 800;
				
					d.image_xscale = 2;
					d.image_yscale = 2;
					
					var f = bulletFire(x, y, 0, 0, damage, owdBullets, id);
					f.type = 1;
					f.spinDir = sign(nadoSpin);
					f.dir = angle+120;
					f.ring = 0;
					f.ringSpeed = nadoRingSpeed+ringBonus;
					f.ringAccel = accel;
				
					f.angularSpeed = abs(nadoSpin);
					f.existance = 800;
				
					f.image_xscale = 2;
					f.image_yscale = 2;
					
					var c = bulletFire(x, y, 0, 0, damage, owdBullets, id);
					c.type = 1;
					c.spinDir = sign(nadoSpin);
					c.dir = angle+240;
					c.ring = 0;
					c.ringSpeed = nadoRingSpeed+ringBonus;
					c.ringAccel = accel;
				
					c.angularSpeed = abs(nadoSpin);
					c.existance = 800;
				
					c.image_xscale = 2;
					c.image_yscale = 2;
				}
				if (phase == 2) {
					var c = bulletFire(x, y, 0, 0, damage, owdBullets, id);
					c.type = 1;
					c.spinDir = sign(nadoSpin);
					c.dir = angle + 90;
					c.ring = 0;
					c.ringSpeed = nadoRingSpeed+ringBonus;
					c.ringAccel = accel;
				
					c.angularSpeed = abs(nadoSpin);
					c.existance = 800;
				
					c.image_xscale = 2;
					c.image_yscale = 2;
					
					var d = bulletFire(x, y, 0, 0, damage, owdBullets, id);
					d.type = 1;
					d.spinDir = sign(nadoSpin);
					d.dir = angle + 270;
					d.ring = 0;
					d.ringSpeed = nadoRingSpeed+ringBonus;
					d.ringAccel = accel;
				
					d.angularSpeed = abs(nadoSpin);
					d.existance = 800;
				
					d.image_xscale = 2;
					d.image_yscale = 2;
				}
				if (phase == 0 || phase == 2) {
					var c = bulletFire(x, y, 0, 0, damage, owdBullets, id);
					c.type = 1;
					c.spinDir = sign(nadoSpin);
					c.dir = angle;
					c.ring = 0;
					c.ringSpeed = nadoRingSpeed+ringBonus;
					c.ringAccel = accel;
				
					c.angularSpeed = abs(nadoSpin);
					c.existance = 800;
				
					c.image_xscale = 2;
					c.image_yscale = 2;
				
					var d = bulletFire(x, y, 0, 0, damage, owdBullets, id);
					d.type = 1;
					d.spinDir = sign(nadoSpin);
					d.dir = angle + 180;
					d.ring = 0;
					d.ringSpeed = nadoRingSpeed+ringBonus;
					d.ringAccel = accel;
				
					d.angularSpeed = abs(nadoSpin);
					d.existance = 800;
				
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
	if (attack == 8) {
		wdFireShield();
		shoot_cooldown = shoot_delay;
	}
}
//passive attacks
//randomly summons exploders
if (irandom(spawnPool) == 0) {
	var ranOffest = irandom_range(-128, 128)
    var enem = instance_create_layer(x+ranOffest, y+ranOffest, "Instances", oWastelandBurner);
	enem.xp = 0;
	enem.enemey_hp = 0.85;
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