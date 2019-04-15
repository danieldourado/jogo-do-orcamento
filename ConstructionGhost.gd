extends TextureButton

var new_building = null;

func _ready():
	pass # Replace with function body.
	
func _process(delta):
	var position = get_viewport().get_mouse_position()
	rect_position.x = position.x
	rect_position.y = position.y
		
			
func _pressed():
	new_building = load("res://Construction.tscn").instance()
	get_node("/root").add_child(new_building)
	var position = get_viewport().get_mouse_position()
	new_building.rect_position.x = position.x
	new_building.rect_position.y = position.y
	get_node("/root").remove_child(self)