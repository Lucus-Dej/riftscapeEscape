function unlocokChallenges(){
	var veriArray = [
	global.meta.challenges.beatKingWithFullCircle, 
	global.meta.challenges.beatBossWhileInisdeCircle , 
	global.meta.challenges.beatRunWithVeriRune]
	var veriCheck = true;

	for (var ve = 0; ve < array_length(veriArray); ve++) {
		var check = veriArray[ve];
		if (!check) {
			veriCheck = false
		}
	}
	if (veriCheck) {
		global.meta.levels.unlockedLibrary = true;
	}
	
	// torzol unlock
	var torzArray = [
	global.meta.challenges.beatKingWithFullMinion, 
	global.meta.challenges.beatBossWithOnlyMinion , 
	global.meta.challenges.beatRunWithTorzRune]
	var torzCheck = true;

	for (var t = 0; t < array_length(veriArray); t++) {
		var check = veriArray[t];
		if (!check) {
			torzCheck = false
		}
	}
	if (torzCheck) {
		global.meta.levels.unlockedPlains = true;
	}
	
	// krost unlock
	var krostArray = [
	global.meta.challenges.beatKingWithFullDodge, 
	global.meta.challenges.beatBossWithOnlyDodge , 
	global.meta.challenges.beatRunWithKrostRune]
	var krostCheck = true;

	for (var k = 0; k < array_length(krostArray); k++) {
		var check = krostArray[k];
		if (!check) {
			krostCheck = false
		}
	}
	if (krostCheck) {
		global.meta.levels.unlockedAbyss = true;
	}
	
	// virst unlock
	var virstArray = [
	global.meta.challenges.beatKingWithFullBomb, 
	global.meta.challenges.beatBossWithOnlyBomb , 
	global.meta.challenges.beatRunWithVirstRune]
	var virstCheck = true;

	for (var vi = 0; vi < array_length(virstArray); vi++) {
		var check = virstArray[vi];
		if (!check) {
			virstCheck = false
		}
	}
	if (virstCheck) {
		global.meta.levels.unlockedChaoslands = true;
	}
	
	// alextra unlock
	var alextraArray = [
	global.meta.challenges.beatKingWithFullHusk, 
	global.meta.challenges.beatBossWithOnlyHusk , 
	global.meta.challenges.beatRunWithAlextraRune]
	var alextraCheck = true;

	for (var a = 0; a < array_length(alextraArray); a++) {
		var check = alextraArray[a];
		if (!check) {
			alextraCheck = false
		}
	}
	if (alextraCheck) {
		global.meta.levels.unlockedTaiga = true;
	}
	
	// sifter unlock
	var sifterArray = [
	global.meta.challenges.beatKingWithFullSword, 
	global.meta.challenges.beatBossWithOnlySword , 
	global.meta.challenges.beatRunWithSifterRune]
	var sifterCheck = true;

	for (var s = 0; s < array_length(sifterArray); s++) {
		var check = sifterArray[s];
		if (!check) {
			sifterCheck = false
		}
	}
	if (sifterCheck) {
		global.meta.levels.unlockedAtlantis = true;
	}
	
	
	
}