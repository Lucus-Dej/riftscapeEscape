function pathfind(_grid, _target, _speed) {

    if (!instance_exists(_target)) return false;

    searchPlayer();

    path_end();

    if (path != -1 && path_exists(path)) {
        path_delete(path);
    }

    path = path_add();

    if (mp_grid_path(_grid, path, x, y, _target.x, _target.y, true)) {
        path_start(path, _speed, path_action_stop, false);
        return true;
    }

    return false;
}
