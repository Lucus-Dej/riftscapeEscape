function callDOT(_target, _damage, _ticks, _delay, _type, _source){
	if (!instance_exists(_target)) return;
	var darr = oDOTManager.dotArray;
	for (var i = array_length(darr) - 1; i >= 0; i--) {
		var dotCheck = darr[i];
		if (dotCheck.target == _target && dotCheck.type == _type && _source == dotCheck.source)  {
			dotCheck.ticks = _ticks;
			darr[i] = dotCheck;
			return;
		}
	}
	var dot = {
		target: _target,
		damage: _damage,
		ticks: _ticks, 
		time: 0,
		delay: _delay,
		type: _type,
		source: _source
	}
	array_push(darr, dot);
	
	
}