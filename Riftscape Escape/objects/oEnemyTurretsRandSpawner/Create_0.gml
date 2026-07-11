// Inherit the parent event
event_inherited();
image_alpha = 0.3;
create = false;
destroy = false;
turretArray = [oTurret, oTurretV, oTurretQuad, oTurretQuadSwitch, oTurretBlackhole, oTurretFire, oTurretFireDouble, oTurretFireTriple, oTurretFireQuad]

currentTurret = noone;
turretIndex = -1;
switchCooldown = 300;
switchTimer = switchCooldown;
childExistence = childExistenceTot;