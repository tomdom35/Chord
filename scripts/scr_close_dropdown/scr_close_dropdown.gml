function scr_close_dropdown(){
	with(obj_button_dropdown){
		if(!active){
			instance_destroy()	
		}
	}
	obj_menu_controller.dropdown_open = false
	obj_menu_controller.active_dropdown_type = ""
}