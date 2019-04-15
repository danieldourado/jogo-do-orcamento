extends TextureButton


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _pressed():
	var new_building = load("res://ConstructionGhost.tscn").instance()
	get_node("/root").add_child(new_building)