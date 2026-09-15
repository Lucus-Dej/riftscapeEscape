searchItem = false;
runeCheck = false;
ritualRerollAvailable = false;
luck10Check = false;
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
global.itemClearNum = 0;
sacDaggerPenalty = 1;
sacDaggerBonus = 1;
simpleMin = 0;
simpleMax = 0;
simplePool = 0;
connonMin = 0;
commonPool = 0;
commonMax = commonPool + simplePool;
rareMin = 0;
rarePool = 40;
rareMax = rarePool + commonMax;
powerfulMin = 0;
powerfulPool = 30; // 70
powerfulMax = powerfulPool + rareMax
mythicMin = 0;
mythicPool = 25; // 95
mythicMax = powerfulMax + mythicPool;
ultraMin = 0;
ultraPool = 20; // 115
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
commonItemList = ds_list_create();
commonItemCopy = ds_list_create();
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


ds_list_add(runeItemList, oBloodCharm, oPoisonCharm, oIceCharm, oLightningCharm, oFireCharm, 
	oHeartPendent, oLaserPointer, oUnstableEnergy, oDirectorsNote, oPoorFingerPainting);

ds_list_add(simpleItemList, oBloodySkull, oPottedPlant, oDeformedBrain,oTornPainting,oBurntBook,oBlueprint);

ds_list_add(commonItemList, oRadioactiveMaterial, oBottleOil, oPropheticRune, 
	oDoubleOrNothing, oD2, oSmallSculpture, oBrokenBoomerang)
ds_list_add(rareItemList, oRifterBloodSample, oPlasmaOrb, 
	oAntidote, oWeightlessHourglass, oOilBarrel, oHarvestBook, oBloodyGem, 
	oCrackedEgg, oBlackHoleCharge, oBrokenBloodVial, oImageOfYou, oDirtyMirror);
ds_list_add(powerfulItemList, oElementalVortex, oYin, oYang, oFreedom, 
	oDeathBook, oMagnet, oBrainInAJar, oActionFigure, oWhisperingCrystal, oBrokenSnowglobe, oMirrorShard);
ds_list_add(mythicItemList, oCondensedRift, oPetrifiedHeart, oMolotov,  oTesseract, 
oElectricKite, oGunpowder, oMetalOrb);
ds_list_add(ultraItemList, oDreamsBook, oHauntedGravestone, oElectricDartGun);

//item unlocks
if (global.meta.challenges.gotItemReflectiveGem) {
	ds_list_add(commonItemList, oReflectiveGem);
}
if (global.meta.challenges.gotItemPaychecks) {
	ds_list_add(commonItemList, oIceSoup);
	ds_list_add(rareItemList, oWeeklyPaycheck);
}
if (global.meta.challenges.gotItemHammer) {
	ds_list_add(commonItemList, oHammer);
}
if (global.meta.challenges.gotItemRareseed) {
	ds_list_add(commonItemList, oRareSeed);
}
if (global.meta.challenges.gotItemGenStone) {
	ds_list_add(rareItemList, oGenStone);
}
if (global.meta.challenges.gotItemFoolsGold) {
	ds_list_add(rareItemList, oFoolsGold);
}
if (global.meta.challenges.gotItemHollowedDice) {
	ds_list_add(rareItemList, oHollowedDice);
}
if (global.meta.challenges.gotItemLilFurnace) {
	ds_list_add(powerfulItemList, oLilFurnace);
}
if (global.meta.challenges.gotItemFallenCrown) {
	ds_list_add(powerfulItemList, oLostCrown);
}
if (global.meta.challenges.gotItemWaterdamagedNote) {
	ds_list_add(powerfulItemList, oWaterDamagedNote);
}
if (global.meta.challenges.gotItemTetheredSoul) {
	ds_list_add(powerfulItemList, oTetheredSoulPickup);
}
if (global.meta.challenges.gotItemSacDagger) {
	ds_list_add(mythicItemList, oSacDagger);
}
if (global.meta.challenges.gotItemSingularity) {
	ds_list_add(mythicItemList, oSingularity);
}
if (global.meta.challenges.gotItemDictionary) {
	ds_list_add(mythicItemList, oDictionaryCharge);
}
if (global.meta.challenges.gotItemPathForward) {
	ds_list_add(mythicItemList, oThePathForward);
}
if (global.meta.challenges.gotItemScytheDeath) {
	ds_list_add(ultraItemList, oHorseDeath);
}
if (global.meta.challenges.gotItemSickleFamine) {
	ds_list_add(ultraItemList, oHorseFamine);
}
if (global.meta.challenges.gotItemPestDagger) {
	ds_list_add(ultraItemList, oHorsePest);
}
if (global.meta.challenges.gotItemJavelinWar) {
	ds_list_add(ultraItemList, oHorseWar);
}
if (global.meta.challenges.gotItemSwordConquest) {
	ds_list_add(ultraItemList, oHorseConquest);
}
if (global.meta.challenges.beatRunWithKrostRune) {
	ds_list_add(runeItemList, oKrostEssence);
}
if (global.meta.challenges.beatRunWithVeriRune) {
	ds_list_add(runeItemList, oVeribroseEssence);
}
if (global.meta.challenges.beatRunWithAlextraRune) {
	ds_list_add(runeItemList, oAlextraEssence);
}
if (global.meta.challenges.beatRunWithTorzRune) {
	ds_list_add(runeItemList, oTorzolEssence);
}
if (global.meta.challenges.beatRunWithSifterRune) {
	ds_list_add(runeItemList, oSifterEssence);
}
if (global.meta.challenges.beatRunWithVirstRune) {
	ds_list_add(runeItemList, oVirstEssence);
}



ds_list_copy(runeItemCopy, runeItemList);
ds_list_copy(commonItemCopy, commonItemList);
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
