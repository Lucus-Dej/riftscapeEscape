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
		case oD2:
		oItemManager.hasD2 = true;
		break;
		case oWeeklyPaycheck:
		oItemManager.hasWeeklyPaycheck = true;
		oItemManager.luckBonus += 8;
		var spawn = instance_nearest(x, y, oItemFlag)
		with (spawn) {
			event_user(1);
		}
		break;
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
		case oMolotov:
		oItemManager.hasMolotov = true;
		break;
		case oDoubleOrNothing:
		oItemManager.hasDoubleOrNothing = true;
		break;
		case oHeartPendent:
		oItemManager.hasHeartPendent = true;
		break;
		case oWeightlessHourglass:
		oItemManager.hasWeightlessHourglass = true;
		break;
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
		oPlayerManager.statBulletDebuff -= 22;
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
		oPlayerManager.statBulletDebuff += 6;
		oItemManager.hasMetalOrb = true;
		break;
		case oMirrorShard:
		oPlayerManager.statBulletDebuff += 6;
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
		
		case oHauntedGravestone:
		oItemManager.hasHauntedGravestone = true;
		break;
		case oPetrifiedHeart:
		oItemManager.hasPetrifiedHeart = true;
		essenceUp();
		break;
		case oBrokenSnowglobe:
		oItemManager.hasBrokenSnowglobe = true;
		oPlayerManager.statBulletDebuff += 6;
		timeUp();
		break;
		case oElectricKite:
		oPlayerManager.canRich = true
		oPlayerManager.statBulletDebuff += 12;
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
		lifeUp();
		lifeDown();
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
		oPlayerManager.statBulletDebuff += 12;
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
		desc = "Bloody Skull: Essence Up";
		break;
		case oBlueprint:
		desc = "Blueprint: Reality Up";
		break;
		case oBurntBook:
		desc = "Burnt Book: Fate Up";
		break;
		case oDeformedBrain:
		desc = " Deformed Brain: Thought Up";
		break;
		case oPottedPlant:
		desc = "Potted Plant: Life Up";
		break;
		case oTornPainting:
		desc = "Torn Painting: Time Up";
		break;
		
		// rares
		case oD2:
		desc = "D2: Chance To Reroll An Item When Taking Damage. Gain Luck When This Occurs";
		break;
		case oWeeklyPaycheck:
		desc = "Weekly Paycheck: Simple Item Now, More Luck Later";
		break;
		case oBloodyGem:
		desc = "Bloody Gem: Chance To Fire Bullets While In Overhealth";
		break;
		case oBrokenBloodVial:
		desc = "Broken Blood Vial: Blood Bullets, Damage Over Time";
		break;
		case oBrokenBoomerang:
		desc = "Broken Boomerang: Boomerang Bullets";
		break;
		case oDirtyMirror:
		desc = "Dirty Mirror: Very Bouncy Bullets";
		break;
		case oGenStone:
		desc = "???";
		break;
		case oHammer:
		desc = "Hammer: More Damage To Cover";
		break;
		case oHollowedDice:
		desc = "Hollowed Dice: Chance For Double Simple Items";
		break;
		case oIceSoup:
		desc = "Ice Soup: Good Item Now, Bad Luck Later";
		break;
		case oRareSeed:
		desc = "Rare Seed: Avoiding Damage Can Increase Your Life";
		break;
		case oSmallSculpture:
		desc = "Small Sculpture: Speed On Kill";
		break;
		case oWaterDamagedNote:
		desc = "Water Damaged Note: First Hit Deals More Damage";
		break;
		
		// powerful
		case oMolotov:
		desc = "Molotov: Critical Hits Apply A Fire DoT. Enemies Spread Fire DoT Upon Death";
		break;
		case oDoubleOrNothing:
		desc = "Double Or Nothing: Skipping An Item Can Reward You Or Could Do Nothing";
		break;
		case oHeartPendent:
		desc = "Heart Pendent: Bullets Split On Bounce";
		break;
		case oWeightlessHourglass:
		desc = "Weightless Hourglass: Bullets Slow, Gaining Bonus Damage And Size"
		break;
		case oCrackedEgg:
		desc = "Cracked Egg: In Overhealth, Become Immune To Contact Damage And Spread Poison"
		break;
		case oActionFigure:
		desc = "Action Figure: Summon Action Figure On Kill";
		break;
		case oLilFurnacePickup:
		desc = "Lil Furnace: A Friend Who Summons More Friends";
		break;
		case oBrainInAJar:
		desc = "Brain In A Jar: Chance To Increase Cooldowns When Taking Damage";
		break;
		case oDirectorsNote:
		desc = "Director's Note: Massive Firerate Bonus, Massive Damage Reduction";
		break;
		case oGunpowder:
		desc = "Gunpowder: Explosive Bullets";
		break;
		case oImageOfYou:
		desc = "Image Of You: Feed It...";
		break;
		case oLostAmulent:
		break;
		case oMagnet:
		desc = "Magnet: Chance For Orbiting Bullets + Ghost Bullets";
		break;
		case oMetalOrb:
		desc = "Metal Orb: More Shots";
		break;
		case oMirrorShard:
		desc = "Mirror Shard: Accurate Bouncing Bullets";
		break;
		case oReflectiveGem:
		desc = "Reflective Gem: Bullet On Item Use";
		break;
		case oSingularity:
		desc = "Singularity: Homing Bullets";
		break;
		case oWhisperingCrystal:
		desc = "Whispering Crystal: Piercing Bullets";
		break;
		case oLostCrown:
		desc = "Lost Crown: Powerful Minions";
		break
		
		
		// mythics
		case oSifterEssence:
		desc = "Essence Of Sifter: Drain Nearby Enemies For Bonuses + Essence Up";
		break;
		case oAlextraEssence:
		desc = "Essence Of Alexta: Enemies Are Stunned When Spawned + Thought Up";
		break;
		case oVirstEssence:
		desc = "Essence Of Virst: An Extra Life, At A Cost + Time Up";
		break;
		case oTorzolEssence:
		desc = "Essence Of Torzol: Regeneration + Life Up";
		break;
		case oVeribroseEssence:
		desc = "Essence Of Veribrose: An Upcoming Choice + Fate Up";
		break;
		case oKrostEssence:
		desc = "Essence Of Krost: Escalating Speed + Contact Damage + Reality Up";
		break;
		
		case oHauntedGravestone:
		desc = "Haunted Gravestone: On Kill, Summon An Explosive Angry Spirit";
		break;
		case oPetrifiedHeart:
		desc = "Petrified Heart: Faster Overhealth + Fire Bullets At End Of Overhealth + Essence Up";
		break;
		case oBrokenSnowglobe:
		desc = "Broken Snowglobe: Accelerating Bullets + Time Up + Faster Bullets Deal More Damage";
		break;
		case oElectricKite:
		desc = "Electric Kite: Ricochet Bullets + Time Up";
		break;
		case oPoorFingerPainting:
		desc = "Poor Finger Painting: All Stat Ups";
		break;
		case oSacDagger:
		desc = "Sacrifical Dagger: Extreme Lifesteal At A Cost + Essence Up";
		break;
		case oTesseract:
		desc = "Tesseract: Continuous Movement Grants Bonuses";
		break;
		case oTetheredSoulPickup:
		desc = "Tethered Soul: A Protective Friend + Extra Life + Fate Up";
		break;
		case oUnstableEnergy:
		desc = "Unstable Energy: Summon Bullets On Hit + Fate Up";
		break;
		case oBlackHoleCharge:
		desc = "Black Hole's For Dummies: Summon A Protective Blackhole";
		break;
		case oHarvestBook:
		desc = "Harvest: Summon A Circle Of Protective Minions";
		break;
		case oDictionaryCharge:
		desc = "Dictionary: Random Stat Up";
		break;
		case oDeathBook:
		desc = "Death: Kill All Non Boss Enemies";
		break;
		case oDreamsBook:
		desc = "Dreams: Begin Again With What You Have Gained";
		break;
		case oThePathForward:
		desc = "The Path Forward: Summon A Powerful Item";
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
		case oD2:
		oItemManager.hasD2 = false;
		break;
		case oWeeklyPaycheck:
		oItemManager.hasWeeklyPaycheck = false;
		oItemManager.luckBonus -= 8;
		break;
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
		case oMolotov:
		oItemManager.hasMolotov = false;
		break;
		case oDoubleOrNothing:
		oItemManager.hasDoubleOrNothing = false;
		break;
		case oHeartPendent:
		oItemManager.hasHeartPendent = false;
		break;
		case oWeightlessHourglass:
		oItemManager.hasWeightlessHourglass = false;
		break;
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
		oPlayerManager.statBulletDebuff += 18;
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
		oPlayerManager.statBulletDebuff -= 6;
		oItemManager.hasMetalOrb = false;
		break;
		case oMirrorShard:
		oPlayerManager.statBulletDebuff -= 6;
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
		
		case oHauntedGravestone:
		oItemManager.hasHauntedGravestone = false;
		break;
		case oPetrifiedHeart:
		oItemManager.hasPetrifiedHeart = false;
		essenceDown();
		break;
		case oBrokenSnowglobe:
		oItemManager.hasBrokenSnowglobe = false;
		oPlayerManager.statBulletDebuff -= 6;
		timeDown();
		break;
		case oElectricKite:
		oPlayerManager.canRich = false
		oPlayerManager.statBulletDebuff -= 12;
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
		oPlayerManager.statBulletDebuff -= 12;
		timeDown();
		break;
		
		case oDepictionOfSeraphim:
		for (var l = 0; l <= 2; l++) {
			fateUp();
			lifeUp();
			timeUp();
			thoughtUp();
			realityUp();
			essenceUp();
		}
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
function findItemRarity(_item) {
	var rarity = 0;
	var check = -1;
	check = ds_list_find_index(oItemManager.simpleItemCopy, _item);
	if (check == -1) {
		check = ds_list_find_index(oItemManager.rareItemCopy, _item);
		rarity = 1;
	}
	if (check == -1) {
		check = ds_list_find_index(oItemManager.powerfulItemCopy, _item);
		rarity = 2;
	}
	if (check == -1) {
		check = ds_list_find_index(oItemManager.mythicItemCopy, _item);
		rarity = 3;
	}
	
	return rarity;
}