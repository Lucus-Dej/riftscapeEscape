function checkChallenge(_challenge){
	if (!variable_struct_exists(global.meta, _challenge)) {
		variable_struct_set(global.meta.challenges, _challenge, false);
	}
}