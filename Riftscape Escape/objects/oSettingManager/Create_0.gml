global.musicAudio = 0.2;
global.sfxAudio = 0.5;
global.difficulty = 2;
global.gameSteps = 0;
queueEvilRuneAdd = false;
extendRun = false;
// meta challenge progrssion
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
		beatRunWithSifterRune: false
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

// challenge checking;
if (global.meta.levels.unlockedLibrary || 
	global.meta.levels.unlockedPlains || 
	global.meta.levels.unlockedAbyss || 
	global.meta.levels.unlockedTaiga || 
	global.meta.levels.unlockedChaoslands || 
	global.meta.levels.unlockedAtlantis) {
		extendRun = true;
	}
unlocokChallenges()
show_debug_message(global.meta.levels.unlockedLibrary)
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