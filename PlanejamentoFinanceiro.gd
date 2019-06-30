extends VBoxContainer

var max_value = 130000
var remaining_value = 0
var sliders = []
var ammount_of_weights_to_be_randomly_distributed = 5


func _ready():
	remaining_value = max_value
	get_node("Label").text = "Orçamento: R$"+str(max_value)
	set_remaining_value(remaining_value)

func start(categories_list):
	Global.categories = get_prioridades(categories_list)
	create_sliders(Global.categories)

func get_prioridades(categories_list):
	var base_priorities = get_reset_priorities(categories_list)
	return set_priorities_weights(base_priorities, ammount_of_weights_to_be_randomly_distributed)
	
func create_sliders(categories_list):
	for temp_category in categories_list:
		var temp_slider = load("res://PlanejamentoFinanceiroSlider.tscn").instance()
		get_node("Container").add_child(temp_slider)
		temp_slider.set_slider(temp_category)
		temp_slider.set_max_value(max_value)
		sliders.append(temp_slider)

func set_remaining_value(value):
	get_node("Label2").text = "Orçamento restante: R$"+str(value)
	remaining_value = value

func _process(delta):
	var total_value = 0
	for slider in sliders:
		total_value += slider.get_slider_value()
	set_remaining_value(max_value - total_value)

func can_change_scene():
	if remaining_value < 0:
		return false
	return true
	
func get_reset_priorities(categories_list):
	var priorities = []
	for category in categories_list:
		var temp_category = {}
		temp_category.key = category
		temp_category.value = 1
		priorities.append(temp_category)
	return priorities	
	
func set_priorities_weights(base_priorities, ammount_of_weights):
	var weighted_priorities = {}
	while ammount_of_weights > 0:
		var index = Global.get_random(base_priorities.size())
		var temp_priority = base_priorities[index]
		if temp_priority.value <3:
			temp_priority.value = temp_priority.value+1
			ammount_of_weights = ammount_of_weights -1
	return base_priorities
