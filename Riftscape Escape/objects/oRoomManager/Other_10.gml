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
	} else if (enemyPull < enem1count + enem2count) {
		tempEnemy = enem2;
		enem2count--;
	} else if (enemyPull < enem1count + enem2count + enem3count) {
		tempEnemy = enem3;
		enem3count--;
	} else if (enemyPull < enem1count + enem2count + enem3count + enem4count) {
		tempEnemy = enem4;
		enem4count--;
	} else if (enemyPull < enem1count + enem2count + enem3count + enem4count + enem5count) {
		tempEnemy = enem5;
		enem5count--;	
	} else if (enemyPull < enem1count + enem2count + enem3count + enem4count + enem5count + enem6count) {
		tempEnemy = enem6;
		enem6count--;
	} else if (enemyPull < enem1count + enem2count + enem3count + enem4count + enem5count + enem6count + enem7count) {
		tempEnemy = enem7;
		enem7count--;
	} else if (enemyPull < enem1count + enem2count + enem3count + enem4count + enem5count + enem6count + enem7count + enem8count) {
		tempEnemy = enem8;
		enem8count--;
	} else if (enemyPull < enem1count + enem2count + enem3count + enem4count + enem5count + enem6count + enem7count + enem8count + enem9count) {
		tempEnemy = enem9;
		enem9count--;
	} else if (enemyPull < enem1count + enem2count + enem3count + enem4count + enem5count + enem6count + enem7count + enem8count + enem9count + enem10count) {
		tempEnemy = enem10;
		enem10count--;
	}	
	enemies = enem1count + enem2count + enem3count + enem4count + enem5count + enem6count + enem7count + enem8count + enem9count + enem10count;
}
}
