function scr_get_difficulty(){
	if(obj_menu_controller.difficulty == 5) return 4
	if(obj_menu_controller.difficulty == 4) return 0
	if(obj_menu_controller.difficulty == 3) return 1
	if(obj_menu_controller.difficulty == 2) return 2
	if(obj_menu_controller.difficulty == 1) return 3
}