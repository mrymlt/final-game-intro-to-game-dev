image_speed = 0.05

if (global.zoro_points == 3 || global.zoro_points == 2){
	draw_sprite(spr_end_zoro,image_index,0,0)
}
else{
	draw_sprite(spr_end_sanji,image_index,0,0)
}

show_debug_message( global.sanji_points)
show_debug_message( global.zoro_points )

