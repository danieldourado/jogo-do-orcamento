extends VBoxContainer

var max_value = 100000
var remaining_value = 0
var sliders = []
# Called when the node enters the scene tree for the first time.
func _ready():
	remaining_value = max_value
	get_node("Label").text = "Orçamento: R$"+str(max_value)
	set_remaining_value(remaining_value)
	var slider_names = load("res://Main.tscn").instance().get_categories()
	create_sliders(slider_names)

func create_sliders(slider_names):
	for slider_name in slider_names:
		var temp_slider = load("res://PlanejamentoFinanceiroSlider.tscn").instance()
		add_child(temp_slider)
		temp_slider.change_label_name(slider_name)
		temp_slider.set_max_value(max_value)
		sliders.append(temp_slider)

func set_remaining_value(value):
	get_node("Label2").text = "Orçamento restante: R$"+str(value)

func _process(delta):
	var total_value = 0
	for slider in sliders:
		total_value += slider.get_slider_value()
	set_remaining_value(max_value - total_value)
