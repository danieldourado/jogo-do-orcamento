extends Camera2D

var relocate_camera = false
var initial_mouse_position = null
var initial_position
export var zoom_factor = 1
export var zoom_ease_time = 0.5
export var move_multiplier = 2
var current_tween
var zoom_to

func _ready():
	var root = get_parent()
	print(root.name)
	get_parent().get_node("Button").connect("button_down", self, "relocate_camera")
	get_parent().get_node("Button").connect("button_up", self, "stop_relocate_camera")
	zoom_to = zoom

func _input(event):
    # Wheel Up Event
    if event.is_action_pressed("zoom_in"):
        print("zoom in")
        _zoom_camera(-zoom_factor)
    # Wheel Down Event
    elif event.is_action_pressed("zoom_out"):
        print("zoom out")
        _zoom_camera(zoom_factor)

# Zoom Camera
func _zoom_camera(dir):
	zoom_to = zoom_to + Vector2(0.1, 0.1) * dir
	var zoom_clamped = clamp(zoom_to.x, 1.0, 4.0)
	zoom_to = Vector2(zoom_clamped, zoom_clamped)
	current_tween = animate_to(self, "zoom", zoom_to, zoom_ease_time)

func _process(delta):
	if relocate_camera:
		var current_location = get_viewport().get_mouse_position()
		position  = initial_position +((initial_mouse_position - current_location)*move_multiplier)
		

func relocate_camera():
	relocate_camera = true
	initial_mouse_position = get_viewport().get_mouse_position()
	initial_position = position
	
func stop_relocate_camera():
	relocate_camera = false
	
func animate_to(nodeOrPath, prop, to, length = 0.5, easing = 2):
	if current_tween: 
		current_tween.stop_all()
	var node = nodeOrPath
	var tween = Tween.new()
	node.add_child(tween)
	tween.targeting_property(node, prop, node, prop, to, length, tween.TRANS_SINE, easing)
	tween.start()
	return tween