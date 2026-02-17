// the "health" system
if (uiHealth <= 100 && !inOverhealth) {
	if (instance_exists(overheatBar)){
		instance_destroy(overheatBar);
	}
	draw_healthbar(16, 16, 348, 32, uiHealth, c_blue, c_black, c_red, 0, true, true);
} else if (!overHealthOverheated) {
	draw_healthbar(16, 16, 348, 32, overhealthTimer, c_black, c_black, c_yellow, 0, true, true);
	overhealthTimer-=0.5;
	inOverhealth = true;
	if (overhealthTimer < 0) {
		overhealthTimer = overhealthCooldown;
		dodgeLifeBonus = 0;
		global.player_health = max_hp;
		overhealthCooldownUI = (overhealthSuperTimer/overhealthSuperTotal)*100;
		inOverhealth = false;
		overHealthOverheated = true;
		overhealthFlag = true;
		overHealthSpeedBonus = 0;
		overHealthBulletDelay = 0;
		overHealthDamageBuff = 0;
	}
} else overheatBar = draw_healthbar(16, 16, 348, 32, 100, c_blue, c_black, c_red, 0, true, true);

if (dodgeLifeBonus > 0) {
	draw_healthbar(16, 16, 348, 32, (dodgeLifeBonus/dodgeLifeHP)*100, c_black, c_green, c_green, 0, true, true);
}

if (overHealthOverheated) {
	overHealthCooldownBuff = 0;
	overhealthSuperTimer--;
	overhealthCooldownUI = (overhealthSuperTimer/overhealthSuperTotal)*100;
	draw_healthbar(16, 48, 300, 32, overhealthCooldownUI, c_yellow, c_black, c_orange, 0, true, true);
	if (overhealthSuperTimer < 0) {
	overhealthSuperTimer = overhealthSuperCooldown;
	overHealthOverheated = false;
}
}
// abilities
if (initate_sword == true && sword_charge < 100) {
	draw_healthbar(16, 50, 280, 58, sword_charge, c_white, c_black, c_blue, 0, true, true);
}
if (initDodge == true && dodgeCharge < 100 && !dodgeBlackFlashCheck) {
	draw_healthbar(16, 60, 280, 68, dodgeCharge, c_white, c_black, c_orange, 0, true, true);
}
if (inDodge && dodgeBlackFlashCheck && dodgeBlackFlashTimer > 0) {
	draw_healthbar(16, 60, 280, 68, dodgeBlackFlashTimer, c_white, c_black, c_black, 0, true, true);
}
if (initCrystal && crystalCharge < 100) {
	draw_healthbar(16, 70, 280, 78, crystalCharge, c_white, c_black, c_aqua, 0, true, true);
}
if (initCircle && circleCharge < 100) {
	draw_healthbar(16, 80, 280, 88, circleCharge, c_white, c_black, c_aqua, 0, true, true);
}
if (initHusk && huskCharge < 100) {
	draw_healthbar(16, 90, 280, 98, huskCharge, c_white, c_black, c_purple, 0, true, true);
}
if (!inLevelMenu) {
	draw_set_color(c_white);
	draw_set_font(fLevels);
	draw_healthbar(540, 16, 864, 24, xpUI, c_white, c_yellow, c_yellow, 0, true, true);
	draw_text(680, 32, "Level:"+string(xpLevel));
}
if (inLevelMenu) {
	draw_set_font(fLevels);
	draw_set_color(c_white);
	draw_set_valign(fa_middle);

var cx = display_get_gui_width() / 2;
var cy = 32;
draw_set_color(c_white);
var label = "Levels Pending:"
draw_set_halign(fa_center);

var w = string_width(label);
draw_set_font(fLevels);

draw_set_halign(fa_left);
draw_text(cx + w/2 + 2, cy+30, string(levelsPending));
}

if (levelsPending > 0 && !leveling) {
	draw_text(540, 732, "Press TAB to LEVEL UP");
}
draw_set_color(c_white);
draw_set_font(fLevels);
draw_set_alpha(1);

draw_text(uiX, uiY + 1*16, "Fate"+string(global.playerFate)); 
draw_text(uiX, uiY + 2*16, "Life"+string(global.playerLife));
draw_text(uiX, uiY + 3*16, "Reality"+string(global.playerReality));
draw_text(uiX, uiY + 4*16, "Thought" + string(global.playerThought)); 
draw_text(uiX, uiY + 5*16, "Time"+string(global.playerTime));
draw_text(uiX, uiY + 6*16, "Essence"+string(global.playerEssence));
draw_text (uiX, uiY + 11*16, "OverHealth Timer"+string (overhealthTimer));
draw_text (uiX, uiY + 12*16, "Damage"+string (global.playerDamage));
draw_text(uiX, uiY + 13*16,"Speed: " + string_format(point_distance(0,0,oTruePlayer.hsp,oTruePlayer.vsp), 1, 2));
draw_text (uiX, uiY + 14*16, "Cooldown Rate (Per Frame)"+string (cooldownRate));
draw_text (uiX, uiY + 15*16, "thought cooldown bonus"+string (trackDodgeThoughtTimer));
