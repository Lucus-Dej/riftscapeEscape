// Inherit the parent event
event_inherited();
image_alpha = 0.3;
create = false;
destroy = false;
turretArray = [oTurret, oTurretV, oTurretQuad, oTurretQuadSwitch, 
oTurretBlackhole, oTurretDOTFire, oTurretDOTICE, oTurretDOTPois, 
oTurretFire, oTurretFireDouble, oTurretFireTriple, oTurretFireQuad, oTurretHoming, oTurretRocketHoming]

currentTurret = noone;
turretIndex = -1;
switchCooldown = 120;
switchTimer = switchCooldown;
childExistence = childExistenceTot;