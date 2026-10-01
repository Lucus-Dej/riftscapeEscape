if (oPlayerManager.hasCircleLife)
oPlayerManager.dodgeLifeHP += 0.04 + global.playerFate*0.015

if (oItemManager.hasPoisonCharm) {
	callDOT(other, (0.5 + global.playerFate*0.02)*0.5, 12, 12, dotType.poison, oTruePlayer);
}

if (oItemManager.hasBloodCharm) {
	var bloodCheck = irandom_range(1, 12) + global.playerTime * 0.6;
	if (bloodCheck >= 12) {
		var spill = instance_create_layer(other.x, other.y, "Items", oBloodSpill)
		spill.dmg = 0.04 + global.playerFate*0.015
		var scale = random_range(0.5, 2);
		scale = (image_xscale*0.5)*scale;
		spill.image_xscale = scale;
		spill.image_yscale = scale;
	}
}