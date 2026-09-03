convoIndex = 0;
tutIndex = 0;
dialArray = [
	// the voice introduces itself to the mc. a deal is struct.
	"What an interesting creature you are...", 
	"The Rifters will slaughter you, like they've done with all that came before.",
	"But you... you can change this. I feel it in your spirit, your soul.",
	"Your potential is great, but alone you are hollow.",
	"Accept my gift. Seek me out. Together, we can be free.",
];
levelUpDialArray = [
	// level up talk
	"PRESS TAB TO LEVEL UP",
	"USE YOUR LEVELS TO BOOST STATS",
	"ONCE A STAT REACHES ITS THRESHOLD, A CHOICE CAN BE MADE",
	"THE LEFT NODE (A) WILL UNLOCK THE ABILITY",
	"THE RIGHT NODE (T) WILL UNLOCK A TOKEN",
	"THIS TOKEN CAN BE CLICKED ON TO SELECT IT",
	"CLICK ON AN UNLCOKED ABILITY TO UPGRADE IT",
	"TEST FOR YOURSELF. THEN ENTER THE PORTAL WHEN YOU ARE READY"
];
flagArray = [];
alarm[0] = 60;
rmManager = noone;
finishedCombat = false;