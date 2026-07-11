// the "health" system
if (uiHealth <= 100 && !inOverhealth) {
	if (instance_exists(overheatBar)){
		instance_destroy(overheatBar);
	}
	draw_healthbar(16, 16, 348, 32, uiHealth, c_dkgrey, c_red, c_red, 0, true, true);
} else if (!overHealthOverheated && !hasOverhealthRune) {
	draw_healthbar(16, 16, 348, 32, overhealthTimer, c_red, c_red, c_aqua, 0, true, true);
	if (!global.inCombat && overhealthTimer > 75) {
		overhealthTimer -= 0.1;
	} else {
		if (oItemManager.hasPetrifiedHeart) {
			overhealthTimer-= 2;
		}
		overhealthTimer -= 0.5;
	} 
	global.player_health = max_hp;
	inOverhealth = true;
	if (overhealthTimer < 0) {
		overhealthTimer = overhealthCooldown;
		dodgeLifeBonus = 0;
		
		overhealthCooldownUI = (overhealthSuperTimer/overhealthSuperTotal)*100;
		inOverhealth = false;
		overHealthOverheated = true;
		overhealthFlag = true;
		overHealthSpeedBonus = 0;
		overHealthBulletDelay = 0;
		overHealthDamageBuff = 0;
		if (oItemManager.hasPetrifiedHeart) {
			for (var i = 0; i < 360; i += 30) {
				playerBulletFire(oTruePlayer.x, oTruePlayer.y, i, global.bullet_speed, global.playerDamage*0.4, global.chosenBullet, oTruePlayer);
			}
		}
	}
} else overheatBar = draw_healthbar(16, 16, 348, 32, 100, c_blue, c_black, c_red, 0, true, true);

if (dodgeLifeBonus > 0) {
	draw_healthbar(16, 16, 348, 32, (dodgeLifeBonus/dodgeLifeHP)*100, c_black, c_green, c_green, 0, true, true);
}

if (overHealthOverheated) {
	overHealthCooldownBuff = 0;
	if (oItemManager.hasPetrifiedHeart) {
		overhealthSuperTimer -= 4.5;
	}
	overhealthSuperTimer--;
	overhealthCooldownUI = (overhealthSuperTimer/overhealthSuperTotal)*100;
	draw_healthbar(16, 48, 300, 32, overhealthCooldownUI, c_yellow, c_black, c_orange, 0, true, true);
	if (overhealthSuperTimer < 0) {
		overhealthSuperTimer = overhealthSuperCooldown;
		overHealthOverheated = false;
	}
}
abilityActive[0] = initate_sword;
abilityActive[1] = initDodge;
abilityActive[2] = initCrystal;
abilityActive[3] = initCircle;
abilityActive[4] = initHusk;

abilityCharge[0] = sword_charge;
abilityCharge[1] = dodgeCharge;
abilityCharge[2] = crystalCharge;
abilityCharge[3] = circleCharge;
abilityCharge[4] = huskCharge;
// abilities

var startY = 112;
var startX = 32;
for (var i = 0; i < array_length(abilityActive); i++) {
	draw_set_color(c_white);
	draw_set_font(fLevels);
	if (!abilityActive[i]) continue;
	
	var barY1 = startY + spacing * i;
	var barY2 = barY1 + 8;
	var iconX = startX - 6;
	var iconY = barY1 - 8;
	
	if (abilityCharge[i] < 100) {
		draw_healthbar(startX, barY1, 280, barY2, abilityCharge[i], c_white, c_black, abilityColor[i], 0, true, true);
		if (inDodge && dodgeBlackFlashCheck && dodgeBlackFlashTimer > 0) {
			draw_healthbar(startX, (startY + spacing), 280, (startY + 8 + spacing), dodgeBlackFlashTimer, c_white, c_black, c_black, 0, true, true);
		}
		draw_sprite_ext(sCircleMenu, spriteCharging[i], iconX, iconY, 0.2, 0.2, 0, c_white, 1);

	} else {
		draw_sprite_ext(sCircleMenu, spriteReady[i], iconX, iconY, 0.2, 0.2, 0, c_white, 1);
		draw_text(startX+32, barY1, "Press "+string(abilityKey[i])); 
	}
}

if (!inLevelMenu) {
	draw_set_color(c_white);
	draw_set_font(fLevels);
	
	var guiW = display_get_gui_width();
	var barW = 324;
	var barH = 8;
	
	var x1 = guiW * 0.5 - barW * 0.5;
	var x2 = guiW * 0.5 + barW * 0.5;
	
	var y1 = 16;
	var y2 = y1 + barH;
	
	draw_healthbar(x1, y1, x2, y2, xpUI, c_white, c_yellow, c_yellow, 0, true, true);
	var levelTxt = "Level: " + string(xpLevel);
	var levelStrLength = string_width(levelTxt);
	draw_text(guiW * 0.5-(levelStrLength)/2, 32, levelTxt);
}
if (inLevelMenu) {
	draw_set_font(fLevels);
	draw_set_color(c_white);

var cx = display_get_gui_width() / 2;
var cy = 32;
draw_set_color(c_white);
var label = "Levels Pending:"
draw_set_halign(fa_center);

var w = string_width(label);
draw_set_font(fLevels);

draw_set_halign(fa_left);
draw_text(cx + w/2 + 2, cy+20, string(levelsPending));
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

//draw_text (uiX, uiY + 11*16, "OverHealth Timer"+string (overhealthTimer));
draw_text (uiX, uiY + 8*16, "Damage"+string (global.playerDamage));
draw_text(uiX, uiY + 9*16,"Item Luck: " + string(oItemManager.luckBonus + oItemManager.reflectiveGemLuckBonus));
draw_text(uiX, uiY + 10*16,"XP Multiplier: " + string(xpMult));
//draw_text (uiX, uiY + 14*16, "Cooldown Rate (Per Frame)"+string (cooldownRate+1));
//draw_text (uiX, uiY + 15*16, "thought cooldown bonus"+string (trackDodgeThoughtTimer));
//draw_text (uiX, uiY + 16*16, "health"+string (max_hp));
//draw_text (uiX, uiY + 17*16, "health"+string (global.player_health));

if (array_length(activeRuneArray) > 0) {
	var guiW = display_get_gui_width();
	var guiH = display_get_gui_height();

	var mouseX = device_mouse_x_to_gui(0);
	var mouseY = device_mouse_y_to_gui(0);

	var hoveredItem = noone;

	var cols = 6;
	var iconSize = 16;   
	var pad = 12;
	var cell = iconSize + pad;
	startX = 480-112;
	startY = 23;
	for (var i = 0; i < array_length(activeRuneArray); i++) {
	    var obj = activeRuneArray[i];
		//show_debug_message(obj)
		var spr = object_get_sprite(obj);
		if (spr == -1) continue;

	    var col = i mod cols;
	    var row = i div cols;

	    var GUIx = startX + col * cell;
	    var GUIy = startY + row * cell;


	    var scale = 0.5;

		draw_sprite_ext(spr, 0, floor(GUIx), floor(GUIy), scale, scale, 0, c_white, 0.5);
	
		var w = sprite_get_width(spr) * scale;
		var h = sprite_get_height(spr) * scale;
	
		if (mouseX >= GUIx - w * 0.5 && mouseX <= GUIx + w * 0.5 && mouseY >= GUIy - h * 0.5 && mouseY <= GUIy + h * 0.5) {
			hoveredItem = obj;
		}
	}
	if (hoveredItem != noone) {
		//show_debug_message(hoveredItem)
		runeTxt = getRuneDesc(hoveredItem);
		displayRuneDuration = 60;
	}
}
if (displayRuneDuration > 0) {
	var alpha = min(displayRuneDuration / 20, 1);
	var guiW = display_get_gui_width();
	var guiH = display_get_gui_height();
	
	var txtW = string_width(runeTxt);
	var txtH = string_height(runeTxt)
	
	var xPos = guiW * 0.5;
	var yPos = guiH * 0.8;
	var pad = 64;
	var sprW = sprite_get_width(sItemDescription);
	
	var xScale = (txtW+pad)/sprW;
	
	draw_sprite_ext(sItemDescription, 0, display_get_gui_width()*0.5, display_get_gui_height()*0.8, xScale, 1.5, 0, c_white, alpha);
	draw_set_colour(c_white);
	draw_text((guiW*0.5)-txtW/2, (guiH*0.8)-pad/2+8, runeTxt);
	displayRuneDuration--;
}
