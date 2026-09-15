function finishRun(){
	with (oPlayerManager) {
		if (hasVeribroseRune) {
			global.meta.challenges.beatRunWithVeriRune = true;
			showChallenge("beatRunWithVeriRune")
		}
		
		if (hasTorzolRune) {
			global.meta.challenges.beatRunWithTorzRune = true;
			showChallenge("beatRunWithTorzRune")
		}
		
		if (hasKrostRune) {
			global.meta.challenges.beatRunWithKrostRune = true;
			showChallenge("beatRunWithKrostRune")
		}
		
		if (hasVirstRune) {
			global.meta.challenges.beatRunWithVirstRune = true;
			showChallenge("beatRunWithVirstRune")
		}
		
		if (hasAlextraRune) {
			global.meta.challenges.beatRunWithAlextraRune = true;
			showChallenge("beatRunWithAlextraRune")
		}
		
		if (hasSifterRune) {
			global.meta.challenges.beatRunWithSifterRune = true;
			showChallenge("beatRunWithSifterRune")
		}
		
		if (hasVeribroseRune) {
			global.meta.challenges.beatRunWithVeriRune = true;
			showChallenge("beatRunWithVeriRune")
		}
		
		if (hasDeathRune) {
			global.meta.challenges.gotItemScytheDeath = true;
			showChallenge("gotItemScytheDeath")
		}
		if (hasWarRune) {
			global.meta.challenges.gotItemJavelinWar = true;
			showChallenge("gotItemJavelinWar")
		}
		if (hasFamineRune) {
			global.meta.challenges.gotItemSickleFamine = true;
			showChallenge("gotItemSickleFamine")
		}
		if (hasPestRune) {
			global.meta.challenges.gotItemPestDagger = true;
			showChallenge("gotItemPestDagger")
		}
	}
}