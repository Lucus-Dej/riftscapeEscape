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

if (bounceNum > 0 && canBounce) {
	ignoreWall = other;
	bounceNum -= 1;
	var passedTracking = false;
	if (tracking > 0) {
		// if it should be tracking its angle based off of an enemy
		var searchRadius = 960;
		var closest = noone;
		var closestDist = 100000;
		with (oEnemy) {
			// Skip enemies already damaged
			if (array_contains(other.damageArray, id)) {
				continue;
			}
			var d = point_distance(other.x, other.y, x, y)
			var dCheck = collision_line(x, y, other.x, other.y, oBulletBlocker, true, false)
			if (d < searchRadius && d < closestDist && dCheck == noone) {
				closestDist = d;
				closest = id;
			}
		}
		if (closest != noone && instance_exists(closest)) {
			bounceTarget = closest;
			with (other) {
				other.collCheck = collision_line(other.x, other.y, closest.x, closest.y, oBulletBlocker, true, true)
			}
			if (collCheck == noone) {
				var trackingX = bounceTarget.x;
				var trackingY = bounceTarget.y;
		
				var trackVelX = lengthdir_x(bounceTarget.speed, bounceTarget.direction);
				var trackVelY = lengthdir_y(bounceTarget.speed, bounceTarget.direction);
		
				var dist = point_distance(x, y, trackingX, trackingY);
				var t = 0;
				if (speed != 0) {
					t = dist / speed;
				} else {
					t = dist /0.01 ;
				}
		
				var leadX = trackingX + trackVelX * t;
				var leadY = trackingY + trackVelY * t;
		
				var aimx = lerp(trackingX, leadX, tracking);
				var aimy = lerp(trackingY, leadY, tracking);
		
				newDir = point_direction(x, y, aimx, aimy);
				passedTracking = true;
			}
		} 
	}
	if (!passedTracking) {
		// if it should be tracking its angle based off the wall
		var velox = lengthdir_x(speed, direction);
		var veloy = lengthdir_y(speed, direction);

		var normx = 0;
		var normy = 0;
		
		var oldX = x - velox;
		var oldY = y - veloy;
		
		if (velox > 0 && oldX <= other.bbox_left) {
		    normx = -1;
		}
		else if (velox < 0 && oldX >= other.bbox_right) {
		    normx = 1;
		}
		else if (veloy > 0 && oldY <= other.bbox_top) {
		    normy = -1;
		}
		else if (veloy < 0 && oldY >= other.bbox_bottom) {
		    normy = 1;
		}

		var dot = velox * normx + veloy * normy;

		var rx = velox - 2 * dot * normx;
		var ry = veloy - 2 * dot * normy;
	
		newDir = point_direction(0, 0, rx, ry);
	}
	var nx = x + lengthdir_x(2, newDir);
	var ny = y + lengthdir_y(2, newDir);
	var newSpeed = max(abs(speed), 0.01);
	if (oItemManager.hasDirtyMirror) {
		damage*= 1.1;
	} else {
		damage *= 0.9;
	}
	if (oItemManager.hasHeartPendent) {
		damage *= 0.65;
		var copy = bulletFire(nx, ny, newDir+15, newSpeed, damage, object_index, self);
		if (tracking > 0) {
			//copy.tempGhostTimer = 3;
			copy.ignoreWall = ignoreWall;
		}
		copyBullet(id, copy)
		newDir -= 15;
	}
	var copy = bulletFire(nx, ny, newDir, newSpeed, damage, object_index, self);
	if (tracking > 0) {
		//copy.tempGhostTimer = 3;
		copy.ignoreWall = ignoreWall;
	}
	copyBullet(id, copy)
	instance_destroy()
} else {
	// destroy the bullet as it has no use
	if (!flying) {
		instance_create_layer(x, y, "Instances", oBoom);
		instance_destroy();
	}
}