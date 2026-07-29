if (instance_exists(host)){
    var i = array_get_index(host.links, id);
    if (i != -1) {
		array_delete(host.links, i, 1);
	}
}

if (instance_exists(connector)) {
    var i = array_get_index(connector.links, id);
    if (i != -1) {
		array_delete(connector.links, i, 1);
	}
        
}