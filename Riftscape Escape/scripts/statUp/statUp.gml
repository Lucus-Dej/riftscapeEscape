function realityUp() {
	global.playerReality++;
	oPlayerManager.statSpeed =  sqrt(global.playerReality) * 0.55;
}
function fateUp() {
	global.playerFate++;
	oPlayerManager.statDamage = sqrt(global.playerFate)*0.25-0.2;
}
function thoughtUp() {
	global.playerThought++;
	oPlayerManager.statCooldown += 1;
	
	var raw = (global.playerThought * 0.2) + power(global.playerThought, 0.5) * 0.2;
	oPlayerManager.statBulletDelay = raw/ (1+raw/6)

}
function lifeUp() {
	var itemHP = oPlayerManager.addHPBonus;
	var startingHP = 100;
	var oldRatio = oPlayerManager.max_hp;
	global.playerLife++;
	oPlayerManager.max_hp = (startingHP+70*sqrt((global.playerLife - 1)*0.2))/oItemManager.sacDaggerPenalty;
	var newRatio = oPlayerManager.max_hp;
	
	global.player_health += newRatio - oldRatio;
}
function healthUp(_bonus) {
	var startingHP = 100;
	var oldRatio = oPlayerManager.max_hp;
	oPlayerManager.max_hp += _bonus;
	var newRatio = oPlayerManager.max_hp;
	
	global.player_health += newRatio - oldRatio;
}
function timeUp() {
	global.playerTime++;
}
function essenceUp() {
	global.playerEssence++;
}


function realityDown() {
	if (global.playerReality > 0) {
		global.playerReality--;
		oPlayerManager.statSpeed = sqrt(global.playerReality) * 0.55;
	}
}
function fateDown() {
	if (global.playerFate > 0) {
		global.playerFate--;
		oPlayerManager.statDamage = sqrt(global.playerFate) * 0.25 - 0.2;
	}
}
function thoughtDown() {
	if (global.playerThought > 0) {
		global.playerThought--;
		
		oPlayerManager.statCooldown -= 1;
		
		var raw = (global.playerThought * 0.2) + power(global.playerThought, 0.5) * 0.2;
		oPlayerManager.statBulletDelay = raw / (1 + raw / 6);
	}
}
function lifeDown() {
	if (global.playerLife > 1) { // prevent going below base
		var startingHP = 100;
		
		var oldMax = oPlayerManager.max_hp;
		
		global.playerLife--;
		
		oPlayerManager.max_hp = (startingHP + 70 * sqrt((global.playerLife - 1) * 0.2)) / oItemManager.sacDaggerPenalty;
		
		var newMax = oPlayerManager.max_hp;
		
		global.player_health += newMax - oldMax;
		
		if (global.player_health < 1) {
			global.player_health = 1;
		}
	}
}
function healthDown(_bonus) {
	var oldMax = oPlayerManager.max_hp;
	oPlayerManager.max_hp -= _bonus;
	var newMax = oPlayerManager.max_hp;
	
	global.player_health += newMax - oldMax;
	
	if (global.player_health < 1) {
		global.player_health = 1;
	}
}
function timeDown() {
	if (global.playerTime > 0) {
		global.playerTime--;
	}
}

function essenceDown() {
	if (global.playerEssence > 0) {
		global.playerEssence--;
	}
}