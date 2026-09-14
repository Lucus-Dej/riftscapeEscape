// challenge menu draw 
/*if (drawChallenge) {
	for (var i = 0; i < challengeMenu.challengeSize; i++) {
		var index = i + challengeMenu.currentIndex;
		if (index > challengeMenu.challengeSize-1) {
			index -= challengeMenu.challengeSize;
		}
		if (index < 0) {
			index += challengeMenu.challengeSize;
		}
		draw_text(display_get_gui_width()*0.05, 64 -(i*-64), global.metaChallengeArray.hintArray[index])
		//draw_text(display_get_gui_width()*0.05, 32-(i*-64), global.metaChallengeArray.hintArray[index])
	}
}