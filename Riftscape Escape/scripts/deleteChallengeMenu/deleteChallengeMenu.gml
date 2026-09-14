function deleteChallengeMenu(){
	with (oSettingManager) {
		for (var i = array_length(global.metaChallengeArray.textBoxArray); i > 0; i--) {
			var textbox = global.metaChallengeArray.textBoxArray[i-1];
			instance_destroy(textbox);
		}
		array_delete(global.metaChallengeArray.textBoxArray, 0, array_length(global.metaChallengeArray.textBoxArray))
		if (instance_exists(challengeMenu.imageBox)) {
			instance_destroy(challengeMenu.imageBox);
		}
		if (instance_exists(challengeMenu.hintBox)) {
			instance_destroy(challengeMenu.hintBox);
		}
		if (instance_exists(challengeMenu.returnButton)) {
			instance_destroy(challengeMenu.returnButton);
		}
	}
}
