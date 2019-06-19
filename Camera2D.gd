extends Camera2D

var relocate_camera = false
var initial_mouse_position = null
var initial_position

func _ready():
	get_node("/root/Node2D/Button").connect("button_down", self, "relocate_camera")
	get_node("/root/Node2D/Button").connect("button_up", self, "stop_relocate_camera")
	

func _input(event):
    # Wheel Up Event
    if event.is_action_pressed("zoom_in"):
        print("zoom in")
        _zoom_camera(-1)
    # Wheel Down Event
    elif event.is_action_pressed("zoom_out"):
        print("zoom out")
        _zoom_camera(1)

# Zoom Camera
func _zoom_camera(dir):
    zoom += Vector2(0.1, 0.1) * dir

func _process(delta):
	if relocate_camera:
		var current_location = get_viewport().get_mouse_position()
		position = initial_position +(initial_mouse_position - current_location)
		

func relocate_camera():
	relocate_camera = true
	initial_mouse_position = get_viewport().get_mouse_position()
	initial_position = position
	
func stop_relocate_camera():
	relocate_camera = false	