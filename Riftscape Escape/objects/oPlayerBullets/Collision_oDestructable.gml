if (!array_contains(damageArray, other.id)) {
	array_push(damageArray, other.id);
	array_push(damageTimerArray, 0);
	//show_debug_message("HITTING BREAKABLE WALL "+string(other.obHP))
	if (oItemManager.hasHammer) {
		other.obHP -= damage*8;
	} else {
		other.obHP -= damage;
	}
	if (other.obHP <= 0) {
		var t = instance_create_layer(x, y, "Instances", global.explosionBullet);
		if (oItemManager.hasGunpowder) {
			t.purpose = 1;
		}
		instance_destroy(other)
	}
} else {
	exit;
}

if (!canBounce && bounceNum  <= 0) {
	if (!oItemManager.hasMagnet) {
		instance_destroy();
	}
} else if (bounceNum > 0) {
	// mark the wall that it bounced from via other.id
	ignoreWall = other.id;
	var searchRadius = 960;
	var closest = noone;
	var closestDist = 100000;
	bounceNum -= 1;
	if (tracking > 0)
	with (oEnemy) {
		// Skip enemies already damaged
		if (array_contains(other.damageArray, id)) {
			continue;
		}
		var dCheck = collision_line(x, y, other.x, other.y, oBulletBlocker, false, false)
		var d = point_distance(other.x, other.y, x, y)
			if (d < searchRadius && d < closestDist && dCheck == noone) {
				closestDist = d;
				closest = id;
			}
		}
		if (closest != noone && instance_exists(closest)) {
			bounceTarget = closest;
			with (other) {
				other.collCheck = collision_line(other.x, other.y, closest.x, closest.y, oBulletBlocker, false, true)
			}
			
		}
	if (bounceTarget == noone || !instance_exists(bounceTarget)) {	
		var vx = lengthdir_x(speed, direction);
		var vy = lengthdir_y(speed, direction);
	
			if (abs(x - other.x) > abs(y - other.y)) {
				vx *= -1;
			} else {
				vy *= -1;
			}
			newDir = point_direction(0,0,vx,vy);
		} else {
		var tx = bounceTarget.x;
		var ty = bounceTarget.y;
		
		var tvx = lengthdir_x(bounceTarget.speed, bounceTarget.direction);
		var tvy = lengthdir_y(bounceTarget.speed, bounceTarget.direction);
		
		var dist = point_distance(x, y, tx, ty);
		var t = 0;
		if (speed != 0) {
			t = dist / speed;
		} else {
			t = dist /0.01 ;
		}
		
		
		var leadx = tx + tvx * t;
		var leady = ty + tvy * t;
		
		var aimx = lerp(tx, leadx, tracking);
		var aimy = lerp(ty, leady, tracking);
		
		newDir = point_direction(x, y, aimx, aimy);
		if (is_nan(newDir)) {
			newDir = direction; 
		}
	}
	// summon secondary projectile with everything this projectile has
	var nx = x + lengthdir_x(2, newDir);
	var ny = y + lengthdir_y(2, newDir);
	var newSpeed = max(abs(speed), 0.01);
	if (oItemManager.hasHeartPendent) {
		damage *= 0.65;
		var copy = bulletFire(nx, ny, newDir+15, newSpeed*1.2, damage*0.8, object_index, self);
		copyBullet(id, copy)
		newDir -= 15;
	}
	var copy = bulletFire(nx, ny, newDir, newSpeed*1.2, damage*0.8, object_index, self);
	copyBullet(id, copy)
	instance_destroy()
	
} else {
	if (!flying && tempGhostTimer <= 0) {
		instance_create_layer(x, y, "Instances", oBoom);
		instance_destroy();
	}
}