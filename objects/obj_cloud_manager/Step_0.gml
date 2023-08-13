if (instance_number(obj_clouds) <= 1){
	instance_create_layer(-room_width,0,"bg_cloud",obj_clouds);
	
	//show_debug_message(cloud.x)
	//with(cloud){
	//	x += 10;

	//	if (x >= room_width - (room_width/2)){
	//		create_cloud = true;
		
	//	}
	//	if (x >= room_width ){
	//		instance_destroy(self);
	//	}
	//}
}

if (create_cloud && instance_number(obj_clouds) <= 2){
	instance_create_layer(-room_width,0,"bg_cloud",obj_clouds);
	create_cloud = false;
}