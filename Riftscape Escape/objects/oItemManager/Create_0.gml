searchItem = false;
doBrain = false;
brainNum = -99999;
bigBrainNum = -99999;
chosenList = noone;
luckBonus = 0;
harvestBlockerCount = 0;
lastBlocker = noone;
global.chargeItem = noone;
global.itemCharges = 0;
global.currentCharges = 0;
sacDaggerPenalty = 1;
sacDaggerBonus = 1;
simpleMin = 0;
simpleMax = 35;
simplePool = 35;
rareMin = 0;
rareMax = 80;
rarePool = 45;
powerfulMin = 0;
powerfulMax = 95;
powerfulPool = 15;
mythicMin = 0;
mythicMax = 100;
mythicPool = 5;
randomise();

// rare passive
hasIceSoup = false;
iceSoupTriggered = false;
hasRareSeed = false;
hasHammer = false;
simpleItemList = ds_list_create();
rareItemList = ds_list_create();
powerfulItemList = ds_list_create();
mythicItemList = ds_list_create();
validItemLists = ds_list_create();
item = oEnemSpider;
itemList = [];
ds_list_add(simpleItemList, oBloodySkull, oPottedPlant, oDeformedBrain,oTornPainting,oBurntBook,oBlueprint);
ds_list_add(rareItemList, oHarvestBook, oBlackHoleCharge, oIceSoup, oHammer, oBrokenBloodVial, oRareSeed, oSmallSculpture, oBrokenBoomerang, oWaterDamagedNote, oHollowedDice);
ds_list_add(powerfulItemList, oDictionaryCharge, oMagnet, oSingularity, oThePathForward, oBrainInAJar, oActionFigure, oMetalOrb, oWhisperingCrystal, oImageOfYou, oGunpowder, oMirrorShard);
ds_list_add(mythicItemList, oSacDagger , oDreamsBook, oDeathBook, oTesseract, oPoorFingerPainting, oTetheredSoulPickup, oBrokenSnowglobe, oElectricKite);
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
hasDirtyMirror = false;
show_debug_message("ItemManager CREATED in room: " + string(room));

// powerful passive
hasActionFigure = false;
actionFigurePower = 0
actionFigureTargetX = 0;
actionFigureTargetY = 0;

hasSingularity = false;
hasMagnet = false;
hasMirrorShard = false;
hasMetalOrb = false;
hasGunpowder = false;
hasImageOfYou = false;

//mythic passive
hasTesseract = false;
hasTetheredSoul = false;
hasBrokenSnowglobe = false;
hasUnstableEnergy = false;
