var aim = oPlayer.image_angle;
image_angle = aim  - 90;





if (currentJabRadius < maxJabRadius && !flipped) {
	currentJabRadius += increaseRate;
	//increaseRate++;
	if (currentJabRadius >= maxJabRadius) {
		increaseRate = -4;
		maxJabRadius = -32;
		flipped = true;
	}
} else if (currentJabRadius > maxJabRadius && flipped) {
	currentJabRadius += increaseRate;
	increaseRate--;
	if (currentJabRadius <= maxJabRadius) {
		instance_destroy()
	}
}
//currentJabRadius = lerp(currentJabRadius, orbitTargetRadius, 0.1);

x = oTruePlayer.x + lengthdir_x(currentJabRadius, aim);
y = oTruePlayer.y + lengthdir_y(currentJabRadius, aim);