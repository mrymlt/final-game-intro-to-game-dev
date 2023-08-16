draw_set_font(fnt_one)
draw_set_halign(fa_center)

draw_text_colour(room_width/2, 50, "Round",c_black,c_black,c_black,c_black,1);
draw_text_colour(room_width/2, 120, string(global.rounds + 1) + "/3",c_black,c_black,c_black,c_black,1)

if (global.round_one_winner == "sanji"){
	draw_sprite(spr_san_point,-1,(room_width/2) - 150,170);
}
if (global.round_one_winner == "zoro"){
	draw_sprite(spr_zor_point,-1,(room_width/2) - 150,170);
}
if (global.round_two_winner == "sanji"){
	draw_sprite(spr_san_point,-1,room_width/2,170);
}
if (global.round_two_winner == "zoro"){
	draw_sprite(spr_zor_point,-1,room_width/2,170);
}