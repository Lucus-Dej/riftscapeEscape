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
		enemArray = [oEnemBasic, oEnemSniper, oEnemSpider, oEnemBig, oCaveSpitter];
		bossArray = [oBoss, oBoss2, oMiniBoss, oMiniBoss2];
		evilArray = [oMiniBoss, oMiniBoss2]
		
		break;
		
		case "desert":
		enemArray = [oEnemBig, oEnemBasic, oEnemSandSniper, oEnemDesertBiter, oDesertSlammer, oMiniBoss3];
		bossArray = [oBoss3, oDesertSlammer]; 
		evilArray = [oMiniBoss, oMiniBoss2, oBoss, oBoss2]
		break;
		
		case "wasteland":
		enemArray = [oEnemBig, oCaveSpitter, oEnemBasic, oEnemSandSniper, oEnemSniper, oDesertSlammer, oWastelandBurner, oMiniBoss, oMiniBoss3]
		bossArray = [oBoss3, oWastelandFireRunner];
		evilArray = [oBoss, oBoss2, oWastelandFireRunner]
		break;
		
		case "plains":
		enemArray = [oCaveSpitter, oEnemBig, oEnemBasic, oEnemSpider, oEnemSandSniper, oEnemSniper, oDesertSlammer, oWastelandBurner, oWastelandFireRunner, oMiniBoss, oMiniBoss3, oMiniBoss2, oBoss, oBoss2, oBoss3, oRifterTank];
		bossArray = [oRifterTank];
		evilArray = [oRifterTank]
		break;
		
	}
	challengeArray = array_concat(challengeArray, enemArray, evilArray)
	show_debug_message(challengeArray)
	var request = {
		normArray: enemArray,
		bArray: bossArray,
		cArray: evilArray
	};
	return request;
}
function defineCustomEnemPool() {
	
}
