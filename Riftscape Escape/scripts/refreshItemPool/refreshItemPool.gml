function refreshItemPool(){
	ds_list_copy(oItemManager.rareItemList, oItemManager.rareItemCopy);
	ds_list_copy(oItemManager.powerfulItemList, oItemManager.powerfulItemCopy);
	ds_list_copy(oItemManager.mythicItemList, oItemManager.mythicItemCopy);
}