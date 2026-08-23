function recalcMaxHP(){
	var startingHP = 100;
	oPlayerManager.max_hp = ((startingHP+70*sqrt((global.playerLife - 1)*0.2))/oItemManager.sacDaggerPenalty);
}