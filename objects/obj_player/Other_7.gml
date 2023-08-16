//if state == "attack one" or state == "duck" or state == "roll" or state == "attack two" or state == "speed attack" or state == "crouch attack" or state == "strong attack" or state == "attack one triple"{
//	state = "move";
	
//	image_index = 0;
//}

if state == "lose"{
//	obj_fight_particles.win = true;
	//show_message(sprite_index)
	global.zoro_points -= subtract_point;
	//if (global.rounds == 0){
	//	global.round_one_winner = player_name
	//}
	//if (global.rounds == 1){
	//	global.round_two_winner = player_name
	//}
	//if (global.rounds == 2){
	//	global.round_three_winner = player_name
	//}
	global.rounds +=1;
	
	room_goto(rm_rounds)
}