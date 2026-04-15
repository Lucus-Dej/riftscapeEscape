/** weighted table
1-50 simple items
51-80 rare
81-95 powerful
96-100 mythic 
if (ds_list_size(BossList) > 0) {
	var i = irandom(ds_list_size(BossList)-1);
	bossPull = BossList[| i];
	tempEnemy = bossPull.bossName;

	//bossPull.bossCount--;
	if (totalBoss <= 0) {
		ds_list_delete(BossList, i);
	}
} **/
totalPool = 0;
spawnSimple = false;


if (ds_list_size(simpleItemList) > 0) {
	simpleMin = totalPool;
	simpleMax = totalPool + simplePool;
	totalPool = simplePool;
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

var j = irandom(totalPool - 1 + global.playerTime)+luckBonus;
if (hasIceSoup && !iceSoupTriggered) {
	luckBonus -= 70;
	iceSoupTriggered = true;
}
j = clamp(j, 0, totalPool - 1);
if (simpleMax >= 0 && j < simpleMax) {
	chosenList = simpleItemList;
} else if (rareMax >= 0 && j < rareMax) {
	chosenList = rareItemList;
} else if (powerfulMax >= 0 && j < powerfulMax) {
	chosenList = powerfulItemList;
} else {
	chosenList = mythicItemList;
} 

if (chosenList == simpleItemList) {
	var i = irandom(ds_list_size(chosenList)-1);
	item = chosenList[| i];
	with (dropID) {
		item = other.item;
		spawnItem = true;
		spawnSimple = true;
		if (other.hasHollowedDice) {
			i = irandom_range(1,3)
				if (i == 2) {
				j = irandom(ds_list_size(oItemManager.simpleItemList)-1);
				item = other.simpleItemList[| j];
				instance_create_layer(x-32, y, "Instances", item);
				audio_play_sound_at(aPlayerBoom, x, y, 0, 0, 0, 0, 0, 1, global.sfxAudio)
			}
		}
	}
} else {
	var i = irandom(ds_list_size(chosenList)-1);
	item = chosenList[| i];
	ds_list_delete(chosenList, i);
	with (dropID) {
		item = other.item;
		spawnItem = true;
	}
}
	//instance_create_layer(oTruePlayer.x, oTruePlayer.y, "Instances", item);