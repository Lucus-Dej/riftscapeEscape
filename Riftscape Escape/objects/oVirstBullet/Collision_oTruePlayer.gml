var parent = object_get_parent(other.object_index);
if (!array_contains(damageArray, other.id)) {
    var hit = other;
	lastHit = hit;
	array_push(damageArray, other.id);
	array_push(damageTimerArray, 0);
	other.flash = 1;
		if (oItemManager.hasUnstableEnergy && canSpread && spreadCount > 0) {
			//canSpread = false;
			spreadCount--;
			var cap = 6;
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
			callDOT(other, 0.25, 8, 12, dotType.fire, id);
		}
		if (oItemManager.hasBrokenSnowglobe) {
			damage += speedBonus;
		}
		playerTakeDamage(damage)
		if (oItemManager.hasBloodVial) {
			callDOT(other, 0.5, 12, 12, dotType.blood, id);
		}
        // RICOCHET
       
		 if (!oPlayerManager.canPierce) {
            instance_destroy();
        }
}