audio_listener_position(x, y, 0);
audio_play_sound_at(aPortalOpen, x, y, 0, 1, 1, 1, false, 0, global.sfxAudio);
boom = instance_create_layer(x, y, "Instances", oPortal);
boom.existance = 5;
idleTime = 30;
index = -1;
rarity = 0;
veribroseMark = false;
displayDesc = false;
existenceTime = 300;
maxExistTime = existenceTime;
/*
if (ds_list_find_index(oItemManager.rareItemList, object_index) != -1) {
    rarity = 1;
}
else if (ds_list_find_index(oItemManager.powerfulItemList, object_index) != -1) {
    rarity = 2;
}
else if (ds_list_find_index(oItemManager.mythicItemList, object_index) != -1) {
    rarity = 3;
}



