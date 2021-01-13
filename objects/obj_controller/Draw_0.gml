//draw_set_color($303030)
//draw_rectangle(0,room_height/2,room_width,room_height,false)
draw_set_color(c_white)
draw_circle_width(room_width/2,room_height/2,radius,thickness,64)

for(var i = 0; i < size*2; i++){
	var _x = marks_location[i][0]
	var _y = marks_location[i][1]
	draw_sprite_ext(spr_dot,0,_x,_y,.75,.75,0,c_white,1)
}
for(var i = 0; i < size; i++){
	var marks_index1 = connections[i][0]
	var marks_index2 = connections[i][1]
	var x1 = marks_location[marks_index1][0]
	var y1 = marks_location[marks_index1][1]
	var x2 = marks_location[marks_index2][0]
	var y2 = marks_location[marks_index2][1]
	draw_line_width(x1,y1,x2,y2,thickness-1)
}

draw_set_font(fnt_game_text)
draw_text(room_width-100,34,"Visuals:")
draw_text(room_width-100,80,"Mobile:")