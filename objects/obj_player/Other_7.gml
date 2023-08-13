if state == "attack one" or state == "duck" or state == "roll" or state == "attack two" or state == "speed attack" or state == "crouch attack" or state == "strong attack" or state == "attack one triple"{
	state = "move";
	obj_triple_combo.visible = false;
	obj_combo.visible = false;
	image_index = 0;
}

if state == "lose"{
//	obj_fight_particles.win = true;
	global.rounds +=1;
	room_restart();
}