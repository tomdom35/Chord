if(!obj_controller.solved){
	with(obj_number){
		if(editable){
			num = ""
		}
	}
	array_copy(obj_controller.progress[0],0,obj_controller.start_progress[0],0,obj_controller.size)
	array_copy(obj_controller.progress[1],0,obj_controller.start_progress[1],0,obj_controller.size)
}