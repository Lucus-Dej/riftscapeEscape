global.gameSteps++;
if (drawChallenge) {
	if (mouse_wheel_up()) {
		/*challengeMenu.currentIndex++;
		if (challengeMenu.currentIndex >= challengeMenu.challengeSize) {
			challengeMenu.currentIndex = 0;
		}*/
		challengeMenu.scrollTarget -= challengeMenu.challengeSpacing;
		
	}
	if (mouse_wheel_down()) {
		/*challengeMenu.currentIndex--;
		if (challengeMenu.currentIndex < 0) {
			challengeMenu.currentIndex = challengeMenu.challengeSize - 1;
		}*/
		challengeMenu.scrollTarget += challengeMenu.challengeSpacing;
	}
	challengeMenu.scrollTarget = clamp(challengeMenu.scrollTarget, 320, maxScroll);
	challengeMenu.scrollPosition += (challengeMenu.scrollTarget - challengeMenu.scrollPosition) * 0.2;
}
if (drawChallenge && array_length(global.metaChallengeArray.textBoxArray) > 0) {
	if (!instance_exists(challengeMenu.hintBox)) {
		challengeMenu.returnButton = instance_create_layer(display_get_gui_width()*0.275, 64, "Instances", oButtonStartMenu, 
			{buttonID: 8, image_yscale: 1.5, image_xscale: 4})
		challengeMenu.returnButton.drawText = "RETURN"; 
	}
	for (var i = 0; i < challengeMenu.challengeSize; i++) {
		var index = i + challengeMenu.currentIndex;
		if (index > challengeMenu.challengeSize-1) {
			index -= challengeMenu.challengeSize;
		}
		if (index < 0) {
			index += challengeMenu.challengeSize;
		}
		var textBox = global.metaChallengeArray.textBoxArray[index];
		//textBox.y = 160 - (i*-96)

	}
	if (instance_exists(challengeMenu.activeBox)) {
		var currentIndex = challengeMenu.activeBox.buttonID;
		var key = challengeMenu.challengeKeys[currentIndex];
		var challenge = global.metaChallengeArray.challenges[$ key];
		
		
		if (!instance_exists(challengeMenu.imageBox)) {
			challengeMenu.imageBox = instance_create_layer(display_get_gui_width()*0.75, display_get_gui_height()*0.4, "Instances", oChallengeMenuImgBox, {image_xscale: 8, image_yscale: 8})
		} else {
			var sprite = sMystery;
			var sIndex = 0;
			if (global.meta.challenges[$ key]) {
				sprite = challenge.spr;
				sIndex = challenge.sprIndex;
			}
			challengeMenu.imageBox.img = sprite;
			challengeMenu.imageBox.index = sIndex;
		}
		if (!instance_exists(challengeMenu.hintBox)) {
			challengeMenu.hintBox = instance_create_layer(display_get_gui_width()*0.75, display_get_gui_height()*0.8, "Instances", oChallengeMenuHintBox, 
			{image_xscale: 10, image_yscale: 1.5})
		} else {
			var txt = "";
			var newSpr = sButtonLevel;
			if (global.meta.challenges[$ key]) {
			    txt = challenge.desc;
				newSpr = sChallengeTextbox;
			} else {
			    txt = challenge.hint;
			}
			challengeMenu.hintBox.drawText = txt;
			//challengeMenu.hintBox.sprite_index = newSpr;
		}
	}
}
