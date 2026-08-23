if (tempEnem) {
	exit;
}
if (!sub) {
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
if (!denyHP && !sub) {
	var blood = instance_create_layer(x, y, "Items", oRiftBloodSplatter)

	blood.image_xscale = image_xscale;
	blood.image_yscale = image_yscale;
}
if (oPlayerManager.hasExplosiveRune && !sub) {
	var explodeRune = instance_create_layer(x, y, "Instances", oExplosiveRuneBomb);
	explodeRune.damage = 25 + (damage);
}