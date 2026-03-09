function pathfind(_grid, _target, _speed, _inst) {

    if (!instance_exists(_target) || !instance_exists(_inst)) return false;

    searchPlayer();

    with (_inst) {
		path_end()
	}

    if (_inst.path != -1 && path_exists(_inst.path)) {
        path_delete(_inst.path);
    }

    _inst.path = path_add();

    if (mp_grid_path(_grid, _inst.path, _inst.x, _inst.y, _target.x, _target.y, true)) {
        path_start(_inst.path, _speed, path_action_stop, false);
        return true;
    }

    return false;
}
