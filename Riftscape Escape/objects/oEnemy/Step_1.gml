// Inherit the parent event
event_inherited();


if (oPlayerManager.hasBossRune && !sub && !isBoss && !bossModApplied && !bossRuneChecked) {
	var bossI = irandom_range(1, 100);
	if (bossI > 95) {
		isBoss = true;
		bossMod(id)
	}
	bossRuneChecked = true;
}
if (perfectParryTimer > 0) {
	perfectParryTimer--;
}

flash = max(0, flash - 0.15);
if (!maxHPSet) {
	if (global.difficulty == 1) {
		if (variable_instance_exists(id, enemSpeed)) {
			enemSpeed *= 0.7;
		}
		 enemyHP *= 0.8
	} else if (global.difficulty >= 3) {
		if (variable_instance_exists(id, enemSpeed)) {
			enemSpeed *= 1.2;
		}
		 enemyHP *= 1.05;
	} 
	baseSpeed = enemSpeed;
	initalSpeed = enemSpeed;
	maxHP =  enemyHP;
	healthTotal = maxHP;
	maxHPSet = true;
	
	
}
if (!bossModApplied && isBoss) {
	bossModApplied = true;
	enemyHP *= hpMult;
	initalSpeed *= speedMult;
	enemSpeed *= speedMult;
	damage *= dmgMult;
	shoot_delay /= cooldownMult;
	event_user(13);
}
slowPenaltyPercent = 0;

var weightedSlows = [];
var percent = 100;
for (var i = array_length(slowArray) - 1; i >= 0; i--) {
	if (--slowTimerArray[i] <= 0) {
		array_delete(slowArray, i, 1);
		array_delete(slowTimerArray, i, 1);
		array_delete(slowMaxTimerArray, i, 1);
		array_delete(slowTargetArray, i, 1);
		continue;
	}
	percent = slowTimerArray[i] / slowMaxTimerArray[i];
	show_debug_message("percent =" + string(percent));
	var weightedSlow = {
		penalty : slowArray[i],
		prioScore : slowArray[i] * power(percent, 1.5)
	};

	array_push(weightedSlows, weightedSlow);
	//array_push(weightedSlows,{penalty : slowArray[i], priority : slowArray[i] * power(percent, 1.5)});
}

array_sort(weightedSlows, function(a, b) {
    return b.prioScore - a.prioScore;
});

var weight = 1;

for (var i = 0; i < array_length(weightedSlows); i++) {
	slowPenaltyPercent += weightedSlows[i].penalty * weight * percent;
	weight *= 0.65;
}

slowPenaltyPercent = clamp(slowPenaltyPercent, 0, 95);

baseSpeed = enemSpeed * (1 - slowPenaltyPercent / 100);
// countdown
if (!sub)
path_timer--;
if (path_timer <= 0 && canPathfind && !brainDead) {
    path_timer = path_cooldown;
	var search = pathfind(global.Grid, oTruePlayer, baseSpeed, id);
	if (flying) {
		search = pathfind(global.flyGrid, oTruePlayer, baseSpeed, id);
	}
    
	if (!search) {
		respawnTimer--;
	}
}
if (dragTimer > 0) {
    applyDrag(dragPower, dragDir, oWalls);
    dragTimer--;

    if (dragTimer <= 0) {
        path_timer = 0;
    }
}
if (respawnTimer <= 0) {
	var respawn = instance_nearest(x, y, oEnemStart)
	if (instance_exists(respawn)) {
		x = respawn.x;
		y = respawn.y;
		respawnTimer = 30;
	}
}

