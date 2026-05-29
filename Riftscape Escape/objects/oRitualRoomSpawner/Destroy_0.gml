var enemPool = getEnemPool(currentFloor)
var bIndex = irandom(array_length(enemPool.bArray)-1);
boss = enemPool.bArray[bIndex];

spawn = instance_create_layer(target.x, target.y, "Instances", boss);
array_push(manager.spawnArray, spawn);
spawn.isBoss = true;

bossMod(spawn);
spawn.xp = 0;