function finishRun(){
	with (oPlayerManager) {
		if (hasVeribroseRune) {
			global.meta.challenges.beatRunWithVeriRune = true;
		}
		
		if (hasTorzolRune) {
			global.meta.challenges.beatRunWithTorzRune = true;
		}
		
		if (hasKrostRune) {
			global.meta.challenges.beatRunWithKrostRune = true;
		}
		
		if (hasVirstRune) {
			global.meta.challenges.beatRunWithVirstRune = true;
		}
		
		if (hasAlextraRune) {
			global.meta.challenges.beatRunWithAlextraRune = true;
		}
		
		if (hasSifterRune) {
			global.meta.challenges.beatRunWithSifterRune = true;
		}
		
		
	}
}