function requestEnemies(_RoomManager, _FloorManager){
	var rM = _RoomManager;
	var fM = _FloorManager;
	
}
function getEnemPool(_currentFloor) {
	var enemArray = [];
	var bossArray = [];
	var evilArray = [];
	var challengeArray = [];
	switch (_currentFloor) {
		case "caves":
		enemArray = [oEnemBasic, oEnemSniper, oEnemSpider];
		bossArray = [oBoss, oBoss2];
		evilArray = [oMiniBoss, oMiniBoss2]
		
		break;
		
		case "desert":
		enemArray = [oEnemBasic, oEnemSniper, oEnemSandSniper, oEnemDesertBiter, oMiniBoss2, oDesertSlammer, oMiniBoss, oMiniBoss3, oBoss, oBoss2];
		bossArray = [oBoss3, oMummy]; 
		break;
		
		case "wasteland":
		enemArray = [oEnemBasic, oEnemSandSniper, oEnemSniper, oDesertSlammer, oWastelandBurner, oWastelandFireRunner, oMiniBoss, oMiniBoss3]
		bossArray = [oWastelandDestroyer];
		evilArray = [oBoss, oBoss2, oBoss3]
		break;
		
		case "plains":
		enemArray = [oEnemBasic, oEnemSpider, oEnemSandSniper, oEnemSniper, oDesertSlammer, oWastelandBurner, oWastelandFireRunner, oMiniBoss, oMiniBoss3, oMiniBoss2, oBoss, oBoss2, oBoss3, oRifterTank];
		bossArray = [oRifterTank];
		evilArray = []
		break;
		
	}
	array_concat(challengeArray, enemArray, evilArray)
	var request = {
		normArray: enemArray,
		bArray: bossArray,
		cArray: challengeArray
	};
	return request;
}
function defineCustomEnemPool() {
	
}
