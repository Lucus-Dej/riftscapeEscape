depth = -10000;

menuOpen = true;
buttonCount = 6;
buttonSpacing = 61;
marginTop = 64;
buttonWidth = 128;
totalButtonWidth = buttonWidth*buttonCount;
totalSpacing = buttonSpacing*buttonCount;
totalWidth = totalButtonWidth + totalSpacing
startingSpace = (display_get_gui_width() - totalWidth)/2 + buttonWidth/2

//var totalWidth = buttonCount * buttonWidth + (buttonCount -1) & buttonSpacing;

startX = startingSpace;

buttons = array_create(buttonCount);

for (var i = 0; i < buttonCount; i++) {
    var bx =startX + i * (buttonWidth + buttonSpacing);
    var by = marginTop

    buttons[i] = instance_create_layer(bx, by, "UI", oLevelButton);

    buttons[i].menu = id;
    buttons[i].index = i;
	buttons[i].width = buttonWidth;
	buttons[i].height = 40;
}

upgradeNames = ["Fate", "Life", "Reality", "Thought", "Time", "Essence"];
upgradeFunctions = [fateUp, lifeUp, realityUp, thoughtUp, timeUp, essenceUp];

function buttonPressed(_index) {
    if (_index < array_length(upgradeFunctions)) {
        upgradeFunctions[_index]();
		oPlayerManager.levelsPending--;
    }
}
