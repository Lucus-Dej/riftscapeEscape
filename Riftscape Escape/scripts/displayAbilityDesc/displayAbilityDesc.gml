function displayAbilityDesc(_ability, _upgrade){
	var desc = "";
	switch (_ability) {
		case (1):
		// circle upgrades
		switch (_upgrade) {
			case (0): 
			desc = "A Circle That Slows Enemies And Their Bullets";
			break;
			case (2):
			// life upgrade
			desc = "Expanded Radius";
			break;
			case (1):
			// null
			desc = "";
			break;
			case (3):
			desc = "Fire Additional Child Bullets While Inside";
			break;
			case (4):
			desc = "Faster Ability Charge Rate While Inside Circle";
			break;
			case (5):
			desc = "Double Crit Chance While Inside";
			break;
			case (6):
			desc = "Kills Extend Duration";
			break;
		}
		break;
		case (2):
		// minion upgrades
		switch (_upgrade) {
			case (0): 
			desc = "A Minion That Follows And Mimics You";
			break;
			case (1):
			desc = "Minions Inherit Your Bullet Effects";
			break;
			case (2):
			desc = "";
			break;
			case (3):
			desc = "Minions Follow Much Closer";
			break;
			case (4):
			desc = "Minions Automatically Fire At Closest Enemies";
			break;
			case (5):
			desc = "Gain Second Minion";
			break;
			case (6):
			desc = "On Kill, Enemy Joins Your Ranks";
			break;
		}
		break;
		case (3):
		// dodge upgrades
		switch (_upgrade) {
			case (0): 
			desc = "Briefly Dodge Forward While Avoiding Damage";
			break;
			case (1):
			desc = "Pull Enemies When Dodging";
			break;
			case (2):
			desc = "Gain Temporary HP On Dodge";
			break;
			case (3):
			desc = "null";
			break;
			case (4):
			desc = "Dodging Into Blood Grants Bonus Cooldown";
			break;
			case (5):
			desc = "Grants A Special Dodge If Timed Correctly";
			break;
			case (6):
			desc = "Drop Blood That Damages Enemy When Dodging";
			break;
		}
		break;
		case (4):
		// husk upgrades
		switch (_upgrade) {
			case (0): 
			desc = "Place A Husk. Use Again To Teleport Back";
			break;
			case (1):
			desc = "Husk Fires Bullets At Nearby Enemies";
			break;
			case (2):
			desc = "On The Husk's Death, Spawn A Second Husk";
			break;
			case (3):
			desc = "Grant Extreme Movement Buff On Husk Death";
			break;
			case (4):
			desc = "";
			break;
			case (5):
			desc = "Teleporting To Husk No Longer Destroys It";
			break;
			case (6):
			desc = "Kills Extend Duration Of Husk";
			break;
		}
		break;
		case (5):
		// bomb upgrades
		switch (_upgrade) {
			case (0): 
			desc = "Place A Bomb That Deals Extreme Damage";
			break;
			case (1):
			desc = "On Explosion, Spawn Smaller Cluster Bombs";
			break;
			case (2):
			desc = "On Explosion, Spawn Slowing Field";
			break;
			case (3):
			desc = "On Explosion, Fire Mini Bombs In All Directions";
			break;
			case (4):
			desc = "Bombs Chase The Nearest Enemy";
			break;
			case (5):
			desc = "";
			break;
			case (6):
			desc = "On Bomb Kill, Spawn A Blood Bomb That Heals";
			break;
		}
		break;
		case (6):
		// sword upgrades
		switch (_upgrade) {
			case (0): 
			desc = "A Sword. Every Kill Makes It Stronger";
			break;
			case (1):
			desc = "Summon Orbiting Swords On Swing";
			break;
			case (2):
			desc = "Fire A Sword Projectile That Deals Poison Damage";
			break;
			case (3):
			desc = "Destroying Bullets Grants Speed Bonus";
			break;
			case (4):
			desc = "Killing An Enemy Reduces Its Cooldown";
			break;
			case (5):
			desc = "Parry Bullets Instead Of Destroying Them";
			break;
			case (6):
			desc = "";
			break;
		}
		break;
		
	}
	//show_debug_message(_ability);
	//show_debug_message("break")
	//show_debug_message(_upgrade)
	return desc;
}