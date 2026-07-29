enum BUTTON_ACT {
	playGame,
	audioSettings,
	videoSettings,
	returnToSettingsMenu,
	difficultySettings, 
	endGame,
}
currentMenu = {
	main: {
		title: "Settings",
		buttons: [
			{text: "Start", action: BUTTON_ACT.difficultySettings},
			{text: "Video", action: BUTTON_ACT.videoSettings},
			{text: "Audio", action: BUTTON_ACT.audioSettings},
			{text: "Quit", action: BUTTON_ACT.endGame}
		]
	},
	video: {
		title: "Video",
		buttons: [
			{text: "N/A", action: BUTTON_ACT.returnToSettingsMenu},
		]
		
	},
	audio: {
		title: "Audio",
		buttons: [
			{text: "N/A", action: BUTTON_ACT.returnToSettingsMenu},
		]
		
	},
	difficulty: {
		title: "Difficulty",
		buttons: [
			{text: "N/A", action: BUTTON_ACT.returnToSettingsMenu},
		]
		
	},
	
}