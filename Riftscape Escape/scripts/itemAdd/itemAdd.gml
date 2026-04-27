function itemAdd(_item){
	var item = _item;
	
	switch (item) {
		// commons
		case oBlueprint:
		realityUp();
		break;
		case oBloodySkull:
		essenceUp();
		break;
		case oBurntBook:
		fateUp();
		break;
		case oDeformedBrain:
		thoughtUp();
		break;
		case oPottedPlant:
		lifeUp();
		break;
		case oTornPainting:
		timeUp();
		break;
		
		// rares
		case oBrokenBloodVial:
		global.chosenBullet = oBloodVialBullets;
		break;
		case oBrokenBoomerang:
		oItemManager.hasBrokenBoomerang = true;
		oPlayerManager.boomerangDmg = 0.2;
		break;
		case oDirtyMirror:
		oItemManager.hasDirtyMirror = true;
		break;
		case oGenStone:
		oItemManager.hasGenStone = true;
		break;
		case oHammer:
		oItemManager.hasHammer = true;
		break;
		case oHollowedDice:
		oItemManager.hasHollowedDice = true;
		break;
		case oIceSoup:
		oItemManager.hasIceSoup = true;
		var spawner = instance_nearest(x, y, oItemFlag)
		with (spawner) {
			event_user(0);
		}
		break;
		case oRareSeed:
		oItemManager.hasRareSeed = true;
		break;
		case oSmallSculpture:
		oItemManager.hasSmallSculpture = true;
		break;
		case oWaterDamagedNote:
		oItemManager.hasWaterDamagedNote = true;
		break;
		case oActionFigure:
		oItemManager.hasActionFigure = true;
		oItemManager.actionFigurePower++;
		break;
		case oBrainInAJar:
		oPlayerManager.hasBrainInAJar = true;
		break;
		case oDirectorsNote:
		oPlayerManager.directorsDebuff += 2.5;
		oPlayerManager.statBulletDebuff -= 37.5;
		break;
		case oGunpowder:
		oItemManager.hasGunpowder = true;
		break;
		case oImageOfYou:
		oItemManager.hasImageOfYou = true;
		break;
		case oLostAmulent:
		break;
		case oMagnet:
		oItemManager.hasMagnet = true;
		break;
		case oMetalOrb:
		oPlayerManager.statBulletDebuff += 20;
		oItemManager.hasMetalOrb = true;
		break;
		case oMirrorShard:
		oPlayerManager.statBulletDebuff += 20;
		oItemManager.hasMirrorShard = true;
		break;
		case oReflectiveGem:
		oItemManager.hasReflectiveGem = true;
		break;
		case oSifterEssence:
		oItemManager.hasSifterEssence = true;
		break;
		case oSingularity:
		oItemManager.hasSingularity = true;
		break;
		case oWhisperingCrystal:
		oPlayerManager.canPierce = true;
		break;
		
		// mythics
		case oBrokenSnowglobe:
		oItemManager.hasBrokenSnowglobe = true;
		oPlayerManager.statBulletDebuff += 10;
		timeUp();
		break;
		case oElectricKite:
		oPlayerManager.canRich = true
		oPlayerManager.statBulletDebuff += 20;
		timeUp();
		break;
		case oPoorFingerPainting:
		fateUp();
		realityUp();
		timeUp();
		essenceUp();
		thoughtUp();
		lifeUp();
		break;
		case oSacDagger:
		oItemManager.sacDaggerPenalty += 1.3;
		essenceUp();
		oItemManager.sacDaggerBonus += 3;
		break;
		case oTesseract:
		oItemManager.hasTesseract = true;
		realityUp();
		break;
		case oTetheredSoulPickup:
		oItemManager.hasTetheredSoul = true;
		fateUp();
		break;
		case oUnstableEnergy:
		oItemManager.hasUnstableEnergy = true;
		oPlayerManager.statBulletDebuff += 20;
		timeUp();
		break;
		
	}
}
function itemRemove(){

}