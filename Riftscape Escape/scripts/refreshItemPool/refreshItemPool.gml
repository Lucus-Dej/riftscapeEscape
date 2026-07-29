function refreshItemPool(){
	ds_list_copy(oItemManager.rareItemList, oItemManager.rareItemCopy);
	ds_list_copy(oItemManager.powerfulItemList, oItemManager.powerfulItemCopy);
	ds_list_copy(oItemManager.mythicItemList, oItemManager.mythicItemCopy);
	ds_list_copy(oItemManager.ultraItemList, oItemManager.ultraItemCopy);
	ds_list_copy(oItemManager.runeItemList, oItemManager.runeItemCopy);
	ds_list_copy(oItemManager.masterItemList, oItemManager.masterItemCopy);
}