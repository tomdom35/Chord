if(room == rm_how_to || !obj_controller.solved){
	instance_destroy(obj_checkbox)
	room_goto(rm_main_menu)
}