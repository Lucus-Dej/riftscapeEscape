draw_self();
if (Manager1 != noone)
draw_text(x, y+96, Manager1.combatFinished)
if (Manager2 != noone)
draw_line(x, y, Manager2.x, Manager2.y)
//collision_rectangle(x+64, y+64, x-64, y-64, oGhostBarrierDirectionalParent, false, true);