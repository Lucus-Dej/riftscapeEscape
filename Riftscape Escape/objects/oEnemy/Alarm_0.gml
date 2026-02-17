self.enemey_hp -= dotDamage;
if (instance_exists(oPlayerManager)) {
    global.player_health += ((global.playerFate/5) + global.lifesteal) / 10;
}
dotTicks--;
other.flash = 1
if (dotTicks > 0) {
    alarm[0] = dotDelay;
}
