searchItem = false;
doBrain = false;
chosenList = noone;



simpleMin = 0;
simpleMax = 35;
simplePool = 35;
rareMin = 0;
rareMax = 90;
rarePool = 55;
powerfulMin = 0;
powerfulMax = 98;
powerfulPool = 8;
mythicMin = 0;
mythicMax = 100;
mythicPool = 2;


// rare passive
hasRareSeed = false;
simpleItemList = ds_list_create();
rareItemList = ds_list_create();
powerfulItemList = ds_list_create();
mythicItemList = ds_list_create();
validItemLists = ds_list_create();
item = oEnemSpider;
itemList = [];
ds_list_add(simpleItemList, oBloodySkull, oPottedPlant, oDeformedBrain,oTornPainting,oBurntBook,oBlueprint);
ds_list_add(rareItemList, oBrainInAJar, oBrokenBloodVial, oRareSeed, oSmallSculpture, oWaterDamagedNote, oHollowedDice);
ds_list_add(powerfulItemList, oActionFigure, oMetalOrb, oWhisperingCrystal, oPoorFingerPainting, oImageOfYou, oGunpowder);
ds_list_add(mythicItemList, oTesseract, oDepictionOfSeraphim, oTetheredSoulPickup, oBrokenSnowglobe, oElectricKite);
searchItem = false;
dropID = noone;
brainTime = 60;

seedStart = false;
seedFailed = false;
seedCombatCheck = false

hasSmallSculpture = false;
sculptureActive = false;
sculptureTimer = 0;
snapshotSpeed = global.player_speed/oPlayerManager.sculptureBonus;
sculptureTimer = 0;
hasBrokenBoomerang = false;
hasWaterDamagedNote = false;
hasHollowedDice = false;
spawnSimple = false;
show_debug_message("ItemManager CREATED in room: " + string(room));

// powerful passive
hasActionFigure = false;
actionFigurePower = 0
actionFigureTargetX = 0;
actionFigureTargetY = 0;

hasMetalOrb = false;
hasGunpowder = false;
hasImageOfYou = false;

//mythic passive
hasTesseract = false;
hasTetheredSoul = false;
hasBrokenSnowglobe = false;
