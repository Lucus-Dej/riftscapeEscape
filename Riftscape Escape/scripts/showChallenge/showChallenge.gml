function showChallenge (_challenge) {
	var key = _challenge;
	var challenge = global.metaChallengeArray.challenges[$ key];
	show_debug_message(key)
	show_debug_message(challenge)
	var desc = challenge.desc;
	var title = challenge.title;
	show_debug_message(desc)
	show_debug_message(title)
	var guiW = display_get_gui_width();
    var guiH = display_get_gui_height();
	var box = instance_create_layer(guiW * 0.5, guiH * 0.28, "Instances", oChallengeRevealTextbox, 
		{drawText: title, drawDesc: desc})
}