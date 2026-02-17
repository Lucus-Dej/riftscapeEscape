event_inherited();
speed = 5;
if (instance_exists(oActionFigureAttack)) {
direction = oActionFigureAttack.shotAngle;
}
targetID = noone;
target = noone;
parried = false;
damagedList = ds_map_create();
damage = global.playerDamage/2;