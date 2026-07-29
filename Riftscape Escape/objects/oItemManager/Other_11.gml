totalPool = 0;
spawnSimple = false;


if (ds_list_size(simpleItemList) > 0) {
	simpleMin = totalPool;
	simpleMax = totalPool + simplePool;
	totalPool += simplePool;
} else {
	simpleMax = -1;
}
if (ds_list_size(rareItemList) > 0) {
	rareMin = totalPool;
	rareMax = totalPool + rarePool;
	totalPool+= rarePool;
} else {
	rareMax = -1;
}
if (ds_list_size(powerfulItemList) > 0) {
	powerfulMin = totalPool;
	powerfulMax = totalPool + powerfulPool;
	totalPool += powerfulPool;
} else {
	powerfulMax = -1;
}
if (ds_list_size(mythicItemList) > 0) {
	mythicMin = -1;
	mythicMax = totalPool + mythicPool;
	totalPool += mythicPool;
} else {
	mythicMax = -1;
}

var j = irandom(totalPool - 1) + global.playerTime +luckBonus+reflectiveGemLuckBonus;

j = clamp(j, 0, totalPool - 1);
if (simpleMax >= 0 && j < simpleMax) {
	chosenList = simpleItemList;
	rarity = 0;
} else if (rareMax >= 0 && j < rareMax) {
	chosenList = rareItemList;
	rarity = 1;
} else if (powerfulMax >= 0 && j < powerfulMax) {
	chosenList = powerfulItemList;
	rarity = 2;
} else if (mythicMax >= 0 && j < mythicMax) {
	chosenList = mythicItemList;
	rarity = 3;
} else if (ultraMax >= 0 && j > mythicMax) {
	chosenList = ultraItemList;
}
chosenList = simpleItemList;
if (hasIceSoup && !iceSoupTriggered) {
	var iceCheck = irandom_range(1, 3);
	if (iceCheck >= 3) {
		chosenList = mythicItemList;
		rarity = 3;
	} else {
		chosenList = powerfulItemList;
		rarity = 2;
	}
	iceSoupTriggered = true;
	luckBonus -= 15;
	
}
if (chosenList == simpleItemList) {
	if (oPlayerManager.hasBossDropRune) {
		item = oDust;
	} else {
		var i = irandom(ds_list_size(chosenList)-1);
		item = chosenList[| i];
	}
	with (dropID) {
		item = other.item;
		spawnItem = true;
		spawnSimple = true;
		if (other.hasHollowedDice) {
			var i = irandom_range(1,3)
				if (i == 2) {
				j = irandom(ds_list_size(oItemManager.simpleItemList)-1);
				item = other.simpleItemList[| j];
				var summon = instance_create_layer(x-32, y, "Instances", item);
				summon.rarity = 0;
				audio_play_sound_at(aPlayerBoom, x, y, 0, 0, 0, 0, 0, 1, global.sfxAudio)
			}
		}
	}
} else {
	var i = irandom(ds_list_size(chosenList)-1);
	item = chosenList[| i];
	ds_list_delete(chosenList, i);
	with (dropID) {
		rarity = other.rarity;
		item = other.item;
		spawnItem = true;
	}
}