searchItem = false;
runeCheck = false;
ritualRerollAvailable = false;
doBrain = false;
bossSearch = false;
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
simpleMax = 0;
simplePool = 0;
rareMin = 0;
rarePool = 50;
rareMax = rarePool + simplePool;
powerfulMin = 0;
powerfulPool = 40;
powerfulMax = powerfulPool + rareMax
mythicMin = 0;
mythicPool = 10;
mythicMax = powerfulMax + mythicPool;

displayItemDuration = 90;
displayItemTimer = 0;
itemDesc = "placeholder";
itemDescLength = string_length(itemDesc);

rarity = 0;
randomise();

// rare passive
hasPropheticRune = false;
hasAntidote = false;
hasOilBarrel = false;
hasIceSoup = false;
iceSoupTriggered = false;
hasRareSeed = false;
hasHammer = false;
runeItemList = ds_list_create();
runeItemCopy = ds_list_create();
simpleItemList = ds_list_create();
simpleItemCopy = ds_list_create();
rareItemList = ds_list_create();
rareItemCopy = ds_list_create();
powerfulItemList = ds_list_create();
powerfulItemCopy = ds_list_create();
mythicItemList = ds_list_create();
mythicItemCopy = ds_list_create();
validItemLists = ds_list_create();
dustCount = 0;
bookList = ds_list_create()
ds_list_add(bookList, oDeathBook, oDictionaryCharge, oBlackHoleCharge, oHarvestBook, oDreamsBook, oThePathForward);
item = oEnemSpider;
itemList = [];
ds_list_add(runeItemList, oDreamsBook, oHeartPendent, oLaserPointer, oElectricDartGun, oHauntedGravestone, oUnstableEnergy, oVirstEssence, oKrostEssence, oVeribroseEssence, oSifterEssence, oAlextraEssence, oTorzolEssence, oDirectorsNote, oPoorFingerPainting);

ds_list_add(simpleItemList, oBloodySkull, oPottedPlant, oDeformedBrain,oTornPainting,oBurntBook,oBlueprint);
ds_list_add(rareItemList, oReflectiveGem, oPropheticRune, oAntidote, oWeightlessHourglass, oOilBarrel, oDoubleOrNothing, oD2, oWeeklyPaycheck, oHarvestBook, oBloodyGem, oCrackedEgg, oGenStone, oBlackHoleCharge, oIceSoup, oHammer, oBrokenBloodVial, oRareSeed, oSmallSculpture, oBrokenBoomerang, oWaterDamagedNote, oHollowedDice, oDirtyMirror);
ds_list_add(powerfulItemList,  oLilFurnacePickup, oLostCrown, oDeathBook, oMagnet, oBrainInAJar, oActionFigure, oWhisperingCrystal, oImageOfYou, oTetheredSoulPickup, oBrokenSnowglobe, oMirrorShard);
ds_list_add(mythicItemList, oCondensedRift, oPetrifiedHeart, oMolotov,  oSacDagger,  oTesseract, oSingularity, oElectricKite, oGunpowder, oDictionaryCharge, oThePathForward, oMetalOrb);
ds_list_copy(runeItemCopy, runeItemList);
ds_list_copy(simpleItemCopy, simpleItemList);
ds_list_copy(rareItemCopy, rareItemList);
ds_list_copy(powerfulItemCopy, powerfulItemList);
ds_list_copy(mythicItemCopy, mythicItemList);


donArray = [];
searchItem = false;
dropID = noone;
brainTime = 60;

seedStart = false;
seedFailed = false;
seedCombatCheck = false

hasD2 = false;
hasWeeklyPaycheck = false;
hasBloodyGem = false;
hasGenStone = false;
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
hasReflectiveGem = false;
reflectiveGemLuckBonus = 0;
show_debug_message("ItemManager CREATED in room: " + string(room));

// powerful passiv
hasConRift = false;
hasMolotov = false;
hasDoubleOrNothing = false;
hasWeightlessHourglass = false;
hasCrackedEgg = false;
hasActionFigure = false;
actionFigurePower = 0
actionFigureTargetX = 0;
actionFigureTargetY = 0;
hasLostCrown = false;
hasHeartPendent = false;
hasLilFurnace = false;

hasSingularity = false;
hasMagnet = false;
hasMirrorShard = false;
hasMetalOrb = false;
hasGunpowder = false;
hasImageOfYou = false;

hasSifterEssence = false;
sifterLinkArray = [];
sifterLinks = [];
sifterEssenceRange = 240;
sifterEssenceDmg = global.playerEssence/20;
sifterCooldown = 60;
sifterTimer = sifterCooldown;
hasAlextraEssence = false;
alextraTimer = 360;
alextraCooldown = 360;
alextraEntry = [];
alextraDone = [];
hasTorzolEssence = false;
hasVirstEssence = false;
hasVeribroseEssence = false;
veriFlagTP = false;
veriRoom = veribroseItemRoom;
savedRoom = noone;
hasKrostEssence = false;


//mythic passive
hasLaserPointer = false;
hasHauntedGravestone = false;
hasPetrifiedHeart = false
hasTesseract = false;
hasTetheredSoul = false;
hasBrokenSnowglobe = false;
hasUnstableEnergy = false;
hasDartGun = false;