extends VBoxContainer

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var slider_names = ['Saúde','Segurança','Educação','Mobilidade','Lazer']
var sliders = []
# Called when the node enters the scene tree for the first time.
func _ready():
	create_sliders(slider_names)

func create_sliders(slider_names):
	for slider_name in slider_names:
		var temp_slider = load("res://PlanejamentoFinanceiroSlider.tscn").instance()
		temp_slider.change_label_name(slider_name)
		sliders.append(temp_slider)
		add_child(temp_slider)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
