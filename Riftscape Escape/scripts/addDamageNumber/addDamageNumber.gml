function addDamageNumber(_x, _y, _amount, _col = c_white, _additionalStart = "", _useGUI = false, _ID = -1, _additionalEnd = "") {
	var combineDistance = 96;
	
	for (var i = 0; i < array_length(global.damageNumbers); i++) {
		var d = global.damageNumbers[i];
		if (d.doGUI != _useGUI) continue;
		if (d.color != _col) continue;
		if (d.ID != _ID) continue;
		
		
		
		if (point_distance(_x, _y, d.x, d.y) <= combineDistance) {
			d.damage += _amount;
			d.life = d.maxLife;
			d.x = (_x + d.x) * 0.5;
			d.y = (_y + d.y) * 0.5;
			
			return;
		}
		
	}
	
	array_push(global.damageNumbers, {
		x : _x,
		y : _y,
		z : 32,
		damage : _amount,
		life : 60,
		maxLife : 60,
		velY : -0.6,
		color : _col,
		doGUI: _useGUI,
		add: _additionalStart,
		addEnd: _additionalEnd,
		ID: _ID
	});
}
function drawOutline(_x, _y, _txt, _textCol, _outlineCol, _outlineSize = 1) {
	draw_set_colour(_outlineCol);

	draw_text(_x - _outlineSize, _y, _txt);
	draw_text(_x + _outlineSize, _y, _txt);
	draw_text(_x, _y - _outlineSize, _txt);
	draw_text(_x, _y + _outlineSize, _txt);

	draw_set_colour(_textCol);
	draw_text(_x, _y, _txt);
}