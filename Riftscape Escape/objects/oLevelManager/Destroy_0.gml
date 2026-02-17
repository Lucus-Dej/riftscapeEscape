for (var i = 0; i < array_length(buttons); i++) {
    if (instance_exists(buttons[i])) {
        with (buttons[i]) instance_destroy();
    }
}
