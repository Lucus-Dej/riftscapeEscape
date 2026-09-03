if (tempEnem) {
	exit;
}
if (!sub) {
	if (oPlayerManager.hasPestRune) {
		var dir = point_direction(x, y, oTruePlayer.x, oTruePlayer.y);
		for (i = 0; i < irandom_range(2, 5); i++) {
			var f = bulletFire(x+irandom_range(-16, 16), y+irandom_range(-16, 16), dir, 6, 15, oPestBullet, oTruePlayer, true);
		}
	}
	if (oPlayerManager.hasExplosiveRune) {
		var explodeRune = instance_create_layer(x, y, "Instances", oExplosiveRuneBomb);
		explodeRune.damage = 25 + (damage);
	}
	if (!denyHP) {
		if (!oPlayerManager.hasFamineRune) {
			var blood = instance_create_layer(x, y, "Items", oRiftBloodSplatter)

			blood.image_xscale = image_xscale;
			blood.image_yscale = image_yscale;
		} else {
			var f = irandom_range(1, 6);
			if (f > 1) {
				var blood = instance_create_layer(x, y, "Items", oRiftBloodSplatter)

				blood.image_xscale = image_xscale;
				blood.image_yscale = image_yscale;
			}
		}
	}
	if (effectHorsePest && instance_exists(oDaggPestMinion)) {
		with (oDaggPestMinion) {
			pestPower++;
		}
	}
	if (isBoss) {
		oItemManager.conquestPower++;
		if (oItemManager.hasHorseCon && instance_exists(oSwordConquestMinion)) {
			with (oSwordConquestMinion) {
				if (!active) {
					active = true;
				}
			}
		}
	}
	var xpAdd = xp*oPlayerManager.xpMult/oPlayerManager.xpRuneReduction;
	addDamageNumber(display_get_gui_width()*0.49, 96, xpAdd, c_yellow, "+", true,,"XP");
	oPlayerManager.xpTotal += xpAdd;
}
if (path_exists(path)) {
    path_delete(path);
}
if (isBoss) {
	global.bossBarCount--;
	with (oEnemy) {
		if (isBoss && bossBarIndex > other.bossBarIndex) {
			bossBarIndex--;
		}
	}
}
