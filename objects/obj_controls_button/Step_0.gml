if (position_meeting(mouse_x,mouse_y,self)){
	image_index = 1;
	if (mouse_check_button(mb_left)){
		audio_play_sound(snd_button,1,false);
		room_goto(rm_controls);
	}
}
else{
	image_index = 0;
}