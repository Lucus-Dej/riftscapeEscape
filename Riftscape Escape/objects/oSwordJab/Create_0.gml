audio_play_sound_at(aPortalOpen, x, y, 0, 0, 0, 0, 0, 2, global.sfxAudio);
//image_angle =  point_direction(oTruePlayer.x, oTruePlayer.y, mouse_x, mouse_y);

var dir = oPlayer.image_angle;
image_angle = dir - 90;
damagedList = ds_map_create();
currentJabRadius = 0;
maxJabRadius = 48;
flipped = false;
increaseRate = 4;

damage = (global.playerDamage + oPlayerManager.swordDmgBonus + sqrt(global.playerEssence) * 0.45)*0.1;
