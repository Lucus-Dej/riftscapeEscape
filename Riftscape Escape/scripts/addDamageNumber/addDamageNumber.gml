function addDamageNumber(_x, _y, _amount) {
	array_push(global.damageNumbers, {
		x : _x,
		y : _y,
		damage : _amount,
		life : 60,
		maxLife : 60,
		velY : -0.6,
		color : c_white
	});
}
function drawOutline(_x, _y, _txt, _textCol, _outlineCol) {
	draw_set_colour(_outlineCol);

	draw_text(_x - 1, _y, _txt);
	draw_text(_x + 1, _y, _txt);
	draw_text(_x, _y - 1, _txt);
	draw_text(_x, _y + 1, _txt);

	draw_set_colour(_textCol);
	draw_text(_x, _y, _txt);
}