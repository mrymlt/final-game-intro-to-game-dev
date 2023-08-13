x += 2;

if (x >= room_width/2){
		obj_cloud_manager.create_cloud = true;	
}

if (x >= room_width){
	instance_destroy(self);
}
	