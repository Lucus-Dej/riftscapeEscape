shopItem = false;

grabed = false;

if (randomItem) {
	idleTime = irandom(6);
} else {
	boom = instance_create_layer(x, y, "Instances", oPortal);
	boom.existance = 5;
	idleTime = 30;
	audio_listener_position(x, y, 0);
	audio_play_sound_at(aPortalOpen, x, y, 0, 1, 1, 1, false, 0, global.sfxAudio);
}
clearID = -1;
clearSameOnDeath = false;
clearElseOnDeath = false;
validForClear = false;
index = -1;
rarity = 0;
veribroseMark = false;
displayDesc = false;
flag = noone;
if (ds_list_find_index(oItemManager.commonItemCopy, object_index) != -1) {
    rarity = 1;
}
if (ds_list_find_index(oItemManager.rareItemCopy, object_index) != -1) {
    rarity = 2;
}
else if (ds_list_find_index(oItemManager.powerfulItemCopy, object_index) != -1) {
    rarity = 3;
}
else if (ds_list_find_index(oItemManager.mythicItemCopy, object_index) != -1) {
    rarity = 4;
}
else if (ds_list_find_index(oItemManager.runeItemCopy, object_index) != -1) {
    rarity = 6;
}
else if (ds_list_find_index(oItemManager.ultraItemCopy, object_index) != -1) {
    rarity = 6;
}
isLightExcluded = false;

displayString =  "Price: "+string(price)+" Item Luck";