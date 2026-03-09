function realityUp() {
	global.playerReality++;
	oPlayerManager.statSpeed =  sqrt(global.playerReality) * 0.55;
}
function fateUp() {
	global.playerFate++;
	oPlayerManager.statDamage = sqrt(global.playerFate)*0.25
}
function thoughtUp() {
	global.playerThought++;
	oPlayerManager.statCooldown ++;
	
	var raw = (global.playerThought * 0.2) + power(global.playerThought, 0.5) * 0.2;
	oPlayerManager.statBulletDelay = raw/ (1+raw/6)

}
function lifeUp() {
	var startingHP = 100;
	var oldRatio = oPlayerManager.max_hp;
	global.playerLife++;
	oPlayerManager.max_hp = startingHP+70*sqrt((global.playerLife - 1)*0.2);
	var newRatio = oPlayerManager.max_hp;
	
	global.player_health += newRatio - oldRatio;
}
function timeUp() {
	global.playerTime++;
}
function essenceUp() {
	global.playerEssence++;
}
