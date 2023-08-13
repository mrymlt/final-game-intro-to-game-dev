//if state == "attack one" or state == "duck" or state == "roll" or state == "attack two" or state == "speed attack" or state == "crouch attack" or state == "strong attack" or state == "attack one triple"{
//	state = "move";
	
//	image_index = 0;
//}

if state == "lose"{
//	obj_fight_particles.win = true;
	global.rounds +=1;
	room_restart();
}