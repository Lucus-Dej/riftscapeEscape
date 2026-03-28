if (brainDead) {
    exit;
}
//path timer reduction
path_timer--;
show_debug_message(hostSearchTimer)
var distPlayer = point_distance(x, y, oTruePlayer.x, oTruePlayer.y)
if (!canSeePlayer && vessel != noone || (vessel == noone  && distPlayer > 256)) {
	enemSpeed = base_speed*12;
} else if (canSeePlayer) {
	enemSpeed = base_speed;
}
flash = max(0, flash - 0.15);

// countdown
if (shoot_cooldown > 0 && canSeePlayer && vessel == noone) {
    shoot_cooldown--;
}

if (shoot_cooldown <= 0) {
	recoil_timer--;
	if (recoil_timer <= 0) {
		fire_timer --;
		if (fire_timer > 0) {
			if (oPlayerManager.hasCircleTime && oTruePlayer.inCircle) {
				var circleAng = point_direction(x, y, mouse_x, mouse_y);
				var a = bulletFire(x, y, circleAng, bullet_speed, damage, oMiniBossBullet, id);
		} else {
			var playerAng = point_direction(x, y, oTruePlayer.x, oTruePlayer.y);
			var a =  bulletFire(x, y, playerAng - 65, bullet_speed, damage, oMiniBossBullet, id);
			a.canBounce = true;
			a.bounceTarget = oTruePlayer;
			a.tracking = 1;
			a.canAccel = true;
			
			var b =  bulletFire(x, y, playerAng + 65,bullet_speed, damage, oMiniBossBullet, id);
			b.canBounce = true;
			b.bounceTarget = oTruePlayer;
			b.tracking = 1;
			b.canAccel = true;
		}
		recoil_timer = recoil_cooldown;
	} else {
		shoot_cooldown = shoot_delay;
		recoil_timer = recoil_cooldown;
		fire_timer = fire_duration;
		}
	}
}



if (hostSearchTimer > 0 && vessel == noone) {
	hostSearchTimer--;
}

if (hostSearchTimer <= 0 && vessel == noone) {
	show_debug_message("SEARCHING FOR VESSEL");
	best = noone;
	bestDist = 999999;
	
	// search for nearby enemy with an xp and hp value less than its own
	ds_list_clear(enemySearchList);
	
	var count = collision_circle_list(x, y, 320, oEnemy, false, true, enemySearchList, false);
	
	for (var i = 0; i < count; i++) {
		var inst = enemySearchList[| i];
		if (inst == id) continue;
		if (inst.brainDead) continue;
			
		 if (inst.xp < xp && inst.enemey_hp < enemey_hp) {
			 var d = point_distance(x, y, inst.x, inst.y);
			 
			 if (d < bestDist) {
				 best = inst;
				 bestDist = d;
			 }
		 }
	}
	show_debug_message("VESSEL FOUND");
	vessel = best;
	linkLine = instance_create_layer(x, y, "Instances", oEnemyLink);
	linkLine.enemyA = id;
	linkLine.enemyB = vessel;
	heldHP = enemey_hp;
}
	if (instance_exists(vessel)) {
		image_alpha = 0.35;
		enemey_hp = heldHP;
		invincible = true;
		if (vesselInit == false) {
			vessel.brainDead = true;
			hostSearchTimer = hostSearchCooldown;
			with vessel {
				VesselBaseSpeed = other.VesselBaseSpeed;
				VesselEnemSpeed = other.VesselBaseSpeed
				VesselDamage = other.VesselDamage;
				VesselBulletSpeed = other.VesselBulletSpeed;
				VesselPath_cooldown = other.VesselPath_cooldown;
				VesselPath_timer = other.VesselPath_cooldown;
				VesselShoot_cooldown = other.VesselShoot_cooldown;
				VesselShootTimer = other.VesselShootTimer
				path_end();
			}
			vesselInit = true;
			
		}
// ------------- VESSEL "STEP CODE" --------
		with (vessel) {
			show_debug_message(VesselPath_timer)
			//path timer reduction
			VesselPath_timer--;
			
			
			if (VesselShootTimer > 0) {
				VesselShootTimer --;
			}
			
			if (!canSeePlayer) {
				VesselEnemSpeed = VesselBaseSpeed*9;
			} else if (canSeePlayer) {
				VesselEnemSpeed = VesselBaseSpeed;
			}
			
			
			flash = max(0, flash - 0.15);
			
			if (VesselShootTimer <= 0) {
				var dir = point_direction(x, y, oTruePlayer.x, oTruePlayer.y);
				var angMult = 25;
				var ranSpeed = irandom_range(1, 3);
				
				var bullet = bulletFire(x, y, dir+(angMult*2), VesselBulletSpeed+ranSpeed, VesselDamage, oBossBullet, id)
					bullet.canBounce = true;
					bullet.bounceTarget = oTruePlayer;
					bullet.tracking = 0.65;
					ranSpeed = irandom_range(1, 3);
				bullet = bulletFire(x, y, dir+(angMult*1), VesselBulletSpeed+ranSpeed, VesselDamage, oBossBullet, id)
					bullet.canBounce = true;
					bullet.bounceTarget = oTruePlayer;
					bullet.tracking = 0.65;
					ranSpeed = irandom_range(1, 3);
				bullet = bulletFire(x, y, dir+(angMult*-1), VesselBulletSpeed+ranSpeed, VesselDamage, oBossBullet, id)
					bullet.canBounce = true;
					bullet.bounceTarget = oTruePlayer;
					bullet.tracking = 0.65;
					ranSpeed = irandom_range(1, 3);
				bullet = bulletFire(x, y, dir+(angMult*-2), VesselBulletSpeed+ranSpeed, VesselDamage, oBossBullet, id)
					bullet.canBounce = true;
					bullet.bounceTarget = oTruePlayer;
					bullet.tracking = 0.65;
				VesselShootTimer = VesselShoot_cooldown;
			}
			
			if (VesselPath_timer <= 0) {
				VesselPath_timer = VesselPath_cooldown;
				pathfind(global.Grid, oTruePlayer, VesselEnemSpeed, id);
			}
		}
	} else {
		vesselInit = false;
		best = noone;
		vessel = noone;
		heldHP = 0;
		invincible = false;
		image_alpha = 1;
}



//pathfinding
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