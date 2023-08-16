timer ++;

if timer > duration_time{
	timer = 0;
	room_restart();
	room_goto(rm_fighting);
}