function itemAdd(_item){
	var item = _item;
	array_push(oItemManager.itemList, item);
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
		oPlayerManager.boomerangDmg += 0.2;
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
		case oBloodyGem:
		oItemManager.hasBloodyGem = true;
		break;
		
		// powerful
		case oCrackedEgg:
		oItemManager.hasCrackedEgg = true;
		break;
		case oActionFigure:
		oItemManager.hasActionFigure = true;
		oItemManager.actionFigurePower++;
		break;
		case oLilFurnacePickup:
		oItemManager.hasLilFurnace = true;
		break;
		case oBrainInAJar:
		oPlayerManager.hasBrainInAJar = true;
		break;
		case oDirectorsNote:
		oPlayerManager.directorsDebuff += 1.8;
		oPlayerManager.statBulletDebuff -= 36;
		oPlayerManager.fireRateCap -= 4;
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
		oPlayerManager.statBulletDebuff -= 15.5;
		oPlayerManager.boomerangDmg += 0.1;
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
		case oSingularity:
		oItemManager.hasSingularity = true;
		break;
		case oWhisperingCrystal:
		oPlayerManager.canPierce = true;
		break;
		case oLostCrown:
		oItemManager.hasLostCrown = true;
		break
		
		
		// mythics
		case oSifterEssence:
		oItemManager.hasSifterEssence = true;
		essenceUp();
		break;
		case oAlextraEssence:
		oItemManager.hasAlextraEssence = true;
		thoughtUp();
		break;
		case oVirstEssence:
		oItemManager.hasVirstEssence = true;
		timeUp();
		break;
		case oTorzolEssence:
		oItemManager.hasTorzolEssence = true;
		lifeUp();
		break;
		case oVeribroseEssence:
		oItemManager.hasVeribroseEssence = true;
		fateUp();
		break;
		case oKrostEssence:
		oItemManager.hasKrostEssence = true;
		realityUp();
		break;
		
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

function displayItemFunction(_item){
	var item = _item;
	var desc = "null";
	var descLength = string_length(desc)
	switch (item) {
		case oBloodySkull:
		desc = "Essence Up";
		break;
		case oBlueprint:
		desc = "Reality Up";
		break;
		case oBurntBook:
		desc = "Fate Up";
		break;
		case oDeformedBrain:
		desc = "Thought Up";
		break;
		case oPottedPlant:
		desc = "Life Up";
		break;
		case oTornPainting:
		desc = "Time Up";
		break;
		
		// rares
		case oBloodyGem:
		desc = "Chance To Fire Bullets While In Overhealth";
		break;
		case oBrokenBloodVial:
		desc = "Blood Bullets, Damage Over Time";
		break;
		case oBrokenBoomerang:
		desc = "Boomerang Bullets";
		break;
		case oDirtyMirror:
		desc = "Very Bouncy Bullets";
		break;
		case oGenStone:
		desc = "???";
		break;
		case oHammer:
		desc = "More Damage To Cover";
		break;
		case oHollowedDice:
		desc = "Chance For Double Simple Items";
		break;
		case oIceSoup:
		desc = "Good Item Now, Bad Luck Later";
		break;
		case oRareSeed:
		desc = "Avoiding Damage Can Increase Your Life";
		break;
		case oSmallSculpture:
		desc = "Speed On Kill";
		break;
		case oWaterDamagedNote:
		desc = "First Hit Deals More Damage";
		break;
		
		// powerful
		case oCrackedEgg:
		desc = "In Overhealth, Become Immune To Contact Damage And Spread Poison"
		break;
		case oActionFigure:
		desc = "Summon Action Figure On Kill";
		break;
		case oLilFurnacePickup:
		desc = "A Friend Who Summons More Friends";
		break;
		case oBrainInAJar:
		desc = "Chance To Increase Cooldowns When Taking Damage";
		break;
		case oDirectorsNote:
		desc = "Massive Firerate Bonus, Massive Damage Reduction";
		break;
		case oGunpowder:
		desc = "Explosive Bullets";
		break;
		case oImageOfYou:
		desc = "Feed It...";
		break;
		case oLostAmulent:
		break;
		case oMagnet:
		desc = "Chance For Orbiting Bullets + Ghost Bullets";
		break;
		case oMetalOrb:
		desc = "More Shots";
		break;
		case oMirrorShard:
		desc = "Accurate Bouncing Bullets";
		break;
		case oReflectiveGem:
		desc = "Bullet On Item Use";
		break;
		case oSingularity:
		desc = "Homing Bullets";
		break;
		case oWhisperingCrystal:
		desc = "Piercing Bullets";
		break;
		case oLostCrown:
		desc = "Powerful Minions";
		break
		
		
		// mythics
		case oSifterEssence:
		desc = "Drain Nearby Enemies For Bonuses + Essence Up";
		break;
		case oAlextraEssence:
		desc = "Enemies Are Stunned When Spawned + Thought Up";
		break;
		case oVirstEssence:
		desc = "An Extra Life, At A Cost + Time Up";
		break;
		case oTorzolEssence:
		desc = "Regeneration + Life Up";
		break;
		case oVeribroseEssence:
		desc = "An Upcoming Choice + Fate Up";
		break;
		case oKrostEssence:
		desc = "Escalating Speed + Contact Damage + Reality Up";
		break;
		
		case oBrokenSnowglobe:
		desc = "Accelerating Bullets + Time Up + Faster Bullets Deal More Damage";
		break;
		case oElectricKite:
		desc = "Ricochet Bullets + Time Up";
		break;
		case oPoorFingerPainting:
		desc = "All Up";
		break;
		case oSacDagger:
		desc = "Extreme Lifesteal At A Cost + Essence Up";
		break;
		case oTesseract:
		desc = "Continuous Movement Grants Bonuses";
		break;
		case oTetheredSoulPickup:
		desc = "A Protective Friend + Extra Life + Fate Up";
		break;
		case oUnstableEnergy:
		desc = "Summon Bullets On Hit + Fate Up";
		break;
		case oBlackHoleCharge:
		desc = "Summon A Protective Blackhole";
		break;
		case oHarvestBook:
		desc = "Summon A Circle Of Protective Minions";
		break;
		case oDictionaryCharge:
		desc = "Random Stat Up";
		break;
		case oDeathBook:
		desc = "Kill All Non Boss Enemies";
		break;
		case oDreamsBook:
		desc = "Begin Again With What You Have Gained";
		break;
		case oThePathForward:
		desc = "Summon A Powerful Item";
		break;
		
	}
	descLength = string_length(desc)
	oItemManager.displayItemTimer = oItemManager.displayItemDuration;
	oItemManager.itemDesc = desc;
	oItemManager.itemDescLength = descLength;
}

function itemRemove(_item){
	var item = _item;
	var i = array_get_index(oItemManager.itemList, item);
	if (i != -1) {
		
		array_delete(oItemManager.itemList, i, 1);
		
		
		switch (item) {
		// commons
		case oBlueprint:
		realityDown()
		break;
		case oBloodySkull:
		essenceDown();
		break;
		case oBurntBook:
		fateDown();
		break;
		case oDeformedBrain:
		thoughtDown();
		break;
		case oPottedPlant:
		lifeDown();
		break;
		case oTornPainting:
		timeDown();
		break;
		
		// rares
		case oBrokenBloodVial:
		global.chosenBullet = oBullet;
		break;
		case oBrokenBoomerang:
		oItemManager.hasBrokenBoomerang = false;
		oPlayerManager.boomerangDmg -= 0.2;
		break;
		case oDirtyMirror:
		oItemManager.hasDirtyMirror = false;
		break;
		case oGenStone:
		oItemManager.hasGenStone = false;
		break;
		case oHammer:
		oItemManager.hasHammer = false;
		break;
		case oHollowedDice:
		oItemManager.hasHollowedDice = false;
		break;
		case oIceSoup:
		oItemManager.hasIceSoup = false;
		oItemManager.luckBonus += 15;
		break;
		case oRareSeed:
		oItemManager.hasRareSeed = false;
		// recalcing health
		lifeUp();
		lifeDown();
		break;
		case oSmallSculpture:
		oItemManager.hasSmallSculpture = false;
		break;
		case oWaterDamagedNote:
		oItemManager.hasWaterDamagedNote = false;
		break;
		case oBloodyGem:
		oItemManager.hasBloodyGem = false;
		break;
		
		// powerful
		case oCrackedEgg:
		oItemManager.hasCrackedEgg = false;
		break;
		case oActionFigure:
		oItemManager.hasActionFigure = false;
		oItemManager.actionFigurePower--;
		break;
		case oLilFurnacePickup:
		oItemManager.hasLilFurnace = false;
		break;
		case oBrainInAJar:
		oPlayerManager.hasBrainInAJar = false;
		break;
		case oDirectorsNote:
		oPlayerManager.directorsDebuff -= 1.8;
		oPlayerManager.statBulletDebuff += 36;
		oPlayerManager.fireRateCap += 4;
		break;
		case oGunpowder:
		oItemManager.hasGunpowder = false;
		break;
		case oImageOfYou:
		oItemManager.hasImageOfYou = false;
		if (instance_exists(oNotYou)) {
			instance_destroy(oNotYou);
		}
		break;
		case oLostAmulent:
		break;
		case oMagnet:
		oItemManager.hasMagnet = false;
		oPlayerManager.statBulletDebuff += 15.5;
		oPlayerManager.boomerangDmg -= 0.1;
		break;
		case oMetalOrb:
		oPlayerManager.statBulletDebuff -= 20;
		oItemManager.hasMetalOrb = false;
		break;
		case oMirrorShard:
		oPlayerManager.statBulletDebuff -= 20;
		oItemManager.hasMirrorShard = false;
		break;
		case oReflectiveGem:
		oItemManager.hasReflectiveGem = false;
		break;
		case oSingularity:
		oItemManager.hasSingularity = false;
		break;
		case oWhisperingCrystal:
		oPlayerManager.canPierce = false;
		break;
		case oLostCrown:
		oItemManager.hasLostCrown = false;
		break
		
		// mythics
		case oSifterEssence:
		oItemManager.hasSifterEssence = false;
		essenceDown();
		break;
		case oAlextraEssence:
		oItemManager.hasAlextraEssence = false;
		thoughtDown();
		break;
		case oVirstEssence:
		oItemManager.hasVirstEssence = false;
		timeDown();
		break;
		case oTorzolEssence:
		oItemManager.hasTorzolEssence = false;
		lifeDown();
		break;
		case oVeribroseEssence:
		oItemManager.hasVeribroseEssence = false;
		fateDown();
		break;
		case oKrostEssence:
		oItemManager.hasKrostEssence = false;
		realityDown();
		break;
		
		case oBrokenSnowglobe:
		oItemManager.hasBrokenSnowglobe = false;
		oPlayerManager.statBulletDebuff -= 10;
		timeDown();
		break;
		case oElectricKite:
		oPlayerManager.canRich = false
		oPlayerManager.statBulletDebuff -= 20;
		timeDown();
		break;
		case oPoorFingerPainting:
		fateDown();
		realityDown();
		timeDown();
		essenceDown();
		thoughtDown();
		lifeDown();
		break;
		case oSacDagger:
		oItemManager.sacDaggerPenalty -= 1.3;
		essenceDown();
		oItemManager.sacDaggerBonus -= 3;
		break;
		case oTesseract:
		oItemManager.hasTesseract = false;
		realityDown();
		break;
		case oTetheredSoulPickup:
		oItemManager.hasTetheredSoul = false;
		if (instance_exists(oTetheredSoul)) {
			var currentHP = global.player_health;
			instance_destroy(oTetheredSoul);
			global.player_health = currentHP;
		}
		fateDown();
		break;
		case oUnstableEnergy:
		oItemManager.hasUnstableEnergy = false;
		oPlayerManager.statBulletDebuff -= 20;
		timeDown();
		break;
		}
	}
}
function refreshItem (_rairty, _item) {
	switch (_rairty) {
		case 1:
		ds_list_add(oItemManager.rareItemList, _item);
		break;
		
		case 2:
		ds_list_add(oItemManager.powerfulItemList, _item);
		break;
		
		case 3:
		ds_list_add(oItemManager.mythicItemList, _item);
		break;
	}
}
function rollItem(_chargeFilter) {
	var totalPool = 0;
	var simpleMax = -1;
	var rareMax = -1;
	var powerfulMax = -1;
	var mythicMax = -1;
	var attempts = 10;

	if (ds_list_size(oItemManager.simpleItemList) > 0) {
		totalPool += oItemManager.simplePool;
		simpleMax = totalPool;
	}

	if (ds_list_size(oItemManager.rareItemList) > 0) {
		totalPool += oItemManager.rarePool;
		rareMax = totalPool;
	}

	if (ds_list_size(oItemManager.powerfulItemList) > 0) {
		totalPool += oItemManager.powerfulPool;
		powerfulMax = totalPool;
	}

	if (ds_list_size(oItemManager.mythicItemList) > 0) {
		totalPool += oItemManager.mythicPool;
		mythicMax = totalPool;
	}

	if (totalPool <= 0) return noone;

	var j = irandom(totalPool - 1 + global.playerTime) + oItemManager.luckBonus;
	j = clamp(j, 0, totalPool - 1);

	var chosenList;

	if (simpleMax != -1 && j < simpleMax) {
		chosenList = oItemManager.simpleItemList;
	}
	else if (rareMax != -1 && j < rareMax) {
		chosenList = oItemManager.rareItemList;
	}
	else if (powerfulMax != -1 && j < powerfulMax) {
		chosenList = oItemManager.powerfulItemList;
	}
	else {
		chosenList = oItemManager.mythicItemList;
	}

	var i = irandom(ds_list_size(chosenList) - 1);
	var item = chosenList[| i];
	var check = false;
	if (ds_list_find_index(oItemManager.bookList, item) != -1 && _chargeFilter) {
		var l = irandom(ds_list_size(oItemManager.simpleItemList) - 1);
		item = oItemManager.simpleItemList[| l];
		check = true;
	}
	if (!check && chosenList != oItemManager.simpleItemList) {
		ds_list_delete(chosenList, i);
	}
	show_debug_message(item)
	return item;
}