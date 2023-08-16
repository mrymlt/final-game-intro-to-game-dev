if (global.rounds >= rounds_limit && (rounds)){
	room_goto(rm_endscreen);
	rounds = false
}

if (global.rounds == 0 && global.zoro_points == 3){
		global.zoro_round_one = false;

}
 