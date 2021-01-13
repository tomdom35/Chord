function scr_get_connection(index1,index2){
	for(var i = 0; i < array_length(obj_controller.progress[0]); i++){
		if(index1 == 0){
			if(obj_controller.grid[i][index2] == 1){
				return [1,i]
			}
		}
		else{
			if(obj_controller.grid[index2][i] == 1){
				return [0,i]
			}
		}
	}
}