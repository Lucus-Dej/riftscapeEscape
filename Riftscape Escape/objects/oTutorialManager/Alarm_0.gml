switch (tutIndex) {
	case 0:
	if (convoIndex < array_length(dialArray)) {
		alarm[0] = 480;
		oPlayerManager.displayRuneDuration = 420;
		oPlayerManager.runeTxt = dialArray[convoIndex];
		convoIndex++;
	} else {
		oPlayerManager.displayRuneDuration = 150;
		oPlayerManager.runeTxt = "PRESS SPACE TO GRAB ITEM";
		convoIndex = 0;
		tutIndex ++;
		with (flagArray[1]) {
			var f = instance_create_layer(x, y, "Items", oDarkDeal);
		}
	}
	break;
	case 1:
	if (convoIndex < array_length(levelUpDialArray)) {
		alarm[0] = 300;
		oPlayerManager.displayRuneDuration = 280;
		oPlayerManager.runeTxt = levelUpDialArray[convoIndex];
		convoIndex++;
	} else {
		
	}
	break;
}
