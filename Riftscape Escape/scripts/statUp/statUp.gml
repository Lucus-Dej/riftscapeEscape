function realityUp() {
	global.playerReality++;
	oPlayerManager.statSpeed =  sqrt(global.playerReality) * 0.75;
}
function fateUp() {
	global.playerFate++;
	oPlayerManager.statDamage = sqrt(global.playerFate)*0.2
}
function thoughtUp() {
	global.playerThought++;
	oPlayerManager.statCooldown ++;
	oPlayerManager.statBulletDelay = power(global.playerThought, 0.72) * 0.8;

}
function lifeUp() {
	global.playerLife++;
	global.player_health += (global.playerLife*1.5);
}
function timeUp() {
	global.playerTime++;
}
function essenceUp() {
	global.playerEssence++;
}
