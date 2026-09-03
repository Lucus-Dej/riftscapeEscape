searchItem = false;
runeCheck = false;
ritualRerollAvailable = false;
enum itemSearchType {
	boss,
	simple,
	rune,
	foolsGold,
	iceSoup,
	random,
	basic,
}
doBrain = false;
bossSearch = false;
brainNum = -99999;
bigBrainNum = -99999;
chosenList = noone;
luckBonus = 0;
if (global.difficulty == 4) {
	luckBonus = -6;
}
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
rarePool = 0;
rareMax = rarePool + simplePool;
powerfulMin = 0;
powerfulPool = 65;
powerfulMax = powerfulPool + rareMax
mythicMin = 0;
mythicPool = 30;
mythicMax = powerfulMax + mythicPool;
ultraMin = 0;
ultraPool = 20;
ultraMax = mythicMax + ultraPool;
displayItemDuration = 90;
displayItemTimer = 0;
itemDesc = "placeholder";
itemDescLength = string_length(itemDesc);

rarity = 0;
randomise();

// rare passive
hasRifterBloodSample = false;
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
ultraItemList = ds_list_create();
ultraItemCopy = ds_list_create();
validItemLists = ds_list_create();
masterItemList = ds_list_create();
masterItemCopy = ds_list_create();
dustCount = 0;
bookList = ds_list_create()
ds_list_add(bookList, oFreedom, oFoolsGold, oDeathBook, oDictionaryCharge, oBlackHoleCharge, oHarvestBook, oDreamsBook, oThePathForward);
item = oEnemSpider;
itemList = [];
ds_list_add(runeItemList, oBloodCharm, oPoisonCharm, oIceCharm, oLightningCharm, oFireCharm, oHeartPendent, oLaserPointer, oUnstableEnergy, oVirstEssence, oKrostEssence, oVeribroseEssence, oSifterEssence, oAlextraEssence, oTorzolEssence, oDirectorsNote, oPoorFingerPainting);

ds_list_add(simpleItemList, oBloodySkull, oPottedPlant, oDeformedBrain,oTornPainting,oBurntBook,oBlueprint);
ds_list_add(rareItemList, oRifterBloodSample, oPlasmaOrb, oRadioactiveMaterial, oBottleOil, oFoolsGold, oReflectiveGem, oPropheticRune, oAntidote, oWeightlessHourglass, oOilBarrel, oDoubleOrNothing, oD2, oWeeklyPaycheck, oHarvestBook, oBloodyGem, oCrackedEgg, oGenStone, oBlackHoleCharge, oIceSoup, oHammer, oBrokenBloodVial, oRareSeed, oSmallSculpture, oBrokenBoomerang, oWaterDamagedNote, oHollowedDice, oDirtyMirror);
ds_list_add(powerfulItemList, oElementalVortex, oYin, oYang, oFreedom,  oLilFurnacePickup, oLostCrown, oDeathBook, oMagnet, oBrainInAJar, oActionFigure, oWhisperingCrystal, oImageOfYou, oTetheredSoulPickup, oBrokenSnowglobe, oMirrorShard);
ds_list_add(mythicItemList, oCondensedRift, oPetrifiedHeart, oMolotov,  oSacDagger,  oTesseract, oSingularity, oElectricKite, oGunpowder, oDictionaryCharge, oThePathForward, oMetalOrb);
ds_list_add(ultraItemList, oDreamsBook, oHauntedGravestone, oElectricDartGun, oHorseConquest, oHorseDeath, oHorseFamine, oHorseWar, oHorsePest);

ds_list_copy(runeItemCopy, runeItemList);
ds_list_copy(simpleItemCopy, simpleItemList);
ds_list_copy(rareItemCopy, rareItemList);
ds_list_copy(powerfulItemCopy, powerfulItemList);
ds_list_copy(mythicItemCopy, mythicItemList);
ds_list_copy(ultraItemCopy, ultraItemList);

ds_list_clear(masterItemList);

var lists = [runeItemList, rareItemList, powerfulItemList, mythicItemList,ultraItemList, simpleItemList];

for (var i = 0; i < array_length(lists); i++) {
	var list = lists[i];
	
	for (var j = 0; j < ds_list_size(list); j++) {
		ds_list_add(masterItemList, list[| j]);
	}
}

ds_list_copy(masterItemCopy, masterItemList);

deniedItemArray = [];
virstTargetArray = [];
donArray = [];
searchItem = false;
dropID = noone;
brainTime = 60;

seedStart = false;
seedFailed = false;
seedCombatCheck = false

hasDeal = false;

hasRadioactiveMaterial = false;
hasBottleOil = false;
hasD2 = false;
hasWeeklyPaycheck = false;
hasBloodyGem = false;
hasGenStone = false;
hasSmallSculpture = false;
hasBloodVial = false;
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
reflectiveGemFlag = false;
show_debug_message("ItemManager CREATED in room: " + string(room));

// powerful passiv
portalbook = {
	portal1: noone,
	portal2: noone
}
hasElementalVortex = false;
hasCrystalIce = false;
hasCrystalFire = false;
hasCrystalPois = false;
hasCrystalBlood = false;
hasCrystalLightning = false;
elementalAuraKillThreshold = 400;
elementalAuraPointsOnKill = 50;
elementalAuraPoints = 0;
hasPlasmaOrb = false;
hasYin = false;
hasYang = false;
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
hasFoolsGold = false;
hasBookFreedom = false;
freedomFlyFlag = false;
yinFireRateBonus = 0;
effectiveYinBonus = 0;
effectiveYangBonus = 0;
yangDmgBonus = 0;

foolsGoldItem = noone;
foolsGoldTimer = 1;
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
torzTimer = 0;
torzCooldown = 60;
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

hasIceCharm = false;
hasLightningCharm = false;
hasFireCharm = false;
hasPoisonCharm = false;
hasBloodCharm = false;

hasHorseWar = false;
hasHorseDeath = false;
hasHorseFamine = false;
hasHorsePest = false;
hasHorseCon = false;

conquestPower = 0;
