if (brainDead) {
    exit;
}
path_timer--;
flash = max(0, flash - 0.15);

// enraged
if (enrage_point >= enemey_hp && enraged == false) {
    enemSpeed -= 0.2;
    bullet_speed += 1;
    shoot_delay -= 30;
    enraged = true;
    summonNum = 1;
    rounds += 3;
    fireDelay -= 4;
    roundDiraction -= 10;
    spawnEnemy = oEnemSandSniper;
    shotTotal += 20;
    shotTimer -= 5;
    spinSpeed--;
	attack = 0;
	shotsFired = 0;
    shoot_cooldown = shoot_delay;
}

if (enrage_point2 >= enemey_hp && enraged2 == false) {
    enemSpeed = 0.3;
    bullet_speed += 1;
    shoot_delay -= 30;
    summonNum += 2;
    rounds += 1;
    fireDelay -= 6;
    enraged2 = true;
    roundDiraction -= 20;
    spawnEnemy = oEnemDesertBiter;
    shotTotal += 30;
    shotTimer += 2;
    spinSpeed -= 2;
	attack = 0;
	shotsFired = 0;
    shoot_cooldown = shoot_delay;
}

if (attack == 0) {
    if (enraged2) {
        enragedRan = irandom_range(1 ,2)
    }
    attack = irandom_range(1, 6);
}

// countdown
if (shoot_cooldown > 0) {
    shoot_cooldown--;
}

// fire when ready
if (shoot_cooldown <= 0) {
    if (attack == 1 or attack == 2 or attack == 3) {
        if (shotsFired < rounds) {
            fireDelay--;
            if (!enraged2) {
                if (fireDelay <= 0) {
                    var ang = point_direction(x, y, oTruePlayer.x, oTruePlayer.y);
                    if (oPlayerManager.hasCircleTime && oTruePlayer.inCircle) {
                        ang = point_direction(x, y, mouse_x, mouse_y);
                    }
                    bulletFire(x, y, ang + roundDiraction, bullet_speed * 1.5, damage, oBossBullet, id);
                    bulletFire(x, y, ang - roundDiraction, bullet_speed * 1.5, damage, oBossBullet, id);
                    shotsFired++;
                    fireDelay = 32;
                }
            } else {
            if (fireDelay <= 0) {
                var ang = point_direction(x, y, oTruePlayer.x, oTruePlayer.y);
				
                switch (enragedRan) {
                    case 1:

                        if (oPlayerManager.hasCircleTime && oTruePlayer.inCircle) {
                            ang = point_direction(x, y, mouse_x, mouse_y);
                        }

                        bulletFire(x, y, ang + roundDiraction, bullet_speed * 1.2, damage, oBossBullet, id);
                        bulletFire(x, y, ang - roundDiraction, bullet_speed * 1.2, damage, oBossBullet, id);

                    break;

                    case 2:

                        bulletFireAt(x, y, oTruePlayer, bullet_speed * 1.5, damage * 1.2, oBossBullet, id);

                    break;
                }
				enragedRan = irandom_range(1 ,2)
                shotsFired++;
                fireDelay = 36;
			}
            }
        }
        if (shotsFired >= rounds) {
            bulletFireAt(x, y, oTruePlayer, bullet_speed * 0.9, damage * 2, oBossBullet, id);
            shotsFired = 0;
            shoot_cooldown = shoot_delay;
            attack = 0;
        }

    } else if (attack == 4 or attack == 5) {
		if (instance_exists(spawnEnemy)) {
			var ang = point_direction(x, y, oTruePlayer.x+oTruePlayer.hsp*bullet_speed, oTruePlayer.y+oTruePlayer.vsp*bullet_speed);
			bulletFire(x, y, ang, bullet_speed * 0.9, damage * 2, oBossBullet, id);
			attack = 0;
			shoot_cooldown = shoot_delay;
		} else {
		
        // summon attack
        for (var i = 0; i < summonNum; i++) {
            var range = irandom_range(-32, 32);
            var c = instance_create_layer(x + range, y + range, "Instances", spawnEnemy);
            c.xp = 0;
        }

        attack = 0;
        shoot_cooldown = shoot_delay;
		}

    } else if (attack == 6) {

        // spin of bullets
        if (shotTimer > 0) {
            shotTimer--;
        }

        if (shotTimer <= 0) {
            var bullet = instance_create_layer(x, y, "Instances", oBossBullet);
            shotsFired++;
            bullet.damage = damage / 2;
            bullet.direction = shotAngle;
            bullet.speed = spinSpeed;
            shotAngle += 137.5;
            shotTimer = 8;
        }

        if (shotsFired >= shotTotal) {
            shotsFired = 0;
            attack = 0;
            shoot_cooldown = shoot_delay;
        }
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