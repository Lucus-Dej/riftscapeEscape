var spr = noone;
dotDmg = 0;
dotTicks = 0;
dotTarget = oTruePlayer;
dotDelay = 24;
dotSource = self;
type = "";

inf = false;
switch (elementType) {
	case "fire":
	spr = sTurretDOTFire;
	dotDmg = 3;
	dotTicks = 8;
	dotDelay = 8;
	type = "fire";
	break;
	case "pos":
	spr = sTurretDOTPois
	dotDmg = 2;
	dotTicks = 10
	dotDelay = 28;
	type = "poison";
	break;
	case "ice":
	dotDmg = 2.5;
	dotTicks = 10;
	type = "ice";
	spr = sTurretDOTIce;
	break;
	case "null":
	spr = sTurretDOT;
	image_alpha = 0.3;
	break;
}
sprite_index = spr;
existTot = 40;
existence = existTot;