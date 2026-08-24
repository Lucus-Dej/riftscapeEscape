
if (variable_instance_exists(other, "invincible")) {
	 if (other.invincible) {
		exit; 
	 }
}
var parent = object_get_parent(other.object_index);
if (!array_contains(damageArray, other.id)) {
	skipDeath = false;
    var hit = other;
	lastHit = hit;
	array_push(damageArray, other.id);
	array_push(damageTimerArray, 0);
        oPlayerManager.lastKilledX = hit.x;
        oPlayerManager.lastKilledY = hit.y;
		other.flash = 1;
		if (oPlayerManager.canRich && richCount > 0 && other.sub != true) {
		   richCount--;
		   var searchRadius = 960;
		   var closest = noone;
		   var closestDist = 100000;
			with (oEnemy) {
				// Skip enemies already damaged
				if (array_contains(other.damageArray,id)) {
					continue;
				}
				var d = point_distance(other.x, other.y, x, y);
				var dCheck = collision_line(x, y, other.x, other.y, oBulletBlocker, false, false)
				if (d < searchRadius && d < closestDist && dCheck == noone) {
					closestDist = d;
					closest = id;
					//with (closest) {
					//	instance_create_layer(x,y, "Instances", oDust)
					//}
				}
			}
			
			if (closest != noone && instance_exists(closest) && other.sub != true) {
				
				var dir = point_direction(x, y, closest.x, closest.y);
				direction = dir;
				
				skipDeath = true;
				//var richBullet = bulletFire(x, y, dir, speed, damage/2, object_index, self);
				//copyBullet(id, richBullet)
				/*
				richBullet.spreadCount = spreadCount;
				richBullet.critShot = critShot;
				richBullet.ignoreEnemy = hit;
				richBullet.richCount = richCount;
				richBullet.bounceNum = bounceNum;
				richBullet.canSpread = canSpread;
				richBullet.image_xscale *= 0.75;
				richBullet.image_yscale *= 0.75;
				richBullet.image_blend = image_blend;
				richBullet.turretApplied = turretApplied;
				array_copy(richBullet.damageArray, 0, damageArray, 0, array_length(damageArray))
				array_copy(richBullet.damageTimerArray, 0, damageTimerArray, 0, array_length(damageTimerArray))
				*/
			}
		}
		if (primedForOil) {
			instance_create_layer(x, y, "Instances", oOilSpill);
		}
		if (primedForLightning) {
			instance_create_layer(x, y, "Instances", oLightningCircle);
		}
		if (oItemManager.hasUnstableEnergy && canSpread && spreadCount > 0 && other.sub != true) {
			//canSpread = false;
			spreadCount--;
			var cap = 3;
			var doubleChance = irandom_range(1, 60)
			if (doubleChance+global.playerTime > 60) {
				cap = 6;
			}
			var inc = 360/cap-1;
			var startingAng = irandom(360);
			for (var r = 0; r < cap; r++) {
				var unDir = startingAng + inc*r;
				var spreadShot = bulletFire(lastHit.x, lastHit.y, unDir, speed/2, damage/5, object_index, self);
				spreadShot.ignoreEnemy = hit;
				spreadShot.richCount = richCount;
				spreadShot.bounceNum = bounceNum;
				spreadShot.critShot = critShot;
				spreadShot.canSpread = canSpread;
				spreadShot.image_xscale *= 0.75;
				spreadShot.image_yscale *= 0.75;
				spreadShot.image_blend = image_blend;
				spreadShot.existance = existance*0.5;
				spreadShot.spreadCount = 0;
				array_copy(spreadShot.damageArray, 0, damageArray, 0, array_length(damageArray))
				array_copy(spreadShot.damageTimerArray, 0, damageTimerArray, 0, array_length(damageTimerArray))
			}
			
		} 
		if (critShot && oItemManager.hasMolotov) {
			callDOT(other, 0.25, 12, 8, dotType.fire, oTruePlayer);
		}
		if (oItemManager.hasBrokenSnowglobe) {
			damage += speedBonus;
		}
		if (critShot && oItemManager.hasRifterBloodSample) {
			for (var i = 0; i < irandom_range(12, 24); i++) {
				var spill = instance_create_layer(other.x+irandom_range(-64, 64), other.y+irandom_range(-64, 64), "Items", oBloodSpill)
				spill.dmg = damage*0.15;
				var scale = random_range(0.5, 2);
				scale = (other.image_xscale*0.5)*scale;
				spill.image_xscale = scale;
				spill.image_yscale = scale;
			}
			
		}
		switch (object_index) {
			case oBloodVialBullets:
			enemyTakeDamage(damage, hit, true, ,damageType.playerBlood);
			break;
			
			case oSwordLife:
			enemyTakeDamage(damage, other,true , , damageType.sword);
			break;
			
			case oMinonBullet:
			enemyTakeDamage(damage, hit, , , damageType.torzMinion);
			break;
			
			case oHuskBullet:
			enemyTakeDamage(damage, hit, , , damageType.husk);
			break;
			
			default:
			enemyTakeDamage(damage, hit);
			break;
		}
		
		if (canPois) {
			callDOT(other, damage*0.01, 12, 12, dotType.poison, oTruePlayer);
		}
		if (canLifesteal) {
			healPlayer(global.lifesteal, true)
		}
        // RICOCHET
       
		 if (oPlayerManager.canPierce || skipDeath) {
            damage *= 0.5;
        } else {
			instance_destroy();
		}
}
