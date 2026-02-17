if (ds_list_size(BossList) > 0) {
	var i = irandom(ds_list_size(BossList)-1);
	bossPull = BossList[| i];
	tempEnemy = bossPull.bossName;

	//bossPull.bossCount--;
	if (totalBoss <= 0) {
		ds_list_delete(BossList, i);
	}
} else {
	if (enemies > 0) {
	enemyPull = irandom(enemies - 1);
	if (enemyPull < enem1count) {
		tempEnemy = enem1;
		enem1count--;
	} else if (enemyPull < enem2count+ enem1count) {
		tempEnemy = enem2;
		enem2count--;
	} else if (enemyPull < enem3count + enem2count + enem1count) {
		tempEnemy = enem3;
		enem3count--;
	}	
	enemies = enem1count + enem2count + enem3count;
} 
}
