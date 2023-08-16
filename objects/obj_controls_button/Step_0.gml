if (position_meeting(mouse_x,mouse_y,self)){
	image_index = 1;
	if (mouse_check_button(mb_left)){
		room_goto(rm_controls);
	}
}
else{
	image_index = 0;
}