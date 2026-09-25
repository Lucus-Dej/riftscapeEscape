global.do3d = false;
global.musicAudio = 0.2;
global.sfxAudio = 0.5;
global.difficulty = 2;
global.gameSteps = 0;
global.inCombat = false;
global.resH = 720;
global.resW = 1280;
global.lifestats = {
	xp: 0,
	timePlayedInSeconds: 0,
	coverBroken: 0,
	simpleSkipped: 0,
	enemKilledHoming: 0,
}
queueEvilRuneAdd = false;
extendRun = false;
//audio_falloff_set_model(audio_falloff_exponent_distance);
// meta challenge progrssion
password = "CONQUEST";
inputIndex = 0;
global.runConquest = false;
global.meta = {
	challenges: {
		// veribrose unlock
		beatKingWithFullCircle: false,
		beatBossWhileInisdeCircle: false,
		beatRunWithVeriRune: false,
		
		// torzol unlock
		beatKingWithFullMinion: false,
		beatBossWithOnlyMinion: false,
		beatRunWithTorzRune: false,
		
		// krost unlock
		beatKingWithFullDodge: false,
		beatBossWithOnlyDodge: false,
		beatRunWithKrostRune: false,
		
		// virst unlock
		beatKingWithFullBomb: false,
		beatBossWithOnlyBomb: false,
		beatRunWithVirstRune: false,
		
		// alextra unlock
		beatKingWithFullHusk: false,
		beatBossWithOnlyHusk: false,
		beatRunWithAlextraRune: false,
		
		// sifter unlock
		beatKingWithFullSword: false,
		beatBossWithOnlySword: false,
		beatRunWithSifterRune: false,
		
		
		// item unlocks
		gotItemGenStone: false,
		
		gotItemHammer: false,
		
		gotItemHollowedDice: false,
		
		gotItemPaychecks: false,
		
		gotItemRareseed: false,
		
		gotItemReflectiveGem: false,
		
		gotItemFoolsGold: false,
		
		gotItemPiggyBank: false,
		
		gotItemWaterdamagedNote: false,
		
		gotItemLilFurnace: false,
		
		gotItemFallenCrown: false,
		
		gotItemPathForward: false,
		
		gotItemDictionary: false,
		
		gotItemSingularity: false,
		
		gotItemSacDagger: false,
		
		gotItemTetheredSoul: false,
		
		gotItemPestDagger: false,
		
		gotItemScytheDeath: false,
		
		gotItemSickleFamine: false,
		
		gotItemJavelinWar: false,
		
		gotItemSwordConquest: false,
	},
	
	levels: {
		unlockedLibrary: false,
		unlockedPlains: false,
		unlockedAbyss: false,
		unlockedTaiga: false,
		unlockedChaoslands: false,
		unlockedAtlantis: false
	}
}
//resetSave()
loadGame()
unlocokChallenges()
// challenge checking;
if (global.meta.levels.unlockedLibrary || 
	global.meta.levels.unlockedPlains || 
	global.meta.levels.unlockedAbyss || 
	global.meta.levels.unlockedTaiga || 
	global.meta.levels.unlockedChaoslands || 
	global.meta.levels.unlockedAtlantis) {
		extendRun = true;
	}

global.currentTrack = aChimingCrystals;
init = false;
audio_group_load(agMusic);
audio_group_load(agSFX);
if (audio_group_is_loaded(agMusic)) {
	audio_play_sound(global.currentTrack, 1000, true, global.musicAudio);
	control = true;
}
//window_set_fullscreen(true);


sfxLoaded = false;
control = false;
global.enemBulletCount = 0;

global.metaChallengeArray = {	
	challenges: {
		gotItemGenStone: {
			title: "???",
			spr: sGenStone,
			sprIndex: 0,
			hint: "Round The World Without Looking Back",
			desc: "Finish A Floor Without Entering The Same Door Twice",
		},
		
		gotItemHammer: {
			title: "Hammer",
			spr: sHammer,
			sprIndex: 0,
			hint: "Mine, Mine, Mine", 
			desc: "Destroy 100 Pieces Of Cover",
		},
		
		gotItemHollowedDice: {
			title: "Hollowed Dice",
			spr: sHollowedDice,
			sprIndex: 0,
			hint: "Leave The Riches To The Poor", 
			desc: "Skip 30 Simple items",
		},
		
		gotItemPaychecks: {
			title: "Ice Soup/Weekly Paycheck",
			spr: sIceSoup,
			sprIndex: 0,
			hint: "Fly High And Lose It All",
			desc: "Gain A Luck Of 10 And End A Run In The Negatives",
		},
		
		gotItemRareseed: {
			title: "Rare Seed",
			spr: sRareSeed,
			sprIndex: 0,
			hint: "Reach Fortitude Beyond Reward",
			desc: "Gain A Life Stat Of 10",
		},
		
		gotItemReflectiveGem: {
			title: "Reflective Gem",
			spr: sReflectiveGem,
			sprIndex: 0,
			hint: "Reach The Finish Line, Untouched And Unphased", 
			desc: "Complete A Procedural Floor Without Taking Damage",
		},
		
		gotItemFoolsGold: {
			title: "Fool's Gold",
			spr: sFoolsGold,
			sprIndex: 0,
			hint: "Abandon Riches",
			desc: "Skip A Mythic Item",
		},
		
		gotItemPiggyBank: {
			title: "Piggy Bank",
			spr: sPiggyBank,
			sprIndex: 0,
			hint: "For A Rainy Day...",
			desc: "Store More Than 99,999XP In Your Vault",
		},
		
		gotItemWaterdamagedNote: {
			title: "Water Damaged Note",
			spr: sWaterDamagedNote,
			sprIndex: 0,
			hint: "Overcome A Challenge With A Single Strike",
			desc: "Defeat A Boss With A Single Attack",
		},
		
		gotItemLilFurnace: {
			title: "Lil Furnace",
			spr: sMiniDestroyer,
			sprIndex: 0,
			hint: "Avenge The Wasteland",
			desc: "Defeat The Wasteland Destroyer",
		},
		
		gotItemFallenCrown: {
			title: "Broken Crown",
			spr: sBrokenCrown,
			sprIndex: 0,
			hint: "Kingslayer",
			desc: "Defeat The Rifter King",
		},
		
		gotItemPathForward: {
			title: "Path Forward",
			spr: sPathForward,
			sprIndex: 0,
			hint: "Topple The Kingdown Using Only Your Own Hands", 
			desc: "Defeat The Rifter King Without Any Item Above Simple Rarity",
		},
		
		gotItemDictionary: {
			title: "Dictionary",
			spr: sDictionary,
			sprIndex: 0,
			hint: "Topple The Kingdom Without The Power Of Your Bargin",
			desc: "Defeat The Rifter King With A Maximum Of 1 In Every Stat",
		},
		
		gotItemSingularity: {
			title: "Singularity",
			spr: sSingularity,
			sprIndex: 0,
			hint: "Overcome Your Enemies With Their Own Strength",
			desc: "Kill 6 Enemies With Their Own Homing Bullets",
		},
		
		gotItemSacDagger: {
			title: "Sacrifical Dagger",
			spr: sSacDagger,
			sprIndex: 0,
			hint: "Bleed Until There Is Nothing Left To Bleed", 
			desc: "Reach The Minumum HP Softcap",
		},
		
		gotItemTetheredSoul: {
			title: "Tethered Soul",
			spr: sTetheredSoul,
			sprIndex: 0,
			hint: "Fumble At The Easiest Finish Line",
			desc: "Die To The Rifter King In Easy Mode",
		},
		
		gotItemPestDagger: {
			title: "Dagger's Of Pestilence",
			spr: sDaggerPestPickup,
			sprIndex: 0,
			hint: "Survive The Curse Of Pestilence",
			desc: "Complete A Run With The Rune Of Pestilence",
		},
		
		gotItemScytheDeath: {
			title: "Scythe Of Death",
			spr: sScytheDeath,
			sprIndex: 0,
			hint: "Survive The Curse Of Death",
			desc: "Complete A Run With The Rune Of Death",
		},
		
		gotItemSickleFamine: {
			title: "Sickle's Of Famine",
			spr: sSickleFaminePickup,
			sprIndex: 0,
			hint: "Survive The Curse Of Famine",
			desc: "Complete A Run With The Rune Of Famine",
		},
		
		gotItemJavelinWar: {
			title: "Javelin Of War",
			spr: sJavelinWar,
			sprIndex: 0,
			hint: "Survive The Curse Of War",
			desc: "Complete A Run With The Rune Of War",
		},
		
		gotItemSwordConquest: {
			title: "Sword Of Conquest",
			spr: sSwordConquest,
			sprIndex: 0,
			hint: "Reach A New Land While Under Conquest's Curse",
			desc: "Reach The Desert In Nightmare Difficulty",
		},
		
		// veribrose unlock
		beatKingWithFullCircle: {
			title: "Veribrose's Will",
			spr: sChallengeMenu,
			sprIndex: 1,
			hint: "Show Devotion To The Wing Of Fate", 
			desc: "Complete A Run With A Fully Upgraded Fate Circle", 
		}, 
		beatBossWhileInisdeCircle: {
			title: "Veribrose's Power",
			spr: sChallengeMenu,
			sprIndex: 1,
			hint: "Defy The Odds With The Only The Power Of Fate",
			desc: "Kill A Boss Without Ever Leaving The Fate Circle",
		},
		beatRunWithVeriRune: {
			title: "Veribrose's Test",
			spr: sVeribroseRune,
			sprIndex: 0,
			hint: "Finish The Gauntlet While Under The Curse Of Fate",
			desc: "Complete A Run With The Rune Of Veribrose Active",
		},
		
		// torzol unlock
		beatKingWithFullMinion: {
			title: "Torzol's Will",
			spr: sChallengeMenu,
			sprIndex: 3,
			hint: "Show Devotion To The Wing Of Life", 
			desc: "Complete A Run With A Fully Upgraded Life Minion", 
		},
		beatBossWithOnlyMinion: {
			title: "Torzol's Power",
			spr: sChallengeMenu,
			sprIndex: 3,
			hint: "Defy The Odds With The Only The Power Of Life",
			desc: "Kill A Boss With Only Damage Dealt With Your Life Minion",
		},
		beatRunWithTorzRune: {
			title: "Torzol's Test",
			spr: sTorzolRune,
			sprIndex: 0,
			hint: "Finish The Gauntlet While Under The Curse Of Life",
			desc: "Complete A Run With The Rune Of Torzol Active",
		},
		
		// krost unlock
		beatKingWithFullDodge: {
			title: "Krost's Will",
			spr: sChallengeMenu,
			sprIndex: 5,
			hint: "Show Devotion To The Wing Of Reality", 
			desc: "Complete A Run With A Fully Upgraded Reality Dodge", 
		},
		beatBossWithOnlyDodge: {
			title: "Krost's Power",
			spr: sChallengeMenu,
			sprIndex: 5,
			hint: "Defy The Odds With The Only The Power Of Reality",
			desc: "Kill A Boss With Only Damage Dealt With Your Reality Dodge",
		},
		beatRunWithKrostRune: {
			title: "Krost's Test",
			spr: sKrostRune,
			sprIndex: 0,
			hint: "Finish The Gauntlet While Under The Curse Of Reality",
			desc: "Complete A Run With The Rune Of Krost Active",
		},
		
		// virst unlock
		beatKingWithFullBomb: {
			title: "Virst's Will",
			spr: sChallengeMenu,
			sprIndex: 9,
			hint: "Show Devotion To The Wing Of Time", 
			desc: "Complete A Run With A Fully Upgraded Time Bomb", 
		},
		beatBossWithOnlyBomb: {
			title: "Virst's Power",
			spr: sChallengeMenu,
			sprIndex: 9,
			hint: "Defy The Odds With The Only The Power Of Time",
			desc: "Kill A Boss With Only Damage Dealt With Your Time Bomb",
		},
		beatRunWithVirstRune: {
			title: "Virst's Test",
			spr: sVirstRune,
			sprIndex: 0,
			hint: "Finish The Gauntlet While Under The Curse Of Time",
			desc: "Complete A Run With The Rune Of Virst Active",
		},
		
		// alextra unlock
		beatKingWithFullHusk: {
			title: "Alextra's Will",
			spr: sChallengeMenu,
			sprIndex: 7,
			hint: "Show Devotion To The Wing Of Thought",  
			desc: "Complete A Run With A Fully Upgraded Thought Husk", 
		},
		beatBossWithOnlyHusk: {
			title: "Alextra's Power",
			spr: sChallengeMenu,
			sprIndex: 7,
			hint: "Defy The Odds With The Only The Power Of Thought",
			desc: "Kill A Boss With Only Damage Dealt With Your Thought Husk",
		},
		beatRunWithAlextraRune: {
			title: "Alextra's Test",
			spr: sAlextraRune,
			sprIndex: 0,
			hint: "Finish The Gauntlet While Under The Curse Of Thought",
			desc: "Complete A Run With The Rune Of Alextra Active",
		},
		
		// sifter unlock
		beatKingWithFullSword: {
			title: "Sifter's Will",
			spr: sChallengeMenu,
			sprIndex: 11,
			hint: "Show Devotion To The Wing Of Essence", 
			desc: "Complete A Run With A Fully Upgraded Essence Sword", 
		},
		beatBossWithOnlySword: {
			title: "Sifter's Power",
			spr: sChallengeMenu,
			sprIndex: 11,
			hint: "Defy The Odds With The Only The Power Of Essence",
			desc: "Kill A Boss With Only Damage Dealt With Your Essence Sword",
		},
		beatRunWithSifterRune: {
			title: "Sifter's Test",
			spr: sSifterRune,
			sprIndex: 0,
			hint: "Finish The Gauntlet While Under The Curse Of Essence",
			desc: "Complete A Run With The Rune Of Sifter Active",
		},
			
	},
	textBoxArray: [],
}

//draw challenge stuff	
drawChallenge = false;

challengeMenu = {
	challengeKeys: variable_struct_get_names(global.metaChallengeArray.challenges),
	challengeSize: array_length(variable_struct_get_names(global.metaChallengeArray.challenges)),
	currentIndex: 0,
	scrollTarget: 0,
	scrollPosition: 96,
	challengeSpacing: 96,
	titleText: "??????",
	currentImg: sActionFIgure,
	hintText: "Find The Man In The Field. Slay Him",
	activeBox: noone,
	imageBox: noone,
	hintBox: noone,
	returnButton: noone,
	//completedCurrentChallenge: false,
	visibleChallenges: 2,
}
maxScroll = (challengeMenu.challengeSize - challengeMenu.visibleChallenges) * challengeMenu.challengeSpacing;
