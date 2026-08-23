function consumableAdd (_item) {
	switch (_item) {
		case oPowerUpConflux:
		initConflux();
		break;
		case oDust:
		oItemManager.dustCount++;
		break;
		case oPowerUpXP:
		oPlayerManager.xpMult += 0.01;
		break;
		case oPowerUpXPHigh:
		oPlayerManager.xpMult += 0.1;
		break;
		case oPowerUpLuck:
		oItemManager.luckBonus += 0.15;
		break;
		case oPowerUpLuckHigh:
		oItemManager.luckBonus += 1;
		break;
		case oPowerUpHP:
		global.player_health += (oPlayerManager.max_hp*0.1);
		break;
		case oPowerUpHPHigh:
		global.player_health = oPlayerManager.max_hp;
		break;
	}
}
function rollConsumable(_mngr) {
	var ranCheck = irandom_range(1, 100) + global.playerTime*1.5 - 1.5;
	if (global.difficulty == 1) {
		ranCheck += 15;
	}
	
	if (ranCheck >= 50) {
		var consumableArray = [oPowerUpHP, oPowerUpLuck, oPowerUpXP];
		var i = irandom(array_length(consumableArray)-1);
		var powerUp = consumableArray[i];
		if (oPlayerManager.hasPowerUpRune) {
			powerUp = oDust;
		}
		with (_mngr) {
			instance_create_layer(x, y, "Instances", powerUp);
		}
	}
}
function itemAdd(_item, _addToInventory = true){
	var item = _item;
	var r = findItemRarity(item);
	show_debug_message("ADDING "+ string(item));
	var f = array_get_index(oItemManager.deniedItemArray, item)
	if (r > 0 && f == -1) {
		array_push(oItemManager.virstTargetArray, item);
	}
	if (_addToInventory) {
		array_push(oItemManager.itemList, item);
	}
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
		case oRifterBloodSample:
		oItemManager.hasRifterBloodSample = true;
		break;
		case oRadioactiveMaterial:
		oItemManager.hasRadioactiveMaterial = true;
		break;
		case oBottleOil:
		oItemManager.hasBottleOil = true;
		break;
		case oPropheticRune:
		oItemManager.hasPropheticRune = true;
		break;
		case oAntidote:
		oItemManager.hasAntidote = true;
		break;
		case oOilBarrel:
		oItemManager.hasOilBarrel = true;
		break;
		case oD2:
		oItemManager.hasD2 = true;
		break;
		case oWeeklyPaycheck:
		oItemManager.hasWeeklyPaycheck = true;
		oItemManager.luckBonus += 8;
		var newItem = rollItem(true, itemSearchType.simple);
		spawnItem(newItem, oTruePlayer, -1);
		break;
		case oBrokenBloodVial:
		oItemManager.hasBloodVial = true;
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
		var newItems = rollItem(true, itemSearchType.iceSoup);
		spawnItem(newItems, oTruePlayer, -1);
		oItemManager.luckBonus -= 8;
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
		instance_create_layer(oTruePlayer.x, oTruePlayer.y, "Instances", oBloodyGemMinion)
		oItemManager.hasBloodyGem = true;
		break;
		
		// powerful'
		case oLightningCrystal:
		oItemManager.hasCrystalLightning = true;
		break;
		case oFireCrystal:
		oItemManager.hasCrystalFire = true;
		break;
		case oPoisonCrystal:
		oItemManager.hasCrystalPois = true;
		break;
		case oBloodCrystal:
		oItemManager.hasCrystalBlood = true;
		break;
		case oIceCrystal:
		oItemManager.hasCrystalIce = true;
		break;
		
		case oElementalVortex:
		oItemManager.hasElementalVortex = true;
		break;
		case oPlasmaOrb:
		oItemManager.hasPlasmaOrb = true;
		break;
		case oLightningCharm:
		oItemManager.hasLightningCharm = true;
		break;
		case oFireCharm:
		oItemManager.hasFireCharm = true;
		break;
		case oIceCharm:
		oItemManager.hasIceCharm = true;
		break;
		case oYin: 
		oItemManager.hasYin = true;
		break;
		case oYang:
		oItemManager.hasYang = true;
		break;
		case oCondensedRift:
		oItemManager.hasConRift = true;
		break;
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
		oPlayerManager.staticItemDmgPercent += 0.05;
		break;
		case oLilFurnacePickup:
		oItemManager.hasLilFurnace = true;
		break;
		case oBrainInAJar:
		oPlayerManager.hasBrainInAJar = true;
		break;
		case oDirectorsNote:
		oPlayerManager.staticItemDmgPercent += 1.8;
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
		break;
		
		case oFoolsGold:
		oItemManager.hasFoolsGold = true;
		break;
		
		
		// mythics
		case oLaserPointer:
		oItemManager.hasLaserPointer = true;
		oPlayerManager.staticItemDmgPercent += 0.2;
		break;
		case oElectricDartGun:
		oItemManager.hasDartGun = true;
		oPlayerManager.statBulletDebuff += 32;
		thoughtUp();
		break;
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
		oItemManager.veriFlagTP = true;
		fateUp();
		break;
		case oKrostEssence:
		oItemManager.hasKrostEssence = true;
		realityUp();
		break;
		
		case oBloodCharm:
		oItemManager.hasBloodCharm = true;
		break;
		case oPoisonCharm:
		oItemManager.hasPoisonCharm = true;
		break;
		case oHauntedGravestone:
		oItemManager.hasHauntedGravestone = true;
		break;
		case oPetrifiedHeart:
		oItemManager.hasPetrifiedHeart = true;
		break;
		case oBrokenSnowglobe:
		oItemManager.hasBrokenSnowglobe = true;
		oPlayerManager.statBulletDebuff += 6;
		break;
		case oElectricKite:
		oPlayerManager.canRich = true
		oPlayerManager.statBulletDebuff += 12;
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
		oItemManager.sacDaggerPenalty += 1.15;
		essenceUp();
		oItemManager.sacDaggerBonus += 3;
		lifeUp();
		lifeDown();
		break;
		case oTesseract:
		oItemManager.hasTesseract = true;
		break;
		case oTetheredSoulPickup:
		oItemManager.hasTetheredSoul = true;
		break;
		case oUnstableEnergy:
		oItemManager.hasUnstableEnergy = true;
		oPlayerManager.statBulletDebuff += 12;
		break;
		
		// ultra
		case oHorseWar:
		oItemManager.hasHorseWar = true;
		break;
		case oHorseDeath:
		oItemManager.hasHorseDeath = true;
		break;
		case oHorseFamine:
		oItemManager.hasHorseFamine = true;
		break;
		case oHorsePest:
		oItemManager.hasHorsePest = true;
		break;
		case oHorseConquest:
		oItemManager.hasHorseCon = true;
		break;
		
	}
}
function displayItemFunction(_item){
	var item = _item;
	var desc = "null";
	var descLength = string_length(desc)
	switch (item) {
		
		// random item
		case "ran":
		desc = "Give Into Chaos";
		break;
		// conflux? 
		case oPowerUpConflux:
		desc = "Conflux: Reset Abilities And Restart Room At A Level Cost. Current Cost: "+string(oPlayerManager.confluxCost);
		break;
		
		case oDust:
		desc = "Dust: Does Nothing.";
		break;
		
		// power ups:
		case oPowerUpXP:
		desc = "+0.1% XP Gained";
		break;
		case oPowerUpXPHigh:
		desc = "+1% XP Gained";
		break;
		case oPowerUpLuck:
		desc = "+0.15 Item Luck";
		break;
		case oPowerUpLuckHigh:
		desc = "+1 Item Luck";
		break;
		case oPowerUpHP:
		desc = "Heal 10% Max Health";
		break;
		case oPowerUpHPHigh:
		desc = "Heal All Health";
		break;
		
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
		case oRifterBloodSample:
		desc = "Rifter Blood Sample: Heal For Blood Damage You Deal";
		break;
		case oBottleOil:
		desc = "Bottle Of Oil: Chance For Bullets To Leave Oil Spill Behind";
		break;
		case oPropheticRune:
		desc = "Prophetic Rune: Graze Bullets For Cooldown Bonus";
		break;
		case oAntidote:
		desc = "Antidote: Gain Immunity To Poison DoT";
		break;
		case oOilBarrel:
		desc = "Oil Barrel: Taking Damage Has A Chance To Cause A Small DoT To Nearby Enemies";
		break;
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
		case oElementalVortex:
		desc = "Elemental Vortex: Killing In Rapid Succession Summons A Random Elemental Aura";
		break;
		case oLightningCrystal:
		desc = "Lightning Crsytal: Killing In Rapid Succession Summons An Elemental Aura";
		break;
		case oFireCrystal:
		desc = "Fire Crsytal: Killing In Rapid Succession Summons An Elemental Aura";
		break;
		case oPoisonCrystal:
		desc = "Poison Crsytal: Killing In Rapid Succession Summons An Elemental Aura";
		break;
		case oBloodCrystal:
		desc = "Blood Crsytal: Killing In Rapid Succession Summons An Elemental Aura";
		break;
		case oIceCrystal:
		desc = "Ice Crsytal: Killing In Rapid Succession Summons An Elemental Aura";
		break;
		case oIceCharm:
		desc = "Ice Charm: Chance To Launch A Slow Moving Snowstorm When Firing + Amplifies Ice Damage";
		break;
		case oPlasmaOrb:
		desc = "Plasma Orb: Chance To Spawn Lightning On Enemies Who Strike You";
		break;
		case oLightningCharm:
		desc = "Lightning Charm: Chance For Bullets To Become Electrified + Amplifies Lightning Damage";
		break;
		case oFireCharm:
		desc = "Fire Charm: Chance To Launch A Shotgun Of Fire When Firing + Amplifies Fire Damage";
		break;
		case oYin: 
		desc = "Yin: Hitting The Same Enemy Grants A Fire Rate Bonus";
		break;
		case oYang:
		desc = "Yang: Hitting Different Enemies Grants A Damage Bonus";
		break;
		case oFreedom:
		desc = "Freedom: Obtain Flight Until The End Of The Next Room";
		break;
		case oCondensedRift:
		desc = "Condensed Rift: Nearby Bullets Arc Energy Between Them";
		break;
		case oMolotov:
		desc = "Molotov: Critical Hits Apply A Fire DoT. Enemies Killed By DoT Spread It Upon Death";
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
		desc = "Action Figure: Summon Action Figure On Kill + Slight Damage Down";
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
		desc = "Reflective Gem: Completing A Room Without Taking Damage Rewards Luck. Taking Damage Reduces Luck.";
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
		case oFoolsGold:
		desc = "Fool's Gold: Grants A Free Mythic Item 100% Guarantee";
		break;
		
		
		// mythics
		case oLaserPointer:
		desc = "Laser Pointer: Bullets Follow Your Mouse + Mild Damage Down";
		break;
		case oSifterEssence:
		desc = "Essence Of Sifter: Drain Nearby Enemies For Bonuses + Essence Up";
		break;
		case oAlextraEssence:
		desc = "Essence Of Alexta: Enemies Are Stunned When Spawned + Thought Up";
		break;
		case oVirstEssence:
		desc = "Essence Of Virst: An Extra Life At A Cost + Items Are Randomized + Time Up";
		break;
		case oTorzolEssence:
		desc = "Essence Of Torzol: Regeneration + Life Up";
		break;
		case oVeribroseEssence:
		desc = "Essence Of Veribrose: An Upcoming Choice + Absorbing Rifer Essence Grants Crits + Fate Up";
		break;
		case oKrostEssence:
		desc = "Essence Of Krost: Escalating Speed + Contact Damage + Reality Up";
		break;
		
		case oBloodCharm:
		desc = "Blood Charm: Damaging An Enemy Has A Chance To Leave A Blood Pool + Amplifies Blood Damage";
		break;
		case oPoisonCharm:
		desc = "Poison Charm: Standing Still Grants A Chance For Poison Shots + Amplifies Blood Damage";
		break;
		case oRadioactiveMaterial:
		desc = "Poison DoT Has A Chance To Increase Damage";
		break;
		case oElectricDartGun:
		desc = "Dart Gun: Bullets Become Turrets";
		break;
		case oHauntedGravestone:
		desc = "Haunted Gravestone: On Kill, Summon An Explosive Angry Spirit";
		break;
		case oPetrifiedHeart:
		desc = "Petrified Heart: Faster Overhealth + Fire Bullets At End Of Overhealth";
		break;
		case oBrokenSnowglobe:
		desc = "Broken Snowglobe: Accelerating Bullets + Faster Bullets Deal More Damage";
		break;
		case oElectricKite:
		desc = "Electric Kite: Ricochet Bullets";
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
		desc = "Tethered Soul: A Protective Friend + Extra Life";
		break;
		case oUnstableEnergy:
		desc = "Unstable Energy: Bullets Split On Hit";
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
		
		
		// ultra
		case oHorseWar:
		desc = "The Javelin Of War: Powerful Minion That Thrives In Battle";
		break;
		case oHorseDeath:
		desc = "The Scythe Of Death: Inevitable Minion That Feeds On Death";
		break;
		case oHorseFamine:
		desc = "The Sickle Of Famine: Hungry Minion That Feeds On Enemies";
		break;
		case oHorsePest:
		desc = "The Daggers Of Pestilence: Poisonous Minion That Devourers Enemies";
		break;
		case oHorseConquest:
		desc = "The Sword Of Conquest: A Powerful Minion That Arrives Only After A Victory";
		break;
		
		
		
	}
	descLength = string_length(desc)
	oItemManager.displayItemTimer = oItemManager.displayItemDuration;
	oItemManager.itemDesc = desc;
	oItemManager.itemDescLength = descLength;
}
function itemRemove(_item, _removeFromInventory = true){
	var item = _item;
	var i = array_get_index(oItemManager.itemList, item);
	var v = array_get_index(oItemManager.virstTargetArray, item);
	show_debug_message("REMOVING "+ string(item));
	show_debug_message(v)
	if (v != 1) {
		array_delete(oItemManager.virstTargetArray, v, 1);
	}
	
	if (i != -1) {
		if (_removeFromInventory) {
			array_delete(oItemManager.itemList, i, 1);
		}
		
		
		
		switch (item) {
			
		case oDust:
		oItemManager.dustCount--;
		break;
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
		case oRifterBloodSample:
		oItemManager.hasRifterBloodSample = false;
		break;
		case oRadioactiveMaterial:
		oItemManager.hasRadioactiveMaterial = false;
		break;
		case oBottleOil:
		oItemManager.hasBottleOil = false;
		break;
		case oPropheticRune:
		oItemManager.hasPropheticRune = false;
		break;
		case oAntidote:
		oItemManager.hasAntidote = false;
		break;
		case oOilBarrel:
		oItemManager.hasOilBarrel = false;
		break;
		
		case oD2:
		oItemManager.hasD2 = false;
		break;
		case oWeeklyPaycheck:
		oItemManager.hasWeeklyPaycheck = false;
		oItemManager.luckBonus -= 8;
		break;
		case oBrokenBloodVial:
		oItemManager.hasBloodVial = false;
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
		instance_destroy(oBloodyGemMinion);
		oItemManager.hasBloodyGem = false;
		break;
		
		// powerful
		case oElementalVortex:
		oItemManager.hasElementalVortex = false;
		break;
		case oLightningCrystal:
		oItemManager.hasCrystalLightning = false;
		break;
		case oFireCrystal:
		oItemManager.hasCrystalFire = false;
		break;
		case oPoisonCrystal:
		oItemManager.hasCrystalPois = false;
		break;
		case oBloodCrystal:
		oItemManager.hasCrystalBlood = false;
		break;
		case oIceCrystal:
		oItemManager.hasCrystalIce = false;
		break;
		case oPlasmaOrb:
		oItemManager.hasPlasmaOrb = false;
		break;
		case oIceCharm:
		oItemManager.hasIceCharm = false;
		break;
		case oLightningCharm:
		oItemManager.hasLightningCharm = false;
		break;
		case oFireCharm:
		oItemManager.hasFireCharm = false;
		break;
		case oYin: 
		oItemManager.hasYin = false;
		oItemManager.effectiveYinBonus = 0;
		oItemManager.yinFireRateBonus = 0;
		break;
		case oYang:
		oItemManager.hasYang = false;
		oItemManager.effectiveYangBonus = 0;
		oItemManager.yangDmgBonus = 0;
		break;
		case oCondensedRift:
		oItemManager.hasConRift = false;
		break;
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
		oPlayerManager.staticItemDmgPercent -= 0.05;
		break;
		case oLilFurnacePickup:
		oItemManager.hasLilFurnace = false;
		instance_destroy(oLilFurnace)
		break;
		case oBrainInAJar:
		oPlayerManager.hasBrainInAJar = false;
		break;
		case oDirectorsNote:
		oPlayerManager.staticItemDmgPercent -= 1.8;
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
		break;
		case oFoolsGold:
		oItemManager.hasFoolsGold = false;
		break;
		
		
		// mythics
		case oBloodCharm:
		oItemManager.hasBloodCharm = false;
		break;
		case oPoisonCharm:
		oItemManager.hasPoisonCharm = false;
		break;
		case oLaserPointer:
		oItemManager.hasLaserPointer = false;
		oPlayerManager.staticItemDmgPercent -= 0.2;
		break;
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
		oItemManager.veriFlagTP = false;
		fateDown();
		break;
		case oKrostEssence:
		oItemManager.hasKrostEssence = false;
		realityDown();
		break;
		
		case oElectricDartGun:
		oPlayerManager.statBulletDebuff -= 32;
		oItemManager.hasDartGun = false;
		break;
		case oHauntedGravestone:
		oItemManager.hasHauntedGravestone = false;
		break;
		case oPetrifiedHeart:
		oItemManager.hasPetrifiedHeart = false;
		break;
		case oBrokenSnowglobe:
		oItemManager.hasBrokenSnowglobe = false;
		oPlayerManager.statBulletDebuff -= 6;
		break;
		case oElectricKite:
		oPlayerManager.canRich = false
		oPlayerManager.statBulletDebuff -= 12;
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
		oItemManager.sacDaggerPenalty -= 1.15;
		essenceDown();
		oItemManager.sacDaggerBonus -= 3;
		break;
		case oTesseract:
		oItemManager.hasTesseract = false;
		break;
		case oTetheredSoulPickup:
		oItemManager.hasTetheredSoul = false;
		if (instance_exists(oTetheredSoul)) {
			var currentHP = global.player_health;
			instance_destroy(oTetheredSoul);
			global.player_health = currentHP;
		}
		break;
		case oUnstableEnergy:
		oItemManager.hasUnstableEnergy = false;
		oPlayerManager.statBulletDebuff -= 12;
		break;
		
		
		// ultra
		case oHorseWar:
		oItemManager.hasHorseWar = false;
		if (instance_exists(oJavWarMinion)) {
			instance_destroy(oJavWarMinion);
		}
		break;
		case oHorseDeath:
		oItemManager.hasHorseDeath = false;
		if (instance_exists(oSyDeathMinion)) {
			instance_destroy(oSyDeathMinion)
		}
		break;
		case oHorseFamine:
		oItemManager.hasHorseFamine = false;
		if (instance_exists(oSickFamineMinion)) {
			instance_destroy(oSickFamineMinion)
		}
		break;
		case oHorsePest:
		oItemManager.hasHorsePest = false;
		if (instance_exists(oDaggPestMinion)) {
			instance_destroy(oDaggPestMinion)
		}
		break;
		case oHorseConquest:
		oItemManager.hasHorseCon = false;
		if (instance_exists(oSwordConquestMinion)) {
			instance_destroy(oSwordConquestMinion)
		}
		break;
		
		
		case oDepictionOfSeraphim:
		for (var l = 0; l <= 2; l++) {
			fateDown();
			lifeDown();
			timeDown();
			thoughtDown();
			realityDown();
			essenceDown();
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
function rollItem(_allowBooks, _typeOfSeach = itemSearchType.basic, _takeOutOfPool = true, _bouns = 0) {
	var totalPool = 0;
	var simpleMax = -1;
	var rareMax = -1;
	var powerfulMax = -1;
	var mythicMax = -1;
	var ultraMax = -1;
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
	
	if (ds_list_size(oItemManager.ultraItemList) > 0) {
		totalPool += oItemManager.ultraPool;
		ultraMax = totalPool;
	}

	var j = irandom(100) + oItemManager.luckBonus+ oItemManager.reflectiveGemLuckBonus + _bouns + global.playerTime;
	//j = clamp(j, 0, totalPool - 1);
	//show_debug_message(j)
	if (j <0) {
		j = 1;
	}

	var chosenList = oItemManager.simpleItemList;
	
	if (j >= ultraMax && ds_list_size(oItemManager.ultraItemList) > 0) {
		chosenList = oItemManager.ultraItemList;
	} else if (j >= mythicMax && ds_list_size(oItemManager.mythicItemList) > 0) {
		chosenList = oItemManager.mythicItemList;
	} else if (j >= powerfulMax && ds_list_size(oItemManager.powerfulItemList) > 0) {
		chosenList = oItemManager.powerfulItemList;
	} else if (j >= rareMax && ds_list_size(oItemManager.rareItemList) > 0) {
		chosenList = oItemManager.rareItemList;
	} else if (j >= simpleMax) {
		chosenList = oItemManager.simpleItemList;
	}
	if (_typeOfSeach == itemSearchType.boss || _typeOfSeach == itemSearchType.simple) {
		chosenList = oItemManager.simpleItemList;
	}
	if (_typeOfSeach == itemSearchType.iceSoup) {
		var iceCheck = irandom_range(1, 20);
		if (iceCheck == 1 && ds_list_size(oItemManager.ultraItemList) > 0) {
			chosenList = oItemManager.ultraItemList;
		} else if (iceCheck <= 8  && ds_list_size(oItemManager.mythicItemList) > 0) {
			chosenList = oItemManager.mythicItemList;
		} else if (ds_list_size(oItemManager.powerfulItemList) > 0) {
			chosenList = oItemManager.powerfulItemList;
		} else {
			chosenList = oItemManager.simpleItemList;
		}
	}
	if (_typeOfSeach == itemSearchType.foolsGold) {
		show_debug_message("DIGGING FOR GOLD")
		if (ds_list_size(oItemManager.mythicItemList) > 0) {
			chosenList = oItemManager.mythicItemList;
		} else if (ds_list_size(oItemManager.powerfulItemList) > 0) {
			chosenList = oItemManager.powerfulItemList;
		} else {
			chosenList = oItemManager.simpleItemList;
		}
	}
	if (_typeOfSeach == itemSearchType.rune && ds_list_size(oItemManager.runeItemList) > 0) {
		chosenList = oItemManager.runeItemList;
	} else if (j >= ultraMax && ds_list_size(oItemManager.ultraItemList) > 0) {
		chosenList = oItemManager.ultraItemList;
	}
	
	if (_typeOfSeach == itemSearchType.random && ds_list_size(oItemManager.masterItemList) > 0) {
		chosenList = oItemManager.masterItemList;
	} else if (_typeOfSeach == itemSearchType.random) {
		chosenList = oItemManager.simpleItemList;
	}
	var i = irandom(ds_list_size(chosenList) - 1);
	var item = chosenList[| i];
	var deleteIndex = i;
	if (ds_list_find_index(oItemManager.bookList, item) != -1 && _allowBooks) {
		var rerollFlag = true;
		
		for (var q = 0; q < ds_list_size(chosenList); q++) {
			var candidate = chosenList[| q];
			if (rerollFlag) {
				if (ds_list_find_index(oItemManager.bookList, candidate) == -1) {
					item = candidate;
					rerollFlag = false;
					deleteIndex = q;
					break;
				}
			}
		}
		if (rerollFlag) {
			var l = irandom(ds_list_size(oItemManager.simpleItemList) - 1);
			item = oItemManager.simpleItemList[| l];
		}
	}
	if (chosenList == oItemManager.ultraItemList) {
		oItemManager.ultraPool += 10;
	}
	if (chosenList != oItemManager.simpleItemList && _takeOutOfPool) {
		ds_list_delete(chosenList, deleteIndex);
	}
	if (item == -4) {
		item = oDepictionOfSeraphim;
	}
	if (_typeOfSeach == itemSearchType.boss && oPlayerManager.hasBossDropRune) {
		return oDust;
	} else {
		return item;
	}
}
function removeFromItemPool (_item) {
	var r = findItemRarity(_item);
	var t = ds_list_find_index(oItemManager.masterItemList, _item);
	if (t != -1) {
		ds_list_delete(oItemManager.masterItemList, t)
	}
	switch (r) {
		case 1:
		var i = ds_list_find_index(oItemManager.rareItemList, _item);
		if (i != -1) {
			ds_list_delete(oItemManager.rareItemList, i)
		}
		break;
		
		case 2:
		var p = ds_list_find_index(oItemManager.powerfulItemList, _item);
		if (p != -1) {
			ds_list_delete(oItemManager.powerfulItemList, p)
		}
		break;
		
		case 3:
		var m = ds_list_find_index(oItemManager.mythicItemList, _item);
		if (m != -1) {
			ds_list_delete(oItemManager.mythicItemList, m)
		}
		break;
		case 4:
		var ru = ds_list_find_index(oItemManager.runeItemList, _item);
		if (ru != -1) {
			ds_list_delete(oItemManager.runeItemList, ru)
		}
		break;
		case 5:
		var u = ds_list_find_index(oItemManager.ultraItemList, _item);
		if (u != -1) {
			ds_list_delete(oItemManager.ultraItemList, u)
		}
		break;
	}
}
function spawnItem(_item, _location, _rID, _allowDuplicating = false) {
	
	if (_item != noone) {
		var newItem = instance_create_layer(_location.x, _location.y, "Instances", _item);
		newItem.RoomID = _rID;
		var rare = findItemRarity(newItem.object_index)
		newItem.rarity = rare;
		var hallowedDiceCheck = irandom_range(1, 6);
		if (rare == 0 && oItemManager.hasHollowedDice && hallowedDiceCheck == 6) {
			var newerItem = instance_create_layer(_location.x, _location.y, "Instances", _item);
			newerItem.RoomID = _rID;
			var newRare = findItemRarity(newerItem.object_index)
			newerItem.rarity = newRare;
		}
		return newItem;
	}
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
	if (check == -1) {
		check = ds_list_find_index(oItemManager.runeItemCopy, _item);
		rarity = 4;
	}
	if (check == -1) {
		check = ds_list_find_index(oItemManager.ultraItemCopy, _item);
		rarity = 5;
	}
	
	return rarity;
}