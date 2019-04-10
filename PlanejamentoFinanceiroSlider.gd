extends VBoxContainer

var label = null;
# Called when the node enters the scene tree for the first time.
func _ready():
	label = get_node("HBoxContainer/Label")
	label.text = "daniel"

func change_label_name(labelName):
	label.text = labelName

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
