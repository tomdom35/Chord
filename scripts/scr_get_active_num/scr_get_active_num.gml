// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_get_active_num(){
	var active_num = ""
	with(obj_number){
		if(editable and active){
				active_num = num
		}
	}
	
	return active_num
}