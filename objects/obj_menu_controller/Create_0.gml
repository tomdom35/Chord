base_width = room_width;
base_height = room_height;
_width = base_width;
_height = base_height;

/*show_debug_message("test2")
depth = -100
loading = false

max_size = 15
size = 4

difficulty = 5

size_dropdown_x = (room_width/2)
size_dropdown_y = 200

diff_dropdown_x = (room_width/2)
diff_dropdown_y = 300

buttons_x = room_width/2
buttons_y = 500
buttons_y_inc = 130

var size_dropdown = instance_create_depth(size_dropdown_x, size_dropdown_y, 0, obj_button_dropdown)
size_dropdown.active = true
size_dropdown.num = 4
size_dropdown._type = "size"
size_dropdown._start = 4
size_dropdown._end = max_size+1
size_dropdown.x_pos = size_dropdown_x
size_dropdown.y_pos = size_dropdown_y

var difficulty_dropdown = instance_create_depth(diff_dropdown_x, diff_dropdown_y, 1, obj_button_dropdown)
difficulty_dropdown.active = true
difficulty_dropdown.num = 5
difficulty_dropdown._type = "diff"
difficulty_dropdown._start = 1
difficulty_dropdown._end = 6
difficulty_dropdown.x_pos = diff_dropdown_x
difficulty_dropdown.y_pos = diff_dropdown_y

dropdown_open = false
active_dropdown_type = ""

instance_create_depth(buttons_x,buttons_y,2,obj_start_button)
instance_create_depth(buttons_x,buttons_y + buttons_y_inc,2,obj_how_to_button)
instance_create_depth(buttons_x,buttons_y + buttons_y_inc*2,2,obj_tutorial_button)


