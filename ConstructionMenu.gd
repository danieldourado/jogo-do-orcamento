extends HBoxContainer

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export(Array, PackedScene) var construction_buttons

var container;

# Called when the node enters the scene tree for the first time.
func _ready():
	for construction_button in construction_buttons:
		add_child(construction_button.instance())
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
