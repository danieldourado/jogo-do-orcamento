extends VBoxContainer

func _ready():
	pass

func change_label_name(labelName):
	get_node("HBoxContainer/Label").text = labelName+":"

func set_max_value(value):
	var hslider = get_node("HSlider")
	hslider.max_value = value
	hslider.step = value/100

func _process(delta):
	var label_text = str(get_node("HSlider").value)
	get_node("HBoxContainer/Label2").text = label_text
	
func get_slider_value():
	return get_node("HSlider").value