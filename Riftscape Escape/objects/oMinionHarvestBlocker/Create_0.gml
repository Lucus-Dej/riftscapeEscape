oItemManager.harvestBlockerCount ++;
count = oItemManager.harvestBlockerCount;
orbitTarget = oTruePlayer; 
orbitDistance = 60;
orbitSpeed = 4; 
orbitAngle = 0;
hp = 20;
if (oItemManager.hasLostCrown) {
	hp = 40;
}
init = false;
oItemManager.lastBlocker = id;